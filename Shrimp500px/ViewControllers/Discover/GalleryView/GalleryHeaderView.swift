//
//  GalleryHeaderView.swift
//  Shrimp500px
//
//  Created by 振亮 孙 on 16/3/24.
//  Copyright © 2016年 papa.studio. All rights reserved.
//

import UIKit

class GalleryHeaderView: UITableViewCell {
    
    var imgIcon: UIImageView!
    
    var lblTitle: UILabel!
    
    var lblSubtitle: UILabel!
    
    var btnViewAll: UIButton!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        makeUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func makeUI() {
        // 前面的图标
        imgIcon = UIImageView()
        imgIcon.layer.cornerRadius = 15
        imgIcon.backgroundColor = UIColor.randomColor()
        self.addSubview(imgIcon)
        // 布局
        self.imgIcon.snp_makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 30, height: 30))
            make.top.leading.bottom.equalTo(5)
        }
        
        // 标题
        lblTitle = UILabel()
        self.addSubview(lblTitle)
        
        self.lblTitle.snp_makeConstraints { (make) in
            make.bottom.equalTo(self.snp_centerY).offset(-3)
            make.leading.equalTo(self.imgIcon.snp_trailing).offset(3)
            make.width.equalTo(ScreenWidth / 2)
        }
        
        // 副标题
        lblSubtitle = UILabel()
        self.addSubview(lblSubtitle)
        
        self.lblSubtitle.snp_makeConstraints { (make) in
            make.top.equalTo(self.snp_centerY).offset(3)
            make.leading.equalTo(self.imgIcon.snp_trailing).offset(3)
            make.width.equalTo(ScreenWidth / 2)
        }
        
        // 全部按钮
        btnViewAll = UIButton()
        self.addSubview(btnViewAll)
        
        self.btnViewAll.snp_makeConstraints { (make) in
            make.centerY.equalTo(self.snp_centerY)
            make.trailing.equalTo(self).offset(-3)
        }
    }
}
