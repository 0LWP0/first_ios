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
    
    var bookid: String = "1"
    
    func getError(_ error: ERROR_TYPE) {
        dismissLoading()
    }
    
    func getDetailsData(_ str: DetailsObject) {
        
        deat = str

        self.tableView.reloadData()
        dismissLoading()
    }
    
   fileprivate  func initHeader() {
    
    
        BaseAlamofireImage.getImage(deat.imageUrl, uiimage: (details?.de_image)!)
        details?.de_lb_one.text  = deat.bookName
        details?.de_lb_two.text  = deat.author
        details?.de_lb_three.text = "评分  " + String(deat.scores) + "  评论数 " + deat.comments
        details?.de_lb_four.text = deat.words+"字  " + deat.scorePeople+"人喜欢"
        details?.de_lb_five.text = deat.ddesc
        details?.lb_zj.text = "连载至第\(deat.lastestChapter)章"
        details?.lb_time.text =  deat.recentlyUpdateTime
    

    
    }
    var de: DetailsPresenter!

    
    
    var details: DetailsView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        details = DetailsView()
//        self.tableView.tableHeaderView = details
//        initHeader()

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
    
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
            //    case 0:
            
            //        let  first = tableView.dequeueReusableCell(withIdentifier: "dfirst") as? DFirstTableViewCell
            //         if deat != nil {
            
            //          BaseAlamofireImage.getImage(deat.imageUrl, uiimage: (first?.image_one_d)!)
            
            //          first?.lb_one.text = deat.bookName
            //         first?.lb_two.text = deat.author
            //       first?.lb_five.text = "评分  " + String(deat.scores) + "  评论数 " + deat.comments
            //         first?.lb_three.text = deat.words+"字  " + deat.scorePeople+"人喜欢"
            //         first?.lb_four.text = deat.ddesc
            //     }
            
            //      return first!
            
        case 0:
            let  send = tableView.dequeueReusableCell(withIdentifier: "dsend") as? DSendTableViewCell
            if deat != nil {
               
                send?.initData(alist: deat.recentlyUpdateChaptes)
        tableView.rowHeight = CGFloat(deat.recentlyUpdateChaptes.count * 30)
            }
            
            return send!
            
        case 1:
            
            
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
            
        case 2:
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
        return 3
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
