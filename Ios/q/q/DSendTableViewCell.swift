//
//  DSendTableViewCell.swift
//  q
//
//  Created by qli on 15/07/2017.
//  Copyright © 2017 qli. All rights reserved.
//

import UIKit

class DSendTableViewCell: UITableViewCell {
    
    @IBOutlet weak var de__lable: UILabel!
//    var rlist: Array<recentlyUpdateChaptesObject>?
//
//
//    @IBOutlet weak var dTableView: UITableView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        self.dTableView.delegate = self
//        self.dTableView.dataSource = self
     
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
//    func initData(alist: Array<recentlyUpdateChaptesObject>) {
//        self.rlist = alist
//        self.dTableView.reloadData()
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        
//        if self.rlist != nil {
//            return (self.rlist?.count)!
//        }
//        return 0
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell =  dTableView.dequeueReusableCell(withIdentifier: "dthrid") as? ThridTableViewCell
//        cell?.thrid_lb.text = self.rlist?[indexPath.row].chapterTitle
//        return cell!
//    }
//    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        
//        
//        return 30
//    }

}
