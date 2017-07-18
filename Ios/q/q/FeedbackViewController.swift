//
//  FeedbackViewController.swift
//  q
//
//  Created by qli on 2016/12/13.
//  Copyright © 2016年 qli. All rights reserved.
//

import UIKit

class FeedbackViewController: BaseViewController,UITextFieldDelegate,FeedbackProtocol,DialogProtocol {
    
    @IBAction func bar_feedback(_ sender: UIBarButtonItem) {
        
        dismiss(animated: true, completion: nil)
    }

    
    @IBOutlet weak var tf_opinion: UITextField!

    
    @IBOutlet weak var tf_phone: UITextField!
    var feedback: FeedbackPresenter!

    @IBAction func btn_commit(_ sender: UIButton) {
       
        let content = tf_opinion.text!
        
        if(!content.isEmpty){
            self.feedback  = FeedbackPresenter(ui: self.view);
            

            
            let url = UrlUtils.setFeedBackUrl(tf_phone.text!)

            self.feedback.setUrl(url)
            self.feedback.setParmeters(content)
            self.feedback.handerJosnData()
            self.feedback.setFeedbackDelegate(self)
        }else{
        
            self.showTopDialog("意见不能为空，谢谢")
        }

       
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       tf_opinion.delegate = self
       tf_phone.delegate = self

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        tf_opinion.resignFirstResponder()
        tf_phone.resignFirstResponder()
        return true
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        tf_opinion.resignFirstResponder()
        tf_phone.resignFirstResponder()
    }
    
    
    func onSuccess(_ header: HeaderObject) {
        
        self.present(AlertDialog.showDialog("",message: header.desc,bt1text: ""), animated: true, completion: nil)
        AlertDialog.setAlertDialogListener(self)
        
    }
    
    func onOk() {
         dismiss(animated: true, completion: nil)
    }
    
    func onCancel() {
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
