//
//  BaseViewController.swift
//  q
//
//  Created by qli on 2016/11/18.
//  Copyright © 2016年 qli. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    var titleView: TitleDialogView!

    
     var mload: Mainloading?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
         let nav = self.navigationController
        if (nav != nil && nav?.navigationBar != nil) {
            nav?.navigationBar.barTintColor = UIColor(red: 255/255, green: 209/255, blue: 87/255, alpha: 1.0)
            PhoneUtil.setNavigationWidthAndHeight((nav?.navigationBar.frame.width)!, height: (nav?.navigationBar.frame.height)!)
            self.navigationController?.navigationBar.titleTextAttributes =
                [NSForegroundColorAttributeName: UIColor.white]
            self.navigationController?.navigationBar.backItem?.backBarButtonItem?.tintColor = UIColor.white
            
//            self.navigationController?.navigationItem.leftBarButtonItem?.tintColor = UIColor.white
//            self.navigationController?.navigationBar.barStyle = .default
//            self.navigationController?.navigationBar.tintColor = UIColor.white
            titleView = TitleDialogView((nav?.view)!)
        }else{
            titleView = TitleDialogView(self.view)
            
        }
        
        
    }
    
    
    internal func presentX(_ con: UIViewController){
        
        let transition = CATransition()
        transition.duration = 0.35
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromRight
        view.window!.layer.add(transition, forKey: kCATransition)
        present(con, animated: false, completion: nil)
    }
    
    internal func dismissX(){
        
        if view.window != nil {
            let transition = CATransition()
            transition.duration = 0.35
            transition.type = kCATransitionPush
            transition.subtype = kCATransitionFromLeft
            view.window!.layer.add(transition, forKey: kCATransition)
            
            self.dismiss(animated: false, completion: nil)
 
        }
        
    }

    
    //手机屏幕最上方弹框
    internal func showTopDialog() {
        titleView.showAnimate()
    }

    internal func showTopDialog(_ text: String!) {
        titleView.showAnimate(text)
    }
    
    //全局loading
    internal  func showLoading()  {
        self.mload = Mainloading(ui: self.view)
        self.mload?.show()
    }
    
    internal  func dismissLoading() {
        
        if self.mload != nil {
            self.mload?.dismiss()
        }
        
    }

}
