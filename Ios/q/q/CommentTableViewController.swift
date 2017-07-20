//
//  CommentTableViewController.swift
//  q
//
//  Created by qli on 2017/3/27.
//  Copyright © 2017年 qli. All rights reserved.
//
//http://www.jianshu.com/p/e894f165fcd9 swift UITableview分割线从最开始
import UIKit

class CommentTableViewController: BaseViewController ,CommentProtocol,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate{
    @IBOutlet weak var commentView: UIView!
    
    var refresh:QRefreshControl?

    
    var book: BookObject?
    
    
    var headerView : CommentView?
    @IBAction func btn_Release(_ sender: Any) {
        
        if !(comm_text.text?.isEmpty)! {
            let comment = commentList()
        
            comment.content = comm_text.text!
            comment.critics = "游客: \(DataUtil.getTimeStamp())"
            comment.createTime = DataUtil.getNowData()
            self.commt?.total = -1
            self.commt?.commentList.append(comment)
            self.tableView.reloadData()
            
            _ = textFieldShouldReturn(comm_text)
            comm_text.text = ""
        }else{
        
            showTopDialog("亲！留下点什么再走吧")
        }
        
    }
    @IBAction func sort(_ sender: UIBarButtonItem) {
        self.commt?.commentList.reverse()
        self.tableView.reloadData()
    }

    @IBOutlet weak var comm_text: UITextField!
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        comm_text.resignFirstResponder()
        //键盘收回，view放下
//        UIView.animate(withDuration: 0, animations: {
//            
//        })
        
        self.view.frame.origin.y = 0
        return true
    }
   


    @IBAction func dismiss(_ sender: UIBarButtonItem) {
        
        self.dismissX()
    }
    var commp: CommentPresenter?
