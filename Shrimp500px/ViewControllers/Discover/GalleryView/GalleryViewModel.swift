//
//  GalleryViewModel.swift
//  Shrimp500px
//
//  Created by 振亮 孙 on 16/3/16.
//  Copyright © 2016年 papa.studio. All rights reserved.
//

import Foundation

class GalleryViewModel {
    
    let bizz: BizzGallery = BizzGallery()
    
    var editorData: [Gallery]?
    
    var popularData: [Gallery]?
    
    var freshData: [Gallery]?
    
    func fatchGalleryByType(type: GalleryType) {
        
        bizz.fatchGalleryByType(type) {
            data, error in
            print(type, data?.count)
        }
    }
}