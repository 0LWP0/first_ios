//
//  BookTableViewXCell.swift
//  q
//
//  Created by qli on 2017/3/6.
//  Copyright © 2017年 qli. All rights reserved.
//

import UIKit

class BookTableViewXCell: UITableViewCell,UITableViewDelegate,UITableViewDataSource {
  var mBook: [Book]!
    
    var cont: BaseTableViewController?
    
    var t: TableProtocol?
    override func awakeFromNib() {
        super.awakeFromNib()
        
        table_selected.delegate = self
        table_selected.dataSource = self

        let nib = UINib(nibName: "BookTableViewItemCell", bundle: nil)
        
        table_selected.register(nib, forCellReuseIdentifier: "bookitemcellx")

    }
    @IBOutlet weak var iv_selected: UIImageView!
    @IBOutlet weak var table_selected: UITableView!

    @IBOutlet weak var btn_more: UIButton!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    
    func setData(_ con: BaseTableViewController,_ books: [Book]) {
        
        self.mBook = books
        self.cont = con
        //        table_selected.reloadData()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookitemcellx") as! BookTableViewItemCell
        if !mBook.isEmpty {
            let b = mBook[indexPath.row]
            BaseAlamofireImage.getImage(b.imageUrl, uiimage: cell.iv_selected)
            cell.lb_selected.text = b.bookName
            cell.lb_info.text = b.desc
            cell.lb_end.text = b.lastestChineseChapter
            cell.lb_author.text = b.author
            
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if !self.mBook.isEmpty {
            return self.mBook.count
        }
        
        return 0
    }
    //item点击
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        t?.onCell(mBook[indexPath.row].bookId)
        tableView.deselectRow(at: indexPath, animated: false)
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    func setOnItemClick(table: TableProtocol) {
        self.t = table
    }

}
