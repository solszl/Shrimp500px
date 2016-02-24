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
        
        addSubview(imgCover)
        
        
        imgCover.snp_makeConstraints { (make) -> Void in
//            make.center.equalTo(self)
            make.size.equalTo(self.snp_size)
            make.center.equalTo(self)
//            make.edges.equalTo(UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2))
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
}
