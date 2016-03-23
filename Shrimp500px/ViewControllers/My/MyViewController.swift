//
//  MyViewController.swift
//  Shrimp500px
//
//  Created by 振亮 孙 on 16/2/29.
//  Copyright © 2016年 papa.studio. All rights reserved.
//

import UIKit
import SnapKit
import OAuthSwift
import Alamofire
import AlamofireObjectMapper

class MyViewController: BaseViewController {
    
    var btnLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnLogin = UIButton()
        btnLogin.setTitle("Login", forState: .Normal)
        btnLogin.setTitleColor(UIColor.redColor(), forState: .Normal)
        btnLogin.addTarget(self, action: #selector(btnLoginClick), forControlEvents: .TouchUpInside)
        self.view.addSubview(btnLogin)
        btnLogin.snp_makeConstraints { make in
            make.size.equalTo(self.view.snp_size)
        }
    }
    
    var webviewController = WebViewController()
    
    @objc private func btnLoginClick(btn: UIButton) {
        //        for test webview
        //        self.presentViewController(UINavigationController(rootViewController: webviewController), animated: true) {
        //
        //        }
        oauthswift.authorize_url_handler = self.webviewController
        oauthswift.authorizeWithCallbackURL(NSURL(string: "Shrimp500px://oauth-callback/")!, success: {
            credential, response, parameters in
            log.info("login OK")
            }, failure: {
                error in
                
        })
    }
}


extension AppDelegate {
    
    func application(app: UIApplication, openURL url: NSURL, options: [String : AnyObject]) -> Bool {
        if (url.host == "oauth-callback") {
            OAuthSwift.handleOpenURL(url)
        }
        return true
    }
}