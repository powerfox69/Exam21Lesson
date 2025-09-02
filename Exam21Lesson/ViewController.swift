

import UIKit

class ViewController: UIViewController {

    private var textLabel = UILabel()
    private let stackView = UIStackView()
    
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
        setupLabel()
        view.addSubview(stackView)
        setupLayout()
    }
    
    func setupStackView() {
        stackView.axis = .vertical
        stackView.distribution = .equalCentering
        stackView.alignment = .center
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.addArrangedSubview(textLabel)
        
    }
    
    func setupLabel() {
        textLabel.text = "крым"
        textLabel.font = .systemFont(ofSize: 50, weight: .bold)
        textLabel.textColor = .systemGray6
        textLabel.textAlignment = .center
    }
    
    func setupLayout() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 500),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
            
        }
}
