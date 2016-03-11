//
//  User.swift
//  Shrimp500px
//
//  Created by 振亮 孙 on 16/3/2.
//  Copyright © 2016年 papa.studio. All rights reserved.
//

import Foundation
import ObjectMapper

struct User: Mappable, Equatable {
    /// 用户ID
    var id: Int?
    
    /// 用户名
    var username: String?
    
    /// 头像连接
    var avatar: String?
    
    /// 封面
    var coverURL: String?
    
    /// 姓
    var firstName: String?
    
    /// 名
    var lastName: String?
    
    /// 全称
    var fullname: String?
    
    /// 照片数量
    var photos_count: Int?
    
    /// 画廊数量
    var galleries_count: Int?
    
    /// 性别
    var sex:Int = Sex.Female.rawValue
    
    /// 是否正在关注
    var isFollowing: Bool = false
    
    /// 好友数量
    var friendCount: Int?
    
    /// 关注了多少人
    var followers_count: Int?
    
    init?(_ map: Map) {
        mapping(map)
    }
    
    mutating func mapping(map: Map) {
        self.id <- map["id"]
        self.username <- map["username"]
        self.firstName <- map["firstname"]
        self.lastName <- map["lastname"]
        self.fullname <- map["fullname"]
        self.photos_count <- map["photos_count"]
        self.galleries_count <- map["galleries_count"]
        self.sex <- map["sex"]
        self.isFollowing <- map["following"]
        self.friendCount <- map["friends_count"]
        self.followers_count <- map["followers_count"]
        
    }
}

private enum Sex:Int {
    case Female = 0
    case Male = 1
}

func ==(lhs: User, rhs: User) -> Bool {
    return lhs.id == rhs.id
}