//
//  SettingViewController.swift
//  KSR_2024
//
//  Created by m2comm on 2024/02/09.
//

import Foundation
import UIKit
import UserNotifications
import Alamofire


struct MyInfo: Codable {
    var result: Int
    var data: MyInfoDetail
    var message: String
}

struct MyInfoDetail: Codable {
    
    var birth: String
    var email1: String
    var email2: String
    var hospital: String
    var reg_num: String?
    var sex: String
    var user_id: String
    var user_sid: String
    
    enum CodingKeys: String, CodingKey{
            case birth = "birth"
            case email1 = "email1"
            case email2 = "email2"
            case hospital = "hospital"
            case reg_num = "reg_num"
            case sex = "sex"
            case user_id = "user_id"
        case user_sid = "user_sid"
        }
    
    
    
    
}








class SettingViewController: UIViewController {
    
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
    
    let settingVCBackgroundColor = #colorLiteral(red: 0.9568627451, green: 0.9568627451, blue: 0.9568627451, alpha: 1)
    let settingVCContentBackgroundColor = #colorLiteral(red: 0.8990827203, green: 0.9138795733, blue: 0.9482942224, alpha: 1)
    let settingVCSeparatorColor = #colorLiteral(red: 0.8666666667, green: 0.8666666667, blue: 0.8666666667, alpha: 1)
    let mainColor = #colorLiteral(red: 0.149019607843137, green: 0.215686274509804, blue: 0.46666666666667, alpha: 1)
    
    var pushSettingView : ViewSwitchType!
    
    var changeMyInfo: UIButton!
    var changePW: UIButton!
    
    
    var footer: UIView!
    var testButton : UIButton!
    
    var myId = ""
    
    
    
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
        
        let smart = UILabel(frame: CGRect(x: self.view.frame.size.width / 2.2, y: 0, width: 120, height: naviBar.frame.height))
        
