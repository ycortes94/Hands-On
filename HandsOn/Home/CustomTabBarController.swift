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
        
        //setup our custom view controllers
        let homeViewController = HomeViewController()
        let homeNavController = UINavigationController(rootViewController: homeViewController)
        homeNavController.tabBarItem.title = "Home"
        homeNavController.tabBarItem.image = UIImage(named: "home")
        
        let tasksViewController = TasksViewController()
        let tasksNavController = UINavigationController(rootViewController: tasksViewController)
        tasksNavController.tabBarItem.title = "Tasks"
        tasksNavController.tabBarItem.image = UIImage(named: "tasks")
        
        let postViewController = NewPostViewController()
        let postNavController = UINavigationController(rootViewController: postViewController)
        postViewController.tabBarItem.title = "Post"
        postViewController.tabBarItem.image = UIImage(named: "post")
        
        let messagesViewController = MessagesViewController()
        let messagesNavController = UINavigationController(rootViewController: messagesViewController)
        messagesViewController.tabBarItem.title = "Messages"
        messagesViewController.tabBarItem.image = UIImage(named: "messages")
        
        let moreViewController = MoreViewController()
        let moreNavController = UINavigationController(rootViewController: moreViewController)
        moreViewController.tabBarItem.title = "More"
        moreViewController.tabBarItem.image = UIImage(named: "menu")
        
        
    
        viewControllers = [homeNavController, tasksNavController, postNavController, messagesNavController, moreNavController]
        
    }
}
