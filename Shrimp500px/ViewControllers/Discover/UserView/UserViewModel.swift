//
//  UserViewModel.swift
//  Shrimp500px
//
//  Created by 振亮 孙 on 16/3/12.
//  Copyright © 2016年 papa.studio. All rights reserved.
//

import Foundation

class UserViewModel {
    
    var data: [RecommendUserInfo] = []
    
    let bizz: BizzUser = BizzUser()
    
    init() {
        
    }
    
    func fetchNewUser(callback:(()->Void)? = nil) {
        bizz.fatchRecommendUser { (userList, error) -> Void in
            self.data = userList!
            callback!()
        }
    }
}