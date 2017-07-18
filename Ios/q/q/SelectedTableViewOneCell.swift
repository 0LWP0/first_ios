//
//  SelectedTableViewOneCell.swift
//  q
//
//  Created by qli on 2016/12/16.
//  Copyright © 2016年 qli. All rights reserved.
//

import UIKit

class SelectedTableViewOneCell: UITableViewCell {

    @IBOutlet weak var coll_find: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
          self.selectionStyle = .none
        
//        let layout =  coll_find.collectionViewLayout as? UICollectionViewFlowLayout
        //        layout?.minimumLineSpacing = 1.0
        //
        //        layout?.minimumInteritemSpacing = -32.0
        //        (cv_one.bounds.width - (layout?.minimumInteritemSpacing)!-(layout?.sectionInset.left)!-(layout?.sectionInset.right)!)/CGFloat(2)
        
//        let f = (layout?.minimumInteritemSpacing)! + (layout?.sectionInset.left)! + (layout?.sectionInset.right)!
//        let itemwidth = (coll_find.bounds.width - f)/2
//        
//        
//        
//        layout?.itemSize = CGSize(width: itemwidth, height: 80)
        
        // Initialization code
    }

    @IBOutlet weak var image_find: UIImageView!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet weak var lb_info: UILabel!
    

}
