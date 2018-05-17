//
//  TaskDetailsViewController.swift
//  HandsOn
//
//  Created by Rich Chau on 5/12/18.
//  Copyright © 2018 Yosimy Cortes. All rights reserved.
//

import UIKit

class TaskDetailsViewController : UIViewController {
    

    var scrollView: UIScrollView = {
        let v = UIScrollView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    var titleTextView : UITextView = {
        let textView = UITextView()
        textView.backgroundColor = UIColor.gray
        textView.isEditable = false
        textView.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    var descTextView : UITextView = {
        let textView = UITextView()
        textView.backgroundColor = UIColor.gray
        textView.isEditable = false
        textView.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    var addressLabel : UILabel = {
        var label = UILabel()
        label.backgroundColor = UIColor.gray
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = UIColor.lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var durationLabel : UILabel = {
        var label = UILabel()
        label.backgroundColor = UIColor.gray
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = UIColor.lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var taskImageView : UIImageView = {
        var imageView = UIImageView()
        imageView.backgroundColor = UIColor.gray
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
        label.textColor = UIColor.gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var priceLabel : UILabel = {
        var label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.backgroundColor = UIColor.gray
        label.textColor = UIColor.lightGray
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
        imageView.backgroundColor = UIColor.gray
        return imageView
    }()
    
    var nameLabel : UILabel = {
        var label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        
        
        setUpLayout()
        
    }
    
    private func setUpLayout(){
        
        titleTextView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 15).isActive = true
        titleTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        titleTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -100).isActive = true
        titleTextView.heightAnchor.constraint(equalToConstant: 75).isActive = true
        //titleTextView.widthAnchor.constraint(equalToConstant: 200).isActive = true
    
        
        addressLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        addressLabel.topAnchor.constraint(equalTo: titleTextView.bottomAnchor, constant: 3).isActive = true
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
        descTextView.heightAnchor.constraint(equalToConstant: 85).isActive = true
        
        offeredPriceLabel.topAnchor.constraint(equalTo: descTextView.bottomAnchor, constant: 20).isActive = true
        //offeredPriceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        offeredPriceLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
        offeredPriceLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        offeredPriceLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        priceLabel.topAnchor.constraint(equalTo: offeredPriceLabel.bottomAnchor, constant: 10).isActive = true
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
        
    }
    
}
