//
//  MoreViewController.swift
//  HandsOn
//
//  Created by Rich Chau on 5/9/18.
//  Copyright © 2018 Yosimy Cortes. All rights reserved.
//

import UIKit

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
        if (indexPath.row == 0){
            let profileView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
            //self.definesPresentationContext = true
            //profileView.modalPresentationStyle = .overCurrentContext
            self.present(profileView, animated: true, completion: nil)
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
