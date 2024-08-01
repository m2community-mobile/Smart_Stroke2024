//
//  BloodSugarViewController.swift
//  KSR
//
//  Created by m2comm on 2018. 6. 27..
//  Copyright © 2018년 m2community. All rights reserved.
//

//import UIKit
//
//class BloodSugarViewController: UIViewController
//,TopBarDelegate, SegmentedViewDelegate
//{
//
//    override var preferredStatusBarStyle: UIStatusBarStyle {
//        return .lightContent
//    }
//    
//    var topBar : TopBar!
//    
//    var bloodSugarWebView : WebView!
//    var bloodSugarNoteView : BloodSugarNoteView!
//    var bloodSugarListView : BloodSugarListView!
//    var segView : SegmentedView!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        self.view.backgroundColor = UIColor.white
//        
//        self.topBar = TopBar()
//        topBar.titleLabel.text = "혈당"
//        topBar.titleLabel.textAlignment = .left
//        topBar.leftImageView.image = #imageLiteral(resourceName: "vectorSmartObject").withRenderingMode(.alwaysTemplate)
//        topBar.leftImageView.tintColor = UIColor.white
//        topBar.delegate = self
//        topBar.rightImageView.image = #imageLiteral(resourceName: "vectorSmartObject").withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
//        topBar.rightImageView.tintColor = UIColor.white
//        topBar.addRightButton2()
//        topBar.rightImageView2?.image = #imageLiteral(resourceName: "vectorSmartObject")
//        self.view.addSubview(topBar)
//        
//        topBar.rightButton2?.isHidden = true
//
//        segView = SegmentedView()
//        segView.frame.origin.y = topBar.frame.maxY
//        segView.addItems(titles: ["혈당관리 도움말","혈당관리수첩","혈당기록보기"])
//        segView.delegate = self
//        self.view.addSubview(segView)
//        
//        self.bloodSugarWebView = WebView(frame: CGRect(
//            x: 0,
//            y: segView.frame.maxY,
//            width: SCREEN.WIDTH,
//            height: SCREEN.HEIGHT - segView.frame.maxY), urlString: WebViewURL.MANAGEMENT.BLOOD_SUGAR)
//        self.view.addSubview(self.bloodSugarWebView)
//        
//        self.bloodSugarNoteView = BloodSugarNoteView(frame: CGRect(
//            x: 0,
//            y: segView.frame.maxY,
//            width: SCREEN.WIDTH,
//            height: SCREEN.HEIGHT - segView.frame.maxY - SAFE_AREA))
//        self.bloodSugarNoteView.superCon = self
//        self.view.addSubview(self.bloodSugarNoteView)
//        
//        self.bloodSugarListView = BloodSugarListView(frame: CGRect(
//            x: 0,
//            y: segView.frame.maxY,
//            width: SCREEN.WIDTH,
//            height: SCREEN.HEIGHT - segView.frame.maxY - SAFE_AREA))
//        self.view.addSubview(self.bloodSugarListView)
//        
//        self.segView.itemButtonPressed(button: self.segView.itemButtons[1])
////        self.segButtonPressed(index: 0)
//        
//        self.dataUpdate()
//    }
//    
//    func rightButtonPressed(button: UIButton) {
//        appDel.rightView?.open()
//    }
//    
//    func dataUpdate(){
//
//        guard let regNumString = userD.object(forKey: USER_KEY.KSR_REGISTRATION_NUMBER) as? String else {
//            toastShow(message: "reg_num is nil error")
//            return
//        }
//        
//        Server.getData(type: Server.InfoType.SUGAR_USER, otherInfo: ["reg_num":regNumString]) { (kData : Data?) in
//            if let data = kData {
//                do {
//                    if let jsonDic = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String:String] {
//                        print("\(Server.InfoType.SUGAR_USER) : \n\(jsonDic)")
//                        
//                        /*
//                         ["cnt1": "7", "seccess2": "0", "cnt3": "7", "seccess3": "0", "cnt2": "1", "result": "7", "seccess1": "3"]
//                         */
//                        
//                        let seccess1 = jsonDic["seccess1"] ?? ""
//                        let seccess2 = jsonDic["seccess2"] ?? ""
//                        let seccess3 = jsonDic["seccess3"] ?? ""
//                        
//                        let successValue1 = Int(seccess1, radix: 10)
//                        let successValue2 = Int(seccess2, radix: 10)
//                        let successValue3 = Int(seccess3, radix: 10)
//                        
//                        let cnt1 = jsonDic["cnt1"] ?? ""
//                        let cnt2 = jsonDic["cnt2"] ?? ""
//                        let cnt3 = jsonDic["cnt3"] ?? ""
//                        
//                        let cntValue1 = Int(cnt1, radix: 10)
//                        let cntValue2 = Int(cnt2, radix: 10)
//                        let cntValue3 = Int(cnt3, radix: 10)
//                        
//                        if let success = successValue1 , let cnt = cntValue1 {
//                            let persent : Int
//                            if cnt != 0 {
//                                persent = Int(round((Double(success) / Double(cnt)) * 100))
//                            }else{
//                                persent = 0
//                            }
//                            self.bloodSugarNoteView.bloodSugarGoalAndRateView.rateView.valueLabelUpdate(labelIndex: 0, valueString: " \(persent) ", unitString: "%")
//                            self.bloodSugarListView.dataScrollView.rateView.valueLabelUpdate(labelIndex: 0, valueString: " \(persent) ", unitString: "%")
//                            self.bloodSugarListView.graphScrollView.rateView.valueLabelUpdate(labelIndex: 0, valueString: " \(persent) ", unitString: "%")
//                        }
//                        
//                        if let success = successValue2 , let cnt = cntValue2 {
//                            let persent : Int
//                            if cnt != 0 {
//                                //?/
//                                print("success : \(success)")
//                                print("cnt : \(cnt)")
//                                persent = Int(round((Double(success) / Double(cnt)) * 100))
//                            }else{
//                                persent = 0
//                            }
//                            self.bloodSugarNoteView.bloodSugarGoalAndRateView.rateView.valueLabelUpdate(labelIndex: 1, valueString: " \(persent) ", unitString: "%")
//                            self.bloodSugarListView.dataScrollView.rateView.valueLabelUpdate(labelIndex: 1, valueString: " \(persent) ", unitString: "%")
//                            self.bloodSugarListView.graphScrollView.rateView.valueLabelUpdate(labelIndex: 1, valueString: " \(persent) ", unitString: "%")
//                        }
//                        
//                        
//                        
//                        if let success = successValue3 , let cnt = cntValue3 {
//                            let persent : Int
//                            if cnt != 0 {
//                                persent = Int(round((Double(success) / Double(cnt)) * 100))
//                            }else{
//                                persent = 0
//                            }
//                            self.bloodSugarNoteView.bloodSugarGoalAndRateView.rateView.valueLabelUpdate(labelIndex: 2, valueString: " \(persent) ", unitString: "%")
//                            self.bloodSugarListView.dataScrollView.rateView.valueLabelUpdate(labelIndex: 2, valueString: " \(persent) ", unitString: "%")
//                            self.bloodSugarListView.graphScrollView.rateView.valueLabelUpdate(labelIndex: 2, valueString: " \(persent) ", unitString: "%")
//                        }
//                        
//                        
//                        
//                        
//                        
//                        
//                        
////                        self.bloodSugarNoteView.//?/
//                        
//                    }
//                }catch {
//                    print("error:\(error.localizedDescription)")
//                }
//            }
//        }
//        
//        
//        
//    }
//    
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
//            self.topBar.rightImageView2?.image = #imageLiteral(resourceName: "goBack")
//            self.bloodSugarListView.graphScrollView.isHidden = false
//            self.bloodSugarListView.dataScrollView.isHidden = true
//            
//            self.bloodSugarListView.graphScrollView.dataUpdate(index: 1, gubunIndex: 1)
//        }else{
//            //데이터로 보기 -> 그래프로 보기 버튼 활성화
//            self.topBar.rightImageView2?.image = #imageLiteral(resourceName: "goForward")
//            self.bloodSugarListView.graphScrollView.isHidden = true
//            self.bloodSugarListView.dataScrollView.isHidden = false
//            
//            self.bloodSugarListView.dataScrollView.dataUpdate()
//        }
//    }
//    
//    func segButtonPressed(index : Int) {
//        
//        self.view.endEditing(true)
//        
//        let isBloodSugarNoteViewHidden = self.bloodSugarNoteView.isHidden
//        
//        self.bloodSugarWebView.isHidden = true
//        self.bloodSugarNoteView.isHidden = true
//        self.bloodSugarListView.isHidden = true
//        
//        self.dataUpdate()
//        
//        if index == 0 {
//            self.bloodSugarWebView.isHidden = false
//            self.bloodSugarWebView.reloading()
//        }else if index == 1 {
//            if isBloodSugarNoteViewHidden {
//                self.bloodSugarNoteView.hbA1cInputView.valueTextField.text = ""
//                self.bloodSugarNoteView.bloodSugarInputView.valueTextField.text = ""
//            }
//            self.bloodSugarNoteView.isHidden = false
//        
//        }else if index == 2{
//            self.bloodSugarListView.isHidden = false
//            self.bloodSugarListView.dataScrollView.dataUpdate()
//        }
//        
//        if index == 2 {
//            self.topBar.rightButton2?.isHidden = false
//        }else{
//            self.topBar.rightButton2?.isHidden = true
//        }
//    }
//    
//}
//
//
//
//
//
//
//
