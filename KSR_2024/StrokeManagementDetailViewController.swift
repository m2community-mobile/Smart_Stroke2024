//
//  StrokeManagementDetailViewController.swift
//  KSR_2024
//
//  Created by m2comm on 2024/02/22.
//

import Foundation
import UIKit
import Then




class StrokeManagementDetailViewController: UIViewController {
    
    var numImg: UIImageView!
    
    var naviBar : UIView!
//    var sideBTN: UIButton!
    var naviBarButton: UIButton!
    var naviBarButtonImage: UIImageView!
    
    private var sideMenuViewController = SideMenuViewController()
    //       private var dimmingView: UIView?
       
       private lazy var sideMenuButton = UIImageView().then {
           $0.image = UIImage(systemName: "text.justify")
           $0.tintColor = .black
           
           let tap = UITapGestureRecognizer(target: self, action: #selector(presentSideMenu))
           $0.addGestureRecognizer(tap)
           $0.isUserInteractionEnabled = true
       }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        let statusBar = UIView(frame: CGRect(x: 0, y: 0, width: SCREEN.WIDTH, height: STATUS_BAR_HEIGHT))
        statusBar.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        self.view.addSubview(statusBar)
        
        naviBar = UIView(frame: CGRect(x: 0, y: statusBar.frame.maxY, width: SCREEN.WIDTH, height: 50))
        naviBar.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.view.addSubview(naviBar)
        
        let smart = UILabel(frame: CGRect(x: self.view.frame.size.width / 2.8, y: 0, width: 140, height: naviBar.frame.height))
        
        naviBar.addSubview(smart)
        
        smart.text = "뇌졸중 관리수첩"
        //        smart.font = UIFont(name: NotoSansCJKkr_Medium, size: 2)
        
        smart.font = UIFont(name: "SUITE-Regular", size: 20)
        
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
        
        //        sideBTN = UIButton(frame: CGRect(x: self.view.frame.maxX - 75, y: 50, width: 100, height: 100))
        //
        //        sideBTN.setImage(UIImage(systemName: "line.3.horizontal"), for: .normal)
        //        sideBTN.addTarget(self, action: #selector(presentSideMenu(_ :)), for: .touchUpInside)
        //                naviBar.addSubview(sideBTN)
        
        naviBarButton = UIButton(frame: CGRect(x: naviBar.frame.maxX - 55, y: naviBar.frame.size.height / 5, width: 25, height: 25))
        naviBarButton.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        naviBarButtonImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
        naviBarButtonImage.image = UIImage(systemName: "line.3.horizontal")
        naviBarButton.addTarget(self, action: #selector(presentSideMenu), for: .touchUpInside)
        naviBarButton.tintColor = .black
        
        naviBar.addSubview(naviBarButton)
        naviBarButton.addSubview(naviBarButtonImage)
        
        
        numImg = UIImageView()
        self.view.addSubview(numImg)
        
        numImg.translatesAutoresizingMaskIntoConstraints = false
        
        if IS_IPHONE_X {
            numImg.topAnchor.constraint(equalTo: naviBar.bottomAnchor, constant: 50).isActive = true
            numImg.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 120).isActive = true
            numImg.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -120).isActive = true
            numImg.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -550).isActive = true
        } else if IS_IPHONE_N_PLUS {
            numImg.topAnchor.constraint(equalTo: naviBar.bottomAnchor, constant: 50).isActive = true
            numImg.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 140).isActive = true
            numImg.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -140).isActive = true
            numImg.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -510).isActive = true
        } else if IS_IPHONE_12PRO_MAX {
            numImg.topAnchor.constraint(equalTo: naviBar.bottomAnchor, constant: 50).isActive = true
            numImg.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 140).isActive = true
            numImg.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -140).isActive = true
            numImg.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -620).isActive = true
        }
        
        
        numImg.image = UIImage(named: "numImg")
        
        
        var joinLabel = UILabel()
        
        self.view.addSubview(joinLabel)
        
        joinLabel.translatesAutoresizingMaskIntoConstraints = false
        if IS_IPHONE_X {
            joinLabel.topAnchor.constraint(equalTo: numImg.bottomAnchor, constant: 10).isActive = true
            joinLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
            joinLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
            joinLabel.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -470).isActive = true
        } else if IS_IPHONE_N_PLUS {
            joinLabel.topAnchor.constraint(equalTo: numImg.bottomAnchor, constant: 10).isActive = true
            joinLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
            joinLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
            joinLabel.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -450).isActive = true
        } else if IS_IPHONE_12PRO_MAX {
            joinLabel.topAnchor.constraint(equalTo: numImg.bottomAnchor, constant: 10).isActive = true
            joinLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 60).isActive = true
            joinLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -60).isActive = true
            joinLabel.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -530).isActive = true
        }
        joinLabel.text = "병원에 내원중인 환자분께서는\nKSR 등록번호를 입력해주세요."
        if IS_IPHONE_12PRO_MAX {
            joinLabel.font = UIFont(name: "SUITE-Regular", size: 25)
        }
        if IS_IPHONE_X {
            joinLabel.font = UIFont(name: "SUITE-Regular", size: 20)
        }
        if IS_IPHONE_N_PLUS {
            joinLabel.font = UIFont(name: "SUITE-Regular", size: 20)
        }
        
