//
//  Photo.swift
//  Shrimp500px
//
//  Created by 振亮 孙 on 16/2/27.
//  Copyright © 2016年 papa.studio. All rights reserved.
//

import Foundation
import ObjectMapper

struct Photo: Mappable {
    
 /// 照片ID
    var id:Int?
 /// 照片实际宽度
    var width: Int?
 /// 照片实际高度
    var height: Int?
    
    var imgName: String?
    
 /// 用户信息
    var user: User?
    
//    init(id: Int, width: Int, height: Int) {
//        self.id = id
//        self.width = width
//        self.height = height
//    }
    
    init?(_ map: Map) {
         mapping(map)
    }
    
    mutating func mapping(map: Map) {
        self.id <- map["id"]
        self.width <- map["id"]
        self.height <- map["height"]
        self.imgName <- map["name"]
        self.user <- map["user"]
    }
}