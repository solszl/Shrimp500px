//
//  CategoryBar.swift
//  Shrimp500px
//
//  Created by 振亮 孙 on 16/3/5.
//  Copyright © 2016年 papa.studio. All rights reserved.
//

import UIKit
import SnapKit

class CategoryBar: UIView {
    
    let btnPhoto = CategoryButton(title: "照片")
    
    let btnGallary = CategoryButton(title: "画廊")
    
    let btnUser = CategoryButton(title: "用户")
    
    // 上线
    let topSeparatorLine = SeparatorLine()
    
    // 下线
    let bottomSeparatorLine = SeparatorLine()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(topSeparatorLine)
        self.topSeparatorLine.snp_makeConstraints { (make) -> Void in
            make.height.equalTo(0.5)
            make.leading.trailing.equalTo(0)
            make.top.equalTo(0)
            
        }
        
        self.addSubview(btnPhoto)
//        btnPhoto.backgroundColor = UIColor.greenColor()
        btnPhoto.snp_makeConstraints { (make) -> Void in
            make.centerY.equalTo(self)
            make.centerX.equalTo(self).dividedBy(3)
            make.leading.equalTo(0)
        }
        
        self.addSubview(btnGallary)
//        btnGallary.backgroundColor = UIColor.redColor()
        btnGallary.snp_makeConstraints { (make) -> Void in
            make.center.equalTo(self)
            make.width.equalTo(self).dividedBy(3)
        }
        
        self.addSubview(btnUser)
//        btnUser.backgroundColor = UIColor.blueColor()
        btnUser.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(self).dividedBy(3)
            make.centerY.equalTo(btnGallary)
            make.leading.equalTo(btnGallary.snp_trailing)
        }

        self.addSubview(bottomSeparatorLine)
        bottomSeparatorLine.snp_makeConstraints { (make) -> Void in
            make.height.equalTo(0.5)
            make.bottom.equalTo(self.snp_bottom)
            make.leading.trailing.equalTo(0)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}