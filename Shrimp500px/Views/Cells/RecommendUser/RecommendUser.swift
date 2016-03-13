//
//  RecommendUser.swift
//  Shrimp500px
//
//  Created by 振亮 孙 on 16/3/7.
//  Copyright © 2016年 papa.studio. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher

class RecommendUser: UITableViewCell {

    var imgCover: UIImageView!
    
    var imgAvatar: UIImageView!
    
    var lblFullname: UILabel!
    
    var lblFollowers: UILabel!
    
    var btnFollow: BorderButton!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let coverW: CGFloat = ScreenWidth - 20
        let coverH: CGFloat = coverW * 0.6
        self.backgroundColor = UIColor.fromRGBAInteger(red: 243, green: 243, blue: 248)
        
        // 用户封面
        imgCover = UIImageView()
        self.contentView.addSubview(imgCover)
        imgCover.contentMode = .ScaleAspectFill
        imgCover.clipsToBounds = true
        imgCover.backgroundColor = UIColor.lightGrayColor()
        
        imgCover.snp_makeConstraints { (make) -> Void in
            make.leading.top.equalTo(10)
            make.width.equalTo(coverW)
            make.height.equalTo(coverH)

        }
        
        // 下面组件的容器
        let con = UIView()
        con.layer.backgroundColor = UIColor.whiteColor().CGColor
        con.layer.borderColor = UIColor.lightGrayColor().CGColor
        con.layer.borderWidth = 0.5
        self.contentView.addSubview(con)
        
        con.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(coverW)
            make.height.equalTo(coverW * 0.4)
            make.top.equalTo(imgCover.snp_bottom).offset(-1)
            make.leading.equalTo(10)
            make.bottom.equalTo(0)
        }
        
        imgAvatar = UIImageView()
        self.contentView.addSubview(imgAvatar)
        self.imgAvatar.clipsToBounds = true
        self.imgAvatar.layer.cornerRadius = 30

        self.imgAvatar.snp_makeConstraints { (make) -> Void in
            make.size.equalTo(avatarSizeMiddle)
            make.centerX.equalTo(self.contentView)
            make.centerY.equalTo(imgCover.snp_bottom)
        }
        
        lblFullname = UILabel()
        con.addSubview(lblFullname)
        self.lblFullname.textAlignment = .Center
        self.lblFullname.textColor = UIColor.darkGrayColor()
        self.lblFullname.font = UIFont.systemFontOfSize(18)
        
        lblFullname.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(con).offset(34)
            make.width.equalTo(con.snp_width)
            make.centerX.equalTo(imgAvatar.snp_centerX)
        }
        
        lblFollowers = UILabel()
        con.addSubview(lblFollowers)
        self.lblFollowers.textAlignment = .Center
        self.lblFollowers.textColor = UIColor.lightGrayColor()
        self.lblFollowers.font = UIFont.systemFontOfSize(12)
        
        lblFollowers.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(lblFullname.snp_bottom).offset(8)
            make.width.equalTo(con.snp_width)
            make.centerX.equalTo(lblFullname.snp_centerX)
        }
        
        btnFollow = BorderButton()
        btnFollow.setTitle("关注", forState: .Normal)
        btnFollow.titleLabel?.font = UIFont.systemFontOfSize(14)
        btnFollow.setTitleColor(UIColor.fromRGBAInteger(red: 22, green: 144, blue: 207), forState: .Normal)
        btnFollow.borderWidth = 1.5
        con.addSubview(btnFollow)
        
        btnFollow.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.lblFollowers.snp_bottom).offset(8)
            make.centerX.equalTo(con.snp_centerX)
            make.bottom.equalTo(con).offset(-10)
            make.width.equalTo(56)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configWithUserData(data: RecommendUserInfo) {
        imgCover.kf_setImageWithURL(NSURL(string: data.coverPicUrl!)!)
        imgAvatar.kf_setImageWithURL(NSURL(string: data.avatar!)!)
        lblFullname.text = data.fullName //"其貌不扬\(arc4random() % 10)"
        lblFollowers.text = "粉丝: \(data.followerCount!)"//"粉丝: \(arc4random() % 10000)"
    }
}
