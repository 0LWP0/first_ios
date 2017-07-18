//
//  BookStoreObject.swift
//  q
//
//  Created by qli on 2017/3/1.
//  Copyright © 2017年 qli. All rights reserved.
//

import Foundation


class BookStore:HeaderObject{
    
    var content = Array<BookStoreObject>()
    
}

class BookStoreObject: NSObject {
    
    
    var total = 0
    
    var page  = 0
    
    var catId = 0
    var catName = ""
    
    var imageUrl = ""
    var desc = ""
    
    var type = ""
    
    
    var subCatList = Array<BookStoreSubObject>()
    
}

class BookStoreSubObject: NSObject {
    var total = 0
    
    
    var catId = 0
    var catName = ""
    
    var imageUrl = ""
    var desc = ""
    
    var type = ""
    
    
    
}
