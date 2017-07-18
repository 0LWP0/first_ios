//
//  CollectionViewCell.swift
//  q
//
//  Created by qli on 2016/12/11.
//  Copyright © 2016年 qli. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var mLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.bounds.size.width = UIScreen.main.bounds.size.width
        // Initialization code
    }

}
