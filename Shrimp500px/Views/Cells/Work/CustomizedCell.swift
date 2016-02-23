//
//  CustomizedCell.swift
//  Shrimp500px
//
//  Created by 振亮 孙 on 16/2/23.
//  Copyright © 2016年 papa.studio. All rights reserved.
//

import UIKit
import SnapKit

class CustomizedCell: UICollectionViewCell {

    @IBOutlet weak var imgCover: UIImageView!
    
    
    var cover: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        makeUI()
    }
    
    // 构建UI
    private func makeUI() {
        
        cover = UIImageView()
        self.addSubview(cover)
        // 最上面的图
//        imgCover.snp_makeConstraints { (make) -> Void in
//            make.size.equalTo(CGSizeMake(80, 80))
//        }
    }
}
