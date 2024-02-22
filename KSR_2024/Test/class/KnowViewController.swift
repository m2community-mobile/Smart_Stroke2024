//
//  KnowViewController.swift
//  KSR
//
//  Created by m2comm on 2018. 7. 11..
//  Copyright © 2018년 m2community. All rights reserved.
//

import UIKit

class KnowViewController: UIViewController, TopBarDelegate {

    var urlString = ""
    var titleString = ""
    var webView : WebView!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let topBar = TopBar()
        topBar.titleLabel.text = titleString
        topBar.titleLabel.textAlignment = .left
        topBar.leftImageView.image = #imageLiteral(resourceName: "btn_b_back").withRenderingMode(.alwaysTemplate)
        topBar.leftImageView.tintColor = UIColor.white
        topBar.delegate = self
        topBar.rightImageView.image = #imageLiteral(resourceName: "btn_menu").withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
        topBar.rightImageView.tintColor = UIColor.white
        self.view.addSubview(topBar)
        
        self.webView = WebView(frame: CGRect(
            x: 0,
            y: topBar.frame.maxY,
            width: SCREEN.WIDTH,
            height: SCREEN.HEIGHT - topBar.frame.maxY), urlString: self.urlString)
        self.webView.goBackButton.isHidden = true
        self.webView.goForwardButton.isHidden = true
        self.view.addSubview(self.webView)
        
        
    }
    
    func reloading(){
        self.webView.reloading()
    }
    
    func rightButtonPressed(button: UIButton) {
//        appDel.rightView?.open(isManage: false)
        sceneDel!.rightView?.open(isManage: false)
    }
    
    func leftButtonPressed(button: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }

}
