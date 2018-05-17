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
        view.backgroundColor = UIColor.gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var cancelButton : UIButton = {
        
        let button = UIButton()
        button.setTitle("Cancel", for: .normal)
        button.backgroundColor = UIColor.lightGray
        button.addTarget(self, action: #selector(handleCancelButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.clear
        
        view.addSubview(popUpView)
        view.addSubview(cancelButton)

        setUpLayout()
    }
    
    private func setUpLayout(){
        
        popUpView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        popUpView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        popUpView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        popUpView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true
        popUpView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        cancelButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        cancelButton.topAnchor.constraint(equalTo: popUpView.bottomAnchor, constant: 10).isActive = true
        cancelButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 80).isActive = true
        cancelButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -80).isActive = true
        cancelButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    
        
    }
    
    @objc private func handleCancelButton(){
        self.dismiss(animated: true, completion: nil)
    }
    
}