//    var id : Int?
    var commt: CommentObject?
    
    func keyboardWillShow(note: NSNotification) {
        let userInfo = note.userInfo!
        let  keyBoardBounds = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let duration = (userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
        
        let deltaY = keyBoardBounds.size.height
        let animations:(() -> Void) = {
            //键盘的偏移量
            self.view.frame.origin.y = -deltaY
            //self.tableView.transform = CGAffineTransformMakeTranslation(0 , -deltaY)
        }
        
        if duration > 0 {
            let options = UIViewAnimationOptions(rawValue: UInt((userInfo[UIKeyboardAnimationCurveUserInfoKey] as! NSNumber).intValue << 16))
            
            UIView.animate(withDuration: duration, delay: 0, options:options, animations: animations, completion: nil)
            
        }else{
            animations()
        }
    }
    
    
//    func keyboardWillHidden(note: NSNotification) {
//        let userInfo  = note.userInfo!
//        let duration = (userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
//        
//        let animations:(() -> Void) = {
//            //键盘的偏移量
//            self.view.frame.origin.y = 0
//            //self.tableView.transform = CGAffineTransformIdentity
//        }
//        if duration > 0 {
//            let options = UIViewAnimationOptions(rawValue: UInt((userInfo[UIKeyboardAnimationCurveUserInfoKey] as! NSNumber).intValue << 16))
//            
//            UIView.animate(withDuration: duration, delay: 0, options:options, animations: animations, completion: nil)
//        }else{
//            animations()
//        }
//    }
    
    var page = 1
    
    
    func initHeaderView() -> UIView {
      headerView =  CommentView(frame: CGRect(x: 0, y: 0, width: self.tableView.frame.width, height: 150))
    
        

                        BaseAlamofireImage.getImage((book?.imageUrl)!, uiimage: (headerView?.comment_image)!)
                        headerView?.comment_name.text = book?.bookName
                        headerView?.comment_title.text = book?.author
                        headerView?.comment_info.text = "评论  \(self.commt?.total ?? 0)"

        
      return headerView!
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        

       
        self.comm_text.delegate = self
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView?.tableFooterView = UIView()
        
        initData()
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(note:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
//        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHidden(note:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    
    func initViews()  {
        
        if refresh == nil {
            self.tableView.tableHeaderView = initHeaderView()
            
            refresh = QRefreshControl(scrollView: tableView,refreshBlock: {
                if self.commt != nil{
                    self.commt?.commentList.removeAll()
                }
                self.page = 1
                self.commp?.handerJsonData(page: self.page, size: 10, id: (self.book?.bookId)!)
                
                self.refresh?.endRefreshing()
                
                self.showTopDialog("刷新成功")
            },loadmoreBlock: {
                
                self.page += 1
                
                self.commp?.handerJsonData(page: self.page, size: 10, id: (self.book?.bookId)!)
                self.refresh?.endLoadingmore((self.commt?.nextpage)!)
            })

        }
        
        
    }
    
    func initData()  {
    
        showLoading()
        commp = CommentPresenter()
        commp?.handerJsonData(page: 1, size: 10, id: (book?.bookId)!)
        commp?.setOnCommentProtocol(commp: self)
    }

    @IBOutlet weak var tableView: UITableView!
    
    func getError(_ error: ERROR_TYPE) {
     dismissLoading()
    }
    
    func getCommentData(_ str: CommentObject) {
        self.commt = str
        
        if !(self.commt?.commentList.isEmpty)! {
            initViews()
            
        }
        self.tableView.reloadData()
        dismissLoading()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if self.commt != nil{
            if (self.commt?.commentList.isEmpty)! {
                return 1
            }
            return (self.commt?.commentList.count)!
        }
        return 0
    }

    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if self.commt != nil && !(self.commt?.commentList.isEmpty)!{
            
//            if indexPath.row == 0 {
//
//                let cellx = tableView.dequeueReusableCell(withIdentifier: "commentxcell") as? CommentXTableViewCell
//                tableView.rowHeight = 160
//                cellx?.selectionStyle = .none
//                BaseAlamofireImage.getImage((book?.imageUrl)!, uiimage: (cellx?.cx_image)!)
//                cellx?.cx_lb.text = book?.bookName
//                cellx?.cx_autor.text = book?.author
//    
//                cellx?.cx_lb_info.text =  "评论  \(self.commt?.total ?? 0)"
//                return cellx!
//            }else{
                let cell = tableView.dequeueReusableCell(withIdentifier: "comment") as! CommentTableViewCell
                tableView.rowHeight = 100
                let  clist = self.commt?.commentList[indexPath.row]
                cell.image_logo.image = #imageLiteral(resourceName: "user1")
                cell.lb_name.text = clist?.critics
                cell.lb_info.text = clist?.content
                cell.lb_time.text = clist?.createTime
                cell.lb_lou.text = "\(indexPath.row+2) 楼"
                
                
                return cell

//            
//            }
            
            
        }else{
        
            let cell_null = tableView.dequeueReusableCell(withIdentifier: "comment_null", for: indexPath) as? CommentNullTableViewCell
            tableView.rowHeight = self.view.frame.size.height-64
            cell_null?.btn_null.addTarget(self, action: #selector(CommentTableViewController.showTypewriting), for: .allTouchEvents)
            return cell_null!
        }
    }
 
    func showTypewriting() {
        comm_text.becomeFirstResponder()
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if self.commt != nil && (self.commt?.total) != 0{
            self.view.frame.origin.y = 0
           let commentList = self.commt?.commentList[indexPath.row]
            let string = (commentList?.critics)! + ": "+(commentList?.content)!
            let optionMenu = UIAlertController(title: nil, message: string, preferredStyle: .actionSheet)
            
            let deleteAction = UIAlertAction(title: "举报", style: .destructive, handler:{ (alert: UIAlertAction!) -> Void in
                //            println("删除")
            })
            
            let saveAction = UIAlertAction(title: "复制", style: .default, handler: { (alert: UIAlertAction!) -> Void in
                //            println("保存")
                UIPasteboard.general.string = self.commt?.commentList[indexPath.row].content
                
            })
            
            
            
            let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: { (alert: UIAlertAction!) -> Void in
                //            println("取消")
                
            })
            
            optionMenu.addAction(saveAction)
            optionMenu.addAction(deleteAction)
            optionMenu.addAction(cancelAction)
            
            self.present(optionMenu, animated: true, completion: nil)
            //解决点击alert延迟问题
//            tableView.cellForRow(at: indexPath)?.selectionStyle = .none
        }
        
       
        

    }


}
