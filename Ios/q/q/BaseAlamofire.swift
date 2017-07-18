//
//  BaseAlamofire.swift
//  q
//
//  Created by qli on 2016/11/20.
//  Copyright © 2016年 qli. All rights reserved.
//

import Foundation

import Alamofire


class BaseAlamofire {
    
    static let AlamofireSingle = BaseAlamofire.init()
    fileprivate init() {
    
        
    }
    
    
    func request(url: String) {
        Alamofire.request(url).responseJSON { response in
        
            switch response.result{
            case .success:
                
                break
            case .failure:
                
                break
            
            }
        
        }
    }
    
    static func isNet() -> Bool{
        let net =  NetworkReachabilityManager()
        
        return (net?.isReachable)!
    }
    

}
