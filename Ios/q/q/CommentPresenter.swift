//
//  CommentPresenter.swift
//  q
//
//  Created by qli on 2017/3/27.
//  Copyright © 2017年 qli. All rights reserved.
//

import Foundation


import Alamofire
import SwiftyJSON


class CommentPresenter {
    

    let comm = CommentObject()
    
    var commentp: CommentProtocol?
    
    
    func handerJsonData(page: Int,size: Int,id: Int)  {
        
        
        
        
        Alamofire.request(Qurl.comment_all_url(page, size, id)).responseJSON{
            response in
            
            switch response.result{
                
            case .success:
                
                let json =  JSON(str: response.result.value!)
                let headerjson = json["header"]
                let code = headerjson["resultCode"].intValue
                if code == 200{
                   let json =  json["content"]
//                    print("JSON: \(json)")
                    
                    self.comm.page = json["page"].intValue
                    self.comm.nextpage = json["nextPage"].boolValue
                    self.comm.total = json["total"].intValue
   
                    for (index, json) in json["commentList"].arrayValue.enumerated(){
                        

                        
                        let clist = commentList()
                        clist.index = index
                        clist.commentId = json["commentId"].intValue
                        clist.critics = json["critics"].stringValue
                        clist.criticsId = json["criticsId"].stringValue
                        clist.content = json["content"].stringValue
                        clist.replies = json["replies"].stringValue
                        clist.likes = json["likes"].stringValue
                        clist.createTime = json["createTime"].stringValue
                        clist.visitor = json["visitor"].stringValue
                        self.comm.commentList.append(clist)
                    }
                    
                    self.commentp?.getCommentData(self.comm)

                }else{
                    
                    self.commentp?.getError(ERROR_TYPE.error_REQUEST)
                }
                break
                
            case .failure:
                
                self.commentp?.getError(ERROR_TYPE.error_REQUEST)
                
                break
            }
            
        }
        
    }
    
    func setOnCommentProtocol(commp: CommentProtocol)  {
        
        
        self.commentp = commp
        
    }

}
