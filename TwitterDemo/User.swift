//
//  User.swift
//  TwitterDemo
//
//  Created by kevaughn charles on 2/18/16.
//  Copyright © 2016 KCharles Inc. All rights reserved.
//

import UIKit

class User: NSObject {
    
    var name: String?
    var screenname: String?
    var profileUrl: NSURL?
    var tagline: String?
    var dictionary: NSDictionary?
    var profileUrlString: String?
    var backgroundUrlString: String?
    var followersCount: Int?
    var followingCount: Int?
    var tweetsCount: Int?
    
    
    init(dictionary: NSDictionary){
        self.dictionary = dictionary
        
        name = dictionary["name"] as? String
        screenname = dictionary["screen_name"] as? String
        profileUrlString = dictionary["profile_image_url_https"] as? String
        
        tagline = dictionary["description"] as? String
        
        backgroundUrlString = dictionary["profile_background_image_url_https"] as? String
        
        followersCount = (dictionary["followers_count"] as? Int) ?? 0
        followingCount = dictionary["friends_count"] as? Int
        tweetsCount = dictionary["statuses_count"] as? Int

        
    }
    
    static let userDidLogoutNotification = "UserDidLogout"
    
    static var _currentUser: User?
    
    class var currentUser: User?{
        get{
            if _currentUser == nil{
                let defaults = NSUserDefaults.standardUserDefaults()
        
                let userData = defaults.objectForKey("currentUserData") as? NSData
        
                if let userData = userData{
                    let dictionary = try! NSJSONSerialization.JSONObjectWithData(userData, options: []) as! NSDictionary
                    _currentUser = User(dictionary: dictionary)
                }
            }
            return _currentUser
            
        
        
        
        
        }
        set(user){
            _currentUser = user
            let defaults = NSUserDefaults.standardUserDefaults()
            
            if let user = user{
                let data = try! NSJSONSerialization.dataWithJSONObject(user.dictionary!, options: [])
            
                defaults.setObject(data, forKey: "currentUserData")
            }else{
                defaults.setObject(nil, forKey: "currentUser")
            }
            
            
            
            defaults.synchronize()
        }
        
    }

}
