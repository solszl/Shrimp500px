//
//  ImageSize.swift
//  Shrimp500px
//
//  Created by 振亮 孙 on 16/3/2.
//  Copyright © 2016年 papa.studio. All rights reserved.
//

import Foundation

internal enum ImageSize: Int, CustomStringConvertible {
    
    case Tiny = 1,Small,Medium,Large,XLarge
    
    var imgSize: String {
        let size = ["tiny", "small", "medium", "large", "xlarge"]
        return size[self.rawValue]
    }
    
    var description: String {
        return imgSize
    }
}