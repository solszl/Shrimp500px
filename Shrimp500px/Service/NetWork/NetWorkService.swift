//
//  NetWorkService.swift
//  Shrimp500px
//
//  Created by 振亮 孙 on 16/3/2.
//  Copyright © 2016年 papa.studio. All rights reserved.
//

import Foundation
import ReachabilitySwift

class NetWorkService {
    static let sharedManager = NetWorkService()
    
    /// 网络状态检测
    var netStatus: NetStatus?
    
    private init() {
        netStatus = NetStatus()
        netStatus?.delegate = self
    }
}


// MARK: - 实现网络状态协议
extension NetWorkService: NetStatusDelegate {
    func startListen() {
        netStatus?.startListen()
    }
    
    func stopListen() {
        
    }
    
    func reachabilityChanged(status: Reachability.NetworkStatus) {
        
    }
    
    func currentReachabilityStatus(status: Reachability.NetworkStatus) {
        log.info(status.description)
    }
    
}