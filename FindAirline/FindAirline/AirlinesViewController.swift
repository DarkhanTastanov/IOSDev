import UIKit
import Kingfisher

class AirlinesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, AirlineManagerDelegate {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!

    var airlines: [Airline] = []
    var filteredAirlines: [Airline] = []
    var airlineManager = AirlineManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self

        airlineManager.delegate = self
        fetchAirlines()
    }

    func fetchAirlines() {
        airlineManager.fetchAirlines { [weak self] fetchedAirlines in
            guard let self = self else { return }
            if let airlines = fetchedAirlines {
                self.airlines = airlines
                self.filteredAirlines = airlines
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }

    func onHeroDidFetch(_ airlines: [Airline]) {
        self.airlines = airlines
        self.filteredAirlines = airlines
        tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredAirlines.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AirlineCell", for: indexPath) as! AirlineCell
        let airline = filteredAirlines[indexPath.row]
        cell.configure(with: airline)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedAirline = filteredAirlines[indexPath.row]
        let detailVC = storyboard?.instantiateViewController(withIdentifier: "AirlineDetailViewController") as! AirlineDetailViewController
        detailVC.airline = selectedAirline
        navigationController?.pushViewController(detailVC, animated: true)
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            filteredAirlines = airlines
        } else {
            filteredAirlines = airlines.filter {
                $0.name.contains(searchText) ||
                $0.iata.contains(searchText) ||
                $0.icao.contains(searchText.lowercased())
            }
        }
        tableView.reloadData()
    }
}
