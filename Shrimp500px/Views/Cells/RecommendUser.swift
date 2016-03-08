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
    
    var imgAvatar: UIImageView?
    
    var lblFullname: UILabel?
    
    var lblFollowers: UILabel?
    
    var btnFollow: UIButton?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        imgCover = UIImageView()
        
        self.contentView.addSubview(imgCover)
        imgCover.contentMode = .ScaleAspectFill
        imgCover.clipsToBounds = true
        imgCover.backgroundColor = UIColor.redColor()

        imgCover.snp_makeConstraints { (make) -> Void in
            make.leading.equalTo(10)
            make.top.equalTo(10)
        }
        
        imgCover.image = UIImage(named: "bird")
        
        print("aaaaa\(self.contentView.size), \(self.size)")
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configWithUserData(data: User) {
        
    }
}
