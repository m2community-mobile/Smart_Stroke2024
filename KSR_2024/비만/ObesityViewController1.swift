//
//  ObesityViewController.swift
//  KSR_2024
//
//  Created by m2comm on 2024/01/29.
//
//
//import UIKit
//
//class ObesityViewController: UIViewController
//,TopBarDelegate, SegmentedViewDelegate
//{
//
//    override var preferredStatusBarStyle: UIStatusBarStyle {
//        return .lightContent
//    }
//    
//    var topBar : TopBar!
//    
//    var obesityWebView : WebView!
//    var obesityNoteView : ObesityNoteView!
//    var obesityListView : ObesityListView!
//    var segView : SegmentedView!
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        self.view.backgroundColor = UIColor.white
//        
//        self.topBar = TopBar()
//        topBar.titleLabel.text = "비만관리 및 운동"
//        topBar.titleLabel.textAlignment = .left
//        topBar.leftImageView.image = #imageLiteral(resourceName: "btn_b_back").withRenderingMode(.alwaysTemplate)
//        topBar.leftImageView.tintColor = UIColor.white
//        topBar.delegate = self
//        topBar.rightImageView.image = #imageLiteral(resourceName: "btn_menu").withRenderingMode(UIImageRenderingMode.alwaysTemplate)
//        topBar.rightImageView.tintColor = UIColor.white
//        topBar.addRightButton2()
//        topBar.rightImageView2?.image = #imageLiteral(resourceName: "graph")
//        self.view.addSubview(topBar)
//        
//        topBar.rightButton2?.isHidden = true
//        
//        segView = SegmentedView()
//        segView.frame.origin.y = topBar.frame.maxY
//        segView.addItems(titles: ["비만관리 도움말","비만 관리수첩","비만 기록보기"])
//        segView.delegate = self
//        self.view.addSubview(segView)
//        
//        
//        self.obesityWebView = WebView(frame: CGRect(
//            x: 0,
//            y: segView.frame.maxY,
//            width: SCREEN.WIDTH,
//            height: SCREEN.HEIGHT - segView.frame.maxY), urlString: WebViewURL.MANAGEMENT.OBESITY)
//        self.view.addSubview(self.obesityWebView)
//        
//        self.obesityNoteView = ObesityNoteView(frame: CGRect(
//            x: 0,
//            y: segView.frame.maxY,
//            width: SCREEN.WIDTH,
//            height: SCREEN.HEIGHT - segView.frame.maxY - SAFE_AREA))
//        self.obesityNoteView.superCon = self
//        self.view.addSubview(self.obesityNoteView)
//        
//        self.obesityListView = ObesityListView(frame: CGRect(
//            x: 0,
//            y: segView.frame.maxY,
//            width: SCREEN.WIDTH,
//            height: SCREEN.HEIGHT - segView.frame.maxY - SAFE_AREA))
//        self.view.addSubview(self.obesityListView)
//        
//        self.segView.itemButtonPressed(button: self.segView.itemButtons[1])
////        self.segButtonPressed(index: 0)
//        
//        
//    }
//
//    func rightButtonPressed(button: UIButton) {
//        appDel.rightView?.open()
//    }
//    
//    //MARK:TopBarDelegate
//    func leftButtonPressed( button : UIButton ) {
//        self.navigationController?.popViewController(animated: true)
//    }
//    
//    func rightButton2Pressed(button: UIButton) {
//        
//        button.isSelected = !button.isSelected
//        if button.isSelected {
//            //그래프로 보기 -> 데이터로 보기 버튼 활성화
//            self.topBar.rightImageView2?.image = #imageLiteral(resourceName: "list")
//            self.obesityListView.graphScrollView.isHidden = false
//            self.obesityListView.dataScrollView.isHidden = true
//            
//            self.obesityListView.graphScrollView.dataUpdate(index: 1)
//        }else{
//            //데이터로 보기 -> 그래프로 보기 버튼 활성화
//            self.topBar.rightImageView2?.image = #imageLiteral(resourceName: "graph")
//            self.obesityListView.graphScrollView.isHidden = true
//            self.obesityListView.dataScrollView.isHidden = false
//            
//            self.obesityListView.dataScrollView.dataUpdate()
//        }
//    }
//    
//    func segButtonPressed(index : Int) {
//        
//        self.view.endEditing(true)
//        
//        self.dataUpdate()
// 
//        let isObesityNoteViewHidden = self.obesityNoteView.isHidden
//        
//        self.obesityWebView.isHidden = true
//        self.obesityNoteView.isHidden = true
//        self.obesityListView.isHidden = true
//
//
//        if index == 0 {
//            self.obesityWebView.isHidden = false
//            self.obesityWebView.reloading()
//        }else if index == 1 {
//            if isObesityNoteViewHidden {
//                self.obesityNoteView.heightInputView.valueTextField.text = ""
//                self.obesityNoteView.weightInputView.valueTextField.text = ""
//                self.obesityNoteView.kindOfExerciseInputView.valueTextField.text = ""
//                self.obesityNoteView.exerciseTimeInputView.valueTextField.text = ""
//                self.obesityNoteView.bmeViewinit()
//                
//            }
//            self.obesityNoteView.isHidden = false
//        }else if index == 2{
//            self.obesityListView.isHidden = false
//            self.obesityListView.dataScrollView.dataUpdate()
//        }
//
//        if index == 2 {
//            self.topBar.rightButton2?.isHidden = false
//        }else{
//            self.topBar.rightButton2?.isHidden = true
//        }
//    }
//    
//    func dataUpdate(){
//        guard let regNumString = userD.object(forKey: USER_KEY.KSR_REGISTRATION_NUMBER) as? String else {
//            toastShow(message: "reg_num is nil error")
//            return
//        }
//        
//        Server.getData(type: Server.InfoType.BMI_USER, otherInfo: ["reg_num":regNumString]) { (kData : Data?) in
//            if let data = kData {
//                do {
//                    if let jsonDic = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String:String] {
//                        print("BMI_USER:\n\(jsonDic)")
//                        
//                        let seccess = jsonDic["seccess"] ?? ""
//                        let successValue = Int(seccess, radix: 10)
//                        let cnt = jsonDic["cnt"] ?? ""
//                        let cntValue = Int(cnt, radix: 10)
//
//                        if let success = successValue , let cnt = cntValue {
//                            let persent : Int
//                            if cnt != 0 {
//                                //?/
////                                print("success : \(success)")
////                                print("cnt : \(cnt)")
//                                persent = Int(round((Double(success) / Double(cnt)) * 100))
//                            }else{
//                                persent = 0
//                            }
//                            self.obesityNoteView.goalAndRateView.rateView.valueLabelUpdate(valueString: " \(persent) ", unitString: "%")
//                            self.obesityListView.dataScrollView.rateView.valueLabelUpdate(valueString: " \(persent) ", unitString: "%")
//                            self.obesityListView.graphScrollView.rateView.valueLabelUpdate(valueString: " \(persent) ", unitString: "%")
//                            
//                        }
//                    }
//                }catch {
//                    print("error:\(error.localizedDescription)")
//                }
//            }
//        }
//    }
//}
//
