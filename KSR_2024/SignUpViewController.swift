//
//  SignUpViewController.swift
//  KSR_2024
//
//  Created by m2comm on 2024/01/05.
//

import Foundation
import UIKit
import Alamofire

class SignUpViewController: UIViewController {
    
    var selected = true
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
    
    var naviBar : UIView!
    
    var titleLabel: UILabel!
    
    var idView: UIView!
    var idTF: UITextField!
    var pwTF: UITextField!
    var rePWTF: UITextField!
    
    var mailView: UIView!
    var mailTF: UITextField!
    var rhfqoddl: UILabel!
    var whatMailTF: UITextField!
    var hospitalTF: UITextField!
    var birthdayTF: UITextField!
    var woman: UIButton!
    var man: UIButton!
    var arrBTN: [UIButton]!
    
    var ksrView: UIView!
    var ksrLabel: UILabel!
    var ksrTF: UITextField!
    
    var finishBTN: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupKeyboardEvent()
        
        hideKeyboardWhenTappedAround()
        
        
        self.view.backgroundColor = .white
        
        scrollView.backgroundColor = #colorLiteral(red: 0.8980109096, green: 0.9129031301, blue: 0.9510228038, alpha: 1)
        scrollView.isExclusiveTouch = false
        scrollView.delaysContentTouches = false
        
        setupUI()
        
        hideKeyboardWhenTappedAround()
        
        
    }
    
    
    
    func setupUI() {
        
        let statusBar = UIView(frame: CGRect(x: 0, y: 0, width: SCREEN.WIDTH, height: STATUS_BAR_HEIGHT))
        statusBar.backgroundColor = #colorLiteral(red: 0.9607209563, green: 0.9720876813, blue: 0.9933047891, alpha: 1)
        
        
        self.view.addSubview(statusBar)
        
        naviBar = UIView(frame: CGRect(x: 0, y: statusBar.frame.maxY, width: SCREEN.WIDTH, height: 50))
        naviBar.backgroundColor = #colorLiteral(red: 0.9607209563, green: 0.9720876813, blue: 0.9933047891, alpha: 1)
        self.view.addSubview(naviBar)
        
        titleLabel = UILabel(frame: CGRect(x: self.view.frame.size.width / 2.5, y: 10, width: self.view.frame.size.width, height: 30))
        titleLabel.text = "회원 가입"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 25)
//        titleLabel.font = UIFont.systemFont(ofSize: 25)
        naviBar.addSubview(titleLabel)
        
        
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
        
        
        
        
        self.view.addSubview(scrollView)
        
//        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: naviBar.frame.maxY).isActive = true
//        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//        scrollView.heightAnchor.constraint(equalToConstant: 1000).isActive = true
        
