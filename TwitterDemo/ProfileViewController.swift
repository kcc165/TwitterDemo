//
//  ProfileViewController.swift
//  TwitterDemo
//
//  Created by kevaughn charles on 2/27/16.
//  Copyright © 2016 KCharles Inc. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var pNameLabel: UILabel!
    
    
    @IBOutlet weak var pImageView: UIImageView!
    
    
    var tweet: Tweet!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        pNameLabel.text = tweet.user?.name
        

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
