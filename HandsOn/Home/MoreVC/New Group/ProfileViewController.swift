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
    
    
    let locationLabel : UILabel = {
        
        let label = UILabel()
        label.backgroundColor = UIColor.lightGray
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.text = "San Jose, CA"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Profile"
        let editButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.edit, target: self, action: #selector(editDescription))
        navigationItem.rightBarButtonItem = editButton
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        backgroundImageView.isUserInteractionEnabled = true
        backgroundImageView.addGestureRecognizer(tapGestureRecognizer)
        
        view.addSubview(backgroundImageView)
        view.addSubview(profileImageView)
        view.addSubview(nameLabel)
        view.addSubview(descriptionTextView)
        view.addSubview(locationLabel)
        
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
        nameLabel.topAnchor.constraint(equalTo: backgroundImageView.bottomAnchor, constant: 12).isActive = true
        
        locationLabel.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 15).isActive = true
        locationLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 2).isActive = true
        
        descriptionTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        descriptionTextView.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 20).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        descriptionTextView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        print("image tapped")
        // Your action
    }

    
    @objc func editDescription(){
        
        let editPostVC = storyboard?.instantiateViewController(withIdentifier: "EditProfileViewController") as! EditProfileViewController
        self.present(editPostVC, animated: true, completion: nil)
        
    }
    
}
