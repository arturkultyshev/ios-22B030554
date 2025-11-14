import UIKit

final class FavoriteCell: UITableViewCell {
    static let reuseID = "FavoriteCell"

    private let coverView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 10
        iv.backgroundColor = UIColor.secondarySystemFill
        return iv
    }()

    private let titleLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont.preferredFont(forTextStyle: .headline)
        l.numberOfLines = 2
        l.setContentCompressionResistancePriority(.required, for: .vertical)
        return l
    }()

    private let subtitleLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont.preferredFont(forTextStyle: .subheadline)
        l.textColor = .secondaryLabel
        l.numberOfLines = 1
        return l
    }()

    private let reviewLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont.preferredFont(forTextStyle: .body)
        l.numberOfLines = 0
        l.textColor = .label
        l.setContentHuggingPriority(.defaultLow, for: .vertical)
        return l
    }()

    private lazy var labelsStack: UIStackView = {
        let v = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel, reviewLabel])
        v.translatesAutoresizingMaskIntoConstraints = false
        v.axis = .vertical
        v.spacing = 4
        return v
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    private func setup() {
        selectionStyle = .none
        contentView.addSubview(coverView)
        contentView.addSubview(labelsStack)

        let g = contentView.layoutMarginsGuide
        NSLayoutConstraint.activate([
            coverView.leadingAnchor.constraint(equalTo: g.leadingAnchor),
            coverView.topAnchor.constraint(equalTo: g.topAnchor),
            coverView.widthAnchor.constraint(equalToConstant: 80),
            coverView.heightAnchor.constraint(equalToConstant: 80),

            labelsStack.leadingAnchor.constraint(equalTo: coverView.trailingAnchor, constant: 12),
            labelsStack.topAnchor.constraint(equalTo: g.topAnchor),
            labelsStack.trailingAnchor.constraint(equalTo: g.trailingAnchor),
            labelsStack.bottomAnchor.constraint(equalTo: g.bottomAnchor)
        ])
    }

    func configure(with item: FavoriteItem) {
        if let img = UIImage(named: item.imageName) {
            coverView.image = img
        } else {
            coverView.image = UIImage(systemName: item.imageName)
        }
        titleLabel.text = item.title
        subtitleLabel.text = item.subtitle
        reviewLabel.text = item.review
    }
}
