//
//  Gallery.swift
//  Shrimp500px
//
//  Created by 振亮 孙 on 16/3/11.
//  Copyright © 2016年 papa.studio. All rights reserved.
//

import Foundation
import ObjectMapper

struct Gallery: Mappable, Equatable {
    
    var id: Int?
    
    var privacy: Bool?
    
    var kind: Int?
    
    var itemCount: Int?
    
    var userId: Int?
    
    var createTime: NSData?
    
    var updateTime: NSData?
    
    var name: String?
    
    var subtitle: String?
    
    var description: String?
    
    var viewCount: Int?
    
    var nsfw: Bool?
    
    var user: User?
    
    var customPath: String?
    
    var editorChoice: Bool?
    
    init?(_ map: Map) {
        mapping(map)
    }
    
    mutating func mapping(map: Map) {
        self.id <- map["id"]
        self.privacy <- map["privacy"]
        self.kind <- map["kind"]
        self.itemCount <- map["items_count"]
        self.userId <- map["user_id"]
        self.createTime <- map["created_at"]
        self.updateTime <- map["updated_at"]
        self.name <- map["name"]
        self.subtitle <- map["subtitle"]
        self.description <- map["descrption"]
        self.viewCount <- map["view_count"]
        self.nsfw <- map["nsfw"]
        self.user <- map["user"]
        self.customPath <- map["custom_path"]
        self.editorChoice <- map["editors_choice"]
    }
}

func ==(lhs: Gallery, rhs: Gallery) -> Bool {
    return lhs.id == rhs.id
}