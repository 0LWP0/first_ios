//
//  CommentTableViewCell.swift
//  q
//
//  Created by qli on 2017/3/27.
//  Copyright © 2017年 qli. All rights reserved.
//

import UIKit

class CommentTableViewCell: UITableViewCell {

    @IBOutlet weak var lb_lou: UILabel!
    @IBOutlet weak var image_logo: UIImageView!
    
    @IBOutlet weak var lb_info: UILabel!
    @IBOutlet weak var lb_time: UILabel!
    
    @IBOutlet weak var lb_name: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
//        self.selectionStyle = .default
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
