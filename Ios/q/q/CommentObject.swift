//
//  CommentObject.swift
//  q
//
//  Created by qli on 2017/3/27.
//  Copyright © 2017年 qli. All rights reserved.
//

import Foundation

//查询全部评论
class Comment :HeaderObject{
    var content = CommentObject()
    
}

class CommentObject: NSObject {
    var total = -1
    var page = -1
    var nextpage = true
    var commentList = Array<commentList>()

}

class commentList: NSObject {
    var commentId = -1
    var index = -1
    var critics = ""
    var criticsId = ""
    var content = ""
    var replies = ""
    var likes = ""
    var createTime = ""
    var visitor = ""
}
