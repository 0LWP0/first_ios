//
//  MorePresenter.swift
//  q
//
//  Created by qli on 2017/3/11.
//  Copyright © 2017年 qli. All rights reserved.
//

import Foundation


import Alamofire
import SwiftyJSON

class MorePresenter {
    
    var moreobject = MoreObject()
    
    var moreprotocol:MoreProtocol!
    
    func handerJsonData(cid: String,page: Int,size: Int)  {
        Alamofire.request(Qurl.more_url(cid,page,size)).responseJSON { response in
            
            
            switch response.result{
                
                
            case .success:
                let json =  JSON(str: response.result.value!)
                
                let headerjson = json["header"]
                let code = headerjson["resultCode"].intValue
                
                if code == 200{
                    
                    let contentlist = json["content"]
                    
                    self.moreobject.total =  contentlist["total"].intValue
                    self.moreobject.page = contentlist["page"].intValue
                    self.moreobject.nextpage = contentlist["nextPage"].boolValue
                    
                    let bookList =  contentlist["bookList"].arrayValue
                    
                    for bjson in bookList{
                        let book = BookObject()
                        book.bookId = bjson["bookId"].intValue
                        book.bookName = bjson["bookName"].stringValue
                        book.scores = bjson["scores"].stringValue
                        book.scorePeople = bjson["scorePeople"].stringValue
                        book.desc = bjson["desc"].stringValue
                        book.words = bjson["words"].stringValue
                        book.botiques = bjson["botiques"].stringValue
                        book.author = bjson["author"].stringValue
                        book.clicks = bjson["clicks"].stringValue
                        book.reservers = bjson["reservers"].stringValue
                        book.comments = bjson["comments"].stringValue
                        book.imageUrl = bjson["imageUrl"].stringValue
                        book.saleType = bjson["saleType"].stringValue
                        book.state = bjson["state"].stringValue
                        book.recentlyUpdateTime = bjson["recentlyUpdateTime"].stringValue
                        book.lastestChapter = bjson["lastestChapter"].stringValue
                        book.lastestChineseChapter = bjson["lastestChineseChapter"].stringValue
                        self.moreobject.bookList.append(book)
                        
                    }
                    self.moreprotocol.getMoreData(self.moreobject)
                }else{
                    
                    self.moreprotocol.getError(ERROR_TYPE.error_REQUEST)
                    
                }
                
                
                
                
                break
                
            case .failure:
                self.moreprotocol.getError(ERROR_TYPE.error_REQUEST)
                
                break
            }
            
        }
    }
    
    func setOnMoreProtocol(more: MoreProtocol)  {
        
        
        self.moreprotocol = more
        
    }
    
    
}
