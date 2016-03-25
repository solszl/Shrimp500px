//
//  GalleryView.swift
//  Shrimp500px
//
//  Created by 振亮 孙 on 16/3/10.
//  Copyright © 2016年 papa.studio. All rights reserved.
//

import Foundation
import UIKit

class GalleryView: UIView {
    
    var circleView: CarouselView!
    
    var recommondView: GalleryCategoryTableView!
    
    let galleryVM = GalleryViewModel()
    
    override init(frame: CGRect) {        
        super.init(frame: frame)

        fatchData()
        
        makeUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func fatchData() {
        galleryVM.fatchGalleryByType(.Editor)
    }
    
    private func makeUI() {
        self.circleView = CarouselView()
        circleView.delegate = self
        self.addSubview(circleView)
        circleView.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(ScreenWidth)
            make.height.equalTo(150)
            make.leading.top.trailing.equalTo(0)
        }
        
        circleView.data = galleryVM.editorData
        circleView.run = true
        
        self.recommondView = GalleryCategoryTableView()
        self.recommondView.backgroundColor = UIColor.redColor()
        self.addSubview(recommondView)
        
        self.recommondView.snp_makeConstraints { (make) in
            make.top.equalTo(circleView.snp_bottom)
            make.leading.equalTo(0)
            make.bottom.equalTo(self.snp_bottom)
            make.width.equalTo(ScreenWidth)
        }
    }
}

extension GalleryView: CirCleViewDelegate {
    func clickCurrentImage(currentIndxe: Int) {
        print(currentIndxe, terminator: "");
    }
}