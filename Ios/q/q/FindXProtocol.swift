//
//  FindXProtocol.swift
//  q
//
//  Created by qli on 2017/3/3.
//  Copyright © 2017年 qli. All rights reserved.
//

import Foundation


protocol FindXProtocol {
    func getError(_ error: ERROR_TYPE)
    
    func getFindXData(_ str: FindXObject)

}
