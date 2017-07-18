//
//  DataModel.swift
//  q
//
//  Created by qli on 2016/11/8.
//  Copyright © 2016年 qli. All rights reserved.
//

import Foundation

class DataModel: NSObject{
    
    var user = UserObject()
    
    
    
    override init() {
        
    }
    
    func writeToFile() {
        let path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0] as NSString
        let filePath = path.appendingPathComponent("user.plist")
        
        print("--->\(filePath)")
        /// 存储为数组类型
        //  let dataSourse = NSMutableArray()
        //  dataSourse.add("人生若只如初见")
        //  dataSourse.add("何事秋风悲画扇")
        // dataSourse.write(toFile: filePath, atomically: true)
        
        /// 存储为字典类型
        let dataDic = NSMutableDictionary()
        dataDic.setValue("mix", forKey: "name")
        dataDic.setValue("18", forKey: "age")
        dataDic.setValue("程序猿", forKey: "job")
        dataDic.write(toFile: filePath, atomically: true)
    }
    
    
    func readFromFile() {
        /// 获得沙盒的根路径
        let home = NSHomeDirectory() as NSString
        /// 获得Documents路径
        let docPath = home.appendingPathComponent("Documents") as NSString
        /// 获得已创建的plist文件的路径
        let file = docPath.appendingPathComponent("user.plist")
        /// 读取数据
        let dataA = NSDictionary(contentsOfFile: file)
        print(dataA!)
    }
    
    
}
