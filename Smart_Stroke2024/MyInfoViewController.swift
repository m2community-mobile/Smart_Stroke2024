//
//  MyInfoViewController.swift
//  KSR_2024
//
//  Created by m2comm on 2024/01/30.
//

import Foundation
import UIKit
import Alamofire




//struct MyInfo: Codable {
//    var result: Int
//    var data: MyInfoDetail
//    var message: String
//}
//
//struct MyInfoDetail: Codable {
//    
//    var birth: String
//    var email1: String
//    var email2: String
//    var hospital: String
//    var reg_num: String?
//    var sex: String
//    var user_id: String
//    var user_sid: String
//    
//    enum CodingKeys: String, CodingKey{
//            case birth = "birth"
//            case email1 = "email1"
//            case email2 = "email2"
//            case hospital = "hospital"
//            case reg_num = "reg_num"
//            case sex = "sex"
//            case user_id = "user_id"
//        case user_sid = "user_sid"
//        }
//    
//    
//    
//    
//}







class MyInfoViewController :UIViewController {
    
    var myEmail = [MyInfoDetail]()
    
    

    
    var naviBar : UIView!
    
    let labelOne: UILabel = {
      let label = UILabel()
      label.text = "Scroll Top"
      label.backgroundColor = .red
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()

    let labelTwo: UILabel = {
      let label = UILabel()
      label.text = ""
      label.backgroundColor = .red
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()

    let scrollView: UIScrollView = {
      let scrollView = UIScrollView()
      scrollView.backgroundColor = .white
      scrollView.translatesAutoresizingMaskIntoConstraints = false
      return scrollView
    }()
    

    var answerId: UILabel!
    var answerNmae: UILabel!
    var answermail1: UITextField!
    var answermail2: UITextField!
    var answerHospital: UITextField!
    var answerBitrh: UITextField!
    var answerManBTN: UIButton!
    var answerWomanBTN: UIButton!
    var womanBTN: UIButton!
    var menBTN: UIButton!
    var arrBTN: [UIButton]!
    var answerKSR: UITextField!
    
    var saveBTN: UIButton!
    var myId: String = ""
    
    let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideKeyboardWhenTappedAround()
        
        
        
//        get()
        
        
        
        
        self.view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        scrollView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.view.backgroundColor = UIColor.white
        
        let statusBar = UIView(frame: CGRect(x: 0, y: 0, width: SCREEN.WIDTH, height: STATUS_BAR_HEIGHT))
        statusBar.backgroundColor = #colorLiteral(red: 0.1040975526, green: 0.1902649999, blue: 0.3965058923, alpha: 1)
        
        self.view.addSubview(statusBar)
        
        naviBar = UIView(frame: CGRect(x: 0, y: statusBar.frame.maxY, width: SCREEN.WIDTH, height: 50))
        naviBar.backgroundColor = #colorLiteral(red: 0.1040975526, green: 0.1902649999, blue: 0.3965058923, alpha: 1)
        self.view.addSubview(naviBar)
        
        let smart = UILabel(frame: CGRect(x: self.view.frame.size.width / 2.8, y: 0, width: self.view.frame.width - 20, height: naviBar.frame.height))
        
        naviBar.addSubview(smart)
        
        naviBar.layer.addBorder([.bottom], color: .lightGray, width: 0.3)
        
        smart.text = "회원정보 수정"
        smart.textColor = .white
        //        smart.font = UIFont(name: NotoSansCJKkr_Medium, size: 2)
        smart.font = UIFont.systemFont(ofSize: 22)
        
        self.view.addSubview(scrollView)
        
        
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: naviBar.frame.maxY).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        //          scrollView.addSubview(labelOne)
        
        //          labelOne.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 40).isActive = true
        //          labelOne.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 40).isActive = true
        
        scrollView.addSubview(labelTwo)
        labelTwo.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 40).isActive = true
        labelTwo.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 3000).isActive = true
        labelTwo.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -40).isActive = true
        
        let button = UIButton(type: .custom)
        //Set the image
        button.setImage(UIImage(named: "back"), for: .normal)
        //Set the title
        button.setTitle("", for: .normal)
        button.tintColor = .black
        let origImage = UIImage(named: "back")
        let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
        button.setImage(tintedImage, for: .normal)
        button.tintColor = .white
        button.setTitleColor(.black, for: .normal)
        //Add target
        button.addTarget(self, action: #selector(callMethod), for: .touchUpInside)
        button.frame = CGRect(x: 20, y: 10, width: 10, height: 50)
        button.imageEdgeInsets = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        
        button.sizeToFit()
        
        naviBar.addSubview(button)
        
        var idLabel = UILabel(frame: CGRect(x: 20, y: scrollView.frame.maxY + 20, width: self.view.frame.size.width / 6, height: self.view.frame.size.height / 16))
        idLabel.text = "아이디"
        
        
//        idLabel.layer.borderWidth = 1
//        idLabel.font = UIFont.systemFont(ofSize: 20)
        idLabel.font = UIFont(name: "SUITE-Regular", size: 20)
        scrollView.addSubview(idLabel)
        
        answerId = UILabel(frame: CGRect(x: idLabel.frame.maxX + 25, y: scrollView.frame.maxY + 20, width: self.view.frame.size.width / 2, height: self.view.frame.size.height / 16))
        answerId.text = "\(UserDefaults.standard.string(forKey: "id") ?? "")"
        answerId.textColor = #colorLiteral(red: 0.4980392456, green: 0.4980392456, blue: 0.498039186, alpha: 1)
//        answerId.layer.borderWidth = 1
        answerId.font = UIFont(name: "SUITE-Regular", size: 20)
        scrollView.addSubview(answerId)
        
        
        
        var nameLabel = UILabel(frame: CGRect(x: 20, y: idLabel.frame.maxY + 10, width: self.view.frame.size.width / 6, height: self.view.frame.size.height / 16))
        nameLabel.text = "이름"
//        nameLabel.font = UIFont.systemFont(ofSize: 20)
        nameLabel.font = UIFont(name: "SUITE-Regular", size: 20)
//        scrollView.addSubview(nameLabel)
        
        answerNmae = UILabel(frame: CGRect(x: nameLabel.frame.maxX + 25, y: idLabel.frame.maxY + 10, width: self.view.frame.size.width / 2, height: self.view.frame.size.height / 16))
        answerNmae.text = "관리자"
        answerNmae.textColor = #colorLiteral(red: 0.4980392456, green: 0.4980392456, blue: 0.498039186, alpha: 1)
//        answerNmae.layer.borderWidth = 1
        answerNmae.font = UIFont(name: "SUITE-Regular", size: 20)
//        scrollView.addSubview(answerNmae)
        
        
        var mailLabel = UILabel(frame: CGRect(x: 20, y: idLabel.frame.maxY + 10, width: self.view.frame.size.width / 6, height: self.view.frame.size.height / 16))
        mailLabel.text = "이메일"
//        mailLabel.font = UIFont.systemFont(ofSize: 20)
        mailLabel.font = UIFont(name: "SUITE-Regular", size: 20)
        scrollView.addSubview(mailLabel)
        
        answermail1 = UITextField(frame: CGRect(x: nameLabel.frame.maxX + 25, y: idLabel.frame.maxY + 10, width: self.view.frame.size.width / 4, height: self.view.frame.size.height / 16))
        answermail1.placeholder = "\(UserDefaults.standard.string(forKey: "mail1") ?? "")"
        answermail1.textColor = #colorLiteral(red: 0.4980392456, green: 0.4980392456, blue: 0.498039186, alpha: 1)
        answermail1.leftViewMode = .always
        answermail1.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        answermail1.layer.borderWidth = 1
        answermail1.layer.cornerRadius = 8
        answermail1.layer.borderColor = UIColor(red: 205.0/255.0, green: 205.0/255.0, blue: 205.0/255.0, alpha: 1.0).cgColor
        answermail1.font = UIFont(name: "SUITE-Regular", size: 20)
        scrollView.addSubview(answermail1)
        
        
        let sideMail = UILabel(frame: CGRect(x: answermail1.frame.maxX + 7, y: idLabel.frame.maxY + 10, width: 20, height: self.view.frame.size.height / 16))
        sideMail.text = "@"
        if IS_IPHONE_N {
            sideMail.font = UIFont(name: "SUITE-Regular", size: 14)
        } else {
            sideMail.font = UIFont(name: "SUITE-Regular", size: 20)
        }
//        sideMail.font = UIFont(name: "SUITE-Regular", size: 20)
        scrollView.addSubview(sideMail)
        
        answermail2 = UITextField(frame: CGRect(x: sideMail.frame.maxX + 7, y: idLabel.frame.maxY + 10, width: (self.view.frame.size.width / 3) + 5, height: self.view.frame.size.height / 16))
        answermail2.placeholder = "\(UserDefaults.standard.string(forKey: "mail2") ?? "")"
        answermail2.textColor = #colorLiteral(red: 0.4980392456, green: 0.4980392456, blue: 0.498039186, alpha: 1)
        answermail2.leftViewMode = .always
        answermail2.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        answermail2.font = UIFont(name: "SUITE-Regular", size: 20)
        answermail2.layer.borderWidth = 1
        answermail2.layer.cornerRadius = 8
        answermail2.layer.borderColor = UIColor(red: 205.0/255.0, green: 205.0/255.0, blue: 205.0/255.0, alpha: 1.0).cgColor
        scrollView.addSubview(answermail2)
        
        
        var hospitalLabel = UILabel(frame: CGRect(x: 20, y: mailLabel.frame.maxY + 10, width: self.view.frame.size.width / 3, height: self.view.frame.size.height / 16))
        hospitalLabel.text = "내원하시는병원"
//        hospitalLabel.font = UIFont.systemFont(ofSize: 20)
        hospitalLabel.font = UIFont(name: "SUITE-Regular", size: 20)
//        hospitalLabel.layer.borderWidth = 1
        scrollView.addSubview(hospitalLabel)
        
        answerHospital = UITextField(frame: CGRect(x: hospitalLabel.frame.maxX + 25, y: answermail2.frame.maxY + 10, width: (self.view.frame.size.width / 2) + 5, height: self.view.frame.size.height / 16))
        answerHospital.placeholder = "\(UserDefaults.standard.string(forKey: "hos") ?? "")"
        answerHospital.textColor = #colorLiteral(red: 0.4980392456, green: 0.4980392456, blue: 0.498039186, alpha: 1)
        answerHospital.leftViewMode = .always
        answerHospital.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        answerHospital.layer.borderWidth = 1
        answerHospital.layer.cornerRadius = 8
        answerHospital.layer.borderColor = UIColor(red: 205.0/255.0, green: 205.0/255.0, blue: 205.0/255.0, alpha: 1.0).cgColor
        
        answerHospital.font = UIFont(name: "SUITE-Regular", size: 20)
        scrollView.addSubview(answerHospital)
        
        var birthLabel = UILabel(frame: CGRect(x: 20, y: hospitalLabel.frame.maxY + 10, width: self.view.frame.size.width / 6, height: self.view.frame.size.height / 16))
        if IS_IPHONE_N {
            birthLabel = UILabel(frame: CGRect(x: 20, y: hospitalLabel.frame.maxY + 10, width: self.view.frame.size.width / 6 + 20, height: self.view.frame.size.height / 16))
        } else if IS_IPHONE_MINI {
            birthLabel = UILabel(frame: CGRect(x: 20, y: hospitalLabel.frame.maxY + 10, width: self.view.frame.size.width / 6 + 20, height: self.view.frame.size.height / 16))
        } else if IS_IPHONE_12PRO {
            birthLabel = UILabel(frame: CGRect(x: 20, y: hospitalLabel.frame.maxY + 10, width: self.view.frame.size.width / 6 + 30, height: self.view.frame.size.height / 16))
        }
        birthLabel.text = "생년월일"
//        birthLabel.font = UIFont.systemFont(ofSize: 20)
        
        birthLabel.font = UIFont(name: "SUITE-Regular", size: 20)
        scrollView.addSubview(birthLabel)
        
        if IS_IPHONE_N {
            answerBitrh = UITextField(frame: CGRect(x: birthLabel.frame.maxX + 25, y: answerHospital.frame.maxY + 10, width: (self.view.frame.size.width / 1.5) + 5 - 20, height: self.view.frame.size.height / 16))
        } else  if IS_IPHONE_MINI {
            answerBitrh = UITextField(frame: CGRect(x: birthLabel.frame.maxX + 20, y: answerHospital.frame.maxY + 10, width: (self.view.frame.size.width / 1.5) + 5 - 15, height: self.view.frame.size.height / 16))
        } else if IS_IPHONE_12PRO {
            answerBitrh = UITextField(frame: CGRect(x: birthLabel.frame.maxX + 25, y: answerHospital.frame.maxY + 10, width: (self.view.frame.size.width / 1.5) - 24, height: self.view.frame.size.height / 16))
        } else if IS_IPHONE_15PRO {
            answerBitrh = UITextField(frame: CGRect(x: birthLabel.frame.maxX + 25, y: answerHospital.frame.maxY + 10, width: (self.view.frame.size.width / 1.5) - 24, height: self.view.frame.size.height / 16))
        } else {
            answerBitrh = UITextField(frame: CGRect(x: birthLabel.frame.maxX + 25, y: answerHospital.frame.maxY + 10, width: (self.view.frame.size.width / 1.5) + 5, height: self.view.frame.size.height / 16))
        }
//        answerBitrh = UITextField(frame: CGRect(x: birthLabel.frame.maxX + 25, y: answerHospital.frame.maxY + 10, width: (self.view.frame.size.width / 1.5) + 5 - 20, height: self.view.frame.size.height / 16))
        answerBitrh.placeholder = "\(UserDefaults.standard.string(forKey: "birth") ?? "")"
        
//        answerBitrh.text = "\(UserDefaults.standard.string(forKey: "bir1") ?? "") - \(UserDefaults.standard.string(forKey: "bir2") ?? "") - \(UserDefaults.standard.string(forKey: "bir3") ?? "")"
        answerBitrh.text = "\(UserDefaults.standard.string(forKey: "birth") ?? "")"
     
        
//        var con = "-"
//        
//        answerBitrh.text = answerBitrh.text?.separate(every: 4, with: "-")
        
        print("here\(UserDefaults.standard.string(forKey: "birth") ?? "")")
        
        var test1 = "\(UserDefaults.standard.string(forKey: "birth") ?? "")"
      
        
      
        
//        let x: Int? = test1.toInt()
//
//        if (x != nil) {
//            print("xxxxxx\(x)")
//            
//            
//            
//        }
        
        
        
//        var index1 = test1.index(test1.startIndex, offsetBy: 4)
//        var index2 = test1.index(test1.startIndex, offsetBy: 7)
//        
//        test1.insert("-", at: index1)
//        test1.insert("-", at: index2)
//        
//        print("test1 :\(test1)")
        
        
        answerBitrh.text = test1
        
        
        if test1.count == 8 {
            var index1 = test1.index(test1.startIndex, offsetBy: 4)
            var index2 = test1.index(test1.startIndex, offsetBy: 7)
            
            test1.insert("-", at: index1)
            test1.insert("-", at: index2)
            
            print("test1 :\(test1)")
            
            
            answerBitrh.text = test1
        }
//        
//        if test1.count == 6{
//            var index1 = test1.index(test1.startIndex, offsetBy: 4)
//            var index2 = test1.index(test1.startIndex, offsetBy: 7)
//            
//            test1.insert("-", at: index1)
//            test1.insert("-", at: index2)
//            
//            print("test1 :\(test1)")
//            
//            
//            answerBitrh.text = test1
//        }
        
//        if UserDefaults.standard.value(forKey: "count") as! Int == 2 {
//            var index1 = test1.index(test1.startIndex, offsetBy: 4)
//            var index2 = test1.index(test1.startIndex, offsetBy: 7)
//            
//            test1.insert("-", at: index1)
//            test1.insert("-", at: index2)
//            
//            print("test1 :\(test1)")
//            
//            
//            answerBitrh.text = test1
//        } else if UserDefaults.standard.value(forKey: "count") as! Int == 1 {
//            var index1 = test1.index(test1.startIndex, offsetBy: 4)
//            var index2 = test1.index(test1.startIndex, offsetBy: 6)
//            
//            test1.insert("-", at: index1)
//            test1.insert("-", at: index2)
//            
//            print("test1 :\(test1)")
//            
//            
//            answerBitrh.text = test1
//        }
        
        
        answerBitrh.textColor = #colorLiteral(red: 0.4980392456, green: 0.4980392456, blue: 0.498039186, alpha: 1)
        answerBitrh.leftViewMode = .always
        answerBitrh.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        answerBitrh.layer.borderWidth = 1
        answerBitrh.layer.cornerRadius = 8
        answerBitrh.layer.borderColor = UIColor(red: 205.0/255.0, green: 205.0/255.0, blue: 205.0/255.0, alpha: 1.0).cgColor
        
        answerBitrh.font = UIFont(name: "SUITE-Regular", size: 20)
        scrollView.addSubview(answerBitrh)
        
        var sexLabel = UILabel(frame: CGRect(x: 20, y: birthLabel.frame.maxY + 10, width: self.view.frame.size.width / 6, height: self.view.frame.size.height / 16))
        sexLabel.text = "성별"
//        sexLabel.font = UIFont.systemFont(ofSize: 20)
        sexLabel.font = UIFont(name: "SUITE-Regular", size: 20)
        scrollView.addSubview(sexLabel)
        
    
        
        if IS_IPHONE_N {
            womanBTN = UIButton(frame: CGRect(x: sexLabel.frame.size.width + 45, y: answerBitrh.frame.maxY + 10, width: (self.view.frame.size.width / 6) + 50, height: self.view.frame.size.height / 16))
        } else if IS_IPHONE_MINI {
            womanBTN = UIButton(frame: CGRect(x: sexLabel.frame.size.width + 45, y: answerBitrh.frame.maxY + 10, width: (self.view.frame.size.width / 6) + 50, height: self.view.frame.size.height / 16))
        } else if IS_IPHONE_12PRO {
            womanBTN = UIButton(frame: CGRect(x: sexLabel.frame.size.width + 55, y: answerBitrh.frame.maxY + 10, width: (self.view.frame.size.width / 6) + 50, height: self.view.frame.size.height / 16))
        }  else if IS_IPHONE_15PRO {
            womanBTN = UIButton(frame: CGRect(x: sexLabel.frame.size.width + 55, y: answerBitrh.frame.maxY + 10, width: (self.view.frame.size.width / 6) + 50, height: self.view.frame.size.height / 16))
        } else {
            womanBTN = UIButton(frame: CGRect(x: sexLabel.frame.size.width + 70, y: answerBitrh.frame.maxY + 10, width: (self.view.frame.size.width / 6) + 50, height: self.view.frame.size.height / 16))
        }

//        womanBTN = UIButton(frame: CGRect(x: sexLabel.frame.size.width + 70, y: answerBitrh.frame.maxY + 10, width: (self.view.frame.size.width / 6) + 50, height: self.view.frame.size.height / 16))
        womanBTN.setTitle(" 남자", for: .normal)
        
        womanBTN.backgroundColor = #colorLiteral(red: 0.9489794374, green: 0.960236609, blue: 0.9856713414, alpha: 1)
        womanBTN.setTitleColor(.lightGray, for: .normal)
        womanBTN.contentHorizontalAlignment = .center
        
//        womanBTN.titleLabel?.font = UIFont.systemFont(ofSize: 11)
        womanBTN.titleLabel?.font = UIFont(name: "SUITE-Regular", size: 20)
//        womanBTN.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
        womanBTN.tag = 0
        
        //        womanBTN.setImage(UIImage(named: "id"), for: .normal)
//        womanBTN.addTarget(self, action: #selector(test(_ :)), for: .touchUpInside)
        scrollView.addSubview(womanBTN)
        
        
        menBTN = UIButton(frame: CGRect(x: womanBTN.frame.maxX + 25, y: answerBitrh.frame.maxY + 10, width: (self.view.frame.size.width / 6) + 50, height: self.view.frame.size.height / 16))
        menBTN.setTitle(" 여자", for: .normal)
        menBTN.backgroundColor = #colorLiteral(red: 0.9489794374, green: 0.960236609, blue: 0.9856713414, alpha: 1)
//        menBTN.backgroundColor = .white
        menBTN.setTitleColor(.lightGray, for: .normal)
        menBTN.contentHorizontalAlignment = .center
//        menBTN.titleLabel?.font = UIFont.systemFont(ofSize: 11)
        menBTN.titleLabel?.font = UIFont(name: "SUITE-Regular", size: 20)
//        menBTN.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
        menBTN.tag = 1
        
        //        womanBTN.setImage(UIImage(named: "id"), for: .normal)
//        menBTN.addTarget(self, action: #selector(test(_ :)), for: .touchUpInside)
        scrollView.addSubview(menBTN)
        
        arrBTN = [womanBTN, menBTN]
        
        self.arrBTN.forEach {
            $0.addTarget(self, action: #selector(test(_ :)), for: .touchUpInside)
            
        }
        if UserDefaults.standard.string(forKey: "sex") == "M" {
            womanBTN.backgroundColor = #colorLiteral(red: 0.04341550916, green: 0.639064908, blue: 0.9187603593, alpha: 1)
            
        } else {
            menBTN.backgroundColor = #colorLiteral(red: 0.04341550916, green: 0.639064908, blue: 0.9187603593, alpha: 1)
        }
        
        
        
        var ksrLabel = UILabel(frame: CGRect(x: 20, y: sexLabel.frame.maxY + 10, width: self.view.frame.size.width / 3, height: self.view.frame.size.height / 16))
        ksrLabel.text = "KSR 등록번호"
//        ksrLabel.font = UIFont.systemFont(ofSize: 20)
        ksrLabel.font = UIFont(name: "SUITE-Regular", size: 20)
        scrollView.addSubview(ksrLabel)
        
        answerKSR = UITextField(frame: CGRect(x: ksrLabel.frame.minX, y: ksrLabel.frame.maxY + 10, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 16))
        answerKSR.placeholder = "KSR 등록번호"
        answerKSR.layer.borderWidth = 1
        answerKSR.layer.cornerRadius = 8
        answerKSR.layer.borderColor = UIColor(red: 205.0/255.0, green: 205.0/255.0, blue: 205.0/255.0, alpha: 1.0).cgColor
        
        answerKSR.textColor = #colorLiteral(red: 0.4980392456, green: 0.4980392456, blue: 0.498039186, alpha: 1)
        answerKSR.leftViewMode = .always
        answerKSR.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        answerKSR.font = UIFont(name: "SUITE-Regular", size: 20)
        scrollView.addSubview(answerKSR)
        saveBTN = UIButton(frame: CGRect(x: 0, y: answerKSR.frame.maxY + 185, width: self.view.frame.size.width, height: 65))
        if IS_IPHONE_12PRO {
            saveBTN = UIButton(frame: CGRect(x: 0, y: answerKSR.frame.maxY + 200, width: self.view.frame.size.width, height: 65))
        } else if IS_IPHONE_15PRO {
            saveBTN = UIButton(frame: CGRect(x: 0, y: answerKSR.frame.maxY + 200, width: self.view.frame.size.width, height: 65))
        } else if IS_IPHONE_N_PLUS {
            saveBTN = UIButton(frame: CGRect(x: 0, y: answerKSR.frame.maxY + 200, width: self.view.frame.size.width, height: 65))
        } else if IS_IPHONE_N {
            saveBTN = UIButton(frame: CGRect(x: 0, y: answerKSR.frame.maxY + 165, width: self.view.frame.size.width, height: 65))
        } else if IS_IPHONE_12PRO_MAX {
            saveBTN = UIButton(frame: CGRect(x: 0, y: answerKSR.frame.maxY + 230, width: self.view.frame.size.width, height: 65))
        } else if IS_IPHONE_15PRO_MAX {
            saveBTN = UIButton(frame: CGRect(x: 0, y: answerKSR.frame.maxY + 230, width: self.view.frame.size.width, height: 65))
        } else {
            saveBTN = UIButton(frame: CGRect(x: 0, y: answerKSR.frame.maxY + 190, width: self.view.frame.size.width, height: 65))
        }
        saveBTN.setTitle("수정", for: .normal)
        saveBTN.titleLabel?.font = UIFont(name: "SUITE-Heavy", size: 20)
        saveBTN.backgroundColor = #colorLiteral(red: 0.1400382817, green: 0.3497706652, blue: 0.5862404704, alpha: 1)
        saveBTN.addTarget(self, action: #selector(modify(_ :)), for: .touchUpInside)
        scrollView.addSubview(saveBTN)
       
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: naviBar.frame.maxY).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: saveBTN.bottomAnchor, constant: 50).isActive = true
        
        showDatePicker()
        
    }
    
    
    
    func showDatePicker(){
        //Formate Date
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .inline
       //ToolBar
       let toolbar = UIToolbar();
       toolbar.sizeToFit()
       let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
      let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));

     toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)

      answerBitrh.inputAccessoryView = toolbar
        answerBitrh.inputView = datePicker
        
        

     }

      @objc func donedatePicker(){

       let formatter = DateFormatter()
//       formatter.dateFormat = "dd/MM/yyyy"
          formatter.dateFormat = "yyyy-MM-dd"
          answerBitrh.text = formatter.string(from: datePicker.date)
       self.view.endEditing(true)
          UserDefaults.standard.setValue(answerBitrh.text, forKey: "ansbir1")
          
   
     }

     @objc func cancelDatePicker(){
        self.view.endEditing(true)
      }
