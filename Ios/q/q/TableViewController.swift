//
//  TableViewController.swift
//  q
//
//  Created by qli on 2016/10/25.
//  Copyright © 2016年 qli. All rights reserved.
//
//http://blog.sunnyxx.com/2015/06/07/fullscreen-pop-gesture/ 

//extension UIViewController {
//    
//    func presentDetail(_ viewControllerToPresent: UIViewController) {
//        let transition = CATransition()
//        transition.duration = 0.25
//        transition.type = kCATransitionPush
//        transition.subtype = kCATransitionFromRight
//        self.view.window!.layer.add(transition, forKey: kCATransition)
//        
//        present(viewControllerToPresent, animated: false)
//    }
//    
//    func dismissDetail() {
//        let transition = CATransition()
//        transition.duration = 0.25
//        transition.type = kCATransitionPush
//        transition.subtype = kCATransitionFromLeft
//        self.view.window!.layer.add(transition, forKey: kCATransition)
//        
//        dismiss(animated: false)
//    }
//}
import UIKit

class TableViewController: BaseTableViewController,BaseProtocol,TableProtocol,QCycleScrollViewDelegate{

    
    
    //    @IBOutlet weak var tableview: UITableView!
    var mList = Selected()
//    var selectedom: SelectedObject!
//   let a = TranslationDelegate()
    var booklist: [Book]?
    var nib: UINib!
    var snib: UINib!
    var bnib: UINib!
//    var imageurls = Array<String>();
    //    var c: STableViewCell?
    
    //    let cellid = "demo"
    
    let scellid = "scell"
    
    let bookid = "bookcell"
    let booktwoid = "booktwocell"
    
    
    //    var refresh: UIRefreshControl!
    // 创建目标队列
    //    let time: TimeInterval = 5
    
    
    var c: UITableViewCell!
    
    var sc: STableViewCell!
    //    var bc: BookTableViewCell!
    //
    //    var bic: BookTableViewTwoItemCell!
    @IBAction func mBt_more(_ sender: UIButton) {

        let myStoryBoard = self.storyboard
        
        let anotherView = myStoryBoard!.instantiateViewController(withIdentifier: "morevc") as! MoreViewController
        
        anotherView.mTitle = mList.selectedList[sender.tag].catName
        anotherView.catid = mList.selectedList[sender.tag].catId
        
        self.navigationController?.pushViewController(anotherView, animated: true)
        
    }
    

//    func cycleScrollView(_ cycleScrollView: QCycleScrollView, didSelectAt index: Int,book: Book) {
//        print("\(book.bookName)")
//    }

