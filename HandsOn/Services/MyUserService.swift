//
//  MyUserService.swift
//  HandsOn
//
//  Created by Yosimy Cortes on 5/16/18.
//  Copyright © 2018 Yosimy Cortes. All rights reserved.
//

import Foundation
import Firebase

class MyUserService {
    
    static var currentUserProfile:UserProfile?
    
    static func observeMyUserProfile(_ uid:String, completion: @escaping ((_ userProfile:UserProfile?)->())) {
        let userRef = Database.database().reference().child("users/profile/\(uid)")
        
        userRef.observe(.value, with: { snapshot in
            var userProfile:UserProfile?
            
            if let dict = snapshot.value as? [String:Any],
                let username = dict["username"] as? String,
                let photoURL = dict["photoURL"] as? String,
                let url = URL(string:photoURL) {
                
                userProfile = UserProfile(uid: snapshot.key, username: username, photoURL: url)
            }
            
            completion(userProfile)
        })
    }
    
}
