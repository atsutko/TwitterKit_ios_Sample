//
//  TwitterTimeLineShowViewController.swift
//  TwitterSample
//
//  Created by TakaoAtsushi on 2018/05/04.
//  Copyright © 2018年 TakaoAtsushi. All rights reserved.
//

import UIKit
import TwitterKit
import RealmSwift

class TwitterTimeLineShowViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    var tweetList = List<Tweets>()
   
    @IBOutlet weak var twitterTimelineTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        twitterTimelineTableView.delegate = self
        twitterTimelineTableView.dataSource = self
    
        let nib = UINib(nibName: "TwitterTimeLineTableViewCell", bundle: Bundle.main)
        twitterTimelineTableView.register(nib, forCellReuseIdentifier: "TimeLineCell")
        
        loadTweets()
        
        //セルの高さを自動で調整
        twitterTimelineTableView.estimatedRowHeight = 44.0
        twitterTimelineTableView.rowHeight = UITableViewAutomaticDimension
        
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweetList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TimeLineCell") as! TwitterTimeLineTableViewCell
        
    
        cell.authorUserIDLabel.text = tweetList[indexPath.row].author.profileUserID
        cell.authorNameLabel.text = tweetList[indexPath.row].author.name
        
        cell.tweetTextView.text = tweetList[indexPath.row].text
        
        if tweetList[indexPath.row].isLiked == false {
            cell.tweetIsLikedImageView.image = UIImage(named: "heart-outline@2x.png")
        } else{
            cell.tweetIsLikedImageView.image = UIImage(named: "heart-fill@2x.png")
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40.0
    }
    
    func loadTweets() {
        let ud = UserDefaults.standard
        
        TwitterAPI.getTimeLine(userID: ud.object(forKey: "userID") as! String, tweets: { (twitters) in
            
            for twitter in twitters {
                
                
                //タイムライン上のツイートの書き手の情報をRealmModel(author)に代入
                let author = Author()
                author.name = twitter.author.name
                author.profileUserID = twitter.author.userID
                
                //タイムライン上のツイートの情報をRealmModel(Tweets)に代入
                let tweet = Tweets()
                tweet.text = twitter.text
                tweet.isLiked = twitter.isLiked
                tweet.author = author
                
                //最初に宣言したtweetListに挿入
                self.tweetList.append(tweet)
                
            }
            
            let realm = try! Realm()
            try! realm.write {
                realm.add(self.tweetList)
            }
            
            self.twitterTimelineTableView.reloadData()
            
        }) { (error) in
        }
       
    }
}
