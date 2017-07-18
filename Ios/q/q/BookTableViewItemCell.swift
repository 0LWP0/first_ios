//
//  BookTableViewItemCell.swift
//  q
//
//  Created by qli on 2016/12/28.
//  Copyright © 2016年 qli. All rights reserved.
//

import UIKit

class BookTableViewItemCell: UITableViewCell {

    @IBOutlet weak var lb_info: UILabel!
    @IBOutlet weak var lb_end: UILabel!
    @IBOutlet weak var lb_author: UILabel!
    @IBOutlet weak var lb_selected: UILabel!
    @IBOutlet weak var iv_selected: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
//        self.selectionStyle = .none
        

        // Initialization code
        
//         self.contentView.bounds.size.width = UIScreen.main.bounds.size.width
//        self.contentView.bounds.size.height = UIScreen.main.bounds.size.height
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
