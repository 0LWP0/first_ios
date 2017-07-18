//
//  SearchPresenter.swift
//  q
//
//  Created by qli on 2017/3/12.
//  Copyright © 2017年 qli. All rights reserved.
//

import Foundation


import Alamofire
import SwiftyJSON

let TYPE_ONE: Int = 100

let TYPE_TWO: Int = 101

let TYPE_THREE: Int = 102
let TYPE_FOUR: Int = 103

class SearchPresenter {
    
    
    
    var search = Search()
    
    var searchp: SearchProtocol?
    
    
    func handerJsonData()  {
        
        
        Alamofire.request(Qurl.search_url, method: .post).responseJSON{
            response in
         
            switch response.result{
            
            case .success:
                
                let json =  JSON(str: response.result.value!)
                let headerjson = json["header"]
                let code = headerjson["resultCode"].intValue
                if code == 200{
                    
                    
                    if !DataSqlite.DbSingle.prepareSearch().isEmpty{
                        
                        let sea4 = SearchObject()
                        sea4.type = TYPE_FOUR
                        self.search.content.append(sea4)
                        
                        for content in DataSqlite.DbSingle.prepareSearch() {
                            
                            let sea = SearchObject()
                            sea.keyword = content
                            sea.type = TYPE_THREE
                            self.search.content.append(sea)
                            
                        }

                    }
                    
                
                    
                    let sear2 = SearchObject()
                    sear2.type =  TYPE_TWO
//                    sear2.keyword = "大家都在搜"
                    self.search.content.append(sear2)
                    for json in json["content"].arrayValue{
                       let sear = SearchObject()
                        sear.keyword = json["keyword"].stringValue
                        sear.type = TYPE_ONE
                        self.search.content.append(sear)
                    }
                    
                   
                   
                    
                    
                    self.searchp?.getSearchData(self.search)
                }else{
                
                    self.searchp?.getError(ERROR_TYPE.error_REQUEST)
                }
                break
                
            case .failure:
                
                self.searchp?.getError(ERROR_TYPE.error_REQUEST)
                
                break
            }
            
        }

    }
    
    
    func cleanH() {
        DataSqlite.DbSingle.deleteSearch()
        for sea in search.content{
            
            
            
             if sea.type == TYPE_THREE{
                
                self.search.content.remove(at: 1)
                
            }
            
            
        
        }
        search.content.remove(at: 0)
    }
    
    func prepare(row: Int){
        if DataSqlite.DbSingle.prepareSearchCount() == 0 {
            
            let se = SearchObject()
            se.type = TYPE_FOUR
            self.search.content.insert(se, at: 0)
            
        }
        
        
        if DataSqlite.DbSingle.isSearch(self.search.content[row].keyword) {
            DataSqlite.DbSingle.insertSearch(self.search.content[row].keyword)
            let se = SearchObject()
            se.type = TYPE_THREE
            se.keyword = self.search.content[row].keyword
            self.search.content.insert(se, at: 1)
        }

    }
    
    func setOnMoreProtocol(sea: SearchProtocol)  {
        
        
        self.searchp = sea
        
    }

    
    
}
