//
//  ProfileViewController.swift
//  TwitterDemo
//
//  Created by kevaughn charles on 2/27/16.
//  Copyright © 2016 KCharles Inc. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var pThumbImageView: UIImageView!
    
    @IBOutlet weak var pNameLabel: UILabel!
    
    @IBOutlet weak var pUserNameLabel: UILabel!
    
    @IBOutlet weak var taglineLabel: UILabel!
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    @IBOutlet weak var followersCount: UILabel!
    
    @IBOutlet weak var followingCount: UILabel!
    
    @IBOutlet weak var tweetsCount: UILabel!
    
    
    
    
    var tweet: Tweet!

    override func viewDidLoad() {
        super.viewDidLoad()
        pThumbImageView.setImageWithURL(NSURL(string: tweet.user!.profileUrlString!)!)
        pNameLabel.text = tweet.user?.name
        pUserNameLabel.text = tweet.user?.screenname
        taglineLabel.text = tweet.user?.tagline
        backgroundImageView.setImageWithURL(NSURL(string: tweet.user!.backgroundUrlString!)!)
        followersCount.text = "\(tweet.user!.followersCount!)"
        followingCount.text = "\(tweet.user!.followingCount!)"
        tweetsCount.text = "\(tweet.user!.tweetsCount!)"
        
        
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
