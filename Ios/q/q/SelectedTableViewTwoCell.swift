//
//  SelectedTableViewTwoCell.swift
//  q
//
//  Created by qli on 2016/12/16.
//  Copyright © 2016年 qli. All rights reserved.
//

import UIKit

class SelectedTableViewTwoCell: UITableViewCell ,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var table_find: UITableView!
    
    var findx: FindXObject!
    
    var comm: CommentClickProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.table_find.dataSource = self
        
        self.table_find.delegate = self
        self.table_find.separatorStyle = .none
        
        self.selectionStyle = .none
        let nib = UINib(nibName: "FindTableViewCell", bundle: nil)
        self.table_find.register(nib, forCellReuseIdentifier: "findcellone")
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        if findx != nil {
            return findx.commentList.count
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  find = tableView.dequeueReusableCell(withIdentifier: "findcellone") as! FindTableViewCell!
        
        if findx != nil {
            
            BaseAlamofireImage.getImage(findx.commentList[indexPath.row].book.imageUrl, uiimage:   (find?.image_book)!)
            
            if !findx.commentList[indexPath.row].icon.isEmpty {
                BaseAlamofireImage.getImage(findx.commentList[indexPath.row].icon, uiimage:   (find?.image_user_logo)!)
            }else{
                
                find?.image_user_logo.image = #imageLiteral(resourceName: "user1")
            }
            
            find?.lb_find_info.text = findx.commentList[indexPath.row].book.desc
            find?.lb_name.text = findx.commentList[indexPath.row].critics
            
            find?.lb_zan.text = "赞: \(findx.commentList[indexPath.row].likes) . 评论: \(findx.commentList[indexPath.row].replies)"
        }
        
        return find!
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func setData(f: FindXObject)  {
        
        self.findx = f
        
        self.table_find.reloadData()
    }
    
    
    //item点击
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

      
        self.comm?.onClick(id: findx.commentList[indexPath.row].commentId,b: findx.commentList[indexPath.row].book)

    }
    
    func setOnClick(comlistener: CommentClickProtocol)  {
        self.comm = comlistener
        
    }

}
