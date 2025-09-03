

import UIKit

class ViewController: UIViewController {

    private var textLabel = UILabel()
    private let stackView = UIStackView()
    private let imageView = UIImageView()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
        
    }


}

//MARK: - Setup view

private extension ViewController {
    
    func setupViewController() {
        
        view.backgroundColor = .darkGray
        setupStackView()
        setupImageView()

        setupLabel()
        view.addSubview(stackView)
        setupLayout()
        
    }
    
    func setupStackView() {
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        
        // Создаем backgroundView
        let backgroundView = UIView()
        backgroundView.backgroundColor = .lightText
        backgroundView.layer.cornerRadius = 0
        
        // Добавляем backgroundView под stackView в иерархии
        stackView.insertSubview(backgroundView, at: 0)
        
        // Устанавливаем constraints
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: stackView.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: stackView.bottomAnchor)
        ])
        //
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(textLabel)
        
    }
    
    func setupLabel() {
        textLabel.text = "Платье силуэта «песочные часы» с акцентом на талии и объемом на бедрах. Фигурный вырез декольте. Пышные короткие рукава. Подшитая подкладкой модель в красно-винном оттенке застегивается на молнию."
        textLabel.font = .systemFont(ofSize: 10, weight: .bold)
        textLabel.textColor = .systemGray6
        textLabel.textAlignment = .left
        
        textLabel.numberOfLines = 0
       // textLabel.lineBreakMode = .byWordWrapping
        
        textLabel.preferredMaxLayoutWidth = 300
        
        textLabel.setContentCompressionResistancePriority(.required, for: .vertical)
               textLabel.setContentHuggingPriority(.required, for: .vertical)
    }
    
    func setupLayout() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
    }
    
    func setupImageView() {

        imageView.image = UIImage(named: "image1")
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 0
        imageView.layer.masksToBounds = true
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    imageView.widthAnchor.constraint(equalToConstant: 400),
                    imageView.heightAnchor.constraint(equalToConstant: 400)
                ])
    }
    
   
}
