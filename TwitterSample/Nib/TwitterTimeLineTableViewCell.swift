//
//  TwitterTimeLineTableViewCell.swift
//  TwitterSample
//
//  Created by TakaoAtsushi on 2018/05/04.
//  Copyright © 2018年 TakaoAtsushi. All rights reserved.
//

import UIKit

class TwitterTimeLineTableViewCell: UITableViewCell {

    @IBOutlet weak var authorImageView: UIImageView!
    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var authorUserIDLabel: UILabel!
    @IBOutlet weak var tweetTextView: UITextView!
    @IBOutlet weak var tweetIsLikedImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = UIColor.clear
        authorImageView.layer.cornerRadius = authorImageView.frame.size.width/2
        authorImageView.clipsToBounds = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
