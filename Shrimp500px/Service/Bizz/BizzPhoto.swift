//
//  BizzPhoto.swift
//  Shrimp500px
//
//  Created by 振亮 孙 on 16/3/3.
//  Copyright © 2016年 papa.studio. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

class BizzPhoto {
    //: URLRequestConvertible
    
    
    private var method: Alamofire.Method {
        switch self {
        default: return .GET
        }
    }
    
    let path: String = "/photos"

}



// 使用方法
//let url = "https://api.500px.com/v1/photos?feature=fresh_today&sort=created_at&image_size=3&include_store=store_download&include_states=voted&consumer_key=SHxQG62Gp8UYe8ZTArCXDdH404HFXtPvMlhqth3U"
//
//Alamofire.request(.GET, url).responseObject { (response: Response<Photos, NSError>) -> Void in
//    
//    let res = response.result.value
//    
//    if let allPhotos = res?.allPhoto {
//        for photo in allPhotos {
//            print(photo.id, photo.imgName )
//        }
//    }
//    
//    print(res?.allPhoto?.count)
//}