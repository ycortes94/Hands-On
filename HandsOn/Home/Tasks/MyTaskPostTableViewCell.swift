//
//  MyTaskPostTableViewCell.swift
//  HandsOn
//
//  Created by Yosimy Cortes on 5/16/18.
//  Copyright © 2018 Yosimy Cortes. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class MyTaskPostTableViewCell: UITableViewCell {
    
    var taskTitleLabel : UILabel = {
       
        var label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.backgroundColor = UIColor.clear
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    var priceLabel : UILabel = {
        
        var label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.textAlignment = .center
        label.backgroundColor = UIColor.clear
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    var profileImageView : UIImageView = {
        var imageView = UIImageView()
        imageView.layer.masksToBounds = false
        imageView.backgroundColor = UIColor.lightGray
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 15
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var distanceLabelView : UITextView = {
        var textView = UITextView()
        textView.textAlignment = .center
        textView.backgroundColor = UIColor.lightGray
        textView.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    var taskImageView : UIImageView = {
        var imageView = UIImageView()
        imageView.layer.masksToBounds = false
        imageView.backgroundColor = UIColor.gray
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 30
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        self.addSubview(taskImageView)
        self.addSubview(profileImageView)
        self.addSubview(taskTitleLabel)
        self.addSubview(priceLabel)
        self.addSubview(distanceLabelView)
        
        setUpLayout()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpLayout(){
        
        taskImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        taskImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        taskImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        taskImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        taskImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        profileImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        profileImageView.topAnchor.constraint(equalTo: taskImageView.centerYAnchor, constant: 0).isActive = true
        profileImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        taskTitleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        taskTitleLabel.leftAnchor.constraint(equalTo: taskImageView.rightAnchor, constant: 5).isActive = true
        taskTitleLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        taskTitleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -75)
        
        priceLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        priceLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        priceLabel.bottomAnchor.constraint(equalTo: self.centerYAnchor, constant: -2).isActive = true
        priceLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        distanceLabelView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        distanceLabelView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        distanceLabelView.topAnchor.constraint(equalTo: self.centerYAnchor, constant: 2).isActive = true
        distanceLabelView.heightAnchor.constraint(equalToConstant: 25).isActive = true
    }
    
   
    
    func set(post:Post) {
        ImageService.getImage(withURL: post.author.photoURL) { image in
            self.profileImageView.image = image
        }
        
        //myusernameLabel.text = myPost.author.username
        taskTitleLabel.text = post.text
        //mysubtitleLabel.text = String(myPost.timestamp)
        priceLabel.text = "$" + String(post.price)
        
    }
 
  
}
