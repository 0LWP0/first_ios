//
//  ChapterListObjectswift.swift
//  q
//
//  Created by qli on 16/07/2017.
//  Copyright © 2017 qli. All rights reserved.
//

import Foundation

//class ChapterListObject: HeaderObject {
//    var content = ChapterList()
//}

class ChapterList: NSObject {
    var total = -1
    var page = -1
    var nextpage = false
    var chapterList = Array<ChapterObject>()
    
}

class ChapterObject: NSObject {
    var chapterId = -1
    var chapterOrder = -1
    var chapterTitle = ""
    var updateTime = ""
    var words = ""
    var price = -1
}
