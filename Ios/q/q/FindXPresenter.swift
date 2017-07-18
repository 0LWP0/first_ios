//
//  FindXPresenter.swift
//  q
//
//  Created by qli on 2017/3/3.
//  Copyright © 2017年 qli. All rights reserved.
//

import Foundation


import Alamofire
import SwiftyJSON

class FindXPresenter {
    
    
    var findobject = FindXObject()
    
    var findprotocol:FindXProtocol!
    
    func handerJsonData(p: Int,s: Int)  {
        
        
//        let imageCache = AutoPurgingImageCache()
        Alamofire.request(Qurl.find_comment(page: p, size: s)).responseJSON { response in
            
            
            switch response.result{
                
                
            case .success:
                let json =  JSON(str: response.result.value!)
                
                
                let contentlist = json["content"]
                
                
                self.findobject.total  =  contentlist["total"].intValue
                self.findobject.nextpage = contentlist["nextPage"].boolValue
                self.findobject.page = contentlist["page"].intValue
                


                    
                    
                    for json in contentlist["commentList"].arrayValue{
                        let commobject = CommentListObject()
                        commobject.commentId = json["commentId"].intValue
                        commobject.critics = json["critics"].stringValue
                        commobject.criticsId = json["criticsId"].stringValue
                        commobject.content = json["content"].stringValue
                        
                        commobject.replies = json["replies"].stringValue
                        commobject.likes = json["likes"].stringValue
                        commobject.createTime = json["createTime"].stringValue
                        commobject.visitor = json["visitor"].stringValue
                        commobject.icon = json["icon"].stringValue
                        let b = BookObject()
                        
                        let bookjson = json["book"]
                        b.bookId = bookjson["bookId"].intValue
                        b.bookName = bookjson["bookName"].stringValue
                        b.scores = bookjson["scores"].stringValue
                        b.scorePeople = bookjson["scorePeople"].stringValue
                        b.desc = bookjson["desc"].stringValue
                        
                        b.words  = bookjson["words"].stringValue
                        b.botiques = bookjson["botiques"].stringValue
                        b.author = bookjson["author"].stringValue
                        b.clicks = bookjson["clicks"].stringValue
                        
                        b.reservers = bookjson["reservers"].stringValue
                        b.comments = bookjson["comments"].stringValue
                        b.imageUrl = bookjson["imageUrl"].stringValue
                        b.saleType = bookjson["saleType"].stringValue
                        b.state = bookjson["state"].stringValue
                        
                        b.recentlyUpdateTime = bookjson["recentlyUpdateTime"].stringValue
                        b.lastestChapter = bookjson["lastestChapter"].stringValue
                        b.lastestChineseChapter = bookjson["lastestChineseChapter"].stringValue
                        commobject.book = b
                       self.findobject.commentList.append(commobject)
                    }

                
//                print("\(self.findobject.commentList.count)")
                self.findprotocol.getFindXData(self.findobject)
                break
                
            case .failure:
                
                self.findprotocol.getError(ERROR_TYPE.error_REQUEST)
                
                break
            }
            
        }
    }
    
    func setOnBookStoreProtocol(book: FindXProtocol)  {
        
        
        self.findprotocol = book
        
    }

}
