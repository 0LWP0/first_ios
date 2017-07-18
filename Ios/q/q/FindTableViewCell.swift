//
//  FindTableViewCell.swift
//  q
//
//  Created by qli on 2017/3/3.
//  Copyright © 2017年 qli. All rights reserved.
//

import UIKit

class FindTableViewCell: UITableViewCell {
    @IBOutlet weak var lb_zan: UILabel!

    @IBOutlet weak var image_user_logo: UIImageView!
    @IBOutlet weak var image_book: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
          self.selectionStyle = .none
        // Initialization code
    }

    @IBOutlet weak var lb_name: UILabel!
    @IBOutlet weak var lb_find_info: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
