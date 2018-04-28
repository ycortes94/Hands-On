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

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(textView)
        view.addSubview(doneButton)
        view.addSubview(cancelButton)
        setUpLayout()
        
        textView.delegate = self
        
        //Keyboard hides when user taps anything but textfields
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard (_:)))
        self.view.addGestureRecognizer(tapGesture)
        
    }
    
    func setUpLayout(){
        
        textView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
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
    
    /*
    func textViewDidChange(_ textView: UITextView) {
        placeHolderLabel.isHidden = !textView.text.isEmpty
    }
     */
}

