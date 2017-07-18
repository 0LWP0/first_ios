//
//  DFivethTableViewCell.swift
//  q
//
//  Created by qli on 15/07/2017.
//  Copyright © 2017 qli. All rights reserved.
//

import UIKit

class DFivethTableViewCell: UITableViewCell {
    @IBOutlet weak var five_name_one: UILabel!
    @IBOutlet weak var five_info_two: UILabel!

    @IBOutlet weak var five_messgae: UILabel!
    @IBOutlet weak var five_image: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
