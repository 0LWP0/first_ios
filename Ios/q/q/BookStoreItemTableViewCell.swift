//
//  BookStoreItemTableViewCell.swift
//  q
//
//  Created by qli on 2017/3/1.
//  Copyright © 2017年 qli. All rights reserved.
//

import UIKit

class BookStoreItemTableViewCell: UITableViewCell,UITableViewDataSource,UITableViewDelegate{
    
    
    @IBOutlet weak var table_two: UITableView!
    //
    @IBOutlet weak var image_two: UIImageView!
    
    var books: Array<BookStoreSubObject>!
    
    var book: BookStoreClickProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.table_two.dataSource = self
        
        self.table_two.delegate = self
        
        let nib = UINib(nibName: "BookStoreItemNibTwoTableViewCell", bundle: nil)
        self.table_two.register(nib, forCellReuseIdentifier: "bookstoreitemtwo")
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setData(sub: Array<BookStoreSubObject>!)  {
        
        
        self.books = sub
        
        self.table_two.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  bookstoreitem = tableView.dequeueReusableCell(withIdentifier: "bookstoreitemtwo") as! BookStoreItemNibTwoTableViewCell!
        
        
        
        
        BaseAlamofireImage.getImage(books[indexPath.row].imageUrl, uiimage:   (bookstoreitem?.iv_one_nib)!)
        
        
        bookstoreitem?.lb_one_nib.text = books[indexPath.row].catName
        bookstoreitem?.lb_two_nib.text = books[indexPath.row].desc
        bookstoreitem?.lb_three_nib.text = "共\(books[indexPath.row].total)册>"
        return bookstoreitem!
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if books != nil {
            return books.count
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func setOnClickProtocol(bookclick: BookStoreClickProtocol)  {
        self.book = bookclick
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.book?.onClickCatId(cid: books[indexPath.row].catId,cname: books[indexPath.row].catName)
    }
    
}
