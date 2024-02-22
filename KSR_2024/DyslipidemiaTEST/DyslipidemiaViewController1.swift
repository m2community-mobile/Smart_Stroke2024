//
//  DyslipidemiaViewController.swift
//  KSR
//
//  Created by m2comm on 2018. 6. 28..
//  Copyright © 2018년 m2community. All rights reserved.
//

//import UIKit
//
//class DyslipidemiaViewController: UIViewController
//,TopBarDelegate, SegmentedViewDelegate
//{
//    override var preferredStatusBarStyle: UIStatusBarStyle {
//        return .lightContent
//    }
//    
//    var topBar : TopBar!
//    
//    var dyslipidemiaWebView : WebView!
//    var dyslipidemiaNoteView : DyslipidemiaNoteView!
//    var dyslipidemiaListView : DyslipidemiaListView!
//    var segView : SegmentedView!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        self.view.backgroundColor = UIColor.white
//        
//        self.topBar = TopBar()
//        topBar.titleLabel.text = "이상지질혈증"
//        topBar.titleLabel.textAlignment = .left
////        topBar.leftImageView.image = #imageLiteral(resourceName: "btn_b_back").withRenderingMode(.alwaysTemplate)
//        topBar.leftImageView.tintColor = UIColor.white
//        topBar.delegate = self
////        topBar.rightImageView.image = #imageLiteral(resourceName: "btn_menu").withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
//        topBar.rightImageView.tintColor = UIColor.white
//        topBar.addRightButton2()
////        topBar.rightImageView2?.image = #imageLiteral(resourceName: "graph")
//        self.view.addSubview(topBar)
//        
//        topBar.rightButton2?.isHidden = true
//        
//        segView = SegmentedView(ratios: [0.3,0.4,0.3])
//        segView.frame.origin.y = topBar.frame.maxY
//        segView.addItems(titles: ["관리도움말","이상지혈증 관리수첩","기록보기"])
//        segView.delegate = self
//        self.view.addSubview(segView)
//        
//        //?/
//        self.dyslipidemiaWebView = WebView(frame: CGRect(
//            x: 0,
//            y: segView.frame.maxY,
//            width: SCREEN.WIDTH,
//            height: SCREEN.HEIGHT - segView.frame.maxY), urlString: WebViewURL.MANAGEMENT.DYSLIPIDEMIA)
//        self.view.addSubview(self.dyslipidemiaWebView)
//        
//        self.dyslipidemiaNoteView = DyslipidemiaNoteView(frame: CGRect(
//            x: 0,
//            y: segView.frame.maxY,
//            width: SCREEN.WIDTH,
//            height: SCREEN.HEIGHT - segView.frame.maxY - SAFE_AREA))
//        self.dyslipidemiaNoteView.superCon = self
//        self.view.addSubview(self.dyslipidemiaNoteView)
//        
//        self.dyslipidemiaListView = DyslipidemiaListView(frame: CGRect(
//            x: 0,
//            y: segView.frame.maxY,
//            width: SCREEN.WIDTH,
//            height: SCREEN.HEIGHT - segView.frame.maxY - SAFE_AREA))
//        self.view.addSubview(self.dyslipidemiaListView)
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
//    func dataUpdate() {
//        guard let regNumString = userD.object(forKey: USER_KEY.KSR_REGISTRATION_NUMBER) as? String else {
//            toastShow(message: "reg_num is nil error")
//            return
//        }
//        
//        Server.getData(type: Server.InfoType.CHOLESTEROL_USER, otherInfo: ["reg_num":regNumString]) { (kData : Data?) in
//            if let data = kData {
//                do {
//                    if let jsonDic = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String:String] {
//                        print("CHOLESTEROL_USER:\n\(jsonDic)")
//                        
//                        let LDL = jsonDic["LDL"] ?? ""
//                        self.dyslipidemiaNoteView.goalAndRateView.goalView.valueLabelUpdate(valueString: " \(LDL) ", unitString: "mg/dL")
//                        self.dyslipidemiaListView.dataScrollView.goalView.valueLabelUpdate(valueString: " \(LDL) ", unitString: "mg/dL")
//                        self.dyslipidemiaListView.graphScrollView.goalView.valueLabelUpdate(valueString: " \(LDL) ", unitString: "mg/dL")
//                        
//                        let seccess = jsonDic["seccess"] ?? ""
//                        let successValue = Int(seccess, radix: 10)
//                        let cnt = jsonDic["cnt"] ?? ""
//                        let cntValue = Int(cnt, radix: 10)
//                        if let success = successValue , let cnt = cntValue {
//                            let persent : Int
//                            if cnt != 0 {
//                                persent = Int(round((Double(success) / Double(cnt)) * 100))
//                            }else{
//                                persent = 0
//                            }
//                            self.dyslipidemiaNoteView.goalAndRateView.rateView.valueLabelUpdate(valueString: " \(persent) ", unitString: "%")
//                            self.dyslipidemiaListView.dataScrollView.rateView.valueLabelUpdate(valueString: " \(persent) ", unitString: "%")
//                            self.dyslipidemiaListView.graphScrollView.rateView.valueLabelUpdate(valueString: " \(persent) ", unitString: "%")
//                        }
//                    }
//                }catch {
//                    print("error:\(error.localizedDescription)")
//                }
//            }
//        }
//        
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
//            self.dyslipidemiaListView.graphScrollView.isHidden = false
//            self.dyslipidemiaListView.dataScrollView.isHidden = true
//        }else{
//            //데이터로 보기 -> 그래프로 보기 버튼 활성화
//            self.topBar.rightImageView2?.image = #imageLiteral(resourceName: "graph")
//            self.dyslipidemiaListView.graphScrollView.isHidden = true
//            self.dyslipidemiaListView.dataScrollView.isHidden = false
//        }
//    }
//    
//    func segButtonPressed(index : Int) {
//        
//        self.view.endEditing(true)
//        
//        let isDyslipidemiaNoteViewHidden = self.dyslipidemiaNoteView.isHidden
//        
//        self.dyslipidemiaWebView.isHidden = true
//        self.dyslipidemiaNoteView.isHidden = true
//        self.dyslipidemiaListView.isHidden = true
//        
//        if index == 0 {
//            self.dyslipidemiaWebView.isHidden = false
//            self.dyslipidemiaWebView.reloading()
//        }else if index == 1 {
//            if isDyslipidemiaNoteViewHidden {
//                self.dyslipidemiaNoteView.triglycerideInputView.valueTextField.text = ""
//                self.dyslipidemiaNoteView.hdlColesterolInputView.valueTextField.text = ""
//                self.dyslipidemiaNoteView.ldlColesterolInputView.valueTextField.text = ""
//                self.dyslipidemiaNoteView.totalColesterolInputView.valueTextField.text = ""
//            }
//            self.dyslipidemiaNoteView.isHidden = false
//        }else if index == 2{
//            self.dyslipidemiaListView.isHidden = false
//            self.dyslipidemiaListView.dataScrollView.dataUpdate()
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
