//
//  ComposeTweetViewController.swift
//  TwitterDemo
//
//  Created by kevaughn charles on 3/2/16.
//  Copyright © 2016 KCharles Inc. All rights reserved.
//

import UIKit

class ComposeTweetViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var tweetTextView: UITextView!
    
    @IBOutlet weak var tweetSendButton: UIButton!
    
    @IBOutlet weak var characterCountLabel: UILabel!
    
    var tweet: Tweet!
    var nameInfo: String?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        self.tweetTextView.delegate = self
        //nameInfo = "@\(tweet.user!.screenname!)"
        
        tweetTextView.layer.borderWidth = 1
        tweetTextView.layer.cornerRadius = 8
        tweetTextView.layer.borderColor = UIColor .lightGrayColor().CGColor
        tweetSendButton.layer.cornerRadius = 2
        
        
        
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textViewDidChange(textView: UITextView) {
        var len = textView.text.characters.count
        characterCountLabel.text = String(140-len)
        
        if len > 140 {
            characterCountLabel.textColor = UIColor .redColor()
            
        } else {
            characterCountLabel.textColor = UIColor .grayColor()
        }
        
    }
    
    @IBAction func onTweet(sender: AnyObject) {
        if tweetTextView != nil {
            let tweet = tweetTextView.text.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)
            
            
            
            TwitterClient.sharedInstance.tweeting(tweet!)
        }
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
