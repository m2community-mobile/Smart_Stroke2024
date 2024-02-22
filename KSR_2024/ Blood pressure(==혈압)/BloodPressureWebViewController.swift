//
//  BloodPressureWebViewController.swift
//  KSR_2024
//
//  Created by m2comm on 2024/01/26.
//

import Foundation
import UIKit

class BloodPressureWebViewController: BaseViewController {
    
    var BloodPressureWebView : WebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttons = [button1, button2, button3]
        
        self.buttons.forEach {
            $0.addTarget(self, action: #selector(segButtonPressed(_ :)), for: .touchUpInside)
        }
        
     
        label1.text = "혈압관리\n도움말"
        label2.text = "혈압\n관리수첩"
        label3.text = "혈압\n기록보기"
        
        self.BloodPressureWebView = WebView(frame: CGRect(
            x: 0,
            y: menuView.frame.maxY,
            width: SCREEN.WIDTH,
            height: SCREEN.HEIGHT - menuView.frame.maxY), urlString: "https://korl.or.kr/workshop/2023fall/app/html/contents/welcome.html")
        
        self.view.addSubview(self.BloodPressureWebView)
        
    }
    @objc func segButtonPressed(_ sender: UIButton) {
print("tab")
        self.view.endEditing(true)
        
        if sender.tag == 0 {
            BloodPressureWebView.isHidden = false
            BloodPressureManagementNotebookView.isHidden = true
            bloodPressureListView.isHidden = true
        } else if sender.tag == 1 {
            BloodPressureWebView.isHidden = true
            BloodPressureManagementNotebookView.isHidden = false
            bloodPressureListView.isHidden = true
        } else if sender.tag == 2 {
            BloodPressureWebView.isHidden = true
            BloodPressureManagementNotebookView.isHidden = true
            bloodPressureListView.isHidden = false
        }
    }
}
