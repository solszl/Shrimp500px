//
//  CarouselItemRender.swift
//  Shrimp500px
//
//  Created by 振亮 孙 on 16/3/11.
//  Copyright © 2016年 papa.studio. All rights reserved.
//

import Foundation

class CarouselItemRender: UIView {
    
    private let avatarSize: CGFloat = 17.0
    
    var lblPictureName: UILabel!
    
    var lblPersonName: UILabel!
    
    var imgAvatar: UIImageView!
    
    var imgPicture: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(data: Gallery) {
        self.imgPicture.kf_setImageWithURL(NSURL(string: data.coverPhoto![1].url!)!)
        self.lblPersonName.text = data.user?.firstName
    }
    
    
    private func makeUI() {
        // 背景图
        self.imgPicture = UIImageView()
        self.addSubview(self.imgPicture)
        self.imgPicture.contentMode = .ScaleAspectFill
        self.imgPicture.clipsToBounds = true
        self.imgPicture?.snp_makeConstraints(closure: { (make) -> Void in
            make.size.equalTo(CGSize(width: ScreenWidth, height: 150.0))
            make.center.equalTo(self)
        })
        
        // 人名
        self.lblPersonName = UILabel()
        self.lblPersonName.font = UIFont.systemFontOfSize(10)
        self.lblPersonName.textAlignment = .Center
        self.lblPersonName.textColor = UIColor.lightGrayColor()
        self.addSubview(lblPersonName)
        self.lblPersonName.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(ScreenWidth)
            make.center.equalTo(self)
        }
        
        // 作品名字
        self.lblPictureName = UILabel()
        self.lblPictureName.font = UIFont.systemFontOfSize(14)
        self.lblPictureName.textAlignment = .Center
        self.lblPictureName.textColor = UIColor.lightTextColor()
        self.addSubview(lblPictureName)
        
        self.lblPictureName.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(ScreenWidth)
            make.bottom.equalTo(lblPersonName.snp_top).offset(-10)
            make.centerX.equalTo(lblPersonName)
        }
        
        // 人物头像
        self.imgAvatar = UIImageView()
        self.imgAvatar?.layer.cornerRadius = avatarSize
        self.imgAvatar.clipsToBounds = true
        self.imgAvatar.contentMode = .ScaleAspectFill
        self.addSubview(imgAvatar)
        
        self.imgAvatar.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(lblPersonName)
            make.top.equalTo(lblPersonName.snp_bottom).offset(10)
        }
        
    }
}