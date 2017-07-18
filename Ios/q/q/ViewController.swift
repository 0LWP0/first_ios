//
//  ViewController.swift
//  q
//
//  Created by qli on 2016/11/14.
//  Copyright © 2016年 qli. All rights reserved.
//

import UIKit


class ViewController: UITabBarController{
    
    
    var i:CGFloat = 1
    
    final let x:CGFloat  = 0.5
    
    
    //     var menu: MenuViewController!
    //    //拖动手势响应
    //    func handlePanGesture(recognizer: UIPanGestureRecognizer) {
    //
    //        switch(recognizer.state) {
    //        // 刚刚开始滑动
    //        case .began:
    //            //滑动速度
    //            print("--->\(recognizer.velocity(in: view).x)")
    //            addMenuViewController()
    //            break
    //            // 判断拖动方向
    //            //            let dragFromLeftToRight = (recognizer.velocity(in: view).x > 0)
    //            //            // 如果刚刚开始滑动的时候还处于主页面，从左向右滑动加入侧面菜单
    //            //            if (currentState == .Collapsed && dragFromLeftToRight) {
    //            //                currentState = .Expanding
    //            //            }
    //
    //        // 如果是正在滑动，则偏移主视图的坐标实现跟随手指位置移动
    //        case .changed:
    //            //            let transslation: CGPoint = recognizer.translation(in: self.view)
    //            //滑动距离
    //            //            self.view.center.x = recognizer.translation(in: view).x
    //
    //
    //            let x1 = recognizer.translation(in: view).x
    //
    //            let b: Bool = self.view.frame.origin.x < UIScreen.main.bounds.width/2
    //
    //            print("-----\(recognizer.translation(in: view).x)---->\(self.view.frame.origin.x)")
    //
    //            if x1>0 && b{
    //                self.view.frame.origin.x = recognizer.translation(in: view).x
    //
    //            }
    //            //            print("--->---\(transslation.x)----\(transslation.y)")
    //            //            let positionX = recognizer.view!.frame.origin.x +
    //            //                recognizer.translation(in: view).x
    //            //            //页面滑到最左侧的话就不许要继续往左移动
    //            //            recognizer.view!.frame.origin.x = positionX < 0 ? 0 : positionX
    //            //            recognizer.setTranslation(CGPoint(x: 200, y: 0), in: self.view)
    //            break
    //        // 如果滑动结束
    //        case .ended:
    //            print("ended")
    //            break
    //            //根据页面滑动是否过半，判断后面是自动展开还是收缩
    //            //            let hasMovedhanHalfway = recognizer.view!.center.x > view.bounds.size.width
    //        //            animateMainView(shouldExpand: hasMovedhanHalfway)
    //        default:
    //            break
    //        }
    //    }
    
    
    // 添加菜单页
    //    func addMenuViewController() {
    //
    ////        if menu == nil {
    //            menu = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "menu") as! MenuViewController
    //            let cgr = CGRect(origin: CGPoint(x: -(self.view.frame.width/2), y: 0), size: CGSize(width: self.view.frame.width, height: self.view.frame.height))
    //
    //            //            menu.view.isUserInteractionEnabled = false
    //            //            self.view.frame.size.width
    //            //            menu.view.frame = self.view.frame
    //            menu.view.frame = cgr
    //            //            menu.view.frame.origin.x = -(UIScreen.main.bounds.width)
    //
    //            //            let oldviewc = self.childViewControllers.last as! UIViewController
    //
    //            self.addChildViewController(menu)
    
    //            self.addSubview(subView: menu.view, toView: self.view)
    
    //            menu.willMove(toParentViewController:  nil)
    //            menu.view.setNeedsLayout()
    //            menu.modalPresentationStyle = .currentContext
    //            self.view.insertSubview(menu.view, aboveSubview:self.view)
    //            self.view.addSubview(menu.view)
    //
    //            self.transition(from: oldviewc!, to: menu, duration: 0.5, options: UIViewAnimationOptions.curveEaseIn, animations: nil, completion: {
    //
    //            (Bool) -> Void in
    //             oldviewc?.removeFromParentViewController()
    //             self.menu.didMove(toParentViewController: self)
    //
    //            })
    
    //            self.view.addSubview(menu.view)
    //            self.view.clipsToBounds = false
    //            // 建立父子关系
    //            self.addChildViewController(menu)
    //            menu.view.backgroundColor = UIColor.red
    //            menu.didMove(toParentViewController: self)
    //        }
    // 插入当前视图并置顶
    
    
    //    }
    
    
    
    
    
