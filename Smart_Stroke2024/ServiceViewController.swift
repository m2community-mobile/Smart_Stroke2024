//
//  ServiceViewController.swift
//  KSR_2024
//
//  Created by m2comm on 2024/01/08.
//

import Foundation
import UIKit

class GradientButton2: UIButton {
    
    let gradient = CAGradientLayer()
    
    init(colors: [CGColor]) {
        super.init(frame: .zero)
        
        gradient.frame = bounds
        gradient.colors = colors
        
//        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.0)
//        self.layer.insertSublayer(gradientLayer, at: 0)
        layer.addSublayer(gradient)
        
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradient.frame = bounds
    }
}

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
    
    var testRightBTN: UIButton!
    
    var stackBTN: [UIButton]!
    
    
    var btnArr = [UIButton]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "backGround")!)
        
        titleLabel = UILabel()
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: 250).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 110).isActive = true
        titleLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 65).isActive = true
        titleLabel.textAlignment = .center
        
        
        titleLabel.text = "서비스 이용약관 동의"
//        titleLabel.font = UIFont.systemFont(ofSize: 25)
        if IS_IPHONE_X {
            titleLabel.font = UIFont.boldSystemFont(ofSize: 22)
        } else if IS_IPHONE_N_PLUS {
            titleLabel.font = UIFont.boldSystemFont(ofSize: 23)
        } else if IS_IPHONE_12PRO_MAX {
            titleLabel.font = UIFont.boldSystemFont(ofSize: 25)
//            titleLabel.font = UIFont(name: "SUITE-Regular", size: 25)
//            titleLabel.font = UIFont(name: "SUITE-Heavy", size: 25)
        } else {
            titleLabel.font = UIFont.boldSystemFont(ofSize: 23)
        }
        
        
        
        allAgree = UIButton(frame: CGRect(x: 20, y: titleLabel.frame.maxY + 150, width: self.view.frame.size.width - 40, height: 75))
        allAgree.layer.borderWidth = 1
        allAgree.layer.borderColor = UIColor(red: 0.364151001, green: 0.7723032236, blue: 0.9220735431, alpha: 1).cgColor
        allAgree.layer.cornerRadius = 8
