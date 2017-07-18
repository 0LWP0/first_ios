//
//  UrlUtils.swift
//  q
//
//  Created by qli on 2016/12/13.
//  Copyright © 2016年 qli. All rights reserved.
//

import Foundation

class UrlUtils {
    
    
    static func setFeedBackUrl(_ contact: String) -> String {
        
       var pr = "\(Qurl.url_preameter)&type=1&token=22222&contact=\(contact)"
        
       let string = preameter(pr)
        
       pr += "&digest=\(string)"
        
       return "\(Qurl.MAIN_SERVICE_URL)\(Qurl.FEEDBACK_URL)?\(pr)"
    }
    
    
    fileprivate static func preameter(_ s: String) -> String{
        
        return Md5.md5String(s.replacingOccurrences(of: "&", with: ""))
        
        
    }
    
    
    static func getSelectedUrl() -> String{
    
    return "http://120.76.249.219:8085/klread/category/querySubCat.do?uuid=8665380220161128111822&packagename=com.klread&appname=com.sanhui.klread&channelid=klread_360&imei=866538020723823&imsi=460017686987141&timestamp=20161205110003&catid=1&type=3&size=7&page=1&booksize=3&digest=0AEAB58ACDD837A17A32B12A56CF3CB9"
    }
    
    
}
