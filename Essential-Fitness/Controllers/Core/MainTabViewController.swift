//
//  MainTabViewController.swift
//  Essential-Fitness
//
//  Created by heshandev on 5/6/23.
//

import UIKit

class MainTabViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        ///*
        let vc1 = UINavigationController(rootViewController: HomeViewController1())
        let vc2 = UINavigationController(rootViewController: MyPlanViewController())
        let vc3 = UINavigationController(rootViewController: BMIViewController())
        let vc4 = UINavigationController(rootViewController: UserDetailsViewController())
        
    
        // https://sarunw.com/posts/hide-navigation-bar-on-scroll-in-uikit/
        
        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc2.tabBarItem.image = UIImage(systemName: "list.dash")
        vc3.tabBarItem.image = UIImage(systemName: "plus.rectangle")
        vc4.tabBarItem.image = UIImage(systemName: "questionmark.circle")
        
        vc1.title = "Home"
        vc2.title = "My Plan"
        vc3.title = "BMI"
        vc4.title = "User Details"
        
        tabBar.tintColor = .black
        tabBar.barTintColor = UIColor.yellow
        setViewControllers([vc1, vc2, vc3, vc4], animated: true)
        //  */
    }
}
