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
    let score: String
    let scoreDate: String
    
    // App Specific properties can be added here
    
    init(uid: String, name: String, email: String, captions: Array<Any>, score: String, scoreDate: String) {
        self.uid = uid
        self.name = name
        self.email = email
        self.captions = captions
        self.score = score
        self.scoreDate = scoreDate
    }

}

extension FBUser {
    init?(documentData: [String : Any]) {
        let uid = documentData[FBKeys.User.uid] as? String ?? ""
        let name = documentData[FBKeys.User.name] as? String ?? ""
        let email = documentData[FBKeys.User.email] as? String ?? ""
        let captions = documentData[FBKeys.User.captions] as? Array<Any> ?? []
        let score = documentData[FBKeys.User.score] as? String ?? ""
        let scoreDate = documentData[FBKeys.User.scoreDate] as? String ?? ""
        
        // Make sure you also initialize any app specific properties if you have them

        
        self.init(uid: uid,
                  name: name,
                  email: email,
                  captions: captions,
                  score: score,
                  scoreDate: scoreDate
                  // Dont forget any app specific ones here too
        )
    }
    
    static func dataDict(uid: String, name: String, email: String, captions: Array<Any>, score: String, scoreDate: String) -> [String: Any] {
        var data: [String: Any]
        
        // If name is not "" this must be a new entry so add all first time data
        if name != "" {
            data = [
                FBKeys.User.uid: uid,
                FBKeys.User.name: name,
                FBKeys.User.email: email,
                FBKeys.User.captions: captions,
                FBKeys.User.score: score,
                FBKeys.User.scoreDate: scoreDate
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
