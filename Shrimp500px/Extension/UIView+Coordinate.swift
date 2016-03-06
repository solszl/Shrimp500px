//
//  UIView+.swift
//  imitateDay
//
//  Created by 振亮 孙 on 15/12/11.
//  Copyright © 2015年 papa.studio. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    /// 横坐标
    var x:CGFloat {
        return self.frame.origin.x
    }
    
    /// 纵坐标
    var y: CGFloat {
        return self.frame.origin.y
    }
    
    /// 尺寸
    var size: CGSize {
        return self.frame.size
    }
    
    /// 宽度
    var width: CGFloat {
        return self.frame.size.width
    }
    
    /// 高度
    var height: CGFloat {
        return self.frame.size.height
    }
    
    /// 位置
    var point: CGPoint {
        return self.frame.origin
    }
}