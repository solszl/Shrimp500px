//
//  HomeViewController.swift
//  Shrimp500px
//
//  Created by 振亮 孙 on 16/2/19.
//  Copyright © 2016年 papa.studio. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // 注册xib组件
        collectionView.registerNib(UINib(nibName: NibNames.WorkCell, bundle: nil), forCellWithReuseIdentifier: NibNames.WorkCell)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.backgroundColor = UIColor.clearColor()
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return 50
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(NibNames.WorkCell, forIndexPath: indexPath) as! WorkCell
        
        let name = "cover" + String(arc4random() % 2 + 1)
        cell.imgCover.image = UIImage(named: name)
        cell.imgAvatar.image = UIImage(named: "avatar")
        cell.lblName.text = "ZhenLiang Sun"
        cell.lblMoment.text = "21Mins ago"
        cell.backgroundColor = UIColor.purpleColor()
        return cell
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        let size = CGSizeMake(AppConfig.ScreenWidth, 300)
        
        return size
    }

}