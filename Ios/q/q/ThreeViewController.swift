//
//  ThreeViewController.swift
//  q
//https://github.com/psvmc/ZJRefreshControl


//结束下拉刷新
//self.refreshControl.endRefreshing();
//结束加载更多
//self.refreshControl.endLoadingmore();
//  Created by qli on 2016/10/21.
//  Copyright © 2016年 qli. All rights reserved.
//UIGestureRecognizerDelegate 手势
//

import UIKit

class ThreeViewController: BaseTableViewController,FindProtocol,FindXProtocol,UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,CommentClickProtocol{
    
    var bookcell: SelectedTableViewTwoCell!
    
    var findx: FindXObject!
    
    var findpresenter: FindXPresenter!
    
    var refresh:QRefreshControl!
    
    var page = 1
    
    final let size = 5
    
    func getFindXData(_ str: FindXObject) {
        
        
        //        print("\(refresh.isAnimating())")
        
        
        
        self.findx = str
        bookcell.setData(f: findx)
        self.tableView.reloadData()
        dismissLoading()
    }
    
    
    func initRefresh(){
        refresh = QRefreshControl(scrollView: tableView,refreshBlock: {
            
            if self.findx != nil{
                self.findx.commentList.removeAll()
            }
            self.page = 1
            self.findpresenter.handerJsonData(p: self.page, s: self.size)
            self.refresh.endRefreshing()
            
            self.showTopDialog("刷新成功")
        },loadmoreBlock: {
            
            
            
            
            self.page += 1
            
            self.findpresenter.handerJsonData(p: self.page, s: self.size)
            self.refresh.endLoadingmore(self.findx.nextpage)
            
            
        })
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let flow =  collectionViewLayout as! UICollectionViewFlowLayout
        let itemwidth = (collectionView.bounds.width - flow.minimumInteritemSpacing-flow.sectionInset.left-flow.sectionInset.right)/CGFloat(2)
        //水平间距
        //        flow.layoutAttributesForElements(in: <#T##CGRect#>)
        let cgs = CGSize(width: itemwidth, height: 80)
        //        if indexPath.row == 0 {
        //            let c = CGSize(width: collectionView.bounds.width, height: flow.itemSize.height)
        //            return c
        //        }
        //        let cgs = CGSize(width: itemwidth, height: flow.itemSize.height)
        //
        //
        return cgs
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let find_three =  collectionView.dequeueReusableCell(withReuseIdentifier: "findcollectionx1", for: indexPath) as! FindCollViewCell
        
        //        if mFind != nil {
        BaseAlamofireImage.getImage(mFind.content[0].subCatList[indexPath.row].imageUrl, uiimage: find_three.image_one_find)
        find_three.lb_one_find.text = mFind.content[0].subCatList[indexPath.row].catName
        find_three.lb_two_find.text = mFind.content[0].subCatList[indexPath.row].desc
        //        }
        
        
        return find_three
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        if mFind != nil {
            return mFind.content[0].subCatList.count
        }
        
        return 0
        
    }
    var mFind: Find!
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let  find_one = tableView.dequeueReusableCell(withIdentifier: "selected_one_cell") as! SelectedTableViewOneCell!
            
            if mFind != nil {
                BaseAlamofireImage.getImage(mFind.content[0].imageUrl, uiimage:  (find_one?.image_find)!)
                find_one?.lb_info.text = mFind.content[0].desc
                find_one?.coll_find.delegate = self
                
                find_one?.coll_find.dataSource = self
                
            }
            
