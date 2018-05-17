//
//  OfferPricePopUpViewController.swift
//  HandsOn
//
//  Created by Rich Chau on 5/16/18.
//  Copyright © 2018 Yosimy Cortes. All rights reserved.
//

import UIKit

class OfferPricePopUpViewControlelr : UIViewController {
    
    var popUpView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.976, green: 0.977, blue: 0.976, alpha: 1.0)
        view.layer.cornerRadius = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var cancelButton : UIButton = {
        
        let button = UIButton()

        let origImage = UIImage(named: "cancel")
        let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
        button.setImage(tintedImage, for: .normal)
        button.tintColor = UIColor.white
        
        button.backgroundColor = UIColor.lightGray
        button.layer.cornerRadius = 3
        button.addTarget(self, action: #selector(handleCancelButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        
    }()
    
    var makeOfferButton : UIButton = {
        
        let button = UIButton()
        button.setTitle("Make Offer", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        button.backgroundColor = UIColor.lightGray
        button.layer.cornerRadius = 3
        button.addTarget(self, action: #selector(handleOfferButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        
    }()
    
    var priceTextField : UITextField = {
        
        let field = UITextField()
        field.backgroundColor = UIColor.clear
        field.textAlignment = .center
        field.layer.cornerRadius = 4
        field.textColor = UIColor.gray
        field.font = UIFont.systemFont(ofSize: 45, weight: .thin)
        field.translatesAutoresizingMaskIntoConstraints = false
        
        field.addTarget(self, action: #selector(myTextFieldDidChange), for: .editingChanged)
        
        return field
        
    }()
    
    
    var lineView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.50)
        
        view.addSubview(popUpView)
        view.addSubview(cancelButton)
        view.addSubview(makeOfferButton)
        view.addSubview(priceTextField)
        view.addSubview(lineView)

        setUpLayout()
    }
    
    private func setUpLayout(){
        
        popUpView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        popUpView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        popUpView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        popUpView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true
        popUpView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        cancelButton.bottomAnchor.constraint(equalTo: popUpView.bottomAnchor, constant: -10).isActive = true
        cancelButton.rightAnchor.constraint(equalTo: popUpView.rightAnchor, constant: -10).isActive = true
        cancelButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        cancelButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        makeOfferButton.leftAnchor.constraint(equalTo: popUpView.leftAnchor, constant: 10).isActive = true
        makeOfferButton.bottomAnchor.constraint(equalTo: popUpView.bottomAnchor, constant: -10).isActive = true
        makeOfferButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        makeOfferButton.rightAnchor.constraint(equalTo: cancelButton.leftAnchor, constant: -15).isActive = true
        
        priceTextField.leftAnchor.constraint(equalTo: popUpView.leftAnchor, constant: 55).isActive = true
        priceTextField.rightAnchor.constraint(equalTo: popUpView.rightAnchor, constant: -55).isActive = true
        priceTextField.topAnchor.constraint(equalTo: popUpView.topAnchor, constant: 30).isActive = true
        priceTextField.heightAnchor.constraint(equalToConstant: 85).isActive = true
        
        lineView.leftAnchor.constraint(equalTo: priceTextField.leftAnchor, constant: 0).isActive = true
        lineView.rightAnchor.constraint(equalTo: priceTextField.rightAnchor, constant: 0).isActive = true
        lineView.topAnchor.constraint(equalTo: priceTextField.bottomAnchor, constant: -4).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: 2).isActive = true
        
    }
    
    @objc private func handleCancelButton(){
        self.dismiss(animated: true, completion: nil)
    }
    
    //perform action when offer button is pressed
    @objc private func handleOfferButton(){
        print("Offer Button tapped")
    }
    
    @objc func myTextFieldDidChange(_ textField: UITextField) {
        
        if let amountString = textField.text?.currencyInputFormatting() {
            textField.text = amountString
        }
    }
    
    
}

extension String {
    
    // formatting text for currency textField
    func currencyInputFormatting() -> String {
        
        var number: NSNumber!
        let formatter = NumberFormatter()
        formatter.numberStyle = .currencyAccounting
        formatter.currencySymbol = "$"
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        
        var amountWithPrefix = self
        
        // remove from String: "$", ".", ","
        let regex = try! NSRegularExpression(pattern: "[^0-9]", options: .caseInsensitive)
        amountWithPrefix = regex.stringByReplacingMatches(in: amountWithPrefix, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.characters.count), withTemplate: "")
        
        let double = (amountWithPrefix as NSString).doubleValue
        number = NSNumber(value: (double / 100))
        
        // if first number is 0 or all numbers were deleted
        guard number != 0 as NSNumber else {
            return ""
        }
        
        return formatter.string(from: number)!
    }
}
