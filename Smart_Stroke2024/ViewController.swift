////
//  ViewController.swift
//  KSR_2024
//
//  Created by m2comm on 2024/01/02.
//
//
import UIKit
import Alamofire
import RealmSwift
import SQLite3



//class DBHelper {
//    
//    static let shared = DBHelper()
//    
//    var db : OpaquePointer?
//    var path = "mySqlite.sqlite"
//    
//    init(){
//        self.db = createDB()
//    }
//    
//    func createDB() -> OpaquePointer? {
//        
//        var db : OpaquePointer? = nil
//        do {
//            
//            //appendingPathExtension(path)은 플레이그라운드에서는 되지만 실제 APP에서는 되지 않았다.
//            //따라서 이렇게 변경해줘야한다. appendingPathExtension(path) -> appendingPathComponent(path)
//            let filePath = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent(path)
//            
//            if sqlite3_open(filePath.path, &db) == SQLITE_OK {
//                print("Succesfully create Database path : \(filePath.path)")
//                return db
//            }
//            
//        }
//        catch{
//            print("ERROR in CreateDB - \(error.localizedDescription)")
//        }
//        
//        print("ERROR in CreateDB - sqlite3_open ")
//        return nil
//        
//    }
//}


//var myDb:OpaquePointer?
//  let TABLE_NAME : String = "DaDaTable"


struct Sid: Codable {
    var result: Int
    var data: MySid?
    var message: String
}

struct MySid: Codable {
    var user_sid: Int
    var reg_num: String
}


class ViewController: UIViewController {

    @IBOutlet weak var myView: UIView!
    
    @IBOutlet weak var logoTitle: UILabel!
    
    @IBOutlet weak var subTitle: UILabel!
    
    @IBOutlet weak var idTF: UITextField!
    @IBOutlet weak var pwTF: UITextField!
    @IBOutlet weak var loginBTN: UIButton!
    
    @IBOutlet weak var findPW: UIButton!
    @IBOutlet weak var signupBTN: UIButton!
   
    var drugManagerView: DrugManageView!
    var registerdDrugListView : RegisterdDrugListView!
    
    var testBTN: UIButton!
    
    var sid: MySid!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        var db: OpaquePointer? = nil
//        var stmt: OpaquePointer? = nil
//        
//        let fileMgr = FileManager()
//        let docPathURL = fileMgr.urls(for: .documentDirectory, in: .userDomainMask).first
//        let dbPath = docPathURL?.appendingPathComponent("db.sqlite").path
       
        
//        let sql = "CREATE TABLE IF NOT EXISTS sequence (num INTEGER)"
//        
//        if sqlite3_open(dbPath, &db) == SQLITE_OK {
//            sqlite3_open(dbPath, &db)
//            sqlite3_prepare(db, sql, -1, &stmt, nil)
//            sqlite3_step(stmt)
//            sqlite3_finalize(stmt)
//            sqlite3_close(db)
//        } else {
//            print("connect fail")
//            return
//        }
// 



//        var idxLabel = UILabel(frame: CGRect(x: 450, y: 200, width: 30, height: 20))
//        idxLabel.text = "\(alram.idx)"
//        
//        self.scrollView.addSubview(idxLabel)

        
//        print("-------db")
//        createTable()
//        print("-------db")
// 
////        insert("엠투컴", "야근중", "2024")
//        
//        
//        
//        print("--insert")
////        update("0", 202405, "1", 0, 1, 7, 10)
        
        
//        update("1", "here", "test", "2024.05")
        
        
//        if UserDefaults.standard.value(forKey: "userId") != nil {
//            
//            mainVC = MainViewController()
////            naviCon = NotRotatableNavigationController(rootViewController: mainVC!)
//            mainVC!.modalPresentationStyle = .fullScreen
//            self.present(mainVC!, animated: false)
//        }
//        
//        if UserDefaults.standard.value(forKey: "userId") == nil {
//            
//            
//            let loginVC = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ViewController") as? ViewController
//             NotRotatableNavigationController(rootViewController: loginVC!)
//        }
//        
        
        // 폰트 체크 하기
        UIFont.familyNames.sorted().forEach { familyName in
            print("*** \(familyName) ***")
            UIFont.fontNames(forFamilyName: familyName).forEach { fontName in
                print("\(fontName)")
            }
            print("---------------------")
        }
        
//        setupKeyboardEvent()
        
