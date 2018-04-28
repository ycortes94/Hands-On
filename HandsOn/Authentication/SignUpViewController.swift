//
//  SignUpViewController.swift
//  CloudFunctions
//
//  Created by Yosimy Cortes on 4/5/18.
//  Copyright © 2018 Yosimy Cortes. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class SignUpViewController:UIViewController, UITextFieldDelegate {
    
   
    var activityView:UIActivityIndicatorView!
    var imagePicker:UIImagePickerController!
    
    let handsOnLabel : UILabel = {
        
        let label = UILabel()
        label.text = "HandsOn"
        label.textColor = UIColor.white
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
        
        textField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        
        textField.translatesAutoresizingMaskIntoConstraints = false;
        
        return textField
    }()
    
    let emailTextField : UITextField = {
        let textField = UITextField()
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
        
        textField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        
        textField.translatesAutoresizingMaskIntoConstraints = false;
        return textField
    }()
    
    let passwordTextField : UITextField = {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.textColor = UIColor.white
        textField.backgroundColor = UIColor(red: 0.659, green: 0.659, blue: 0.659, alpha: 0.70)
        textField.layer.cornerRadius = 5
        
        //adds left and right padding to textField
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 11, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 11, height: textField.frame.height))
        textField.rightViewMode = .always
        
        textField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        
        //hides characters of password
        textField.isSecureTextEntry = true
        
        textField.translatesAutoresizingMaskIntoConstraints = false;
        
        return textField
    }()
    
    var registerButton:UIButton = {
        let button = UIButton()
        button.setTitle("Register", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16.0, weight: UIFont.Weight.semibold)
        button.titleLabel?.textColor = UIColor.white
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.layer.borderColor = UIColor.white.cgColor
        button.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        button.alpha = 0.8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        
    }()
    
    let loginButton : UIButton = {
        
        let button = UIButton()
        button.setTitle("Have an account? Sign in.", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        button.setBackgroundColor(color: UIColor(red: 0.659, green: 0.659, blue: 0.659, alpha: 0.80), forUIControlState: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleLoginButton), for: .touchUpInside)
        return button
        
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "HandsOnBackground.jpg")!)
        let blurEffect = UIBlurEffect(style: .dark)
        let blurredEffectView = UIVisualEffectView(effect: blurEffect)
        blurredEffectView.alpha = 0.6
        blurredEffectView.frame = self.view.bounds
        view.addSubview(blurredEffectView)
        
        view.addSubview(handsOnLabel)
        view.addSubview(profileImageView)
        view.addSubview(tapToChangeLabel)
        view.addSubview(usernameTextField)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(registerButton)
        view.addSubview(loginButton)
        setUpLayout()
        

        setregisterButton(enabled: false)
        
        activityView = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        activityView.color = secondaryColor
        activityView.frame = CGRect(x: 0, y: 0, width: 50.0, height: 50.0)
        activityView.center = registerButton.center
        view.addSubview(activityView)
        
        usernameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        let imageTap = UITapGestureRecognizer(target: self, action: #selector(openImagePicker))
        profileImageView.isUserInteractionEnabled = true
        profileImageView.addGestureRecognizer(imageTap)
        profileImageView.layer.cornerRadius = profileImageView.bounds.height / 2
        profileImageView.clipsToBounds = true
        //tapToChangeProfileButton.addTarget(self, action: #selector(openImagePicker), for: .touchUpInside)
        
        imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        
        //Keyboard hides when user taps anything but textfields
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard (_:)))
        self.view.addGestureRecognizer(tapGesture)
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
        
        registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        registerButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 10).isActive = true
        registerButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        registerButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        registerButton.heightAnchor.constraint(equalToConstant: 33).isActive = true
        
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        loginButton.widthAnchor.constraint(equalToConstant: self.view.frame.size.width ).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    
    @objc func dismissKeyboard (_ sender: UITapGestureRecognizer) {
        usernameTextField.resignFirstResponder()
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }
    
    @objc private func handleLoginButton(){
        self.dismiss(animated: false, completion: nil)
    }
    
    @objc func openImagePicker(_ sender:Any) {
        // Open Image Picker
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //usernameTextField.becomeFirstResponder()
        NotificationCenter.default.addObserver(self, selector:#selector(keyboardWillAppear), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        usernameTextField.resignFirstResponder()
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        
        NotificationCenter.default.removeObserver(self)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        get {
            return .lightContent
        }
    }
 
    /**
     Adjusts the center of the **registerButton** above the keyboard.
     - Parameter notification: Contains the keyboardFrame info.
     */
    
    
    @objc func keyboardWillAppear(notification: NSNotification){
        
        let info = notification.userInfo!
        let keyboardFrame: CGRect = (info[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        //registerButton.center = CGPoint(x: view.center.x,
                                        //y: view.frame.height - keyboardFrame.height - 16.0 - registerButton.frame.height / 2)
        activityView.center = registerButton.center
    }
    
    /**
     Enables the continue button if the **username**, **email**, and **password** fields are all non-empty.
     
     - Parameter target: The targeted **UITextField**.
     */
    
    @objc func textFieldChanged(_ target:UITextField) {
        let username = usernameTextField.text
        let email = emailTextField.text
        let password = passwordTextField.text
        let formFilled = username != nil && username != "" && email != nil && email != "" && password != nil && password != ""
        setregisterButton(enabled: formFilled)
    }
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
         // Resigns the target textField and assigns the next textField in the form.

        switch textField {
        case usernameTextField:
            usernameTextField.resignFirstResponder()
            emailTextField.becomeFirstResponder()
            break
        case emailTextField:
            emailTextField.resignFirstResponder()
            passwordTextField.becomeFirstResponder()
            break
        case passwordTextField:
            handleSignUp()
            break
        default:
            break
        }
        return true
    }
    
    /**
     Enables or Disables the **registerButton**.
     */
    
    func setregisterButton(enabled:Bool) {
        if enabled {
            registerButton.alpha = 1.0
            registerButton.isEnabled = true
        } else {
            registerButton.alpha = 1.0
            registerButton.isEnabled = false
        }
    }
    
    @objc func handleSignUp() {
        guard let username = usernameTextField.text else { return }
        guard let email = emailTextField.text else { return }
        guard let pass = passwordTextField.text else { return }
        guard let image = profileImageView.image else { return }
        
        setregisterButton(enabled: false)
        registerButton.setTitle("", for: .normal)
        activityView.startAnimating()
        
        Auth.auth().createUser(withEmail: email, password: pass) { user, error in
            if error == nil && user != nil {
                print("User created!")
                
            
                // 1. Upload the profile image to Firebase Storage
                
                self.uploadProfileImage(image) { url in
                    
                    if url != nil {
                        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                        changeRequest?.displayName = username
                        changeRequest?.photoURL = url
                        
                        changeRequest?.commitChanges { error in
                            if error == nil {
                                print("User display name changed!")
                                
                                self.saveProfile(username: username, profileImageURL: url!) { success in
                                    if success {
                                        self.dismiss(animated: true, completion: nil)
                                    } else {
                                        self.resetForm()
                                    }
                                }
                                
                            } else {
                                print("Error: \(error!.localizedDescription)")
                                self.resetForm()
                            }
                        }
                    } else {
                        self.resetForm()
                    }
                    
                }
                
            } else {
                self.resetForm()
            }
        }
    }
    
    func resetForm() {
        let alert = UIAlertController(title: "Error signing up", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
        setregisterButton(enabled: true)
        registerButton.setTitle("Continue", for: .normal)
        activityView.stopAnimating()
    }
    
    func uploadProfileImage(_ image:UIImage, completion: @escaping ((_ url:URL?)->())) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let storageRef = Storage.storage().reference().child("user/\(uid)")
        
        guard let imageData = UIImageJPEGRepresentation(image, 0.75) else { return }
        
        
        let metaData = StorageMetadata()
        metaData.contentType = "image/jpg"
        
        storageRef.putData(imageData, metadata: metaData) { metaData, error in
            if error == nil, metaData != nil {
                if let url = metaData?.downloadURL() {
                    completion(url)
                } else {
                    completion(nil)
                }
                // success!
            } else {
                // failed
                completion(nil)
            }
        }
    }
    
    func saveProfile(username:String, profileImageURL:URL, completion: @escaping ((_ success:Bool)->())) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let databaseRef = Database.database().reference().child("users/profile/\(uid)")
        
        let userObject = [
            "username": username,
            "photoURL": profileImageURL.absoluteString
        ] as [String:Any]
        
        databaseRef.setValue(userObject) { error, ref in
            completion(error == nil)
        }
    }
}

extension SignUpViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let pickedImage = info[UIImagePickerControllerEditedImage] as? UIImage {
            self.profileImageView.image = pickedImage
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    
}
