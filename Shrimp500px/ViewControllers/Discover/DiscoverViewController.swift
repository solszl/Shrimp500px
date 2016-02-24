//
//  DiscoverViewController.swift
//  Shrimp500px
//
//  Created by 振亮 孙 on 16/2/24.
//  Copyright © 2016年 papa.studio. All rights reserved.
//

import UIKit

class DiscoverViewController: BaseViewController {
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        log.warning("discover: step 2")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        log.warning("discover: step 1")
    }
}