//                  scrollView.addSubview(labelOne)
//
//                  labelOne.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 40).isActive = true
//                  labelOne.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 40).isActive = true
        
        
        
        idView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 270))
        idView.backgroundColor = #colorLiteral(red: 0.9607209563, green: 0.9720876813, blue: 0.9933047891, alpha: 1)
        scrollView.addSubview(idView)
        
        idTF = UITextField(frame: CGRect(x: 30, y: 60, width: self.view.frame.size.width - 60, height: 50))
        idTF.placeholder = "  아이디"
        idTF.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        idTF.leftViewMode = .always
        idTF.layer.borderWidth = 0.3
        idTF.layer.borderColor = UIColor.lightGray.cgColor
        idTF.font = UIFont(name: "SUITE-Regular", size: 18)
        idTF.layer.cornerRadius = 8
        idTF.backgroundColor = .white
        idView.addSubview(idTF)
        
        
        
       
        
        
        pwTF = UITextField(frame: CGRect(x: 30, y: idTF.frame.maxY + 15, width: self.view.frame.size.width - 60, height: 50))
        pwTF.placeholder = "  비밀번호"
        pwTF.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        pwTF.leftViewMode = .always
        pwTF.layer.borderWidth = 0.3
        pwTF.layer.borderColor = UIColor.lightGray.cgColor
        pwTF.font = UIFont(name: "SUITE-Regular", size: 18)
        pwTF.layer.cornerRadius = 8
        pwTF.backgroundColor = .white
        idView.addSubview(pwTF)
        
        rePWTF = UITextField(frame: CGRect(x: 30, y: pwTF.frame.maxY + 15, width: self.view.frame.size.width - 60, height: 50))
        rePWTF.placeholder = "  비밀번호 재확인"
        rePWTF.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        rePWTF.leftViewMode = .always
        rePWTF.layer.borderWidth = 0.3
        rePWTF.layer.borderColor = UIColor.lightGray.cgColor
        rePWTF.font = UIFont(name: "SUITE-Regular", size: 18)
        rePWTF.layer.cornerRadius = 8
        rePWTF.backgroundColor = .white
        idView.addSubview(rePWTF)
        
        mailView = UIView(frame: CGRect(x: 0, y: idView.frame.maxY + 20, width: self.view.frame.width, height: 320))
        mailView.backgroundColor = #colorLiteral(red: 0.9608027339, green: 0.9680920243, blue: 0.9934886098, alpha: 1)
        scrollView.addSubview(mailView)
        
        mailTF = UITextField(frame: CGRect(x: 30, y: 25, width: self.view.frame.width / 4, height: 50))
        mailTF.placeholder = "  이메일"
        mailTF.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        mailTF.leftViewMode = .always
        mailTF.layer.borderWidth = 0.3
        mailTF.layer.borderColor = UIColor.lightGray.cgColor
        mailTF.font = UIFont(name: "SUITE-Regular", size: 18)
        mailTF.layer.cornerRadius = 8
        mailTF.backgroundColor = .white

        mailView.addSubview(mailTF)
        
        rhfqoddl = UILabel(frame: CGRect(x: mailTF.frame.maxX + 10, y: mailTF.frame.size.height / 1.4, width: 20, height: 20))
        rhfqoddl.text = "@"
        rhfqoddl.textColor = #colorLiteral(red: 0.8234431148, green: 0.8349180818, blue: 0.8519154787, alpha: 1)
        mailView.addSubview(rhfqoddl)
        
        
        if IS_IPHONE_X {
            whatMailTF = UITextField(frame: CGRect(x: mailTF.frame.maxX + 38, y: 25, width: self.view.frame.width / 2 - 5, height: 50))
        } else {
            whatMailTF = UITextField(frame: CGRect(x: mailTF.frame.maxX + 45, y: 25, width: self.view.frame.width / 2, height: 50))
        }
        whatMailTF.placeholder = ""
        whatMailTF.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        whatMailTF.leftViewMode = .always
        whatMailTF.layer.borderWidth = 0.3
        whatMailTF.layer.borderColor = UIColor.lightGray.cgColor
        whatMailTF.layer.cornerRadius = 8
        whatMailTF.backgroundColor = .white
        mailView.addSubview(whatMailTF)
        
        hospitalTF = UITextField(frame: CGRect(x: 30, y: mailTF.frame.maxY + 15, width: self.view.frame.size.width - 60, height: 50))
        hospitalTF.placeholder = "  내원하는 병원"
        hospitalTF.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        hospitalTF.leftViewMode = .always
        hospitalTF.layer.borderWidth = 0.3
        hospitalTF.layer.borderColor = UIColor.lightGray.cgColor
        hospitalTF.font = UIFont(name: "SUITE-Regular", size: 18)
        hospitalTF.layer.cornerRadius = 8
        hospitalTF.backgroundColor = .white
        mailView.addSubview(hospitalTF)
        
        birthdayTF = UITextField(frame: CGRect(x: 30, y: hospitalTF.frame.maxY + 15, width: self.view.frame.size.width - 60, height: 50))
        birthdayTF.placeholder = "  생년원일"
        birthdayTF.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        birthdayTF.leftViewMode = .always
        birthdayTF.layer.borderWidth = 0.3
        birthdayTF.layer.borderColor = UIColor.lightGray.cgColor
        birthdayTF.font = UIFont(name: "SUITE-Regular", size: 18)
        birthdayTF.layer.cornerRadius = 8
        birthdayTF.backgroundColor = .white
        mailView.addSubview(birthdayTF)
        
