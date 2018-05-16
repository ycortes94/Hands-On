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

class NewPostViewController:UIViewController, UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
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
        view.backgroundColor = UIColor.darkGray
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
        button.addTarget(self, action: #selector(handlePostButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    let addImagesContainerView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let addImageButton : UIButton = {
        let button  = UIButton()
        button.setTitle("Add Images", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14.0, weight: UIFont.Weight.semibold)
        button.backgroundColor = UIColor.lightGray
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(addImage), for: .touchUpInside)
        return button
    }()
    
    let priceAndDurationContainerView : UIView = {
        
        let view = UIView()
        view.backgroundColor = UIColor.clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        assignbackground()
     
        stackView = UIStackView(arrangedSubviews: [titleLabel, titleTextField, descLabel,descTextField, priceAndDurationContainerView , locationLabel, locationTextField, addImagesLabel,addImagesContainerView,postButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 4

        
        view.addSubview(backgroundView)
        view.addSubview(stackView)

        priceAndDurationContainerView.addSubview(priceLabel)
        priceAndDurationContainerView.addSubview(priceTextField)
        priceAndDurationContainerView.addSubview(durationTextField)
        priceAndDurationContainerView.addSubview(durationLabel)
        
        addImagesContainerView.addSubview(addImagesImageView)
        addImagesContainerView.addSubview(addImageButton)
        
        setUpLayout()
        
        stackView.leftAnchor.constraint(equalTo: backgroundView.leftAnchor, constant: 30).isActive = true
        stackView.rightAnchor.constraint(equalTo: backgroundView.rightAnchor, constant: -30).isActive = true
        stackView.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 20).isActive = true
        stackView.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: -20).isActive = true
        
        
        //Keyboard hides when user taps anything but textfields
        //let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard (_:)))
        //self.view.addGestureRecognizer(tapGesture)
        
    }
    
    func setUpLayout(){
        
        
        backgroundView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        backgroundView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        backgroundView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        backgroundView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        backgroundView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 13).isActive = true
        backgroundView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -13).isActive = true
        
        
        let labelHeight : CGFloat = 25
        titleLabel.heightAnchor.constraint(equalToConstant: labelHeight).isActive = true
        descLabel.heightAnchor.constraint(equalToConstant: labelHeight).isActive = true
        priceLabel.heightAnchor.constraint(equalToConstant: labelHeight).isActive = true
        durationLabel.heightAnchor.constraint(equalToConstant: labelHeight).isActive = true
        locationLabel.heightAnchor.constraint(equalToConstant: labelHeight).isActive = true
        addImagesLabel.heightAnchor.constraint(equalToConstant: labelHeight).isActive = true
        
        let fieldHeight : CGFloat = 30
        titleTextField.heightAnchor.constraint(equalToConstant: fieldHeight).isActive = true
        durationTextField.heightAnchor.constraint(equalToConstant: fieldHeight).isActive = true
        priceTextField.heightAnchor.constraint(equalToConstant: fieldHeight).isActive = true
        locationTextField.heightAnchor.constraint(equalToConstant: fieldHeight).isActive = true
        
        
        let textFieldSpacing : CGFloat = 8
        stackView.setCustomSpacing(textFieldSpacing, after: titleTextField)
        stackView.setCustomSpacing(textFieldSpacing, after: descTextField)
        //stackView.setCustomSpacing(textFieldSpacing, after: priceTextField)
        stackView.setCustomSpacing(textFieldSpacing, after: locationTextField)
        //stackView.setCustomSpacing(textFieldSpacing, after: addImagesImageView)
        
        
        
        addImagesContainerView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        priceAndDurationContainerView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        priceLabel.leftAnchor.constraint(equalTo: priceAndDurationContainerView.leftAnchor, constant: 0).isActive = true
        priceLabel.topAnchor.constraint(equalTo: priceAndDurationContainerView.topAnchor, constant: 10).isActive = true
        
        priceTextField.leftAnchor.constraint(equalTo: priceLabel.leftAnchor, constant: 0).isActive = true
        priceTextField.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 5).isActive = true
        
        durationTextField.rightAnchor.constraint(equalTo: priceAndDurationContainerView.rightAnchor, constant: 0).isActive = true
        durationTextField.topAnchor.constraint(equalTo: priceTextField.topAnchor, constant: 0).isActive = true
        
        durationLabel.topAnchor.constraint(equalTo: priceAndDurationContainerView.topAnchor, constant: 10).isActive = true
        durationLabel.leftAnchor.constraint(equalTo: durationTextField.leftAnchor, constant: 0).isActive = true
        
        addImagesImageView.leftAnchor.constraint(equalTo: addImagesContainerView.leftAnchor, constant: 15).isActive = true
        addImagesImageView.centerYAnchor.constraint(equalTo: addImagesContainerView.centerYAnchor).isActive = true
        addImagesImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        addImagesImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        addImageButton.leftAnchor.constraint(equalTo: addImagesImageView.rightAnchor, constant: 20).isActive = true
        addImageButton.centerYAnchor.constraint(equalTo: addImagesImageView.centerYAnchor).isActive = true
        addImageButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
    
        
        
        descTextField.heightAnchor.constraint(equalToConstant: 85).isActive = true
        postButton.heightAnchor.constraint(equalToConstant: 35).isActive = true

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

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //textView.becomeFirstResponder()
        
        // Remove the nav shadow underline
        //navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    @objc private func addImage(){
        let image = UIImagePickerController()
        image.delegate = self
        
        image.sourceType = UIImagePickerControllerSourceType.photoLibrary
        image.allowsEditing = false
        
        self.present(image, animated: true){
            //after it is complete
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage{
            addImagesImageView.image = image
        }
        
        self.dismiss(animated: true)
    }
    
    
    //handle post button so far only saves the title of the task
    @objc private func handlePostButton() {
        
        print("post button clicked")
        guard let userProfile = UserService.currentUserProfile else { return }
        // Firebase code here
        
        let postRef = Database.database().reference().child("posts").childByAutoId()
        
        let postObject = [
            "author": [
                "uid": userProfile.uid,
                "username": userProfile.username,
                "photoURL": userProfile.photoURL.absoluteString
            ],
            "text": titleTextField.text!,
            "timestamp": [".sv":"timestamp"],
            "price" : Int(priceTextField.text!)!,
            "location": locationTextField.text!,
            "duration": Int(durationTextField.text!)!,
            "description": descTextField.text!
            ] as [String:Any]
        
        postRef.setValue(postObject, withCompletionBlock: { error, ref in
            if error == nil {
                self.dismiss(animated: true, completion: nil)
            } else {
                // Handle the error
                print("Error saving post")
            }
        })
    }
    
    
    override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        //textView.resignFirstResponder()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25, execute: {
            super.dismiss(animated: flag, completion: completion)
        })
    }
}

