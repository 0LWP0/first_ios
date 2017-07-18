//
//  ChapterListTableViewController.swift
//  q
//
//  Created by qli on 16/07/2017.
//  Copyright © 2017 qli. All rights reserved.
//

import UIKit

class ChapterListTableViewController: BaseTableViewController,ChapterListProtocol {

    
    var chapterlist: ChapterList?
    func getError(_ error: ERROR_TYPE) {
        dismissLoading()
    }
    
    func getChapterListData(_ str: ChapterList) {
        
        print("\(str.chapterList.count)")
        dismissLoading()
        self.chapterlist = str
        self.tableView.reloadData()
    }
    
    var chp: ChapterListPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "目录"
        showLoading()
        chp = ChapterListPresenter()
        chp?.setChapterListProtocol(cp: self)
        chp?.handerJsonData()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

   
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        if chapterlist != nil {
            return (chapterlist?.chapterList.count)!
        }
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "chaptercell") as? ChapterListTableViewCell
        if chapterlist != nil {
            cell?.chapter_lb.text = chapterlist?.chapterList[indexPath.row].chapterTitle
        
        }
        

        return cell!
    }
 
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }

    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
