

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = scene as? UIWindowScene else { return }

        window = UIWindow(windowScene: windowScene)
               
        
        let marTableViewController = MarTableViewController()
        marTableViewController.imageDataManager = makeImageDataManager()
        
        window?.rootViewController = marTableViewController
        window?.makeKeyAndVisible()
    }
    
    // MARK: - Private Methods
    func makeImageDataManager() -> ImageDataManager {
        let imageManager = ImageManager()
        var images = imageManager.getImages()
        images.sort(by: <)
        printImagesInfo(images)
        return ImageDataManager(images: images)
    }
    
        private func printImagesInfo(_ images: [ImageModel]) {
            for image in images {
                print(image)
        }
    }
}





