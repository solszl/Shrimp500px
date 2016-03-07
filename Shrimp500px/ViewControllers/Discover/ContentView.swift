//
//  ContentView.swift
//  Shrimp500px
//
//  Created by 振亮 孙 on 16/3/7.
//  Copyright © 2016年 papa.studio. All rights reserved.
//

import UIKit

class ContentView: UIView {
    
    private var content: UIView!
    
    override init(frame: CGRect) {
        
        content = UIView()
        super.init(frame: frame)
        
        self.addSubview(content)
        content.snp_makeConstraints { (make) -> Void in
            make.size.equalTo(self)
            make.top.leading.equalTo(0)
        }
    }
    
    private func removeCurrentView() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
