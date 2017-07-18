//
//  BookStorePresenter.swift
//  q
//
//  Created by qli on 2017/3/1.
//  Copyright © 2017年 qli. All rights reserved.
//

import Foundation

import Alamofire
import SwiftyJSON

class BookStorePresenter {
    
    var bookstore = BookStore()
    
    var bookstoreprotocol:BookStoreProtocol!
    
    func handerJsonData()  {
            Alamofire.request(Qurl.BOOKSTORE_URL).responseJSON { response in
        
                
                switch response.result{
                
                    
                case .success:
                    let json =  JSON(str: response.result.value!)
                    
//                     print("\(json)")
                    let contentlist = json["content"].arrayValue
                    for json in contentlist {
                        let book = BookStoreObject()
                        book.total = json["total"].intValue
                        book.page = json["page"].intValue
                        book.catId = json["catId"].intValue
                        book.catName = json["catName"].stringValue
        
                        book.imageUrl = json["imageUrl"].stringValue
                        book.type = json["type"].stringValue
                        book.desc = json["desc"].stringValue
                      
                        
                        let booklist = json["subCatList"].arrayValue
                    
                        
                        for json in booklist{
                            let bookstoreobject = BookStoreSubObject()
                            bookstoreobject.total = json["total"].intValue
            
                            bookstoreobject.catId = json["catId"].intValue
                            bookstoreobject.catName = json["catName"].stringValue
                            
                            bookstoreobject.imageUrl = json["imageUrl"].stringValue
                            bookstoreobject.type = json["type"].stringValue
                             bookstoreobject.desc = json["desc"].stringValue
                            book.subCatList.append(bookstoreobject)
                        }
                         self.bookstore.content.append(book)
                        
                    }
                    
                   
                    self.bookstoreprotocol.getSuccess(self.bookstore)
                    break
                    
                    case .failure:
                        
                        self.bookstoreprotocol.getError(ERROR_TYPE.error_REQUEST)
                        
                    break
                }
        
        }
    }
    
    func setOnBookStoreProtocol(book: BookStoreProtocol)  {
        
        
        self.bookstoreprotocol = book
        
    }
   
}
