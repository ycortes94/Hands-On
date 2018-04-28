//
//  CustomTabBarController.swift
//  HandsOn
//
//  Created by Rich Chau on 4/28/18.
//  Copyright © 2018 Yosimy Cortes. All rights reserved.
//

import UIKit

class CustomTabBarController : UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //change appearance of tab bar
        UITabBar.appearance().backgroundColor = UIColor(red: 0.976, green: 0.977, blue: 0.976, alpha: 1.0)
        UITabBar.appearance().tintColor = UIColor.black
        self.tabBar.unselectedItemTintColor = UIColor(red: 0.408, green: 0.408, blue: 0.408, alpha: 1.0)
        UINavigationBar.appearance().backgroundColor = UIColor(red: 0.976, green: 0.977, blue: 0.976, alpha: 1.0)
        
        //setup our custom view controllers
        let homeViewController = HomeViewController()
        let homeNavController = UINavigationController(rootViewController: homeViewController)
        //homeNavController.tabBarItem.title = "Home"
        homeNavController.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        homeNavController.tabBarItem.image = UIImage(named: "home")
        homeNavController.navigationBar.topItem?.title = "Home"
        
        let tasksViewController = TasksViewController()
        let tasksNavController = UINavigationController(rootViewController: tasksViewController)
        //tasksNavController.tabBarItem.title = "Tasks"
        tasksNavController.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        tasksNavController.tabBarItem.image = UIImage(named: "tasks")
        tasksNavController.navigationBar.topItem?.title = "Tasks"
        
        let postViewController = NewPostViewController()
        let postNavController = UINavigationController(rootViewController: postViewController)
        //postNavController.tabBarItem.title = "Post"
        postNavController.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        postNavController.tabBarItem.image = UIImage(named: "post")
        postNavController.navigationBar.topItem?.title = "Post Task"
        
        let messagesViewController = MessagesViewController()
        let messagesNavController = UINavigationController(rootViewController: messagesViewController)
        //messagesNavController.tabBarItem.title = "Messages"
        messagesNavController.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        messagesNavController.tabBarItem.image = UIImage(named: "messages")
        messagesNavController.navigationBar.topItem?.title = "Messages"
        
        let moreViewController = MoreViewController()
        let moreNavController = UINavigationController(rootViewController: moreViewController)
        //moreNavController.tabBarItem.title = "More"
        moreNavController.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        moreNavController.tabBarItem.image = UIImage(named: "menu")
        moreNavController.navigationBar.topItem?.title = "More"
        
    
        viewControllers = [homeNavController, tasksNavController, postNavController, messagesNavController, moreNavController]
        
    }
}
