//
//  ImageProrocol.swift
//  q
//
//  Created by qli on 2016/11/21.
//  Copyright © 2016年 qli. All rights reserved.
//

import Foundation

protocol ImageProrocol {
    func getError(_ error: Error?)
    
    func getSuccess(_ images: [UIImage])
}
