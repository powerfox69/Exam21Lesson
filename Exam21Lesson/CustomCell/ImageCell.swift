
import UIKit


class ImageCell: UITableViewCell {
    
    private let customView = CustomView()
    
    var actionButtonClosure: ((UITableViewCell) -> Void)?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(image: ImageModel) {
        customView.configure(image: image)
        
        customView.actionButtonClosure = toggleMarkButton
        }
    
    
    private func toggleMarkButton() {
    actionButtonClosure?(self)
    }
}

// MARK: - Setting
private extension ImageCell {
    func setup() {
        contentView.addSubview(customView)
        setupLayout()
    }
}

// MARK: - Layout
private extension ImageCell {
    func setupLayout() {
            customView.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            customView.topAnchor.constraint(equalTo: contentView.topAnchor),
            customView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            customView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            customView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15)
        ])
    }
}
