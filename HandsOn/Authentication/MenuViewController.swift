//
//  ViewController.swift
//  FirebaseDemo
//
//  Created by Yosimy Cortes on 4/5/18.
//  Copyright © 2018 Yosimy Cortes. All rights reserved.
//

import UIKit
import Firebase

class MenuViewController: UIViewController {
    
    //@IBOutlet weak var loginButton: UIButton!
    //@IBOutlet weak var signupButton: UIButton!
    
    //hands on label properties
    let handsOnLabel : UILabel = {
        
        let label = UILabel()
        label.text = "HandsOn"
        label.textColor = UIColor.white
        label.textAlignment = .center
        //label.backgroundColor = UIColor.gray
        label.font = UIFont.systemFont(ofSize: 55, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false;
        
        return label
        
    }()
    
    //sublabel properties
    let subLabel : UILabel = {
        
        let label1 = UILabel()
        label1.text = "getting things done"
        label1.textColor = UIColor.white
        label1.textAlignment = .center
        //label1.backgroundColor = UIColor.gray
        label1.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label1.translatesAutoresizingMaskIntoConstraints = false;
        
        return label1
        
    }()
    
    //Get started button properties
    let getStartedButton : UIButton = {
        
        let button = UIButton()
        button.setTitle("Get Started", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        button.setBackgroundColor(color: UIColor(red: 0.659, green: 0.659, blue: 0.659, alpha: 0.80), forUIControlState: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false;
        button.addTarget(self, action: #selector(getStartedButtonClicked), for: .touchUpInside)
        return button
        
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        assignbackground()
        
        // Add the HandsOn label
        self.view.addSubview(handsOnLabel)
        self.view.addSubview(subLabel)
        self.view.addSubview(getStartedButton)
        setUpLayout()
        
        // Add the background gradient
        //view.addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
        
    }
    
    private func setUpLayout(){
        handsOnLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        handsOnLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 225).isActive = true
        handsOnLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        handsOnLabel.heightAnchor.constraint(equalToConstant: 75).isActive = true
        
        subLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        subLabel.topAnchor.constraint(equalTo: handsOnLabel.topAnchor, constant: 40).isActive = true
        subLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        subLabel.heightAnchor.constraint(equalToConstant: 75).isActive = true
        
        getStartedButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        getStartedButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        getStartedButton.widthAnchor.constraint(equalToConstant: self.view.frame.size.width ).isActive = true
        getStartedButton.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
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
    
    //Presents log in view after get started is pressed
    @objc private func getStartedButtonClicked(){
        
        let loginView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.present(loginView, animated: false, completion: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        get {
            return .lightContent
        }
    }
    
}
