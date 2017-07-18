//
//  FindObject.swift
//  q
//
//  Created by qli on 2017/3/3.
//  Copyright © 2017年 qli. All rights reserved.
//

import Foundation


class Find: HeaderObject {
    
    var content = Array<FindObject>()
    
}

class FindObject: NSObject {
    
    var total = -1
    
    var page = -1
    
    var catId = -1
    
    var carName = ""
    
    var imageUrl = ""
    
    var desc = ""
    
    var type = ""
    
    var subCatList = Array<FindSubCatlistObject>()
    
    
}

class FindSubCatlistObject: NSObject {
    var total = -1
    var catId =  -1
    
    var catName = ""
    
    
    var imageUrl = ""
    var desc = ""
    
    var type = ""
}