//        allAgree.backgroundColor = #colorLiteral(red: 0.9725801349, green: 0.9761196971, blue: 0.9930410981, alpha: 1)
        allAgree.backgroundColor = UIColor.white.withAlphaComponent(0.3)
        allAgree.addTarget(self, action: #selector(allCheck(_ :)), for: .touchUpInside)
        view.addSubview(allAgree)
        
        allAgreeImage = UIImageView(frame: CGRect(x: 20, y: allAgree.frame.size.height / 2.6, width: 18, height: 18))
//        allAgreeImage.image = UIImage(named: "check")
//        allAgreeImage.layer.borderWidth = 1
        allAgreeImage.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        allAgreeImage.layer.cornerRadius = 4
        allAgree.addSubview(allAgreeImage)
        
        allAgreeTitle = UILabel(frame: CGRect(x: allAgree.frame.maxX - 105, y: allAgree.frame.size.height / 2.6, width: 70, height: 15))
        allAgreeTitle.text = "모두 동의"
        allAgreeTitle.backgroundColor = .clear
        allAgreeTitle.textColor = #colorLiteral(red: 0.1002552137, green: 0.7176968455, blue: 0.9934977889, alpha: 1)
        allAgreeTitle.font = UIFont.boldSystemFont(ofSize: 16)
//        allAgreeTitle.backgroundColor = #colorLiteral(red: 0.9725801349, green: 0.9761196971, blue: 0.9930410981, alpha: 1)
//        allAgreeTitle.backgroundColor = UIColor.white.withAlphaComponent(0.3)

        allAgree.addSubview(allAgreeTitle)
        
        detailView = UIView(frame: CGRect(x: 20, y: allAgree.frame.maxY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 1.6))
//        detailView.layer.borderWidth = 0.3
        detailView.layer.borderColor = UIColor.lightGray.cgColor
        detailView.layer.cornerRadius = 12
//        detailView.backgroundColor = #colorLiteral(red: 0.9725801349, green: 0.9761196971, blue: 0.9930410981, alpha: 1)
        detailView.backgroundColor = UIColor.white.withAlphaComponent(0.3)
        self.view.addSubview(detailView)

        detailButton1 = UIButton(frame: CGRect(x: 0, y: 25, width: self.view.frame.size.width - 100, height: 30))
//        detailButton1.layer.borderWidth = 1
//        detailButton1.layer.cornerRadius = 8
//        detailButton1.backgroundColor = .white
        detailButton1.tag = 0
        detailButton1.addTarget(self, action: #selector(detailImage1Check(_ :)), for: .touchUpInside)
        detailView.addSubview(detailButton1)

        detailImage1 = UIImageView(frame: CGRect(x: 20, y: detailButton1.frame.size.height / 5.1, width: 18, height: 18))
//        detailImage1.layer.borderWidth = 1
        detailImage1.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        detailImage1.layer.cornerRadius = 4
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
        showBTN1.addTarget(self, action: #selector(goShow(_ :)), for: .touchUpInside)
//        showBTN1.layer.borderWidth = 1
        detailView.addSubview(showBTN1)
        
        
        detailButton2 = UIButton(frame: CGRect(x: 0, y: detailButton1.frame.maxY + 10, width: self.view.frame.size.width - 100, height: 30))
//        detailButton1.layer.borderWidth = 1
//        detailButton1.layer.cornerRadius = 8
//        detailButton1.backgroundColor = .white
        detailButton2.tag = 1
        detailButton2.addTarget(self, action: #selector(detailImage2Check(_ :)), for: .touchUpInside)
        detailView.addSubview(detailButton2)

        detailImage2 = UIImageView(frame: CGRect(x: 20, y: detailButton2.frame.size.height / 5.1, width: 18, height: 18))
//        detailImage2.layer.borderWidth = 1
        detailImage2.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        detailImage2.layer.cornerRadius = 4
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
        showBTN2.addTarget(self, action: #selector(goShow(_ :)), for: .touchUpInside)
        detailView.addSubview(showBTN2)
        
        detailButton3 = UIButton(frame: CGRect(x: 0, y: detailButton2.frame.maxY + 10, width: self.view.frame.size.width - 100, height: 30))
//        detailButton1.layer.borderWidth = 1
        detailButton3.tag = 2
//        detailButton1.layer.cornerRadius = 8
//        detailButton1.backgroundColor = .white
        detailButton3.addTarget(self, action: #selector(detailImage3Check(_ :)), for: .touchUpInside)
        detailView.addSubview(detailButton3)

        detailImage3 = UIImageView(frame: CGRect(x: 20, y: detailButton3.frame.size.height / 5.1, width: 18, height: 18))
//        detailImage3.layer.borderWidth = 1
        detailImage3.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        detailImage3.layer.cornerRadius = 4
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
        showBTN3.addTarget(self, action: #selector(goShow(_ :)), for: .touchUpInside)
//        showBTN3.layer.borderWidth = 1
        detailView.addSubview(showBTN3)
        
        detailButton4 = UIButton(frame: CGRect(x: 0, y: detailButton3.frame.maxY + 10, width: self.view.frame.size.width - 100, height: 30))
//        detailButton1.layer.borderWidth = 1
//        detailButton1.layer.cornerRadius = 8
        detailButton4.tag = 3
//        detailButton1.backgroundColor = .white
        detailButton4.addTarget(self, action: #selector(detailImage4Check(_ :)), for: .touchUpInside)
        detailView.addSubview(detailButton4)

        detailImage4 = UIImageView(frame: CGRect(x: 20, y: detailButton4.frame.size.height / 5.1, width: 18, height: 18))
//        detailImage4.layer.borderWidth = 1
        detailImage4.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        detailImage4.layer.cornerRadius = 4
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
        showBTN4.addTarget(self, action: #selector(goShow(_ :)), for: .touchUpInside)
//        showBTN4.layer.borderWidth = 1
        detailView.addSubview(showBTN4)
        

       
        
        
        lefBTN = UIButton(frame: CGRect(x: 20, y: detailView.frame.maxY - 70, width: detailView.frame.size.width / 1.7,  height: self.view.frame.size.height / 10))
        
        
        
        
//        lefBTN.layer.borderWidth = 0.3
        lefBTN.layer.borderColor = UIColor.lightGray.cgColor
        lefBTN.layer.cornerRadius = 12
        lefBTN.titleLabel?.textAlignment = .left
        lefBTN.backgroundColor = #colorLiteral(red: 0.4623160958, green: 0.4975028038, blue: 0.5189262629, alpha: 1)
        lefBTN.setGradientLayer(colorsInOrder: [#colorLiteral(red: 0.513809979, green: 0.5492550135, blue: 0.576464355, alpha: 1), #colorLiteral(red: 0.3439027071, green: 0.3745225966, blue: 0.3874316514, alpha: 1)])
        
        lefBTN.setTitleColor(.white, for: .normal)
        lefBTN.addTarget(self, action: #selector(callMethod(_ :)), for: .touchUpInside)
//        lefBTN.setTitle("비동의", for: .normal)
        self.view.addSubview(lefBTN)
        if IS_IPHONE_X {
            
            var diAgree = UILabel(frame: CGRect(x: lefBTN.frame.minX + 42, y: 22, width: 100, height: 30))
            
            diAgree.text = "비동의"
            diAgree.textColor = #colorLiteral(red: 0.7255110741, green: 0.7421184182, blue: 0.7531808615, alpha: 1)
            diAgree.font = UIFont.boldSystemFont(ofSize: 20)
//            diAgree.textColor = .white
     
        lefBTN.addSubview(diAgree)
        } else if IS_IPHONE_12PRO_MAX {
            var diAgree = UILabel(frame: CGRect(x: lefBTN.frame.minX + 46, y: 30, width: 100, height: 30))
            diAgree.text = "비동의"
            diAgree.textColor = #colorLiteral(red: 0.7135565877, green: 0.7291088104, blue: 0.7419248819, alpha: 1)
            diAgree.font = UIFont.boldSystemFont(ofSize: 20)
//            diAgree.textColor = .white
     
        lefBTN.addSubview(diAgree)
        } else if IS_IPHONE_15PRO_MAX {
            var diAgree = UILabel(frame: CGRect(x: lefBTN.frame.minX + 46, y: 30, width: 100, height: 30))
            diAgree.text = "비동의"
            diAgree.textColor = #colorLiteral(red: 0.7135565877, green: 0.7291088104, blue: 0.7419248819, alpha: 1)
            diAgree.font = UIFont.boldSystemFont(ofSize: 20)
//            diAgree.textColor = .white
     
        lefBTN.addSubview(diAgree)
        } else if IS_IPHONE_12PRO {
            var diAgree = UILabel(frame: CGRect(x: lefBTN.frame.minX + 38, y: 27, width: 100, height: 30))
            diAgree.text = "비동의"
            diAgree.textColor = #colorLiteral(red: 0.7135565877, green: 0.7291088104, blue: 0.7419248819, alpha: 1)
            diAgree.font = UIFont.boldSystemFont(ofSize: 20)
//            diAgree.textColor = .white
     
        lefBTN.addSubview(diAgree)
        } else if IS_IPHONE_15PRO {
            var diAgree = UILabel(frame: CGRect(x: lefBTN.frame.minX + 38, y: 27, width: 100, height: 30))
            diAgree.text = "비동의"
            diAgree.textColor = #colorLiteral(red: 0.7135565877, green: 0.7291088104, blue: 0.7419248819, alpha: 1)
            diAgree.font = UIFont.boldSystemFont(ofSize: 20)
//            diAgree.textColor = .white
     
        lefBTN.addSubview(diAgree)
        } else if IS_IPHONE_N {
            var diAgree = UILabel(frame: CGRect(x: lefBTN.frame.minX + 30, y: 19, width: 100, height: 30))
            diAgree.text = "비동의"
            diAgree.textColor = #colorLiteral(red: 0.7135565877, green: 0.7291088104, blue: 0.7419248819, alpha: 1)
            diAgree.font = UIFont.boldSystemFont(ofSize: 20)
//            diAgree.textColor = .white
     
        lefBTN.addSubview(diAgree)
        } else if IS_IPHONE_N_PLUS {
            var diAgree = UILabel(frame: CGRect(x: lefBTN.frame.minX + 45, y: 22, width: 100, height: 30))
            diAgree.text = "비동의"
            diAgree.textColor = #colorLiteral(red: 0.7135565877, green: 0.7291088104, blue: 0.7419248819, alpha: 1)
            diAgree.font = UIFont.boldSystemFont(ofSize: 20)
//            diAgree.textColor = .white
     
        lefBTN.addSubview(diAgree)
        } else {
            var diAgree = UILabel(frame: CGRect(x: lefBTN.frame.minX + 45, y: 22, width: 100, height: 30))
            diAgree.text = "비동의"
            diAgree.textColor = #colorLiteral(red: 0.7135565877, green: 0.7291088104, blue: 0.7419248819, alpha: 1)
            diAgree.font = UIFont.boldSystemFont(ofSize: 20)
//            diAgree.textColor = .white
     
        lefBTN.addSubview(diAgree)
        }
            
        
        rightBTN = UIButton(frame: CGRect(x: lefBTN.frame.maxX - 40, y: detailView.frame.maxY - 70, width: (SCREEN.WIDTH - 40) - (SCREEN.WIDTH / 1.7) + 64, height: self.view.frame.size.height / 10))
//        rightBTN.layer.borderWidth = 0.3
        rightBTN.layer.borderColor = UIColor.lightGray.cgColor
        rightBTN.layer.cornerRadius = 12
        rightBTN.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        rightBTN.backgroundColor = #colorLiteral(red: 0.08117371053, green: 0.7747272849, blue: 0.9753445983, alpha: 1)
        rightBTN.setGradientLayer(colorsInOrder: [#colorLiteral(red: 0.2023896873, green: 0.6984216571, blue: 0.9985650182, alpha: 1), #colorLiteral(red: 0.2933418751, green: 0.822891593, blue: 0.9468464255, alpha: 1)])
        rightBTN.setTitleColor(.white, for: .normal)
        rightBTN.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        rightBTN.setTitle("동의", for: .normal)
        rightBTN.addTarget(self, action: #selector(test(_ :)), for: .touchUpInside)
//        rightBTN.isEnabled = false
                self.view.addSubview(rightBTN)
        
        
        
        testRightBTN = UIButton(frame: CGRect(x: lefBTN.frame.maxX - 40, y: detailView.frame.maxY - 70, width: (SCREEN.WIDTH - 40) - (SCREEN.WIDTH / 1.7) + 64, height: self.view.frame.size.height / 10))
//        rightBTN.layer.borderWidth = 0.3
        testRightBTN.layer.borderColor = UIColor.lightGray.cgColor
        testRightBTN.layer.cornerRadius = 12
        testRightBTN.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        testRightBTN.backgroundColor = #colorLiteral(red: 0.08117371053, green: 0.7747272849, blue: 0.9753445983, alpha: 1)
        testRightBTN.setTitleColor(.white, for: .normal)
        testRightBTN.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        testRightBTN.setTitle("동의", for: .normal)
        testRightBTN.addTarget(self, action: #selector(test2(_ :)), for: .touchUpInside)
//        rightBTN.isEnabled = false
                self.view.addSubview(testRightBTN)
    
     
        
        
        
        
        rightBTN.isEnabled = false
        
        
        
        
//        if detailImage1.image == UIImage(named: "check") && detailImage2.image == UIImage(named: "check") && detailImage3.image == UIImage(named: "check") && detailImage4.image == UIImage(named: "check") {
//            allAgreeImage.image = UIImage(named: "check")
//            rightBTN.isEnabled = true
//        } else {
//            rightBTN.isEnabled = false
//        }
//
//        


    }
    
    
 
    @objc func goShow(_ sender: UIButton) {
        let vc = ShowViewController()

        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false)
    }
    
    
    
    @objc func allCheck(_ sender: UIButton) {
        if allAgreeImage.image != UIImage(named: "check1") {
            allAgreeImage.image = UIImage(named: "check1")
            
            detailImage1.image = UIImage(named: "check1")
            detailImage2.image = UIImage(named: "check1")
            detailImage3.image = UIImage(named: "check1")
            detailImage4.image = UIImage(named: "check1")
            
            testRightBTN.isHidden = true
            
            rightBTN.isEnabled = true
        } else {
            allAgreeImage.image = UIImage(named: "")
            
            detailImage1.image = UIImage(named: "")
            detailImage2.image = UIImage(named: "")
            detailImage3.image = UIImage(named: "")
            detailImage4.image = UIImage(named: "")
            
            rightBTN.isEnabled = false
            
            testRightBTN.isHidden = false
        }
    }
    
    @objc func detailImage1Check(_ sender: UIButton) {
        if detailImage1.image != UIImage(named: "check1") {
            
            detailImage1.image = UIImage(named: "check1")
            
            if detailImage1.image == UIImage(named: "check1") && detailImage2.image == UIImage(named: "check1") && detailImage3.image == UIImage(named: "check1") && detailImage4.image == UIImage(named: "check1") {
                allAgreeImage.image = UIImage(named: "check1")
                rightBTN.isEnabled = true
                testRightBTN.isHidden = true
            } else {
                rightBTN.isEnabled = false
            }
            
        } else {
            
            detailImage1.image = UIImage(named: "")
            allAgreeImage.image = UIImage(named: "")
            rightBTN.isEnabled = false
            testRightBTN.isHidden = false
        }
    }
    
    @objc func detailImage2Check(_ sender: UIButton) {
        if detailImage2.image != UIImage(named: "check1") {
            
            detailImage2.image = UIImage(named: "check1")
            
            if detailImage1.image == UIImage(named: "check1") && detailImage2.image == UIImage(named: "check1") && detailImage3.image == UIImage(named: "check1") && detailImage4.image == UIImage(named: "check1") {
                allAgreeImage.image = UIImage(named: "check1")
                rightBTN.isEnabled = true
                testRightBTN.isHidden = true
            } else {
                rightBTN.isEnabled = false
            }
            
        } else {
            
            detailImage2.image = UIImage(named: "")
            allAgreeImage.image = UIImage(named: "")
            rightBTN.isEnabled = false
            testRightBTN.isHidden = false
        }
    }
    
    @objc func detailImage3Check(_ sender: UIButton) {
        if detailImage3.image != UIImage(named: "check1") {
            
            detailImage3.image = UIImage(named: "check1")
            
            
            if detailImage1.image == UIImage(named: "check1") && detailImage2.image == UIImage(named: "check1") && detailImage3.image == UIImage(named: "check1") && detailImage4.image == UIImage(named: "check1") {
                allAgreeImage.image = UIImage(named: "check1")
                rightBTN.isEnabled = true
                testRightBTN.isHidden = true
            } else {
                rightBTN.isEnabled = false
            }
        } else {
            
            detailImage3.image = UIImage(named: "")
            allAgreeImage.image = UIImage(named: "")
            rightBTN.isEnabled = false
            testRightBTN.isHidden = false
        }
    }
    
    @objc func detailImage4Check(_ sender: UIButton) {
        if detailImage4.image != UIImage(named: "check1") {
            
            detailImage4.image = UIImage(named: "check1")
            
            
            if detailImage1.image == UIImage(named: "check1") && detailImage2.image == UIImage(named: "check1") && detailImage3.image == UIImage(named: "check1") && detailImage4.image == UIImage(named: "check1") {
                allAgreeImage.image = UIImage(named: "check1")
                rightBTN.isEnabled = true
                testRightBTN.isHidden = true
            } else {
                rightBTN.isEnabled = false
            }
        } else {
            
            detailImage4.image = UIImage(named: "")
            allAgreeImage.image = UIImage(named: "")
            rightBTN.isEnabled = false
            testRightBTN.isHidden = false
        }
    }
    
    @objc func test(_ sender: UIButton) {
        
        
        
        
        
        let vc = SignUpViewController()

        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false)
    }
    
    @objc func test2(_ sender: UIButton) {
        
    print("tab")
        
        if detailImage1.image != UIImage(named: "check") {
            showToast(message: "모든 약관에 동의해주세요.", font: UIFont(name: "SUITE-Regular", size: 20)!)
        }
        if detailImage2.image != UIImage(named: "check") {
            showToast(message: "모든 약관에 동의해주세요.", font: UIFont(name: "SUITE-Regular", size: 20)!)
        }
        if detailImage3.image != UIImage(named: "check") {
            showToast(message: "모든 약관에 동의해주세요.", font: UIFont(name: "SUITE-Regular", size: 20)!)
        }
        if detailImage4.image != UIImage(named: "check") {
            showToast(message: "모든 약관에 동의해주세요.", font: UIFont(name: "SUITE-Regular", size: 20)!)
        }
        
    }
    
    @objc func callMethod(_ sender: UIButton) {
        self.dismiss(animated: false)
    }
    

    
    func showToast(message : String, font: UIFont) {
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width / 3.8, y: self.view.frame.size.height / 1.5 , width: 250, height: 35))
            toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
            toastLabel.textColor = UIColor.white
            toastLabel.font = font
            toastLabel.textAlignment = .center
            toastLabel.text = message
            toastLabel.alpha = 1.0
            toastLabel.layer.cornerRadius = 10;
            toastLabel.clipsToBounds  =  true
            self.view.addSubview(toastLabel)
            UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
                 toastLabel.alpha = 0.0
            }, completion: {(isCompleted) in
                toastLabel.removeFromSuperview()
            })
        }
    
}
