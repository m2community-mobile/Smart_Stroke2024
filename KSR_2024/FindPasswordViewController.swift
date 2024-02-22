//
//  FindPasswordViewController.swift
//  KSR_2024
//
//  Created by m2comm on 2024/01/30.
//

import Foundation
import UIKit

class FindPasswordViewController: UIViewController {
    
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
    
    var imageBackView: UIView!
    var imageView: UIImageView!
    var phoneTF: UITextField!
    var phoneBTN: UIButton!
    var numTF: UITextField!
    var numCheckBTN: UIButton!
    
    var pwTF: UITextField!
    var newPWTF: UITextField!
    
    
    var okView: UIView!
    var saveBTN: UIButton!
    
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
       
        smart.text = "비밀번호 찾기"
        smart.font = UIFont.boldSystemFont(ofSize: 22)
//        smart.font = UIFont(name: NotoSansCJKkr_Medium, size: 2)
//        smart.font = UIFont.systemFont(ofSize: 22)
        
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
        button.setTitleColor(.black, for: .normal)
            //Add target
            button.addTarget(self, action: #selector(callMethod), for: .touchUpInside)
            button.frame = CGRect(x: 20, y: 10, width: 60, height: 25)
        button.imageEdgeInsets = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
            button.sizeToFit()
        
        naviBar.addSubview(button)
        
//        imageBackView = UIView(frame: CGRect(x: self.view.frame.size.width / 2.4, y: scrollView.frame.minY + 30, width: 100, height: 100))
        imageBackView = UIView(frame: CGRect(x: self.view.center.x, y: scrollView.frame.minY + 30, width: 100, height: 100))
        
        scrollView.addSubview(imageBackView)
          
        imageBackView.translatesAutoresizingMaskIntoConstraints = false
          
        imageBackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        imageBackView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        imageBackView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        imageBackView.centerYAnchor.constraint(equalTo: scrollView.topAnchor, constant: 90).isActive = true
        
        imageBackView.backgroundColor = .white
        imageBackView.layer.cornerRadius = imageBackView.frame.height/2
        imageBackView.layer.borderWidth = 1
        imageBackView.clipsToBounds = true
        imageBackView.layer.borderColor = UIColor.white.cgColor
//        scrollView.addSubview(imageBackView)
        
        imageView = UIImageView(frame: CGRect(x: imageBackView.frame.size.width / 3.8, y: imageBackView.frame.size.height / 5.6, width: 50, height: 50))
        imageView.image = UIImage(named: "findPW")
        imageBackView.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
          
        imageView.centerXAnchor.constraint(equalTo: imageBackView.centerXAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        imageView.centerYAnchor.constraint(equalTo: imageBackView.centerYAnchor).isActive = true
        
        var mailLabel = UILabel(frame: CGRect(x: 20, y: imageBackView.frame.maxY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 16))
        mailLabel.text = "회원가입 시 입력하신 이메일 주소를 입력해주세요."
//        mailLabel.font = UIFont.systemFont(ofSize: 18)
        mailLabel.font = UIFont(name: "SUITE-Regular", size: 18)
        mailLabel.textAlignment = .center
        scrollView.addSubview(mailLabel)
        
        phoneTF = UITextField(frame: CGRect(x: 20, y: mailLabel.frame.maxY + 10, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 16))
        phoneTF.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        phoneTF.leftViewMode = .always
        phoneTF.layer.borderWidth = 0.3
        phoneTF.layer.borderColor = UIColor.lightGray.cgColor
        phoneTF.layer.cornerRadius = 8
        phoneTF.placeholder = " 휴대폰번호"
        phoneTF.backgroundColor = .white
        
        scrollView.addSubview(phoneTF)
        
        
        phoneBTN = UIButton(frame: CGRect(x: phoneTF.frame.maxX - self.view.frame.size.width / 3.4, y: 0, width: self.view.frame.size.width / 4, height: self.view.frame.size.height / 16))
        if IS_IPHONE_N_PLUS {
            phoneBTN = UIButton(frame: CGRect(x: phoneTF.frame.maxX - self.view.frame.size.width / 3.4 - 1, y: 0, width: self.view.frame.size.width / 4, height: self.view.frame.size.height / 16))
        }
        if IS_IPHONE_X {
            phoneBTN = UIButton(frame: CGRect(x: phoneTF.frame.maxX - self.view.frame.size.width / 3.4 - 2, y: 0, width: self.view.frame.size.width / 4, height: self.view.frame.size.height / 16))
        }
        phoneBTN.layer.cornerRadius = 8
        phoneBTN.setTitle("인증번호 받기", for: .normal)
        phoneBTN.setTitleColor(.blue, for: .normal)
//        phoneBTN.titleLabel.font = UIFont.boldSystemFont(ofSize: 14)
        phoneBTN.titleLabel?.font = UIFont(name: "SUITE-Regular", size: 15)
        phoneBTN.layer.borderWidth = 1
        phoneTF.addSubview(phoneBTN)
        
        
        numTF = UITextField(frame: CGRect(x: 20, y: phoneTF.frame.maxY + 10, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 16))
        numTF.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        numTF.leftViewMode = .always
        numTF.layer.borderWidth = 0.3
        numTF.layer.borderColor = UIColor.lightGray.cgColor
        numTF.backgroundColor = .white
        numTF.layer.cornerRadius = 8
        numTF.placeholder = " 인증번호"
        scrollView.addSubview(numTF)
        
//        let backColor = /*#colorLiteral(red: 0.1919914484, green: 0.353618443, blue: 0.5941604376, alpha: 1)*/
        
        numCheckBTN = UIButton(frame: CGRect(x: numTF.frame.maxX - self.view.frame.size.width / 3.4, y: 0, width: self.view.frame.size.width / 4, height: self.view.frame.size.height / 16))
        if IS_IPHONE_N_PLUS {
            numCheckBTN = UIButton(frame: CGRect(x: phoneTF.frame.maxX - self.view.frame.size.width / 3.4 - 1, y: 0, width: self.view.frame.size.width / 4, height: self.view.frame.size.height / 16))
        }
        if IS_IPHONE_X {
            numCheckBTN = UIButton(frame: CGRect(x: phoneTF.frame.maxX - self.view.frame.size.width / 3.4 - 2, y: 0, width: self.view.frame.size.width / 4, height: self.view.frame.size.height / 16))
        }
        numCheckBTN.layer.cornerRadius = 8
        numCheckBTN.setTitle("확인", for: .normal)
//        numCheckBTN.setTitleColor(UIColor(red: 0.1919914484, green: 0.353618443, blue: 0.5941604376, alpha: 1), for: .normal)
        numCheckBTN.titleLabel?.font = UIFont(name: "SUITE-Regular", size: 15)
        numCheckBTN.setTitleColor(.white, for: .normal)
        numCheckBTN.backgroundColor = #colorLiteral(red: 0.1919914484, green: 0.353618443, blue: 0.5941604376, alpha: 1)
        numCheckBTN.layer.borderWidth = 1
        numCheckBTN.addTarget(self, action: #selector(ok(_ :)), for: .touchUpInside)
        numTF.addSubview(numCheckBTN)
        
        
        
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: naviBar.frame.maxY).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: numCheckBTN.bottomAnchor, constant: 500).isActive = true


        scrollView.addSubview(labelTwo)
        labelTwo.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 40).isActive = true
        labelTwo.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 1000).isActive = true
        labelTwo.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -40).isActive = true
        
        
        
        
        
        
