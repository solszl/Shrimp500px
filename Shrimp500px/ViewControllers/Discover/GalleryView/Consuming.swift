//
//  Consuming.swift
//  Shrimp500px
//
//  Created by 振亮 孙 on 16/3/11.
//  Copyright © 2016年 papa.studio. All rights reserved.
//

import Foundation
import UIKit

class Consuming: NSObject {
    /**
     轮播
     */
    class func carousel(view: CarouselView, status: ()->Bool) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) { () -> Void in
            repeat{
                view.nextPage()
                NSThread.sleepForTimeInterval(3)
            }while(status())
        }
    }
    
}