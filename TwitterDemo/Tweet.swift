//
//  Tweet.swift
//  TwitterDemo
//
//  Created by kevaughn charles on 2/18/16.
//  Copyright © 2016 KCharles Inc. All rights reserved.
//

import UIKit

class Tweet: NSObject {
    
    var text: NSString?
    var timestamp: NSDate?
    var retweetCount: Int = 0
    var favoritesCount: Int = 0
    
    init(dictionary: NSDictionary){
        text = dictionary["text"] as? String
        
        retweetCount = (dictionary["retweet_count"] as? Int) ?? 0
        favoritesCount = (dictionary["favourites_count"] as? Int) ?? 0
        
        let timestampString = dictionary["created_at"] as? String
        
        let formatter = NSDateFormatter()
        formatter.dateFormat = "EEE MMM d HH:mm:ss Z y"
    }

}