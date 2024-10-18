import UIKit

struct Book {
    let title: String
    let description: String
}

class ViewController: UIViewController {

    let favouriteBooks: [Book] = [
        Book(title: "Three Body Problem", description: "A science fiction novel about first contact with an alien civilization."),
        Book(title: "1984", description: "A dystopian novel by George Orwell about a totalitarian regime."),
        Book(title: "Brave New World", description: "A dystopian novel by Aldous Huxley about a technologically advanced society."),
        Book(title: "Dune", description: "A science fiction novel by Frank Herbert, set on a desert planet."),
        Book(title: "Foundation", description: "A science fiction novel by Isaac Asimov about the fall of the Galactic Empire.")
    ]

    @IBOutlet private weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favouriteBooks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell", for: indexPath) as! BookCell
        let book = favouriteBooks[indexPath.row]

        cell.configure(with: book)

        return cell
    }
}
