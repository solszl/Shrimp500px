//
//  DiscoverViewController.swift
//  Shrimp500px
//
//  Created by 振亮 孙 on 16/2/24.
//  Copyright © 2016年 papa.studio. All rights reserved.
//

import UIKit

class DiscoverViewController: BaseViewController {
    
    var searchBar: UISearchBar!
    
    var contentView: ContentView!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        log.warning("discover: step 2")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        log.warning("discover: step 1")
        
        // 搜索栏
        searchBar = UISearchBar()
        searchBar.searchBarStyle = .Minimal
        searchBar.sizeToFit()
        searchBar.placeholder = "Search Shrimp 500px"
        searchBar.delegate = self
        self.view.addSubview(searchBar)
        
        searchBar?.snp_makeConstraints(closure: { (make) -> Void in
            make.width.equalTo(ScreenWidth)
            make.top.equalTo(20)
        })
        
        // 页签栏
        let categoryBar = CategoryBar()
        categoryBar.data(["照片","画廊","用户"])
        categoryBar.delegate = self
        self.view.addSubview(categoryBar)
        
        categoryBar.snp_makeConstraints { (make) -> Void in
            make.size.equalTo(CGSize(width: ScreenWidth, height: 43))
            make.left.equalTo(0)
            make.top.equalTo(searchBar.snp_bottom)
        }
        
        // 内容栏
        contentView = ContentView()
        self.view.addSubview(contentView)
        contentView.backgroundColor = UIColor.randomColor()
        
        contentView.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(ScreenWidth)
            make.top.equalTo(categoryBar.snp_bottom)
            make.bottom.equalTo(self.view.snp_bottom).offset(-49)
            make.leading.equalTo(0)
        }
        
        let users = UserView()
        contentView.addSubview(users)
        users.snp_makeConstraints { (make) -> Void in
            make.size.equalTo(contentView)
            make.center.equalTo(contentView)
        }
        
//        let gallery = GalleryView()
//        contentView.addSubview(gallery)
//        gallery.snp_makeConstraints { (make) -> Void in
//            make.size.equalTo(contentView)
//            make.center.equalTo(contentView)
//        }
    }
}

extension DiscoverViewController: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        print("search:\(searchBar.text)")
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}

extension DiscoverViewController: CategoryBarDelegate {
    func categoryBarIndexChange(index: Int) {
        print("激活第 \(index) 个页签")
    }
}
