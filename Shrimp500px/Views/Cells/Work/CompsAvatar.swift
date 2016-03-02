//
//  CompsAvatar.swift
//  Shrimp500px
//
//  Created by 振亮 孙 on 16/3/1.
//  Copyright © 2016年 papa.studio. All rights reserved.
//

import UIKit

class CompsAvatar: UIView, WorkItemCellDataSource {
    
    var imgAvatarView: UIImageView
    
    override init(frame: CGRect) {
        
        imgAvatarView = UIImageView()
        super.init(frame: frame)
        self.addSubview(imgAvatarView)
        
        imgAvatarView.snp_makeConstraints { (make) -> Void in
            make.size.equalTo(CGSizeMake(80, 80))
        }
    }

    required init?(coder aDecoder: NSCoder) {
        
        imgAvatarView = UIImageView()
        super.init(coder: aDecoder)
    }
    
    func setData(data: Photo) {
//        imgAvatarView.image = UIImage(named: data.avatar)
    }
}
