//
//  SHTabBarControllerViewController.swift
//  Shrimp500px
//
//  Created by 振亮 孙 on 16/2/18.
//  Copyright © 2016年 papa.studio. All rights reserved.
//

import UIKit
import XCGLogger

class SHTabBarControllerViewController: UITabBarController {

    
    /// 定义页签的枚举
    private enum Tab: Int {
        case Home
        case Search
        case Upload
        case Notification
        case Profile
        
        var title: String {
            switch self {
            case .Home:
                return "Home"
            case .Search:
                return "Search"
            case .Upload:
                return "Upload"
            case .Notification:
                return "Notification"
            case .Profile:
                return "Profile"
            }
        }
    }
    
    /// 前一个页签,默认为首页
    private var preivousTab =  Tab.Home
    
    deinit {
        log.info("deinit SHTabBar")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        delegate = self
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if let items = tabBar.items {
            for i in 0..<items.count {
                let item = items[i]
                let itemTitle = Tab(rawValue: i)?.title
                item.title = itemTitle
            }
        }
    }
}

// MARK: - UITabBarControllerDelegate extension
extension SHTabBarControllerViewController: UITabBarControllerDelegate {
    
}
