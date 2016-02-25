//
//  WorkItemCell.swift
//  Shrimp500px
//
//  Created by 振亮 孙 on 16/2/24.
//  Copyright © 2016年 papa.studio. All rights reserved.
//

import UIKit
import SnapKit

class WorkItemCell: UITableViewCell {
    
    var imgCover: UIImageView!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        imgCover = UIImageView()
        self.selectionStyle = .None
        self.backgroundColor = UIColor.clearColor()
        
        self.contentView.addSubview(imgCover)
        
        
        imgCover.snp_makeConstraints { (make) -> Void in
            make.size.equalTo(self.contentView)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
}
