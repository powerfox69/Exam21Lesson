import UIKit

protocol CustomButtonDelegate {
    func customButtonDidTap(_ button: CustomButton)
}

class CustomButton: UIButton {
    
    var elementName: String?
    var delegate: CustomButtonDelegate?
    
    init(textButton: String, bgColor: UIColor) {
        super.init(frame: .zero)
        setupButton(text: textButton, bgColor: bgColor)
        addAction()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
// MARK: - Setup View

    extension CustomButton {
        
        private func addAction() {
            let action = UIAction { _ in
                self.delegate?.customButtonDidTap(self)
            }
            addAction(action, for: .touchUpInside)
        }
        
        private func setupButton(text: String, bgColor: UIColor) {
            setTitle(text, for: .normal)
            setTitleColor(.white, for: .normal)
            backgroundColor = bgColor
            layer.cornerRadius = Constant.cornerRadius
            
            translatesAutoresizingMaskIntoConstraints = false
            
            heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
    }

// MARK: - Constants
private extension CustomButton {
    enum Constant {
        static let cornerRadius: CGFloat = 10
    }
}
