//
//  Post.swift
//  FirebaseApp
//
//  Created by Yosimy Cortes on 4/5/18.
//  Copyright © 2018 Yosimy Cortes. All rights reserved.
//

import Foundation


class Post {
    var id:String
    var author:UserProfile
    var text:String
    var timestamp:Double
    var price: String
    var location: String
    var duration: Int
    var description: String
    
    init(id:String, author:UserProfile,text:String,timestamp:Double, price: String, location: String, duration: Int, description: String) {
        self.id = id
        self.author = author
        self.text = text
        self.timestamp = timestamp
        self.price = price
        self.duration = duration
        self.description = description
        self.location = location
    }
}
