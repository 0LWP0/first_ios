//
//  SearchObject.swift
//  q
//
//  Created by qli on 2017/3/12.
//  Copyright © 2017年 qli. All rights reserved.
//

import Foundation


class Search: HeaderObject {
    
    var content = Array<SearchObject>()
}

class SearchObject: NSObject {
    var keyword = ""
    var type = -1
    
}
