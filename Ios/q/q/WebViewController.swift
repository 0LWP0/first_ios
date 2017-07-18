//
//  WebViewController.swift
//  q
//
//  Created by qli on 2016/11/30.
//  Copyright © 2016年 qli. All rights reserved.
// http://www.cnblogs.com/iOS-mt/p/5519242.html
//

import UIKit
import WebKit

class WebViewController: UIViewController,WKUIDelegate,WKNavigationDelegate {
    
    var mload:Mainloading!
    
//    @IBAction func cBtn(_ sender: UIButton) {
//        URLCache.shared.removeAllCachedResponses()
//        URLCache.shared.diskCapacity = 0
//        URLCache.shared.memoryCapacity = 0
//        
//        if let cookies = HTTPCookieStorage.shared.cookies {
//            for cookie in cookies {
//                HTTPCookieStorage.shared.deleteCookie(cookie)
//            }
//        }
//    }
    
    var webView: WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        self.view = webView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        mload = Mainloading(ui: self.view)
        mload.show()
        
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
    let h5url = "http://120.132.112.16:8085/Reader-master/index.html?bookid=1&chapterid=1&scroll=10"
        let url = URLRequest(url: URL(string:h5url)!, cachePolicy: .useProtocolCachePolicy, timeoutInterval:  60.0)
        webView.scrollView.showsVerticalScrollIndicator = false
        webView.scrollView.showsHorizontalScrollIndicator = false
        
        webView.load(url)
//        webView.uiDelegate = self
        webView.navigationDelegate = self
        
//        mWebView.loadRequest(url)
//        mWebView.delegate = self
//        mWebView.stringByEvaluatingJavaScript(from: "test()")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //开始加载
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        
    }
    //加载完成
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
    }
    //加载失败
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        mload.dismiss()
    }
    //内容开始返回
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        mload.dismiss()
    }
    
//    func webViewDidStartLoad(_ webView: UIWebView) {
//        
//    }
//    func webViewDidFinishLoad(_ webView: UIWebView) {
//        mload.dismiss()
//    }
//    
//    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
//        mload.dismiss()
//    }
//    
//    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
//        
//        let url = request.url?.absoluteString
//        
//
//        
//        if(url?.hasPrefix("ios://"))!{
//            
////            let a = (url! as NSString).substring(from: 6)
////            
////            print("动作\(a)")
//            
//            mload.show()
//            
//            //根据动作编写相应的swift代码。
//            
//            return false
//            
//        }
//        
//        return true
//    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
