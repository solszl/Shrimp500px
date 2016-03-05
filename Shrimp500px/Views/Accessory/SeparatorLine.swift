//
//  SeparatorLine.swift
//  Shrimp500px
//
//  Created by 振亮 孙 on 16/3/5.
//  Copyright © 2016年 papa.studio. All rights reserved.
//

import UIKit

/// 分割线
class SeparatorLine: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = AppConfig.separatorLineColor()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
