//
//  FindPresenter.swift
//  q
//
//  Created by qli on 2017/3/3.
//  Copyright © 2017年 qli. All rights reserved.
//

import Foundation


import Alamofire
import SwiftyJSON

class FindPresenter {
 
    var findobject = Find()
    
    var findprotocol:FindProtocol!
    
    func handerJsonData()  {
        Alamofire.request(Qurl.FIND_ITEM).responseJSON { response in
            
            
            switch response.result{
                
                
            case .success:
                let json =  JSON(str: response.result.value!)
                
//                                     print("\(json)")
                let contentlist = json["content"].arrayValue
                for json in contentlist {
                 let find = FindObject()
                    find.total = json["total"].intValue
                    find.page = json["page"].intValue
                    find.catId = json["catId"].intValue
                    find.carName = json["catName"].stringValue
                    find.imageUrl = json["imageUrl"].stringValue
                    find.desc = json["desc"].stringValue
                    find.type = json["type"].stringValue
                    
                    
                    for json in json["subCatList"].arrayValue{
                    
                        let finds =  FindSubCatlistObject()
                        
                        finds.total = json["total"].intValue
                        finds.catId = json["catId"].intValue
                        
                        finds.catName = json["catName"].stringValue
                        
                        
                        finds.imageUrl = json["imageUrl"].stringValue
                        
                        finds.desc = json["desc"].stringValue
                        
                        finds.type = json["type"].stringValue
                        find.subCatList.append(finds)
                    }
                    
                    self.findobject.content.append(find)
                    
                }
                
                
                self.findprotocol.getSuccess(self.findobject)
                break
                
            case .failure:
                
                self.findprotocol.getError(ERROR_TYPE.error_REQUEST)
                
                break
            }
            
        }
    }
    
    func setOnBookStoreProtocol(book: FindProtocol)  {
        
        
        self.findprotocol = book
        
    }

    
    
}