        hideKeyboardWhenTappedAround()
        
//        logoTitle.font = UIFont(name: "suite_heavy", size: 34)
//        logoTitle.text = "SMART STROKE"
        
//        if IS_IPHONE_X {
//            
//            subTitle.font = UIFont(name: "suite_heavy", size: 22)
//            subTitle.text = "뇌졸중 관리수첩"
//        
//        } 
        
        findPW.titleLabel?.font = UIFont(name: "SUITE-Regular", size: 15)
        signupBTN.titleLabel?.font = UIFont(name: "SUITE-Regular", size: 15)
        
        
        
        
//        findPW.titleLabel?.font = UIFont(name: "SUITE-Heavy", size: 12)
//        signupBTN.titleLabel?.font = UIFont(name: "SUITE-Heavy", size: 12)
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "backGround")!)
        // Do any additional setup after loading the view.
        
        
        //뷰 그림자
//        myView.layer.shadowColor = UIColor.black.cgColor // 색깔
//        myView.layer.backgroundColor = UIColor.white.cgColor

        
//        myView.backgroundColor = UIColor.clear.withAlphaComponent(0.5)
        myView.backgroundColor = UIColor.white.withAlphaComponent(0.3)
        
//        myView.layer.borderWidth = 0.3
//        myView.layer.borderColor = UIColor.white.cgColor
//        myView.layer.backgroundColor = (UIColor.clear.cgColor).copy(alpha: 0.9)
        myView.layer.cornerRadius = 8
        myView.layer.masksToBounds = false  // 내부에 속한 요소들이 UIView 밖을 벗어날 때, 잘라낼 것인지. 그림자는 밖에 그려지는 것이므로 false 로 설정
//        myView.layer.shadowOffset = CGSize(width: 0, height: 4) // 위치조정
//        myView.layer.shadowRadius = 5 // 반경
//        myView.layer.shadowOpacity = 0.3 // alpha값
        
        
        
        
        idTF.layer.borderWidth = 1
        idTF.layer.cornerRadius = 8
//        idTF.setIcon(UIImage(named: "idImage")!)
        idTF.leftViewMode = .always
        idTF.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 0))
        idTF.contentMode = .scaleAspectFit
        idTF.backgroundColor = .white
//        idTF.contentMode = .scaleAspectFill
        idTF.setIcon(UIImage(named: "idImage")!)
        
        idTF.layer.borderColor = UIColor(red: 144.0/255.0, green: 161.0/255.0, blue: 214.0/255.0, alpha: 1.0).cgColor
        
        let envelopeView = UIImageView(frame: CGRect(x: 10, y: 5, width: 20, height: 20))
         let image = UIImage(named: "idImage")
        
        envelopeView.image = image
        envelopeView.contentMode = .scaleAspectFit
        var viewLeft: UIView = UIView(frame: CGRectMake(20, 0, 40, 30))// set per your requirement
        viewLeft.addSubview(envelopeView)
        idTF.leftView = viewLeft
        idTF.leftViewMode = .always
        
        pwTF.layer.borderWidth = 1
        pwTF.layer.cornerRadius = 8
        pwTF.backgroundColor = .white
//        pwTF.setIcon(UIImage(named: "pwImage")!)
        pwTF.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 0))
        pwTF.setIcon(UIImage(named: "pwImage")!)
        
//        pwTF.contentMode = .scaleAspectFit
        pwTF.leftViewMode = .always
        pwTF.layer.borderColor = UIColor(red: 144.0/255.0, green: 161.0/255.0, blue: 214.0/255.0, alpha: 1.0).cgColor
        
        let envelopeView2 = UIImageView(frame: CGRect(x: 10, y: 5, width: 20, height: 20))
         let image2 = UIImage(named: "pwImage")
        envelopeView2.image = image2
        envelopeView2.contentMode = .scaleAspectFit
        var viewLeft2: UIView = UIView(frame: CGRectMake(20, 0, 40, 30))// set per your requirement
        
        viewLeft2.addSubview(envelopeView2)
        pwTF.leftView = viewLeft2
        pwTF.leftViewMode = .always
        
        
