import UIKit

class ViewAnimeController: UIViewController {

    private var favoriteAnime: [Anime] = [
        Anime(
            title: "Attack on Titan",
            description: "In a world where humanity lives within massive walls to protect themselves from Titans, Eren Yeager joins the military to fight these monstrous beings.",
            image: .attackOnTitan
        ),
        Anime(
            title: "Naruto",
            description: "Follow Naruto Uzumaki, a young ninja with dreams of becoming the Hokage, the strongest and most respected leader of his village.",
            image: .naruto
        ),
        Anime(
            title: "My Hero Academia",
            description: "In a world where most of the population has superpowers, a powerless boy enrolls in a prestigious hero academy to become a hero.",
            image: .myHeroAcademia
        ),
        Anime(
            title: "Fullmetal Alchemist: Brotherhood",
            description: "Two brothers use alchemy in a dangerous quest to restore their bodies after a failed attempt to bring their mother back to life.",
            image: .fullMetalAlchemist
        ),
        Anime(
            title: "Death Note",
            description: "A high school student discovers a notebook that gives him the power to kill anyone whose name he writes in it, leading to a deadly game of cat-and-mouse.",
            image: .deathNote
        ),
        Anime(
            title: "One Piece",
            description: "Monkey D. Luffy and his pirate crew explore the Grand Line in search of the One Piece treasure to become the Pirate King.",
            image: .onePeace
        ),
        Anime(
            title: "Demon Slayer",
            description: "After his family is slaughtered by demons, Tanjiro Kamado joins the Demon Slayer Corps to avenge his family and cure his sister.",
            image: .demonSlayer
        ),
        Anime(
            title: "Sword Art Online",
            description: "In a near-future world, players are trapped in a virtual reality MMORPG and must clear the game to escape.",
            image: .swordArtOnline
        ),
        Anime(
            title: "Dragon Ball Z",
            description: "Follow Goku and his friends as they protect Earth from powerful foes, battling across multiple worlds to save the universe.",
            image: .dragonBallZ
        ),
        Anime(
            title: "Cowboy Bebop",
            description: "A space bounty hunter crew travels through the galaxy, facing personal struggles and taking on dangerous missions.",
            image: .cowboyBebop
        )
    ]


    @IBOutlet private weak var tableViewAnime: UITableView!

    private var selectedAnime: Anime?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewAnime.dataSource = self
        tableViewAnime.delegate = self
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destVC = segue.destination as? AnimeViewController else {
            return
        }
        destVC.configureAnime(with: selectedAnime)
    }
}

extension ViewAnimeController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedAnime = favoriteAnime[indexPath.row]
        performSegue(withIdentifier: "goToDetail", sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ViewAnimeController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteAnime.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "primaryCell", for: indexPath) as! PrimaryTableViewCell
        let currentModel = favoriteAnime[indexPath.row]
        cell.configureAnime(currentModel)
        return cell
    }
}
