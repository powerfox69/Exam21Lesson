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
        let images = imageManager.getImages()
        let imageDataManager = ImageDataManager(images: images)
        
        let viewController = ViewController(imageNavigator: imageDataManager)
        
        window.rootViewController = viewController
        window.makeKeyAndVisible()
        self.window = window
    }
}





