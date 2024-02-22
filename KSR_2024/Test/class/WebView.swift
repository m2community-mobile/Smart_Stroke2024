//
//  WebView.swift
//  KSR
//
//  Created by m2comm on 2018. 7. 11..
//  Copyright © 2018년 m2community. All rights reserved.
//

import UIKit
import WebKit


@objc protocol WebViewDelegate {
    
}

class WebView: UIView
,WKNavigationDelegate , WKUIDelegate
{

    var baseURLString = "ksrapp.m2comm.co.kr"
    
    var delegate : WebViewDelegate?
    var wkWebView : WKWebView!
    var urlString = ""
    
    var goBackButton : UIButton!
    var goForwardButton : UIButton!
    
    init(frame: CGRect, urlString : String) {
        super.init(frame: frame)
        
        print("WebView url:\(urlString)")
        self.backgroundColor = UIColor.white
        
        var webViewFrame = self.bounds
        webViewFrame.size.height -= SAFE_AREA
        self.wkWebView = WKWebView(frame: webViewFrame)
        self.wkWebView.uiDelegate = self
        self.wkWebView.navigationDelegate = self
        self.addSubview(self.wkWebView)
        
        self.urlString = urlString
        self.reloading()
        
        let buttonSize : CGFloat = 30
        
        self.goBackButton = UIButton(frame: CGRect(x: 10, y: webViewFrame.size.height - 10 - buttonSize, width: buttonSize, height: buttonSize))
        self.goBackButton.addTarget(event: .touchUpInside) { (button) in
            self.wkWebView.goBack()
        }

        self.goBackButton.setImage(#imageLiteral(resourceName: "goBack"), for: .normal)
        self.goBackButton.backgroundColor = UIColor(red: 0.86, green: 0.89, blue: 0.93, alpha: 0.9)
        self.addSubview(goBackButton)

        self.goForwardButton = UIButton(frame: CGRect(x: goBackButton.frame.maxX + 20, y: webViewFrame.size.height - 10 - buttonSize, width: buttonSize, height: buttonSize))
        self.goForwardButton.setImage(#imageLiteral(resourceName: "goForward"), for: .normal)
        self.goForwardButton.addTarget(event: .touchUpInside) { (button) in
            self.wkWebView.goForward()
        }
        self.goForwardButton.backgroundColor = UIColor(red: 0.86, green: 0.89, blue: 0.93, alpha: 0.9)
        self.addSubview(goForwardButton)
        
        
        
    }
    
    func reloading(){
        if let url = URL(string: self.urlString) {
            let request = URLRequest(url: url)
            self.wkWebView.load(request)
        }else{
            print("urlErro : \(urlString)")
            toastShow(message: "인터넷 연결을 확인하세요.")
        }
    }
    
    //MARK:WKUIDelegate
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Swift.Void){
    
        /*
         case linkActivated
         case formSubmitted
         case backForward
         case reload
         case formResubmitted
         case other
         */
        print("decidePolicyFor navigationAction")
        print("navigationAction.navigationType:\(navigationAction.navigationType.rawValue)")
        //0
        switch navigationAction.navigationType {
        case .linkActivated:
            if let urlString = navigationAction.request.url?.absoluteString {
                print("urlString:\(urlString)")
                if (urlString.range(of: baseURLString) != nil) {
                    if (urlString.range(of: "back.php") != nil) {
                        self.wkWebView.goBack()
                    }
                }else if (urlString.range(of: "back.php") != nil) {
                    if self.wkWebView.canGoBack {
                        self.wkWebView.goBack()
                        
                    }
                }
                //"http://ksrapp.m2comm.co.kr/bbs/view.php"
//                http://ksrapp.m2comm.co.kr/bbs/list.php
                
                if (urlString.range(of: "list.php") != nil) {
                    if let url = URL(string: "http://ksrapp.m2comm.co.kr/bbs/view.php") {
                        let request = URLRequest(url: url)
                        self.wkWebView.load(request)
                    }else{
                        print("urlErro : \(urlString)")
                    }
                }else if (urlString.range(of: "view.php") != nil) {
                    self.wkWebView.goBack()
                }
            }
            break

        default:
            break
        }
        
        decisionHandler(.allow)
    }

    
    
    
    func webViewDidClose(_ webView: WKWebView){
        print(#function)
    }
    
    func webViewWebContentProcessDidTerminate(_ webView: WKWebView){
        print(#function)
    }


    //MARK:WKNavigationDelegate
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!){
        print(#function)
    }
    
    func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!){
        print(#function)
    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error){
        print(#function)
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!){
        print(#function)
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!){
        print(#function)
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error){
        print(#function)
    }
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
