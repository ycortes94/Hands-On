//
//  EditProfileViewController.swift
//  HandsOn
//
//  Created by Rich Chau on 5/15/18.
//  Copyright © 2018 Yosimy Cortes. All rights reserved.
//

import UIKit

class EditProfileViewController : UIViewController , UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let cancelButton : UIButton = {
        
        let button = UIButton()
        button.setTitle("Cancel", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16.0, weight: UIFont.Weight.semibold)
        button.titleLabel?.textColor = UIColor.white
        button.backgroundColor = UIColor(red: 0.737, green: 0.737, blue: 0.737, alpha: 1.0)
        button.layer.cornerRadius = 3
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleCancelButton), for: .touchUpInside)
        return button
        
    }()
    
    let saveButton : UIButton = {
        
        let button = UIButton()
        button.setTitle("Save", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16.0, weight: UIFont.Weight.semibold)
        button.titleLabel?.textColor = UIColor.white
        button.backgroundColor = UIColor(red: 0.737, green: 0.737, blue: 0.737, alpha: 1.0)
        button.layer.cornerRadius = 3
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleSaveButton), for: .touchUpInside)
        return button
        
    }()
    
    let descTextView : UITextView = {
       
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 15.0, weight: .regular)
        textView.text = "Tell people about yourself."
        textView.textColor = UIColor.lightGray
        textView.backgroundColor = UIColor(red: 0.737, green: 0.737, blue: 0.737, alpha: 0.5)
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
        
    }()
    
    let backgroundImageView : UIImageView = {
       
        let image = UIImageView()
        image.backgroundColor = UIColor.gray
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
        
    }()
    
    let editLabel : UILabel = {
        
        let label = UILabel()
        label.textColor = UIColor.black
        label.text = "Edit Profile"
        label.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    let tapToEditLabel : UILabel = {
       
        let label = UILabel()
        label.textColor = UIColor.gray
        label.text = "Tap to add image"
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        backgroundImageView.isUserInteractionEnabled = true
        backgroundImageView.addGestureRecognizer(tapGestureRecognizer)
        
        view.addSubview(editLabel)
        view.addSubview(tapToEditLabel)
        view.addSubview(backgroundImageView)
        view.addSubview(descTextView)
        view.addSubview(cancelButton)
        view.addSubview(saveButton)
        setupLayout()
        
        descTextView.delegate = self
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard (_:)))
        self.view.addGestureRecognizer(tapGesture)
        
    }
    
    private func setupLayout(){
        
        editLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        editLabel.heightAnchor.constraint(equalToConstant: 75).isActive = true
        editLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
        editLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
        
        cancelButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        cancelButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        cancelButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        cancelButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        cancelButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        saveButton.bottomAnchor.constraint(equalTo: cancelButton.topAnchor, constant: -10).isActive = true
        saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        saveButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        saveButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        saveButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        backgroundImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        backgroundImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        backgroundImageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
        backgroundImageView.topAnchor.constraint(equalTo: editLabel.bottomAnchor, constant: 15).isActive = true
        backgroundImageView.heightAnchor.constraint(equalToConstant: 125).isActive = true
        
        tapToEditLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        tapToEditLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        tapToEditLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
        tapToEditLabel.bottomAnchor.constraint(equalTo: backgroundImageView.topAnchor, constant: -2).isActive = true
        
        descTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        descTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        descTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
        descTextView.topAnchor.constraint(equalTo: backgroundImageView.bottomAnchor, constant: 15).isActive = true
        descTextView.bottomAnchor.constraint(equalTo: saveButton.topAnchor, constant: -75).isActive = true
        
    }
    
    @objc private func handleSaveButton(){
        
        print("Save Button pressed")
        
    }
    
    @objc private func handleCancelButton(){
        
        print("Cencel Button pressed")
        self.dismiss(animated: true, completion: nil)
        
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Tell people about yourself."
            textView.textColor = UIColor.lightGray
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let newText = (textView.text as NSString).replacingCharacters(in: range, with: text)
        return newText.count <= 100
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        addImage()
        // Your action
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
            backgroundImageView.image = image
        }
        
        self.dismiss(animated: true)
    }

    
    @objc func dismissKeyboard (_ sender: UITapGestureRecognizer) {
        descTextView.resignFirstResponder()
    }
    
}
