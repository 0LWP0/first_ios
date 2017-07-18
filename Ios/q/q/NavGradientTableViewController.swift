////
////  NavGradientTableViewController.swift
////  q
////
////  Created by qli on 13/04/2017.
////  Copyright © 2017 qli. All rights reserved.
////
//
//import UIKit
//
//// 顶部图片的高度
private let topImageHeight: CGFloat = 200


////// 顶部图片
////private var topImag: UIImageView?
////// 自定义导航栏
////private var customNavc: UIView?
////// 自定义返回按钮
////private var customBackBtn: UIButton?
////// 当导航栏透明的时候 加载在view上的按钮
////private var viewBackBtn: UIButton?
////// 自定义导航栏标题
////private var customTitleLabel: UILabel?
////// // 当导航栏透明的时候 加载在view上的标题
////private var viewTitleLabel: UILabel?
//
class NavGradientTableViewController: BaseTableViewController,MoreProtocol {
    
    var nView: UIView!
    
    var more: MoreObject?
    
    var toptitle: String?
    
    var imagurl: String?
    
    var yy:CGFloat = -1
    
    internal var catid = ""
    
    var morep: MorePresenter?
    var topImage: UIImageView?
    
    var navcell: NavGradientTableViewCell?
    //    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    //      let navview =  Bundle.main.loadNibNamed("NavTableViewCell", owner: self, options: nil)?.first as! NavTableViewCell
    ////                let topImage = UIImageView(frame: CGRect(x: 0, y:-topImageHeight, width: view.bounds.width, height: topImageHeight))
    ////        navvi
    ////                BaseAlamofireImage.getImage(imagurl!, uiimage:navvnavviewiew)
    //        return navview
    //    }
    
    //    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    //        return 150
    //    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if yy != -1 {
          nView.alpha = yy
        }else{
          nView.alpha = 0.1
        }
        
        //        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        //
        //        self.navigationController!.navigationBar.shadowImage = UIImage()
        
        //        self.navigationController?.navigationBar.isTranslucent = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        nView.alpha = 1
        

        
        //        self.navigationController?.navigationBar.setBackgroundImage(nil, for: UIBarMetrics.default)
        //
        //        self.navigationController!.navigationBar.shadowImage = nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //view 向上偏移64px
        
        self.automaticallyAdjustsScrollViewInsets = false
        nView = self.navigationController?.navigationBar.subviews[0]
//        nView.alpha = 0.1
        self.navigationItem.title = toptitle
        //        self.tableView.contentInset = UIEdgeInsetsMake(topImageHeight, 0, 0, 0)
        initData()
        //        self.navigationController?.navigationBar.isTranslucent = false
        //        self.navigationController?.isNavigationBarHidden=true
        //        self.navigationController?.navigationBar.barTintColor=UIColor.gray
        //        self.automaticallyAdjustsScrollViewInsets = false
        //
        //        // 顶部图片
        topImage = UIImageView(frame: CGRect(x: 0, y:-topImageHeight, width: view.bounds.width, height: topImageHeight))
        BaseAlamofireImage.getImage(imagurl!, uiimage:topImage!)
        
        topImage?.contentMode = .scaleAspectFill
        topImage?.clipsToBounds = true
        //        topImag = topImage
        //
        //        // tableView
        //        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height))
        //        tableView.delegate = self
        //        tableView.dataSource = self;
        //        view.addSubview(tableView)
        tableView.contentInset = UIEdgeInsetsMake(topImageHeight, 0, 0, 0)
        tableView.addSubview(topImage!)
        //
        //        // 自定义导航栏
        //        let backView = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 64))
        //        view.addSubview(backView)
        //        backView.backgroundColor = UIColor(red: 255/255, green: 209/255, blue: 87/255, alpha: 1.0)
        //        backView.alpha = 0.0
        //        customNavc = backView
        //
        //        // 自定义返回按钮
        //        let backBtn = UIButton(frame: CGRect(x: 0, y: 20, width: 40, height: 44))
        //        backBtn.setImage(UIImage(named: "left_back_image_white"), for: UIControlState())
        //        backView.addSubview(backBtn)
        //        backBtn.addTarget(self, action: #selector(NavGradientTableViewController.dis), for: .allTouchEvents)
        //        customBackBtn = backBtn
        //
        //        // 返回按钮
        //        let btn = UIButton(frame: CGRect(x: 0, y: 20, width: 40, height: 44))
        //        btn.setImage(UIImage(named: "left_back_image_white"), for: UIControlState())
        //        view.addSubview(btn)
        //        btn.addTarget(self, action: #selector(NavGradientTableViewController.dis), for: .allTouchEvents)
        //        viewBackBtn = btn
        //
        //        // 自定义标题
        //        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 80, height: 44))
        //        titleLabel.center = CGPoint(x: view.frame.width / 2+10, y: 20 + 22)
        //        titleLabel.text = toptitle
        //        titleLabel.textColor = UIColor.black
        //        customTitleLabel = titleLabel
        //        customTitleLabel?.isHidden = true
        //        customNavc?.addSubview(titleLabel)
        //
        //        // 标题
        //        let viewTitleLabe = UILabel(frame: CGRect(x: 0, y: 0, width: 80, height: 44))
        //        viewTitleLabe.center = CGPoint(x: view.frame.width / 2+10, y: 20 + 22)
        //        viewTitleLabe.text = toptitle
        //        viewTitleLabe.textColor = UIColor.black
        //        viewTitleLabel = viewTitleLabe
        //        view?.addSubview(titleLabel)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        
        if more != nil {
            return (more?.bookList.count)!
        }
        
        return 0
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        
        return 170
        
    }
    
    
    
    func initData()  {
        showLoading()
        morep = MorePresenter()
        morep?.handerJsonData(cid: self.catid, page: 1,size: 10)
        
        morep?.setOnMoreProtocol(more: self)
    }
    func getError(_ error: ERROR_TYPE) {
        dismissLoading()
    }
    
    func getMoreData(_ str: MoreObject) {
        more = str
        dismissLoading()
        self.tableView.reloadData()
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let lcell = tableView.dequeueReusableCell(withIdentifier: "lqcell") as? MoreTableViewCell
        if more != nil {
            let book =  more?.bookList[indexPath.row]
            BaseAlamofireImage.getImage((book?.imageUrl)!, uiimage:  (lcell?.image_more)!)
            lcell?.lb_more_one.text = book?.bookName
            lcell?.lb_more_two.text = book?.author
            lcell?.lb_more_three.text = book?.desc
            
            lcell?.lb_more_four.text = book?.lastestChineseChapter
        }
        
        return lcell!
        
        
        
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        yy = nView.alpha
        
        let bid:Int = (more?.bookList[indexPath.row].bookId)!
        
        let myStoryBoard = self.storyboard
        
        let anotherView = myStoryBoard!.instantiateViewController(withIdentifier: "detailsvc") as! DetailsViewController
        anotherView.bookid = "\(bid)"
        anotherView.isB = false
        self.navigationController?.pushViewController(anotherView, animated: true)
        
        
    }
    
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // 根据偏移量改变alpha的值
        let offY = scrollView.contentOffset.y
        let y = (offY + 64) / (topImageHeight - 64) + 1
        
        if 1 <= y ||  y > 0{
            nView.alpha = y
        }
        
        
        
        if offY < -topImageHeight {
            topImage?.frame.origin.y = offY
            topImage?.frame.size.height = -offY
        }
        
    }
    
    
//    override func viewDidDisappear(_ animated: Bool) {
//        print("viewDidDisappear")
//       NavGradientTableViewController.yy = 0
//    }
}
