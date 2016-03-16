//
//  BizzGallery.swift
//  Shrimp500px
//
//  Created by 振亮 孙 on 16/3/3.
//  Copyright © 2016年 papa.studio. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire
import ObjectMapper

class BizzGallery {
    
    let APIPath: String = "/galleries"
    
    // MARK: 无需登陆即可访问的方法
    
    // MARK: 需登陆才可以使用的方法
    
    // non-api
    func fatchGalleryByType(type: GalleryType, callback: (data:[Gallery]?,error:ErrorType?) -> Void) {
        
        var dataFromName: String = ""
        switch type {
        case .Editor:
            dataFromName = "Galleries_top"
        case .Popular:
            dataFromName = "Galleries_middle"
        case .Fresh:
            dataFromName = "Galleries_bottom"
        }
        
        let path = NSBundle.mainBundle().pathForResource(dataFromName, ofType: "json")
        let data = NSData(contentsOfFile: path!)
        let rawData = JSON(data: data!)
        let array = rawData["galleries"].arrayValue
        
        var result: [Gallery] = []
        array.map {
           result.append(Mapper<Gallery>().map($0.rawValue)!)
        }
        callback(data: result, error: nil)
    }
}

enum GalleryType: String {
    case Editor // 编辑推荐
    case Popular // 当红
    case Fresh // 新
}