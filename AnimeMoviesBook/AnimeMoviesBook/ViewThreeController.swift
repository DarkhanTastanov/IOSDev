import UIKit

class ViewThreeController: UIViewController {

    private var favoriteMovies: [Movie] = [
        Movie(
            title: "The Three-Body Problem",
            description: "A novel by Liu Cixin about Earth's encounter with an alien civilization and the complexities of orbital mechanics.",
            image: .three
        ),
        Movie(
            title: "Inception",
            description: "A skilled thief, who steals corporate secrets through dream-sharing technology, is offered a chance to have his criminal history erased.",
            image: .inception
        ),
        Movie(
            title: "Interstellar",
            description: "A team of explorers travels through a wormhole in space in an attempt to ensure humanity's survival.",
            image: .interstellar
        ),
        Movie(
            title: "Blade Runner 2049",
            description: "A young blade runner uncovers a long-buried secret that could plunge what's left of society into chaos.",
            image: .bladeRunner2049
        ),
        Movie(
            title: "The Matrix",
            description: "A computer hacker learns about the true nature of reality and his role in the war against its controllers.",
            image: .matrix
        ),
        Movie(
            title: "Arrival",
            description: "A linguist works with the military to communicate with alien lifeforms after twelve mysterious spacecraft appear around the world.",
            image: .arrival
        ),
        Movie(
            title: "Gravity",
            description: "Two astronauts work together to survive after an accident leaves them stranded in space.",
            image: .gravity
        ),
        Movie(
            title: "Contact",
            description: "Dr. Ellie Arroway, a SETI scientist, receives the first extraterrestrial radio signal ever detected.",
            image: .contact
        ),
        Movie(
            title: "Dune",
            description: "Paul Atreides, a young nobleman, travels to the most dangerous planet in the universe to ensure the future of his family and people.",
            image: .duneF
        ),
        Movie(
            title: "E.T. the Extra-Terrestrial",
            description: "A troubled child summons the courage to help a friendly alien escape Earth and return to his home world.",
            image: .et
        )
    ]


    @IBOutlet private weak var tableViewThree: UITableView!

    private var selectedMovie: Movie?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewThree.dataSource = self
        tableViewThree.delegate = self
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destVC = segue.destination as? ThirdViewController else {
            return
        }
        destVC.configureMovie(with: selectedMovie)
    }
}

extension ViewThreeController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedMovie = favoriteMovies[indexPath.row]
        performSegue(withIdentifier: "goToDetail", sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ViewThreeController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteMovies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "primaryCell", for: indexPath) as! PrimaryTableViewCell
        let currentModel = favoriteMovies[indexPath.row]
        cell.configureMovie(currentModel)
        return cell
    }
}
