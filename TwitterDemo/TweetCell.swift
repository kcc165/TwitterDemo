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
    
    
    var tweet: Tweet!{
        didSet{
            nameLabel.text = tweet.user!.name 
            thumbImageView.setImageWithURL(NSURL(string: tweet.user!.profileUrlString!)!)
            userNameLabel.text = "@\(tweet.user!.screenname!)"
            tweetTextLabel.text = tweet.text as? String
            timeStampLabel.text = "\(tweet.timestamp!)"
            retweetCountLabel.text = "\(tweet.retweetCount!)"
            favoriteCountLabel.text = "\(tweet.favoritesCount!)"
            
            
            
            
        }
    }
    
  
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func onRetweet(sender: AnyObject) {
        print("Retweet button clicked")
        print("Retweet Status: \(retweetStatus)")
        if retweetStatus == false{
            retweetCountLabel.text = "\(Int(retweetCountLabel.text!)! + 1)"
            retweetStatus = true
            self.retweetButton.selected = true
        }
        else {
            
            retweetCountLabel.text = "\(Int(retweetCountLabel.text!)! - 1)"
            retweetStatus = false
            self.retweetButton.selected = false
        }
    }
    @IBAction func onFavorite(sender: AnyObject) {
        print("Favorite button clicked")
        print("Favorite Status: \(favoriteStatus)")
        if favoriteStatus == false{
            
            favoriteCountLabel.text = "\(Int(favoriteCountLabel.text!)! + 1)"
            favoriteStatus = true
            self.favoriteButton.selected = true
        }
        else {
            
            favoriteCountLabel.text = "\(Int(favoriteCountLabel.text!)! - 1)"
            favoriteStatus = false
            self.favoriteButton.selected = false
    }
    }

}
