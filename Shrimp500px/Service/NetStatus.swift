//
//  NetStatus.swift
//  Shrimp500px
//
//  Created by 振亮 孙 on 16/3/2.
//  Copyright © 2016年 papa.studio. All rights reserved.
//

import Foundation
import ReachabilitySwift

protocol NetStatusDelegate {
    func startListen()
    func stopListen()
    func reachabilityChanged(status: Reachability.NetworkStatus)
    func currentReachabilityStatus(status: Reachability.NetworkStatus)
}

class NetStatus {
    var delegate: NetStatusDelegate?
    
    var reachability: Reachability?
    
    init() {
        // 构建检查器
        setupReachability(hostName: "baidu.com", useClosures: true)
    }
    
    private func setupReachability(hostName hostName: String?, useClosures: Bool) {
        do {
            let reachability = try hostName == nil ? Reachability.reachabilityForInternetConnection() : Reachability(hostname: hostName!)
            self.reachability = reachability
        } catch ReachabilityError.FailedToCreateWithAddress(let address) {
            log.error("Unable to create\nReachability with address:\n\(address)")
            return
        } catch {}
        
        if (useClosures) {
            reachability?.whenReachable = { reachability in
                dispatch_async(dispatch_get_main_queue()) {
                    self.delegate?.currentReachabilityStatus(reachability.currentReachabilityStatus)
                }
            }
            reachability?.whenUnreachable = { reachability in
                dispatch_async(dispatch_get_main_queue()) {
                    self.delegate?.reachabilityChanged(Reachability.NetworkStatus.NotReachable)
                }
            }
        } else {
            NSNotificationCenter.defaultCenter().addObserver(self, selector: "reachabilityChanged:", name: ReachabilityChangedNotification, object: reachability)
        }
    }
    
    
    func startListen() {
        do{
            try reachability!.startNotifier()
        }catch{
            log.warning("could not start reachability notifier")
        }
    }
    
    func stopListen() {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: ReachabilityChangedNotification, object: nil)
        reachability!.stopNotifier()
        reachability = nil
    }
    
    
    func reachabilityChanged(note: NSNotification) {
        let reachability = note.object as! Reachability
        
        if reachability.isReachable() {
            delegate?.reachabilityChanged(reachability.currentReachabilityStatus)
        }
    }
    
    deinit {
        stopListen()
        NSNotificationCenter.defaultCenter().removeObserver(self,
            name: ReachabilityChangedNotification,
            object: reachability)
    }
}
