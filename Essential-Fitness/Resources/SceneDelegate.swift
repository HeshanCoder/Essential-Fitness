//
//  SceneDelegate.swift
//  Essential-Fitness
//
//  Created by heshandev on 5/4/23.
//

import UIKit
import FirebaseAuth

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        self.setupWindow(with: scene)
        self.checkAuthentication()
    }
    
    // pass the UIScene and set it up in this Private func
    private func setupWindow(with scene: UIScene) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        self.window?.makeKeyAndVisible()
    }
    
    public func checkAuthentication() {
        // firebase keep track the user is loged in or not
        if Auth.auth().currentUser == nil {
            self.goToController(with: LoginViewController())
        } else {
            //self.goToController(with: HomeViewController())
            self.goToController(with: MainTabViewController())
        }
    }
    
    // adding animation to views
    private func goToController(with viewController: UIViewController) {
        // because we are working on UI view we better to work in main thread
        // use method with withDuration, animation and completion
        DispatchQueue.main.async { [weak self] in
            
            // this will bleand 2 diffrent states
            UIView.animate(withDuration: 0.25) {
                // first set the black screen
                self?.window?.layer.opacity = 0
                
            } completion: { [weak self] _ in
                
                let nav = UINavigationController(rootViewController: viewController)
                nav.modalPresentationStyle = .fullScreen
                self?.window?.rootViewController = nav
                
                UIView.animate(withDuration: 0.25) { [weak self] in
                    // then remove the black screen
                    self?.window?.layer.opacity = 1
                }
            }
        }
    }
    
    
    func sceneDidDisconnect(_ scene: UIScene) {
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {

    }
    
    func sceneWillResignActive(_ scene: UIScene) {
  
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
  
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
    
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }
}

