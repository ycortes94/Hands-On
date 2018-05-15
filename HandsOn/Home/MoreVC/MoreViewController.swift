//
//  MoreViewController.swift
//  HandsOn
//
//  Created by Rich Chau on 5/9/18.
//  Copyright © 2018 Yosimy Cortes. All rights reserved.
//

import UIKit
import FirebaseAuth

class MoreViewController: UITableViewController{
    
    let moreArray = ["Profile", "Activity Log", "Verification", "Settings", "Logout"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(MyCell.self, forCellReuseIdentifier: "cellId")
        self.tableView.tableFooterView = UIView()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moreArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        cell.textLabel?.text = moreArray[indexPath.item]
        cell.textLabel?.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //pushes profile view
        if (indexPath.row == 0){
            let profileView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
            if let navigator = navigationController{
                navigator.pushViewController(profileView, animated: false)
            }
        }
        
        //pushes activity log view
        if (indexPath.row == 1){
            let activityLogView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ActivityLogViewController") as! ActivityLogViewController
            if let navigator = navigationController{
                navigator.pushViewController(activityLogView, animated: false)
            }
        }
        
        //pushes verification view
        if (indexPath.row == 2){
            let verificationView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VerificationViewController") as! VerificationViewController
            if let navigator = navigationController{
                navigator.pushViewController(verificationView, animated: false)
            }
        }
        
        //pushes settings view
        if (indexPath.row == 3){
            let settingsView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SettingsViewController") as! SettingsViewController
            if let navigator = navigationController{
                navigator.pushViewController(settingsView, animated: false)
            }
        }
        
        //LOGOUT FUNCTIONALITY GOES HERE?
        if (indexPath.row == 4){
            print("Logout button tapped")
            try! Auth.auth().signOut()
            print("User Logged Out")
        }
    }
    
}


//custom cell
class MyCell : UITableViewCell{
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
