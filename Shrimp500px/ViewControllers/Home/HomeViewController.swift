//
//  HomeViewController.swift
//  Shrimp500px
//
//  Created by 振亮 孙 on 16/2/19.
//  Copyright © 2016年 papa.studio. All rights reserved.
//

import UIKit
import SnapKit

class HomeViewController: BaseViewController {
    
    var tableView: UITableView!
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        log.warning("step 2")
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerClass(WorkItemCell.self, forCellReuseIdentifier: NibNames.WorkItemCell)
        tableView.separatorStyle = .SingleLine
        self.automaticallyAdjustsScrollViewInsets = false
        tableView.estimatedRowHeight = 100
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        log.warning("step 1")
        tableView = UITableView(frame: ScreenBounds)
        self.view.addSubview(tableView)
        
        tableView.snp_makeConstraints { (make) -> Void in
            make.edges.equalTo(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
            make.center.equalTo(self.view)
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(NibNames.WorkItemCell) as! WorkItemCell
        
        cell.imgCover.image = UIImage(named: "09")
        cell.tintColor = UIColor.redColor()
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        let cell = tableView.cellForRowAtIndexPath(indexPath) as! WorkItemCell
//        let size = cell.imgCover.bounds.size
//        return size.height
        
//        return 300.0
        let height:CGFloat = tableView.fd_heightForCellWithIdentifier(NibNames.WorkItemCell, cacheByIndexPath: indexPath) { [weak self]
            (cell) -> Void in
            let item = cell as! WorkItemCell
            item.imgCover.image = UIImage(named: "09") 
        }
        
        return height
    }
}