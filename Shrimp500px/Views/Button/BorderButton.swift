//
//  BorderButton.swift
//  Shrimp500px
//
//  Created by 振亮 孙 on 16/3/9.
//  Copyright © 2016年 papa.studio. All rights reserved.
//

import UIKit

class BorderButton: UIButton {
    
    // 边框颜色
    var borderColor = AppConfig.defaultBorderColor()
    // 圆角度数
    var cornerRadius: CGFloat = 3
    // 边框宽度
    var borderWidth: CGFloat = 1
    
    override var enabled: Bool {
        willSet {
            let newBorderColor = newValue ? borderColor : UIColor(white: 0.8, alpha: 1.0)
            layer.borderColor = newBorderColor.CGColor
        }
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        self.layer.cornerRadius = cornerRadius
        self.layer.borderColor = borderColor.CGColor
        self.layer.borderWidth = borderWidth
    }
}
