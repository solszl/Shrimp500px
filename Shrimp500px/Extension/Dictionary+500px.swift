//
//  Dictionary+500px.swift
//  Shrimp500px
//
//  Created by 振亮 孙 on 16/2/27.
//  Copyright © 2016年 papa.studio. All rights reserved.
//

import Foundation

extension Dictionary {
    
    /// URL 参数
    var queryString: String {
        var comps = [NSURLQueryItem]()
        for (key, val) in self {
            comps.append(NSURLQueryItem(name: key as! String, value: val as? String))
        }
        let components = NSURLComponents()
        components.queryItems = comps
        return components.query!
    }
}