//        loginBTN.layer.borderWidth = 1
        loginBTN.layer.cornerRadius = 8
        loginBTN.backgroundColor = #colorLiteral(red: 0.1462424397, green: 0.2092547119, blue: 0.4116184711, alpha: 1)
        loginBTN.setTitleColor(.white, for: .normal)
//        loginBTN.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        
        drugManagerView = DrugManageView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
        
//        self.view.addSubview(drugManagerView)
        testBTN = UIButton(frame: CGRect(x: 200, y: 500, width: 100, height: 100))
        
        testBTN.setTitle("테스트", for: .normal)
        testBTN.layer.borderWidth = 1
        drugManagerView.addSubview(testBTN)
        testBTN.addTarget(self, action: #selector(addButtonPressed(button: )), for: .touchUpInside)
       
        
//        findPW.titleLabel?.font = UIFont(name: "SUITE-Regular", size: 14)
//        findPW.setTitle("회원가입", for: .normal)
        
        
//        signupBTN.titleLabel?.font = UIFont(name: "SUITE-Regular", size: 14)
//        signupBTN.setTitle("비밀번호 찾기", for: .normal)
    }
    override func viewWillAppear(_ animated: Bool) {
        
        
        
        
//        findPW.titleLabel?.font = UIFont(name: "SUITE-Regular", size: 14)
        
//        signupBTN.titleLabel?.font = UIFont(name: "SUITE-Regular", size: 14)
        
        idTF.text = ""
        pwTF.text = ""
        
        
        
        
   
        
    }
    

//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        view.endEditing(true)
//    }

