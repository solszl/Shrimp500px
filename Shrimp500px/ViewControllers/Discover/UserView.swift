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
    
    let user = User2(id: 10000, username: "Sol", avatar: "11")
    
    override init(frame: CGRect) {
        
        tableView = UITableView()
        super.init(frame: frame)
        
        self.addSubview(tableView)
        
        tableView.snp_makeConstraints { (make) -> Void in
            make.size.equalTo(self)
            make.center.equalTo(self)
        }
        
        tableView.registerClass(RecommendUser.self, forCellReuseIdentifier: NibNames.RecommendUser)
        tableView.estimatedRowHeight = 240
        tableView.separatorStyle = .None
        tableView.dataSource = self
        tableView.delegate = self
//        tableView.allowsSelection = false
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension UserView: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(NibNames.RecommendUser) as! RecommendUser
        
        cell.configWithUserData(user)
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let h = tableView.fd_heightForCellWithIdentifier(NibNames.RecommendUser) { (obj) -> Void in
            let cell = obj as! RecommendUser
            
            cell.configWithUserData(self.user)
        }
        
        print(h)
        return h
    }
}

extension UserView: UITableViewDelegate {
    
}