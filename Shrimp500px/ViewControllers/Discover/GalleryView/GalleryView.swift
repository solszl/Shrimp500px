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

    lazy var carouselView: CarouselView! = {
    
        let carousel = CarouselView()
        carousel.run = true
        carousel.viewDataSource = self
        carousel.viewDelegate = self
        return carousel
    }()
    
    override init(frame: CGRect) {        
        super.init(frame: frame)
        
        self.addSubview(carouselView)
        carouselView.backgroundColor = UIColor.whiteColor()
        carouselView.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(ScreenWidth)
            make.height.equalTo(200)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension GalleryView: CarouselDataSource {
    func numOfViews() -> Int {
        return 5
    }
    func carouselView(carouselView: CarouselView, viewIndex: Int) -> UIView {
        
//        let render = CarouselItemRender()
//        return render
        let v = UIView()
//        v.snp_makeConstraints { (make) -> Void in
//            make.size.equalTo(carouselView)
//            make.center.equalTo(carouselView)
//        }
//        v.backgroundColor = UIColor.randomColor()
        return v
    }
}

extension GalleryView: CarouselDelegate {
    func carouselView(view: CarouselView, touched index: Int) {
        print("touched \(index)")
    }
}