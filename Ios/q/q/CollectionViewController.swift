//
//  CollectionViewController.swift
//  q
//
//  Created by qli on 2016/12/11.
//  Copyright © 2016年 qli. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

private let items = 3

class CollectionViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
//        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        self.collectionView?.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
//   override func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets{
//        return UIEdgeInsetsMake(5, 10, 5, 10)
//    }
    

//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsetsMake(0, 10, 0, 10)
//    }


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       
        let flow =  collectionViewLayout as! UICollectionViewFlowLayout
        let itemwidth = (collectionView.bounds.width - CGFloat((items-1))*flow.minimumInteritemSpacing-flow.sectionInset.left-flow.sectionInset.right)/CGFloat(items)
        //水平间距
//        flow.layoutAttributesForElements(in: <#T##CGRect#>)
        var cgs: CGSize  = CGSize()
        
        switch indexPath.row {
        case 0:
            
            cgs = CGSize(width: collectionView.bounds.width, height: flow.itemSize.height)
            break
            
        case 2:
         
            cgs = CGSize(width: itemwidth, height: flow.itemSize.height)
            break
        case 1:
            cgs = CGSize(width: itemwidth, height: flow.itemSize.height*2)
            
            break
        default:
            cgs = CGSize(width: itemwidth, height: flow.itemSize.height)
        }
//        if indexPath.row == 0 {
//            let c = CGSize(width: collectionView.bounds.width, height: flow.itemSize.height)
//            return c
//        }
//        let cgs = CGSize(width: itemwidth, height: flow.itemSize.height)
//        
//
        return cgs
    }
    

    
    

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 20
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
        cell.mLabel.text = "item\(indexPath.row)"
        // Configure the cell
    
        return cell
    }
    
    

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
//         let flow =  collectionViewLayout as! UICollectionViewFlowLayout
    
        print("------>\(indexPath.row)")
        return true
    }


    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }
*/
    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
 

}
