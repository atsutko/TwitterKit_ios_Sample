//
//  Tweets.swift
//  TwitterSample
//
//  Created by TakaoAtsushi on 2018/05/09.
//  Copyright © 2018年 TakaoAtsushi. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

class Tweets: Object {

    @objc dynamic var text: String = ""
    @objc dynamic var isLiked: Bool = false
    @objc dynamic var author: Author!
    
    
    
    
   
    
  
}
