//
//  MyInfoViewController.swift
//  KSR_2024
//
//  Created by m2comm on 2024/01/30.
//

import Foundation
import UIKit












class MyInfoViewController :UIViewController {
    
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
    
    
    var myId: String = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        
        scrollView.backgroundColor = #colorLiteral(red: 0.9293832183, green: 0.944276154, blue: 0.9823971391, alpha: 1)
        self.view.backgroundColor = UIColor.white
        
        let statusBar = UIView(frame: CGRect(x: 0, y: 0, width: SCREEN.WIDTH, height: STATUS_BAR_HEIGHT))
        statusBar.backgroundColor = #colorLiteral(red: 0.9293832183, green: 0.944276154, blue: 0.9823971391, alpha: 1)
        
        self.view.addSubview(statusBar)
        
        naviBar = UIView(frame: CGRect(x: 0, y: statusBar.frame.maxY, width: SCREEN.WIDTH, height: 50))
        naviBar.backgroundColor = #colorLiteral(red: 0.9293832183, green: 0.944276154, blue: 0.9823971391, alpha: 1)
        self.view.addSubview(naviBar)
        
        let smart = UILabel(frame: CGRect(x: self.view.frame.size.width / 2.8, y: 0, width: self.view.frame.width - 20, height: naviBar.frame.height))
        
        naviBar.addSubview(smart)
        
