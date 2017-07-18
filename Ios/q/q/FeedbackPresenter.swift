//
//  FeedbackPresenter.swift
//  q
//
//  Created by qli on 2016/12/13.
//  Copyright © 2016年 qli. All rights reserved.
//

import Foundation

import Alamofire

import SwiftyJSON

class FeedbackPresenter {
    
    var uiv: UIView!
    
    var url: String!
    
    var parmeters: String!
    
    fileprivate var mFeed:FeedbackProtocol!
    
    init(ui: UIView!) {
        self.uiv = ui
        
        
    }
    
    func setUrl(_ str: String) {
        self.url = str
    }
    
    func setParmeters(_ p: String) {
        parmeters = p
    }
    
    func handerJosnData(){
        let m = Mainloading(ui: uiv)
        m.show()
//        print("---->\(self.url)")
        
        let pars: Parameters = ["content":parmeters]

        Alamofire.request(url,method: .post, parameters: pars,encoding: URLEncoding.httpBody).responseJSON { response in
//            , let utf8Text = String(data: data, encoding: .utf8)
//            if let data = response.data {
            
                
                let json =  JSON(str: response.result.value!)
            
            
            
            let firstkey = json.dictionaryValue.first?.key
            
            let header = HeaderObject()
            header.resultCode = json[firstkey!]["resultCode"].intValue
            header.desc = json[firstkey!]["desc"].stringValue
            self.mFeed.onSuccess(header)
//            if (json[firstkey!]["resultCode"] == 200){
//            
//            }
//            print("Data: \(json[firstkey!]["resultCode"])")
           
//            }
//            switch  response.result{
//                
//            case .success:
//                if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
//                    print("Data: \(utf8Text)")
//                }
//
//                
//            break
//                
//            case .failure:
//                
//                 print("0----failure")
//            break
//          
//            }
            
            m.dismiss()
        }
    }
    
    func setFeedbackDelegate(_ feed: FeedbackProtocol)  {
        self.mFeed = feed
    }

}
