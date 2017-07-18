//
//  STableViewCell.swift
//  q
//
//  Created by qli on 2016/11/18.
//  Copyright © 2016年 qli. All rights reserved.
//

import UIKit

class STableViewCell: UITableViewCell,UIScrollViewDelegate,ImageProrocol {
    
    
    @IBOutlet weak var scroll: QCycleScrollView!
    @IBOutlet weak var mload: UIActivityIndicatorView!

//    var iamgeurls: [String] = []
    
    
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        initViews()
        
    }
    
//    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//    
//        
//    }
    
//    internal func test(){
//    
//    
//    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.selectionStyle = .none
        self.accessoryType = .none
        // Configure the view for the selected state
    }
    
    
    
    
    func initViews() {
        self.contentView.bounds.size.width = UIScreen.main.bounds.size.width
  
        
    }
    func getError(_ error: Error?) {
        mload.stopAnimating()
    }
    
    func getSuccess(_ images: [UIImage]) {
        
    
        mload.stopAnimating()
        mload.isHidden = true
        //设置小圆点
        scroll.images = images
        scroll.pageControl?.numberOfPages = images.count
    }
    

    
    func initUrl(_ iamgeurls: Array<String>)  {

        mload.startAnimating()
        BaseAlamofireImage.getImageArray(iamgeurls)
        BaseAlamofireImage.setImageListenter(self)
    }
    


}
