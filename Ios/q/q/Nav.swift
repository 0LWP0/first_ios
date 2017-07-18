//
//  Nav.swift
//  q
//
//  Created by qli on 2017/3/7.
//  Copyright © 2017年 qli. All rights reserved.
//

import UIKit

class Nav: UIView {


    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override init(frame: CGRect) {
        let crg = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: UIScreen.main.bounds.width, height: 50))
        super.init(frame: crg)
        
        
        
        initialFromXib()
        
        
        
        
        
    }

    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialFromXib()
    }
    
    fileprivate func initialFromXib() {
    print("dsfsdfsdf----->")
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "Nav", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        let crg = CGRect(origin: CGPoint(x: -20, y: 0), size: CGSize(width: UIScreen.main.bounds.width, height: 30))
        view.frame = crg
        addSubview(view)
    }

}
