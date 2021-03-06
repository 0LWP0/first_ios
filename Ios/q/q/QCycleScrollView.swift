//
//  QCycleScrollView.swift
//  q
//
//  Created by qli on 2016/11/8.
//  Copyright © 2016年 qli. All rights reserved.
// 轮播图
//

import UIKit


public protocol QCycleScrollViewDelegate{
    //click image at index
    func cycleScrollView(_ cycleScrollView: QCycleScrollView, didSelectAt index: Int, book: Book)
}

extension QCycleScrollViewDelegate {
    //click image at index
    func cycleScrollView(_ cycleScrollView: QCycleScrollView, didSelectAt index: Int, book: Book){
        
    }
}

open class QCycleScrollView: UIView, UICollectionViewDelegate, UICollectionViewDataSource {
    //无限轮播次数
    fileprivate let baseNum:Int = 100
    //定时滚动时间间隔
    open var scrollInterval:Double = 3
    open var autoScroll:Bool = true {
        didSet{
            timer?.invalidate()
            timer = nil
            if autoScroll {
                configTimer()
            }
        }
    }
    
    var books: [Book]!{
        didSet{
            if books != nil && !(books.isEmpty) {
                pageControl?.numberOfPages = (books?.count)!
                if(autoScroll){
                    configTimer()
                }else{
                    timer?.invalidate()
                    timer = nil
                }
            }
            collectionView?.reloadData()
        }
    }

    var collectionView:UICollectionView?
    open var pageControl:UIPageControl?
    
    var timer:Timer?
    open var delegate: QCycleScrollViewDelegate?
    
    //    public var titleColor:UIColor?
    //    public var titleFont:UIFont?
    //    public var titleBackgroundColor:UIColor?
    //    public var titleAlignment:NSTextAlignment?
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        configView()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configView()
    }
    //初始化view
    func configView() {
        
        self.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 200)
        
        let layout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumLineSpacing = 0
        layout.itemSize = bounds.size
        collectionView = UICollectionView(frame: bounds, collectionViewLayout: layout)
        collectionView?.backgroundColor = UIColor.clear
        collectionView?.showsHorizontalScrollIndicator = false
        collectionView?.isPagingEnabled = true
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.register(QCycleScrollCell.self, forCellWithReuseIdentifier: "QCycleScrollCell")
        addSubview(collectionView!)
        
        pageControl = UIPageControl(frame: CGRect(x: 0, y: (collectionView?.bounds.height)! - 20, width: bounds.width, height: 20))
        
        pageControl?.currentPageIndicatorTintColor = UIColor.white
        pageControl?.pageIndicatorTintColor = UIColor.gray
        //        pageControl!.backgroundColor = UIColor.black.withAlphaComponent(0.1)
        //        pageControl!.hidesForSinglePage = true
        addSubview(pageControl!)
        
    }
    
    func configTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: scrollInterval, repeats: true, block: { (timer:Timer) in
            DispatchQueue.main.async {
                var page:Int = Int(Float((self.collectionView?.contentOffset.x)! + 0.5*(self.collectionView?.frame.width)!) / Float((self.collectionView?.frame.width)!))
                page += 1
                if(page >= self.baseNum * (self.books?.count)!){
                    page = 0
                }
                self.collectionView?.scrollToItem(at: IndexPath(row: page, section: 0), at: .centeredHorizontally, animated: true)
            }
        })
    }
    //多少个item
    open func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = books?.count {
            return count * baseNum
        }
        return 0
    }
    
    
    //加载cell
    open func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:QCycleScrollCell! = collectionView.dequeueReusableCell(withReuseIdentifier: "QCycleScrollCell", for: indexPath) as! QCycleScrollCell
        
        if books != nil {
            
            
            let index:Int = indexPath.row % (self.books?.count)!
            if let _images = books {
                if index < _images.count {
                    BaseAlamofireImage.getImage((self.books?[index].imageUrl)!,uiimage: cell.imageView)
                    cell.imageView.tag = index
                }
            }
        }
        return cell
    }
    
    open func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if books != nil {
            let index = indexPath.row % (self.books?.count)!
            delegate?.cycleScrollView(self, didSelectAt: index,book: (self.books?[index])!)
        }
    }
    
    open func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == collectionView {
            
            if books != nil {
                var page:Int! = Int(Float(scrollView.contentOffset.x + 0.5*(collectionView?.bounds.width)!) / Float((collectionView?.bounds.width)!))
                page = page % (self.books?.count)!
                pageControl?.currentPage = page
            }
        }
        
    }
    
    open func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        if(autoScroll){
            timer?.invalidate()
            timer = nil
        }
    }
    
    open func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if(autoScroll){
            timer?.invalidate()
            timer = nil
            configTimer()
        }
    }
}
