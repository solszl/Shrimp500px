//
//  Photo.swift
//  Shrimp500px
//
//  Created by 振亮 孙 on 16/2/27.
//  Copyright © 2016年 papa.studio. All rights reserved.
//

import Foundation

struct Photo {
    
 /// 照片ID
    let id:Int
 /// 照片实际宽度
    let width: Int
 /// 照片实际高度
    let height: Int
 /// 用户信息
    var user: User?
    
    init(id: Int, width: Int, height: Int) {
        self.id = id
        self.width = width
        self.height = height
    }
}