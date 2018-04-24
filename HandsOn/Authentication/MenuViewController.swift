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
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    
    
    let handsOnLabel : UILabel = {
       
        let label = UILabel()
        label.text = "HandsOn"
        label.textColor = UIColor.white
        label.textAlignment = .center
        //label.backgroundColor = UIColor.gray
        label.font = UIFont(name: "Helvetica-Bold", size: 55)
        label.translatesAutoresizingMaskIntoConstraints = false;

        return label
        
    }()
    
    
    let subLabel : UILabel = {
        
        let label1 = UILabel()
        label1.text = "getting things done"
        label1.textColor = UIColor.white
        label1.textAlignment = .center
        //label1.backgroundColor = UIColor.gray
        label1.font = UIFont(name: "Helvetica", size: 25)
        label1.translatesAutoresizingMaskIntoConstraints = false;
        
        return label1
        
    }()
 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add the HandsOn label
        self.view.addSubview(handsOnLabel)
        self.view.addSubview(subLabel)
        setUpLayout()
        
        // Add the background gradient
        //view.addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "HandsOnBackground.jpg")!)

    }
    
    private func setUpLayout(){
        handsOnLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        handsOnLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        handsOnLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        handsOnLabel.heightAnchor.constraint(equalToConstant: 75).isActive = true
        
        
        subLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        subLabel.topAnchor.constraint(equalTo: handsOnLabel.topAnchor, constant: 35).isActive = true
        subLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        subLabel.heightAnchor.constraint(equalToConstant: 75).isActive = true
        
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
