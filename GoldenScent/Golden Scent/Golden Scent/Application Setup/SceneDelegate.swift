//
//  SceneDelegate.swift
//  Golden Scent
//
//  Created by Shahbaz Khan on 04/03/2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var cordinator : MainCordinator?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let navController : UINavigationController = UINavigationController()
        cordinator = MainCordinator.init(navController: navController)
        cordinator?.start()
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {}
    
    func sceneDidBecomeActive(_ scene: UIScene) {}
    
    func sceneWillResignActive(_ scene: UIScene) {}
    
    func sceneWillEnterForeground(_ scene: UIScene) {}
    
    func sceneDidEnterBackground(_ scene: UIScene) {}
    
    
}