//        imageBackView = UIView(frame: CGRect(x: self.view.frame.size.width / 2.4, y: numTF.frame.maxY + 40, width: 100, height: 100))
//        imageBackView.backgroundColor = .white
//        imageBackView.layer.cornerRadius = imageBackView.frame.height/2
//        imageBackView.layer.borderWidth = 1
//        imageBackView.clipsToBounds = true
//        imageBackView.layer.borderColor = UIColor.white.cgColor
//        scrollView.addSubview(imageBackView)
//        
//        imageView = UIImageView(frame: CGRect(x: imageBackView.frame.size.width / 3.8, y: imageBackView.frame.size.height / 5.6, width: 50, height: 50))
//        imageView.image = UIImage(named: "newpw")
//        imageBackView.addSubview(imageView)
//        
//        var pwLabel = UILabel(frame: CGRect(x: 20, y: imageBackView.frame.maxY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 16))
//        pwLabel.text = "새로운 비밀번호를 입력해주세요."
//        pwLabel.font = UIFont.systemFont(ofSize: 18)
//        pwLabel.textAlignment = .center
//        scrollView.addSubview(pwLabel)
//        
//        pwTF = UITextField(frame: CGRect(x: 20, y: pwLabel.frame.maxY + 10, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 16))
//        pwTF.layer.borderWidth = 1
//        pwTF.placeholder = "  새로운 비밀번호"
//        scrollView.addSubview(pwTF)
//        
//        
//        newPWTF = UITextField(frame: CGRect(x: 20, y: pwTF.frame.maxY + 10, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 16))
//        newPWTF.layer.borderWidth = 1
//        newPWTF.placeholder = "  새로운 비밀번호 확인"
//        scrollView.addSubview(newPWTF)
//        
//        let saveBTN = UIButton(frame: CGRect(x: 20, y: newPWTF.frame.maxY + 10, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 16))
//        saveBTN.setTitle("저장", for: .normal)
//        saveBTN.backgroundColor = .blue
//        scrollView.addSubview(saveBTN)
        
        
        
      
            
             
    
        
       
