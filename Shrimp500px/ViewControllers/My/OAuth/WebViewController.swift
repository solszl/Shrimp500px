//
//  OAuthWebViewController.swift
//  Shrimp500px
//
//  Created by 振亮 孙 on 16/2/29.
//  Copyright © 2016年 papa.studio. All rights reserved.
//

import OAuthSwift
import UIKit

let oauthswift = OAuth1Swift(
    consumerKey:    CustomKey,
    consumerSecret: CustomSecret,
    requestTokenUrl: "https://api.500px.com/v1/oauth/request_token",
    authorizeUrl:"https://api.500px.com/v1/oauth/authorize",
    accessTokenUrl:"https://api.500px.com/v1/oauth/access_token"
)
/// 登陆界面,进行OAuth验证 <li/>网页.这样可以不跳转到safari
class WebViewController: OAuthWebViewController {
    
    var targetURL : NSURL = NSURL()
    
    // web 容器
    let webView = UIWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 根据web容器大小对网页是否进行缩放
        self.webView.scalesPageToFit = true
        // 设置webview的代理
        self.webView.delegate = self
        
        self.webView.frame = ScreenBounds
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Cancel, target: self, action: #selector(cancel))
        
        let url = NSBundle.mainBundle().URLForResource("about", withExtension:"html")
        let myRequest = NSURLRequest(URL: url!);
        webView.loadRequest(myRequest);
        
        self.view.addSubview(self.webView)
    }
    
    override func handle(url: NSURL) {
        self.targetURL = url
        
        super.handle(url)
        
        loadAddress()
    }
    
    func loadAddress() {
        let req = NSURLRequest(URL: self.targetURL)
        // 请求登陆
        self.webView.loadRequest(req)
    }
    
    func cancel() {
        dismissViewControllerAnimated(true, completion: nil)
    }
}

extension WebViewController: UIWebViewDelegate {
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        if let url = request.URL where (url.scheme == "shrimp500px"){
            self.dismissWebViewController()
        }
        return true
    }
}
