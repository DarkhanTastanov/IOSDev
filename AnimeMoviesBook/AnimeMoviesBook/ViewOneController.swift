import UIKit

class ViewOneController: UIViewController {

    private var favoriteBooks: [Book] = [
        Book(
            title: "The Three-Body Problem",
            description: "The Three-Body Problem (Chinese: 三体; lit. 'three body') is a 2008 novel by the Chinese science fiction author Liu Cixin. It is the first novel in the Remembrance of Earth's Past trilogy.[1] The series portrays a fictional past, present, and future wherein Earth encounters an alien civilization from a nearby system of three Sun-like stars orbiting one another, a representative example of the three-body problem in orbital mechanics.",
            image: .three
        ),
        Book(
            title: "Endurance: A Year in Space, a Lifetime of Discovery",
            description: "Endurance: A Year in Space, a Lifetime of Discovery is a 2017 memoir by American astronaut Scott Kelly and Margaret Lazarus Dean. The book details Kelly's life, as well as that of his twin brother Mark, as they became naval aviators and test pilots, and were both selected for NASA Astronaut Group 16. Kelly recounts his four spaceflights, with an emphasis on the ISS year long mission, in which he participated.",
            image: .endurance
        ),
        Book(
            title: "War and Peace",
            description: "War and Peace (Russian: Война и мир, romanized: Voyna i mir; pre-reform Russian: Война и миръ; [vɐjˈna i ˈmʲir]) is a literary work by the Russian author Lev Tolstoy. Set during the Napoleonic Wars, the work comprises both a fictional narrative and chapters in which Tolstoy discusses history and philosophy. An early version was published serially beginning in 1865, after which the entire book was rewritten and published in 1869. It is regarded, with Anna Karenina, as Tolstoy's finest literary achievement, and it remains an internationally praised classic of world literature.",
            image: .peace
        ),
        Book(
            title: "One Hundred Years of Solitude",
            description: "One Hundred Years of Solitude (Spanish: Cien años de soledad, Latin American Spanish: [sjen ˈaɲos ðe soleˈðað]) is a 1967 novel by Colombian author Gabriel García Márquez that tells the multi-generational story of the Buendía family, whose patriarch, José Arcadio Buendía, founded the fictitious town of Macondo. The novel is often cited as one of the supreme achievements in world literature.[1][2][3][4] It was recognized as one of the most important works of the Spanish language during the 4th International Conference of the Spanish Language held in Cartagena in March 2007.",
            image: .oneHundredYearsOfSolitude
        ),
        Book(
            title: "Atomic Habits",
            description: "War and Peace (Russian: Война и мир, romanized: Voyna i mir; pre-reform Russian: Война и миръ; [vɐjˈna i ˈmʲir]) is a literary work by the Russian author Lev Tolstoy. Set during the Napoleonic Wars, the work comprises both a fictional narrative and chapters in which Tolstoy discusses history and philosophy. An early version was published serially beginning in 1865, after which the entire book was rewritten and published in 1869. It is regarded, with Anna Karenina, as Tolstoy's finest literary achievement, and it remains an internationally praised classic of world literature.",
            image: .peace
        ),
        Book(
            title: "Becoming",
            description: "Becoming is the memoir by former First Lady of the United States Michelle Obama, published on November 13, 2018.[1][2] Described by the author as a deeply personal experience,[3] the book talks about her roots and how she found her voice, as well as her time in the White House, her public health campaign, and her role as a mother.[4] The book is published by Crown and was released in 24 languages.[4] One million copies were donated to First Book, an American nonprofit organization which provides books to children.",
            image: .becoming
        ),
        Book(
            title: "The Name of the Wind",
            description: "The Name of the Wind, also referred to as The Kingkiller Chronicle: Day One, is a heroic fantasy novel written by American author Patrick Rothfuss. It is the first book in the ongoing fantasy trilogy The Kingkiller Chronicle, followed by The Wise Man's Fear. It was published on March 27, 2007",
            image: .theNameoftheWind
        ),
        Book(
            title: "Educated",
            description: "Educated is a 2018 memoir by the American author Tara Westover. Westover recounts overcoming her survivalist Mormon family in order to go to college, and emphasizes the importance of education in enlarging her world. She details her journey from her isolated life in the mountains of Idaho to completing a PhD program in history at Cambridge University. She started college at the age of 17 having had no formal education. She explores her struggle to reconcile her desire to learn with the world she inhabited with her father.",
            image: .educated
        ),
        Book(
            title: "Dune",
            description: "Dune is a 1965 epic science fiction novel by American author Frank Herbert, originally published as two separate serials (1963–64 novel Dune World and 1965 novel Prophet of Dune) in Analog magazine. It tied with Roger Zelazny's This Immortal for the Hugo Award for Best Novel and won the inaugural Nebula Award for Best Novel in 1966. It is the first installment of the Dune Chronicles. It is one of the world's best-selling science fiction novels.",
            image: .dune
        ),
        Book(
            title: "Sapiens: A Brief History of Humankind",
            description: "Sapiens: A Brief History of Humankind (Hebrew: קיצור תולדות האנושות, Qitzur Toldot ha-Enoshut) is a book by Yuval Noah Harari, first published in Hebrew in Israel in 2011 based on a series of lectures Harari taught at The Hebrew University of Jerusalem, and in English in 2014.[1][2] The book, focusing on Homo sapiens, surveys the history of humankind, starting from the Stone Age and going up to the twenty-first century. The account is situated within a framework that intersects the natural sciences with the social sciences.",
            image: .sapiens
        ),
    ]

    @IBOutlet private weak var tableView: UITableView!

    private var selectedBook: Book?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destVC = segue.destination as? SecondViewController else {
            return
        }
        destVC.configure(with: selectedBook)
    }
}

extension ViewOneController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedBook = favoriteBooks[indexPath.row]
        performSegue(withIdentifier: "goToDetail", sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ViewOneController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteBooks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "primaryCell", for: indexPath) as! PrimaryTableViewCell
        let currentModel = favoriteBooks[indexPath.row]
        cell.configure(currentModel)
        return cell
    }
}
