//
//  BizzUser.swift
//  Shrimp500px
//
//  Created by 振亮 孙 on 16/3/3.
//  Copyright © 2016年 papa.studio. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire
import ObjectMapper

class BizzUser {
    
    let APIPath: String = "/users"
    
    // MARK: 无需登陆即可访问的方法
    
    // MARK: 需登陆才可以使用的方法
    
    // MARK: 另一个API 地址返回的数据  
    /** mobileapi.500px.com
        没有api文档, 只能获取本地数据
    */
    
    func fatchRecommendUser(callback:(userList:[RecommendUserInfo]?,error:ErrorType?)->Void) -> Void {
        let path = NSBundle.mainBundle().pathForResource("Users", ofType: "json")
        let data = NSData(contentsOfFile: path!)
        let rawData = JSON(data: data!)
        let array = rawData["recommended"].arrayValue
        
        var result: [RecommendUserInfo] = []
        array.map {
            let info = Mapper<RecommendUserInfo>().map($0.rawValue)
            result.append(info!)
        }
        callback(userList: result, error: nil)
    }
}

private enum UserURLRequest: URLRequestConvertible {
    var URLRequest: NSMutableURLRequest {
        let URL = NSURL(string: "")!
        let req = NSMutableURLRequest(URL: URL.URLByAppendingPathComponent(""))
        return req
    }
    
    private var method: Alamofire.Method {
        switch self {
        default: return .GET
        }
    }
}