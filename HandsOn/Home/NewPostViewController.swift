//
//  NewPostViewController.swift
//  FirebaseApp
//
//  Created by Yosimy Cortes on 4/5/18.
//  Copyright © 2018 Yosimy Cortes. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class NewPostViewController:UIViewController, UITextViewDelegate {
    
    var stackView : UIStackView!
    
    let backgroundView : UIView = {
        
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.976, green: 0.977, blue: 0.976, alpha: 1.0)
        view.layer.cornerRadius = 7
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        
    }()
    
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.text = "Title of Task"
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let titleTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter a title"
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.textColor = UIColor.black
        textField.backgroundColor = UIColor.clear
        textField.layer.cornerRadius = 5
        textField.layer.borderWidth = 2.5
        textField.layer.borderColor = UIColor(red: 0.737, green: 0.737, blue: 0.737, alpha: 1.0).cgColor
        
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 11, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 11, height: textField.frame.height))
        textField.rightViewMode = .always
        
        textField.translatesAutoresizingMaskIntoConstraints = false;
        return textField
    }()
    
    let descLabel : UILabel = {
        let label = UILabel()
        label.text = "Task Description"
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descTextField : UITextView = {
        let textField = UITextView()
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.textColor = UIColor.black
        textField.backgroundColor = UIColor.clear
        textField.layer.cornerRadius = 5
        textField.layer.borderWidth = 2.5
        textField.layer.borderColor = UIColor(red: 0.737, green: 0.737, blue: 0.737, alpha: 1.0).cgColor
        
        textField.translatesAutoresizingMaskIntoConstraints = false;
        return textField
    }()
    
    let priceLabel : UILabel = {
        let label = UILabel()
        label.text = "Offered Price"
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let priceTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter a price"
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.textColor = UIColor.black
        textField.backgroundColor = UIColor.clear
        textField.layer.cornerRadius = 5
        textField.layer.borderWidth = 2.5
        textField.layer.borderColor = UIColor(red: 0.737, green: 0.737, blue: 0.737, alpha: 1.0).cgColor
        
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 11, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 11, height: textField.frame.height))
        textField.rightViewMode = .always
        
        textField.translatesAutoresizingMaskIntoConstraints = false;
        return textField
    }()
    
    let durationLabel : UILabel = {
        let label = UILabel()
        label.text = "Duration"
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let durationTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter in days"
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.textColor = UIColor.black
        textField.backgroundColor = UIColor.clear
        textField.layer.cornerRadius = 5
        textField.layer.borderWidth = 2.5
        textField.layer.borderColor = UIColor(red: 0.737, green: 0.737, blue: 0.737, alpha: 1.0).cgColor
        
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 11, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 11, height: textField.frame.height))
        textField.rightViewMode = .always
        
        textField.translatesAutoresizingMaskIntoConstraints = false;
        return textField
    }()
    
    let locationLabel : UILabel = {
        let label = UILabel()
        label.text = "Location of Task"
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let locationTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter a location"
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.textColor = UIColor.black
        textField.backgroundColor = UIColor.clear
        textField.layer.cornerRadius = 5
        textField.layer.borderWidth = 2.5
        textField.layer.borderColor = UIColor(red: 0.737, green: 0.737, blue: 0.737, alpha: 1.0).cgColor
        
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 11, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 11, height: textField.frame.height))
        textField.rightViewMode = .always
        
        textField.translatesAutoresizingMaskIntoConstraints = false;
        return textField
    }()
    
    let addImagesLabel : UILabel = {
        let label = UILabel()
        label.text = "Add Images"
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let addImagesImageView : UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "HandsOnBackground")
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    
    let postButton : UIButton = {
        let button = UIButton()
        button.setTitle("Preview and Post", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14.0, weight: UIFont.Weight.semibold)
        button.titleLabel?.textColor = UIColor.black
        button.backgroundColor = UIColor(red: 0.737, green: 0.737, blue: 0.737, alpha: 1.0)
        button.layer.cornerRadius = 3
        button.addTarget(self, action: #selector(testPrint), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    
    
    let textView : UITextView = {
        let view = UITextView()
        view.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        view.textColor = UIColor.white
        view.backgroundColor = UIColor.blue
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let cancelButton : UIButton = {
        let button = UIButton()
        button.setTitle("Cancel", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16.0, weight: UIFont.Weight.semibold)
        button.titleLabel?.textColor = UIColor.white
        button.backgroundColor = UIColor.blue
        button.addTarget(self, action: #selector(handleCancelButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    let doneButton : UIButton = {
        let button = UIButton()
        button.setTitle("Done", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16.0, weight: UIFont.Weight.semibold)
        button.titleLabel?.textColor = UIColor.white
        button.backgroundColor = UIColor.orange
        button.addTarget(self, action: #selector(handlePostButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        assignbackground()
        /*
        let priceContentView = UIStackView(arrangedSubviews: [durationLabel, durationTextField])
        priceContentView.translatesAutoresizingMaskIntoConstraints = false
        priceContentView.axis = .horizontal
        priceContentView.distribution = .fillProportionally
        priceContentView.spacing = 4
        
        
        let durationContentView = UIStackView(arrangedSubviews: [priceLabel, priceTextField])
        durationContentView.translatesAutoresizingMaskIntoConstraints = false
        durationContentView.axis = .vertical
        durationContentView.distribution = .fillProportionally
        durationContentView.spacing = 4
 
        
        let priceAndDurationContentViews = UIStackView(arrangedSubviews: [priceContentView, durationContentView])
        durationContentView.translatesAutoresizingMaskIntoConstraints = false
        durationContentView.axis = .horizontal
        durationContentView.distribution = .fill
        durationContentView.spacing = 20
        */
        
        stackView = UIStackView(arrangedSubviews: [titleLabel, titleTextField, descLabel,descTextField, priceLabel, priceTextField, locationLabel, locationTextField, addImagesLabel,addImagesImageView ,postButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 4
 
        
        
        view.addSubview(backgroundView)
        view.addSubview(stackView)
        view.addSubview(textView)
        view.addSubview(doneButton)
        view.addSubview(cancelButton)
        setUpLayout()
        
        
        stackView.leftAnchor.constraint(equalTo: backgroundView.leftAnchor, constant: 30).isActive = true
        stackView.rightAnchor.constraint(equalTo: backgroundView.rightAnchor, constant: -30).isActive = true
        stackView.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 20).isActive = true
        stackView.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: -20).isActive = true
        
        
        textView.delegate = self
        
        //Keyboard hides when user taps anything but textfields
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard (_:)))
        self.view.addGestureRecognizer(tapGesture)
        
    }
    
    func setUpLayout(){
        
        
        backgroundView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        backgroundView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        backgroundView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        backgroundView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        backgroundView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 13).isActive = true
        backgroundView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -13).isActive = true
        
        
        textView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textView.topAnchor.constraint(equalTo: view.bottomAnchor, constant: 100).isActive = true
        textView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        textView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        cancelButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        cancelButton.centerYAnchor.constraint(equalTo: textView.bottomAnchor, constant: 5).isActive = true
        cancelButton.widthAnchor.constraint(equalToConstant: 75).isActive = true
        cancelButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        doneButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        doneButton.topAnchor.constraint(equalTo: cancelButton.bottomAnchor, constant: 5).isActive = true
        doneButton.widthAnchor.constraint(equalToConstant: 75).isActive = true
        doneButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        let labelHeight : CGFloat = 25
        titleLabel.heightAnchor.constraint(equalToConstant: labelHeight).isActive = true
        descLabel.heightAnchor.constraint(equalToConstant: labelHeight).isActive = true
        priceLabel.heightAnchor.constraint(equalToConstant: labelHeight).isActive = true
        //durationLabel.heightAnchor.constraint(equalToConstant: labelHeight).isActive = true
        locationLabel.heightAnchor.constraint(equalToConstant: labelHeight).isActive = true
        addImagesLabel.heightAnchor.constraint(equalToConstant: labelHeight).isActive = true
        
        let fieldHeight : CGFloat = 30
        titleTextField.heightAnchor.constraint(equalToConstant: fieldHeight).isActive = true
        //durationTextField.heightAnchor.constraint(equalToConstant: fieldHeight).isActive = true
        priceTextField.heightAnchor.constraint(equalToConstant: fieldHeight).isActive = true
        locationTextField.heightAnchor.constraint(equalToConstant: fieldHeight).isActive = true
        
        
        let textFieldSpacing : CGFloat = 8
        stackView.setCustomSpacing(textFieldSpacing, after: titleTextField)
        stackView.setCustomSpacing(textFieldSpacing, after: descTextField)
        stackView.setCustomSpacing(textFieldSpacing, after: priceTextField)
        stackView.setCustomSpacing(textFieldSpacing, after: locationTextField)
        stackView.setCustomSpacing(textFieldSpacing, after: addImagesImageView)
        
        addImagesImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        descTextField.heightAnchor.constraint(equalToConstant: 85).isActive = true
        postButton.heightAnchor.constraint(equalToConstant: 35).isActive = true

    }
    
    @objc func testPrint(){
        print(1)
    }
    
    func assignbackground(){
        let background = UIImage(named: "HandsOnBackground.jpg")
        
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIViewContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubview(toBack: imageView)
        
        let blurEffect = UIBlurEffect(style: .dark)
        let blurredEffectView = UIVisualEffectView(effect: blurEffect)
        blurredEffectView.alpha = 0.4
        blurredEffectView.frame = self.view.bounds
        self.view.addSubview(blurredEffectView)
    }

    @objc func dismissKeyboard (_ sender: UITapGestureRecognizer) {
        textView.resignFirstResponder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //textView.becomeFirstResponder()
        
        // Remove the nav shadow underline
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    
    
    
    
    
    
    @objc private func handlePostButton() {
        
        guard let userProfile = UserService.currentUserProfile else { return }
        // Firebase code here
        
        let postRef = Database.database().reference().child("posts").childByAutoId()
        
        let postObject = [
            "author": [
                "uid": userProfile.uid,
                "username": userProfile.username,
                "photoURL": userProfile.photoURL.absoluteString
            ],
            "text": textView.text,
            "timestamp": [".sv":"timestamp"]
            ] as [String:Any]
        
        postRef.setValue(postObject, withCompletionBlock: { error, ref in
            if error == nil {
                self.dismiss(animated: true, completion: nil)
            } else {
                // Handle the error
            }
        })
    }
    
    
    @objc private func handleCancelButton() {
        textView.text = ""
    }
    
    
    override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        textView.resignFirstResponder()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25, execute: {
            super.dismiss(animated: flag, completion: completion)
        })
    }
}

