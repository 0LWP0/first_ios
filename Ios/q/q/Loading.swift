//
//  Loading.swift
//  q
//
//  Created by qli on 2016/11/8.
//  Copyright © 2016年 qli. All rights reserved.
// 全局loading
//

import UIKit

class Loading: UIActivityIndicatorView {
    
    fileprivate static var l: Loading!;
    
    internal override init(frame: CGRect) {
        super.init(frame: frame)
        
        
    }
    //定义自己初始化方法 关键字：convenience
    convenience init(ui: UIView) {
//        /2-10
//        /2-20-10
        
        //状态栏
       
        //标题栏
        
        //屏幕宽高
//        let pwidth = UIScreen.main.bounds.size.width
//        let pheight = UIScreen.main.bounds.size.height
        
        
//        let dp = PhoneUtil.getPhoneWidthAndHeight()
//        
//        let width = dp[PhoneUtil.WIDTH]!
//        
//        let height = dp[PhoneUtil.HEIGHT]!
        
        
        
        
        self.init(frame: ui.frame)
        super.alpha = 0.8
        self.center.x = ui.bounds.size.width/2
      
        self.center.y = ui.bounds.size.height/2 - PhoneUtil.getStatAndNavigation()
        //减去头部
//        super.center = CGPoint(x: width/2, y: (height/2-PhoneUtil.getNavigationWidthAndHeight()[PhoneUtil.HEIGHT]!-PhoneUtil.getStatBarWidthAndHeight()[PhoneUtil.HEIGHT]!))
        
//        super.color = UIColor(red: CGFloat(70),green: CGFloat(147),blue: CGFloat(211),alpha: CGFloat(100))
        super.activityIndicatorViewStyle = .gray
        
        self.backgroundColor = UIColor.gray
        
        //数字越小越透明
//        self.alpha = 0.6
        ui.addSubview(self)
    }
    
    
    internal required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    
     func show()  {
        
        super.startAnimating()
        
        
    }
    
     func stop()  {
        
        super.stopAnimating()
        super.hidesWhenStopped = true
        
    }
    
//    static func showLoading(u: UIView){
//        
//        
//        if l == nil {
//            l = Loading.init(ui: u)
//        }
//        
//        l.show()
//        
//        
//        
//    }
//    
//    static func closeLoading() {
//        l.stop()
//    }
    
    
    
    
    
}
