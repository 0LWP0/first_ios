//
//  PhoneInfo.swift
//  q
//
//  Created by qli on 2016/11/8.
//  Copyright © 2016年 qli. All rights reserved.
//

import Foundation
import UIKit

//手机信息 class
class PhoneUtil: NSObject {
    
    
    open static let WIDTH: String = "width"
    open static let HEIGHT: String = "height"
    
    //标题栏的宽高
    fileprivate static var nwh: Dictionary<String,CGFloat> = [:]
    //状态栏的宽高
    fileprivate static var swh: Dictionary<String,CGFloat> = [:]
    //手机屏幕宽高
    fileprivate static var pwh: Dictionary<String,CGFloat> = [:]
    
    static func setNavigationWidthAndHeight(_ width: CGFloat, height: CGFloat) {
        
        self.nwh[WIDTH] = width
        
        self.nwh[HEIGHT] = height
        
        
    }
    
   static func getNavigationWidthAndHeight()->Dictionary<String,CGFloat>{
        
        return nwh
        
    }
    
    //状态栏的宽高
    static func getStatBarWidthAndHeight()->Dictionary<String,CGFloat>{
    
        swh[WIDTH] = UIApplication.shared.statusBarFrame.size.width
        swh[HEIGHT] = UIApplication.shared.statusBarFrame.size.height
        return swh
    }
    static func getPhoneWidthAndHeight()->Dictionary<String,CGFloat>{
        
        pwh[WIDTH] = UIScreen.main.bounds.size.width
        pwh[HEIGHT] = UIScreen.main.bounds.size.height
        return pwh
    }
    
    static func getStatAndNavigation() -> CGFloat{
        let i = getStatBarWidthAndHeight()[PhoneUtil.HEIGHT]!+getNavigationWidthAndHeight()[PhoneUtil.HEIGHT]!
        return i
    }
    
    static func getMenuWidth()-> CGFloat{
        
        let f:CGFloat = UIScreen.main.bounds.width - 70
        
       return f

    
    
    }


}
