
import UIKit

class ViewController: UIViewController {
    
    private var textLabel = UILabel()
    private let stackView = UIStackView()
    private let buttonStackView = UIStackView()
    private let imageView = UIImageView()
    
    // private let imageManager = ImageManager()
    private let imageNavigator: ImageNavigable
    
    
    private let lastButton = CustomButton(textButton: "Last", bgColor: .systemBlue)
    private let nextButton = CustomButton(textButton: "Next", bgColor: .lightGray)
    private let firstButton = CustomButton(textButton: "First", bgColor: .purple)
    
    
    init(imageNavigator: ImageNavigable) {
        self.imageNavigator = imageNavigator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewController()
       
    }
}
//MARK: - Setup view

private extension ViewController {
    
    func setupViewController() {
        view.backgroundColor = UIColor(white: 0.16, alpha: 1.0)
        setupStackView()
        setupImageView()
        setupLabel()
        setupButtonStackView()
        view.addSubview(stackView)
        view.addSubview(firstButton)
        
        setupButtonAction()
        setupLayout()
    }
    
    func setupButtonAction() {
        lastButton.addAction(
            UIAction {
                [weak self] _ in self?.updateUI(
                    with: self?.imageNavigator.getPreviousImage())
            },
            for: .touchUpInside)
        
        nextButton.addAction(
            UIAction {
            [weak self] _ in self?.updateUI(
                with: self?.imageNavigator.getNextImage())
            },
            for: .touchUpInside)
        
        firstButton.addAction(
            UIAction {
                [weak self] _ in self?.updateUI(
                    with: self?.imageNavigator.getFirstImage())
            },
            for: .touchUpInside)
    }
    
    func updateUI(with image: ImageModel?) {
        if let image = image {
            imageView.image = UIImage(named: image.imageName)
            textLabel.text = "\(image.info)"
        }
    }
       
        func setupButtonStackView() {
            buttonStackView.axis = .horizontal
            buttonStackView.distribution = .fillEqually
            buttonStackView.alignment = .center
            buttonStackView.spacing = 10
            buttonStackView.translatesAutoresizingMaskIntoConstraints = false
            
            buttonStackView.addArrangedSubview(lastButton, nextButton)
        }
        
        func setupStackView() {
            stackView.axis = .vertical
            stackView.distribution = .fill
            stackView.alignment = .fill
            stackView.spacing = 20
            stackView.translatesAutoresizingMaskIntoConstraints = false
            
            stackView.addArrangedSubview(imageView, textLabel, buttonStackView)
        }
        
        func setupLabel() {
            let firstImage = imageNavigator.getCurrentImage()
            textLabel.text = firstImage.info
            textLabel.font = .systemFont(ofSize: 10, weight: .bold)
            textLabel.textColor = .systemGray6
            textLabel.textAlignment = .left
            
            textLabel.numberOfLines = 0
            textLabel.preferredMaxLayoutWidth = 300
            
            textLabel.setContentCompressionResistancePriority(.required, for: .vertical)
            textLabel.setContentHuggingPriority(.required, for: .vertical)
        }
        
        func setupImageView() {
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.image = UIImage(named: "image1")
            imageView.contentMode = .scaleAspectFill
            imageView.backgroundColor = .clear
            imageView.layer.cornerRadius = 10
            imageView.layer.masksToBounds = true
        }
    }

//MARK: - Setup Layout

extension ViewController {
    private func setupLayout() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            firstButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 700),
            firstButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            firstButton.widthAnchor.constraint(equalTo: nextButton.widthAnchor),
            
            imageView.widthAnchor.constraint(equalToConstant: 300),
            imageView.heightAnchor.constraint(equalToConstant: 400),
            
            buttonStackView.heightAnchor.constraint(equalToConstant: 50),
            buttonStackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 100)
        ])
    }
}
