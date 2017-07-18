//
//  MoreViewController.swift
//  q
//  http://www.hangge.com/blog/cache/detail_720.html
//  Created by qli on 2017/3/6.
//  Copyright © 2017年 qli. All rights reserved.
//

import UIKit

class MoreViewController: BaseTableViewController,MoreProtocol {

    internal var mTitle = ""
    
    internal var catid = ""
    
    var more: MoreObject?
    
    var refresh:QRefreshControl?
    
    var page = 1
    var morep: MorePresenter?

    override func viewDidLoad() {
        super.viewDidLoad()


        self.navigationItem.title = mTitle
        initRefresh()
        initData()
    }
    
    func initRefresh(){
        refresh = QRefreshControl(scrollView: tableView,refreshBlock: {
            
            if self.more != nil{
                self.more?.bookList.removeAll()
            }
            self.page = 1
            self.morep?.handerJsonData(cid: self.catid, page: self.page,size: 6)
            self.refresh?.endRefreshing()

            self.showTopDialog("刷新成功")
        },loadmoreBlock: {
            
            self.page += 1
            self.morep?.handerJsonData(cid: self.catid, page: self.page,size: 6)
            self.refresh?.endLoadingmore((self.more?.nextpage)!)

        })
    }

    
    func initData()  {
        showLoading()
        morep = MorePresenter()
        morep?.handerJsonData(cid: self.catid, page: 1,size: 6)
        
        morep?.setOnMoreProtocol(more: self)
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "morecell") as? MoreTableViewCell
        
        if more != nil {
            let book =  more?.bookList[indexPath.row]
            BaseAlamofireImage.getImage((book?.imageUrl)!, uiimage:  (cell?.image_more)!)
            cell?.lb_more_one.text = book?.bookName
            cell?.lb_more_two.text = book?.author
            cell?.lb_more_three.text = book?.desc
            
            cell?.lb_more_four.text = book?.lastestChineseChapter
        }
        
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if more != nil {
          return (more?.bookList.count)!
        }
        
        return 0
    }
    
    func getError(_ error: ERROR_TYPE) {
        dismissLoading()
    }
    
    func getMoreData(_ str: MoreObject) {
        more = str
        dismissLoading()
        self.tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let bid:Int = (more?.bookList[indexPath.row].bookId)!
        
        let myStoryBoard = self.storyboard
        
        let anotherView = myStoryBoard!.instantiateViewController(withIdentifier: "detailsvc") as! DetailsViewController
        anotherView.bookid = "\(bid)"
        anotherView.isB = false
        self.navigationController?.pushViewController(anotherView, animated: true)

    
    }
    


}
