//
//  BaseProtocol.swift
//  q
//
//  Created by qli on 2016/10/11.
//  Copyright © 2016年 qli. All rights reserved.
//

import Foundation

protocol BaseProtocol {
    
    func getError(_ error: ERROR_TYPE)
    
    func getSuccess(_ str: Selected)
    
}

//错误信息
public enum ERROR_TYPE: Int{
    
    
    case error_REQUEST = 0
    
    case error_NO_NET_WOTK = 1
    
    case error_OTHER = 2
    
    
    
}
