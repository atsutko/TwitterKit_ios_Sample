//
//  TwitterTimeLineTableViewCell.swift
//  TwitterSample
//
//  Created by TakaoAtsushi on 2018/05/04.
//  Copyright © 2018年 TakaoAtsushi. All rights reserved.
//

import UIKit

class TwitterTimeLineTableViewCell: UITableViewCell {

    @IBOutlet weak var tweetTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        self.backgroundColor = UIColor.clear
        self.tweetTextView.layer.cornerRadius = 15
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
