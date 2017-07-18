//
//  BaseTableViewController.swift
//  q
//
//  Created by qli on 2016/11/18.
//  Copyright © 2016年 qli. All rights reserved.
//

import UIKit

class BaseTableViewController: UITableViewController {
    
    var mload: Mainloading?
    
    var titleView: TitleDialogView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
        //去掉多余cell分割线
        var view: UIView?
        if view==nil{
            view = UIView()
            view?.backgroundColor = UIColor.clear
            self.tableView.tableFooterView = view
            self.tableView.tableHeaderView = view
        }
        
        
        
        let nav = self.navigationController
        
        
        if (nav != nil && nav?.navigationBar != nil) {
            nav?.navigationBar.barTintColor = UIColor(red: 255/255, green: 209/255, blue: 87/255, alpha: 1.0)
            PhoneUtil.setNavigationWidthAndHeight((nav?.navigationBar.frame.width)!, height: (nav?.navigationBar.frame.height)!)
            self.navigationController?.navigationBar.titleTextAttributes =
                [NSForegroundColorAttributeName: UIColor.white]
            titleView = TitleDialogView((nav?.view)!)
        }else{
            
            titleView = TitleDialogView(self.view)
        }
        
        //去掉分割线
//        tableView.separatorStyle = .none
    }
    //手机屏幕最上方弹框
    internal func showTopDialog() {
        titleView.showAnimate()
    }
    
    internal func showTopDialog(_ text: String!) {
        titleView.showAnimate(text)
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
        
        let transition = CATransition()
        transition.duration = 0.35
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromLeft
        view.window!.layer.add(transition, forKey: kCATransition)
        
        self.dismiss(animated: false, completion: nil)
    }
    
    
    
    
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