//    override func viewDidAppear(_ animated: Bool) {
//        // 폰트 체크 하기
//      //        UIFont.familyNames.sorted().forEach { familyName in
//      //            print("*** \(familyName) ***")
//      //            UIFont.fontNames(forFamilyName: familyName).forEach { fontName in
//      //                print("\(fontName)")
//      //            }
//      //            print("---------------------")
//      //        }
//              
//      //        setupKeyboardEvent()
//              
//              hideKeyboardWhenTappedAround()
//              
//              logoTitle.font = UIFont(name: "SUITE-Heavy", size: 34)
//              logoTitle.text = "SMART STROKE"
//              
//              if IS_IPHONE_X {
//                  subTitle.font = UIFont(name: "SUITE-Regular", size: 22)
//                  subTitle.text = "뇌졸중 관리수첩"
//              
//              } else {
//                  subTitle.font = UIFont(name: "SUITE-Regular", size: 26)
//                  subTitle.text = "뇌졸중 관리수첩"
//              }
//              
//              self.view.backgroundColor = UIColor(patternImage: UIImage(named: "backGround")!)
//              // Do any additional setup after loading the view.
//              
//              
//              //뷰 그림자
//              myView.layer.shadowColor = UIColor.black.cgColor // 색깔
//              myView.layer.backgroundColor = UIColor.clear.cgColor
//              
//              myView.layer.borderWidth = 1
//              myView.layer.borderColor = UIColor.white.cgColor
//              myView.layer.cornerRadius = 8
//              myView.layer.masksToBounds = false  // 내부에 속한 요소들이 UIView 밖을 벗어날 때, 잘라낼 것인지. 그림자는 밖에 그려지는 것이므로 false 로 설정
//              myView.layer.shadowOffset = CGSize(width: 0, height: 4) // 위치조정
//              myView.layer.shadowRadius = 5 // 반경
//              myView.layer.shadowOpacity = 0.3 // alpha값
//              
//              idTF.layer.borderWidth = 1
//              idTF.layer.cornerRadius = 8
//      //        idTF.setIcon(UIImage(named: "idImage")!)
//              idTF.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
//              idTF.setIcon(UIImage(named: "idImage")!)
//              idTF.leftViewMode = .always
//              
//              pwTF.layer.borderWidth = 1
//              pwTF.layer.cornerRadius = 8
//      //        pwTF.setIcon(UIImage(named: "pwImage")!)
//              pwTF.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
//              pwTF.setIcon(UIImage(named: "pwImage")!)
//              pwTF.leftViewMode = .always
//              
//              loginBTN.layer.borderWidth = 1
//              loginBTN.layer.cornerRadius = 8
//              loginBTN.backgroundColor = #colorLiteral(red: 0.1462424397, green: 0.2092547119, blue: 0.4116184711, alpha: 1)
//              loginBTN.setTitleColor(.white, for: .normal)
//              loginBTN.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
//              
//              drugManagerView = DrugManageView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
//              
//      //        self.view.addSubview(drugManagerView)
//              testBTN = UIButton(frame: CGRect(x: 200, y: 500, width: 100, height: 100))
//              
//              testBTN.setTitle("테스트", for: .normal)
//              testBTN.layer.borderWidth = 1
//              drugManagerView.addSubview(testBTN)
//              testBTN.addTarget(self, action: #selector(addButtonPressed(button: )), for: .touchUpInside)
//             
//              
//              findPW.titleLabel?.font = UIFont(name: "SUITE-Regular", size: 14)
//              
//              signupBTN.titleLabel?.font = UIFont(name: "SUITE-Regular", size: 14)
//    }
    

    
    //MARK:RegisterdDrugListTopViewDelegate
    @objc func addButtonPressed(button: UIButton) {
        
        
        
        print("tap")
        
        let drugRegisterViewController = DrugRegisterViewController()
        drugRegisterViewController.modalPresentationStyle = .fullScreen
        self.present(drugRegisterViewController, animated: true) {
            
        }
    }
    
    
    

    @IBAction func loginAction(_ sender: Any) {
  
        
        //post data
        let url = "http://strokedb.or.kr/app_new/login.asp"
        
//        let parameter:Parameters = ["uid" : "235"]
        
        let id = idTF.text ?? ""
        let pw = pwTF.text ?? ""
       
        
        UserDefaults.standard.setValue(id, forKey: "username")
        
        
            //post data
            
            
            let para = [
                     "user_id":id,
                     "passwd":pw,
                     "device":"IOS",
                     "deviceid":deviceID,
                     "token":token_id
                 ]
         //
            
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
                            let json = try decoder.decode(Sid.self, from: result)
                            
                            print("????\(json.message)")
                            
                            showToast(message: json.message, font: UIFont.systemFont(ofSize: 15))
                            
                        
                            
                            
                            
                            
                            
                           
                            
                            
                            if json.message == "성공" {
                                
                                UserDefaults.standard.setValue(json.data?.user_sid, forKey: "userSid")
                                UserDefaults.standard.set(id, forKey: "myId")
                                
//                                                        UserDefaults.standard.setValue(sid.user_sid, forKey: "sid")
//                                                        UserDefaults.standard.set(sid, forKey: "sid")
                                
                                let vc = MainViewController()
                                //
                                                                                            vc.modalPresentationStyle = .fullScreen
                                                                                            self.present(vc, animated: false)
                                
                            } else if json.message == "일치하는 계정이 없습니다." {
                                showToast(message: json.message, font: UIFont.systemFont(ofSize: 15))
                            }
                            
    //                        toastShow(message: json.message)
                            
                            
                
                            
                            }
                        catch {
                            print("err \(error)")
                        }
                    default:
                        return
                       
                        
                  
                    }
                    
                    
            
        }
        
        
