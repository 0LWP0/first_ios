//
//  BookStoreTable.swift
//  q
//
//  Created by qli on 2017/3/2.
//  Copyright © 2017年 qli. All rights reserved.
//

import Foundation

class BookStoreTable:NSObject, UITableViewDataSource,UITableViewDelegate {
    
//        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//            return 100
//        }
//    
//        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//            <#code#>
//        }
//    
//        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//            return 0
//        }
//    
//        func setData()  {
//            
//        }
//    
    
    var books: Array<BookStoreSubObject>!
    
    init(sublist: Array<BookStoreSubObject>) {
        
        self.books = sublist

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let  bookstoreitem = tableView.dequeueReusableCell(withIdentifier: "bookstoreitem") as! BookStoreItemTwoTableViewCell!
         BaseAlamofireImage.getImage(books[indexPath.row].imageUrl, uiimage:   (bookstoreitem?.image_item_two)!)
        
        print("image_item_two")
        return bookstoreitem!
    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if books != nil && !books.isEmpty {
          return books.count
        }
        
        return books.count
    }
    
}
