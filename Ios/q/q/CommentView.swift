//
//  CommentView.swift
//  q
//
//  Created by qli on 18/07/2017.
//  Copyright © 2017 qli. All rights reserved.
//

import UIKit

class CommentView: UIView {

    @IBOutlet weak var comment_title: UILabel!
    @IBOutlet weak var comment_info: UILabel!
    @IBOutlet weak var comment_name: UILabel!
    @IBOutlet weak var comment_image: UIImageView!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    @IBOutlet var mView: UIView!

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

    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
//        initialFromXib()
    }
    
    
    
    fileprivate func initialFromXib() {
        
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "CommentView", bundle: bundle)
        mView = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
//        
//        let crg = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: PhoneUtil.getMenuWidth(), height: UIScreen.main.bounds.height))
//        mView.frame = crg
        addSubview(mView)
        
        
    }


}
