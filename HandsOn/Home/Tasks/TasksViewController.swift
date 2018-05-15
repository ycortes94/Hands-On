//
//  TasksViewController.swift
//  HandsOn
//
//  Created by Rich Chau on 4/28/18.
//  Copyright © 2018 Yosimy Cortes. All rights reserved.
//

import UIKit

struct CellData {
    let profileImage : UIImage
    let taskImage : UIImage
    let taskTitle : String
    let priceLabel : String
    let distanceLabel : String
}

class TasksViewController: UITableViewController{
    
    var data = [CellData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //test data, to be filled with data from firebase...
        data = [CellData.init(profileImage: #imageLiteral(resourceName: "profileplaceholder"), taskImage: #imageLiteral(resourceName: "HandsOnBackground"), taskTitle: "Task Title", priceLabel: "$0", distanceLabel: "2.5 mi")]
        
        self.tableView.register(TasksCustomTableViewCell.self, forCellReuseIdentifier: "custom")
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 200
        
        tableView.tableFooterView = UIView()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "custom") as! TasksCustomTableViewCell
        cell.profileImage = data[indexPath.row].profileImage
        cell.taskImage = data[indexPath.row].taskImage
        cell.taskTitle = data[indexPath.row].taskTitle
        cell.priceLabel = data[indexPath.row].priceLabel
        cell.distanceLabel = data[indexPath.row].distanceLabel
        cell.layoutSubviews()
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return data.count
    }
    
}
