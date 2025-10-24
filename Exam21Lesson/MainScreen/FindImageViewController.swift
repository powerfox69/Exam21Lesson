

import UIKit

class FindImageViewController: UIViewController {
    
    private let imageNavigator: ImageNavigable
    
    private let resultLabel = UILabel()
    private let textField = UITextField()
    private let button = UIButton()
    private let imageView = UIImageView()
    private let infoLabel = UILabel()
    
    private let stackView = UIStackView()
    
    init(imageNavigator: ImageNavigable) {
        self.imageNavigator = imageNavigator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupFindImageViewController()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
         checkImage()
     }
}

//MARK: - Setup view
private extension FindImageViewController {
    
    func setupFindImageViewController() {
        view.backgroundColor = .white
        setupStackView()
        setupResultLabel()
        setupTextField()
        setupButton()
        setupImageView()
        setupInfoLabel()
        
        stackView.addArrangedSubview(
            resultLabel,
            textField,
            button,
            imageView,
            infoLabel)
        view.addSubview(stackView)
        
        setupLayout()
    }
    
        func setupStackView() {
            stackView.axis = .vertical
            stackView.spacing = 20
            stackView.alignment = .fill
        }
        
        func setupResultLabel() {
            resultLabel.text = "Введите название картинки"
            resultLabel.textAlignment = .center
            resultLabel.font = UIFont.systemFont(ofSize: 16)
            resultLabel.textColor = .black
        }
        
        func setupTextField() {
            textField.placeholder = "Название картинки"
            textField.borderStyle = .roundedRect
            textField.delegate = self
        }
        
        func setupButton() {
            button.setTitle("Проверить", for: .normal)
            button.backgroundColor = .systemBlue
            button.setTitleColor(.white, for: .normal)
            button.layer.cornerRadius = 8
            button.addTarget(self, action: #selector(checkImage), for: .touchUpInside)
        }
        
        func setupImageView() {
            imageView.contentMode = .scaleAspectFit
            imageView.backgroundColor = .white
            imageView.layer.cornerRadius = 8
            imageView.clipsToBounds = true
        }
        
        func setupInfoLabel() {
            infoLabel.textAlignment = .left
            infoLabel.font = UIFont.systemFont(ofSize: 14)
            infoLabel.textColor = .black
            infoLabel.isHidden = true
            infoLabel.numberOfLines = 0
        }
    }

// MARK: - Actions
private extension FindImageViewController {

    @objc private func checkImage() {
        
        view.endEditing(true)
        
        guard let text = textField.text, !text.isEmpty else { return }
        
        if let imageModel = imageNavigator.findImage(imageName: text) {
            resultLabel.text = "Такая картинка есть"
            imageView.image = UIImage(named: imageModel.imageName)
            infoLabel.text = imageModel.info
            infoLabel.isHidden = false

        } else {
            resultLabel.text = "Такой картинки нет"
            imageView.image = nil
        }
        
        textField.text = ""
        textField.resignFirstResponder()
    }
}

//MARK: - Setup Layout

extension FindImageViewController {
    //убрать приват
    private func setupLayout() {
        
        translatesAutoresizingMaskIntoConstraints(views: resultLabel, textField, button, imageView, stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            
            imageView.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 0.75),
            
            infoLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 60)
        ])
    }
}

// MARK: - UITextFieldDelegate

    extension FindImageViewController: UITextFieldDelegate {
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            checkImage()
            return true
        }
    }

