////
////  MainViewController.swift
////  q
////
////  Created by qli on 2016/11/10.
////  Copyright © 2016年 qli. All rights reserved.
////
//
//import UIKit
//
//class MainViewController: UIViewController {
//    
//    
//    @IBOutlet weak var mContainer: UIView!
//    var leftc: LeftViewController!
//    
//    var rightc: RightViewController!
//    
//    @IBAction func mSeg(_ sender: UISegmentedControl) {
//        
//        
//        if sender.selectedSegmentIndex == 0 {
//            self.cycleFromViewController(oldViewController: rightc, toViewController: leftc)
//        } else {
//            self.cycleFromViewController(oldViewController: leftc, toViewController: rightc)
//        }
//        
//        print(sender.selectedSegmentIndex)
//    }
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        self.initController()
//        self.addChildViewController(self.leftc)
//        //                self.leftc.view.frame = self.view.frame
//        //        self.leftc.view.backgroundColor = UIColor.blue
////        self.leftc.view.frame = self.mContainer.frame
////        self.mContainer.addSubview(self.leftc.view)
//        self.addSubview(subView: self.leftc.view, toView: self.mContainer)
//        //                self.view.insertSubview(self.leftc.view, aboveSubview: self.mContainer)
//        
//        //        self.mContainer.addSubview(leftc.view)
//        //
//        //        addChildViewController(leftc)
//        //        leftc.didMove(toParentViewController: self)
//        //        leftc.view.bounds = mContainer.bounds
//        ////        self.removeFromParentViewController()
//        //        transition(from: self, to: leftc, duration: 0.5, options: UIViewAnimationOptions.curveEaseIn, animations: nil, completion: nil)
//        // Do any additional setup after loading the view.
//    }
//    
//    func cycleFromViewController(oldViewController: UIViewController, toViewController newViewController: UIViewController) {
//        
//        
//        oldViewController.willMove(toParentViewController: nil)
//        
//        print("----->\(self.childViewControllers.last)")
//                self.addChildViewController(newViewController)
//        self.addSubview(subView: newViewController.view, toView:self.mContainer)
////        newViewController.view.alpha = 0
////        newViewController.view.layoutIfNeeded()
////        UIView.animate(withDuration: 0.5, animations: {
////            newViewController.view.alpha = 1
////            oldViewController.view.alpha = 0
////        },
////                       completion: { finished in
////                        oldViewController.view.removeFromSuperview()
////                        oldViewController.removeFromParentViewController()
////                        newViewController.didMove(toParentViewController: self)
////        })
//    }
//    
//    func addSubview(subView:UIView, toView parentView:UIView) {
//        parentView.addSubview(subView)
//        
//        var viewBindingsDict = [String: AnyObject]()
//        viewBindingsDict["subView"] = subView
//        parentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[subView]|",
//                                                                 options: [], metrics: nil, views: viewBindingsDict))
//        parentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[subView]|",
//                                                                 options: [], metrics: nil, views: viewBindingsDict))
//    }
//    
//    
//    func initController() {
//        leftc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "left") as! LeftViewController
//        leftc.view.translatesAutoresizingMaskIntoConstraints = false
//        rightc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "right") as! RightViewController
//        rightc.view.translatesAutoresizingMaskIntoConstraints = false
//    }
//    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    
//    
//    /*
//     // MARK: - Navigation
//     
//     // In a storyboard-based application, you will often want to do a little preparation before navigation
//     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//     // Get the new view controller using segue.destinationViewController.
//     // Pass the selected object to the new view controller.
//     }
//     */
//    
//}
