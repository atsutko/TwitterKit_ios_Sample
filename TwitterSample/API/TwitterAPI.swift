//
//  TwitterAPI.swift
//  TwitterSample
//
//  Created by TakaoAtsushi on 2018/05/05.
//  Copyright © 2018年 TakaoAtsushi. All rights reserved.
//

import UIKit
import TwitterKit
import Foundation

class TwitterAPI: NSObject {
    
    let baseURL = "https://api.twitter.com"
    let version = "/1.1"
    
    
    class func getTimeLine(userID: String, tweets: @escaping ([TWTRTweet]) -> (), error: (NSError) -> ()) {
        
        let client = TWTRAPIClient(userID: userID)
        var clientError: NSError?
        let api = TwitterAPI()
        let path = "/statuses/home_timeline.json"
        let endpoint = api.baseURL + api.version + path
        let request:NSURLRequest? = client.urlRequest(withMethod: "GET", urlString: endpoint, parameters: nil, error: &clientError) as NSURLRequest?
        
        if request != nil {
            
            client.sendTwitterRequest(request! as URLRequest, completion: {(response, data, error) in
                if error == nil {
                    
                    var jsonError: NSError?
                    let json: AnyObject? = try! JSONSerialization.jsonObject(with: data!) as AnyObject?
                    if let jsonArray = json as? NSArray {
                        tweets(TWTRTweet.tweets(withJSONArray: jsonArray as! [Any]) as! [TWTRTweet])
                        
                    } else{
                        
                    }
                } else{
                    
                }
            })
        }
        
        
    }
}