//        if id.replacingOccurrences(of: " ", with: "") == "" {
//            
//            showToast(message: "아이디를 입력해주세요.", font: .systemFont(ofSize: 14))
//            return
//        }
//        if pw.replacingOccurrences(of: " ", with: "") == "" {
//            
//            showToast(message: "비밀번호를 입력해주세요.", font: .systemFont(ofSize: 14))
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
//                        self.sid = json.data
//                        print("sid: \(sid.user_sid)")
//                        
//                        
//                        
//                        UserDefaults.standard.setValue(sid.user_sid, forKey: "sid")
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
//        
//        
//        
//        
//////        let vc = MainViewController()
//////
//////        vc.modalPresentationStyle = .fullScreen
//////        self.present(vc, animated: false)
////        
////        let urlString = "http://strokedb.or.kr/app_new/login.asp"
////        
////        let id = idTF.text ?? ""
////        let pw = pwTF.text ?? ""
////        
////        if id.replacingOccurrences(of: " ", with: "") == "" {
////            appDel.showAlert(title: "Notice", message: "아이디를 입력해주세요.")
////            return
////        }
////        if pw.replacingOccurrences(of: " ", with: "") == "" {
////            appDel.showAlert(title: "Notice", message: "비밀번호를 입력해주세요.")
////            return
////        }
////        
////      
////        let para = [
////            "user_id":id,
////            "passwd":pw,
////            "device":"IOS",
////            "deviceid":deviceID,
////            "token":token_id
////        ]
////        
////        //todo login check
//////        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
////        Server.postData(urlString: urlString, otherInfo: para, completion: { (kData : Data?) in
//////            hud.hide(animated: true)
////            
////            
////            
////            
////            if let data = kData{
////                
////               
////                
////                
////                if let dataString = data.toString() {
////                    print("loginDataString : \(dataString)")
////                }
////                
////                if let dataDic = data.toJson() as? [String:Any]{
////                    print("->\(dataDic)")
////                    
////                  
////                    
////                    
////                    if let app_YN = dataDic["message"] as? String{
////                        if app_YN == "성공" {
////                            
////                         
////                            
//////                            userD.set(id, forKey: USER_ID)
//////                            userD.set(pw, forKey: USER_PW)
////                            userD.synchronize()
////                            
////                            print("\(user_sid)")
////                           
////                            
////                           
////                            
////                            saveUserD(jsonDic: dataDic, valueKey: "user_sid", saveKey: USER_SID)
////                            
////                            
//////                            saveUserD(jsonDic: dataDic, valueKey: "name", saveKey: USER_NAME)
//////                            saveUserD(jsonDic: dataDic, valueKey: "office", saveKey: USER_OFFICE)
//////                            saveUserD(jsonDic: dataDic, valueKey: "phone", saveKey: USER_PHONE)
//////                            saveUserD(jsonDic: dataDic, valueKey: "email", saveKey: USER_EMAIL)
//////                            saveUserD(jsonDic: dataDic, valueKey: "app_YN", saveKey: USER_APP_YN)
//////                            saveUserD(jsonDic: dataDic, valueKey: "research_YN", saveKey: USER_RESEARCH_YN)
//////                            saveUserD(jsonDic: dataDic, valueKey: "signdate", saveKey: USER_SIGNDATE)
//////                            saveUserD(jsonDic: dataDic, valueKey: "gubun", saveKey: USER_GUBUN)
////                        
////                            
////                            
//////                            sceneDel!.mainVC = MainViewController()
//////                            self.navigationController?.pushViewController(sceneDel!.mainVC!, animated: true)
////                            let vc = MainViewController()
////                            
////                                    vc.modalPresentationStyle = .fullScreen
////                                    self.present(vc, animated: false)
////                            return
////                        }
////                        appDel.showAlert(title: "Notice", message: "승인이 필요한 아이디입니다.")
////                        return
////                    }
////                }
////                
////                
////            }
////            appDel.showAlert(title: "Notice", message: "로그인에 실패하였습니다.")
////            return
////        })
//        
//        
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


    
    @IBAction func goSignUp(_ sender: Any) {
        let vc = ServiceViewController()

        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false)
        
    }
    
    
    
//    func createTable(){
//            let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("DSDatabase.sqlite")
//            
//            
//            if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
//                print("table not exsist")
//            }
//            
//            let CREATE_QUERY_TEXT : String = "CREATE TABLE IF NOT EXISTS \(TABLE_NAME) (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, subline, date TEXT)"
//
//            print(CREATE_QUERY_TEXT)
//            if sqlite3_exec(db, CREATE_QUERY_TEXT, nil, nil, nil) != SQLITE_OK {
//                let errMsg = String(cString:sqlite3_errmsg(db))
//                print("db table create error : \(errMsg)")
//            }
//        }
    
    
    
    
    @IBAction func findPwAction(_ sender: UIButton) {
        
        let vc = FindPasswordViewController()

        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false)
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
    
    
    
    
}

extension UITextField {    func setLeftPaddingPoints(_ amount:CGFloat){ //왼쪽에 여백 주기
         let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
    self.leftView = paddingView        
    self.leftViewMode = .always
}
         func setRightPaddingPoints(_ amount:CGFloat) { //오른쪽에 여백 주기
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
                self.rightView = paddingView
             self.rightViewMode = .always
    }}