//    func get() {
//        print("내 정보 가져오기")
//        //    //        mutipartRequest()
//        //
//        //            let urlString = "http://strokedb.or.kr/app_new/get_regist_user.asp"
//        //
//        //
//        //        print("sid-->\(UserDefaults.standard.object(forKey: "sid") ?? "")")
//        //        let para = ["user_sid" : "\(UserDefaults.standard.object(forKey: "sid") ?? "")",
//        //                        ]
//        //
//        //
//        //
//        //
//        //
//        //
//        //
//        //
//        //            Server.postData(urlString: urlString, otherInfo: para) { [weak self] (kData : Data?) in
//        //                guard let self = self else { return }
//        //                if let data = kData {
//        //                    let dataString = data.toString() ?? ""
//        //                    print("sighUp resultDataString : \(dataString)")
//        //                    let dataArray = dataString.components(separatedBy: ":")
//        //
//        //                    appDel.showAlert(title: "Notice", message: dataString)
//        //                    return
//        //                }
//        //                appDel.showAlert(title: "Notice", message: "네트워크 에러가 발생했습니다. 다시한번 시도해주세요.")
//        //                return
//        //            }
//        //
//        //
//        //
//        //            print("success")
//        
//        
//        
//        //        AF.request("http://strokedb.or.kr/app_new/get_regist_user.asp",method: .post, parameters: ["user_sid": "\(UserDefaults.standard.object(forKey: "sid") ?? "")"])
//        //                .validate(contentType: ["application/x-www-form-urlencoded"])
//        //                .responseJSON { (response) in
//        //
//        //                    print(response.data?.toJson())
//        ////여기
//        //
//        //            }
//        
//        
//        //        let headers : HTTPHeaders = [
//        //            "Authorization": "Basic MY-API-KEY",
//        //            "Content-Type" : "application/x-www-form-urlencoded"
//        //        ]
//        //        let parameters = ["user_sid" : "\(UserDefaults.standard.object(forKey: "sid") ?? "")"]
//        //
//        //        AF.request("http://strokedb.or.kr/app_new/get_regist_user.asp", method: .post, parameters: parameters, encoding:  URLEncoding.httpBody, headers: headers).responseJSON { (response:DataResponse) in
//        //
//        //            switch(response.result) {
//        //            case.success(let data):
//        //                print("success",data)
//        //
//        //
//        //
//        //
//        //
//        //
//        //
//        //            case.failure(let error):
//        //                print("Not Success",error)
//        ////                self.view.makeToast(message: "Server Error!!")
//        //
//        //            default:
//        //                return
//        //
//        //            }
//        //
//        //        }
//        
//        
//        
//        // 1. 전송할 값 준비
//        
//        
//        
//        let sid = (UserDefaults.standard.object(forKey: "sid") ?? "")
//        
//        let param = "user_sid=\(sid)"  // key1=value&key2=value...
//        
//        let paramData = param.data(using: .utf8)
//        
//        
//        
//        // 2. URL 객체 정의
//        
//        let url = URL(string: "http://strokedb.or.kr/app_new/get_regist_user.asp")
//        
//        
//        
//        // 3. URLRequest 객체를 정의하고, 요청 내용을 담는다.
//        
//        var request = URLRequest(url: url!)
//        
//        request.httpMethod = "POST"
//        
//        request.httpBody = paramData
//        
//        
//        
//        // 4. HTTP 메세지 헤더 설정
//        
//        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
//        
//        request.setValue(String(paramData!.count), forHTTPHeaderField: "Content-Length")
//        
//        
//        
//        // 5. URLSession 객체를 통해 전송 및 응답값 처리 로직 작성
//        
//        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
//            
//            // 5-1. 서버가 응답이 없거나 통신이 실패했을 때
//            
//            if let e = error {
//                
//                NSLog("An error has occurred : \(e.localizedDescription)")
//                
//                return
//                
//            }
//            
//            
//            
//            
//            
//            print("Response Data=\(String(data: data!, encoding: .utf8)!)")
//            
//            // 5-2. 응답 처리 로직이 여기에 들어갑니다.
//            
//            // 1) 메인 스레드에서 비동기로 처리되도록 한다.
//            
//            DispatchQueue.main.async(){ [self] in
//                
//                do {
//                    
//                    let object = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary
//                    //
//                    guard let jsonObject = object else { return }
//                    //
//                    //
//                    //                            let decoder = JSONDecoder()
//                    //                            decoder.dateDecodingStrategy = .iso8601
//                    //
//                    ////                            let decoder = JSONDecoder()
//                    ////                                let dateFormatter = DateFormatter().then {
//                    ////                                  $0.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.sssZ"
//                    ////                                }
//                    ////                                decoder.dateDecodingStrategy = .formatted(dateFormatter)
//                    //
//                    //                            let jsonData = try decoder.decode(MyInfoDetail.self, from: data!)
//                    //                            print("jsonData: \(jsonData)")
//                    
//                    
//                    
//                    // 2) JSON 결과값을 추출한다.
//                    
//                    let result = jsonObject["result"] as? Int
//                    
//                    let message = jsonObject["message"] as? String
//                    
//                    //                            self.myId = (jsonObject["user_id"] as? String)!
//                    let data = jsonObject["data"]
//                    
//                    
//                    if let email1 = (data as AnyObject)["email1"]! as? String
//                    {
//                        print("-->\(email1)")
//                        UserDefaults.standard.set(email1, forKey: "mail1")
//                        
//                    }
//                    if let email2 = (data as AnyObject)["email2"]! as? String
//                    {
//                        print("-->\(email2)")
//                        UserDefaults.standard.set(email2, forKey: "mail2")
//                        
//                    }
//                    if let id = (data as AnyObject)["user_id"]! as? String
//                    {
//                        print("-->\(id)")
//                        UserDefaults.standard.set(id, forKey: "id")
//                        
//                    }
//                    if let birth = (data as AnyObject)["birth"]! as? String
//                    {
//                        print("-->\(birth)")
//                        UserDefaults.standard.set(birth, forKey: "birth")
//                        
//                    }
//                    if let hos = (data as AnyObject)["hos"]! as? String
//                    {
//                        print("-->\(hos)")
//                        UserDefaults.standard.set(hos, forKey: "hos")
//                        
//                    }
//                    
//                    
//                    
//                    
//                    
//                    
//                    //                            let userid = jsonObject["user_id"] as? String
//                    
//                    //                            let name = jsonObject["name"] as? String
//                    
//                    
//                    print("message: \(message)" ?? "")
//                    print("result: \(result)" ?? "")
//                    
//                    print("data: \(data ?? "")")
//                    
//                    
//                    
//                    
//                    
//                    
//                    //                            print(data["bitrh"] as? [String : String])
//                    
//                    
//                    
//                    
//                    
//                    
//                    // 3) 결과가 성공일 때에만 텍스트 뷰에 출력한다.
//                    
//                    if message == "성공" {
//                        
//                        
//                        print("data->\(data)")
//                        
//                        //                                myId = data["user_id"] as String
//                        
//                        
//                        
//                        
//                        
//                        
//                        
//                        
//                        
//                        
//                        
//                        //                                print("userid: \(data["userid"])")
//                        //                                self.responseView.text = "아이디 : \(userId!)" + "\n"
//                        //
//                        //                                                        + "이름 : \(name!)" + "\n"
//                        //
//                        //                                    + "응답결과 : \(result!)" + "\n"
//                        //
//                        //                                    + "응답방식 : \(timestamp!)" + "\n"
//                        //
//                        //                                    + "요청방식 : x-www-form-urlencoded"
//                        
//                    }
//                    
//                }  catch let DecodingError.dataCorrupted(context) {
//                    print(context)
//                } catch let DecodingError.keyNotFound(key, context) {
//                    print("Key '\(key)' not found:", context.debugDescription)
//                    print("codingPath:", context.codingPath)
//                } catch let DecodingError.valueNotFound(value, context) {
//                    print("Value '\(value)' not found:", context.debugDescription)
//                    print("codingPath:", context.codingPath)
//                } catch let DecodingError.typeMismatch(type, context)  {
//                    print("Type '\(type)' mismatch:", context.debugDescription)
//                    print("codingPath:", context.codingPath)
//                } catch {
//                    print("error: ", error)
//                }
//                
//            }
//            
//            
//            
//        }
//        
//        // 6. POST 전송
//        
//        task.resume()
//        
//        
//        
//        
//        
//        
//        
//        //        //post data
//        //        let url = "http://strokedb.or.kr/app_new/get_regist_user.asp"
//        //
//        ////        let parameter:Parameters = ["uid" : "235"]
//        //
//        //
//        //        let para = ["user_sid" : "\(UserDefaults.standard.object(forKey: "sid") ?? "")"
//        //                        ]
//        //
//        //
//        //        AF.request(url, method: .post, parameters: para, encoding: URLEncoding.default)
//        //            .responseJSON { [self] response in
//        //                print("result: \(response)")
//        //
//        //
//        //
//        //                switch response.result {
//        //                case .success(let suc):
//        //                    print("su")
//        //
//        //
//        //
//        //                    guard let result = response.data else {return}
//        //                    print("일루와")
//        //                    do {
//        //                        let decoder = JSONDecoder()
//        //                        let json = try decoder.decode(MyInfoDetail.self, from: result)
//        //
//        //                     print("정보\(json)")
//        //
//        //
//        //
//        //
//        //
//        //
//        ////                        UserDefaults.standard.set(sid, forKey: "sid")
//        //
//        //                        let vc = MainViewController()
//        //
//        //                                                            vc.modalPresentationStyle = .fullScreen
//        //                                                            self.present(vc, animated: false)
//        //
//        //                        }
//        //                    catch {
//        //                        print("err \(error)")
//        //                    }
//        //                default:
//        //                    return
//        //
//        //
//        //
//        //                }
//        //
//        //
//        //        }
//        
//        
//    }
    
    @objc func modify(_ sender: UIButton) {
        //post data
        let url = "http://strokedb.or.kr/app_new/edit_regist_user.asp"
        
        let para = ["user_sid" : (UserDefaults.standard.object(forKey: "userSid") ?? ""),
//                    "user_id" : idTF.text!,
//                    "passwd" : pwTF.text!,
//                    "re_passwd" : rePWTF.text!,
                    "email1" : answermail1.text!,
                    "email2" : answermail2.text!,
                    "hospital" : answerHospital.text!,
//                    "birth" : answerBitrh.text!,
                    "birth": (UserDefaults.standard.object(forKey: "ansbir1") ?? ""),
                    
                    
                    "sex" : womanBTN.backgroundColor == #colorLiteral(red: 0.04341550916, green: 0.639064908, blue: 0.9187603593, alpha: 1) ? "M" : "F"
//                                                   "img" : self.photoImage.image?.jpegData(compressionQuality: 1)!,
]
        
        AF.request(url, method: .post, parameters: para, encoding: URLEncoding.default)
            .responseJSON { [self] response in
                
                print("success11??")
                print("result\(response)")
                
                
              
                switch response.result {
                case .success(let suc):
                    print("su")
                   
                    
                    guard let result = response.data else {return}
                    
                    do {
                        let decoder = JSONDecoder()
                        let json = try decoder.decode(DataS.self, from: result)
                        
                        print("????\(json.message)")
                        
                        
                        if json.message == "수정되었습니다." {
                            //
                            
                            showToast(message: json.message, font: UIFont.systemFont(ofSize: 15))
                            //
                            
                        } else {
                            showToast(message: json.message, font: UIFont.systemFont(ofSize: 15))
                        }
//
//                        } else {
////                            showToast(message: json.message, font: UIFont.systemFont(ofSize: 15))
//                        }
//                        
////                        showToast(message: json.message, font: UIFont.systemFont(ofSize: 15))
//                        
//                        
////                        toastShow(message: json.message)
                        
                        
                        
                        
                        }
                    catch {
                        print("err \(error)")
                    }
                default:
                    return
                   
                    
              
                }
                
                
        }
    }
        
        func showToast(message : String, font: UIFont) {
            let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/3.6, y: self.view.frame.size.height / 1.8 , width: 200, height: 35))
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
    
    @objc func test(_ sender: UIButton) {
        print("\(sender.tag)")
        
        self.arrBTN.forEach {
            if $0.tag == sender.tag {
//                $0.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
                $0.setTitleColor(.white, for: .normal)
                $0.backgroundColor = #colorLiteral(red: 0.04341550916, green: 0.639064908, blue: 0.9187603593, alpha: 1)
                
            } else {
//                $0.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
                $0.setTitleColor(.lightGray, for: .normal)
                $0.backgroundColor = #colorLiteral(red: 0.9489794374, green: 0.960236609, blue: 0.9856713414, alpha: 1)
            }
        }
    }
    
    @objc func callMethod(){
        let vc = MainViewController()

        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false)
    }
    
}
extension String {
    func separate(every stride: Int = 4, with separator: Character = " ") -> String {
        return String(enumerated().map { $0 > 0 && $0 % stride == 0 ? [separator, $1] : [$1]}.joined())
    }
}
