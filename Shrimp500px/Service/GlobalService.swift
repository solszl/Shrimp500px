//
//  GlobalService.swift
//  Shrimp500px
//
//  Created by 振亮 孙 on 16/3/2.
//  Copyright © 2016年 papa.studio. All rights reserved.
//

import Foundation

class GlobalService {
    
 /// 单例
    static let sharedManager = GlobalService()
    
    private init() {
        initNecessary()
    }
    
    /**
     初始化一些必要的信息,数据
     */
    private func initNecessary() {
        // 开始监听网络状态
        NetWorkService.sharedManager.startListen()
    }
    
    
}