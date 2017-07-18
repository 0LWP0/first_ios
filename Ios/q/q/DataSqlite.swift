//
//  DataSqlite.swift
//  q
//
//  Created by qli on 2017/3/13.
//  Copyright © 2017年 qli. All rights reserved.
//  https://github.com/stephencelis/SQLite.swift/blob/master/Documentation/Index.md

import Foundation
import SQLite

class DataSqlite {
   fileprivate var db = try! Connection()
   fileprivate let users = Table("search")
   static let DbSingle = DataSqlite.init()
    
   fileprivate let content = Expression<String?>("content")


   fileprivate init() {
       self.CreateSearchH()
    }
    
    //创建搜索厉害记录
   fileprivate func CreateSearchH() {
        
    let sqlFilePath = NSHomeDirectory() + "/Documents" + "/db.sqlite3"
    do {
        db = try Connection(sqlFilePath)
        try db.run(users.create { t in
            t.column(content)
        })
    } catch { print(error) }
    
    }
    
    //添加
    func insertSearch(_ value: String){
//        let query: QueryType = users.filter(content == value)
//        print("\(count)")
            _ = try! db.run(users.insert(content <- value))
        
    }
    
    func isSearch(_ value: String) -> Bool {
        let count = try! db.scalar(users.filter(content == value).count)

        return count == 0
    }
    //查询
    func prepareSearch() -> [String] {
        var conntents = [String]()
        
        for user in try! db.prepare(users) {
            conntents.append(user[content]!)
        }
        
        return conntents
    }
    //查询有多少条数据
    func prepareSearchCount() ->Int {
        let count = try! db.scalar(users.count)
        return count
    }
    //删除
    func deleteSearch()  {
        try! db.run(users.delete())
    }
    
}
