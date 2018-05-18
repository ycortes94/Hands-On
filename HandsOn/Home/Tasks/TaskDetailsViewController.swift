//
//  TaskDetailsViewController.swift
//  HandsOn
//
//  Created by Rich Chau on 5/12/18.
//  Copyright © 2018 Yosimy Cortes. All rights reserved.
//

import UIKit
import Firebase

class TaskDetailsViewController : UIViewController, UITableViewDelegate {
    
    var posts = [Post]()
    var scrollView: UIScrollView = {
        let v = UIScrollView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    var titleTextView : UITextView = {
        let textView = UITextView()
        textView.isEditable = false
        textView.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    var descTextView : UITextView = {
        let textView = UITextView()
        textView.isEditable = false
        textView.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textView.textColor = UIColor.gray
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    var addressLabel : UILabel = {
        var label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = UIColor.lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var durationLabel : UILabel = {
        var label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = UIColor.lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var taskImageView : UIImageView = {
        var imageView = UIImageView()
        imageView.layer.masksToBounds = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 5
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var offeredPriceLabel : UILabel = {
        var label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25, weight: .thin)
        label.text = "Offering Price:"
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var priceLabel : UILabel = {
        var label = UILabel()
        label.font = UIFont.systemFont(ofSize: 30, weight: .regular)
        label.textColor = UIColor.lightGray
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var offerPriceButton : UIButton = {
        var button = UIButton()
        button.setTitle("offer amount", for: .normal)
        button.setTitleColor(UIColor(red: 0.659, green: 0.659, blue: 0.659, alpha: 0.80), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16.0, weight: UIFont.Weight.semibold)
        button.backgroundColor = UIColor.clear
        button.layer.borderColor = UIColor(red: 0.659, green: 0.659, blue: 0.659, alpha: 0.80).cgColor
        button.layer.borderWidth = 3
        button.layer.cornerRadius = 2
        
        button.addTarget(self, action: #selector(handleOfferButton), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var profileImageView : UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(named: "profileplaceholder")
        imageView.layer.masksToBounds = false
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 22.5
        return imageView
    }()
    
    var nameLabel : UILabel = {
        var label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var line : UIView = {
        
        var lineView = UIView()
        lineView.backgroundColor = UIColor.lightGray
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
        
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Task Details"
        
        self.view.addSubview(scrollView)
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8.0).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 8.0).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -8.0).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8.0).isActive = true
        
        scrollView.contentSize = CGSize(width: scrollView.contentSize.width, height: 750)
        
        scrollView.addSubview(titleTextView)
        scrollView.addSubview(addressLabel)
        scrollView.addSubview(taskImageView)
        scrollView.addSubview(descTextView)
        scrollView.addSubview(offeredPriceLabel)
        scrollView.addSubview(priceLabel)
        scrollView.addSubview(offerPriceButton)
        scrollView.addSubview(profileImageView)
        scrollView.addSubview(durationLabel)
        scrollView.addSubview(line)
        
        
        setUpLayout()
        //observePosts()
        
    }
    
    private func setUpLayout(){
        
        titleTextView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 15).isActive = true
        titleTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        titleTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -100).isActive = true
        //titleTextView.heightAnchor.constraint(equalToConstant: 45).isActive = true
        //titleTextView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        let fixedWidth = titleTextView.frame.size.width
        let newSize = titleTextView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
        titleTextView.frame.size = CGSize(width: max(newSize.width, fixedWidth), height: newSize.height)
        
        addressLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 22).isActive = true
        addressLabel.topAnchor.constraint(equalTo: titleTextView.bottomAnchor, constant: -10).isActive = true
        addressLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        addressLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        profileImageView.topAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 15).isActive = true
        profileImageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 75).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 75).isActive = true
        
        taskImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        taskImageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
        taskImageView.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 10).isActive = true
        taskImageView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        
        descTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        descTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
        descTextView.topAnchor.constraint(equalTo: taskImageView.bottomAnchor, constant: 10).isActive = true
        //descTextView.heightAnchor.constraint(equalToConstant: 85).isActive = true
        let fixedWidth1 = descTextView.frame.size.width
        let newSize1 = descTextView.sizeThatFits(CGSize(width: fixedWidth1, height: CGFloat.greatestFiniteMagnitude))
        descTextView.frame.size = CGSize(width: max(newSize1.width, fixedWidth), height: newSize1.height)
        
        offeredPriceLabel.topAnchor.constraint(equalTo: descTextView.bottomAnchor, constant: 5).isActive = true
        //offeredPriceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        offeredPriceLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
        offeredPriceLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        offeredPriceLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        priceLabel.topAnchor.constraint(equalTo: offeredPriceLabel.bottomAnchor, constant: -15).isActive = true
        //priceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        priceLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
        priceLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        priceLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        offerPriceButton.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 15).isActive = true
        offerPriceButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        offerPriceButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        offerPriceButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        durationLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        durationLabel.topAnchor.constraint(equalTo: descTextView.bottomAnchor, constant: 30).isActive = true
        durationLabel.widthAnchor.constraint(equalToConstant: 75).isActive = true
        durationLabel.heightAnchor.constraint(equalToConstant: 75).isActive = true
        
        line.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25).isActive = true
        line.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25).isActive = true
        line.topAnchor.constraint(equalTo: descTextView.bottomAnchor, constant: 3).isActive = true
        line.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
    }
    
    /*
    func observePosts() {
        let postID = UUID().uuidString
        let postsRef = Database.database().reference().child("posts").child(postID)
        
        postsRef.observeSingleEvent(of:
            .value, with: { snapshot in
            
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
                    self.set(post: post)
                    tempPosts.append(post)
                    //self.tableView.reloadData()

                    
//                    let cell = tableView.dequeueReusableCell(withIdentifier: "posttableviewcell", for: IndexPath) as! PostTableViewCell
//                    //cell.selectionStyle = UITableViewCellSelectionStyle.none
//                    cell.contentView.backgroundColor = UIColor.clear
//                    cell.backgroundColor = UIColor(red: 0.659, green: 0.659, blue: 0.659, alpha: 0.70)
//
//                    let whiteRoundedView : UIView = UIView(frame: CGRect(x: 10, y: 8, width: self.view.frame.size.width - 20, height: 415))
//
//                    whiteRoundedView.layer.backgroundColor = UIColor(red: 0.972, green: 0.973, blue: 0.972, alpha: 1.0).cgColor
//                    whiteRoundedView.layer.masksToBounds = false
//                    whiteRoundedView.layer.cornerRadius = 8
//
//                    cell.contentView.addSubview(whiteRoundedView)
//                    cell.contentView.sendSubview(toBack: whiteRoundedView)
                    print ("post added to newsfeed")
                }
            }
            
            self.posts = tempPosts
        })
    }
    /*
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
 */
 
 */
    func set(post:Post) {
        ImageService.getImage(withURL: post.author.photoURL) { image in
            self.profileImageView.image = image
        }
        
        nameLabel.text = post.author.username
        titleTextView.text = post.text
        //        dateLabel.text = String(post.timestamp)
        priceLabel.text = "$" + String(post.price)
        descTextView.text = post.description
        addressLabel.text = post.location
        taskImageView.image = UIImage(named: "HandsOnBackground.jpg")
        durationLabel.text = String(post.duration)
    }
    

    
    @objc private func handleOfferButton(){
        let offerPopUpVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "OfferPricePopUpViewController") as! OfferPricePopUpViewControlelr
        self.present(offerPopUpVC, animated: true, completion: nil)
    }
    
}