//        joinLabel.font = UIFont(name: "SUITE-Regular", size: 30)
        joinLabel.numberOfLines = 0
        joinLabel.textAlignment = .center
        
        
        var numTF = UITextField()
        self.view.addSubview(numTF)
        
        numTF.translatesAutoresizingMaskIntoConstraints = false
        if IS_IPHONE_X {
            numTF.topAnchor.constraint(equalTo: joinLabel.bottomAnchor, constant: 10).isActive = true
            numTF.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 65).isActive = true
            numTF.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -65).isActive = true
            numTF.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -410).isActive = true
        } else if IS_IPHONE_N_PLUS {
            numTF.topAnchor.constraint(equalTo: joinLabel.bottomAnchor, constant: 20).isActive = true
            numTF.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 70).isActive = true
            numTF.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -70).isActive = true
            numTF.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -390).isActive = true
        } else if IS_IPHONE_12PRO_MAX {
            numTF.topAnchor.constraint(equalTo: joinLabel.bottomAnchor, constant: 20).isActive = true
            numTF.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 70).isActive = true
            numTF.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -70).isActive = true
            numTF.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -460).isActive = true
        }
        
//        numTF = UITextField(frame: CGRect(x: 30, y: joinLabel.frame.maxY + 15, width: self.view.frame.size.width - 60, height: 50))
        numTF.placeholder = ""
        numTF.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        numTF.leftViewMode = .always
        numTF.layer.borderWidth = 0.3
        numTF.layer.borderColor = UIColor.lightGray.cgColor
//        numTF.font = UIFont(name: "SUITE-Regular", size: 18)
        numTF.font = UIFont.boldSystemFont(ofSize: 16)
        numTF.layer.cornerRadius = 8
        numTF.backgroundColor = #colorLiteral(red: 0.9288039804, green: 0.9759015441, blue: 0.9974551797, alpha: 1)
        
        
        var saveBTN = UIButton()
        self.view.addSubview(saveBTN)
        
        saveBTN.translatesAutoresizingMaskIntoConstraints = false
        
        if IS_IPHONE_X {
            saveBTN.topAnchor.constraint(equalTo: numTF.bottomAnchor, constant: 5).isActive = true
            saveBTN.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 65).isActive = true
            saveBTN.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -65).isActive = true
            saveBTN.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -345).isActive = true
        } else if IS_IPHONE_N_PLUS {
            saveBTN.topAnchor.constraint(equalTo: numTF.bottomAnchor, constant: 5).isActive = true
            saveBTN.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 70).isActive = true
            saveBTN.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -70).isActive = true
            saveBTN.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -335).isActive = true
        } else if IS_IPHONE_12PRO_MAX {
            saveBTN.topAnchor.constraint(equalTo: numTF.bottomAnchor, constant: 5).isActive = true
            saveBTN.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 70).isActive = true
            saveBTN.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -70).isActive = true
            saveBTN.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -400).isActive = true
        }
        
        
        saveBTN.backgroundColor = #colorLiteral(red: 0, green: 0.593129456, blue: 0.8349065185, alpha: 1)
        saveBTN.setTitle("저장", for: .normal)
        saveBTN.setTitleColor(.white, for: .normal)
        saveBTN.layer.borderWidth = 0.3
        saveBTN.layer.borderColor = UIColor.lightGray.cgColor
//        numTF.font = UIFont(name: "SUITE-Regular", size: 18)
        saveBTN.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        saveBTN.addTarget(self, action: #selector(goBrain(_ :)), for: .touchUpInside)
        saveBTN.layer.cornerRadius = 8
        
        
        
    }
    
    
    @objc func goBrain(_ sender: UIButton) {
        
        let vc = StrokeManagementHandbookViewController()
        
                                            vc.modalPresentationStyle = .fullScreen
                                            self.present(vc, animated: false)
    }
    

    
    
    
    @objc func callMethod(){
        self.dismiss(animated: false)
        
    }
    
    @objc private func handleDimmingViewTap() {
            let sideMenuVC = self.sideMenuViewController
        
        sideMenuVC.modalPresentationStyle = .fullScreen
            
            UIView.animate(withDuration: 0.3, animations: {
                // 사이드 메뉴를 원래 위치로 되돌림.
                sideMenuVC.view.frame = CGRect(x: self.view.frame.width, y: 0, width: self.view.frame.width, height: self.view.frame.height)
                // 어두운 배경 뷰를 숨김.
//                self.dimmingView?.alpha = 0
            }) { (finished) in
                // 애니메이션이 완료된 후 사이드 메뉴를 뷰 계층 구조에서 제거.
                sideMenuVC.view.removeFromSuperview()
                sideMenuVC.removeFromParent()
//                self.dimmingView?.isHidden = true
            }
        }
    
    @objc private func presentSideMenu(_ sender: UIButton!) {
            let sideMenuVC = self.sideMenuViewController
            
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
        sideMenuVC.view.frame = CGRect(x: menuWidth, y: 0, width: menuWidth, height: menuHeight)
            
            // 어두운 배경 뷰를 보이게 합니다.
//            self.dimmingView?.isHidden = false
//            self.dimmingView?.alpha = 0
            
        UIView.animate(withDuration: 0.3, animations: { [self] in
                // 사이드 메뉴를 화면에 표시.
//                sideMenuVC.view.frame = CGRect(x: 0, y: naviBar.frame.maxY, width: menuWidth, height: menuHeight)
            sideMenuVC.view.frame = CGRect(x: 0, y: 0, width: menuWidth, height: menuHeight + 50)
                // 어두운 배경 뷰의 투명도를 조절.
//                self.dimmingView?.alpha = 0
            })
        }
    
    
}
