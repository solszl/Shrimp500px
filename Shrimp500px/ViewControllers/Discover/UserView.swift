//
//  UserView.swift
//  Shrimp500px
//
//  Created by 振亮 孙 on 16/3/7.
//  Copyright © 2016年 papa.studio. All rights reserved.
//

import UIKit

class UserView: UIView {
    var tableView: UITableView!
    
    override init(frame: CGRect) {
        
        tableView = UITableView()
        super.init(frame: frame)
        
        self.addSubview(tableView)
        
        tableView.snp_makeConstraints { (make) -> Void in
            make.size.equalTo(self)
            make.center.equalTo(self)
        }
        
        tableView.registerClass(RecommendUser.self, forCellReuseIdentifier: NibNames.RecommendUser)
        tableView.estimatedRowHeight = 200
//        tableView.separatorStyle = .None
        tableView.dataSource = self
        tableView.delegate = self
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension UserView: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 40
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(NibNames.RecommendUser) as! RecommendUser
        return cell
        
//        let cell = UITableViewCell()
//        cell.textLabel?.text = String(indexPath.row)
//        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let h = tableView.fd_heightForCellWithIdentifier(NibNames.RecommendUser) { (obj) -> Void in
            let cell = obj as! RecommendUser
            
            cell.imgCover.image = UIImage(named: "bird")
        }
        
        print(h)
        return h
    }
}

extension UserView: UITableViewDelegate {
    
}
