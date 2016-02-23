//
//  HomeLayout.swift
//  Shrimp500px
//
//  Created by 振亮 孙 on 16/2/23.
//  Copyright © 2016年 papa.studio. All rights reserved.
//

import UIKit

protocol HomeLayoutDelegame {
    // 照片高度
    func collectionView(collectionView:UICollectionView, heightForPhotoAtIndexPath indexPath:NSIndexPath,
        withWidth:CGFloat) -> CGFloat
    
    // 评论高度
    func collectionView(collectionView: UICollectionView,
        heightForCommentAtIndexPath indexPath: NSIndexPath, withWidth width: CGFloat) -> CGFloat
}

class HomeLayout: UICollectionViewLayout {
    override func prepareLayout() {
        super.prepareLayout()
    }
    
    override func collectionViewContentSize() -> CGSize {
        return CGSizeZero
    }
    
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return []
    }
}
