//
//  BaseUIAlertController.swift
//  q
//
//  Created by qli on 2016/11/22.
//  Copyright © 2016年 qli. All rights reserved.
//
// 自定义xib与Controller相关联
import UIKit

class BaseUIAlertController: UIAlertController {
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    convenience init(){
    
        var nibnameornil = String("BaseUIAlertController")
        
        if Bundle.main.path(forResource: nibnameornil, ofType: "xib") == nil{
            nibnameornil = nil
        
        }
        
        self.init(nibName: nibnameornil, bundle: nil)
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        if ((self.view) != nil){
        
            self.view.bounds = UIScreen.main.bounds
        }

        self.title = "提示"
        self.message = "温馨提示"
        
        // Do any additional setup after loading the view.
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
