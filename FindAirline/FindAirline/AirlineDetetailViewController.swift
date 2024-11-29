import UIKit
import Kingfisher

class AirlineDetailViewController: UIViewController {
    @IBOutlet weak var airlineImageView: UIImageView!
    @IBOutlet weak var airlineNameLabel: UILabel!
    @IBOutlet weak var icaoLabel: UILabel!
    @IBOutlet weak var iataLabel: UILabel!
    @IBOutlet weak var fleetDescriptionLabel: UILabel!

    var airline: Airline?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }

    func configureView() {
        guard let airline = airline else { return }
        airlineNameLabel.text = airline.name
        icaoLabel.text = "ICAO: \(airline.icao)"
        iataLabel.text = "IATA: \(airline.iata)"
        fleetDescriptionLabel.text = "Fleet: \(formatFleetDescription(airline.fleet))"

        if let url = URL(string: airline.logoURL ?? "") {
            airlineImageView.kf.setImage(with: url)
        } else {
            airlineImageView.image = UIImage(named: "placeholder")
        }
    }
    func formatFleetDescription(_ fleet: Fleet) -> String {
        return """
        A20N: \(fleet.A20N ?? 0)
        A21N: \(fleet.A21N ?? 0) 
        A320: \(fleet.A320 ?? 0)
        A321: \(fleet.A321 ?? 0)
        B752: \(fleet.B752 ?? 0)
        B763: \(fleet.B763 ?? 0)
        E290: \(fleet.E290 ?? 0)
        B752: \(fleet.B752 ?? 0)
        Total: \(fleet.total ?? 0)
    """
    }
}
