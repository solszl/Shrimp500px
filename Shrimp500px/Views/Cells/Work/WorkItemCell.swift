//
//  WorkItemCell.swift
//  Shrimp500px
//
//  Created by 振亮 孙 on 16/2/24.
//  Copyright © 2016年 papa.studio. All rights reserved.
//

import UIKit
import SnapKit

protocol WorkItemCellDataSource {
    func setData(data: Photo)
}

class WorkItemCell: UITableViewCell {
    
    var imgCover: UIImageView!
    
//    var avatar: CompsAvatar!

//    var imgAvatar: UIImageView!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        imgCover = UIImageView()
        self.selectionStyle = .None
        self.backgroundColor = UIColor.clearColor()
        
        self.contentView.addSubview(imgCover)
        
        
        imgCover.snp_makeConstraints { (make) -> Void in
//            make.size.equalTo(self.contentView)
            make.width.equalTo(self.contentView.snp_width)
            make.height.equalTo(self.contentView).multipliedBy(0.8)
        }
        
//        avatar = CompsAvatar(frame: CGRectMake(0, 0, ScreenWidth, 80))
//        self.contentView.addSubview(avatar)
//        
//        avatar.snp_makeConstraints { (make) -> Void in
//
//            make.top.equalTo(imgCover)
//            make.trailing.equalTo(imgCover)
//        }
        
//        imgAvatar = UIImageView()
//        imgAvatar.image = UIImage(named: "09")
//        
//        self.contentView.addSubview(imgAvatar)
//        imgCover.snp_makeConstraints { (make) -> Void in
//            make.top.equalTo(imgCover)
//            make.trailing.equalTo(imgCover)
//        }
        
        let lblName = UILabel()
        lblName.textColor = UIColor.redColor()
        lblName.text = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
        lblName.lineBreakMode = .ByWordWrapping
        
        self.contentView.addSubview(lblName)
        
        lblName.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(imgCover)
        }
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

extension WorkItemCell: CellConfigData {
    func configData(data: AnyObject?) {
        guard data == nil else {
            return
        }
    }
}
