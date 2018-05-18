//
//  TasksViewController.swift
//  HandsOn
//
//  Created by Rich Chau on 4/28/18.
//  Copyright © 2018 Yosimy Cortes. All rights reserved.
//

import UIKit
import Firebase
import MapKit
import CoreLocation

class TasksViewController: UITableViewController{
    
    
    //var TableView: UITableView!
    var posts = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let btn1 = UIButton(type: .custom)
        btn1.setImage(UIImage(named: "map"), for: .normal)
        btn1.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        btn1.addTarget(self, action: #selector(handleMapButton), for: .touchUpInside)
        let item1 = UIBarButtonItem(customView: btn1)
        self.navigationItem.setRightBarButton(item1, animated: true)
    
        observePosts()
        
        self.tableView.register(MyTaskPostTableViewCell.self, forCellReuseIdentifier: "taskpostcell")
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 100
    }
    /*
    func observeMyPosts() {
        let uid = (Auth.auth().currentUser?.uid)!
        print("Current user ID is " + uid)
        
        let postsRef = Database.database().reference().child("posts").queryOrdered(byChild: "timestamp")
        
        postsRef.observe(.value, with: { snapshot in
            let userID:String = (Auth.auth().currentUser?.uid)!
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
            self.tableView.reloadData()
            
        })
    }
 */
    
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
                    let description = dict["description"] as? String,
                    let latitude = dict["coordLat"] as? CLLocationDegrees,
                    let longitude = dict["coordLong"] as? CLLocationDegrees
                {
                    
                    let userProfile = UserProfile(uid: uid, username: username, photoURL: url)
                    let post = Post(id: childSnapshot.key, author: userProfile, text: text, timestamp:timestamp,price: price, location: location, duration: duration, description: description,latitude: latitude, longitude: longitude)
                    tempPosts.append(post)
                    
                    print ("post added to newsfeed")
                }
            }
            
            self.posts = tempPosts
            self.tableView.reloadData()
            
        })
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskpostcell", for: indexPath) as! MyTaskPostTableViewCell
        cell.set(post: posts[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let taskDetailsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TaskDetailsViewController") as! TaskDetailsViewController
        
        taskDetailsVC.set(post: posts[indexPath.row])
        
        if let navigator = navigationController{
            navigator.pushViewController(taskDetailsVC, animated: true)
        }
    }
    
    
    @objc private func handleMapButton(){
        
        let mapView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MapViewController") as! MapViewController
        if let navigator = navigationController{
            navigator.pushViewController(mapView, animated: false)
        }
        
    }
    
}
