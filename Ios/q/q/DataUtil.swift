//
//  DataUtil.swift
//  q
//
//  Created by qli on 2016/12/14.
//  Copyright © 2016年 qli. All rights reserved.
//

import Foundation

class DataUtil: NSObject {
    
    
    open static let hhmm = "HH:mm"
    //获取当前日期
    static func getNowData() -> String{
    
    
        let nowData = Date()
        
        let formatter = DateFormatter()
        
        formatter.dateFormat = hhmm
        let dataString = formatter.string(from: nowData)
        return dataString
    }
    
    //获取当前时间戳
    static func getTimeStamp() -> Int{
    
        let nowData = Date()
        let time = nowData.timeIntervalSince1970
        return Int(time)
    
    }
    
}
