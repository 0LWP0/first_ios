//
//  DetailsProtocol.swift
//  q
//
//  Created by qli on 2017/3/8.
//  Copyright © 2017年 qli. All rights reserved.
//

import Foundation

protocol DetailsProtocol {
    func getError(_ error: ERROR_TYPE)
    
    func getDetailsData(_ str: DetailsObject)
}
