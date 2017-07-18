//
//  FindXObject.swift
//  q
//
//  Created by qli on 2017/3/3.
//  Copyright © 2017年 qli. All rights reserved.
//

import Foundation


class FindXObject: HeaderObject {
    
    
    var total = -1
    
    var page = -1
    
    var nextpage = true
    
    
    var commentList = Array<CommentListObject>()
    
}


class CommentListObject: NSObject {
    
    var commentId = -1
    
    var critics = ""
    var criticsId = ""
    var content = ""
    var icon = ""
    var replies = ""
    
    var likes = ""
    
    var createTime = ""
    
    var book = BookObject()
    
    var visitor = ""
    
}


