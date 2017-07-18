//
//  SelectedObject.swift
//  q
//
//  Created by qli on 2016/12/16.
//  Copyright © 2016年 qli. All rights reserved.
//

import Foundation

class Selected: NSObject {
    var selectedList = Array<SelectedObject>()
}


class SelectedObject: NSObject {
    var total: String = ""
    var page: String  = ""
    
    var nextPage = false
    
    var catId: String = ""
    
    var catName: String = ""
    
    var shortName: String = ""
    var type: String = ""
    
    var imageUrl: String = ""
    var booklist = [Book]()
}


class Book: NSObject {
    
    
    var bookId = ""
    
    var bookName = ""
    
    var scores = ""
    
    var scorePeople = ""
    
    var desc = ""
    var words = ""
    var tags = [String]()
    
    var botiques = ""
    
    var author = ""
    
    var clicks = ""
    
    var reservers = ""
    
    var comments = ""
    
    var imageUrl = ""
    
    var saleType = ""
    
    
    var state = ""
    
    var recentlyUpdateTime = ""
    var lastestChapter = ""
    
    var lastestChineseChapter = ""
    
    
}
