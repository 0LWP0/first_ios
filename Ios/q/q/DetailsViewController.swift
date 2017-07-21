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
    
    var decell: DetailsTableViewCell?
    
    @IBAction func btn_collection(_ sender: UIButton) {
        
        let coll = CollectionObserber()
        let bo = BookObject()
        bo.bookId = deat.bookId
        bo.imageUrl = deat.imageUrl
        bo.author = deat.author
        
        coll.b = bo
    }
    
    var bookid: String = "1"
    
    func getError(_ error: ERROR_TYPE) {
        dismissLoading()
    }
    
    func getDetailsData(_ str: DetailsObject) {
        
        deat = str
        initHeader()
        self.tableView.reloadData()
        dismissLoading()
    }
    
   fileprivate  func initHeader() {
    
    
        BaseAlamofireImage.getImage(deat.imageUrl, uiimage: (decell?.de_image_cell)!)
        decell?.lb_one_cell.text  = deat.bookName
        decell?.lb_two_cell.text  = deat.author
        decell?.lb_three_cell.text = "评分  " + String(deat.scores) + "  评论数 " + deat.comments
        decell?.lb_four_cell.text = deat.words+"字  " + deat.scorePeople+"人喜欢"
        decell?.lb_five_cell.text = deat.ddesc
        decell?.lb_zj.text = "连载至第\(deat.lastestChapter)章"
        decell?.lb_time_cell.text =  deat.recentlyUpdateTime
    

    
    }
    var de: DetailsPresenter!

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        decell = Bundle.main.loadNibNamed("DetailsTableViewCell", owner: nil, options: nil)?[0] as? DetailsTableViewCell

        self.tableView.tableHeaderView = decell
        self.tableView.tableFooterView = Bundle.main.loadNibNamed("DetailsXTableViewCell", owner: nil, options: nil)?[0] as? DetailsXTableViewCell
        
        self.tableView.delegate = self
        self.tableView.dataSource = self

      

        
        self.navigationItem.title = "书籍详情"
//        initHeader()
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
    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 400
//    }
//    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row <= 4 {
            let  send = tableView.dequeueReusableCell(withIdentifier: "dsend") as? DSendTableViewCell
            if deat != nil {
                tableView.rowHeight = 30
                send?.de__lable.text = deat.recentlyUpdateChaptes[indexPath.row].chapterTitle
            }
            
            return send!
        }else if(indexPath.row == 5){
            let  se = tableView.dequeueReusableCell(withIdentifier: "spcell")
            return se!
        }else{
        
             let  fourth = tableView.dequeueReusableCell(withIdentifier: "dfourth") as? DFourthTableViewCell
            
            if deat != nil {
             let recentCommentObject = deat.recentComment[indexPath.row-6]
//                print("\(indexPath.row)")
                tableView.rowHeight = 100

                 BaseAlamofireImage.getImage(recentCommentObject.replies, uiimage: (fourth?.four_image_logo)!)
                fourth?.four_name.text = recentCommentObject.visitor
                fourth?.four_desc.text = recentCommentObject.critics
                fourth?.four_like.text = "回复: \((recentCommentObject.replies)) 赞  " + "\((recentCommentObject.likes))  " + (recentCommentObject.createTime)
                
            }
            return fourth!
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if deat != nil {
            return (deat.recentComment.count + deat.recentlyUpdateChaptes.count)+1
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 2 {
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
