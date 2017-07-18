//
//  SearchOneTableViewCell.swift
//  q
//
//  Created by qli on 2017/3/12.
//  Copyright © 2017年 qli. All rights reserved.
//

import UIKit

class SearchOneTableViewCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource {

    @IBOutlet weak var coll_one: UICollectionView!
    
    var strings: [String]?
    
    let items = 3
    
    @IBOutlet weak var btn_clean: UIButton!
    @IBOutlet weak var lb_h: UILabel!
    @IBAction func clean(_ sender: Any) {
        
        DataSqlite.DbSingle.deleteSearch()
        strings?.removeAll()
        coll_one.reloadData()
        btn_clean.isHidden = true
        lb_h.isHidden = true
    
//        let flow =  coll_one.collectionViewLayout as! UICollectionViewFlowLayout
//        flow.itemSize = CGSize(width: 0, height: 0)
//        coll_one.collectionViewLayout.collectionViewContentSize = CGSize(width: 0, height: 0)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        coll_one.dataSource = self
        coll_one.delegate = self
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if !(self.strings?.isEmpty)! {
            return (self.strings?.count)!
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let flow =  collectionViewLayout as! UICollectionViewFlowLayout
        let itemwidth = (collectionView.bounds.width - CGFloat((items-1))*flow.minimumInteritemSpacing-flow.sectionInset.left-flow.sectionInset.right)/CGFloat(items)
        //水平间距
        //        flow.layoutAttributesForElements(in: <#T##CGRect#>)
        //        height =  flow.collectionViewContentSize.height
        let cgs = CGSize(width: itemwidth, height: 20)
        
        
        return cgs
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let scoll =  collectionView.dequeueReusableCell(withReuseIdentifier: "searchone", for: indexPath) as! SearchOneCollectionViewCell
//        scoll.btn_text.setTitle(strings?[indexPath.row], for:UIControlState.normal)
//        scoll.lb_text.text =
        return scoll
    }
    func setData(content: [String])  {
        
        self.strings = content
        
        if content.isEmpty {
            btn_clean.isHidden = true
            lb_h.isHidden = true
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
