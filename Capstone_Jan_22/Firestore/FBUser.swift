//
//  FBUser.swift
//  Signin With Apple
//
//  Created by Stewart Lynch on 2020-03-18.
//  Copyright © 2020 CreaTECH Solutions. All rights reserved.
//

import Foundation

struct FBUser {
    let uid: String
    let name: String
    let email: String
    let captions: Array<Any>
    
    // App Specific properties can be added here
    
    init(uid: String, name: String, email: String, captions: Array<Any>) {
        self.uid = uid
        self.name = name
        self.email = email
        self.captions = captions
    }

}

extension FBUser {
    init?(documentData: [String : Any]) {
        let uid = documentData[FBKeys.User.uid] as? String ?? ""
        let name = documentData[FBKeys.User.name] as? String ?? ""
        let email = documentData[FBKeys.User.email] as? String ?? ""
        let captions = documentData[FBKeys.User.captions] as? Array<Any> ?? []
        
        // Make sure you also initialize any app specific properties if you have them

        
        self.init(uid: uid,
                  name: name,
                  email: email,
                  captions: captions
                  // Dont forget any app specific ones here too
        )
    }
    
    static func dataDict(uid: String, name: String, email: String, captions: Array<Any>) -> [String: Any] {
        var data: [String: Any]
        
        // If name is not "" this must be a new entry so add all first time data
        if name != "" {
            data = [
                FBKeys.User.uid: uid,
                FBKeys.User.name: name,
                FBKeys.User.email: email,
                FBKeys.User.captions: captions
                // Again, include any app specific properties that you want stored on creation
            ]
        } else {
            // This is a subsequent entry so only merge uid and email so as not
            // to overrwrite any other data.
            data = [
                FBKeys.User.uid: uid,
                FBKeys.User.email: email
            ]
        }
        return data
    }
}
