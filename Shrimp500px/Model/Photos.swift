//
//  Photos.swift
//  Shrimp500px
//
//  Created by 振亮 孙 on 16/3/3.
//  Copyright © 2016年 papa.studio. All rights reserved.
//

import Foundation
import ObjectMapper

struct Photos: Mappable {
    
    var feature: String?
    
    var currentPage: Int?
    
    var totalPage: Int?
    
    var totalItems: Int?
    
    var allPhoto: [Photo]?
    
    init?(_ map: Map) {
        mapping(map)
    }
    
    mutating func mapping(map: Map) {
        self.feature <- map["feature"]
        self.currentPage <- map["current_page"]
        self.totalPage <- map["total_pages"]
        self.totalItems <- map["total_items"]
        self.allPhoto <- map["photos"]
    }
}
