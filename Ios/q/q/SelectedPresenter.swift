//
//  SelectedPresenter.swift
//  q
//
//  Created by qli on 2016/12/16.
//  Copyright © 2016年 qli. All rights reserved.
//

import Foundation


import Alamofire
import SwiftyJSON


//typealias successValue=(_ list:Selected)->Void
//
//typealias errorValue=(_ error_code:Int)->Void

class SelectedPresenter {
    
    var selectedlist = Selected()
    
//    var delegate: successValue!
    
    var mBaseProtocol: BaseProtocol!
    
    func requestData()  {
        Alamofire.request(Qurl.SELECTED_URL).responseJSON { response in
            
//            let data = response.result.value
//            let utf8Text = String(data: response.data!, encoding: .utf8)
            
            
            switch  response.result{
            case .success:
                let json =  JSON(str: response.result.value!)
//                print("\(json)")
              
                let contentlist = json["content"].arrayValue
                
                for json in contentlist {
                    let seleced = SelectedObject()
                    
                    seleced.total = json["total"].stringValue
                    seleced.page = json["page"].stringValue
                    seleced.nextPage = json["nextPage"].boolValue
                    seleced.catId = json["catId"].stringValue
                    seleced.catName = json["catName"].stringValue
                    
                    seleced.shortName = json["shortName"].stringValue
                    seleced.imageUrl = json["imageUrl"].stringValue
                    seleced.type = json["type"].stringValue
                                        

                    if (!json["bookList"].arrayValue.isEmpty){
                        for bookjson in json["bookList"].arrayValue{
                            let book = Book()
                            book.bookId = bookjson["bookId"].stringValue
                            book.bookName = bookjson["bookName"].stringValue
                            book.scores = bookjson["scores"].stringValue
                            book.desc = bookjson["desc"].stringValue
                            book.words = bookjson["words"].stringValue
//                            book.tags = bookjson["tags"].arrayObject as! [String]
                            book.botiques = bookjson["botiques"].stringValue
                            book.author = bookjson["author"].stringValue
                            book.clicks = bookjson["clicks"].stringValue
                            book.reservers = bookjson["reservers"].stringValue
                            book.comments = bookjson["comments"].stringValue
                            book.imageUrl = bookjson["imageUrl"].stringValue
                            book.saleType = bookjson["saleType"].stringValue
                            book.state = bookjson["state"].stringValue
                            book.recentlyUpdateTime = bookjson["recentlyUpdateTime"].stringValue
                            book.lastestChapter = bookjson["lastestChapter"].stringValue
                            book.lastestChineseChapter = bookjson["lastestChineseChapter"].stringValue
                            book.catId = bookjson["catId"].stringValue
                            book.type = bookjson["type"].stringValue
                            book.catName = bookjson["catName"].stringValue
                            seleced.booklist.append(book)
                        }
                        
                      

                    }
                    
                    
                   
                    self.selectedlist.selectedList.append(seleced)
                    
                }
                
                if (self.mBaseProtocol != nil){
//                            self.delegate(self.selectedlist)
                    
                    self.mBaseProtocol.getSuccess(self.selectedlist)
                }

                break
                
            case .failure:
                
                if (self.mBaseProtocol != nil){
                    //                            self.delegate(self.selectedlist)
                    
                    self.mBaseProtocol.getError(ERROR_TYPE.error_OTHER)
                }

//                self.delegate.getError(error: ERROR_TYPE.ERROR_OTHER)
                
                break
                
            
            
            }
            

            
            
        }
    }
    
    func setBaseProtocoListener(_ base :BaseProtocol)  {
        self.mBaseProtocol = base
    }

    
    
}
