//
//  Md5.swift
//  q
//
//  Created by qli on 2016/12/14.
//  Copyright © 2016年 qli. All rights reserved.
//

import Foundation


class Md5: NSObject{
   static func md5String(_ str:String) -> String{
        let cStr = str.cString(using: String.Encoding.utf8);
        let buffer = UnsafeMutablePointer<UInt8>.allocate(capacity: 16)
        CC_MD5(cStr!,(CC_LONG)(strlen(cStr!)), buffer)
        let md5String = NSMutableString();
        for i in 0 ..< 16{
            md5String.appendFormat("%02x", buffer[i])
        }
        free(buffer)
        return md5String.uppercased as String
    }
}
