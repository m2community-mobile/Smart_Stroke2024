//
//  ChangePwViewController.swift
//  KSR_2024
//
//  Created by m2comm on 2024/01/31.
//

import Foundation
import UIKit
import Alamofire

class ChangePwViewController: UIViewController {
    
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
    
    var originPw: UITextField!
    var newpw: UITextField!
    var reNewpw: UITextField!
    
    var saveBTN: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupKeyboardEvent()
//        self.view.addSubview(UnderBar)
        hideKeyboardWhenTappedAround()
        
        scrollView.keyboardDismissMode = .onDrag
        
        
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
        
        smart.text = "비밀번호 수정"
        smart.textColor = .white
        //        smart.font = UIFont(name: NotoSansCJKkr_Medium, size: 2)
        smart.font = UIFont(name: "SUITE-Regular", size: 20)
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
        
        var pwLabel = UILabel(frame: CGRect(x: 20, y: scrollView.frame.minY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 16))
        pwLabel.text = "기존 비밀번호를 입력해주세요."
        pwLabel.font = UIFont(name: "SUITE-Regular", size: 20)
//        pwLabel.font = UIFont.systemFont(ofSize: 22)
        scrollView.addSubview(pwLabel)
        
        var originalPw = UILabel(frame: CGRect(x: 20, y: pwLabel.frame.maxY + 20, width: 130, height: self.view.frame.size.height / 16))
        originalPw.text = "기존 비밀번호"
        originalPw.font = UIFont(name: "SUITE-Regular", size: 16)
//        originalPw.font = UIFont.systemFont(ofSize: 18)
//        originalPw.layer.borderWidth = 1
        scrollView.addSubview(originalPw)
        
        originPw = UITextField(frame: CGRect(x: originalPw.frame.maxX + 10, y: pwLabel.frame.maxY + 20, width: self.view.frame.size.width - 200, height: originalPw.frame.size.height))
//        originPw.layer.borderWidth = 1
        originPw.isSecureTextEntry = true
        
        originPw.placeholder = "*******"
        originPw.layer.borderWidth = 1
        originPw.layer.cornerRadius = 8
        originPw.layer.borderColor = UIColor(red: 205.0/255.0, green: 205.0/255.0, blue: 205.0/255.0, alpha: 1.0).cgColor
        
        originPw.textColor = #colorLiteral(red: 0.4980392456, green: 0.4980392456, blue: 0.498039186, alpha: 1)
        originPw.leftViewMode = .always
        originPw.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        originPw.font = UIFont(name: "SUITE-Regular", size: 18)
        scrollView.addSubview(originPw)
        
        
        let pwUnderBar = UIView(frame: CGRect(x: 20, y: originalPw.frame.maxY + 20, width: SCREEN.WIDTH - 40, height: 0.5))
        pwUnderBar.backgroundColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1).withAlphaComponent(0.8)
        scrollView.addSubview(pwUnderBar)
        
        var newPwLabel = UILabel(frame: CGRect(x: 20, y: pwUnderBar.frame.maxY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 16))
        newPwLabel.text = "새로운 비밀번호를 입력해주세요."
        newPwLabel.font = UIFont(name: "SUITE-Regular", size: 20)
//        newPwLabel.font = UIFont.systemFont(ofSize: 22)
        scrollView.addSubview(newPwLabel)
        
        var newPw = UILabel(frame: CGRect(x: 20, y: newPwLabel.frame.maxY + 20, width: 130, height: self.view.frame.size.height / 16))
        newPw.text = "비밀번호"
        newPw.font = UIFont(name: "SUITE-Regular", size: 16)
//        newPw.font = UIFont.systemFont(ofSize: 18)
        scrollView.addSubview(newPw)
        
        self.newpw = UITextField(frame: CGRect(x: newPw.frame.maxX + 10, y: newPwLabel.frame.maxY + 20, width: self.view.frame.size.width - 200, height: originalPw.frame.size.height))
        self.newpw.layer.borderWidth = 1
        newpw.placeholder = "*******"
        
        newpw.isSecureTextEntry = true
