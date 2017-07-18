//
//  ChapterListProtocol.swift
//  q
//
//  Created by qli on 16/07/2017.
//  Copyright © 2017 qli. All rights reserved.
//

import Foundation

protocol ChapterListProtocol {
    func getError(_ error: ERROR_TYPE)
    
    func getChapterListData(_ str: ChapterList)
}
