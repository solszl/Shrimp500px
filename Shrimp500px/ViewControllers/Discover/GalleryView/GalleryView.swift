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
    
    let galleryVM = GalleryViewModel()
    
    override init(frame: CGRect) {        
        super.init(frame: frame)

        galleryVM.fatchGalleryByType(.Editor)
        
        self.circleView = CarouselView()
        circleView.delegate = self
        self.addSubview(circleView)
        circleView.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(ScreenWidth)
            make.height.equalTo(200)
            make.leading.top.trailing.equalTo(0)
        }
        
        circleView.data = galleryVM.editorData
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension GalleryView: CirCleViewDelegate {
    func clickCurrentImage(currentIndxe: Int) {
        print(currentIndxe, terminator: "");
    }
}