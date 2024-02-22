//
//  BloodPressureViewController.swift
//  KSR
//
//  Created by m2comm on 2018. 6. 22..
//  Copyright © 2018년 m2community. All rights reserved.
//

import UIKit

class BloodPressureViewController: UIViewController
    ,TopBarDelegate, SegmentedViewDelegate
{
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        
        return .lightContent
    }
    
    
    var topBar : TopBar!
    
    var bloodPressureWebView : WebView!
    var bloodPressureNoteView : BloodPressureNoteView!
    var bloodPressureListView : BloodPressureListView!
    var segView : SegmentedView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        self.topBar = TopBar()
        topBar.titleLabel.text = "혈압"
        topBar.titleLabel.textAlignment = .left
        topBar.leftImageView.image = #imageLiteral(resourceName: "btn_b_back").withRenderingMode(.alwaysTemplate)
        topBar.leftImageView.tintColor = UIColor.white
        topBar.delegate = self
        topBar.rightImageView.image = #imageLiteral(resourceName: "btn_menu").withRenderingMode(UIImageRenderingMode.alwaysTemplate)
        topBar.rightImageView.tintColor = UIColor.white
        topBar.addRightButton2()
        topBar.rightImageView2?.image = #imageLiteral(resourceName: "graph")
        self.view.addSubview(topBar)
        
        topBar.rightButton2?.isHidden = true
        
        segView = SegmentedView()
        segView.frame.origin.y = topBar.frame.maxY
        segView.addItems(titles: ["혈압관리 도움말","혈압관리수첩","혈압기록보기"])
        segView.delegate = self
        self.view.addSubview(segView)
        
        self.bloodPressureWebView = WebView(frame: CGRect(
            x: 0,
            y: segView.frame.maxY,
            width: SCREEN.WIDTH,
            height: SCREEN.HEIGHT - segView.frame.maxY), urlString: WebViewURL.MANAGEMENT.BLOOD_PRESSURE)
        self.view.addSubview(self.bloodPressureWebView)
        
        self.bloodPressureNoteView = BloodPressureNoteView(frame: CGRect(
            x: 0,
            y: segView.frame.maxY,
            width: SCREEN.WIDTH,
            height: SCREEN.HEIGHT - segView.frame.maxY - SAFE_AREA))
        self.bloodPressureNoteView.superCon = self
        self.view.addSubview(self.bloodPressureNoteView)
        
        self.bloodPressureListView = BloodPressureListView(frame: CGRect(
            x: 0,
            y: segView.frame.maxY,
            width: SCREEN.WIDTH,
            height: SCREEN.HEIGHT - segView.frame.maxY - SAFE_AREA))
        self.view.addSubview(self.bloodPressureListView)
        
        self.segView.itemButtonPressed(button: self.segView.itemButtons[1])
        
        self.dataUpdate()
        
        
    }
    
    func rightButtonPressed(button: UIButton) {
        appDel.rightView?.open()
    }
    
    func dataUpdate(){
        
        guard let regNumString = userD.object(forKey: USER_KEY.KSR_REGISTRATION_NUMBER) as? String else {
            toastShow(message: "reg_num is nil error")
            return
        }
        
        Server.getData(type: Server.InfoType.BLOOD_USER, otherInfo: ["reg_num":regNumString]) { (kData : Data?) in
            if let data = kData {
                do {
                    if let jsonDic = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String:String] {
                        print("json:\n\(jsonDic)")
                        let max = jsonDic["max"] ?? ""
                        let min = jsonDic["min"] ?? ""
                        let seccess = jsonDic["seccess"] ?? ""
                        let cnt = jsonDic["cnt"] ?? ""
                        let seccess2 = jsonDic["seccess2"] ?? ""
                        let cnt2 = jsonDic["cnt2"] ?? ""
                        
                        let successValue = Int(seccess, radix: 10)
                        let cntValue = Int(cnt, radix: 10)
                        
                        let successValue2 = Int(seccess2, radix: 10)
                        let cntValue2 = Int(cnt2, radix: 10)
                        
                        
                        self.bloodPressureNoteView.bloodPressureGoalAndRateView.goalView.valueLabelUpdate(labelIndex: 0, valueLabelString: "수축기", valueString: " \(max) ", unitString: "mmHg")
                        self.bloodPressureListView.dataScrollView.goalView.valueLabelUpdate(labelIndex: 0, valueLabelString: "수축기", valueString: " \(max) ", unitString: "mmHg")
                        self.bloodPressureListView.graphScrollView.goalView.valueLabelUpdate(labelIndex: 0, valueLabelString: "수축기", valueString: " \(max) ", unitString: "mmHg")
                        
                        self.bloodPressureNoteView.bloodPressureGoalAndRateView.goalView.valueLabelUpdate(labelIndex: 1, valueLabelString: "이완기", valueString: " \(min) ", unitString: "mmHg")
                        self.bloodPressureListView.dataScrollView.goalView.valueLabelUpdate(labelIndex: 1, valueLabelString: "이완기", valueString: " \(min) ", unitString: "mmHg")
                        self.bloodPressureListView.graphScrollView.goalView.valueLabelUpdate(labelIndex: 1, valueLabelString: "이완기", valueString: " \(min) ", unitString: "mmHg")
                        
                        
                        if let success = successValue , let cnt = cntValue {
                            let persent : Int
                            if cnt != 0 {
                                persent = Int(round((Double(success) / Double(cnt)) * 100))
                            }else{
                                persent = 0
                            }
                            self.bloodPressureNoteView.bloodPressureGoalAndRateView.rateView.valueLabelUpdate(labelIndex: 0, valueLabelString: "수축기", valueString: " \(persent) ", unitString: "%")
                            self.bloodPressureListView.dataScrollView.rateView.valueLabelUpdate(labelIndex: 0, valueLabelString: "수축기", valueString: " \(persent) ", unitString: "%")
                            self.bloodPressureListView.graphScrollView.rateView.valueLabelUpdate(labelIndex: 0, valueLabelString: "수축기", valueString: " \(persent) ", unitString: "%")
                        }
                        
                        if let success = successValue2 , let cnt = cntValue2 {
                            let persent : Int
                            if cnt != 0 {
                                persent = Int(round((Double(success) / Double(cnt)) * 100))
                            }else{
                                persent = 0
                            }
                            self.bloodPressureNoteView.bloodPressureGoalAndRateView.rateView.valueLabelUpdate(labelIndex: 1, valueLabelString: "이완기", valueString: " \(persent) ", unitString: "%")
                            self.bloodPressureListView.dataScrollView.rateView.valueLabelUpdate(labelIndex: 1, valueLabelString: "이완기", valueString: " \(persent) ", unitString: "%")
                            self.bloodPressureListView.graphScrollView.rateView.valueLabelUpdate(labelIndex: 1, valueLabelString: "이완기", valueString: " \(persent) ", unitString: "%")
                        }
                        
                    }
                    
                }catch {
                    print("error:\(error.localizedDescription)")
                }
            }
        }
    }
    
    
    //MARK:TopBarDelegate
    func leftButtonPressed( button : UIButton ) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func rightButton2Pressed(button: UIButton) {
        
        button.isSelected = !button.isSelected
        if button.isSelected {
            //그래프로 보기 -> 데이터로 보기 버튼 활성화
            self.topBar.rightImageView2?.image = #imageLiteral(resourceName: "list")
            self.bloodPressureListView.graphScrollView.isHidden = false
            self.bloodPressureListView.dataScrollView.isHidden = true
            
            self.bloodPressureListView.graphScrollView.dataUpdate(index: 1)
        }else{
            //데이터로 보기 -> 그래프로 보기 버튼 활성화
            self.topBar.rightImageView2?.image = #imageLiteral(resourceName: "graph")
            self.bloodPressureListView.graphScrollView.isHidden = true
            self.bloodPressureListView.dataScrollView.isHidden = false
            
            self.bloodPressureListView.dataScrollView.dataUpdate()
        }
    } 
    
    func segButtonPressed(index : Int) {

        self.view.endEditing(true)
        
        self.dataUpdate()
        
        let isBloodPressureNoteViewHidden = self.bloodPressureNoteView.isHidden
        
        self.bloodPressureWebView.isHidden = true
        self.bloodPressureNoteView.isHidden = true
        self.bloodPressureListView.isHidden = true
        
        
        if index == 0 {
            //?/
            self.bloodPressureWebView.isHidden = false
            self.bloodPressureWebView.reloading()
        }else if index == 1 {
            if isBloodPressureNoteViewHidden {
                self.bloodPressureNoteView.relaxtionInputView.valueTextField.text = ""
                self.bloodPressureNoteView.contractionInputView.valueTextField.text = ""
                self.bloodPressureNoteView.heartRateInputView.valueTextField.text = ""
            }
            self.bloodPressureNoteView.isHidden = false
        }else if index == 2{
            self.bloodPressureListView.isHidden = false
            self.bloodPressureListView.dataScrollView.dataUpdate()
        }
        
        if index == 2 {
            self.topBar.rightButton2?.isHidden = false
        }else{
            self.topBar.rightButton2?.isHidden = true
        }
    }
    
    
    
}