//        newpw.layer.borderWidth = 1
        newpw.layer.cornerRadius = 8
        newpw.layer.borderColor = UIColor(red: 205.0/255.0, green: 205.0/255.0, blue: 205.0/255.0, alpha: 1.0).cgColor
        
        newpw.textColor = #colorLiteral(red: 0.4980392456, green: 0.4980392456, blue: 0.498039186, alpha: 1)
        newpw.leftViewMode = .always
        newpw.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        newpw.font = UIFont(name: "SUITE-Regular", size: 18)
        
//        newPw.font = UIFont(name: "SUITE-Regular", size: 18)
        scrollView.addSubview(self.newpw)
        
        var newPwCheck = UILabel(frame: CGRect(x: 20, y: newPw.frame.maxY + 20, width: 130, height: self.view.frame.size.height / 16))
        newPwCheck.text = "비밀번호 확인"
        newPwCheck.font = UIFont(name: "SUITE-Regular", size: 16)
//        newPwCheck.font = UIFont.systemFont(ofSize: 18)
        scrollView.addSubview(newPwCheck)
        
        self.reNewpw = UITextField(frame: CGRect(x: newPwCheck.frame.maxX + 10, y: newPw.frame.maxY + 20, width: self.view.frame.size.width - 200, height: originalPw.frame.size.height))
        self.reNewpw.layer.borderWidth = 1
        reNewpw.placeholder = "*******"
        reNewpw.isSecureTextEntry = true
        reNewpw.layer.cornerRadius = 8
        reNewpw.layer.borderColor = UIColor(red: 205.0/255.0, green: 205.0/255.0, blue: 205.0/255.0, alpha: 1.0).cgColor
        
        reNewpw.textColor = #colorLiteral(red: 0.4980392456, green: 0.4980392456, blue: 0.498039186, alpha: 1)
        reNewpw.leftViewMode = .always
        reNewpw.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        
        reNewpw.font = UIFont(name: "SUITE-Regular", size: 18)
        scrollView.addSubview(reNewpw)
        
        
        
        
        if IS_IPHONE_12PRO {
            saveBTN = UIButton(frame: CGRect(x: 0, y: newPwCheck.frame.maxY + 290, width: self.view.frame.size.width, height: 65))
        } else if IS_IPHONE_15PRO {
            saveBTN = UIButton(frame: CGRect(x: 0, y: newPwCheck.frame.maxY + 290, width: self.view.frame.size.width, height: 65))
        } else if IS_IPHONE_N_PLUS {
            saveBTN = UIButton(frame: CGRect(x: 0, y: newPwCheck.frame.maxY + 255, width: self.view.frame.size.width, height: 65))
        } else if IS_IPHONE_N {
            saveBTN = UIButton(frame: CGRect(x: 0, y: newPwCheck.frame.maxY + 210, width: self.view.frame.size.width, height: 65))
        } else if IS_IPHONE_12PRO_MAX {
            saveBTN = UIButton(frame: CGRect(x: 0, y: newPwCheck.frame.maxY + 310, width: self.view.frame.size.width, height: 65))
        } else if IS_IPHONE_15PRO_MAX {
            saveBTN = UIButton(frame: CGRect(x: 0, y: newPwCheck.frame.maxY + 310, width: self.view.frame.size.width, height: 65))
        } else {
            saveBTN = UIButton(frame: CGRect(x: 0, y: newPwCheck.frame.maxY + 240, width: self.view.frame.size.width, height: 65))
        }
        
