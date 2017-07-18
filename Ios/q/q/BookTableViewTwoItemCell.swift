//
//  BookTableViewTwoItemCell.swift
//  q
//
//  Created by qli on 2016/12/28.
//  Copyright © 2016年 qli. All rights reserved.
//

import UIKit

class BookTableViewTwoItemCell: UITableViewCell {

    @IBOutlet weak var iv_two_selected: UIImageView!
    @IBOutlet weak var lb_two_selected: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()

        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