        naviBar.addSubview(smart)
        
        

        
        smart.text = "설정"
        //        smart.font = UIFont(name: NotoSansCJKkr_Medium, size: 2)
//        smart.font = UIFont.systemFont(ofSize: 22)
        smart.font = UIFont(name: "SUITE-Regular", size: 20)

        
        self.view.addSubview(scrollView)
        
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
        
        
        changeMyInfo = UIButton(frame: CGRect(x: 20, y: self.naviBar.frame.maxY, width: SCREEN.WIDTH - 20, height: self.view.frame.size.height / 14))
        changeMyInfo.setTitle("회원정보 수정", for: .normal)
        changeMyInfo.setTitleColor(.black, for: .normal)
        changeMyInfo.contentHorizontalAlignment = .left
        changeMyInfo.addTarget(self, action: #selector(goInfo(_ :)), for: .touchUpInside)
        
        changeMyInfo.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        changeMyInfo.tintColor = .black
        changeMyInfo.semanticContentAttribute = .forceRightToLeft
        if IS_IPHONE_X {
            changeMyInfo.imageEdgeInsets = UIEdgeInsets(top: 0, left: 220, bottom: 0, right: 0)
        } else {
            changeMyInfo.imageEdgeInsets = UIEdgeInsets(top: 0, left: 260, bottom: 0, right: 0)
        }
        
//        changeMyInfo.layer.borderWidth = 1
        self.view.addSubview(changeMyInfo)
        
        changePW = UIButton(frame: CGRect(x: 20, y: self.changeMyInfo.frame.maxY, width: SCREEN.WIDTH - 20, height: self.view.frame.size.height / 14))
        changePW.setTitle("비밀번호 수정", for: .normal)
        changePW.setTitleColor(.black, for: .normal)
        changePW.contentHorizontalAlignment = .left
        changePW.addTarget(self, action: #selector(goPw(_ :)), for: .touchUpInside)
        
        changePW.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        changePW.tintColor = .black
        changePW.semanticContentAttribute = .forceRightToLeft
        if IS_IPHONE_X {
            changePW.imageEdgeInsets = UIEdgeInsets(top: 0, left: 220, bottom: 0, right: 0)
        } else {
            changePW.imageEdgeInsets = UIEdgeInsets(top: 0, left: 260, bottom: 0, right: 0)
        }
//        changePW.layer.borderWidth = 1
        self.view.addSubview(changePW)
        
        
        let separatorView1 = UIView(frame: CGRect(x: 0, y: self.changePW.frame.maxY + 20, width: SCREEN.WIDTH, height: 1))
        separatorView1.backgroundColor = settingVCSeparatorColor
        separatorView1.layer.borderWidth = 0
        self.view.addSubview(separatorView1)
        
        ////
        var viewTextTypeFontSize : CGFloat = 17
        if IS_IPHONE_X {
            viewTextTypeFontSize = 16
        }
        if IS_IPHONE_N_PLUS {
            viewTextTypeFontSize = 16
        }
        if IS_IPHONE_N {
            viewTextTypeFontSize = 16
        }
        if IS_IPHONE_SE {
            viewTextTypeFontSize = 16
        }

        let noticeView1Text = "실시간 Push 알림을 받아 보실 수 있습니다."
        let noticeView2Text = "IOS사용자는 Push 알림이 오지 않을 경우\n아이폰> 설정> 알림 KSR 알림 허용을 'ON'으로\n변경해 주십시오."
        
        let noticeView1 = ViewTextType(frame: CGRect(x: 20, y: separatorView1.frame.maxY + 10, width: SCREEN.WIDTH, height: 300), text: noticeView1Text, fontSize: viewTextTypeFontSize)
        
        self.view.addSubview(noticeView1)
        
        let separatorView2 = UIView(frame: CGRect(x: 0, y: noticeView1.frame.maxY, width: SCREEN.WIDTH, height: 1))
        separatorView2.backgroundColor = settingVCSeparatorColor
        self.view.addSubview(separatorView2)
        
        pushSettingView = ViewSwitchType(itemName: "PUSH", tintColor:mainColor)
        pushSettingView.frame.origin.y = separatorView2.frame.maxY
        pushSettingView.backgroundColor = settingVCContentBackgroundColor
        
        pushSettingView.onOffButton.addTarget(self, action: #selector(pushChange), for: .valueChanged)
        self.view.addSubview(pushSettingView)
        
        let separatorView3 = UIView(frame: CGRect(x: 0, y: pushSettingView.frame.maxY, width: SCREEN.WIDTH, height: 1))
        separatorView3.backgroundColor = settingVCSeparatorColor
        self.view.addSubview(separatorView3)
        
        
        let noticeView2 = ViewTextType(frame: CGRect(x: 20, y: separatorView3.frame.maxY + 10, width: SCREEN.WIDTH, height: 500), text: noticeView2Text, fontSize: viewTextTypeFontSize)
        self.view.addSubview(noticeView2)
        
        let separatorView4 = UIView(frame: CGRect(x: 0, y: noticeView2.frame.maxY, width: SCREEN.WIDTH, height: 1))
        separatorView4.backgroundColor = settingVCSeparatorColor
        self.view.addSubview(separatorView4)
        
        let appVersionView = ViewAppVersionType(itemName: "App Version", tintColor: mainColor)
        appVersionView.frame.origin.y = separatorView4.frame.maxY
        appVersionView.backgroundColor = settingVCContentBackgroundColor
        self.view.addSubview(appVersionView)
        
        let separatorView5 = UIView(frame: CGRect(x: 0, y: appVersionView.frame.maxY, width: SCREEN.WIDTH, height: 1))
        separatorView5.backgroundColor = settingVCSeparatorColor
        
        self.view.addSubview(separatorView5)
        
        NotificationCenter.default.addObserver(forName: UIApplication.didBecomeActiveNotification, object: nil, queue: OperationQueue.main) { (noti : Notification) in
            self.pushInfoUpdate()
        }
        
        let hiddenView = UIView(frame: CGRect(x: 0, y: 0, width: appVersionView.currentVersionLabel.frame.width, height: appVersionView.frame.height))
        hiddenView.center = appVersionView.currentVersionLabel.center
//        hiddenView.backgroundColor = UIColor.red.withAlphaComponent(0.5)
        appVersionView.addSubview(hiddenView)
        
        let hiddenGesture = UITapGestureRecognizer(target: self, action: #selector(hiddenGestureFunc))
        hiddenGesture.numberOfTapsRequired = 10
        hiddenView.addGestureRecognizer(hiddenGesture)
        
        
        footer = UIView(frame: CGRect(x: 0, y: self.view.frame.maxY - 80, width: self.view.frame.width, height: 80))
        footer.backgroundColor = .black
        self.view.addSubview(footer)
        
        testButton = UIButton(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: footer.frame.height))
        
        testButton.setTitle("Logout", for: .normal)
        testButton.setTitleColor(.white, for: .normal)

        testButton.backgroundColor = #colorLiteral(red: 0.1644907892, green: 0.1876278222, blue: 0.2131153941, alpha: 1)
        testButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
//        testButton.addTarget(self, action: #selector(go(_ :)), for: .touchUpInside)
        footer.addSubview(testButton)
        
        testButton.addTarget(self, action: #selector(logout(_ :)), for: .touchUpInside)
        


    }
    
    @objc func logout(_ sender: UIButton) {
                UserDefaults.standard.set(false, forKey: "isUserLoggedIn")
                    UserDefaults.standard.synchronize()
        
        self.view.window?.rootViewController?.dismiss(animated: false, completion: {
          let homeVC = ViewController()
          homeVC.modalPresentationStyle = .fullScreen
          let appDelegate = UIApplication.shared.delegate as! AppDelegate
          appDelegate.window?.rootViewController?.present(homeVC, animated: true, completion: nil)
        })
        
        
        print("logout: \(UserDefaults.standard.set(false, forKey: "isUserLoggedIn"))")
    }
    
    
    @objc func callMethod(){
        self.dismiss(animated: false)
    }

    @objc func hiddenGestureFunc(){
        print("hiddenGestureFunc")
//        goHiddenVC()
    }
    
    @objc func goInfo(_ sender: UIButton) {
        
    print("내 정보 가져오기")
//    //        mutipartRequest()
//            
//            let urlString = "http://strokedb.or.kr/app_new/get_regist_user.asp"
//            
//        
//        print("sid-->\(UserDefaults.standard.object(forKey: "sid") ?? "")")
//        let para = ["user_sid" : "\(UserDefaults.standard.object(forKey: "sid") ?? "")",
//                        ]
//            
//       
//            
//            
//
//            
//            
//            
//            Server.postData(urlString: urlString, otherInfo: para) { [weak self] (kData : Data?) in
//                guard let self = self else { return }
//                if let data = kData {
//                    let dataString = data.toString() ?? ""
//                    print("sighUp resultDataString : \(dataString)")
//                    let dataArray = dataString.components(separatedBy: ":")
//                  
//                    appDel.showAlert(title: "Notice", message: dataString)
//                    return
//                }
//                appDel.showAlert(title: "Notice", message: "네트워크 에러가 발생했습니다. 다시한번 시도해주세요.")
//                return
//            }
//            
//            
//            
//            print("success")
            
            
            
//        AF.request("http://strokedb.or.kr/app_new/get_regist_user.asp",method: .post, parameters: ["user_sid": "\(UserDefaults.standard.object(forKey: "sid") ?? "")"])
//                .validate(contentType: ["application/x-www-form-urlencoded"])
//                .responseJSON { (response) in
//
//                    print(response.data?.toJson())
////여기
//               
//            }
        
        
//        let headers : HTTPHeaders = [
//            "Authorization": "Basic MY-API-KEY",
//            "Content-Type" : "application/x-www-form-urlencoded"
//        ]
//        let parameters = ["user_sid" : "\(UserDefaults.standard.object(forKey: "sid") ?? "")"]
//
//        AF.request("http://strokedb.or.kr/app_new/get_regist_user.asp", method: .post, parameters: parameters, encoding:  URLEncoding.httpBody, headers: headers).responseJSON { (response:DataResponse) in
//
//            switch(response.result) {
//            case.success(let data):
//                print("success",data)
//                
//  
//                
//
//                
//                
//        
//            case.failure(let error):
//                print("Not Success",error)
////                self.view.makeToast(message: "Server Error!!")
//                
//            default:
//                return
//                
//            }
//
//        }
        
        
        
        // 1. 전송할 값 준비

                

                let sid = (UserDefaults.standard.object(forKey: "sid") ?? "")

                let param = "user_sid=\(sid)"  // key1=value&key2=value...

                let paramData = param.data(using: .utf8)

                

                // 2. URL 객체 정의

                let url = URL(string: "http://strokedb.or.kr/app_new/get_regist_user.asp")

                

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

                            let object = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary

                            guard let jsonObject = object else { return }

                            //let jsonData = try JSONDecoder().decode(MyInfoDetail.self, from: data!)
                            //print("jsonData: \(jsonData)")


                            // 2) JSON 결과값을 추출한다.

                            let result = jsonObject["result"] as? Int
                            
                            let message = jsonObject["message"] as? String

//                            self.myId = (jsonObject["user_id"] as? String)!
                            let data = jsonObject["data"]
                            
//                            let userid = jsonObject["user_id"] as? String

//                            let name = jsonObject["name"] as? String
                            
                            
                            print("message: \(message)" ?? "")
                            print("result: \(result)" ?? "")

                            print("data: \(data ?? "")")
                            
                          
                            
                            
                            

                            // 3) 결과가 성공일 때에만 텍스트 뷰에 출력한다.

                            if message == "성공" {
                                
                    
                                print("data:\(data)")
                                
//                                myId = data["user_id"] as String
                                
                                print("userid: \(data)")
                                
                        
                                
                                
                                
                                
                                
                                
                                
//                                print("userid: \(data["userid"])")
//                                self.responseView.text = "아이디 : \(userId!)" + "\n"
//
//                                                        + "이름 : \(name!)" + "\n"
//
//                                    + "응답결과 : \(result!)" + "\n"
//
//                                    + "응답방식 : \(timestamp!)" + "\n"
//
//                                    + "요청방식 : x-www-form-urlencoded"

                            }

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
        
        
        

    
        
        
//        //post data
//        let url = "http://strokedb.or.kr/app_new/get_regist_user.asp"
//        
////        let parameter:Parameters = ["uid" : "235"]
//        
//        
//        let para = ["user_sid" : "\(UserDefaults.standard.object(forKey: "sid") ?? "")"
//                        ]
//        
//        
//        AF.request(url, method: .post, parameters: para, encoding: URLEncoding.default)
//            .responseJSON { [self] response in
//                print("result: \(response)")
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
//                    print("일루와")
//                    do {
//                        let decoder = JSONDecoder()
//                        let json = try decoder.decode(MyInfoDetail.self, from: result)
//                        
//                     print("정보\(json)")
//                        
//                        
//                        
//                        
//                        
//                     
////                        UserDefaults.standard.set(sid, forKey: "sid")
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
        
        
        
        
        let vc = MyInfoViewController()

        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false)
    }
    @objc func goPw(_ sender: UIButton) {
        let vc = ChangePwViewController()

        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        pushInfoUpdate()
    }
    
    @objc func pushChange(){
        
        NotiCenter.shared.notiCenter.getNotificationSettings { (settings : UNNotificationSettings) in
            
            if settings.authorizationStatus == .authorized {
                DispatchQueue.main.async {
                    let value = self.pushSettingView.onOffButton.isOn ? "Y":"N"
                    print("newValue : \(value)")
                    
                    let _ = Server.postData(urlString: "https://ezv.kr:4447/voting/php/bbs/set_push.php?code=\(code)&val=\(value)&deviceid=\(deviceID)") { (kData : Data?) in
                        if let data = kData {
                            print("pushChange : \(String(describing: data.toString()))")
                            self.pushInfoUpdate()
                        }else{
                            DispatchQueue.main.async {
                                toastShow(message: "Communication is not working.\nPlease try again later.")
                                self.pushSettingView.onOffButton.isOn = false
                            }
                        }
                        
                    }
                }
            }else{
                //안내
                DispatchQueue.main.async {
                    self.pushSettingView.onOffButton.isOn = false
                }
                let alertCon = UIAlertController(title: "Notification Setting", message: "Push notifications are turned off.\nPlease turn on Push notifications in Settings.", preferredStyle: UIAlertController.Style.alert)
                alertCon.addAction(UIAlertAction(title: "Close", style: .default, handler: { (action) in
                    
                }))
                alertCon.addAction(UIAlertAction(title: "Setting", style: .default, handler: { (action) in
                    DispatchQueue.main.async {
                        UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!, options: [:], completionHandler: { (fi) in
                            
                        })
                    }
                }))
                
                DispatchQueue.main.async {
                    appDel.topVC?.present(alertCon, animated: true, completion: {
                        
                    })
                }
            }
        }
        
        
        
    }
    
    func pushInfoUpdate(){
        
        NotiCenter.shared.notiCenter.getNotificationSettings { (settings : UNNotificationSettings) in
            print("settings : \(settings)")
            if settings.authorizationStatus == .authorized {
                print("허용됨")
                
                NotiCenter.shared.authorizationCheck()
                
                
                let urlString = "https://ezv.kr:4447/voting/php/bbs/get_push.php?code=\(code)&deviceid=\(deviceID)"
                let _ = Server.postData(urlString: urlString, otherInfo: [:]) { (kData : Data?) in
                    if let data = kData {
                        if let dataString = data.toString() {
                            print("pushInfoUpdate:\(dataString)")
                            self.pushSettingView.onOffButton.isOn = dataString == "Y"
                        }
                        
                    }else{
                        DispatchQueue.main.async {
                            toastShow(message: "Communication is not working.\nPlease try again later.")
                            self.pushSettingView.onOffButton.isOn = false
                        }
                    }
                }
            }else{
                print("허용안됨")
                DispatchQueue.main.async {
                    self.pushSettingView.onOffButton.isOn = false
                }
            }
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
      }
}

class ViewTextType: UIView {
    
    //    var textLabel : KRWordWrapLabel!
    var textLabel : UILabel!
    
    
    init(frame: CGRect, text : String, fontSize : CGFloat) {
        super.init(frame: frame)
        
        textLabel = UILabel(frame: self.bounds)
        textLabel.frame.size.width -= 40
        textLabel.numberOfLines = 0
//        textLabel.font = UIFont(name: Nanum_Barun_Gothic_OTF, size: 17)!
        textLabel.font = UIFont.systemFont(ofSize: 17)

        textLabel.textColor = UIColor.black
        textLabel.text = text
        self.addSubview(textLabel)
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 7
        paragraphStyle.alignment = .justified
        paragraphStyle.lineBreakMode = .byWordWrapping
        
//        textLabel.attributedText = NSAttributedString(string: text, attributes:
//            [NSAttributedString.Key.foregroundColor : #colorLiteral(red: 0.3882352941, green: 0.3882352941, blue: 0.3882352941, alpha: 1),
//             NSAttributedString.Key.font : UIFont(name: Nanum_Barun_Gothic_OTF, size: fontSize)!,
//             NSAttributedString.Key.paragraphStyle:paragraphStyle])
        
        textLabel.sizeToFit()
        textLabel.frame.size.width = self.bounds.size.width - 40
        self.frame.size.height = textLabel.frame.size.height + 40
//        textLabel.center = self.frame.center
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class ViewSwitchType: UIView {
    
    var isOn : Bool = false {
        willSet(newIsOn){
            self.onOffButton.isOn = isOn
        }
    }
    
    var onOffButton : UISwitch!
    
    init(itemName : String, tintColor : UIColor) {
        super.init(frame: CGRect(x: 0, y: 0, width: SCREEN.WIDTH, height: 50))
        self.backgroundColor = UIColor.white
        
        let itemLabel = UILabel(frame: CGRect(x: 20, y: 0, width: SCREEN.WIDTH - 20, height: self.frame.size.height))
        itemLabel.text = itemName
        itemLabel.font = UIFont(name: Nanum_Barun_Gothic_OTF_Bold, size: 15)
        itemLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.addSubview(itemLabel)
        
        onOffButton = UISwitch(frame: CGRect(x: SCREEN.WIDTH - 40 - 30, y: 0, width: 40, height: 30))
        onOffButton.center.y = self.frame.size.height / 2
        onOffButton.onTintColor = tintColor
        self.addSubview(onOffButton)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}

class ViewAppVersionType: UIView {
    
    var isOn : Bool = false {
        willSet(newIsOn){
            self.onOffButton.isOn = isOn
        }
    }
    var onOffButton : UISwitch!
    
    var currentVersionLabel : UILabel!
    
    init(itemName : String, tintColor : UIColor) {
        super.init(frame: CGRect(x: 0, y: 0, width: SCREEN.WIDTH, height: 50))
        self.backgroundColor = UIColor.white
        
        let itemLabel = UILabel(frame: CGRect(x: 20, y: 0, width: SCREEN.WIDTH - 20, height: self.frame.size.height))
        itemLabel.text = itemName
        itemLabel.font = UIFont(name: Nanum_Barun_Gothic_OTF_Bold, size: 15)
        itemLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.addSubview(itemLabel)
        
        currentVersionLabel = UILabel(frame: CGRect(x: SCREEN.WIDTH - 50 - 20, y: 0, width: 100, height: 30))
        currentVersionLabel.center.y = self.frame.size.height / 2
        currentVersionLabel.textColor = tintColor
        currentVersionLabel.font = UIFont(name: Nanum_Barun_Gothic_OTF, size: 15)
        self.addSubview(currentVersionLabel)
        
        
        let infoDic = Bundle.main.infoDictionary
        if let versionString = infoDic!["CFBundleShortVersionString"] as? String {
            currentVersionLabel.text = "V \(versionString)"
        }
        
        currentVersionLabel.sizeToFit()
        currentVersionLabel.center.y = self.frame.size.height / 2
        currentVersionLabel.frame.origin.x = SCREEN.WIDTH - currentVersionLabel.frame.size.width - 15
        
        let updateButton = UIButton(frame: CGRect(x: 0, y: 0, width: 70, height: 40))
        updateButton.frame.origin.x = currentVersionLabel.frame.minX - updateButton.frame.size.width - 15
        updateButton.center.y = self.frame.size.height / 2
//        updateButton.layer.borderColor = mainColor.cgColor
        updateButton.layer.borderWidth = 1
        updateButton.setTitle("Loding..", for: .normal)
        updateButton.setTitleColor(tintColor, for: .normal)
        self.addSubview(updateButton)
        
        newVersionCheck { (isNew : Bool, urlString : String?) in
            if isNew, let downLoadUrlStirng = urlString {
                updateButton.setTitle("Update", for: .normal)
                
                updateButton.addTarget(event: .touchUpInside, buttonAction: { (button) in
                    if let url = URL(string: downLoadUrlStirng) {
                        if UIApplication.shared.canOpenURL(url) {
                            UIApplication.shared.open(url, options: [:], completionHandler: { (fi) in })
                        }
                    }
                })
            }else{
                updateButton.setTitle("Latest", for: .normal)
            }
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    


    
}
