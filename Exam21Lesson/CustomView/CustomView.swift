

import UIKit

class CustomView: UIView {
    
        enum Constant {
            static let photo = "Photo"
            static let checkmarkSquareFill = "checkmark.square.fill"
            static let checkmarkSquare = "checkmark.square"
        }
        
        private let titleLabel = UILabel()
        private let descriptionLabel = UILabel()
        private let imageProduct = UIImageView()
        private let markButton = UIButton()
        
        private var toggleMark = false
        
       var actionButtonClosure: (() -> Void)?
        
    override init(frame: CGRect) {
        super.init(frame: frame)
            setup()
        }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        UIView.animate(withDuration: 0.2) {
            self.backgroundColor = UIColor(red: 255/255, green: 200/255, blue: 230/255, alpha: 1)
        } completion: { _ in
            self.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 250/255, alpha: 1)
        }
    }
        
    @available(*, unavailable)
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        func configure(image: ImageModel) {
            titleLabel.text = image.imageName
            descriptionLabel.text = image.info
            
            toggleMark = image.isMark
            
            let mark = image.isMark ? Constant.checkmarkSquareFill : Constant.checkmarkSquare
            markButton.setImage(UIImage(systemName: mark), for: .normal)
            
            
            if let image = UIImage(named: image.imageName) {
                imageProduct.image = image
            } else {
                imageProduct.image = UIImage(systemName: Constant.photo)
            }
        }
        
        @objc
        private func toggleMarkButton() {
            toggleMark.toggle()
            updateMarkButtonImage()
            actionButtonClosure?()
        }
        
        private func updateMarkButtonImage() {
            let mark = toggleMark ? Constant.checkmarkSquareFill : Constant.checkmarkSquare
            markButton.setImage(UIImage(systemName: mark), for: .normal)
        }
    }

    // MARK: - Setting
    private extension CustomView {
        func setup() {
            
            backgroundColor = UIColor(cgColor: CGColor(red: 230/255, green: 230/255, blue: 250/255, alpha: 1))
            layer.cornerRadius = 20
            
            
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
                addSubview(view)
            }
        }
    }

    // MARK: - Settings Views
    private extension CustomView {
        
        func setupTitleLabel() {
            titleLabel.font = .boldSystemFont(ofSize: 20)
        }
        
        func setupDescription() {
            descriptionLabel.numberOfLines = 0
        }
        
        func setupImageProduct() {
            imageProduct.widthAnchor.constraint(equalToConstant: 100).isActive = true
            imageProduct.heightAnchor.constraint(equalToConstant: 100).isActive = true
            imageProduct.contentMode = .scaleAspectFit
        }
        
        func setupMarkButton() {
            markButton.tintColor = .systemBlue
            markButton.addTarget(self, action: #selector(toggleMarkButton), for: .touchUpInside)
        }
    }

    // MARK: - Layout
    private extension CustomView {
        func setupLayout() {
            [titleLabel,
             descriptionLabel,
             imageProduct,
             markButton].forEach { view in
                view.translatesAutoresizingMaskIntoConstraints = false
            }
            
            NSLayoutConstraint.activate([
                imageProduct.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                imageProduct.topAnchor.constraint(equalTo: topAnchor, constant: 12),
                
                titleLabel.leadingAnchor.constraint(equalTo: imageProduct.trailingAnchor, constant: 16),
                titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
                titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: markButton.leadingAnchor, constant: -8),
                
                descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
                descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
                descriptionLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: -16),
                descriptionLabel.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -16),
                
                markButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
                markButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
                markButton.widthAnchor.constraint(equalToConstant: 24),
                markButton.heightAnchor.constraint(equalToConstant: 24)
            ])
        }
    }

    