    @IBOutlet weak var open: UIBarButtonItem!
    
    //策划相关回调 SWRevealViewControllerDelegate
    
//    func revealController(_ revealController: SWRevealViewController!, willMoveTo position: FrontViewPosition) {
//        print("----->will")
//    }
//    
//    func revealControllerPanGestureEnded(_ revealController: SWRevealViewController!) {
//        
//        print("---->did\(revealController.frontViewPosition)")
//    }
//    
//    
//    func revealController(_ revealController: SWRevealViewController!, panGestureMovedToLocation location: CGFloat, progress: CGFloat) {
    
        
        
      
        
//        if i>x{
//            self.view.alpha = i
//        }else{
//            
//            if !i.isEqual(to: CGFloat(1)){
//                i = 1
//            }
//            
//            
//        }
        
        
//    }
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.revealViewController() != nil{
        
            open.target = self.revealViewController()
            
            open.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
            self.revealViewController().rearViewRevealWidth = PhoneUtil.getMenuWidth()
            
//            self.revealViewController().delegate = self
        }
        
        //        let pangest = UIPanGestureRecognizer()
        //        pangest.addTarget(self, action: #selector(self.handlePanGesture(recognizer:)))
        //
        //
        //        self.view.addGestureRecognizer(pangest)
        
        //        self.navigationItem.leftBarButtonItem?.action = #selector(self.action)
        //        let one = UINavigationController(rootViewController: ViewController())
        //        let view = SideslipViewController(rearViewController: RightViewController(), frontViewController: one)
        //        present(view!, animated: true, completion: nil)
        
        
        //
        //        presentViewC(view)//打开页面的方法
        
        //        if self.revealViewController() != nil {
        //            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        //        }
        //        if self.revealViewController() != nil {
        //            menuButton.target = self.revealViewController()
        //            menuButton.action = "revealToggle:"
        //            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        //        }
        //
        //        let one = UINavigationController(rootViewController: ViewController())
        //        let view = SideslipViewController(rearViewController: RightViewController(), frontViewController: one)
        //        presentViewC(ui: view)//打开页面的方法
        
        //        if self.revealViewController() != nil {
        //            menuButton.target = self.revealViewController()
        //            menuButton.action = "revealToggle:"
        //            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        //        }
        
        //        self.navigationItem.title = String(0)
        //设置底部tab颜色
        //        self.tabBar.barTintColor = UIColor.red
        //     self.moreNavigationController.tabBarItem = UITabBarItem(title: "item1", image: nil, tag: 0)
        //        for c in self.viewControllers! {
        //
        //            switch c {
        //            case is TableViewController:
        //
        //                let nav = UINavigationController(rootViewController: TableViewController())
        //                let tabitem1 = UITabBarItem(title: "item1", image: nil, tag: 0)
        //                nav.tabBarItem = tabitem1
        //                break
        //
        //            case is TwoViewController:
        //                let nav2 = UINavigationController(rootViewController: TwoViewController())
        //                let tabitem2 = UITabBarItem(title: "item2", image: nil, tag: 1)
        //                nav2.tabBarItem = tabitem2
        //                break
        //
        //            case is ThreeViewController:
        //                let nav3 = UINavigationController(rootViewController: ThreeViewController())
        //                let tabitem3 = UITabBarItem(title: "item3", image: nil, tag: 2)
        //                nav3.tabBarItem = tabitem3
        //                break
        //
        //            case is FourViewController:
        //                let nav4 = UINavigationController(rootViewController: FourViewController())
        //                let tabitem4 = UITabBarItem(title: "item4", image: nil, tag: 4)
        //                nav4.tabBarItem = tabitem4
        //                break
        //            default:
        //                print("--")
        //            }
        //        }
    }
    
    //    func presentViewC(ui: UIView){
    //
    //    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
        
        //        self.navigationItem.title = String(item.tag)
        //从xib 取到view
        //        let nib = UINib(nibName: "TitleView", bundle: nil)
        //        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        //
        //
        //
        //        self.navigationItem.titleView = view
        //    
        //        switch item.tag {
        //        case 0:
        //            
        //            break
        //        case 1:
        //            break
        //        case 2:
        //            break
        //        case 3:
        //            break
        //        default:
        //             print("tabBar-->\(tabBar.frame.size.height)")
        //        }
        
    }
    
    
}
