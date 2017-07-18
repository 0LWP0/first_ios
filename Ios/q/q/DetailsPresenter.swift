//
//  DetailsPresenter.swift
//  q
//
//  Created by qli on 2017/3/8.
//  Copyright © 2017年 qli. All rights reserved.
//

import Foundation

import Alamofire
import SwiftyJSON

class DetailsPresenter {
    
    var details = DetailsObject()
    
    var detailsp: DetailsProtocol?
    
    func handerJsonData(_ bookid: String)  {
        
        Alamofire.request(Qurl.details_url(bookid)).responseJSON { response in
            
            
            switch response.result{
                
                
            case .success:
                let json =  JSON(str: response.result.value!)
                
                
                
                let content = json["content"].arrayValue[0]
//                print("\(content["imageUrl"].stringValue)")
                self.details.bookId = content["bookId"].intValue
                self.details.bookName = content["bookName"].stringValue
                self.details.scores = content["scores"].floatValue
                self.details.scorePeople = content["scorePeople"].stringValue
                self.details.ddesc = content["desc"].stringValue
                self.details.words = content["words"].stringValue
                self.details.botiques = content["botiques"].stringValue
                self.details.author = content["author"].stringValue
                self.details.clicks = content["clicks"].stringValue
                self.details.reservers = content["reservers"].stringValue
                self.details.comments = content["comments"].stringValue
                self.details.imageUrl = content["imageUrl"].stringValue
                self.details.saleType = content["saleType"].stringValue
                self.details.state = content["state"].stringValue
                self.details.recentlyUpdateTime = content["recentlyUpdateTime"].stringValue
                self.details.lastestChapter = content["lastestChapter"].stringValue
                self.details.lastestChineseChapter = content["lastestChineseChapter"].stringValue
                
                
                let recentlyUpdateChaptes = content["recentlyUpdateChaptes"].arrayValue
                let recentComment = content["recentComment"].arrayValue
                for json in recentlyUpdateChaptes{
                
                    let recent = recentlyUpdateChaptesObject()
                    
                    recent.chapterId = json["chapterId"].intValue
                    recent.chapterChinersOrder = json["chapterChinersOrder"].stringValue
                    recent.chapterOrder = json["chapterOrder"].stringValue
                    recent.chapterTitle = json["chapterTitle"].stringValue
                    recent.updateTime =  json["updateTime"].stringValue
                    recent.words = json["words"].stringValue
                    recent.price = json["price"].stringValue
                    self.details.recentlyUpdateChaptes.append(recent)
                }
                
                for json in recentComment{
                    let rec =  recentCommentObject()
                    rec.commentId = json["commentId"].intValue
                    rec.critics = json["critics"].stringValue
                    rec.criticsId = json["criticsId"].stringValue
                    rec.content = json["content"].stringValue
                    rec.replies = json["replies"].stringValue
                    rec.likes = json["likes"].stringValue
                    rec.createTime = json["createTime"].stringValue
                    rec.visitor = json["visitor"].stringValue
                    self.details.recentComment.append(rec)
                }
                self.detailsp?.getDetailsData(self.details)
                break
                
            case .failure:
                
                self.detailsp?.getError(ERROR_TYPE.error_REQUEST)
                
                break
            }
            
        }
    }
    
    func setOnDetailsProtocol(details: DetailsProtocol)  {
        
        self.detailsp = details
        
    }

}
