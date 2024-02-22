//
//  ServiceViewController.swift
//  KSR_2024
//
//  Created by m2comm on 2024/01/08.
//

import Foundation
import UIKit

class ServiceViewController: UIViewController {
    
    var titleLabel: UILabel!
    
    var allAgree: UIButton!
    var allAgreeImage: UIImageView!
    var allAgreeTitle: UILabel!
    
    var detailView: UIView!
    
    var detailButton1: UIButton!
    var detailImage1: UIImageView!
    var detailTitle1: UILabel!
    
    var detailButton2: UIButton!
    var detailImage2: UIImageView!
    var detailTitle2: UILabel!
    
    var detailButton3: UIButton!
    var detailImage3: UIImageView!
    var detailTitle3: UILabel!
    
    var detailButton4: UIButton!
    var detailImage4: UIImageView!
    var detailTitle4: UILabel!
    
    var showBTN1: UIButton!
    var showBTN2: UIButton!
    var showBTN3: UIButton!
    var showBTN4: UIButton!
    
    
    var lefBTN: UIButton!
    var rightBTN: UIButton!
    var stackBTN: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "backGround")!)
        
        titleLabel = UILabel()
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        titleLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 65).isActive = true
        
        
        titleLabel.text = "서비스 이용약관 동의"
//        titleLabel.font = UIFont.systemFont(ofSize: 25)
        if IS_IPHONE_X {
            titleLabel.font = UIFont.boldSystemFont(ofSize: 22)
        } else {
            titleLabel.font = UIFont.boldSystemFont(ofSize: 27)
        }
        
        
        
        allAgree = UIButton(frame: CGRect(x: 20, y: titleLabel.frame.maxY + 150, width: self.view.frame.size.width - 40, height: 50))
        allAgree.layer.borderWidth = 1
        allAgree.layer.borderColor = UIColor(red: 0.364151001, green: 0.7723032236, blue: 0.9220735431, alpha: 1).cgColor
        allAgree.layer.cornerRadius = 8
        allAgree.backgroundColor = #colorLiteral(red: 0.9725801349, green: 0.9761196971, blue: 0.9930410981, alpha: 1)
        allAgree.addTarget(self, action: #selector(allCheck(_ :)), for: .touchUpInside)
        view.addSubview(allAgree)
        
        allAgreeImage = UIImageView(frame: CGRect(x: 20, y: allAgree.frame.size.height / 3.2, width: 15, height: 15))
//        allAgreeImage.image = UIImage(named: "check")
        allAgreeImage.layer.borderWidth = 1
        allAgree.addSubview(allAgreeImage)
        
        allAgreeTitle = UILabel(frame: CGRect(x: allAgree.frame.maxX - 110, y: allAgree.frame.size.height / 3.2, width: 70, height: 15))
        allAgreeTitle.text = "모두 동의"
        allAgreeTitle.font = UIFont.boldSystemFont(ofSize: 16)
        allAgreeTitle.backgroundColor = #colorLiteral(red: 0.9725801349, green: 0.9761196971, blue: 0.9930410981, alpha: 1)

        allAgree.addSubview(allAgreeTitle)
        
        detailView = UIView(frame: CGRect(x: 20, y: allAgree.frame.maxY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 1.6))
        detailView.layer.borderWidth = 0.3
        detailView.layer.borderColor = UIColor.lightGray.cgColor
        detailView.layer.cornerRadius = 12
        detailView.backgroundColor = #colorLiteral(red: 0.9725801349, green: 0.9761196971, blue: 0.9930410981, alpha: 1)
        self.view.addSubview(detailView)

        detailButton1 = UIButton(frame: CGRect(x: 0, y: 25, width: self.view.frame.size.width - 100, height: 30))
//        detailButton1.layer.borderWidth = 1
//        detailButton1.layer.cornerRadius = 8
//        detailButton1.backgroundColor = .white
        detailButton1.addTarget(self, action: #selector(detailImage1Check(_ :)), for: .touchUpInside)
        detailView.addSubview(detailButton1)

        detailImage1 = UIImageView(frame: CGRect(x: 20, y: detailButton1.frame.size.height / 3.6, width: 15, height: 15))
        detailImage1.layer.borderWidth = 1
        detailButton1.addSubview(detailImage1)

        detailTitle1 = UILabel(frame: CGRect(x: detailImage1.frame.maxX + 10, y: detailButton1.frame.size.height / 4.5, width: self.view.frame.size.width, height: 15))
        detailTitle1.text = "개인정보처리방침(필수)"
//        detailTitle1.font = UIFont.systemFont(ofSize: 18)
        detailTitle1.font = UIFont(name: "SUITE-Regular", size: 16)
        detailButton1.addSubview(detailTitle1)
        
        showBTN1 = UIButton(frame: CGRect(x: detailButton1.frame.maxX + 10, y: 25, width: 30, height: 30))
        showBTN1.setTitle("보기", for: .normal)
        showBTN1.setUnderline()
        showBTN1.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        showBTN1.setTitleColor(.black, for: .normal)
//        showBTN1.layer.borderWidth = 1
        detailView.addSubview(showBTN1)
        
        
        detailButton2 = UIButton(frame: CGRect(x: 0, y: detailButton1.frame.maxY + 10, width: self.view.frame.size.width - 100, height: 30))
//        detailButton1.layer.borderWidth = 1
//        detailButton1.layer.cornerRadius = 8
//        detailButton1.backgroundColor = .white
        detailButton2.addTarget(self, action: #selector(detailImage2Check(_ :)), for: .touchUpInside)
        detailView.addSubview(detailButton2)

        detailImage2 = UIImageView(frame: CGRect(x: 20, y: detailButton2.frame.size.height / 3.6, width: 15, height: 15))
        detailImage2.layer.borderWidth = 1
        detailButton2.addSubview(detailImage2)

        detailTitle2 = UILabel(frame: CGRect(x: detailImage2.frame.maxX + 10, y: detailButton2.frame.size.height / 4.5, width: self.view.frame.size.width, height: 15))
        detailTitle2.text = "개인정보 수집 및 이용 동의(필수)"
//        detailTitle2.font = UIFont.systemFont(ofSize: 18)
        detailTitle2.font = UIFont(name: "SUITE-Regular", size: 16)
        detailButton2.addSubview(detailTitle2)
        
        showBTN2 = UIButton(frame: CGRect(x: detailButton2.frame.maxX + 10, y: detailButton1.frame.maxY + 10, width: 30, height: 30))
        showBTN2.setTitle("보기", for: .normal)
        showBTN2.setUnderline()
        showBTN2.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        showBTN2.setTitleColor(.black, for: .normal)
//        showBTN2.layer.borderWidth = 1
        detailView.addSubview(showBTN2)
        
        detailButton3 = UIButton(frame: CGRect(x: 0, y: detailButton2.frame.maxY + 10, width: self.view.frame.size.width - 100, height: 30))
//        detailButton1.layer.borderWidth = 1
//        detailButton1.layer.cornerRadius = 8
//        detailButton1.backgroundColor = .white
        detailButton3.addTarget(self, action: #selector(detailImage3Check(_ :)), for: .touchUpInside)
        detailView.addSubview(detailButton3)

        detailImage3 = UIImageView(frame: CGRect(x: 20, y: detailButton3.frame.size.height / 3.6, width: 15, height: 15))
        detailImage3.layer.borderWidth = 1
        detailButton3.addSubview(detailImage3)

        detailTitle3 = UILabel(frame: CGRect(x: detailImage3.frame.maxX + 10, y: detailButton3.frame.size.height / 4.5, width: self.view.frame.size.width, height: 15))
        detailTitle3.text = "민감정보 수집 및 이용 동의(필수)"
//        detailTitle3.font = UIFont.systemFont(ofSize: 18)
        detailTitle3.font = UIFont(name: "SUITE-Regular", size: 16)
        detailButton3.addSubview(detailTitle3)
        
        showBTN3 = UIButton(frame: CGRect(x: detailButton3.frame.maxX + 10, y: detailButton2.frame.maxY + 10, width: 30, height: 30))
        showBTN3.setTitle("보기", for: .normal)
        showBTN3.setUnderline()
        showBTN3.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        showBTN3.setTitleColor(.black, for: .normal)
//        showBTN3.layer.borderWidth = 1
        detailView.addSubview(showBTN3)
        
        detailButton4 = UIButton(frame: CGRect(x: 0, y: detailButton3.frame.maxY + 10, width: self.view.frame.size.width - 100, height: 30))
//        detailButton1.layer.borderWidth = 1
//        detailButton1.layer.cornerRadius = 8
//        detailButton1.backgroundColor = .white
        detailButton4.addTarget(self, action: #selector(detailImage4Check(_ :)), for: .touchUpInside)
        detailView.addSubview(detailButton4)

        detailImage4 = UIImageView(frame: CGRect(x: 20, y: detailButton4.frame.size.height / 3.6, width: 15, height: 15))
        detailImage4.layer.borderWidth = 1
        detailButton4.addSubview(detailImage4)

        detailTitle4 = UILabel(frame: CGRect(x: detailImage4.frame.maxX + 10, y: detailButton4.frame.size.height / 4.5, width: self.view.frame.size.width, height: 15))
        detailTitle4.text = "연구 데이터 이용 동의(필수)"
//        detailTitle4.font = UIFont.systemFont(ofSize: 18)
        detailTitle4.font = UIFont(name: "SUITE-Regular", size: 16)
        detailButton4.addSubview(detailTitle4)
        
        showBTN4 = UIButton(frame: CGRect(x: detailButton4.frame.maxX + 10, y: detailButton3.frame.maxY + 10, width: 30, height: 30))
        showBTN4.setTitle("보기", for: .normal)
        showBTN4.setUnderline()
        showBTN4.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        showBTN4.setTitleColor(.black, for: .normal)
//        showBTN4.layer.borderWidth = 1
        detailView.addSubview(showBTN4)
        

        lefBTN = UIButton(frame: CGRect(x: 20, y: detailView.frame.maxY - 70, width: detailView.frame.size.width, height: self.view.frame.size.height / 10))
        lefBTN.layer.borderWidth = 0.3
        lefBTN.layer.borderColor = UIColor.lightGray.cgColor
        lefBTN.layer.cornerRadius = 12
        lefBTN.titleLabel?.textAlignment = .left
        lefBTN.backgroundColor = #colorLiteral(red: 0.4623160958, green: 0.4975028038, blue: 0.5189262629, alpha: 1)
        lefBTN.setTitleColor(.white, for: .normal)
        lefBTN.addTarget(self, action: #selector(callMethod(_ :)), for: .touchUpInside)
//        lefBTN.setTitle("비동의", for: .normal)
        self.view.addSubview(lefBTN)
        if IS_IPHONE_X {
            var diAgree = UILabel(frame: CGRect(x: lefBTN.frame.minX + 42, y: 22, width: 100, height: 30))
            diAgree.text = "비동의"
            diAgree.textColor = #colorLiteral(red: 0.7135565877, green: 0.7291088104, blue: 0.7419248819, alpha: 1)
            diAgree.font = UIFont.boldSystemFont(ofSize: 20)
            diAgree.textColor = .white
     
        lefBTN.addSubview(diAgree)
        } else if IS_IPHONE_12PRO_MAX {
            var diAgree = UILabel(frame: CGRect(x: lefBTN.frame.minX + 44, y: 27, width: 100, height: 30))
            diAgree.text = "비동의"
            diAgree.textColor = #colorLiteral(red: 0.7135565877, green: 0.7291088104, blue: 0.7419248819, alpha: 1)
            diAgree.font = UIFont.boldSystemFont(ofSize: 20)
            diAgree.textColor = .white
     
        lefBTN.addSubview(diAgree)
        } else {
            var diAgree = UILabel(frame: CGRect(x: lefBTN.frame.minX + 42, y: 22, width: 100, height: 30))
            diAgree.text = "비동의"
            diAgree.textColor = #colorLiteral(red: 0.7135565877, green: 0.7291088104, blue: 0.7419248819, alpha: 1)
            diAgree.font = UIFont.boldSystemFont(ofSize: 20)
            diAgree.textColor = .white
     
        lefBTN.addSubview(diAgree)
        }
            
        
        rightBTN = UIButton(frame: CGRect(x: lefBTN.frame.maxX - detailView.frame.size.width / 1.95, y: detailView.frame.maxY - 70, width: detailView.frame.size.width / 1.95, height: self.view.frame.size.height / 10))
        rightBTN.layer.borderWidth = 0.3
        rightBTN.layer.borderColor = UIColor.lightGray.cgColor
        rightBTN.layer.cornerRadius = 12
        rightBTN.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        rightBTN.backgroundColor = #colorLiteral(red: 0.08117371053, green: 0.7747272849, blue: 0.9753445983, alpha: 1)
        rightBTN.setTitleColor(.white, for: .normal)
        rightBTN.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        rightBTN.setTitle("동의", for: .normal)
        rightBTN.addTarget(self, action: #selector(test(_ :)), for: .touchUpInside)
//        rightBTN.isEnabled = false
        
//        if detailImage1.image == UIImage(named: "check") && detailImage2.image == UIImage(named: "check") && detailImage3.image == UIImage(named: "check") && detailImage4.image == UIImage(named: "check") {
//            allAgreeImage.image = UIImage(named: "check")
//            rightBTN.isEnabled = true
//        }

        
        self.view.addSubview(rightBTN)

    }
    
    @objc func allCheck(_ sender: UIButton) {
        if allAgreeImage.image != UIImage(named: "check") {
            allAgreeImage.image = UIImage(named: "check")
            
            detailImage1.image = UIImage(named: "check")
            detailImage2.image = UIImage(named: "check")
            detailImage3.image = UIImage(named: "check")
            detailImage4.image = UIImage(named: "check")
            
            rightBTN.isEnabled = true
        } else {
            allAgreeImage.image = UIImage(named: "")
            
            detailImage1.image = UIImage(named: "")
            detailImage2.image = UIImage(named: "")
            detailImage3.image = UIImage(named: "")
            detailImage4.image = UIImage(named: "")
            
//            rightBTN.isEnabled = false
        }
    }
    
    @objc func detailImage1Check(_ sender: UIButton) {
        if detailImage1.image != UIImage(named: "check") {
            
            detailImage1.image = UIImage(named: "check")
            
        } else {
            
            detailImage1.image = UIImage(named: "")
            allAgreeImage.image = UIImage(named: "")
//            rightBTN.isEnabled = false
        }
    }
    
    @objc func detailImage2Check(_ sender: UIButton) {
        if detailImage2.image != UIImage(named: "check") {
            
            detailImage2.image = UIImage(named: "check")
            
        } else {
            
            detailImage2.image = UIImage(named: "")
            allAgreeImage.image = UIImage(named: "")
//            rightBTN.isEnabled = false
        }
    }
    
    @objc func detailImage3Check(_ sender: UIButton) {
        if detailImage3.image != UIImage(named: "check") {
            
            detailImage3.image = UIImage(named: "check")
            
        } else {
            
            detailImage3.image = UIImage(named: "")
            allAgreeImage.image = UIImage(named: "")
//            rightBTN.isEnabled = false
        }
    }
    
    @objc func detailImage4Check(_ sender: UIButton) {
        if detailImage4.image != UIImage(named: "check") {
            
            detailImage4.image = UIImage(named: "check")
            
        } else {
            
            detailImage4.image = UIImage(named: "")
            allAgreeImage.image = UIImage(named: "")
//            rightBTN.isEnabled = false
        }
    }
    
    @objc func test(_ sender: UIButton) {
        
        let vc = SignUpViewController()

        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false)
    }
    
    @objc func callMethod(_ sender: UIButton) {
        self.dismiss(animated: false)
    }
    
    
}
