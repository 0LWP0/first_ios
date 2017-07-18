//
//  BookStoreItemNibTwoTableViewCell.swift
//  q
//
//  Created by qli on 2017/3/3.
//  Copyright © 2017年 qli. All rights reserved.
//

import UIKit

class BookStoreItemNibTwoTableViewCell: UITableViewCell {

    @IBOutlet weak var lb_three_nib: UILabel!
    @IBOutlet weak var lb_two_nib: UILabel!
    @IBOutlet weak var lb_one_nib: UILabel!
    @IBOutlet weak var iv_one_nib: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.selectionStyle = .none
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
