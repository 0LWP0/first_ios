//
//  DFourthTableViewCell.swift
//  q
//
//  Created by qli on 15/07/2017.
//  Copyright © 2017 qli. All rights reserved.
//

import UIKit

class DFourthTableViewCell: UITableViewCell,UITableViewDataSource,UITableViewDelegate {
    
    var mList: Array<recentCommentObject>?
    @IBOutlet weak var four_lb: UILabel!

    @IBOutlet weak var fourth_tableview: UITableView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.fourth_tableview.dataSource = self
        self.fourth_tableview.delegate = self
        // Initialization code
    }
    
    func initData(rclist: Array<recentCommentObject>) {
        self.mList = rclist
        self.fourth_tableview.reloadData()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "dfiveth") as? DFivethTableViewCell
        if mList != nil {
            BaseAlamofireImage.getImage((mList?[indexPath.row].visitor)!, uiimage: (cell?.five_image)!)
            cell?.five_name_one.text = mList?[indexPath.row].critics
            cell?.five_info_two.text = mList?[indexPath.row].content
            cell?.five_messgae.text = "回复: \((mList?[indexPath.row].replies)!) 赞  " + "\((mList?[indexPath.row].likes)!)  " + (mList?[indexPath.row].createTime)!
            
        }
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if mList != nil {
            return 100
        }
        return 0
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if mList != nil {
            return (mList?.count)!
        }
        return 0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
