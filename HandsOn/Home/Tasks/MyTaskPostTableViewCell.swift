//
//  MyTaskPostTableViewCell.swift
//  HandsOn
//
//  Created by Yosimy Cortes on 5/16/18.
//  Copyright © 2018 Yosimy Cortes. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class MyTaskPostTableViewCell: UITableViewCell {
    
    @IBOutlet weak var myusernameLabel: UILabel!
    @IBOutlet weak var mypostTextLabel: UILabel!
    @IBOutlet weak var mysubtitleLabel: UILabel!
    @IBOutlet weak var mypriceLabel: UILabel!
    
    @IBOutlet weak var myprofileImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        myprofileImageView.layer.cornerRadius = myprofileImageView.bounds.height / 2
        myprofileImageView.clipsToBounds = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    func setMyTasks(myPost:MyTaskPost) {
        ImageService.getImage(withURL: myPost.author.photoURL) { image in
            self.myprofileImageView.image = image
        }
        
        myusernameLabel.text = myPost.author.username
        mypostTextLabel.text = myPost.text
        mysubtitleLabel.text = String(myPost.timestamp)
        mypriceLabel.text = String(myPost.price)
    }
}
