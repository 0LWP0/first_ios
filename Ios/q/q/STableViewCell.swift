//
//  STableViewCell.swift
//  q
//
//  Created by qli on 2016/11/18.
//  Copyright © 2016年 qli. All rights reserved.
//

import UIKit

class STableViewCell: UITableViewCell,UIScrollViewDelegate {
    
    
    @IBOutlet weak var scroll: QCycleScrollView!
//    @IBOutlet weak var mload: UIActivityIndicatorView!

//    var iamgeurls: [String] = []
    
    
    
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        initViews()
        
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.selectionStyle = .none
        self.accessoryType = .none
        // Configure the view for the selected state
    }
    
    
    
    
    func initViews() {
        self.contentView.bounds.size.width = UIScreen.main.bounds.size.width
  
        
    }


    
    func initUrl(_ iamgeurls: [Book])  {

        scroll.books = iamgeurls

    }
    


}
