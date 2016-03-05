//
//  CategoryButton.swift
//  Shrimp500px
//
//  Created by 振亮 孙 on 16/3/5.
//  Copyright © 2016年 papa.studio. All rights reserved.
//

import UIKit

class CategoryButton: UIButton {
    init(title: String) {
        super.init(frame: CGRect.zero)
        setTitle(title, forState: .Normal)
        setTitle(title, forState: .Selected)
        setTitleColor(AppConfig.unselectedColor(), forState: .Normal)
        setTitleColor(AppConfig.selectedColor(), forState: .Selected)

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
