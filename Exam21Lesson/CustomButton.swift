import UIKit

class CustomButton: UIButton {
    init(textButton: String, bgColor: UIColor) {
        super.init(frame: .zero)
        setupButton(text: textButton, bgColor: bgColor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CustomButton {
    private func setupButton(text: String, bgColor: UIColor) {
        setTitle(text, for: .normal)
        setTitleColor(.white, for: .normal)
        backgroundColor = bgColor
        layer.cornerRadius = Constant.cornerRadius
        
        translatesAutoresizingMaskIntoConstraints = false

        heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}

private extension CustomButton {
    enum Constant {
        static let cornerRadius: CGFloat = 10
    }
}
