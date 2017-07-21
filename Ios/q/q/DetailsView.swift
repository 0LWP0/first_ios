//
//  DetailsView.swift
//  q
//
//  Created by qli on 20/07/2017.
//  Copyright © 2017 qli. All rights reserved.
//

import UIKit

class DetailsView: UIView {
    @IBOutlet weak var lb_time: UILabel!

    @IBOutlet weak var lb_zj: UILabel!
    @IBOutlet weak var btn_ml: UIButton!
    @IBOutlet weak var de_lb_five: UILabel!
    @IBOutlet weak var de_image: UIImageView!
    @IBOutlet weak var de_lb_one: UILabel!
    @IBOutlet weak var de_lb_two: UILabel!
    @IBOutlet weak var de_lb_three: UILabel!
    @IBOutlet weak var de_lb_four: UILabel!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    @IBOutlet var mView: UIView!
    
//    @IBInspectable
//    var cornerRadius: CGFloat = 0 {
//        didSet {
//            layer.cornerRadius = cornerRadius
//            layer.masksToBounds = cornerRadius > 0
//        }
//    }
//    @IBInspectable
//    var borderWidth: CGFloat = 0 {
//        didSet {
//            layer.borderWidth = borderWidth
//        }
//    }
//    @IBInspectable
//    var borderColor: UIColor? {
//        didSet {
//            layer.borderColor = borderColor?.cgColor
//        }
//    }
//    
//    
    
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        
        
        initialFromXib()
        
        
        
        
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
                initialFromXib()
    }
    
    
    
    fileprivate func initialFromXib() {
        
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "DetailsView", bundle: bundle)
        mView = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        //
                let crg = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: UIScreen.main.bounds.width, height: 150))
                mView.frame = crg
        addSubview(mView)
        
        
    }
    


}
