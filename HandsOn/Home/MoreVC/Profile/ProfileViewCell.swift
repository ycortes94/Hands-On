//
//  ProfileViewCell.swift
//  HandsOn
//
//  Created by Yosimy Cortes on 5/17/18.
//  Copyright © 2018 Yosimy Cortes. All rights reserved.
//

import UIKit

class ProfileViewCell: UITableViewCell {
    
    let backgroundImageView : UIImageView  = {
        
        let imageView = UIImageView()
        //imageView.image = UIImage(named: "HandsOnBackground.jpg")
        imageView.backgroundColor = UIColor.gray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
        
        
    }()
    
    let profileImageView : UIImageView = {
        
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.lightGray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
        
    }()
    
    let nameLabel : UILabel = {
        
        let label = UILabel()
        label.backgroundColor = UIColor.lightGray
        label.text = "Rich Chau"
        label.font = UIFont.systemFont(ofSize: 25, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    let descriptionTextView : UITextView = {
        
        let view = UITextView()
        view.backgroundColor = UIColor.lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        view.isEditable = false
        return view
        
    }()
    
    
    let locationLabel : UILabel = {
        
        let label = UILabel()
        label.backgroundColor = UIColor.lightGray
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.text = "San Jose, CA"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
//    var profileImageView : UIImageView = {
//        var imageView = UIImageView()
//        imageView.image = UIImage(named: "profileplaceholder")
//        imageView.layer.masksToBounds = false
//        imageView.clipsToBounds = true
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.layer.cornerRadius = 22.5
//        return imageView
//    }()
    
    var addressLabel : UILabel = {
        var label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = UIColor.lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(profileImageView)
        self.addSubview(addressLabel)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        backgroundImageView.isUserInteractionEnabled = true
        backgroundImageView.addGestureRecognizer(tapGestureRecognizer)
        
        self.addSubview(backgroundImageView)
        self.addSubview(profileImageView)
        self.addSubview(nameLabel)
        self.addSubview(descriptionTextView)
        self.addSubview(locationLabel)
        setUpLayout()
        
    }
    
    private func setUpLayout() {
        
        backgroundImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        backgroundImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        backgroundImageView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        backgroundImageView.heightAnchor.constraint(equalToConstant: 130).isActive = true
        
        profileImageView.centerYAnchor.constraint(equalTo: backgroundImageView.bottomAnchor, constant: 0).isActive = true
        profileImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 130).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 130).isActive = true
        profileImageView.layer.cornerRadius = profileImageView.frame.size.height/2
        
        nameLabel.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 15).isActive = true
        nameLabel.topAnchor.constraint(equalTo: backgroundImageView.bottomAnchor, constant: 12).isActive = true
        
        locationLabel.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 15).isActive = true
        locationLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 2).isActive = true
        
        descriptionTextView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        descriptionTextView.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 20).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 30).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -30).isActive = true
        descriptionTextView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        addressLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 27).isActive = true
        addressLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        addressLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        print("image tapped")
        // Your action
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func set(post:Post) {
        ImageService.getImage(withURL: post.author.photoURL) { image in
            self.profileImageView.image = image
        }
        
        addressLabel.text = post.location
        //durationLabel.text = String(post.duration)
    }
    
    @objc func handleViewDetailsButton(){
        print("tapped")
    }
    
    
    
}
