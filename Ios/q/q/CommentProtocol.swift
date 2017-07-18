//
//  CommentProtocol.swift
//  q
//
//  Created by qli on 2017/3/27.
//  Copyright © 2017年 qli. All rights reserved.
//

import Foundation

protocol CommentProtocol {
    func getError(_ error: ERROR_TYPE)
    
    func getCommentData(_ str: CommentObject)
}
