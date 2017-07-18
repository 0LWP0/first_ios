//
//  MenuViewController.swift
//  q
//
//  Created by qli on 2016/11/10.
//  Copyright © 2016年 qli. All rights reserved.
//

import UIKit

class MenuViewController: BaseViewController{

    

    @IBOutlet weak var mView: MenuView!
    
    func onClick(_ sender:UIButton) {

        self.revealViewController().rightRevealToggle(animated: false)
        var withIdentifier = ""
        switch sender.tag {
        case 0:
            withIdentifier = "nav_login"
  
            break
        case 2:
            withIdentifier = "feedback_nav"
           
            break
        default:
            break
            
        }
        
        let sb = UIStoryboard(name: "Main", bundle:nil)
        let vc = sb.instantiateViewController(withIdentifier: withIdentifier) as! UINavigationController
        //VC为该界面storyboardID，Main.storyboard中选中该界面View，Identifier inspector中修改
        
        self.present(vc, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mView.mBtn_login.tag = 0
        mView.mBtn_login.addTarget(self, action: #selector(self.onClick(_:)), for: .touchDown)
        mView.mBtn_opinion.tag = 2
        mView.mBtn_opinion.addTarget(self, action: #selector(self.onClick(_:)), for: .touchDown)
        
        
    }
    
    
    
    
//    func initView()  {
//        mView.translatesAutoresizingMaskIntoConstraints = false
//        let f:CGFloat = (UIScreen.main.bounds.width)/CGFloat(3) - CGFloat(1)
//                    let width: NSLayoutConstraint = NSLayoutConstraint(item: mView, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 0.0, constant:f)
////
//                    let height:NSLayoutConstraint = NSLayoutConstraint(item: mView, attribute: NSLayoutAttribute.height, relatedBy:NSLayoutRelation.equal, toItem:nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier:0.0, constant:UIScreen.main.bounds.height)
//        
//                    let right:NSLayoutConstraint = NSLayoutConstraint(item: mView, attribute: NSLayoutAttribute.right, relatedBy:NSLayoutRelation.equal, toItem:self.view, attribute:NSLayoutAttribute.notAnAttribute, multiplier:1.0, constant: -f)
////
//                    let bottom:NSLayoutConstraint = NSLayoutConstraint(item: mView, attribute: NSLayoutAttribute.bottom, relatedBy:NSLayoutRelation.equal, toItem:self.view, attribute:NSLayoutAttribute.notAnAttribute, multiplier:1.0, constant: 0)
//        
////        let top:NSLayoutConstraint = NSLayoutConstraint(item: mView, attribute: NSLayoutAttribute.top, relatedBy:NSLayoutRelation.equal, toItem:self.view, attribute:NSLayoutAttribute.notAnAttribute, multiplier:1.0, constant: 0)
////        
////         let left:NSLayoutConstraint = NSLayoutConstraint(item: mView, attribute: NSLayoutAttribute.left, relatedBy:NSLayoutRelation.equal, toItem:self.view, attribute:NSLayoutAttribute.notAnAttribute, multiplier:1.0, constant: 0)
//                    mView.addConstraint(width);
//                    mView.addConstraint(height);
//                    mView.addConstraint(right);
//                    mView.addConstraint(bottom);
////        mView.addConstraint(top);
////        mView.addConstraint(left);
//    }

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
