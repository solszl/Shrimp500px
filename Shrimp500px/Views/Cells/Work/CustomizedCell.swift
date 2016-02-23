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
    
    @IBOutlet weak var imgAvatar: UIImageView!
    
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var lblTimeSpan: UILabel!
    
    @IBOutlet weak var btnGood: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        makeUI()
    }

    @IBAction func btnDetailClick(sender: AnyObject) {
    }
    
    @IBAction func btnShareClick(sender: AnyObject) {
    }
    
    @IBAction func btnGoodClick(sender: AnyObject) {
    }
    
    // 构建UI
    private func makeUI() {
        // 最上面的图
        imgCover.snp_makeConstraints { (make) -> Void in
            make.leading.top.trailing.equalTo(self).offset(0)
        }
        
        imgAvatar.snp_makeConstraints { (make) -> Void in
            make.leading.equalTo(self).offset(10)
            make.top.equalTo(imgCover).offset(10)
            make.size.equalTo(CGSizeMake(40, 40))
        }
    }
}
