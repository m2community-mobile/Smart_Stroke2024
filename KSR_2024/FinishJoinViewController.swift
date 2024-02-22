//
//  FinishJoinViewController.swift
//  KSR_2024
//
//  Created by m2comm on 2024/02/21.
//

import Foundation
import UIKit

class FinishJoinViewController: UIViewController {
    
    var finishImg: UIImageView!
    
    var naviBar : UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.view.backgroundColor = UIColor.white

        let statusBar = UIView(frame: CGRect(x: 0, y: 0, width: SCREEN.WIDTH, height: STATUS_BAR_HEIGHT))
        statusBar.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        self.view.addSubview(statusBar)
        
        naviBar = UIView(frame: CGRect(x: 0, y: statusBar.frame.maxY, width: SCREEN.WIDTH, height: 50))
        naviBar.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.view.addSubview(naviBar)
        

        
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
        
        
        finishImg = UIImageView()
        self.view.addSubview(finishImg)
        
        finishImg.translatesAutoresizingMaskIntoConstraints = false
        
//        finishImg.topAnchor.constraint(equalTo: naviBar.bottomAnchor, constant: 50).isActive = true
//        finishImg.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 120).isActive = true
//        finishImg.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -120).isActive = true
//        finishImg.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -550).isActive = true
        
        if IS_IPHONE_12PRO_MAX {
            finishImg.topAnchor.constraint(equalTo: naviBar.bottomAnchor, constant: 50).isActive = true
            finishImg.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 120).isActive = true
            finishImg.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -120).isActive = true
            finishImg.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -550).isActive = true
        }
        if IS_IPHONE_X {
            finishImg.topAnchor.constraint(equalTo: naviBar.bottomAnchor, constant: 50).isActive = true
            finishImg.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 120).isActive = true
            finishImg.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -120).isActive = true
            finishImg.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -550).isActive = true
        }
        if IS_IPHONE_N_PLUS {
            finishImg.topAnchor.constraint(equalTo: naviBar.bottomAnchor, constant: 50).isActive = true
            finishImg.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 120).isActive = true
            finishImg.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -120).isActive = true
            finishImg.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -550).isActive = true
        }
        
        
        
        
        
        
        finishImg.image = UIImage(named: "finishJoin")
        
        
        var joinLabel = UILabel()
        
        self.view.addSubview(joinLabel)
        
        joinLabel.translatesAutoresizingMaskIntoConstraints = false
        
        joinLabel.topAnchor.constraint(equalTo: finishImg.bottomAnchor, constant: 10).isActive = true
        joinLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 120).isActive = true
        joinLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -120).isActive = true
        joinLabel.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -500).isActive = true
        
        joinLabel.text = "회원가입 완료"
        if IS_IPHONE_12PRO_MAX {
            joinLabel.font = UIFont(name: "SUITE-Regular", size: 30)
        }
        if IS_IPHONE_X {
            joinLabel.font = UIFont(name: "SUITE-Regular", size: 24)
        }
        if IS_IPHONE_N_PLUS {
            joinLabel.font = UIFont(name: "SUITE-Regular", size: 30)
        }
        
//        joinLabel.font = UIFont(name: "SUITE-Regular", size: 30)
        joinLabel.textAlignment = .center

        
        var subJoinLabel = UILabel()
        
        self.view.addSubview(subJoinLabel)
        
        subJoinLabel.translatesAutoresizingMaskIntoConstraints = false
        
        subJoinLabel.topAnchor.constraint(equalTo: finishImg.bottomAnchor, constant: 20).isActive = true
        subJoinLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 70).isActive = true
        subJoinLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -70).isActive = true
        subJoinLabel.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -440).isActive = true
        
        subJoinLabel.text = "SMART STROKE 회원가입을 축하드립니다."
//        subJoinLabel.font = UIFont(name: "SUITE-Regular", size: 16)
        if IS_IPHONE_12PRO_MAX {
            subJoinLabel.font = UIFont(name: "SUITE-Regular", size: 16)
        }
        if IS_IPHONE_X {
            subJoinLabel.font = UIFont(name: "SUITE-Regular", size: 10)
        }
        if IS_IPHONE_N_PLUS {
            subJoinLabel.font = UIFont(name: "SUITE-Regular", size: 12)
        }
        
        subJoinLabel.textAlignment = .center
        
        var loginbutton = UIButton()
        self.view.addSubview(loginbutton)
        
        loginbutton.translatesAutoresizingMaskIntoConstraints = false
        
//        loginbutton.topAnchor.constraint(equalTo: subJoinLabel.bottomAnchor, constant: 230).isActive = true
//        loginbutton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
//        loginbutton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
//        loginbutton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -100).isActive = true
        
        if IS_IPHONE_12PRO_MAX {
            loginbutton.topAnchor.constraint(equalTo: subJoinLabel.bottomAnchor, constant: 270).isActive = true
            loginbutton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
            loginbutton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
            loginbutton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -100).isActive = true
        }
        if IS_IPHONE_X {
            loginbutton.topAnchor.constraint(equalTo: subJoinLabel.bottomAnchor, constant: 310).isActive = true
            loginbutton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
            loginbutton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
            loginbutton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -70).isActive = true
        }
        if IS_IPHONE_N_PLUS {
            loginbutton.topAnchor.constraint(equalTo: subJoinLabel.bottomAnchor, constant: 310).isActive = true
            loginbutton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
            loginbutton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
            loginbutton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -60).isActive = true
        }
        
        loginbutton.setTitle("로그인 하기", for: .normal)
        loginbutton.setTitleColor(.white, for: .normal)
        loginbutton.backgroundColor = #colorLiteral(red: 0.0465913713, green: 0.7300723791, blue: 0.9849980474, alpha: 1)
        loginbutton.layer.borderWidth = 0.3
        loginbutton.addTarget(self, action: #selector(goLogin(_ :)), for: .touchUpInside)
        loginbutton.layer.cornerRadius = 8
        
        
    }
    
    @objc func goLogin(_ sender: UIButton) {
        
        
        self.view.window?.rootViewController?.dismiss(animated: false, completion: {
          let homeVC = ViewController()
          homeVC.modalPresentationStyle = .fullScreen
          let appDelegate = UIApplication.shared.delegate as! AppDelegate
          appDelegate.window?.rootViewController?.present(homeVC, animated: true, completion: nil)
        })
        
        
        
        
//        navigationController?.popToRootViewController(animated: true)
//        let vc = ViewController()
//   //
//                                       vc.modalPresentationStyle = .fullScreen
//                                       self.present(vc, animated: false)
        

    }
    
    @objc func callMethod(_ sender: UIButton) {
        self.dismiss(animated: false)
    }
    
}
