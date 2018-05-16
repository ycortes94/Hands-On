//
//  TasksViewController.swift
//  HandsOn
//
//  Created by Rich Chau on 4/28/18.
//  Copyright © 2018 Yosimy Cortes. All rights reserved.
//

import UIKit
import Firebase

class TasksViewController: UITableViewController{
    
    
    var TableView: UITableView!
    var myPosts = [MyTaskPost]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Adding posts
        TableView = UITableView(frame: view.bounds, style: .plain)
        
        let cellNib = UINib(nibName: "MyTaskPostTableViewCell", bundle: nil)
        TableView.register(cellNib, forCellReuseIdentifier: "MyTaskPostTableViewCell")
        TableView.backgroundColor = UIColor(white: 0.90,alpha:1.0)
        view.addSubview(TableView)

        var layoutGuide:UILayoutGuide!

        if #available(iOS 11.0, *) {
            layoutGuide = view.safeAreaLayoutGuide
        } else {
            // Fallback on earlier versions
            layoutGuide = view.layoutMarginsGuide
        }

        TableView.translatesAutoresizingMaskIntoConstraints = false
        TableView.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor).isActive = true
        TableView.topAnchor.constraint(equalTo: layoutGuide.topAnchor).isActive = true
        TableView.trailingAnchor.constraint(equalTo:layoutGuide.trailingAnchor).isActive = true
        TableView.bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor).isActive = true

        TableView.delegate = self
        TableView.dataSource = self
        TableView.reloadData()

        print("calling observe post")
        observeMyPosts()
//        print("Hello")
    }
    
    func observeMyPosts() {
        let uid = (Auth.auth().currentUser?.uid)!
        print("Current user ID is " + uid)
        
        let postsRef = Database.database().reference().child("posts").queryOrdered(byChild: "timestamp")
        
        postsRef.observe(.value, with: { snapshot in
            var userID:String = (Auth.auth().currentUser?.uid)!
            var tempPosts = [MyTaskPost]()
            
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
                    let price = dict["price"] as? Int
                {
                    if uid == userID {
                        let userProfile1 = UserProfile(uid: uid, username: username, photoURL: url)
                        let post1 = MyTaskPost(id: childSnapshot.key, author: userProfile1, text: text, timestamp:timestamp,price: price)
                        tempPosts.append(post1)
                        print ("Displaying " + userID + " posts")
                    } else {
                        print("No Posts!")
                    }
                    
                    
                    
                }
            }
            
            self.myPosts = tempPosts
            self.TableView.reloadData()
            
        })
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myPosts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyTaskPostTableViewCell", for: indexPath) as! MyTaskPostTableViewCell
        cell.setMyTasks(myPost: myPosts[indexPath.row])
        return cell
    }
    
}
