//
//  QCycleScrollCell.swift
//  q
//
//  Created by qli on 2016/11/8.
//  Copyright © 2016年 qli. All rights reserved.
// 轮播图
//

import UIKit

class QCycleScrollCell: UICollectionViewCell {
    var imageView:UIImageView!
//    var titleBackgroundView:UIView?
//    var titleLabel:UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configView() {
        imageView = UIImageView.init(frame: bounds)
//        imageView.contentMode = .scaleAspectFit
        contentView.addSubview(imageView)
        
//        titleBackgroundView = UIView.init(frame: CGRect(x: 0, y: bounds.height - 60, width: bounds.width - 0, height: 40))
//        contentView.addSubview(titleBackgroundView!)
//        
//        titleLabel = UILabel.init(frame: CGRect(x: 10, y: 0, width: titleBackgroundView!.bounds.width - 20, height: titleBackgroundView!.bounds.height))
//        titleLabel!.numberOfLines = 2
//        titleBackgroundView!.addSubview(titleLabel!)
        
    }
   }
