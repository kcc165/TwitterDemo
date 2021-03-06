//
//  TweetsViewController.swift
//  TwitterDemo
//
//  Created by kevaughn charles on 2/19/16.
//  Copyright © 2016 KCharles Inc. All rights reserved.
//

import UIKit

class TweetsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tweets: [Tweet]?
    
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 120
        
        TwitterClient.sharedInstance.homeTimeline({ (tweets: [Tweet]) -> () in
            self.tweets = tweets
            self.tableView.reloadData()
            
            for tweet in tweets{
                print(tweet.text)
            }
            }) { (error: NSError) -> () in
                print(error.localizedDescription)
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onLogoutButton(sender: AnyObject) {
        TwitterClient.sharedInstance.logout()
        
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tweets != nil{
            return tweets!.count
        } else{
            return 0
        }
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TweetCell", forIndexPath: indexPath) as! TweetCell
        cell.tweet = tweets![indexPath.row]
        
        return cell
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "TweetDetailView"{
            let cell = sender as! TweetCell
            let tweet = cell.tweet
            let destinationViewController = segue.destinationViewController as! TweetDetailViewController
            destinationViewController.tweet = tweet
        }
        if segue.identifier == "ProfileView"{
            let cell = sender!.superview!!.superview as! TweetCell
            let tweet = cell.tweet
            
            let destinationViewController = segue.destinationViewController as! ProfileViewController
            destinationViewController.tweet = tweet
        
        }
        if segue.identifier == "ReplyPush" {
            let cell = sender!.superview!!.superview as! TweetCell
            let tweet = cell.tweet
            
            let destinationViewController = segue.destinationViewController as! ComposeTweetViewController
            destinationViewController.tweet = tweet
            
            
            
        }
        //if segue.identifier == "ComposePush"{
            //let cell = sender!.superview!!.superview as! TweetCell
            //let tweet = cell.tweet
            
            //let destinationViewController = segue.destinationViewController as! ComposeTweetViewController
            //destinationViewController.tweet = tweet
        
        
    
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
