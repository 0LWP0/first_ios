//
//  TitleDialogView.swift
//  q
//
//  Created by qli on 2016/12/10.
//  Copyright © 2016年 qli. All rights reserved.
//

import UIKit

class TitleDialogView: UIView {
    
    @IBOutlet weak var mLabel: UILabel!
    
    @IBOutlet var view: UIView!
    //防止连续点击
    var isAnimateIng = false
    
    var basec: UIView!
    
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
        let crg = CGRect(origin: CGPoint(x: 0, y: -50), size: CGSize(width: UIScreen.main.bounds.width, height: 64))
        super.init(frame: crg)
        
        
        
        initialFromXib()
        
    
        
        
        
    }
    
    //切记：一定要获取屏幕最上面的uiview,不然显示位置不正确
    convenience init(_ view: UIView) {
        
        
        
        self.init()
        
        
        self.basec = view
    }
    
    func showAnimate()  {
        
        if !isAnimateIng {
            isAnimateIng = !isAnimateIng
            show()
        }
        
        
    }
    //提示内容
    func showAnimate(_ text: String!)  {
        if !isAnimateIng {
            isAnimateIng = !isAnimateIng
            self.mLabel.text = text
            show()
        
        }
        
    }
    
    fileprivate func isFinish(){
    
    }
    
    fileprivate func show(){
        //隐藏系统的状态栏
//        UIApplication.shared.isStatusBarHidden = true
        self.basec.addSubview(self)
        UIView.animate(withDuration: 1 , delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 2, options: .curveEaseOut ,animations: { () -> Void in
            self.center.y += 50
        }) { (finished) -> Void in
            //延迟执行
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.0) {
                //移除动画
                self.updateTimer()
            }
            
            
        }

    
    }
    
    override func layoutSubviews() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialFromXib()
    }
    
    fileprivate func initialFromXib() {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "TitleDialogView", bundle: bundle)
        view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        view.frame = bounds
        addSubview(view)
    }
    
    
    
    
    fileprivate func updateTimer() {
    

        
        UIView.animate(withDuration: 0.5, animations: { () -> Void in
            
            self.center.y -= 50
        }){ (finished) -> Void in
            self.removeFromSuperview()
            self.isAnimateIng = !self.isAnimateIng
        }
        
    }
}
