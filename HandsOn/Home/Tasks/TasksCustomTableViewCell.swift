//
//  TasksCustomTableViewCell.swift
//  HandsOn
//
//  Created by Rich Chau on 5/15/18.
//  Copyright © 2018 Yosimy Cortes. All rights reserved.
//

import Foundation
import UIKit

class TasksCustomTableViewCell : UITableViewCell {
    
    var profileImage : UIImage?
    var taskImage : UIImage?
    var taskTitle : String?
    var priceLabel : String?
    var distanceLabel : String?
    
    var taskTitleView : UITextView = {
        var textView = UITextView()
        textView.isEditable = false
        textView.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    var priceLabelView : UITextView = {
        var textView = UITextView()
        textView.textAlignment = .center
        textView.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    var distanceLabelView : UITextView = {
        var textView = UITextView()
        textView.textAlignment = .center
        textView.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    var profileImageView : UIImageView = {
        var imageView = UIImageView()
        imageView.layer.masksToBounds = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 15
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var taskImageView : UIImageView = {
        var imageView = UIImageView()
        imageView.layer.masksToBounds = false
        imageView.layer.cornerRadius = 30
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(taskImageView)
        self.addSubview(profileImageView)
        self.addSubview(taskTitleView)
        self.addSubview(priceLabelView)
        self.addSubview(distanceLabelView)
        
        setUpLayout()
        
    }
    
    private func setUpLayout(){
        taskImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        taskImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        taskImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        taskImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        taskImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        profileImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        profileImageView.topAnchor.constraint(equalTo: taskImageView.centerYAnchor, constant: 0).isActive = true
        profileImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        taskTitleView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        taskTitleView.leftAnchor.constraint(equalTo: taskImageView.rightAnchor, constant: 5).isActive = true
        taskImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        taskTitleView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -75).isActive = true
        
        priceLabelView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        priceLabelView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        priceLabelView.bottomAnchor.constraint(equalTo: self.centerYAnchor, constant: -2).isActive = true
        priceLabelView.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        distanceLabelView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        distanceLabelView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        distanceLabelView.topAnchor.constraint(equalTo: self.centerYAnchor, constant: 2).isActive = true
        distanceLabelView.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if let taskTitle = taskTitle{
            taskTitleView.text = taskTitle
        }
        if let profileImage = profileImage{
            profileImageView.image = profileImage
        }
        if let taskImage = taskImage{
            taskImageView.image = taskImage
        }
        if let priceLabel = priceLabel{
            priceLabelView.text = priceLabel
        }
        if let distanceLabel = distanceLabel{
            distanceLabelView.text = distanceLabel
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
}
