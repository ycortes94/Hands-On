//
//  HomeViewController.swift
//  FirebaseApp
//
//  Created by Yosimy Cortes on 4/5/18.
//  Copyright © 2018 Yosimy Cortes. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class HomeViewController:UITableViewController {
    
    //var tableView:UITableView!
    
    var posts = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        self.tableView.separatorStyle = .none
        observePosts()
        
        self.tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "posttableviewcell")
        //self.tableView.rowHeight = UITableViewAutomaticDimension
        //self.tableView.estimatedRowHeight = 500
        
    }
    
    func observePosts() {
        let postsRef = Database.database().reference().child("posts")
        
        postsRef.observe(.value, with: { snapshot in
            
            var tempPosts = [Post]()
            
            for child in snapshot.children {
                if let childSnapshot = child as? DataSnapshot,
                    let dict = childSnapshot.value as? [String:Any],
                    let author = dict["author"] as? [String:Any],
                    let uid = author["uid"] as? String,
                    let username = author["username"] as? String,
                    let photoURL = author["photoURL"] as? String,
                    let url = URL(string:photoURL),
                    let text = dict["text"] as? String,
                    let timestamp = dict["timestamp"] as? Double,
                    let price = dict["price"] as? Int,
                    let location = dict["location"] as? String,
                    let duration = dict["duration"] as? Int,
                    let description = dict["description"] as? String
                {
                    
                    let userProfile = UserProfile(uid: uid, username: username, photoURL: url)
                    let post = Post(id: childSnapshot.key, author: userProfile, text: text, timestamp:timestamp,price: price, location: location, duration: duration, description: description)
                    tempPosts.append(post)
                    
                    print ("post added to newsfeed")
                }
            }
            
            self.posts = tempPosts
            self.tableView.reloadData()
            
        })
    }
    
    //    @IBAction func handleLogout(_ sender:Any) {
    //        try! Auth.auth().signOut()
    //    }
    
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 430;//Choose your custom row height
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "posttableviewcell", for: indexPath) as! PostTableViewCell
        //cell.selectionStyle = UITableViewCellSelectionStyle.none
        cell.contentView.backgroundColor = UIColor.clear
        cell.backgroundColor = UIColor(red: 0.659, green: 0.659, blue: 0.659, alpha: 0.70)
        
        let whiteRoundedView : UIView = UIView(frame: CGRect(x: 10, y: 8, width: self.view.frame.size.width - 20, height: 415))
        
        whiteRoundedView.layer.backgroundColor = UIColor(red: 0.972, green: 0.973, blue: 0.972, alpha: 1.0).cgColor
        whiteRoundedView.layer.masksToBounds = false
        whiteRoundedView.layer.cornerRadius = 8
        
        cell.contentView.addSubview(whiteRoundedView)
        cell.contentView.sendSubview(toBack: whiteRoundedView)
        
        
        cell.set(post: posts[indexPath.row])
        cell.layoutSubviews()
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let taskDetailsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TaskDetailsViewController") as! TaskDetailsViewController
        
        taskDetailsVC.set(post: posts[indexPath.row])
        
        if let navigator = navigationController{
            navigator.pushViewController(taskDetailsVC, animated: true)
        }
    }
}
