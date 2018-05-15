//
//  ProfileViewController.swift
//  HandsOn
//
//  Created by Rich Chau on 5/9/18.
//  Copyright © 2018 Yosimy Cortes. All rights reserved.
//

import UIKit

class ProfileViewController : UIViewController{
    
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
    
    let editDescButton : UIButton = {
        
        let button = UIButton()
        button.titleLabel?.text = "Edit Description"
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        button.addTarget(self, action: #selector(editDescription), for: .touchUpInside)
        button.backgroundColor = UIColor.lightGray
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Profile"
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        backgroundImageView.isUserInteractionEnabled = true
        backgroundImageView.addGestureRecognizer(tapGestureRecognizer)
        
        view.addSubview(backgroundImageView)
        view.addSubview(profileImageView)
        view.addSubview(nameLabel)
        view.addSubview(descriptionTextView)
        view.addSubview(editDescButton)
        
        setUpLayout()
        
    }
    
    private func setUpLayout() {

        backgroundImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        backgroundImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        backgroundImageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        backgroundImageView.heightAnchor.constraint(equalToConstant: 130).isActive = true
        
        profileImageView.centerYAnchor.constraint(equalTo: backgroundImageView.bottomAnchor, constant: 0).isActive = true
        profileImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 130).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 130).isActive = true
        profileImageView.layer.cornerRadius = profileImageView.frame.size.height/2
        
        nameLabel.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 15).isActive = true
        nameLabel.topAnchor.constraint(equalTo: backgroundImageView.bottomAnchor, constant: 15).isActive = true
        
        descriptionTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        descriptionTextView.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 20).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        descriptionTextView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        editDescButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        editDescButton.topAnchor.constraint(equalTo: descriptionTextView.bottomAnchor, constant: 10).isActive = true
        editDescButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        editDescButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        print("image tapped")
        // Your action
    }
    
    @objc func editDescription(){
        print("edit desc button tapped")
    }
    
}