        smart.text = "회원정보 수정"
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
        button.setImage(UIImage(systemName: "arrow.backward"), for: .normal)
        //Set the title
        button.setTitle("", for: .normal)
        button.tintColor = .black
        button.setTitleColor(.black, for: .normal)
        //Add target
        button.addTarget(self, action: #selector(callMethod), for: .touchUpInside)
        button.frame = CGRect(x: 10, y: 10, width: 100, height: 50)
        button.sizeToFit()
        
        naviBar.addSubview(button)
        
        var idLabel = UILabel(frame: CGRect(x: 20, y: scrollView.frame.maxY + 20, width: self.view.frame.size.width / 6, height: self.view.frame.size.height / 16))
        idLabel.text = "아이디"
//        idLabel.layer.borderWidth = 1
        idLabel.font = UIFont.systemFont(ofSize: 20)
        scrollView.addSubview(idLabel)
        
        answerId = UILabel(frame: CGRect(x: idLabel.frame.maxX + 25, y: scrollView.frame.maxY + 20, width: self.view.frame.size.width / 2, height: self.view.frame.size.height / 16))
        answerId.text = "admin"
//        answerId.layer.borderWidth = 1
        scrollView.addSubview(answerId)
        
        
        
        var nameLabel = UILabel(frame: CGRect(x: 20, y: idLabel.frame.maxY + 10, width: self.view.frame.size.width / 6, height: self.view.frame.size.height / 16))
        nameLabel.text = "이름"
        nameLabel.font = UIFont.systemFont(ofSize: 20)
        scrollView.addSubview(nameLabel)
        
        answerNmae = UILabel(frame: CGRect(x: nameLabel.frame.maxX + 25, y: idLabel.frame.maxY + 10, width: self.view.frame.size.width / 2, height: self.view.frame.size.height / 16))
        answerNmae.text = "관리자"
//        answerNmae.layer.borderWidth = 1
        scrollView.addSubview(answerNmae)
        
        
        var mailLabel = UILabel(frame: CGRect(x: 20, y: nameLabel.frame.maxY + 10, width: self.view.frame.size.width / 6, height: self.view.frame.size.height / 16))
        mailLabel.text = "이메일"
        mailLabel.font = UIFont.systemFont(ofSize: 20)
        scrollView.addSubview(mailLabel)
        
        answermail1 = UITextField(frame: CGRect(x: nameLabel.frame.maxX + 25, y: answerNmae.frame.maxY + 10, width: self.view.frame.size.width / 4, height: self.view.frame.size.height / 16))
        answermail1.placeholder = " m2com"
        answermail1.layer.borderWidth = 1
        scrollView.addSubview(answermail1)
        
        
        let sideMail = UILabel(frame: CGRect(x: answermail1.frame.maxX + 7, y: answerNmae.frame.maxY + 10, width: 20, height: self.view.frame.size.height / 16))
        sideMail.text = "@"
        scrollView.addSubview(sideMail)
        
        answermail2 = UITextField(frame: CGRect(x: sideMail.frame.maxX + 7, y: answerNmae.frame.maxY + 10, width: self.view.frame.size.width / 3, height: self.view.frame.size.height / 16))
        answermail2.placeholder = " gmail.com"
        answermail2.layer.borderWidth = 1
        scrollView.addSubview(answermail2)
        
        
        var hospitalLabel = UILabel(frame: CGRect(x: 20, y: mailLabel.frame.maxY + 10, width: self.view.frame.size.width / 3, height: self.view.frame.size.height / 16))
        hospitalLabel.text = "내원하시는병원"
        hospitalLabel.font = UIFont.systemFont(ofSize: 20)
//        hospitalLabel.layer.borderWidth = 1
        scrollView.addSubview(hospitalLabel)
        
        answerHospital = UITextField(frame: CGRect(x: hospitalLabel.frame.maxX + 25, y: answermail2.frame.maxY + 10, width: self.view.frame.size.width / 2, height: self.view.frame.size.height / 16))
        answerHospital.placeholder = " 서울대병원"
        answerHospital.layer.borderWidth = 1
        scrollView.addSubview(answerHospital)
        
        var birthLabel = UILabel(frame: CGRect(x: 20, y: hospitalLabel.frame.maxY + 10, width: self.view.frame.size.width / 6, height: self.view.frame.size.height / 16))
        birthLabel.text = "생년월일"
        birthLabel.font = UIFont.systemFont(ofSize: 20)
        scrollView.addSubview(birthLabel)
        
        answerBitrh = UITextField(frame: CGRect(x: birthLabel.frame.maxX + 25, y: answerHospital.frame.maxY + 10, width: self.view.frame.size.width / 1.5, height: self.view.frame.size.height / 16))
        answerBitrh.placeholder = " 1999년 12월 31일"
        answerBitrh.layer.borderWidth = 1
        scrollView.addSubview(answerBitrh)
        
        var sexLabel = UILabel(frame: CGRect(x: 20, y: birthLabel.frame.maxY + 10, width: self.view.frame.size.width / 6, height: self.view.frame.size.height / 16))
        sexLabel.text = "성별"
        sexLabel.font = UIFont.systemFont(ofSize: 20)
        scrollView.addSubview(sexLabel)
        
        womanBTN = UIButton(frame: CGRect(x: sexLabel.frame.size.width + 25, y: answerBitrh.frame.maxY + 10, width: self.view.frame.size.width / 6, height: self.view.frame.size.height / 16))
        womanBTN.setTitle(" 여자", for: .normal)
        womanBTN.backgroundColor = .white
        womanBTN.setTitleColor(.blue, for: .normal)
        womanBTN.contentHorizontalAlignment = .center
        womanBTN.titleLabel?.font = UIFont.systemFont(ofSize: 11)
        womanBTN.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
        womanBTN.tag = 0
        
        //        womanBTN.setImage(UIImage(named: "id"), for: .normal)
//        womanBTN.addTarget(self, action: #selector(test(_ :)), for: .touchUpInside)
        scrollView.addSubview(womanBTN)
        
        
        menBTN = UIButton(frame: CGRect(x: womanBTN.frame.maxX + 25, y: answerBitrh.frame.maxY + 10, width: self.view.frame.size.width / 6, height: self.view.frame.size.height / 16))
        menBTN.setTitle(" 남성", for: .normal)
        menBTN.backgroundColor = .white
        menBTN.setTitleColor(.blue, for: .normal)
        menBTN.contentHorizontalAlignment = .center
        menBTN.titleLabel?.font = UIFont.systemFont(ofSize: 11)
        menBTN.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
        menBTN.tag = 1
        
        //        womanBTN.setImage(UIImage(named: "id"), for: .normal)
//        menBTN.addTarget(self, action: #selector(test(_ :)), for: .touchUpInside)
        scrollView.addSubview(menBTN)
        
        arrBTN = [womanBTN, menBTN]
        
        self.arrBTN.forEach {
            $0.addTarget(self, action: #selector(test(_ :)), for: .touchUpInside)
            
        }
        
        
        
        
        var ksrLabel = UILabel(frame: CGRect(x: 20, y: sexLabel.frame.maxY + 10, width: self.view.frame.size.width / 3, height: self.view.frame.size.height / 16))
        ksrLabel.text = "KSR 등록번호"
        ksrLabel.font = UIFont.systemFont(ofSize: 20)
        scrollView.addSubview(ksrLabel)
        
        answerKSR = UITextField(frame: CGRect(x: ksrLabel.frame.minX, y: ksrLabel.frame.maxY + 10, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 16))
        answerKSR.placeholder = " abc-12345"
        answerKSR.layer.borderWidth = 1
        scrollView.addSubview(answerKSR)
        
        
        let saveBTN = UIButton(frame: CGRect(x: 20, y: answerKSR.frame.maxY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 16))
        saveBTN.setTitle("수정", for: .normal)
        saveBTN.backgroundColor = .blue
        scrollView.addSubview(saveBTN)
       
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: naviBar.frame.maxY).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: saveBTN.bottomAnchor, constant: 50).isActive = true
        
    }
    
    
    
    @objc func test(_ sender: UIButton) {
        print("\(sender.tag)")
        
        self.arrBTN.forEach {
            if $0.tag == sender.tag {
                $0.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
            } else {
                $0.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
            }
        }
    }
    
    @objc func callMethod(){
        let vc = MainViewController()

        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false)
    }
    
}
