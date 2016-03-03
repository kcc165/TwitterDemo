//
//  TweetCell.swift
//  TwitterDemo
//
//  Created by kevaughn charles on 2/20/16.
//  Copyright © 2016 KCharles Inc. All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell {
    
    
    
    @IBOutlet weak var thumbImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var timeStampLabel: UILabel!
    
    @IBOutlet weak var tweetTextLabel: UILabel!
    
    @IBOutlet weak var retweetCountLabel: UILabel!
    
    @IBOutlet weak var favoriteCountLabel: UILabel!
    
    @IBOutlet weak var retweetButton: UIButton!
    
    @IBOutlet weak var favoriteButton: UIButton!
    
    
    var favoriteStatus: Bool = false
    var retweetStatus: Bool = false
    
    
    var tweetID: Int = 0
    var tweet: Tweet!{
        didSet{
            nameLabel.text = tweet.user!.name 
            thumbImageView.setImageWithURL(NSURL(string: tweet.user!.profileUrlString!)!)
            userNameLabel.text = "@\(tweet.user!.screenname!)"
            tweetTextLabel.text = tweet.text as? String
            timeStampLabel.text = "\(tweet.timestamp!)"
            tweetID = (tweet.tweetID as? Int)!
            
            
            
            
        }
    }
    
  
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        thumbImageView.layer.cornerRadius = 5
        thumbImageView.clipsToBounds = true
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
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

}
