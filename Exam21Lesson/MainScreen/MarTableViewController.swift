
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
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
