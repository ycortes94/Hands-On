//
//  PostTableViewCell.swift
//  FirebaseApp
//
//  Created by Yosimy Cortes on 4/5/18.
//  Copyright © 2018 Yosimy Cortes. All rights reserved.
//
import UIKit

class PostTableViewCell: UITableViewCell {
    
    var profileImageView : UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(named: "profileplaceholder")
        imageView.layer.masksToBounds = false
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 22.5
        return imageView
    }()
    
    var taskTitleLabel : UILabel = {
        var label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
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
    
    var activityHeaderLabel : UILabel = {
        var label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var bookmarkButton : UIButton = {
        var button = UIButton()
        button.setImage(UIImage(named: "bookmark"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var priceLabel : UILabel = {
        var label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var addressLabel : UILabel = {
        var label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = UIColor.lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var descTextView : UITextView = {
        var textView = UITextView()
        textView.isEditable = false
        textView.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        textView.textColor = UIColor.gray
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = UIColor(red: 0.972, green: 0.973, blue: 0.972, alpha: 1.0)
        textView.isScrollEnabled = false
        return textView
    }()
    
    var viewTaskDetailsButton : UIButton = {
        var button = UIButton()
        button.setTitle("View Details", for: .normal)
        button.setTitleColor(UIColor(red: 0.659, green: 0.659, blue: 0.659, alpha: 0.80), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16.0, weight: UIFont.Weight.semibold)
        button.backgroundColor = UIColor.clear
        button.layer.borderColor = UIColor(red: 0.659, green: 0.659, blue: 0.659, alpha: 0.80).cgColor
        button.layer.borderWidth = 3
        button.layer.cornerRadius = 2
        
        button.addTarget(self, action: #selector(handleViewDetailsButton), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var dateLabel : UILabel = {
        var label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = UIColor.lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(profileImageView)
        self.addSubview(activityHeaderLabel)
        self.addSubview(dateLabel)
        self.addSubview(bookmarkButton)
        self.addSubview(taskImageView)
        self.addSubview(taskTitleLabel)
        self.addSubview(priceLabel)
        self.addSubview(addressLabel)
        self.addSubview(descTextView)
        self.addSubview(viewTaskDetailsButton)
        
        setUpLayout()
        
    }
    
    private func setUpLayout(){
        
        profileImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        profileImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 45).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 45).isActive = true
        
        activityHeaderLabel.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor, constant: -5).isActive = true
        activityHeaderLabel.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 10).isActive = true
        activityHeaderLabel.widthAnchor.constraint(equalToConstant: 225).isActive = true
        activityHeaderLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        dateLabel.topAnchor.constraint(equalTo: activityHeaderLabel.bottomAnchor, constant: 1).isActive = true
        dateLabel.leftAnchor.constraint(equalTo: activityHeaderLabel.leftAnchor, constant: 0).isActive = true
        dateLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        dateLabel.heightAnchor.constraint(equalToConstant: 10).isActive = true
        
        bookmarkButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        bookmarkButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        bookmarkButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        bookmarkButton.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor).isActive = true
        
        taskImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 25).isActive = true
        taskImageView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -25).isActive = true
        taskImageView.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 10).isActive = true
        taskImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        taskTitleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 27).isActive = true
        taskTitleLabel.topAnchor.constraint(equalTo: taskImageView.bottomAnchor, constant: 8).isActive = true
        taskTitleLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        taskTitleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -70).isActive = true
        
        priceLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -27).isActive = true
        priceLabel.centerYAnchor.constraint(equalTo: taskTitleLabel.centerYAnchor, constant: 0).isActive = true
        priceLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        priceLabel.widthAnchor.constraint(equalToConstant: 45).isActive = true
        
        addressLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 27).isActive = true
        addressLabel.topAnchor.constraint(equalTo: taskTitleLabel.bottomAnchor, constant: 2).isActive = true
        addressLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        addressLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        descTextView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 26).isActive = true
        descTextView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -26).isActive = true
        descTextView.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 0).isActive = true
        descTextView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        viewTaskDetailsButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 26).isActive = true
        viewTaskDetailsButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -26).isActive = true
        viewTaskDetailsButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -22).isActive = true
        viewTaskDetailsButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func set(post:Post) {
        ImageService.getImage(withURL: post.author.photoURL) { image in
            self.profileImageView.image = image
        }
        
        activityHeaderLabel.text = post.author.username + " posted a task."
        taskTitleLabel.text = post.text
        dateLabel.text = String(post.timestamp)
        priceLabel.text = "$" + String(post.price)
        descTextView.text = post.description
        addressLabel.text = post.location
        taskImageView.image = UIImage(named: "HandsOnBackground.jpg")
        //durationLabel.text = String(post.duration)
    }
    
    @objc func handleViewDetailsButton(){
        print("tapped")
    }
    
    
    
}
