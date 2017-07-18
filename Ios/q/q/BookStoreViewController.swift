//
//  BookStoreViewController.swift
//  q
//
//  Created by qli on 2017/3/1.
//  Copyright © 2017年 qli. All rights reserved.
//

import UIKit

private let items = 2

class BookStoreViewController: BaseTableViewController,BookStoreProtocol,UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,BookStoreClickProtocol {
    
    var bookstore: UINib!
    var bookstoreitem: UINib!
    
    var bookstorepresenter:BookStorePresenter!

    var book:BookStore!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
//        initViews()
        
        initData()
        
        
        


        // Do any additional setup after loading the view.
    }
    
    
    
    func jumpMore(id: Int,name: String) {
        let myStoryBoard = self.storyboard
        
        let anotherView = myStoryBoard!.instantiateViewController(withIdentifier: "morevc") as! MoreViewController
        
        anotherView.mTitle = name
        anotherView.catid = String(id)
        
        self.navigationController?.pushViewController(anotherView, animated: true)

    }
    func onClickCatId(cid: Int,cname: String) {
        jumpMore(id: cid,name: cname)
    }
    
    
    func initData()  {
        showLoading()
        bookstorepresenter = BookStorePresenter()
        bookstorepresenter.handerJsonData();
        bookstorepresenter.setOnBookStoreProtocol(book: self)
    }
    
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 2
    }
    
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        
//        if indexPath.row == 1 {
//            if book != nil {
//                return CGFloat(book.content[1].subCatList.count*120)+35
//            }
//            
//            return 0
//
//        }
//        
//// return UITableViewAutomaticDimension
//    }
//    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
             let  bookstorecell = tableView.dequeueReusableCell(withIdentifier: "bookstore") as! BookStoreTableViewCell!

            if book != nil {
                BaseAlamofireImage.getImage(book.content[0].imageUrl, uiimage:  (bookstorecell?.iv_one)!)
                bookstorecell?.lb_one.text = book.content[0].desc

                bookstorecell?.cv_one.delegate = self
                bookstorecell?.cv_one.dataSource = self
                tableView.rowHeight = (bookstorecell?.cv_one.collectionViewLayout.collectionViewContentSize.height)!+35
                
            }
            
               return bookstorecell!
        }else{
         let bookstoreitemcell = tableView.dequeueReusableCell(withIdentifier: "bookstoreitem") as? BookStoreItemTableViewCell
           
            if book != nil {
            bookstoreitemcell?.setOnClickProtocol(bookclick: self)
            BaseAlamofireImage.getImage(book.content[1].imageUrl, uiimage:   (bookstoreitemcell?.image_two)!)
                bookstoreitemcell?.setData(sub: book.content[1].subCatList)
                tableView.rowHeight  = CGFloat(book.content[1].subCatList.count*120)+35
            }
            return bookstoreitemcell!
            
        }
    }
    
    
    func getSuccess(_ str: BookStore) {
        dismissLoading()
        self.book = str
        
        
        self.tableView.reloadData()
    }
    
    func getError(_ error: ERROR_TYPE) {
         dismissLoading()
        
    }
    func initViews()  {
        
//        bookstore = UINib(nibName: "BookStoreTableViewCell", bundle: nil)
//        
//        bookstoreitem = UINib(nibName: "BookStoreItemTableViewCell", bundle: nil)
//        
//        tableView.register(bookstore, forCellReuseIdentifier: "bookstore")
//        tableView.register(bookstoreitem, forCellReuseIdentifier: "bookstoreitem")
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        jumpMore(id: book.content[0].subCatList[indexPath.row].catId,name: book.content[0].subCatList[indexPath.row].catName)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return book.content[0].subCatList.count
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
      let bookstorecollcell =  collectionView.dequeueReusableCell(withReuseIdentifier: "bookstorecollcell", for: indexPath) as! BookStoreCollectionViewCell
        bookstorecollcell.lb_cv_one.text = book.content[0].subCatList[indexPath.row].catName
        bookstorecollcell.lb_name.text = book.content[0].subCatList[indexPath.row].desc
        BaseAlamofireImage.getImage(book.content[0].subCatList[indexPath.row].imageUrl, uiimage:  bookstorecollcell.iv_cv_one)
        return bookstorecollcell

    }
    
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 2
//    }
//     func numberOfSections(in collectionView: UICollectionView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }




    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