//        woman = UIButton(frame: CGRect(x: 0, y: birthdayTF.frame.maxY + 15, width: self.view.frame.size.width / 2.5, height: 50))
//        woman.setTitle("여자", for: .normal)
//        woman.layer.borderWidth = 1
//        woman.layer.cornerRadius = 8
//        mailTF.addSubview(woman)
//        
//        man = UIButton(frame: CGRect(x: woman.frame.maxX + 25, y: birthdayTF.frame.maxY + 15, width: self.view.frame.size.width / 2.5, height: 50))
//        man.setTitle("남자", for: .normal)
//        man.layer.borderWidth = 1
//        man.layer.cornerRadius = 8
//        mailTF.addSubview(man)
        
        woman = UIButton(frame: CGRect(x: 30, y: birthdayTF.frame.maxY + 10, width: self.view.frame.size.width / 2.5, height: 50))
        woman.setTitle(" 여자", for: .normal)
        woman.layer.cornerRadius = 8
        woman.backgroundColor = #colorLiteral(red: 0.8938891292, green: 0.9134108424, blue: 0.9262667298, alpha: 1)
        woman.setTitleColor(UIColor(red: 0.7011209726, green: 0.7713823915, blue: 0.8184124827, alpha: 1), for: .normal)
        woman.contentHorizontalAlignment = .center
//        woman.titleLabel?.font = UIFont.systemFont(ofSize: 11)
        woman.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
//        woman.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
        woman.tag = 0
        
        //        womanBTN.setImage(UIImage(named: "id"), for: .normal)
//        womanBTN.addTarget(self, action: #selector(test(_ :)), for: .touchUpInside)
        mailView.addSubview(woman)
        
        if IS_IPHONE_X {
            man = UIButton(frame: CGRect(x: woman.frame.maxX + 19, y: birthdayTF.frame.maxY + 10, width: self.view.frame.size.width / 2.5, height: 50))
        } else {
            man = UIButton(frame: CGRect(x: woman.frame.maxX + 25, y: birthdayTF.frame.maxY + 10, width: self.view.frame.size.width / 2.5, height: 50))
        }
//        man = UIButton(frame: CGRect(x: woman.frame.maxX + 25, y: birthdayTF.frame.maxY + 10, width: self.view.frame.size.width / 2.5, height: 50))
        man.setTitle(" 남성", for: .normal)
        man.backgroundColor = #colorLiteral(red: 0.8938891292, green: 0.9134108424, blue: 0.9262667298, alpha: 1)
        man.layer.cornerRadius = 8
        
        man.setTitleColor(UIColor(red: 0.7011209726, green: 0.7713823915, blue: 0.8184124827, alpha: 1), for: .normal)
        man.contentHorizontalAlignment = .center
//        man.titleLabel?.font = UIFont.systemFont(ofSize: 11)
        man.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
//        man.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
        man.tag = 1
        
        //        womanBTN.setImage(UIImage(named: "id"), for: .normal)
