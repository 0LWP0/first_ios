//
//   Dialog.swift
//  q
//
//  Created by qli on 2016/11/9.
//  Copyright © 2016年 qli. All rights reserved.
//

import UIKit

//标题和信息一定不能为nil

class AlertDialog {
    
    
    internal static var alertProtocol: DialogProtocol!
    // swift3.0 单例模式
    static let AlertSingle = AlertDialog.init()
    
    
    private init() {}
    
    //默认
    static func showDialog() -> UIAlertController {
        return initUIAlertController("",message: "",btn1text: "",btn2text: "")
    }
    //自定义标题，信息
    static func showDialog(_ title :String!,message: String!)-> UIAlertController{
        return initUIAlertController(title,message: message,btn1text: "",btn2text: "")
        
    }
    //提示框只有一个按钮
    static func showDialog(_ title :String!,message: String!,bt1text: String?)-> UIAlertController{
        return initUIAlertController(title,message: message,btn1text: bt1text)
        
    }
    //提示框两个按钮
    static func showDialog(_ title :String!,message: String!,bt1text: String?,bt2text: String?)-> UIAlertController{
        return initUIAlertController(title,message: message,btn1text: bt1text,btn2text: bt2text)
        
    }
    //点击回调
    static func setAlertDialogListener(_ a: DialogProtocol!)  {
        self.alertProtocol = a
    }
    
    
   
    
    internal static func initUIAlertController(_ title: String!,message: String!,btn1text: String!,btn2text: String!) -> UIAlertController {
        var alert:UIAlertController!
        if alert == nil {
            alert = UIAlertController(title: title.isEmpty ? "提示" : title, message: message.isEmpty ? "温馨提示" : message, preferredStyle:.alert)
            let cancelaction = UIAlertAction(title: btn1text.isEmpty ? "取消" : btn1text, style: .default, handler:  {
                (cancelaction)-> Void in
                
                if alertProtocol != nil {
                    alertProtocol.onCancel()
                    alertProtocol = nil
                }
                
                alert.removeFromParentViewController()
            })
            let okaction = UIAlertAction(title: btn2text.isEmpty ? "确定" : btn2text, style: .default, handler:  {
                (okaction)-> Void in
                if alertProtocol != nil {
                    alertProtocol.onOk()
                    alertProtocol = nil
                }
                alert.removeFromParentViewController()
            })
            
            //            let width: NSLayoutConstraint = NSLayoutConstraint(item: alert.view, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1.0, constant:100)
            //
            //            let height:NSLayoutConstraint = NSLayoutConstraint(item: alert.view, attribute: NSLayoutAttribute.height, relatedBy:NSLayoutRelation.equal, toItem:nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier:1.0, constant:100)
            
            //            let right:NSLayoutConstraint = NSLayoutConstraint(item: alert.view, attribute: NSLayoutAttribute.right, relatedBy:NSLayoutRelation.equal, toItem:nil, attribute:NSLayoutAttribute.notAnAttribute, multiplier:1.0, constant: -20)
            //
            //            let bottom:NSLayoutConstraint = NSLayoutConstraint(item: alert.view, attribute: NSLayoutAttribute.bottom, relatedBy:NSLayoutRelation.equal, toItem:nil, attribute:NSLayoutAttribute.notAnAttribute, multiplier:1.0, constant: -20)
            //            alert.view.addConstraint(width);
            //            alert.view.addConstraint(height);
            //            alert.view.addConstraint(right);
            //            alert.view.addConstraint(bottom);
            
            alert.view.translatesAutoresizingMaskIntoConstraints = false
            alert.addAction(cancelaction)
            alert.addAction(okaction)
        }
        return alert
    }
    
    internal static func initUIAlertController(_ title: String!,message: String!,btn1text: String!) -> UIAlertController {
        var alert:UIAlertController!
        if alert == nil {
            alert = UIAlertController(title: title.isEmpty ? "提示" : title, message: message.isEmpty ? "温馨提示" : message, preferredStyle:.alert)
            let okaction = UIAlertAction(title: btn1text.isEmpty ? "确定":btn1text, style: .default, handler:  {
                (okaction)-> Void in
                if alertProtocol != nil {
                    alertProtocol.onOk()
                    alertProtocol = nil
                }
                alert.removeFromParentViewController()
            })
            
            //            let width: NSLayoutConstraint = NSLayoutConstraint(item: alert.view, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1.0, constant:100)
            //
            //            let height:NSLayoutConstraint = NSLayoutConstraint(item: alert.view, attribute: NSLayoutAttribute.height, relatedBy:NSLayoutRelation.equal, toItem:nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier:1.0, constant:100)
            
            //            let right:NSLayoutConstraint = NSLayoutConstraint(item: alert.view, attribute: NSLayoutAttribute.right, relatedBy:NSLayoutRelation.equal, toItem:nil, attribute:NSLayoutAttribute.notAnAttribute, multiplier:1.0, constant: -20)
            //
            //            let bottom:NSLayoutConstraint = NSLayoutConstraint(item: alert.view, attribute: NSLayoutAttribute.bottom, relatedBy:NSLayoutRelation.equal, toItem:nil, attribute:NSLayoutAttribute.notAnAttribute, multiplier:1.0, constant: -20)
            //            alert.view.addConstraint(width);
            //            alert.view.addConstraint(height);
            //            alert.view.addConstraint(right);
            //            alert.view.addConstraint(bottom);
            
            alert.view.translatesAutoresizingMaskIntoConstraints = false
            alert.addAction(okaction)
        }
        return alert
    }
    
//    internal static func initUIAlertController(_ title: String!,message: String!,btn1text: String!,type: UIAlertControllerStyle!) -> UIAlertController {
//        var alert:UIAlertController!
//        if alert == nil {
//            alert = UIAlertController(title: title.isEmpty ? "提示" : title, message: message.isEmpty ? "温馨提示" : message, preferredStyle:.alert)
//            let okaction = UIAlertAction(title: btn1text.isEmpty ? "确定":btn1text, style: .default, handler:  {
//                (okaction)-> Void in
//                if alertProtocol != nil {
//                    alertProtocol.onOk()
//                    alertProtocol = nil
//                }
//                alert.removeFromParentViewController()
//            })
//            
//            //            let width: NSLayoutConstraint = NSLayoutConstraint(item: alert.view, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1.0, constant:100)
//            //
//            //            let height:NSLayoutConstraint = NSLayoutConstraint(item: alert.view, attribute: NSLayoutAttribute.height, relatedBy:NSLayoutRelation.equal, toItem:nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier:1.0, constant:100)
//            
//            //            let right:NSLayoutConstraint = NSLayoutConstraint(item: alert.view, attribute: NSLayoutAttribute.right, relatedBy:NSLayoutRelation.equal, toItem:nil, attribute:NSLayoutAttribute.notAnAttribute, multiplier:1.0, constant: -20)
//            //
//            //            let bottom:NSLayoutConstraint = NSLayoutConstraint(item: alert.view, attribute: NSLayoutAttribute.bottom, relatedBy:NSLayoutRelation.equal, toItem:nil, attribute:NSLayoutAttribute.notAnAttribute, multiplier:1.0, constant: -20)
//            //            alert.view.addConstraint(width);
//            //            alert.view.addConstraint(height);
//            //            alert.view.addConstraint(right);
//            //            alert.view.addConstraint(bottom);
//            
//            alert.view.translatesAutoresizingMaskIntoConstraints = false
//            alert.addAction(okaction)
//        }
//        return alert
//    }


}
