//
//  DFirstTableViewCell.swift
//  q
//
//  Created by qli on 2017/3/8.
//  Copyright © 2017年 qli. All rights reserved.
//

import UIKit

class DFirstTableViewCell: UITableViewCell {

    @IBOutlet weak var lb_five: UILabel!
    @IBOutlet weak var lb_three: UILabel!
    @IBOutlet weak var lb_four: UILabel!

    @IBOutlet weak var lb_two: UILabel!
    @IBOutlet weak var lb_one: UILabel!
    @IBOutlet weak var image_one_d: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