//        menBTN.addTarget(self, action: #selector(test(_ :)), for: .touchUpInside)
        mailView.addSubview(man)
        
        arrBTN = [woman, man]
        
        self.arrBTN.forEach {
            $0.addTarget(self, action: #selector(test(_ :)), for: .touchUpInside)
            
        }
        
        
        
        ksrView = UIView(frame: CGRect(x: 0, y: mailView.frame.maxY + 20, width: self.view.frame.width, height: 280))
        ksrView.backgroundColor = #colorLiteral(red: 0.9568224549, green: 0.9680797458, blue: 0.9935145974, alpha: 1)
        scrollView.addSubview(ksrView)
        
        ksrLabel = UILabel(frame: CGRect(x: 30, y: 35, width: self.view.frame.size.width, height: 30))
        ksrLabel.text = "KSR번호를 입력해주세요."
        ksrLabel.textColor = .black
        ksrLabel.font = UIFont.boldSystemFont(ofSize: 20)
//        ksrLabel.font = UIFont.systemFont(ofSize: 20)
        ksrView.addSubview(ksrLabel)
        
        ksrTF = UITextField(frame: CGRect(x: 30, y: ksrLabel.frame.maxY + 15, width: self.view.frame.size.width - 60, height: 50))
        ksrTF.placeholder = "  KSR 등록번호"
        ksrTF.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        ksrTF.leftViewMode = .always
        ksrTF.layer.borderWidth = 0.3
        ksrTF.layer.borderColor = UIColor.lightGray.cgColor
        ksrTF.font = UIFont(name: "SUITE-Regular", size: 18)
        ksrTF.layer.cornerRadius = 8
        ksrTF.backgroundColor = .white
        ksrView.addSubview(ksrTF)
        
        finishBTN = UIButton(frame: CGRect(x: 30, y: ksrTF.frame.maxY + 30, width: self.view.frame.size.width - 60, height: 70))
        finishBTN.backgroundColor = #colorLiteral(red: 0.1858712435, green: 0.2547165453, blue: 0.5034641623, alpha: 1)
        finishBTN.setTitle("회원가입 완료", for: .normal)
        finishBTN.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        finishBTN.layer.borderWidth = 1
        finishBTN.layer.cornerRadius = 8
        finishBTN.addTarget(self, action: #selector(join(_ :)), for: .touchUpInside)
        ksrView.addSubview(finishBTN)
        
        
     
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: naviBar.frame.maxY).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: finishBTN.bottomAnchor, constant: 200).isActive = true
        scrollView.heightAnchor.constraint(equalToConstant: 1000).isActive = true
        
        scrollView.addSubview(labelTwo)
        labelTwo.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 40).isActive = true
        labelTwo.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 1300).isActive = true
        labelTwo.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -40).isActive = true
        
        
        
    }
    
    @objc func join(_ sender: UIButton) {
//        mutipartRequest()
        
        let urlString = "http://strokedb.or.kr/app_new/user_regist.asp"
        
        let para = ["user_id" : idTF.text!,
                    "passwd" : pwTF.text!,
                    "re_passwd" : rePWTF.text!,
                    "email1" : mailTF.text!,
                    "email2" : whatMailTF.text!,
                    "hospital" : hospitalTF.text!,
                    "birth" : birthdayTF.text!,
                    "sex" : "F",
//                                                   "img" : self.photoImage.image?.jpegData(compressionQuality: 1)!,
                    "reg_num" : ""]
        
   
        
        
//        UserDefaults.standard.setValue(idTF.text, forKey: "id")
//        UserDefaults.standard.setValue(mailTF, forKey: "mail1")
//        UserDefaults.standard.setValue(mailTF, forKey: "mail2")
//        UserDefaults.standard.setValue(hospitalTF, forKey: "hos")
//        UserDefaults.standard.setValue(birthdayTF, forKey: "bir")
//        UserDefaults.standard.setValue("F", forKey: "sex")
//        UserDefaults.standard.setValue("", forKey: "reg")
        
        
        
        Server.postData(urlString: urlString, otherInfo: para) { [weak self] (kData : Data?) in
            guard let self = self else { return }
            if let data = kData {
                let dataString = data.toString() ?? ""
                print("sighUp resultDataString : \(dataString)")
                let dataArray = dataString.components(separatedBy: ":")
              
                appDel.showAlert(title: "Notice", message: dataString)
                return
                
                
                
                let vc = FinishJoinViewController()

                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: false)
                
            }
            appDel.showAlert(title: "Notice", message: "네트워크 에러가 발생했습니다. 다시한번 시도해주세요.")
            return
        }
        
        let vc = FinishJoinViewController()

        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false)
        
        
        
        print("success")
        
        
        
    }
    
    @objc func test(_ sender: UIButton) {
        print("\(sender.tag)")
        
        self.arrBTN.forEach {
            if $0.tag == sender.tag {
//                $0.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
                $0.backgroundColor = #colorLiteral(red: 0.04341550916, green: 0.639064908, blue: 0.9187603593, alpha: 1)
                $0.setTitleColor(.white, for: .normal)
                
            } else {
//                $0.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
                $0.backgroundColor = #colorLiteral(red: 0.8938891292, green: 0.9134108424, blue: 0.9262667298, alpha: 1)
                $0.setTitleColor(UIColor(red: 0.7011209726, green: 0.7713823915, blue: 0.8184124827, alpha: 1), for: .normal)
            }
        }
    }
    
    @objc func callMethod(){
        self.dismiss(animated: false)
        
    }
    
    func mutipartRequest(){
           
           /*
           // -----------------------------------------
           [mutipartRequest 메소드 설명]
           // -----------------------------------------
           1. 사전 spm 매니저 사용해 Alamofire 라이브러리 설치 필요 :
              https://github.com/Alamofire/Alamofire
           // -----------------------------------------
           2. http 허용 info plist : App Transport Security Settings >> Allow Arbitrary Loads >> YES
           // -----------------------------------------
           3. import 추가 : import Alamofire
           // -----------------------------------------
           */
           
           
           // [http 요청 주소 지정]
           let url = "http://strokedb.or.kr/app_new/user_regist.asp"
           
           
           // [http 요청 헤더 지정]
           let header : HTTPHeaders = [
               "Content-Type" : "multipart/form-data"
           ]
           
           
           // [http 요청 파라미터 지정 실시]
           let params : Dictionary<String, Any> = ["user_id" : idTF.text!,
                                                   "passwd" : pwTF.text!,
                                                   "re_passwd" : rePWTF.text!,
                                                   "email1" : mailTF.text!,
                                                   "email2" : whatMailTF.text!,
                                                   "hospital" : hospitalTF.text!,
                                                   "birth" : birthdayTF.text!,
                                                   "sex" : "F",
//                                                   "img" : self.photoImage.image?.jpegData(compressionQuality: 1)!,
                                                   "reg_num" : ""]
        
           
           // [http 요청 수행 실시]
           print("")
           print("====================================")
//           print("[\(self.ACTIVITY_NAME) >> mutipartRequest() :: Post 멀티 파트 사진 업로드 요청 실시]")
           print("-------------------------------")
           print("주 소 :: ", url)
           print("-------------------------------")
           print("데이터 :: ", params.description)
           print("====================================")
           print("")
           
           AF.upload(multipartFormData: { multiPart in
               for (key, value) in params {
                   if "\(key)" != "img" { // [일반 파라미터 인 경우]
                       if let strData = value as? String {
                           multiPart.append(strData.data(using: .utf8)!, withName: key)
                       }
                       if let intData = value as? Int {
                           multiPart.append("\(intData)".data(using: .utf8)!, withName: key)
                       }
                   }
                   else { // [이미지 파일 인 경우]
                       let uuidName = UUID().uuidString
                       
                       
                       multiPart.append(value as! Data, withName: "\(key)", fileName: "\(uuidName ?? "").png", mimeType: "image/jpeg")
                   }
               }
           }, to: url, method: .post, headers: header)
           .uploadProgress(queue: .main, closure: { progress in
               print("")
               print("====================================")
//               print("[\(self.ACTIVITY_NAME) >> mutipartRequest() :: Post 멀티 파트 사진 업로드 상태 확인]")
               
               print("-------------------------------")
               print("progress :: ", progress.fractionCompleted)
               print("====================================")
               print("")
               
           })
           .validate(statusCode: 200..<300)
           .responseData { response in
               switch response.result {
               case .success(let res):
                   do {
                       print("")
                       print("====================================")
//                       print("[\(self.ACTIVITY_NAME) >> mutipartRequest() :: Post 멀티 파트 사진 업로드 응답 확인]")
                       print("-------------------------------")
                       print("응답 코드 :: ", response.response?.statusCode ?? 0)
                       print("-------------------------------")
                       print("응답 데이터 :: ", String(data: res, encoding: .utf8) ?? "")
                       print("====================================")
                       print("")
                       
                       let alert = UIAlertController(title: "알림", message: "\(String(data: res, encoding: .utf8) ?? "")", preferredStyle: .alert)
                       alert.addAction(UIAlertAction(title: "확인", style: .default) { action in
                         //처리...
                       })
                       self.present(alert, animated: true, completion: nil)
                       
                       // [비동기 작업 수행]
                       DispatchQueue.main.async {
                           
                       }
                   }
                   catch (let err){
                       print("")
                       print("====================================")
//                       print("[\(self.ACTIVITY_NAME) >> mutipartRequest() :: Post 멀티 파트 사진 업로드 응답 확인]")
                       print("-------------------------------")
                       print("catch :: ", err.localizedDescription)
                       print("====================================")
                       print("")
                   }
                   break
               case .failure(let err):
                   print("")
                   print("====================================")
//                   print("[\(self.ACTIVITY_NAME) >> mutipartRequest() :: Post 멀티 파트 사진 업로드 요청 실패]")
                   print("-------------------------------")
                   print("응답 코드 :: ", response.response?.statusCode ?? 0)
                   print("-------------------------------")
                   print("에 러 :: ", err.localizedDescription)
                   print("====================================")
                   print("")
                   break
               }
           }
       }
    
    func setupKeyboardEvent() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    
