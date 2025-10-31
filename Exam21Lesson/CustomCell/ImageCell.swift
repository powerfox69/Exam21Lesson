
import UIKit

protocol IButtonDelegate {
    func actionButton(cell: UITableViewCell)
}

class ImageCell: UITableViewCell {
    
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let imageProduct = UIImageView()
    private let markButton = UIButton()
    
    private var toggleMark = false
    
    var actionButtonClosure: ((UITableViewCell) -> Void)?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(image: ImageModel) {
        titleLabel.text = image.imageName
        descriptionLabel.text = image.info
        
        toggleMark = image.isMark
        
        let mark = image.isMark ? "checkmark.square.fill" : "checkmark.square"
        markButton.setImage(UIImage(systemName: mark), for: .normal)
        
        
        if let image = UIImage(named: image.imageName) {
            imageProduct.image = image
        } else {
            imageProduct.image = UIImage(systemName: "photo")
        }
    }
    
    @objc
    private func toggleMarkButton() {
        toggleMark.toggle()
        let mark = toggleMark ? "checkmark.square.fill" : "checkmark.square"
        markButton.setImage(UIImage(systemName: mark), for: .normal)
        //delegate?.actionButton(cell: self)
        actionButtonClosure?(self)
    }
}

// MARK: - Setting
private extension ImageCell {
    func setup() {
        addSubViews()
        setupTitleLabel()
        setupDescription()
        setupImageProduct()
        setupMarkButton()
        setupLayout()
    }
    
    func addSubViews() {
        [titleLabel,
         descriptionLabel,
         imageProduct,
         markButton].forEach { view in
            contentView.addSubview(view)
        }
    }
}

// MARK: - Settings Views
private extension ImageCell {
    
    func setupTitleLabel() {
        titleLabel.font = .boldSystemFont(ofSize: 20)
    }
    
    func setupDescription() {
        descriptionLabel.numberOfLines = 0
    }
    
    func setupImageProduct() {
        imageProduct.widthAnchor.constraint(equalToConstant: 100).isActive = true
        imageProduct.heightAnchor.constraint(equalToConstant: 100).isActive = true
        imageProduct.contentMode = .scaleAspectFill
    }
    
    func setupMarkButton() {
        markButton.tintColor = .systemBlue
        markButton.addTarget(self, action: #selector(toggleMarkButton), for: .touchUpInside)
    }
}

// MARK: - Layout
private extension ImageCell {
    func setupLayout() {
        [titleLabel,
         descriptionLabel,
         imageProduct,
         markButton].forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            imageProduct.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            imageProduct.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            
            titleLabel.leadingAnchor.constraint(equalTo: imageProduct.trailingAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: markButton.leadingAnchor, constant: -8),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            descriptionLabel.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -16),
            
            markButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            markButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            markButton.widthAnchor.constraint(equalToConstant: 24),
            markButton.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
}
