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
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        log.warning("discover: step 2")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        log.warning("discover: step 1")
        
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
        
        let categoryBar = CategoryBar()
        self.view.addSubview(categoryBar)
        
        categoryBar.snp_makeConstraints { (make) -> Void in
            make.size.equalTo(CGSize(width: ScreenWidth, height: 43))
            make.left.equalTo(0)
            make.top.equalTo(searchBar.snp_bottom)
        }
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
