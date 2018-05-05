//
//  TwitterLoginViewController.swift
//  TwitterSample
//
//  Created by TakaoAtsushi on 2018/05/03.
//  Copyright © 2018年 TakaoAtsushi. All rights reserved.
//

import UIKit
import TwitterKit

class TwitterLoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
 

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func twitterLoginButtonPressed() {
        
        
        TWTRTwitter.sharedInstance().logIn(completion: { (session, error) in
            if session != nil {
                print("signed in as \(session!.userName), \(session!.userID)")
                
                let client = TWTRAPIClient.withCurrentUser()
                client.requestEmail { email, error in
                    if email != nil {
                        
                        // UserDefaultsのログイン情報をログイン済に変更。
                        let ud = UserDefaults.standard
                        ud.set(true, forKey: "isSignIn")
                        ud.synchronize()
                        
                        // UserDefaultsのTwitterのuseIDを保持。
                        let userDefaults = UserDefaults.standard
                        userDefaults.set(session!.userID, forKey: "userID")
                        userDefaults.synchronize()
                        
                        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
                        let viewController = storyboard.instantiateInitialViewController()
                        let appDelegate = UIApplication.shared.delegate
                        appDelegate?.window!?.rootViewController = viewController
                        appDelegate?.window!?.makeKeyAndVisible()
                        
                    } else {
                        
                    }
                }
            } else {
                print("error: \(error!.localizedDescription)")
            }
        })
    }

    

}
