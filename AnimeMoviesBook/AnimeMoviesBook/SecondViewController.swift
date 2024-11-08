import UIKit

class SecondViewController: UIViewController {

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var coverImage: UIImageView!
    @IBOutlet private weak var favoriteButton: UIButton!

    private var inputModel: Book?

    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = inputModel?.title
        descriptionLabel.text = inputModel?.description
        coverImage.image = inputModel?.image
        updateFavoriteButton()
    }

    func configure(with model: Book?) {
        self.inputModel = model
    }

    @IBAction private func toggleFavorite(_ sender: UIButton) {
        inputModel?.isFavorite.toggle()
        updateFavoriteButton()
    }

    private func updateFavoriteButton() {
        let isFavorite = inputModel?.isFavorite ?? false
        let title = isFavorite ? "Unfavorite" : "Favorite"
        let backgroundColor = isFavorite ? UIColor.red : UIColor.gray

        favoriteButton.setTitle(title, for: .normal)
        favoriteButton.backgroundColor = backgroundColor
    }
}
