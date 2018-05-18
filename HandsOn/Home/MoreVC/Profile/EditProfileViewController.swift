//
//  EditProfileViewController.swift
//  HandsOn
//
//  Created by Rich Chau on 5/15/18.
//  Copyright © 2018 Yosimy Cortes. All rights reserved.
//

import UIKit

class EditProfileViewController : UIViewController , UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let handsOnLabel : UILabel = {
        
        let label = UILabel()
        label.text = "HandsOn"
        label.textColor = UIColor.clear
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        //label.backgroundColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false;
        
        return label
        
    }()
    
    let profileImageView : UIImageView = {
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "userIcon")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
        
    }()
    
    let tapToChangeLabel : UILabel = {
        
        let label = UILabel()
        label.text = "Tap to Change"
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false;
        
        return label
    }()
    
    let usernameTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "Username"
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.textColor = UIColor.white
        textField.backgroundColor = UIColor(red: 0.659, green: 0.659, blue: 0.659, alpha: 0.70)
        textField.layer.cornerRadius = 5
        textField.keyboardType = UIKeyboardType.emailAddress
        
        //adds left and right padding to textField
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 11, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 11, height: textField.frame.height))
        textField.rightViewMode = .always
        
        //textField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        
        textField.translatesAutoresizingMaskIntoConstraints = false;
        
        return textField
    }()
    
    let emailTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.textColor = UIColor.white
        textField.backgroundColor = UIColor(red: 0.659, green: 0.659, blue: 0.659, alpha: 0.70)
        textField.layer.cornerRadius = 5
        textField.keyboardType = UIKeyboardType.emailAddress
        
        //adds left and right padding to textField
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 11, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 11, height: textField.frame.height))
        textField.rightViewMode = .always
        
        //textField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        
        textField.translatesAutoresizingMaskIntoConstraints = false;
        return textField
    }()
    
    let passwordTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.textColor = UIColor.white
        textField.backgroundColor = UIColor(red: 0.659, green: 0.659, blue: 0.659, alpha: 0.70)
        textField.layer.cornerRadius = 5
        
        //adds left and right padding to textField
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 11, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 11, height: textField.frame.height))
        textField.rightViewMode = .always
        
        //textField.addTarget(self, action: #selector(), for: .editingChanged)
        
        //hides characters of password
        textField.isSecureTextEntry = true
        
        textField.translatesAutoresizingMaskIntoConstraints = false;
        
        return textField
    }()
    
    var cancelButton : UIButton = {
        
        let button = UIButton()
        button.setTitle("Cancel", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleCancelButton), for: .touchUpInside)
        return button
        
    }()
    
    var saveButton : UIButton = {
        
        let button = UIButton()
        button.setTitle("Save", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleSaveButton), for: .touchUpInside)
        return button
        
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.gray
        
        view.addSubview(handsOnLabel)
        view.addSubview(profileImageView)
        view.addSubview(tapToChangeLabel)
        view.addSubview(usernameTextField)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(cancelButton)
        view.addSubview(saveButton)
        
        
        setUpLayout()
        
    
    }
    
    private func setUpLayout(){
        
        handsOnLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        handsOnLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        handsOnLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        handsOnLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        profileImageView.topAnchor.constraint(equalTo: handsOnLabel.bottomAnchor, constant: 3).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 64).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 64).isActive = true
        
        tapToChangeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tapToChangeLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 2).isActive = true
        tapToChangeLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        tapToChangeLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        usernameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        usernameTextField.topAnchor.constraint(equalTo: tapToChangeLabel.bottomAnchor, constant: 4).isActive = true
        usernameTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        usernameTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        usernameTextField.heightAnchor.constraint(equalToConstant: 33).isActive = true
        
        emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emailTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 10).isActive = true
        emailTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        emailTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 33).isActive = true
        
        passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 10).isActive = true
        passwordTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        passwordTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 33).isActive = true
        
        saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        saveButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 10).isActive = true
        saveButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        saveButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        cancelButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        cancelButton.topAnchor.constraint(equalTo: saveButton.bottomAnchor, constant: 2).isActive = true
        cancelButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        cancelButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        
    }
    
    
    @objc private func handleCancelButton(){
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @objc private func handleSaveButton(){
        
    }
}
