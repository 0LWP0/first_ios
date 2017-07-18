//
//  DemoTableViewCell.swift
//  q
//
//  Created by qli on 2016/11/11.
//  Copyright © 2016年 qli. All rights reserved.
//

import UIKit

class DemoTableViewCell: UITableViewCell {

    @IBOutlet weak var mLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.accessoryType = .none
//        self.selectionStyle = .none
//        self.focusStyle = .custom
        // Configure the view for the selected state
    }
    

    
}
