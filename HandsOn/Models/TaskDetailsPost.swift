//
//  TaskDetailsPost.swift
//  HandsOn
//
//  Created by Yosimy Cortes on 5/16/18.
//  Copyright © 2018 Yosimy Cortes. All rights reserved.
//

import Foundation
import Firebase

class TaskDetailsPost {
    var id:String
    var author:UserProfile
    var text:String
    var timestamp:Double
    var price: Int
    var location: String
    var duration: Int
    var description: String
    var postID: String
    
    init(id:String, author:UserProfile,text:String,timestamp:Double, price: Int, location: String, duration: Int, description: String, postID: String) {
        self.id = id
        self.author = author
        self.text = text
        self.timestamp = timestamp
        self.price = price
        self.postID = postID
        self.duration = duration
        self.description = description
        self.location = location
        self.postID = postID
    }
}
