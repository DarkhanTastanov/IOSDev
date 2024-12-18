import UIKit

class PrimaryTableViewCell: UITableViewCell {

    @IBOutlet private weak var coverImage: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(_ model: Book) {
        titleLabel.text = model.title
        coverImage.image = model.image
    }
    func configureMovie(_ model: Movie) {
        titleLabel.text = model.title
        coverImage.image = model.image
    }
    func configureAnime(_ model: Anime) {
        titleLabel.text = model.title
        coverImage.image = model.image
    }
}
