//
//  TwitterTimeLineShowViewController.swift
//  TwitterSample
//
//  Created by TakaoAtsushi on 2018/05/04.
//  Copyright © 2018年 TakaoAtsushi. All rights reserved.
//

import UIKit
import TwitterKit

class TwitterTimeLineShowViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var TWTRtweets: [TWTRTweet] = []
   
    @IBOutlet weak var twitterTimelineTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        twitterTimelineTableView.delegate = self
        twitterTimelineTableView.dataSource = self
    
        let nib = UINib(nibName: "TwitterTimeLineTableViewCell", bundle: Bundle.main)
        twitterTimelineTableView.register(nib, forCellReuseIdentifier: "TimeLineCell")
        
        //セルの高さを自動で調整
        twitterTimelineTableView.rowHeight = UITableViewAutomaticDimension
        
        loadTweets()
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TWTRtweets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TimeLineCell") as! TwitterTimeLineTableViewCell
        cell.tweetTextView.text = TWTRtweets[indexPath.row].text
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 10.0
    }
    
    
    func loadTweets() {
        let ud = UserDefaults.standard
        
        TwitterAPI.getTimeLine(userID: ud.object(forKey: "userID") as! String, tweets: { (twitters) in
            for twitter in twitters {
                self.TWTRtweets.append(twitter)
                
            }
            self.twitterTimelineTableView.reloadData()
        }) { (error) in
        }
       
    }
}
