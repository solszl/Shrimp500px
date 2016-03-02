//
//  User.swift
//  Shrimp500px
//
//  Created by 振亮 孙 on 16/3/2.
//  Copyright © 2016年 papa.studio. All rights reserved.
//

import Foundation

struct User {
    var id: Int
    var username: String
    var avatar: String
    
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
    
    init(id: Int, username: String, avatar: String) {
        self.id = id
        self.username = username
        self.avatar = avatar
    }
}

private enum Sex:Int {
    case Female = 0
    case Male = 1
}