            return find_one!
        }else{
            
            bookcell = tableView.dequeueReusableCell(withIdentifier: "selected_two_cell") as! SelectedTableViewTwoCell!
            bookcell.setOnClick(comlistener: self)
            return bookcell
        }
    }
    
    func onClick(id: Int,b: BookObject) {
        let myStoryBoard = self.storyboard
        
        let anotherView = myStoryBoard!.instantiateViewController(withIdentifier: "commentvc") as! CommentTableViewController

        anotherView.id = id
        anotherView.book = b
        self.navigationController?.pushViewController(anotherView, animated: true)
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func getSuccess(_ str: Find) {
        
        mFind = str
    }
    
    
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 115
        }else{
            
            if self.findx != nil {
                
                return CGFloat(150*self.findx.commentList.count)
            }
            
            return 0
        }
    }
    
    func getError(_ error: ERROR_TYPE) {
        dismissLoading()
    }
    
    func initData()  {
        showLoading()
        let find = FindPresenter()
        find.handerJsonData()
        find.setOnBookStoreProtocol(book: self)
        
        findpresenter = FindXPresenter()
        findpresenter.handerJsonData(p: page, s: self.size)
        findpresenter.setOnBookStoreProtocol(book: self)
    }
    // In a storyboard-based application, you will often want to do a little preparation before navigation
     

    override func viewDidLoad() {
        super.viewDidLoad()
        initRefresh()
        initData()
        
        
        //        refresh = UIRefreshControl()
        //
        //        refresh.backgroundColor = UIColor.gray
        //        refresh.tintColor = UIColor.yellow
        //
        //        self.tableView.addSubview(refresh)
        //
        
        //       let nib_one = UINib(nibName: "SelectedTableViewOneCell", bundle: nil)
        //       let nib_two = UINib(nibName: "SelectedTableViewTwoCell", bundle: nil)
        //
        //
        //         self.tableView.register(nib, forCellReuseIdentifier: "STableViewCell")
        //        self.tableView.register(nib_one, forCellReuseIdentifier: "selected_one_cell")
        //        self.tableView.register(nib_two, forCellReuseIdentifier: "selected_two_cell")
        //
        //
        //        self.tableView.separatorStyle = .none
        //
        //
        //        showLoading()
        //        let selected = SelectedPresenter()
        //        selected.requestData()
        //        selected.delegate = self.selected
    }
    
    //定义一个带字符串参数的闭包
    //    func selected(list: Array<SelectedObject>)->Void{
    //        dismissLoading()
    //        selectedList = list
    //        self.tableView.reloadData()
    //        print("----->\(list.count)")
    //
    //        //给textLab 赋值
    //        //这句话什么时候执行？，闭包类似于oc中的block或者可以理解成c语言中函数，只有当被调用的时候里面的内容才会执行
    //    }
    //
    //
    //    //item点击
    //    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //        tableView.deselectRow(at: indexPath, animated: false)
    //        //         tableView.cellForRow(at: indexPath)?.isSelected = false
    //    }
    //
    //    override func numberOfSections(in tableView: UITableView) -> Int {
    //        // #warning Incomplete implementation, return the number of sections
    //        return 2
    //    }
    //    //显示item的总数
    //    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //        // #warning Incomplete implementation, return the number of rows
    //        if !self.selectedList.isEmpty {
    //            return self.selectedList.count
    //        }
    //        return 0
    //    }
    //
    //
    //
    //    //设置数据源
    //    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //
    //
    //        //参数两个实用自带的view，一个参数使用自定义的nib
    //        if indexPath.row == 0{
    //
    //
    //
    //
    //            if (c == nil){
    //                c = tableView.dequeueReusableCell(withIdentifier: "scell") as? STableViewCell
    ////                c?.initsData()
    //            }
    //
    //            return c!
    //
    //        }else{
    //            var cell = tableView.cellForRow(at: indexPath)
    //            if !self.selectedList.isEmpty {
    //                if  (cell == nil){
    //                    cell = tableView.dequeueReusableCell(withIdentifier: "selected_one_cell") as! SelectedTableViewOneCell
    ////                    cell?.textLabel?.text = self.selectedList[indexPath.row].Intro
    //                }
    //
    //
    //            }
    //
    //            return cell!
    //        }
    //
    //
    //
    //    }
    //
    //    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    //
    //        if indexPath.row == 0 {
    //
    //            //            var i:CGFloat = tableView.estimatedRowHeight
    //            //            i = CGFloat(200)
    //            return 200
    //        }else{
    //            return UITableViewAutomaticDimension
    //        }
    //    }
    
    //    @IBAction func mBtn(_ sender: Any) {
    //
    //        DispatchQueue.global().async {
    //            //耗时操作
    //            print("耗时操作")
    //            DispatchQueue.main.async {
    //                //更新ui
    //                print("更新ui")
    //            }
    //
    //        }
    //
    //    }
    
    // 菜单状态枚举
    //    enum MenuState {
    //        case Collapsed  // 未显示(收起)
    //        case Expanding   // 展开中
    //        case Expanded   // 展开
    //    }
    //
    //    // 菜单页当前状态
    //    var currentState = MenuState.Collapsed {
    //        didSet {
    //            //菜单展开的时候，给主页面边缘添加阴影
    //            let shouldShowShadow = currentState != .Collapsed
    //            showShadowForMainViewController(shouldShowShadow: shouldShowShadow)
    //        }
    //    }
    //
    
    //    @IBOutlet weak var scroll: QCycleScrollView!
    
    
    //        initData()
    
    
    
    
    
    
    
    
    
    //       image.image = BaseAlamofireImage.getImage(url: "https://www.baidu.com/img/bd_logo1.png")
    
    //        main = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "main") as! MainViewController
    //
    //        arget: self,
    //        action: #selector(self.handlePanGesture(recognizer:))
    //
    //
    //
    //        self.view.addSubview(main.view)
    //
    //        addChildViewController(main)
    //
    //        main.didMove(toParentViewController: self)
    
    
    
    //
    //        main.view.addGestureRecognizer(pangest)
    //        拖动
    
    //        let right = UISwipeGestureRecognizer()
    //        right.addTarget(self, action: #selector(self.handleSwipeGesture(sender:)))
    //        self.view.addGestureRecognizer(right)
    //
    //        let pangest = UIPanGestureRecognizer()
    //        pangest.addTarget(self, action: #selector(self.handlePanGesture(recognizer:)))
    //
    //
    //        self.view.addGestureRecognizer(pangest)
    //判断左右
    
    //点击
    //        let tapGestureRecognizer = UITapGestureRecognizer()
    //        tapGestureRecognizer.addTarget(self,
    //                                       action: #selector(self.handlePanGesture(recognizer:)))
    //        self.view.addGestureRecognizer(tapGestureRecognizer)
    
    
    //        BaseAlamofireImage.getImage(url: "https://www.baidu.com/img/bd_logo1.png", uiimageview: image)
    
    
    //    func handleSwipeGesture(sender: UISwipeGestureRecognizer){
    //
    //        self.uip = sender
    //
    //
    //    }
    //
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
    ////            let dragFromLeftToRight = (recognizer.velocity(in: view).x > 0)
    ////            // 如果刚刚开始滑动的时候还处于主页面，从左向右滑动加入侧面菜单
    ////            if (currentState == .Collapsed && dragFromLeftToRight) {
    ////                currentState = .Expanding
    ////            }
    //
    //        // 如果是正在滑动，则偏移主视图的坐标实现跟随手指位置移动
    //        case .changed:
    ////            let transslation: CGPoint = recognizer.translation(in: self.view)
    //            //滑动距离
    ////            self.view.center.x = recognizer.translation(in: view).x
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
    ////            let positionX = recognizer.view!.frame.origin.x +
    ////                recognizer.translation(in: view).x
    ////            //页面滑到最左侧的话就不许要继续往左移动
    ////            recognizer.view!.frame.origin.x = positionX < 0 ? 0 : positionX
    ////            recognizer.setTranslation(CGPoint(x: 200, y: 0), in: self.view)
    //             break
    //        // 如果滑动结束
    //        case .ended:
    //            print("ended")
    //             break
    //            //根据页面滑动是否过半，判断后面是自动展开还是收缩
    ////            let hasMovedhanHalfway = recognizer.view!.center.x > view.bounds.size.width
    ////            animateMainView(shouldExpand: hasMovedhanHalfway)
    //        default:
    //            break
    //        }
    //    }
    //
    //
    //    //单击手势响应
    //    func handlePanGesture() {
    //        //如果菜单是展开的点击主页部分则会收起
    //        if currentState == .Expanded {
    //            animateMainView(shouldExpand: false)
    //        }
    //    }
    //
    //    // 添加菜单页
    //    func addMenuViewController() {
    //
    //        if menu == nil {
    //            menu = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "menu") as! MenuViewController
    //                     let cgr = CGRect(origin: CGPoint(x: -(self.view.frame.width), y: 0), size: CGSize(width: self.view.frame.width, height: self.view.frame.height))
    //
    ////            menu.view.isUserInteractionEnabled = false
    ////            self.view.frame.size.width
    ////            menu.view.frame = self.view.frame
    //            menu.view.frame = cgr
    ////            menu.view.frame.origin.x = -(UIScreen.main.bounds.width)
    //
    ////            let oldviewc = self.childViewControllers.last as! UIViewController
    //
    //            self.addChildViewController(menu)
    //
    //            self.addSubview(subView: menu.view, toView: self.view)
    //
    ////            menu.willMove(toParentViewController:  nil)
    ////            menu.view.setNeedsLayout()
    ////            menu.modalPresentationStyle = .currentContext
    ////            self.view.insertSubview(menu.view, aboveSubview:self.view)
    ////            self.view.addSubview(menu.view)
    ////
    ////            self.transition(from: oldviewc!, to: menu, duration: 0.5, options: UIViewAnimationOptions.curveEaseIn, animations: nil, completion: {
    ////
    ////            (Bool) -> Void in
    ////             oldviewc?.removeFromParentViewController()
    ////             self.menu.didMove(toParentViewController: self)
    ////
    ////            })
    //
    ////            self.view.addSubview(menu.view)
    ////            self.view.clipsToBounds = false
    ////            // 建立父子关系
    ////            self.addChildViewController(menu)
    ////            menu.view.backgroundColor = UIColor.red
    ////            menu.didMove(toParentViewController: self)
    //        }
    //            // 插入当前视图并置顶
    //
    //
    //    }
    
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
    //    //主页自动展开、收起动画
    //    func animateMainView(shouldExpand: Bool) {
    //        // 如果是用来展开
    //        if (shouldExpand) {
    //            // 更新当前状态
    //            currentState = .Expanded
    //            // 动画
    //            animateMainViewXPosition(targetPosition: main.view.frame.width -
    //                menuViewExpandedOffset)
    //        }
    //            // 如果是用于隐藏
    //        else {
    //            // 动画
    //            animateMainViewXPosition(targetPosition: 0) { finished in
    //                // 动画结束之后s更新状态
    //                self.currentState = .Collapsed
    //                // 移除左侧视图
    //                self.menu.view.removeFromSuperview()
    //                // 释放内存
    ////                self.menu = nil;
    //            }
    //        }
    //    }
    //
    //    //主页移动动画（在x轴移动）
    //    func animateMainViewXPosition(targetPosition: CGFloat,
    //                                  completion: ((Bool) -> Void)! = nil) {
    //        //usingSpringWithDamping：1.0表示没有弹簧震动动画
    //        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1.0,
    //                                   initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
    //                                    self.main.view.frame.origin.x = targetPosition
    //        }, completion: completion)
    //    }
    //
    //    //给主页面边缘添加、取消阴影
    //    func showShadowForMainViewController(shouldShowShadow: Bool) {
    //        if (shouldShowShadow) {
    //            main.view.layer.shadowOpacity = 0.8
    //        } else {
    //            main.view.layer.shadowOpacity = 0.0
    //        }
    //    }
    
    //    @IBOutlet var bottomView: UIView!
    //   // @IBOutlet var bottomView: UIView!
    //
    //  //  @IBOutlet weak var aboveView: UIView!
    //
    //    var mView: UIView!
    //
    //
    //   // @IBOutlet weak var aboveView: UIView!
    //    var swipeLeft: UISwipeGestureRecognizer!
    //    var swipeRight: UISwipeGestureRecognizer!
    //
    //    var x: CGFloat = 0
    //
    //    let width = UIScreen.main.bounds.width/2
    //
    //    var leftv: LeftView!
    //
    //    //var usermodel = DataModel();
    //
    //   // @IBOutlet weak var mButton: UIButton!
    //
    //    override func viewDidLoad() {
    //        super.viewDidLoad()
    //
    //
    //
    ////
    ////        addChildViewController(<#T##childController: UIViewController##UIViewController#>)
    ////         let cgr = CGRect(origin: CGPoint(x: -(UIScreen.main.bounds.width), y: 0), size: CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
    //        self.initView()
    //
    //
    //        //        usermodel.user.username = "liqu"
    //        //usermodel.user.password = "lq123456"
    //        //usermodel.saveData()
    //    //    usermodel.writeToFile()
    //      //  mButton.addTarget(self, action: #selector(self.onClick), for: .touchDown)
    //
    //        //    print("----->\(usermodel.documentsDirectory())")
    //        //        let img = UIImage(named: "girl")!
    //        //
    //        //        let uiimageview = UIImageView(image: img)
    //        //        uiimageview.contentMode = .scaleToFill
    //        //        uiimageview.frame = CGRect(origin: CGPoint(x:20,y:50), size: CGSize(width:img.size.width,height:img.size.height))
    //
    //        //        Alamofire.request(Qurl.baiDuurl).responseImage { response in
    //        //            debugPrint(response)
    //        //
    //        //            print(response.request)
    //        //            print(response.response)
    //        //            debugPrint(response.result)
    //
    //        //            if let image = response.result.value {
    //        //                self.mImage.image = image
    //        //                print("image downloaded: \(image)")
    //        //            }
    //        //        }
    //        // Do any additional setup after loading the view.
    //
    //
    //    }
    //
    //    override func viewWillLayoutSubviews() {
    //
    //    }
    //
    //    override func viewDidLayoutSubviews() {
    //
    //
    //
    ////        swipeLeft = UISwipeGestureRecognizer();
    ////        swipeLeft.addTarget(self, action: #selector(self.swipe(recognizer:)))
    ////        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
    ////        self.bottomView.addGestureRecognizer(swipeLeft)
    ////
    ////
    ////
    ////        swipeRight = UISwipeGestureRecognizer();
    ////        swipeRight.addTarget(self, action: #selector(self.swipe(recognizer:)))
    ////        swipeRight.direction = UISwipeGestureRecognizerDirection.right
    ////        self.bottomView.addGestureRecognizer(swipeRight)
    //
    //
    //
    //
    //    }
    //
    //    override func viewDidAppear(_ animated: Bool) {
    //
    //
    //
    //
    //    }
    //
    //
    //
    //    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
    //        return true
    //    }
    //
    //    func initView()  {
    //        let cgr = CGRect(origin: CGPoint(x: -(UIScreen.main.bounds.width/2), y: 0), size: CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
    ////        mView = LeftView()
    ////        mView.backgroundColor = UIColor.blue
    ////        insertSubview(mView, at: 0)
    //
    ////        mView = UIView(frame: cgr)
    ////
    ////        mView.backgroundColor = UIColor.blue
    //       leftv = Bundle.main.loadNibNamed("LeftView", owner: nil, options: nil)?.first as! LeftView!
    //
    ////        if (LeftView == nil) {
    ////            print("LeftView--->nil")
    ////            return
    ////        }
    ////        self.bottomView.insertSubview(mView, at: 1)
    //        leftv.layer.ma
    //        self.view.addSubview(leftv)
    //
    //
    //    }
    ////
    //    func swipe(recognizer: UISwipeGestureRecognizer!){
    //
    //
    //
    //        switch recognizer.direction {
    //        case UISwipeGestureRecognizerDirection.left:
    //
    //            print("---->left")
    //
    //            break
    //
    //        case UISwipeGestureRecognizerDirection.right:
    //            print("---->right")
    //            break
    //        default:
    //            print("")
    //        }
    ////
    ////        switch recognizer.direction {
    ////        case UISwipeGestureRecognizerDirection.left:
    //    
    ////            self.view.backgroundColor = UIColor.yellow
    //        
    //           // self.view.center.x = x
    ////             print("left")
    ////             break
    ////        case UISwipeGestureRecognizerDirection.right:
    //            //self.view.backgroundColor = UIColor.red
    //          //  print("right\(self.view.center.x)")
    //          ////  UIView.beginAnimations(nil, context: nil)
    //          //  UIView.setAnimationDuration(2.0)
    //          //  self.view.center.x = self.view.center.x+UIScreen.main.bounds.width/2
    //         //   UIView.setAnimationCurve(UIViewAnimationCurve.easeOut) //设置动画相对速度
    //          //  UIView.commitAnimations()
    //                      // self.view.center.x = self.view.center.x+UIScreen.main.bounds.width/2
    ////             break
    ////        default:
    ////            print("----->")
    ////        }
    //    
    //        //if (recognizer.direction ==  UISwipeGestureRecognizerDirection.left){
    //        //    UIView.animate(withDuration:0.5, animations: {
    //        //        if(self.flag%2 != 0){
    //        //            self.aboveView.center.x = //self.view.bounds.width/2;
    //        //            self.flag+=1;
    //         //       }
    //         //   })
    //            
    //        //}else {
    //         //   UIView.animate(withDuration:0.5, animations: {
    //         //       if(self.flag%2 == 0){
    //          //          self.aboveView.center.x = self.aboveView.center.x+self.view.bounds.width/1.5;
    //          //          self.flag+=1;
    //           //     }
    //            //})
    //      //  }
    //    }
    //    
    //点击
    //    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    //        
    //
    //    }
    //
    //    
    //    override func didReceiveMemoryWarning() {
    //        super.didReceiveMemoryWarning()
    //        // Dispose of any resources that can be recreated.
    //    }
}
