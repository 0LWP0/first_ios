//
//  CollectionObserber.swift
//  q
//
//  Created by qli on 20/07/2017.
//  Copyright © 2017 qli. All rights reserved.
//

import Foundation

class CollectionObserber {
    
    private var coll: CollectionProtocol?
    
    var b:BookObject!
    {
//        willSet{
//            print("-----000--->")
//        }
        didSet{
//           print("----->")
            coll?.getBook(book: b)
            
        }
    }
    
    func setCollectionProtocol(book: CollectionProtocol) {
        self.coll = book
    }
}