    func cycleScrollView(_ cycleScrollView: QCycleScrollView, didSelectAt index: Int,book: Book) {
        let myStoryBoard = self.storyboard
        if book.type == "bookBanner"  {
           
            
            let anotherView = myStoryBoard!.instantiateViewController(withIdentifier: "detailsvc") as! DetailsViewController
            anotherView.bookid = book.bookId
            self.navigationController?.pushViewController(anotherView, animated: true)
        }else{
    
            let nav = myStoryBoard!.instantiateViewController(withIdentifier: "navgravc") as! NavGradientTableViewController
            nav.toptitle = book.catName
            nav.imagurl = book.imageUrl
            nav.catid = book.catId
            self.navigationController?.pushViewController(nav, animated: true)
            
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showLoading()
        let selected = SelectedPresenter()
        selected.requestData()
        selected.setBaseProtocoListener(self)

        snib = UINib(nibName: "STableViewCell", bundle: nil)
        bnib = UINib(nibName: "BookTableViewTwoItemCell", bundle: nil)
        //        tableview.register(nib, forCellReuseIdentifier: bookid)
        tableView.register(snib, forCellReuseIdentifier: scellid)
        tableView.register(bnib, forCellReuseIdentifier: booktwoid)
        
        tableView.separatorStyle = .none

        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    //显示item有多好类型
    //    override func numberOfSections(in tableView: UITableView) -> Int {
    //        // #warning Incomplete implementation, return the number of sections
    //        return 3
    //    }
    //显示item的总数
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if (!self.mList.selectedList.isEmpty) {
            return self.mList.selectedList.count
        }
        return 0
    }
    
    
    
    
    //参数两个实用自带的view，一个参数使用自定义的nib
    //        if indexPath.row == 0{
    //
    //
    //            if (c == nil){
    //                c = tableView.dequeueReusableCell(withIdentifier: scellid) as? STableViewCell
    //                c?.initsData()
    //            }
    //
    //            return c!
    //
    //        }else{
    //            var cell = tableView.cellForRow(at: indexPath)
    //            if !self.mList.isEmpty {
    //                if  (cell == nil){
    //                    cell = tableView.dequeueReusableCell(withIdentifier: cellid)
    //                    cell?.textLabel?.text = self.mList[indexPath.row]
    //                }
    //            }
    //
    //            return cell!
    //        }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        
        if !mList.selectedList.isEmpty {
            let selectedom =  mList.selectedList[indexPath.row]
            let mType = mList.selectedList[indexPath.row].type
      
            if mType == "bannerList" {
                
                if (sc == nil){
                    
                    sc = tableView.dequeueReusableCell(withIdentifier: scellid) as? STableViewCell

                    sc.scroll.delegate = self
                    sc.initUrl(selectedom.booklist)
                }
                
                return sc
            }
            
            
            if mType == "bookList" {
                
                let cell2 = tableView.dequeueReusableCell(withIdentifier: bookid) as?BookTableViewXCell
                cell2?.setData(self,selectedom.booklist)
                cell2?.setOnItemClick(table: self)
                //                    cell2?.table_selected.delegate = self
                //                    cell2?.btn_more.addTarget(self, action: #selector(TableViewController.jump(sender:)), for:.touchDown)
                cell2?.btn_more.tag = indexPath.row
                BaseAlamofireImage.getImage(selectedom.imageUrl, uiimage:  cell2!.iv_selected)
                
                c = cell2
            }
            
            
            if mType == "subjectList" {
                
                let cell3 = tableView.dequeueReusableCell(withIdentifier: booktwoid) as? BookTableViewTwoItemCell


                
                
                cell3?.lb_two_selected.text = selectedom.catName
                BaseAlamofireImage.getImage(selectedom.imageUrl, uiimage:(cell3?.iv_two_selected)!)
                c = cell3
            }
            
            
        }else{
            let  cell4 = tableView.dequeueReusableCell(withIdentifier: "error",for: indexPath)
            cell4.textLabel?.text = "数据加载失败，请稍后再试，抱歉！"
            c = cell4
        }
        return  c
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let mType = mList.selectedList[indexPath.row].type
        if mType == "bannerList" {
            return 210
        }
        
        if mType == "subjectList"{
            
            return 210
        }
            
        else{
            
            if !mList.selectedList[indexPath.row].booklist.isEmpty {
                return CGFloat(160*mList.selectedList[indexPath.row].booklist.count+35)
            }
            
            return 0
            
        }
        
        
        //        return UITableViewAutomaticDimension
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //        tableView.estimatedRowHeight = 200
        //        tableView.rowHeight = UITableViewRowAnimat
    }
    
    
    //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //
    //
    //        if segue.identifier == "more" {
    //            let controller  = segue.destination as! UINavigationController
    //            let c =  controller.visibleViewController as! MoreViewController
    //            let uibutton = sender as! UIButton
    //            c.mTitle = mList.selectedList[uibutton.tag].catName
    //
    //        }
    //
    //    }
    
    /*
     请求失败
     */
    func getError(_ error: ERROR_TYPE) {
        dismissLoading()
        if error == .error_NO_NET_WOTK {
            self.present(AlertDialog.showDialog("提示",message: "请检查网络",bt1text: ""), animated: true, completion: nil)
            
        }
        
        
        
    }
    
    
    func jump(sender: UIButton)  {
        self.performSegue(withIdentifier: "more", sender: sender)
    }
    
    /*-
     请求成功
     */
    func getSuccess(_ str: Selected) {
        dismissLoading()
        
        mList = str;
        //            //注意这行代码，请求数据成功后一定要刷新数据，不然数据不会显示
        self.tableView.reloadData()
        
    }
    //    //item点击
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        
            let mType = mList.selectedList[indexPath.row].type
            if mType == "subjectList" {
                
                let myStoryBoard = self.storyboard
                
                let nav = myStoryBoard!.instantiateViewController(withIdentifier: "navgravc") as! NavGradientTableViewController
                nav.toptitle = mList.selectedList[indexPath.row].catName
                nav.imagurl = mList.selectedList[indexPath.row].imageUrl
                nav.catid = mList.selectedList[indexPath.row].catId
                self.navigationController?.pushViewController(nav, animated: true)
            }

            

    }
    
    
    func onCell(_ id: String) {
        
        
        let myStoryBoard = self.storyboard
        
        let anotherView = myStoryBoard!.instantiateViewController(withIdentifier: "detailsvc") as! DetailsViewController
        anotherView.bookid = id
        anotherView.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(anotherView, animated: true)
    }
    
    
    
}
