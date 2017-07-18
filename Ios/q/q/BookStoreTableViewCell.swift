//
//  BookStoreTableViewCell.swift
//  q
//
//  Created by qli on 2017/3/1.
//  Copyright © 2017年 qli. All rights reserved.
//

import UIKit

class BookStoreTableViewCell: UITableViewCell {

    @IBOutlet weak var cv_one: UICollectionView!
    @IBOutlet weak var lb_one: UILabel!
    @IBOutlet weak var iv_one: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        self.selectionStyle = .none
//        let layout =  cv_one.collectionViewLayout as? UICollectionViewFlowLayout
//        layout?.minimumLineSpacing = 1.0
//
//        layout?.minimumInteritemSpacing = -32.0
//        (cv_one.bounds.width - (layout?.minimumInteritemSpacing)!-(layout?.sectionInset.left)!-(layout?.sectionInset.right)!)/CGFloat(2)
        
//        let f = (layout?.minimumInteritemSpacing)! + (layout?.sectionInset.left)! + (layout?.sectionInset.right)!
//         let itemwidth = (cv_one.bounds.width - f)/2
//        
//
//       
//        layout?.itemSize = CGSize(width: itemwidth, height: 80)

        // Initialization code
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
