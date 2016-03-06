//
//  AppConfig.swift
//  Shrimp500px
//
//  Created by 振亮 孙 on 16/2/20.
//  Copyright © 2016年 papa.studio. All rights reserved.
//

import Foundation
import UIKit


let CustomKey = "SHxQG62Gp8UYe8ZTArCXDdH404HFXtPvMlhqth3U"

let CustomSecret = "Pb4xgk7jlSwnl6jE58ePG3eW90GCejmo8Z9yCy3m"

let BaseURLString = "https://api.500px.com/v1"


let ScreenWidth = UIScreen.mainScreen().bounds.width

let ScreenHeight = UIScreen.mainScreen().bounds.height

let ScreenBounds = UIScreen.mainScreen().bounds

let topPadding: CGFloat = 20.0

let bottomPadding: CGFloat = 66.0

class AppConfig {
    
    /**
     分割线的颜色
     */
    class func separatorLineColor() -> UIColor {
        return UIColor.colorWithHex(0xE6E6E6)
    }
    
    /**
     未选中文字颜色
     */
    class func unselectedColor() -> UIColor {
        return UIColor.colorWithHex(0x6E6E6E)
    }
    
    /**
     选中文字颜色
     */
    class func selectedColor() -> UIColor {
        return UIColor.blueColor()
    }
}