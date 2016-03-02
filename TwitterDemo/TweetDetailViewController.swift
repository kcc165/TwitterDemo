//
//  TweetDetailViewController.swift
//  TwitterDemo
//
//  Created by kevaughn charles on 2/22/16.
//  Copyright © 2016 KCharles Inc. All rights reserved.
//

import UIKit

class TweetDetailViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var thumbImageView: UIImageView!
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var tweetLabel: UILabel!
    
    @IBOutlet weak var retweetButton: UIButton!
    
    @IBOutlet weak var favoriteButton: UIButton!
    
    @IBOutlet weak var retweetCountLabel: UILabel!
    
    @IBOutlet weak var favoriteCountLabel: UILabel!
    
    
    var favoriteStatus: Bool = false
    var retweetStatus: Bool = false
    
    
    var tweetID: Int = 0
    
    var tweet: Tweet!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = tweet?.user!.name
        thumbImageView.setImageWithURL(NSURL(string: tweet.user!.profileUrlString!)!)
        tweetLabel.text = tweet.text as! String
        retweetCountLabel.text = "\(tweet.retweetCount!)"
        favoriteCountLabel.text = "\(tweet.favoritesCount!)"
        tweetID = (tweet.tweetID as? Int)!
        
        
      

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onRetweet(sender: AnyObject) {
        TwitterClient.sharedInstance.retweet(Int(tweetID), params: nil, completion: {(error) -> () in
            
            if (self.retweetButton.currentImage == UIImage(named: "retweet-action") ) {
                self.retweetCountLabel.text = String(self.tweet.retweetCount! + 1)
                self.retweetButton.setImage(UIImage(named: "retweet-action-on"), forState: .Normal)
                
            }else{
                
                self.retweetCountLabel.text = String(self.tweet.retweetCount!)
                self.retweetButton.setImage(UIImage(named: "retweet-action"), forState: .Normal )
            }
        
            
            
        })
        
    }
    @IBAction func onFavorite(sender: AnyObject) {
        TwitterClient.sharedInstance.favTweet(Int(tweetID), params: nil, completion: {(error) -> () in
            
            
            if (self.favoriteButton.currentImage == UIImage(named: "like-action") ) {
                self.favoriteCountLabel.text = String(self.tweet.favoritesCount! + 1)
                self.favoriteButton.setImage(UIImage(named: "like-action-on"), forState: .Normal)
                
            }else{
                
                self.favoriteCountLabel.text = String(self.tweet.favoritesCount!)
                self.favoriteButton.setImage(UIImage(named: "like-action"), forState: .Normal )
            }
            
        })
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
