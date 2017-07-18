//
//  MoreTableViewCell.swift
//  q
//
//  Created by qli on 2017/3/11.
//  Copyright © 2017年 qli. All rights reserved.
//

import UIKit

class MoreTableViewCell: UITableViewCell {

    @IBOutlet weak var image_more: UIImageView!
    
    
    @IBOutlet weak var lb_more_four: UILabel!
    @IBOutlet weak var lb_more_three: UILabel!
    @IBOutlet weak var lb_more_two: UILabel!
    @IBOutlet weak var lb_more_one: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
