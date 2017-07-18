//
//  BookStoreProtocol.swift
//  q
//
//  Created by qli on 2017/3/1.
//  Copyright © 2017年 qli. All rights reserved.
//

import Foundation
protocol BookStoreProtocol {
    
    func getError(_ error: ERROR_TYPE)
    
    func getSuccess(_ str: BookStore)
    
}
