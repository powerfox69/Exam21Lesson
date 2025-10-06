

import UIKit

class LicenseAgreementViewController: UIViewController {
    private let licenseManager: LicenseTextRetrievable
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let titleLabel = UILabel()
    private let texLabel = UILabel()
    
    init(licenseManager: LicenseTextRetrievable) {
        self.licenseManager = licenseManager
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLicenseAgreementViewController()
    }
}

private extension LicenseAgreementViewController {
    func setupLicenseAgreementViewController() {
        addSubview()
        setupScrollView()
        setupContentView()
        setupTitleLabel()
        setupTextLabel()
        setupText()
        setupLayout()
    }
    
    func addSubview() {
        view.addSubview(scrollView)
        
    }
    
    func setupScrollView() {
        scrollView.backgroundColor = .gray
        
        scrollView.addSubview(contentView)
    }
    
    func setupContentView() {
        contentView.backgroundColor = .white
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(texLabel)
    }
    
    func setupTitleLabel() {
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        titleLabel.textAlignment = .left
        titleLabel.textColor = .black
        titleLabel.numberOfLines = 0
    }
    
    func setupTextLabel() {
        texLabel.font = UIFont.systemFont(ofSize: 16)
        texLabel.textAlignment = .left
        texLabel.textColor = .black
        texLabel.numberOfLines = 0
    }
}

private extension LicenseAgreementViewController {
    func setupLayout() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        texLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
                    titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                    titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
                    
                    texLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
                    texLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                    texLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
                    texLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
}

private extension LicenseAgreementViewController {
    func setupText() {
        let licenseText = licenseManager.getLicenseText()
        let licenseLabel = licenseManager.getLicenseTitle()
        
        texLabel.text = licenseText
        titleLabel.text = licenseLabel
    }
}
