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

//    lazy var carouselView: CarouselView! = {
//    
//        let carousel = CarouselView()
//        return carousel
//    }()
    
    var circleView: CarouselView!
    
    let galleryVM = GalleryViewModel()
    
    override init(frame: CGRect) {        
        super.init(frame: frame)

        galleryVM.fatchGalleryByType(.Editor)
        
        let imageArray: [UIImage!] = [UIImage(named: "09"), UIImage(named: "12"), UIImage(named: "11")]
        
        self.circleView = CarouselView(frame: CGRectMake(0, 64, ScreenWidth, 200), imageArray: imageArray)
        circleView.backgroundColor = UIColor.orangeColor()
        circleView.delegate = self
        self.addSubview(circleView)
        circleView.backgroundColor = UIColor.whiteColor()
        circleView.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(ScreenWidth)
            make.height.equalTo(200)
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