//
//  Mainloading.swift
//  q
//
//  Created by qli on 2016/11/30.
//  Copyright © 2016年 qli. All rights reserved.
//

import UIKit

class Mainloading: UIView {

    
    //夫类view
    
    
    var sview:UIView!
    @IBOutlet var view: UIView!
    @IBOutlet weak var juhua: UIActivityIndicatorView!

    @IBOutlet weak var cview: UIView!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    @IBInspectable
    var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    @IBInspectable
    var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    @IBInspectable
    var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        


        initialFromXib()
        
       
        
        
        
        }
    
    
    convenience init(ui: UIView) {
        var y:CGFloat = 0
        //判断UI类型，uitableview 需要加载标题栏和状态栏的高度
        if ui is UITableView {
            y = -45
        }
        let fr = CGRect(origin: CGPoint(x: 0, y: y), size: CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        self.init(frame: fr)
        
        self.sview = ui

    }
    
    override func layoutSubviews() {
       
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialFromXib()
    }
    
   fileprivate func initialFromXib() {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "Mainloading", bundle: bundle)
        view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        view.frame = bounds
        addSubview(view)
        
        self.cview.layer.cornerRadius = 5
        self.cview.layer.masksToBounds = true

        
    }
    
    func show()  {
        if view != nil {
            
            if sview.subviews.contains(self) {
                self.isHidden = false
            }else{
                sview.addSubview(self)
            }
            
             juhua.startAnimating()
        }
    }
    
    func dismiss()  {
        juhua.stopAnimating()
        self.isHidden = true
    }

}
