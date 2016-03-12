//
//  RecommendUser.swift
//  Shrimp500px
//
//  Created by 振亮 孙 on 16/3/12.
//  Copyright © 2016年 papa.studio. All rights reserved.
//

import Foundation
import ObjectMapper

struct RecommendUserInfo: Mappable, Equatable {
    
    var id: Int?
    
    var username: String?
    
    var firstName: String?
    
    var lastName: String?
    
    var city: String?
    
    var country: String?
    
    var fullName: String?
    
    var avatar: String?
    
    var coverPicUrl: String?
    
    var upgradeStatus: Int?
    
    var affection: Int?
    
    var followerCount: Int?
    
    var following: Bool?
    
    init?(_ map: Map) {
        mapping(map)
    }
    
    mutating func mapping(map: Map) {
        self.id <- map["id"]
        self.username <- map["username"]
        self.firstName <- map["firstname"]
        self.lastName <- map["lastname"]
        self.city <- map["city"]
        self.country <- map["country"]
        self.fullName <- map["fullname"]
        self.avatar <- map["userpic_url"]
        self.coverPicUrl <- map["cover_url"]
        self.upgradeStatus <- map["upgrade_status"]
        self.affection <- map["affection"]
        self.followerCount <- map["followers_count"]
        self.following <- map["following"]
    }
}

func ==(lhs: RecommendUserInfo, rhs: RecommendUserInfo) -> Bool {
    return true
}
