import UIKit

struct Hero: Decodable {
    let name: String
    let biography: Biography
    let images: HeroImage
    let work: Work
    let powerstats: Powerstats

    struct Biography: Decodable {
        let fullName: String
        let alterEgos: String
        let aliases: [String]
        let placeOfBirth: String
        let firstAppearance: String
    }
    struct Powerstats: Decodable {
        let intelligence: Int
        let strength: Int
        let speed: Int
        let durability: Int
        let power: Int
        let combat: Int
    }
    struct Work: Decodable {
        let occupation: String
    }
    struct HeroImage: Decodable {
        let sm: String
    }
}

class ViewController: UIViewController {

    @IBOutlet private weak var heroImage: UIImageView!
    @IBOutlet private weak var heroTitle: UILabel!
    @IBOutlet private weak var heroDescription: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func heroRollDidTap(_ sender: UIButton) {
        rerollHero()
    }

    private func rerollHero() {
        let randomId = Int.random(in: 1...563)
        fetchHero(by: randomId)
    }

    private func fetchHero(by id: Int) {
        let urlString = "https://akabab.github.io/superhero-api/api/id/\(id).json"
        guard let url = URL(string: urlString) else { return }
        let urlRequest = URLRequest(url: url)

        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard self.handleErrorIfNeeded(error: error) == false else {
                DispatchQueue.main.async {
                    self.rerollHero()
                }
                return
            }

            guard let data else {
                DispatchQueue.main.async {
                    self.rerollHero()
                }
                return
            }

            self.handleHeroData(data: data)
        }.resume()
    }

    private func handleHeroData(data: Data) {
        do {
            let hero = try JSONDecoder().decode(Hero.self, from: data)
            let heroImage = self.getImageFromUrl(string: hero.images.sm)

            DispatchQueue.main.async {
                self.heroTitle.text = hero.name
                self.heroDescription.text = "Biography\n   Fullname: \(hero.biography.fullName)" + "\n    Alter egos: \(hero.biography.alterEgos)" + "\n   Aliases: \(hero.biography.aliases.joined(separator: ", "))" + "\n   Place of birth: \(hero.biography.placeOfBirth)" + "\n   First appearance: \(hero.biography.firstAppearance)" + "\nPowerstats:\n   Inteligence: \(hero.powerstats.intelligence)" + "\n   Strength: \(hero.powerstats.strength)" + "\n   Speed: \(hero.powerstats.speed)" + "\n   Durability: \(hero.powerstats.durability)" + "\n   Power: \(hero.powerstats.power)" + "\n   Combat: \(hero.powerstats.combat)" + "\nWork:\n    Occupation: \(hero.work.occupation)"
                self.heroImage.image = heroImage
            }
        } catch {
            DispatchQueue.main.async {
                self.rerollHero()
            }
        }
    }

    private func getImageFromUrl(string: String) -> UIImage? {
        guard
            let heroImageURL = URL(string: string),
            let imageData = try? Data(contentsOf: heroImageURL)
        else {
            return nil
        }
        return UIImage(data: imageData)
    }

    private func handleErrorIfNeeded(error: Error?) -> Bool {
        guard let error else {
            return false
        }
        print("Error: \(error.localizedDescription)")
        return true
    }
}