//    @objc func keyboardWillShow(_ sender: Notification) {
//        // 현재 동작하고 있는 이벤트에서 키보드의 frame을 받아옴
//        guard let keyboardFrame = sender.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
//        let keyboardHeight = keyboardFrame.cgRectValue.height
//
//        // ⭐️ 이 조건을 넣어주지 않으면, 각각의 텍스트필드마다 keyboardWillShow 동작이 실행되므로 아래와 같은 현상이 발생
//        if view.frame.origin.y == 0 {
//            view.frame.origin.y -= keyboardHeight
//        }
//    }
    @objc func keyboardWillShow(_ sender: Notification) {
        // keyboardFrame: 현재 동작하고 있는 이벤트에서 키보드의 frame을 받아옴
        // currentTextField: 현재 응답을 받고있는 UITextField를 알아냅니다.
        guard let keyboardFrame = sender.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue,
              let currentTextField = UIResponder.currentResponder as? UITextField else { return }
        
        // Y축으로 키보드의 상단 위치
        let keyboardTopY = keyboardFrame.cgRectValue.origin.y
        // 현재 선택한 텍스트 필드의 Frame 값
        let convertedTextFieldFrame = view.convert(currentTextField.frame,
                                                  from: currentTextField.superview)
        // Y축으로 현재 텍스트 필드의 하단 위치
        let textFieldBottomY = convertedTextFieldFrame.origin.y + convertedTextFieldFrame.size.height
        
        // Y축으로 텍스트필드 하단 위치가 키보드 상단 위치보다 클 때 (즉, 텍스트필드가 키보드에 가려질 때가 되겠죠!)
        if textFieldBottomY > keyboardTopY {
            let textFieldTopY = convertedTextFieldFrame.origin.y
            // 노가다를 통해서 모든 기종에 적절한 크기를 설정함.
            let newFrame = textFieldTopY - keyboardTopY/1.6
            view.frame.origin.y -= newFrame
        }
    }

    @objc func keyboardWillHide(_ sender: Notification) {
        if view.frame.origin.y != 0 {
            view.frame.origin.y = 0
        }
    }
    
}
