//
//  DetailsTableViewCell.swift
//  q
//
//  Created by qli on 21/07/2017.
//  Copyright © 2017 qli. All rights reserved.
//

import UIKit

class DetailsTableViewCell: UITableViewCell {
    @IBOutlet weak var lb_two_cell: UILabel!
    @IBOutlet weak var lb_time_cell: UILabel!

    @IBOutlet weak var lb_zj: UILabel!
    @IBOutlet weak var lb_five_cell: UILabel!
    @IBOutlet weak var lb_four_cell: UILabel!
    @IBOutlet weak var lb_three_cell: UILabel!
    @IBOutlet weak var lb_one_cell: UILabel!
    @IBOutlet weak var de_image_cell: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
