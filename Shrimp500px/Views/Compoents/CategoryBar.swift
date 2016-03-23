//
//  CategoryBar.swift
//  Shrimp500px
//
//  Created by 振亮 孙 on 16/3/5.
//  Copyright © 2016年 papa.studio. All rights reserved.
//

import UIKit
import SnapKit

protocol CategoryBarDelegate {
    func categoryBarIndexChange(index: Int)
}

class CategoryBar: UIView {
    
    // 上线
    let topSeparatorLine = SeparatorLine()
    
    // 下线
    let bottomSeparatorLine = SeparatorLine()
    
    // 当前选中的index
    var selectIndex = 0
    
    // 前一个选项
    var preSelectIndex = -1
    
    // 前一个按钮
    var preSelectButton: CategoryButton?
    
    // 数据源
    var dataProvider = [String]()
    
    // 下划线
    var animLine: UIView!
    
    var delegate: CategoryBarDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(topSeparatorLine)
        self.topSeparatorLine.snp_makeConstraints { (make) -> Void in
            make.height.equalTo(0.5)
            make.leading.trailing.equalTo(0)
            make.top.equalTo(0)
            
        }
        
        self.addSubview(bottomSeparatorLine)
        bottomSeparatorLine.snp_makeConstraints { (make) -> Void in
            make.height.equalTo(0.5)
            make.bottom.equalTo(self.snp_bottom)
            make.leading.trailing.equalTo(0)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    /**
     标签数组, 设置数组后,自动添加按钮和下划线到bar内
     
     - parameter array: 标签文本 的 数组
     */
    func data(array: [String]) {
        guard array.count != 0 else {
            return
        }
        
        let len = array.count
        var preButton: CategoryButton?
        for (index, title) in array.enumerate() {
            let btn = CategoryButton(title: title)
            // 区分边界
//            btn.backgroundColor = UIColor.randomColor()
            self.addSubview(btn)
            
            // 创建一个tag标识.为了之后点击按钮过后动画移动
            btn.tag = index
            btn.addTarget(self, action: #selector(buttonClick), forControlEvents: .TouchUpInside)
            
            btn.snp_makeConstraints(closure: { (make) -> Void in
                make.width.equalTo(self.snp_width).dividedBy(len)
                make.centerY.equalTo(self)
                
                if preButton == nil {
                    make.leading.equalTo(0)
                    preButton = btn
                    btn.selected = true
                    preSelectButton = btn
                } else {
                    make.leading.equalTo((preButton?.snp_trailing)!)
                    preButton = btn
                }
            })
        }
        
        // 创建一个下划线, 默认将它扔到第一个按钮的下方
        animLine = UIView()
        animLine.backgroundColor = AppConfig.selectedColor()
        self.addSubview(animLine)
        self.animLine.snp_makeConstraints { (make) -> Void in
            make.height.equalTo(2)
            make.width.equalTo(self.snp_width).dividedBy(3)
            make.bottom.equalTo(self.snp_bottom)
            make.leading.equalTo(self)
        }
        
        self.preSelectIndex = self.selectIndex
    }
    
    @objc private func buttonClick(button: UIButton) {
        self.selectIndex = button.tag
        
        // 点的是当前选中的页签,返回.  看看后期有没有必要改成此处刷新数据.
        guard self.preSelectIndex != self.selectIndex else {
            return
        }
        // 索引变更
        self.preSelectIndex = self.selectIndex
        // 取消前一个状态
        self.preSelectButton?.selected = false
        // 设置当前状态
        button.selected = true
        // 设置前一个
        self.preSelectButton = button as? CategoryButton
        // 播放下划线动画
        UIView.animateWithDuration(0.15, delay: 0, options: .CurveEaseInOut, animations: { () -> Void in
            self.animLine.frame.origin.x = CGFloat(self.selectIndex) * self.animLine.width
            }, completion: nil)
        
        // 代理调用
        delegate?.categoryBarIndexChange(self.selectIndex)
    }
}