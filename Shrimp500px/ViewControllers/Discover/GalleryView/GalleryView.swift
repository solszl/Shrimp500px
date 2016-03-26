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

        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 8
        layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        layout.headerReferenceSize = CGSizeMake(0, 5)

        
        self.recommondView = GalleryCategoryTableView(frame: CGRectZero, collectionViewLayout: layout)
        self.recommondView.backgroundColor = UIColor.redColor()
        self.recommondView.dataSource = self
        self.recommondView.delegate = self
        self.recommondView.registerClass(GalleryRecommendItemRender.self, forCellWithReuseIdentifier: "GalleryRecommendItemRender")
        // 注册一个Header
        self.recommondView.registerClass(GalleryHeaderView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "GalleryHeaderView")
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

extension GalleryView: UICollectionViewDataSource {
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("GalleryRecommendItemRender", forIndexPath: indexPath)
        cell.backgroundColor = UIColor.randomColor()
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        if indexPath.section == 0 && kind == UICollectionElementKindSectionHeader {
            let headView = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: "GalleryHeaderView", forIndexPath: indexPath) as! GalleryHeaderView
            headView.setData(indexPath.row)
            return headView
        }
        
        return UICollectionReusableView()
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 2
    }
    
}

extension GalleryView: UICollectionViewDelegate {
    
}
