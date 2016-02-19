//
//  TwitterClient.swift
//  TwitterDemo
//
//  Created by kevaughn charles on 2/18/16.
//  Copyright © 2016 KCharles Inc. All rights reserved.
//

import UIKit
import BDBOAuth1Manager

class TwitterClient: BDBOAuth1SessionManager {
    
    static let sharedInstance = TwitterClient(baseURL: NSURL(string: "https://api.twitter.com")!, consumerKey: "7Jz6lYhrCUI2SCfbfDMoUnPaq", consumerSecret: "3dGe9TEKX8Dvt8OrjPAjVXbPRMhsN826jp5EU6JDtilslyoHtZ")

}
