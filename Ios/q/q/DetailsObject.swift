//
//  DetailsObject.swift
//  q
//
//  Created by qli on 2017/3/8.
//  Copyright © 2017年 qli. All rights reserved.
//

import Foundation

//class Details: HeaderObject {
//    var content = Array<DetailsObject>()
//}

class DetailsObject: HeaderObject {
    var bookId = -1
    var bookName = ""
    var scores: Float = 0.0
    
    var scorePeople = ""
    var ddesc = ""
    var words = ""
    
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
    
    var recentlyUpdateChaptes = Array<recentlyUpdateChaptesObject>()
    var recentComment = Array<recentCommentObject>()
}
class recentlyUpdateChaptesObject: NSObject {
    var chapterId = -1
    var chapterChinersOrder = ""
    var chapterOrder = ""
    var chapterTitle = ""
    var updateTime = ""
    var words = ""
    var price = ""
}

class recentCommentObject: NSObject {
    var commentId = -1
    var critics = ""
    var criticsId = ""
    var content = ""
    var replies = ""
    var likes = ""
    var createTime = ""
    var visitor = ""
}
