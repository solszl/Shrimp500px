//
//  Galleries.swift
//  Shrimp500px
//
//  Created by 振亮 孙 on 16/3/11.
//  Copyright © 2016年 papa.studio. All rights reserved.
//

import Foundation
import ObjectMapper

struct Galleries: Mappable {
    
    var currentPage: Int?
    
    var totalItems: Int?
    
    var totalPages: Int?
    
    var galleries: [Gallery]?
    
    init?(_ map: Map) {
        mapping(map)
    }
    
    mutating func mapping(map: Map) {
        self.currentPage <- map["current_page"]
        self.totalItems <- map["total_items"]
        self.totalPages <- map["total_pages"]
        self.galleries <- map["galleries"]
    }
}