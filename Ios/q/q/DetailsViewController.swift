//
//  TestViewController.swift
//  q
//
//  Created by qli on 2017/3/8.
//  Copyright © 2017年 qli. All rights reserved.
//http://stackoverflow.com/questions/37722323/how-to-present-view-controller-from-right-to-left-in-ios-using-swift

import UIKit

class DetailsViewController: BaseViewController,DetailsProtocol,UITableViewDelegate,UITableViewDataSource{
    
    var deat: DetailsObject!
    @IBOutlet weak var tableView: UITableView!
    
    
    @IBAction func btn_collection(_ sender: UIButton) {
        
        let coll = CollectionObserber()
        let bo = BookObject()
        bo.bookId = deat.bookId
        bo.imageUrl = deat.imageUrl
        bo.author = deat.author

        coll.b = bo
    }

    var mView: UIView!

    var bookid: String = "1"
    
    func getError(_ error: ERROR_TYPE) {
        dismissLoading()
    }
    
    func getDetailsData(_ str: DetailsObject) {
       
        deat = str
        self.tableView.reloadData()
        dismissLoading()
    }
    var de: DetailsPresenter!
    
//    override func viewWillDisappear(_ animated: Bool) {
//        
////        if let viewWithTag = self.navigationController?.view.viewWithTag(101){
////            viewWithTag.removeFromSuperview()
////        }
//        
//    }
//    override func viewWillAppear(_ animated: Bool) {
//        if mView == nil {
//            mView = UIView(frame: CGRect(x: 0, y:self.view.bounds.height-50, width: self.view.bounds.width, height: 50))
//            mView.backgroundColor = UIColor.red
//            mView.tag = 101
//            self.navigationController?.view.insertSubview(mView, at: 1)
//        }
//        
//
//    }
//    
//    override func viewDidDisappear(_ animated: Bool) {
//        mView.removeFromSuperview()
//    }
    
       override func viewDidLoad() {
        super.viewDidLoad()
        
       
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        

        self.navigationItem.title = "书籍详情"
        
//        let view = UIView(frame: CGRect(x: 0, y: self.view.bounds.height-50, width: self.view.bounds.width, height: 50))
//        view.backgroundColor = UIColor.red
//        self.view.addSubview(view)
        
        showLoading()
        de = DetailsPresenter()
        de.handerJsonData(bookid)
        de.setOnDetailsProtocol(details: self)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            
            let  first = tableView.dequeueReusableCell(withIdentifier: "dfirst") as? DFirstTableViewCell
            if deat != nil {
                
                BaseAlamofireImage.getImage(deat.imageUrl, uiimage: (first?.image_one_d)!)
                
                first?.lb_one.text = deat.bookName
                first?.lb_two.text = deat.author
                first?.lb_five.text = "评分  " + String(deat.scores) + "  评论数 " + deat.comments
                first?.lb_three.text = deat.words+"字  " + deat.scorePeople+"人喜欢"
                first?.lb_four.text = deat.ddesc
            }

            return first!
            
        case 1:
            let  send = tableView.dequeueReusableCell(withIdentifier: "dsend") as? DSendTableViewCell
            if deat != nil {
            send?.send_one_lb.text = "连载至第\(deat.lastestChapter)章"
            send?.third_two_lb.text = deat.recentlyUpdateTime
            send?.initData(alist: deat.recentlyUpdateChaptes)
            }
            
            return send!
            
        case 2:

            
            let  fourth = tableView.dequeueReusableCell(withIdentifier: "dfourth") as? DFourthTableViewCell
            
            if deat != nil{
                if deat.recentComment.isEmpty {
                     tableView.rowHeight = 0
                }else{
                tableView.rowHeight = 10 + CGFloat(100 * deat.recentComment.count)+(fourth?.four_lb.frame.size.height)!
                 fourth?.initData(rclist: deat.recentComment)
                }
               
            }
            return fourth!
            
        case 3:
            tableView.rowHeight = 45
             let  sexth = tableView.dequeueReusableCell(withIdentifier: "sexth")
            
             return sexth!
            
            
        default:
            var  end = tableView.dequeueReusableCell(withIdentifier: "CellId")
            
            if end == nil {
                end = UITableViewCell(style: .default, reuseIdentifier: "CellId")
            }
            return end!
        }
        
    }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 3 {
            let myStoryBoard = self.storyboard
            
            let anotherView = myStoryBoard!.instantiateViewController(withIdentifier: "commentvc") as! CommentTableViewController
            
            let bo = BookObject()
            bo.bookId = deat.bookId
            bo.imageUrl = deat.imageUrl
            bo.author = deat.author
            anotherView.book = bo
            self.navigationController?.pushViewController(anotherView, animated: true)
            tableView.cellForRow(at: indexPath)?.selectionStyle = .none
        }
    }
    
     func scrollViewDidScroll(_ scrollView: UIScrollView) {
    
    
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
