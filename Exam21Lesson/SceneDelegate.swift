//
//  SceneDelegate.swift
//  Exam21Lesson
//
//  Created by Gleb on 9/2/25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        
        let imageManager = ImageManager()
        var images = imageManager.getImages()
        images.sort(by: <)
        
        printImagesInfo(images)
        
        let imageDataManager = ImageDataManager(images: images)
        
      //  let viewController = ViewController(imageNavigator: imageDataManager)
   
        let findImageViewController = FindImageViewController(imageNavigator: imageDataManager)
        
        window.rootViewController = findImageViewController
        window.makeKeyAndVisible()
        self.window = window
    }
    
        private func printImagesInfo(_ images: [ImageModel]) {
            for image in images {
                print(image)
        }
    }
}





