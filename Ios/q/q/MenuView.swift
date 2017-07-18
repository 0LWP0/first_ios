//
//  MenuView.swift
//  q
//
//  Created by qli on 2016/12/12.
//  Copyright © 2016年 qli. All rights reserved.
//

import UIKit

class MenuView: UIView {

    @IBOutlet var mView: UIView!
    //意见反馈
    @IBOutlet weak var mBtn_opinion: UIButton!
    //点击登录
    @IBOutlet weak var mBtn_login: UIButton!
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


    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        initialFromXib()
    }
    fileprivate func initialFromXib() {

        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "MenuView", bundle: bundle)
        mView = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
                
        let crg = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: PhoneUtil.getMenuWidth(), height: UIScreen.main.bounds.height))
        mView.frame = crg
        addSubview(mView)
        
        
    }

}
