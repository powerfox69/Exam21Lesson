
import UIKit

class MarTableViewController: UITableViewController {
    
    var imageDataManager: ImageDataManager!
    
    private let cellIdentifier = "cellIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        
        cell.actionButtonClosure = { cell in
            if let indexPath = self.tableView.indexPath(for: cell) {
                let favoritrImage = self.imageDataManager.getIsFavoriteProducts()
                let product = favoritrImage[indexPath.row]
                
                self.imageDataManager.toggelFavorite(product)
                self.tableView.deleteRows(at: [indexPath], with: .automatic)
            }
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}





