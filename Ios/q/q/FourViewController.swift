//
//  FourViewController.swift
//  q
//
//  Created by qli on 2016/10/20.
//  Copyright © 2016年 qli. All rights reserved.
//

import UIKit

class FourViewController: BaseViewController, UIScrollViewDelegate {
    
//    @IBOutlet weak var mScroll: UIScrollView!
//    
//    @IBOutlet weak var mPage: UIPageControl!
    
    
    var iamges = Array<UIImageView>()
    
    
     var timer: Timer!
    
    
    var b = false
    
    var i = -1

    
    override func viewDidLoad() {
        super.viewDidLoad()

        
      
//        initData()
//        
//        initViews()
//    
//        initTimer()
    
        
    }
    
    func initData(){
//        
//        iamges.append(UIImageView(image:UIImage(named: "girl0")))
//        iamges.append(UIImageView(image:UIImage(named: "girl1")))
//        iamges.append(UIImageView(image:UIImage(named: "girl2")))
//        iamges.append(UIImageView(image:UIImage(named: "girl3")))
//        iamges.append(UIImageView(image:UIImage(named: "girl4")))
    
    }
    
//    func initTimer() {
//        self.timer=Timer.scheduledTimer(timeInterval: Double(2), target: self, selector: #selector(self.statrTimer), userInfo: nil, repeats: true)
//      
//    }
//    
//    override func viewDidDisappear(_ animated: Bool) {
//        
////        print("viewDidDisappear")
//    }
//    
//    override func viewWillAppear(_ animated: Bool) {
////        print("viewWillAppear")
//    }
    


//    func statrTimer() {
//        
//        i = i+1
//        
//        if(i < iamges.count){
//            self.mPage.currentPage = i
//            
//            if b {
//                 b = !b
//                self.mScroll.contentOffset.x = self.mScroll.frame.size.width*CGFloat(i)
//
//            }else{
//                UIView.beginAnimations(nil, context: nil)
//                UIView.setAnimationDuration(1.0)
//                self.mScroll.contentOffset.x = self.mScroll.frame.size.width*CGFloat(i)
//                UIView.setAnimationCurve(UIViewAnimationCurve.easeOut)
//                UIView.commitAnimations()
//            }
//            
//            
//            if (i==iamges.count-1) {
//                b = !b
//                i = -1
//            }
//            
//        }
//            
//        
//    }
//    
    
    
    
    
    
//    func onClick()  {
//        print("onClick")
//    }
//    
//    func initViews(){
//        
//        self.mScroll.frame = self.view.frame
//        self.mScroll.delegate = self
//        
//        for i in 0..<iamges.count {
//        
//            let image = iamges[i]
//            image.contentMode = .scaleAspectFit
//            let xp = self.view.frame.width * CGFloat(i)
//            image.frame = CGRect(x: xp, y: 0, width: self.mScroll.frame.width, height: self.mScroll.frame.height)
//            self.mScroll.contentSize.width = self.mScroll.frame.width*CGFloat(i+1)
//            
//            self.mScroll.addSubview(image)
//            
//        }
//        
//    }
//    
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        
//        let width = self.mScroll.frame.size.width
//        
//        let x = self.mScroll.contentOffset.x
//        
//        let page = (x+width/2)/width
//        
//        self.mPage.currentPage = Int(page)
//        
//       i = Int(page)
//        
//        
//    }
//    
//    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
//        
//    }
//    
//    
//    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
//        
//        
//        if !decelerate{
//         print("--->")
//        }
//    }
//    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
