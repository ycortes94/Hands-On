//
//  LoginViewController.swift
//  CloudFunctions
//
//  Created by Yosimy Cortes on 4/5/18.
//  Copyright © 2018 Yosimy Cortes. All rights reserved.
//

import Foundation
import UIKit
import Firebase


class LoginViewController:UIViewController, UITextFieldDelegate {
    
    //@IBOutlet weak var emailTextField: UITextField!
    //@IBOutlet weak var passwordTextField: UITextField!
    
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
    
    var activityView:UIActivityIndicatorView!
    
    let emailTextField : UITextField = {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.textColor = UIColor.white
        
        textField.backgroundColor = UIColor(red: 0.659, green: 0.659, blue: 0.659, alpha: 0.80)
        textField.layer.cornerRadius = 5
        textField.keyboardType = UIKeyboardType.emailAddress
        textField.translatesAutoresizingMaskIntoConstraints = false;
        return textField
    }()
    
    let passwordTextField : UITextField = {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.textColor = UIColor.white
        textField.backgroundColor = UIColor(red: 0.659, green: 0.659, blue: 0.659, alpha: 0.80)
        textField.layer.cornerRadius = 5
        textField.translatesAutoresizingMaskIntoConstraints = false;
        return textField
    }()

    var loginButton:UIButton = {
        let button = UIButton()
        button.setTitle("Log in", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16.0, weight: UIFont.Weight.semibold)
        button.titleLabel?.textColor = UIColor.white
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.layer.borderColor = UIColor.white.cgColor
        button.addTarget(self, action: #selector(handleSignIn), for: .touchUpInside)
        button.alpha = 0.8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        
    }()
    
    let registerButton : UIButton = {
        let button = UIButton()
        button.setTitle("Don't have an account? Sign up.", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        button.setBackgroundColor(color: UIColor(red: 0.659, green: 0.659, blue: 0.659, alpha: 0.80), forUIControlState: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleRegisterButton), for: .touchUpInside)
        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
        view.addSubview(handsOnLabel)
        view.addSubview(registerButton)
        view.addSubview(loginButton)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        setloginButton(enabled: false)
        
        setUpLayout()
        
        activityView = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        activityView.color = secondaryColor
        activityView.frame = CGRect(x: 0, y: 0, width: 50.0, height: 50.0)
        activityView.center = loginButton.center
        view.addSubview(activityView)
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        emailTextField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard (_:)))
        self.view.addGestureRecognizer(tapGesture)
        
        
    }
    
    //positions components
    private func setUpLayout(){
        
        handsOnLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        handsOnLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 160).isActive = true
        handsOnLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        handsOnLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emailTextField.topAnchor.constraint(equalTo: handsOnLabel.bottomAnchor, constant: 4).isActive = true
        emailTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        emailTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 33).isActive = true
        
        passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 10).isActive = true
        passwordTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        passwordTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 33).isActive = true
        
        registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        registerButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        registerButton.widthAnchor.constraint(equalToConstant: self.view.frame.size.width ).isActive = true
        registerButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 10).isActive = true
        loginButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        loginButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 33).isActive = true
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //emailTextField.becomeFirstResponder()
        //NotificationCenter.default.addObserver(self, selector:#selector(keyboardWillAppear), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        NotificationCenter.default.removeObserver(self)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        get {
            return .lightContent
        }
    }
    
    @objc private func handleRegisterButton(){
        
        let signUpView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        self.present(signUpView, animated: false, completion: nil)
        
    }
    
    /**
     Adjusts the center of the **loginButton** above the keyboard.
     - Parameter notification: Contains the keyboardFrame info.
     */
    
    
    //@objc func keyboardWillAppear(notification: NSNotification){
        
        //let info = notification.userInfo!
        //let keyboardFrame: CGRect = (info[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        
        //loginButton.center = CGPoint(x: view.center.x,
        //                                y: view.frame.height - keyboardFrame.height - 16.0 - loginButton.frame.height / 2)
        //activityView.center = loginButton.center
    //}
    
    
    @objc func dismissKeyboard (_ sender: UITapGestureRecognizer) {
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }
    
    /**
     Enables the continue button if the **username**, **email**, and **password** fields are all non-empty.
     
     - Parameter target: The targeted **UITextField**.
     */
    
    @objc func textFieldChanged(_ target:UITextField) {
        let email = emailTextField.text
        let password = passwordTextField.text
        let formFilled = email != nil && email != "" && password != nil && password != ""
        setloginButton(enabled: formFilled)
    }
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        // Resigns the target textField and assigns the next textField in the form.
        
        switch textField {
        case emailTextField:
            emailTextField.resignFirstResponder()
            passwordTextField.becomeFirstResponder()
            break
        case passwordTextField:
            handleSignIn()
            break
        default:
            break
        }
        return true
    }
    
    /**
     Enables or Disables the **loginButton**.
     */
    
    func setloginButton(enabled:Bool) {
        if enabled {
            loginButton.alpha = 1.0
            loginButton.isEnabled = true
        } else {
            loginButton.alpha = 1.0
            loginButton.isEnabled = false
        }
    }
    
    @objc func handleSignIn() {
        guard let email = emailTextField.text else { return }
        guard let pass = passwordTextField.text else { return }
        
        setloginButton(enabled: false)
        loginButton.setTitle("", for: .normal)
        activityView.startAnimating()
        
        Auth.auth().signIn(withEmail: email, password: pass) { user, error in
            if error == nil && user != nil {
                self.dismiss(animated: false, completion: nil)
            } else {
                print("Error logging in: \(error!.localizedDescription)")

                self.resetForm()
            }
        }
    }
    
    func resetForm() {
        let alert = UIAlertController(title: "Error logging in", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
        setloginButton(enabled: true)
        loginButton.setTitle("Continue", for: .normal)
        activityView.stopAnimating()
    }

}
