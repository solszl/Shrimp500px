//
//  RecommendUser.swift
//  Shrimp500px
//
//  Created by 振亮 孙 on 16/3/7.
//  Copyright © 2016年 papa.studio. All rights reserved.
//

import UIKit
import SnapKit

class RecommendUser: UITableViewCell {

    var imgCover: UIImageView!
    
    var imgAvatar: UIImageView!
    
    var lblFullname: UILabel!
    
    var lblFollowers: UILabel!
    
    var btnFollow: UIButton!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