//        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: naviBar.frame.maxY).isActive = true
//        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//        
//        scrollView.bottomAnchor.constraint(equalTo: numCheckBTN.bottomAnchor).isActive = true
        
    
        
    }
    
    @objc func ok(_ sender: UIButton) {
        
        okView = UIView(frame: CGRect(x: 20, y: numTF.frame.maxY + 40, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 4))
        okView.backgroundColor = #colorLiteral(red: 0.3059164584, green: 0.327943325, blue: 0.3913042247, alpha: 1)
        scrollView.addSubview(okView)
        
        let messege = UILabel()
        messege.text = "인증이 완료되었습니다."
        messege.font = UIFont(name: "SUITE-Regular", size: 20)
        messege.textColor = .white
        okView.addSubview(messege)
        
        messege.translatesAutoresizingMaskIntoConstraints = false
        
        messege.centerXAnchor.constraint(equalTo: okView.centerXAnchor).isActive = true
        messege.widthAnchor.constraint(equalToConstant: 180).isActive = true
        messege.heightAnchor.constraint(equalToConstant: 50).isActive = true
        messege.centerYAnchor.constraint(equalTo: okView.centerYAnchor, constant: -30).isActive = true
        
        
        let  registerBTN = UIButton()
        
        okView.addSubview(registerBTN)
        
        registerBTN.translatesAutoresizingMaskIntoConstraints = false
        
        
        registerBTN.centerXAnchor.constraint(equalTo: okView.centerXAnchor).isActive = true
        registerBTN.widthAnchor.constraint(equalToConstant: 80).isActive = true
        registerBTN.heightAnchor.constraint(equalToConstant: 40).isActive = true
        registerBTN.centerYAnchor.constraint(equalTo: okView.centerYAnchor, constant: 30).isActive = true
        
        registerBTN.setTitle("확인", for: .normal)
        registerBTN.setTitleColor(.white, for: .normal)
        registerBTN.layer.borderWidth = 0.5
        registerBTN.layer.cornerRadius = 8
        registerBTN.addTarget(self, action: #selector(next(_ :)), for: .touchUpInside)
        registerBTN.layer.borderColor = UIColor.lightGray.cgColor
        
        
    }
    
    @objc func next(_ sender: UIButton) {
        
        okView.isHidden = true
        
        
        
        
        
        
        
        
        
        let imageBackView2 = UIView()

        
        scrollView.addSubview(imageBackView2)
        imageBackView2.translatesAutoresizingMaskIntoConstraints = false
        
        imageBackView2.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        imageBackView2.widthAnchor.constraint(equalToConstant: 100).isActive = true
        imageBackView2.heightAnchor.constraint(equalToConstant: 100).isActive = true
        imageBackView2.bottomAnchor.constraint(equalTo: numTF.bottomAnchor, constant: 150).isActive = true
        
        
        
        imageBackView2.backgroundColor = .white
        imageBackView2.layer.cornerRadius = imageBackView.frame.height/2
        imageBackView2.layer.borderWidth = 1
        imageBackView2.clipsToBounds = true
        imageBackView2.layer.borderColor = UIColor.white.cgColor

        
    
        
               let  imageView2 = UIImageView()
        imageView2.image = UIImage(named: "newpw")

                imageBackView2.addSubview(imageView2)
        imageView2.translatesAutoresizingMaskIntoConstraints = false
        
        imageView2.centerXAnchor.constraint(equalTo: imageBackView2.centerXAnchor).isActive = true
        imageView2.widthAnchor.constraint(equalToConstant: 50).isActive = true
        imageView2.heightAnchor.constraint(equalToConstant: 50).isActive = true
        imageView2.centerYAnchor.constraint(equalTo: imageBackView2.centerYAnchor).isActive = true
        
        
//
                var pwLabel = UILabel(frame: CGRect(x: 20, y: imageBackView2.frame.maxY + 500, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 16))
                pwLabel.text = "새로운 비밀번호를 입력해주세요."
        pwLabel.font = UIFont(name: "SUITE-Regular", size: 18)
        pwLabel.textAlignment = .center
                scrollView.addSubview(pwLabel)
//
                pwTF = UITextField(frame: CGRect(x: 20, y: pwLabel.frame.maxY + 10, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 16))
                
                pwTF.placeholder = "  새로운 비밀번호"
        
        pwTF.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        pwTF.leftViewMode = .always
        pwTF.layer.borderWidth = 0.3
        pwTF.layer.borderColor = UIColor.lightGray.cgColor
        pwTF.backgroundColor = .white
        pwTF.layer.cornerRadius = 8
                scrollView.addSubview(pwTF)
//        
//        
                newPWTF = UITextField(frame: CGRect(x: 20, y: pwTF.frame.maxY + 10, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 16))
                newPWTF.layer.borderWidth = 1
                newPWTF.placeholder = "  새로운 비밀번호 확인"
        
        newPWTF.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        newPWTF.leftViewMode = .always
        newPWTF.layer.borderWidth = 0.3
        newPWTF.layer.borderColor = UIColor.lightGray.cgColor
        newPWTF.backgroundColor = .white
        newPWTF.layer.cornerRadius = 8
                scrollView.addSubview(newPWTF)
        
                saveBTN = UIButton(frame: CGRect(x: 20, y: newPWTF.frame.maxY + 10, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 16))
                saveBTN.setTitle("저장", for: .normal)
                saveBTN.backgroundColor = #colorLiteral(red: 0.04926360399, green: 0.6032680869, blue: 0.7654167414, alpha: 1)
        saveBTN.layer.borderWidth = 0.3
                saveBTN.layer.cornerRadius = 8
        saveBTN.addTarget(self, action: #selector(save(_ :)), for: .touchUpInside)
        
                scrollView.addSubview(saveBTN)
//        
    }
    
    @objc func save(_ sender: UIButton) {
        
        let saveView = UIView(frame: CGRect(x: 20, y: saveBTN.frame.maxY + 40, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 4))
        saveView.backgroundColor = #colorLiteral(red: 0.3059164584, green: 0.327943325, blue: 0.3913042247, alpha: 1)
        scrollView.addSubview(saveView)
        
        let messege = UILabel()
        messege.text = "비밀번호 변경이 완료되었습니다."
        messege.font = UIFont(name: "SUITE-Regular", size: 20)
        messege.textColor = .white
        saveView.addSubview(messege)
        
        messege.translatesAutoresizingMaskIntoConstraints = false
        
        messege.centerXAnchor.constraint(equalTo: saveView.centerXAnchor).isActive = true
        messege.widthAnchor.constraint(equalToConstant: 260).isActive = true
        messege.heightAnchor.constraint(equalToConstant: 50).isActive = true
        messege.centerYAnchor.constraint(equalTo: saveView.centerYAnchor, constant: -30).isActive = true
        
        
        let  registerBTN = UIButton()
        
        saveView.addSubview(registerBTN)
        
        registerBTN.translatesAutoresizingMaskIntoConstraints = false
        
        
        registerBTN.centerXAnchor.constraint(equalTo: saveView.centerXAnchor).isActive = true
        registerBTN.widthAnchor.constraint(equalToConstant: 80).isActive = true
        registerBTN.heightAnchor.constraint(equalToConstant: 40).isActive = true
        registerBTN.centerYAnchor.constraint(equalTo: saveView.centerYAnchor, constant: 30).isActive = true
        
        registerBTN.setTitle("확인", for: .normal)
        registerBTN.setTitleColor(.white, for: .normal)
        registerBTN.layer.borderWidth = 0.5
        registerBTN.layer.cornerRadius = 8
        registerBTN.addTarget(self, action: #selector(goView(_ :)), for: .touchUpInside)
        registerBTN.layer.borderColor = UIColor.lightGray.cgColor
    }
    @objc func goView(_ sender: UIButton) {
        self.dismiss(animated: false)
    }
    
    @objc func callMethod(){
        self.dismiss(animated: false)
    }
    
}
