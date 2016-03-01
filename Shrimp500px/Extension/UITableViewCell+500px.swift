//
//  UITableViewCell+500px.swift
//  Shrimp500px
//
//  Created by 振亮 孙 on 16/3/1.
//  Copyright © 2016年 papa.studio. All rights reserved.
//

import UIKit

extension UITableViewCell {
    func addCustomSeperator(lineColor: UIColor) {
        let seperatorView = UIView(frame: CGRect(x: 0, y: self.frame.height - 1, width: self.frame.width + 200, height: 1))
        seperatorView.tag = 101
        seperatorView.backgroundColor = lineColor
        self.addSubview(seperatorView)
    }
}
