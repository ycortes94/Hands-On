//
//  File.swift
//  HandsOn
//
//  Created by Yosimy Cortes on 5/16/18.
//  Copyright © 2018 Yosimy Cortes. All rights reserved.
//

import Foundation

class MyTaskPost {
    var id:String
    var author:UserProfile
    var text:String
    var timestamp:Double
    var price: Int
    
    init(id:String, author:UserProfile,text:String,timestamp:Double, price: Int) {
        self.id = id
        self.author = author
        self.text = text
        self.timestamp = timestamp
        self.price = price
    }
}
