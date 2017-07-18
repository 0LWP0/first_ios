//
//  SearchProtocol.swift
//  q
//
//  Created by qli on 2017/3/12.
//  Copyright © 2017年 qli. All rights reserved.
//

import Foundation



protocol SearchProtocol {
    func getError(_ error: ERROR_TYPE)
    
    func getSearchData(_ str: Search)
}
