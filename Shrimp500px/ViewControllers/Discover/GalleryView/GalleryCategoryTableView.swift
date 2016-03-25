//
//  GalleryCategoryTableView.swift
//  Shrimp500px
//
//  Created by 振亮 孙 on 16/3/24.
//  Copyright © 2016年 papa.studio. All rights reserved.
//

import UIKit

class GalleryCategoryTableView: UITableView {
    
}

extension GalleryCategoryTableView: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
}

extension GalleryCategoryTableView: UITableViewDelegate {
    
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = tableView.dequeueReusableCellWithIdentifier("") as! GalleryHeaderView
        
        return headerCell
    }
}
