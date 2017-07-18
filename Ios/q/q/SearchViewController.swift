//
//  SearchTableViewController.swift
//  q
//
//  Created by qli on 2017/3/12.
//  Copyright © 2017年 qli. All rights reserved.
//

import UIKit



class SearchViewController: BaseViewController ,SearchProtocol,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    
    

    var sear: Search!
    @IBOutlet weak var coll: UICollectionView!
    var height: CGFloat?
    var items = 3
    var search: SearchPresenter?
    var sone: SearchOneTableViewCell?
    
    func clean()  {
        search?.cleanH()

        
        self.coll.reloadData()
    }
    
    @IBAction func dismiss(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if sear != nil {
            
            let searchobject = sear?.content[indexPath.row]
            if searchobject?.type == TYPE_FOUR{
                
                let scoll4 =  collectionView.dequeueReusableCell(withReuseIdentifier: "srarchfour", for: indexPath) as! SearchFourCollectionViewCell
                scoll4.clean.addTarget(self, action: #selector(self.clean), for: .touchUpInside)
                
                return scoll4
            }
           else if searchobject?.type == TYPE_ONE {
                let scoll =  collectionView.dequeueReusableCell(withReuseIdentifier: "searchtwo", for: indexPath) as! SearchTwoCollectionViewCell
 
                scoll.lb_text_x.text = searchobject?.keyword
                
//                            switch indexPath.row {
//                            case 3:
//                                scoll.backgroundColor = UIColor.gray
//                
//                                break
//                            case 5:
//                                scoll.backgroundColor = UIColor.darkGray
//                                break
//                
//                            case 7:
//                                scoll.backgroundColor = UIColor.darkText
//                                break
//                            default:
//                                
//                                scoll.backgroundColor = UIColor.yellow
//                                break
//                                
//                            }
                return scoll
            }else if searchobject?.type == TYPE_TWO{
                let scoll2 =  collectionView.dequeueReusableCell(withReuseIdentifier: "searchthree", for: indexPath)
                return scoll2

            }else{
                let scoll1 =  collectionView.dequeueReusableCell(withReuseIdentifier: "searchone", for: indexPath) as! SearchOneCollectionViewCell
                scoll1.lb_two.text = searchobject?.keyword
                return scoll1
            
            }
        }else{
            let noScoll =  collectionView.dequeueReusableCell(withReuseIdentifier: "nodata", for: indexPath)
            return noScoll
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if sear != nil{
            return   sear.content.count
        }
        
        return 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        let flow =  collectionViewLayout as! UICollectionViewFlowLayout
        let searchobject = sear?.content[indexPath.row]
        
            
          if searchobject?.type == TYPE_FOUR{
            let cgs = CGSize(width: self.coll.frame.size.width, height: 20)
            return cgs
         }
          else if searchobject?.type == TYPE_THREE{
            //collectionView.cellForItem(at: indexPath.row)
                        let itemwidth = (collectionView.bounds.width - CGFloat((items-1))*flow.minimumInteritemSpacing-flow.sectionInset.left-flow.sectionInset.right)/CGFloat(items)
            //            //水平间距
            //            //        flow.layoutAttributesForElements(in: <#T##CGRect#>)
            //            //        height =  flow.collectionViewContentSize.height
            //            let cgs = CGSize(width: itemwidth, height: 20)
            //            return cgs
            let cgs = CGSize(width: itemwidth, height: 40)
            
//            flow.sectionInset = UIEdgeInsets.init(top: 10, left: 10, bottom: 10, right: 10)
            return cgs
            
            
          }
          else if(searchobject?.type == TYPE_TWO){
            let cgs = CGSize(width: self.view.frame.size.width, height: 20)
            return cgs
            
            
          }
          else{
        
            let itemwidth = (collectionView.bounds.width - CGFloat((items-1))*flow.minimumInteritemSpacing-flow.sectionInset.left-flow.sectionInset.right)/CGFloat(items)
            //水平间距
            //        flow.layoutAttributesForElements(in: <#T##CGRect#>)
            //        height =  flow.collectionViewContentSize.height
            let cgs = CGSize(width: itemwidth, height: 80)
            return cgs

        }
    }

    
    func getError(_ error: ERROR_TYPE) {
        dismissLoading()
    }
    
    func getSearchData(_ str: Search) {
                
        
        self.sear = str
        
        self.coll.reloadData()
        
        
        dismissLoading()
    }
 
    
    override func viewDidLoad() {
        super.viewDidLoad()


        initData()
        

    }
    
    func initData()  {
        showLoading()
        search =  SearchPresenter()
        search?.handerJsonData()
        search?.setOnMoreProtocol(sea: self)
        
        coll.delegate = self
        coll.dataSource = self

    }
    
    func initViews()  {
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if self.sear.content[indexPath.row].type == TYPE_ONE {
            
            self.search?.prepare(row: indexPath.row)
            self.coll.reloadData()
            
        }
        
  
        
    }
    
    
}
