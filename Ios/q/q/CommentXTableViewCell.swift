//
//  CommentXTableViewCell.swift
//  q
//
//  Created by qli on 18/07/2017.
//  Copyright © 2017 qli. All rights reserved.
//

import UIKit

class CommentXTableViewCell: UITableViewCell {

    @IBOutlet weak var cx_autor: UILabel!
    @IBOutlet weak var cx_lb_info: UILabel!
    @IBOutlet weak var cx_image: UIImageView!
    @IBOutlet weak var cx_lb: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
