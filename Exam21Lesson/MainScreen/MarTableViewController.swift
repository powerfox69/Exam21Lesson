
import UIKit

class MarTableViewController: UITableViewController {
    
    var imageDataManager: ImageDataManager!
    
    private let cellIdentifier = "cellIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
        tableView.register(ImageCell.self, forCellReuseIdentifier: cellIdentifier)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        imageDataManager.getIsFavoriteProducts().count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ImageCell else {
            return UITableViewCell()
        }
        
        let image = imageDataManager.getIsFavoriteProducts()[indexPath.row]
        
        cell.configure(image: image)
        
        cell.actionButtonClosure = { myCell in
            if let index = self.tableView.indexPath(for: myCell) {
                let product = self.imageDataManager.getIsFavoriteProducts()[index.row]
                self.imageDataManager.toggelFavorite(product)
                self.tableView.deleteRows(at: [index], with: .automatic)
            }
        }
        cell.selectionStyle = .none
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 140
        }
    
}
    
    
    
    
    