//        let saveBTN = UIButton(frame: CGRect(x: 20, y: newPwCheck.frame.maxY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 16))
        saveBTN.setTitle("수정", for: .normal)
        saveBTN.titleLabel?.font = UIFont(name: "SUITE-Heavy", size: 20)
        saveBTN.backgroundColor = #colorLiteral(red: 0.1400382817, green: 0.3497706652, blue: 0.5862404704, alpha: 1)
        saveBTN.addTarget(self, action: #selector(change2(_ :)), for: .touchUpInside)
        scrollView.addSubview(saveBTN)
       
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: naviBar.frame.maxY).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: saveBTN.bottomAnchor, constant: 50).isActive = true
    }
    @objc func callMethod(){
        self.dismiss(animated: false)
    }
    
    
    
    @objc func change2(_ sender: UIButton)
    {
        
        
        
        
        
        //post data
        let url = "http://strokedb.or.kr/app_new/passwd_change.asp"
        
        let sid = "\(UserDefaults.standard.object(forKey: "userSid") ?? 0)"
        
        print("\(sid)")
                let pw = originPw.text ?? ""
                let newPw = newpw.text ?? ""
                let reNewpw = reNewpw.text ?? ""
        
                if pw.replacingOccurrences(of: " ", with: "") == "" {
//                    appDel.showAlert(title: "Notice", message: "비밀번호를 입력해주세요.")
                    showToast(message: "비밀번호를 입력해주세요.", font: UIFont.systemFont(ofSize: 15))
                    return
                }
                if newPw.replacingOccurrences(of: " ", with: "") == "" {
//                    appDel.showAlert(title: "Notice", message: "비밀번호를 입력해주세요.")
                    showToast(message: "비밀번호를 입력해주세요.", font: UIFont.systemFont(ofSize: 15))
                    return
                }
                if reNewpw.replacingOccurrences(of: " ", with: "") == "" {
//                    appDel.showAlert(title: "Notice", message: "비밀번호를 입력해주세요.")
                    showToast(message: "비밀번호를 입력해주세요.", font: UIFont.systemFont(ofSize: 15))
                    return
                }
        
                let para = [
                    "user_sid":sid,
                    "old_passwd":pw,
                    "passwd":newPw,
                    "re_passwd":reNewpw
        
                ]
        
        
        
        
        
  
            
        
        
        
        
        
        
        AF.request(url, method: .post, parameters: para, encoding: URLEncoding.default)
            .responseJSON { [self] response in
                
                print("success??")
                print("result\(response)")
                
                
                
                switch response.result {
                case .success(let suc):
                    print("su")
                    
                    
                    guard let result = response.data else {return}
                    
                    do {
                        let decoder = JSONDecoder()
                        let json = try decoder.decode(DataS.self, from: result)
                        
                        print("????\(json.message)")
                        
                        
                        if json.message == "가입이 완료되었습니다." {
                            
                            let vc = FinishJoinViewController()
                            vc.modalPresentationStyle = .fullScreen
                            self.present(vc, animated: false)
                            
                        } else {
                            showToast(message: json.message, font: UIFont.systemFont(ofSize: 15))
                        }
                        
                        showToast(message: json.message, font: UIFont.systemFont(ofSize: 15))
                        
                        
                        //                        toastShow(message: json.message)
                        
                        
                        
                        
                    }
                    catch {
                        print("err \(error)")
                    }
                default:
                    return
                    
                    
                    
                }
                
                
                
                
                
            }
        
        
        
        
    
    
}
    
    
    
    
    @objc func change(_ sender: UIButton) {
//        //post data
//        let url = "http://strokedb.or.kr/app_new/passwd_change.asp"
//        
////        let parameter:Parameters = ["uid" : "235"]
//        
//        let sid = "\(UserDefaults.standard.object(forKey: "sid"))"
//        let pw = originPw.text ?? ""
//        let newPw = newPw.text ?? ""
//        let reNewpw = reNewPw.text ?? ""
//        
//        if pw.replacingOccurrences(of: " ", with: "") == "" {
//            appDel.showAlert(title: "Notice", message: "아이디를 입력해주세요.")
//            return
//        }
//        if newPw.replacingOccurrences(of: " ", with: "") == "" {
//            appDel.showAlert(title: "Notice", message: "비밀번호를 입력해주세요.")
//            return
//        }
//        if reNewpw.replacingOccurrences(of: " ", with: "") == "" {
//            appDel.showAlert(title: "Notice", message: "비밀번호를 입력해주세요.")
//            return
//        }
//        
//        let para = [
//            "user_sid":sid,
//            "old_passwd":pw,
//            "passwd":newPw,
//            "re_passwd":reNewpw
//            
//        ]
//        
//        
//        AF.request(url, method: .post, parameters: para, encoding: URLEncoding.default)
//            .responseJSON { [self] response in
//                print("result\(response)")
//                
//                
//              
//                switch response.result {
//                case .success(let suc):
//                    print("su")
//                   
//                    
//                    
//                    guard let result = response.data else {return}
//                    
//                    do {
//                        let decoder = JSONDecoder()
//                        let json = try decoder.decode(Sid.self, from: result)
//                        
//                     print("????\(json)")
//                        
//                      
//                        
//                        
//                        
//
//                        
//                        let vc = MainViewController()
//                        
//                                                            vc.modalPresentationStyle = .fullScreen
//                                                            self.present(vc, animated: false)
//                        
//                        }
//                    catch {
//                        print("err \(error)")
//                    }
//                default:
//                    return
//                   
//                    
//              
//                }
//                
//                
//        }
        
        
        //        mutipartRequest()
                
                let urlString = "http://strokedb.or.kr/app_new/passwd_change.asp"
                
        let sid = "\(UserDefaults.standard.object(forKey: "userSid") ?? 0)"
        
        print("\(sid)")
                let pw = originPw.text ?? ""
                let newPw = newpw.text ?? ""
                let reNewpw = reNewpw.text ?? ""
        
                if pw.replacingOccurrences(of: " ", with: "") == "" {
                    appDel.showAlert(title: "Notice", message: "아이디를 입력해주세요.")
                    return
                }
                if newPw.replacingOccurrences(of: " ", with: "") == "" {
                    appDel.showAlert(title: "Notice", message: "비밀번호를 입력해주세요.")
                    return
                }
                if reNewpw.replacingOccurrences(of: " ", with: "") == "" {
                    appDel.showAlert(title: "Notice", message: "비밀번호를 입력해주세요.")
                    return
                }
        
                let para = [
                    "user_sid":sid,
                    "old_passwd":pw,
                    "passwd":newPw,
                    "re_passwd":reNewpw
        
                ]
           
                

                
                
                
               
        // 1. 전송할 값 준비

                

                

                let param = "user_sid=\(sid)&old_passwd=\(pw)&passwd=\(newPw)&re_passwd=\(reNewpw)"  // key1=value&key2=value...

                let paramData = param.data(using: .utf8)

                

                // 2. URL 객체 정의

                let url = URL(string: "http://strokedb.or.kr/app_new/passwd_change.asp")

                

                // 3. URLRequest 객체를 정의하고, 요청 내용을 담는다.

                var request = URLRequest(url: url!)

                request.httpMethod = "POST"

                request.httpBody = paramData

                

                // 4. HTTP 메세지 헤더 설정

                request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")

                request.setValue(String(paramData!.count), forHTTPHeaderField: "Content-Length")

                

                // 5. URLSession 객체를 통해 전송 및 응답값 처리 로직 작성

                let task = URLSession.shared.dataTask(with: request) { (data, response, error) in

                    // 5-1. 서버가 응답이 없거나 통신이 실패했을 때

                    if let e = error {

                        NSLog("An error has occurred : \(e.localizedDescription)")

                        return

                    }

                    

                    
                    
                    print("Response Data=\(String(data: data!, encoding: .utf8)!)")
                    
                    
                    

                    // 5-2. 응답 처리 로직이 여기에 들어갑니다.

                    // 1) 메인 스레드에서 비동기로 처리되도록 한다.

                    DispatchQueue.main.async(){ [self] in

                        do {

                            
                            

                        }  catch let DecodingError.dataCorrupted(context) {
                            print(context)
                        } catch let DecodingError.keyNotFound(key, context) {
                            print("Key '\(key)' not found:", context.debugDescription)
                            print("codingPath:", context.codingPath)
                        } catch let DecodingError.valueNotFound(value, context) {
                            print("Value '\(value)' not found:", context.debugDescription)
                            print("codingPath:", context.codingPath)
                        } catch let DecodingError.typeMismatch(type, context)  {
                            print("Type '\(type)' mismatch:", context.debugDescription)
                            print("codingPath:", context.codingPath)
                        } catch {
                            print("error: ", error)
                        }

                    }

         

                }

            // 6. POST 전송

                task.resume()
//        let vc = SettingViewController()
//        //
//                                                                    vc.modalPresentationStyle = .fullScreen
//                                                                    self.present(vc, animated: false)
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
////        let vc = MainViewController()
////
////        vc.modalPresentationStyle = .fullScreen
////        self.present(vc, animated: false)
//
//        let urlString = "http://strokedb.or.kr/app_new/login.asp"
//
//        let id = idTF.text ?? ""
//        let pw = pwTF.text ?? ""
//
//        if id.replacingOccurrences(of: " ", with: "") == "" {
//            appDel.showAlert(title: "Notice", message: "아이디를 입력해주세요.")
//            return
//        }
//        if pw.replacingOccurrences(of: " ", with: "") == "" {
//            appDel.showAlert(title: "Notice", message: "비밀번호를 입력해주세요.")
//            return
//        }
//
//
//        let para = [
//            "user_id":id,
//            "passwd":pw,
//            "device":"IOS",
//            "deviceid":deviceID,
//            "token":token_id
//        ]
//
//        //todo login check
////        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
//        Server.postData(urlString: urlString, otherInfo: para, completion: { (kData : Data?) in
////            hud.hide(animated: true)
//
//
//
//
//            if let data = kData{
//
//
//
//
//                if let dataString = data.toString() {
//                    print("loginDataString : \(dataString)")
//                }
//
//                if let dataDic = data.toJson() as? [String:Any]{
//                    print("->\(dataDic)")
//
//
//
//
//                    if let app_YN = dataDic["message"] as? String{
//                        if app_YN == "성공" {
//
//
//
////                            userD.set(id, forKey: USER_ID)
////                            userD.set(pw, forKey: USER_PW)
//                            userD.synchronize()
//
//                            print("\(user_sid)")
//
//
//
//
//                            saveUserD(jsonDic: dataDic, valueKey: "user_sid", saveKey: USER_SID)
//
//
////                            saveUserD(jsonDic: dataDic, valueKey: "name", saveKey: USER_NAME)
////                            saveUserD(jsonDic: dataDic, valueKey: "office", saveKey: USER_OFFICE)
////                            saveUserD(jsonDic: dataDic, valueKey: "phone", saveKey: USER_PHONE)
////                            saveUserD(jsonDic: dataDic, valueKey: "email", saveKey: USER_EMAIL)
////                            saveUserD(jsonDic: dataDic, valueKey: "app_YN", saveKey: USER_APP_YN)
////                            saveUserD(jsonDic: dataDic, valueKey: "research_YN", saveKey: USER_RESEARCH_YN)
////                            saveUserD(jsonDic: dataDic, valueKey: "signdate", saveKey: USER_SIGNDATE)
////                            saveUserD(jsonDic: dataDic, valueKey: "gubun", saveKey: USER_GUBUN)
//
//
//
////                            sceneDel!.mainVC = MainViewController()
////                            self.navigationController?.pushViewController(sceneDel!.mainVC!, animated: true)
//                            let vc = MainViewController()
//
//                                    vc.modalPresentationStyle = .fullScreen
//                                    self.present(vc, animated: false)
//                            return
//                        }
//                        appDel.showAlert(title: "Notice", message: "승인이 필요한 아이디입니다.")
//                        return
//                    }
//                }
//
//
//            }
//            appDel.showAlert(title: "Notice", message: "로그인에 실패하였습니다.")
//            return
//        })
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
        UIView.animate(withDuration: 0.8, delay: 0.1, options: .curveEaseOut, animations: {
                 toastLabel.alpha = 0.0
            }, completion: {(isCompleted) in
                toastLabel.removeFromSuperview()
            })
        }
    
}
