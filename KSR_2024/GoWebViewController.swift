//
//  GoWebViewController.swift
//  KSR_2024
//
//  Created by m2comm on 2024/01/31.
//

import Foundation
import UIKit

class GoWebViewController: UIViewController {
    
    var naviBar: UIView!
    var titleName: UILabel!
    
    
    var sideBTN: UIButton!
    
    var webView : WebView!
    var urlString = ""
    var naviBarButton: UIButton!
    var naviBarButtonImage: UIImageView!
    
    var sideMenuViewController = SideMenuViewController()
    private var dimmingView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        let statusBar = UIView(frame: CGRect(x: 0, y: 0, width: SCREEN.WIDTH, height: STATUS_BAR_HEIGHT))
        statusBar.backgroundColor = #colorLiteral(red: 0.9293832183, green: 0.944276154, blue: 0.9823971391, alpha: 1)
        
        
        self.view.addSubview(statusBar)
        
        naviBar = UIView(frame: CGRect(x: 0, y: statusBar.frame.maxY, width: SCREEN.WIDTH, height: 50))
        naviBar.backgroundColor = #colorLiteral(red: 0.9293832183, green: 0.944276154, blue: 0.9823971391, alpha: 1)
        self.view.addSubview(naviBar)
        
        titleName = UILabel(frame: CGRect(x: self.view.frame.size.width / 2.2, y: 0, width: 150, height: naviBar.frame.height))
//        titleName.text = titleLabel
        
        if titleLabel == UserDefaults.standard.string(forKey: "stroke") {
            titleName.text = titleLabel
        } else if titleLabel == UserDefaults.standard.string(forKey: "danger") {
            titleName.text = titleLabel
        } else if titleLabel == UserDefaults.standard.string(forKey: "hight") {
            titleName.text = titleLabel
        } else if titleLabel == UserDefaults.standard.string(forKey: "diabetes") {
            titleName.text = titleLabel
        }
        
        
        naviBar.addSubview(titleName)
        
        let button = UIButton(type: .custom)
        //Set the image
        button.setImage(UIImage(named: "back"), for: .normal)
        //Set the title
        button.setTitle("", for: .normal)
        button.tintColor = .black
        button.setTitleColor(.black, for: .normal)
        //Add target
        button.addTarget(self, action: #selector(callMethod), for: .touchUpInside)
        button.frame = CGRect(x: 20, y: 10, width: 10, height: 50)
        button.imageEdgeInsets = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        
        button.sizeToFit()
        
        naviBar.addSubview(button)
        
//        naviBarButton = UIButton(frame: CGRect(x: naviBar.frame.maxX - 55, y: naviBar.frame.size.height / 5, width: 25, height: 25))
//        naviBarButton.backgroundColor = #colorLiteral(red: 0.9332811236, green: 0.9482856393, blue: 0.9821911454, alpha: 1)
//        naviBarButtonImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
//        naviBarButtonImage.image = UIImage(named: "sideMenu")
//        naviBarButton.addTarget(self, action: #selector(presentSideMenu), for: .touchUpInside)
//        
//        naviBar.addSubview(naviBarButton)
//        naviBarButton.addSubview(naviBarButtonImage)
        
        naviBarButton = UIButton(frame: CGRect(x: naviBar.frame.maxX - 55, y: naviBar.frame.size.height / 5, width: 25, height: 25))
        naviBarButton.backgroundColor = #colorLiteral(red: 0.9293832183, green: 0.944276154, blue: 0.9823971391, alpha: 1)
        naviBarButtonImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
        naviBarButtonImage.image = UIImage(systemName: "line.3.horizontal")
        naviBarButton.addTarget(self, action: #selector(presentSideMenu), for: .touchUpInside)
        naviBarButton.tintColor = .black
        
        naviBar.addSubview(naviBarButton)
        naviBarButton.addSubview(naviBarButtonImage)
        
        
        
        webView = WebView(frame: CGRect(
            x: 0,
            y: naviBar.frame.maxY,
            width: self.view.frame.size.width,
            height: self.view.frame.size.height - naviBar.frame.size.height - statusBar.frame.size.height), urlString: self.urlString)
        webView.motherVC = self
        self.view.addSubview(webView)
        
        
    }
    @objc func callMethod(){
        let vc = MainViewController()

        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false)
    }
    @objc private func presentSideMenu(_ sender: UIButton!) {
            let sideMenuVC = sideMenuViewController
            
            // 사이드 메뉴 뷰 컨트롤러를 자식으로 추가하고 뷰 계층 구조에 추가.
            self.addChild(sideMenuVC)
            self.view.addSubview(sideMenuVC.view)
            
            // 사이드 메뉴의 너비를 화면 너비의 80%로 설정.
        // sideview 크기 설정
            let menuWidth = self.view.frame.width
        let menuHeight = self.view.frame.height - naviBar.frame.height
//            let yPos = (self.view.frame.height / 2) - (menuHeight / 2) // 중앙에 위치하도록 yPos 계산

        
            // 사이드 메뉴의 시작 위치를 화면 오른쪽 바깥으로 설정.
//        sideMenuVC.view.frame = CGRect(x: menuWidth, y: naviBar.frame.maxY, width: menuWidth, height: menuHeight)
        sideMenuVC.view.frame = CGRect(x: menuWidth, y: 0, width: menuWidth, height: menuHeight + 50)
            
            // 어두운 배경 뷰를 보이게 합니다.
            self.dimmingView?.isHidden = true
            self.dimmingView?.alpha = 0
            
        UIView.animate(withDuration: 0.3, animations: { [self] in
                // 사이드 메뉴를 화면에 표시.
//                sideMenuVC.view.frame = CGRect(x: 0, y: naviBar.frame.maxY, width: menuWidth, height: menuHeight)
            sideMenuVC.view.frame = CGRect(x: 0, y: 0, width: menuWidth, height: menuHeight + 50)
                // 어두운 배경 뷰의 투명도를 조절.
//                self.dimmingView?.alpha = 0.5
            
            
            
            })
        }
}
