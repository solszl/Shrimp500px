//
//  MainTabBarViewController.swift
//  Shrimp500px
//
//  Created by 振亮 孙 on 16/2/24.
//  Copyright © 2016年 papa.studio. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        //        super.viewDidLoad()
        
        addTabChildren()
    }
    
    /**
     初始化所有子控制器
     */
    private func addTabChildren() {
        // 首页
        addOneChlildVc(HomeViewController(), title: "Home1", imageName: "", selectedImageName: "")
        // 探索发现
        addOneChlildVc(DiscoverViewController(), title: "Find", imageName: "", selectedImageName: "")
        // 照相上传
        addOneChlildVc(HomeViewController(), title: "Take", imageName: "", selectedImageName: "")
        // 消息
        addOneChlildVc(HomeViewController(), title: "Notifition", imageName: "", selectedImageName: "")
        // 我的
        addOneChlildVc(MyViewController(), title: "Profile", imageName: "", selectedImageName: "")
    }
    
    private func addOneChlildVc(childVc: UIViewController, title: String, imageName: String, selectedImageName: String) {
        childVc.tabBarItem = UITabBarItem(title: title, image: nil, selectedImage: nil)
        addChildViewController(childVc)
    }
}
