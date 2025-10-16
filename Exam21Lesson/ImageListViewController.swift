
import UIKit

class ImageListViewController: UIViewController, UITableViewDelegate {
    
    private let tableView = UITableView()
    private let cellIdentifier = "cellIdentifier"
    private let imageDataManager: ImageDataManager

    init(imageDataManager: ImageDataManager) {
        self.imageDataManager = imageDataManager
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupLayout()
    }
}

//MARK: - Setting View
extension ImageListViewController {
    
    func setupView() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        setupTableView()
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self,
                           forCellReuseIdentifier: cellIdentifier)
    }
}

//MARK: - Layout
extension ImageListViewController {
    
    func setupLayout() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

//MARK: - UITableViewDataSource
extension ImageListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        imageDataManager.getImageCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        let imageModel = imageDataManager.getImage(at: indexPath.row)
        
        var configuration = cell.defaultContentConfiguration()
        configuration.text = imageModel.imageName
        configuration.secondaryText = imageModel.info
        configuration.secondaryTextProperties.numberOfLines = 2
        
        if let image = UIImage(named: imageModel.imageName) {
            configuration.image = image
        } else {
            configuration.image = UIImage(systemName: "photo")
        }
        
        configuration.imageProperties.maximumSize = CGSize(width: 60, height: 60)
        
        cell.accessoryType = imageModel.isMark ? .checkmark : .none
        cell.contentConfiguration = configuration
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension ImageListViewController {
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let markAction = UIContextualAction(
            style: .normal,
            title: "Mark"
        ) { _, _, completion in
            self.imageDataManager.toggleMark(at: indexPath.row)
            tableView.reloadRows(at: [indexPath], with: .automatic)
            completion(true)
        }
        
        markAction.backgroundColor = .systemGreen
        
        let deleteAction = UIContextualAction(
            style: .destructive,
            title: "Delete"
        ) { _, _, completion in
            self.imageDataManager.deleteImage(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            completion(true)
        }
        
        return UISwipeActionsConfiguration(actions: [deleteAction, markAction])
    }
}
