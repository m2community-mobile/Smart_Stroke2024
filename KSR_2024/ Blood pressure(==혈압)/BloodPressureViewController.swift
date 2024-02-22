//
//  BloodPressureViewController.swift
//  KSR_2024
//
//  Created by m2comm on 2024/01/19.
//

import Foundation
import UIKit
import PagingKit

class BloodPressureViewController: BaseViewController {
    
    
    var titleName: UILabel!
    
    
    
    
    
    var BloodPressureWebView : WebView!
    var BloodPressureManagementNotebookView : BloodPressureManagementNotebookView!
//    var BloodSugarRecordsView : BloodSugarRecordsView!
    
        var bloodPressureListView : BloodPressureListView!
    
    var set: UIView!
    var segView : SegmentedView!
    
    var addView: UIView!
    
    var testBtn1: UIButton!
    var testBtn2: UIButton!
    
    //
    var showLabel: UILabel!
    
    var circularProgressBarView: CircularProgressView!
        var circularViewDuration: TimeInterval = 2

    var random: CGFloat!
    //
    
    //
    var contractionInputView: UITextField!
    var relaxtionInputView: UITextField!
    var heartRateInputView: UITextField!
    
    var ShrinkGoal: UITextField!
    var relaxationGoal: UITextField!
    var pulseGoal: UITextField!

    

    
    var goalCancelBTN: UIButton!
    var goalSaveBTN: UIButton!
    
    
    var today : Date!
    
    
    var UnderBar: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("here")
        
        UnderBar = UIView(frame: CGRect(x: button1.center.x, y: naviBar.frame.maxY + 62, width: SCREEN.WIDTH / 8.8, height: 5))
        UnderBar.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        self.view.addSubview(UnderBar)
        
        
//        moveSelected(view: UnderBar, button: button2)
        
        setupKeyboardEvent()
        
        hideKeyboardWhenTappedAround()
        
        buttons = [button1, button2, button3]
        
        self.buttons.forEach {
            $0.addTarget(self, action: #selector(segButtonPressed(_ :)), for: .touchUpInside)
        }
        
        titleName = UILabel(frame: CGRect(x: self.view.frame.size.width / 2.2, y: 0, width: 150, height: naviBar.frame.height))
//        titleName.text = titleLabel
        
        titleName.text = "혈압"
        titleName.font = UIFont(name: "SUITE-Regular", size: 20)
        
        naviBar.addSubview(titleName)
        
     
        label1.text = "혈압관리\n도움말"
        label2.text = "혈압\n관리수첩"
        label3.text = "혈압\n기록보기"
        
        label1.textColor = .black
        label2.textColor = .lightGray
        label3.textColor = .lightGray
        
        
        
        
        self.BloodPressureWebView = WebView(frame: CGRect(
            x: 0,
            y: menuView.frame.maxY,
            width: SCREEN.WIDTH,
            height: SCREEN.HEIGHT - menuView.frame.maxY), urlString: URL_Addres.what_is_high_blood_pressure)
        
        BloodPressureManagementNotebookView = KSR_2024.BloodPressureManagementNotebookView(frame: CGRect(x: 0, y: scrollView.frame.minY, width: SCREEN.WIDTH, height: scrollView.frame.height))
        BloodPressureManagementNotebookView.backgroundColor = .white
        scrollView.addSubview(BloodPressureManagementNotebookView)
        
        self.view.addSubview(self.BloodPressureWebView)
        
        
        
        
        self.bloodPressureListView = BloodPressureListView(frame: CGRect(
                    x: 0,
                    y: menuView.frame.maxY,
                    width: SCREEN.WIDTH,
                    height: SCREEN.HEIGHT - menuView.frame.maxY))
        bloodPressureListView.backgroundColor = .yellow
        self.view.addSubview(self.bloodPressureListView)
        
//                self.segView.itemButtonPressed(button: self.segView.itemButtons[1])
        
                
        titleName = UILabel(frame: CGRect(x: self.view.frame.size.width / 2.2, y: 0, width: 150, height: naviBar.frame.height))
    //        titleName.text = titleLabel
        
        if titleLabel == UserDefaults.standard.string(forKey: "stroke") {
            titleName.text = titleLabel
        } else if titleLabel == UserDefaults.standard.string(forKey: "danger") {
            titleName.text = titleLabel
        } else if titleLabel == UserDefaults.standard.string(forKey: "hight") {
            titleName.text = titleLabel
        } else if titleLabel == UserDefaults.standard.string(forKey: "diabetes") {
            titleName.text = titleLabel
        }
        
        
        naviBar.addSubview(titleName)
        
        
//        addView = UIView(frame: CGRect(x: 0, y: 0, width: SCREEN.WIDTH, height: 100))
//        addView.backgroundColor = .yellow
////        bloodPressureListView.addSubview(addView)

        testBtn1 = UIButton(frame: CGRect(x: SCREEN.WIDTH / 2, y: 20, width: 100, height: 60))
        testBtn1.setTitle("리스트보기", for: .normal)
        testBtn1.setTitleColor(.black, for: .normal)
        testBtn1.layer.borderWidth = 1
        bloodPressureListView.addSubview(testBtn1)
        testBtn1.addTarget(self, action: #selector(rightButton2PressedList(_ :)), for: .touchUpInside)
        
        
        testBtn2 = UIButton(frame: CGRect(x: testBtn1.frame.maxX + 5, y: 20, width: 100, height: 60))
        testBtn2.setTitle("그래프보기", for: .normal)
        testBtn2.setTitleColor(.black, for: .normal)
        testBtn2.layer.borderWidth = 1
        bloodPressureListView.addSubview(testBtn2)
        testBtn2.addTarget(self, action: #selector(rightButton2PressedGraph(_ :)), for: .touchUpInside)
        
        
        BloodPressureManagementNotebookView.BloodPressureView = UIView(frame: CGRect(x: 0, y: scrollView.frame.minY, width: self.view.frame.size.width, height: self.view.frame.size.height / 3))
        BloodPressureManagementNotebookView.BloodPressureView.backgroundColor = #colorLiteral(red: 0.001859865268, green: 0.6434201002, blue: 0.7680490613, alpha: 1)
//        BloodSugarManagementNotebookView.FastingBloodSugar.layer.borderWidth = 1
//        ObesityManagementNotebookView.bmiGraphVIew.layer.cornerRadius = 8
        scrollView.addSubview(BloodPressureManagementNotebookView.BloodPressureView)
        
        BloodPressureManagementNotebookView.BloodPressureVewLabel = UILabel(frame: CGRect(x: 50, y: BloodPressureManagementNotebookView.BloodPressureView.frame.minY + 20, width: 130, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 5))
        BloodPressureManagementNotebookView.BloodPressureVewLabel.text = " 나의 혈압\n목표 수치는?"
        
        BloodPressureManagementNotebookView.BloodPressureVewLabel.numberOfLines = 0
//        BloodPressureManagementNotebookView.BloodPressureVewLabel.layer.borderWidth = 1
        BloodPressureManagementNotebookView.BloodPressureVewLabel.textColor = .white
        BloodPressureManagementNotebookView.BloodPressureVewLabel.textAlignment = .center
        BloodPressureManagementNotebookView.BloodPressureVewLabel.font = UIFont.systemFont(ofSize: 20)
        
        BloodPressureManagementNotebookView.BloodPressureView.addSubview(BloodPressureManagementNotebookView.BloodPressureVewLabel)
        
        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1name = UILabel(frame: CGRect(x: 50, y: BloodPressureManagementNotebookView.BloodPressureVewLabel.frame.maxY + 2, width: 50, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 10))
        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1name.text = "수축기"
        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1name.textColor = .white
        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1name.frame.origin.x = BloodPressureManagementNotebookView.BloodPressureVewLabel.frame.width / 1.5
        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1name.textAlignment = .center
        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1name.font = UIFont.systemFont(ofSize: 16)
//        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1name.layer.borderWidth = 1

        BloodPressureManagementNotebookView.BloodPressureView.addSubview(BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1name)

        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1Number = UILabel(frame: CGRect(x: 60, y: BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1name.frame.maxY + 2, width: 50, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 8))
        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1Number.text = "120"
        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1Number.textColor = .white
        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1Number.textAlignment = .right
        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1Number.font = UIFont.systemFont(ofSize: 30)
//        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1Number.layer.borderWidth = 1

        BloodPressureManagementNotebookView.BloodPressureView.addSubview(BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1Number)
        
        
        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1 = UILabel(frame: CGRect(x: BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1Number.frame.maxX + 5, y: BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1name.frame.maxY + 2, width: 60, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 8))
        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1.text = "mmHg"
        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1.textColor = .white
        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1.textAlignment = .center
        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1.font = UIFont.systemFont(ofSize: 13)
//        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1.layer.borderWidth = 1

        BloodPressureManagementNotebookView.BloodPressureView.addSubview(BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1)
        
        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2name = UILabel(frame: CGRect(x: 50, y: BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1Number.frame.maxY + 2, width: 50, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 10))
        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2name.text = "이완기"
        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2name.textColor = .white
        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2name.frame.origin.x = BloodPressureManagementNotebookView.BloodPressureVewLabel.frame.width / 1.5
        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2name.textAlignment = .center
        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2name.font = UIFont.systemFont(ofSize: 16)
//        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2name.layer.borderWidth = 1

        BloodPressureManagementNotebookView.BloodPressureView.addSubview(BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2name)
        
        
        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2Number = UILabel(frame: CGRect(x: 60, y: BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2name.frame.maxY + 2, width: 50, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 8))
        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2Number.text = " 80"
        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2Number.textAlignment = .right
        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2Number.textColor = .white
        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2Number.font = UIFont.systemFont(ofSize: 30)
//        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2Number.layer.borderWidth = 1

        BloodPressureManagementNotebookView.BloodPressureView.addSubview(BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2Number)
        
        
        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2 = UILabel(frame: CGRect(x: BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2Number.frame.maxX + 5, y: BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2name.frame.maxY + 2, width: 60, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 8))
        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2.text = "mmHg"
        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2.textColor = .white
        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2.textAlignment = .center
        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2.font = UIFont.systemFont(ofSize: 13)
//        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2.layer.borderWidth = 1
        
        BloodPressureManagementNotebookView.BloodPressureView.addSubview(BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2)
        
//        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2 = UILabel(frame: CGRect(x: 35, y: BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel1.frame.maxY + 1, width: self.view.frame.size.width / 2, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 5))
//        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2.text = "mg/dL"
//        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2.textColor = .white
//        BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2.font = UIFont.systemFont(ofSize: 22)
//
//        BloodPressureManagementNotebookView.BloodPressureView.addSubview(BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2)
        
        BloodPressureManagementNotebookView.BloodPressureViewShowLabel = UILabel(frame: CGRect(x: BloodPressureManagementNotebookView.BloodPressureView.frame.maxX - 150, y: BloodPressureManagementNotebookView.BloodPressureView.frame.minY + 20, width: 130, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 5))
        BloodPressureManagementNotebookView.BloodPressureViewShowLabel.text = " 목표 수치\n달성율은?"
        BloodPressureManagementNotebookView.BloodPressureViewShowLabel.numberOfLines = 0
//        BloodPressureManagementNotebookView.BloodPressureViewShowLabel.layer.borderWidth = 1
        BloodPressureManagementNotebookView.BloodPressureViewShowLabel.textColor = .white
        BloodPressureManagementNotebookView.BloodPressureViewShowLabel.font = UIFont.systemFont(ofSize: 20)

        BloodPressureManagementNotebookView.BloodPressureView.addSubview(BloodPressureManagementNotebookView.BloodPressureViewShowLabel)
        
        
        BloodPressureManagementNotebookView.BloodPressureVewGraph = UIView(frame: CGRect(x: BloodPressureManagementNotebookView.BloodPressureVewLabel.frame.maxX + 55, y: BloodPressureManagementNotebookView.BloodPressureViewShowLabel.frame.maxY + 50, width: self.view.frame.size.width / 2.8, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 2))
        BloodPressureManagementNotebookView.BloodPressureVewGraph.backgroundColor = #colorLiteral(red: 0.001859865268, green: 0.6434201002, blue: 0.7680490613, alpha: 1)
        
        //
        random = CGFloat(arc4random_uniform(UInt32(101))) //between 0 and n-1
        
        self.view.backgroundColor = .white
        // Do any additional setup after loading the view.
        
        if IS_IPHONE_X {
            showLabel = UILabel(frame: CGRect(x: 27, y: 24, width: 40, height: 30))
            
            
            
            //        showLabel.layer.borderWidth = 1
            
            var changeShowLabel = Int(random)
            
            
            
            showLabel.text = "\(changeShowLabel ?? 00)%"
        } else {
            showLabel = UILabel(frame: CGRect(x: 50, y: 29, width: 40, height: 30))
            
            
            
            //        showLabel.layer.borderWidth = 1
            
            var changeShowLabel = Int(random)
            
            
            
            showLabel.text = "\(changeShowLabel ?? 00)%"
        }
        
        
        
        
        if IS_IPHONE_12PRO_MAX {
            let ProgressView = CircularProgressView(frame: CGRect(x: BloodPressureManagementNotebookView.BloodPressureVewGraph.frame.size.width / 8, y: 0, width: 90, height: 90), lineWidth: 15, rounded: false)
            ProgressView.progressColor = .white

            ProgressView.trackColor = .lightGray
            
    //        ProgressView.center = ProgressView.center
            
    //        self.view.addSubview(ProgressView)
            BloodPressureManagementNotebookView.BloodPressureVewGraph.addSubview(ProgressView)
            
            
            ProgressView.addSubview(showLabel)
            
            ProgressView.progress = random * 0.01
      
            //
        } else if IS_IPHONE_N_PLUS {
            let ProgressView = CircularProgressView(frame: CGRect(x: BloodPressureManagementNotebookView.BloodPressureVewGraph.frame.size.width / 15, y: 0, width: 90, height: 90), lineWidth: 15, rounded: false)
            ProgressView.progressColor = .white

            ProgressView.trackColor = .lightGray
            
    //        ProgressView.center = ProgressView.center
            
    //        self.view.addSubview(ProgressView)
            BloodPressureManagementNotebookView.BloodPressureVewGraph.addSubview(ProgressView)
            
            
            ProgressView.addSubview(showLabel)
            
            ProgressView.progress = random * 0.01
      
            //
        } else if IS_IPHONE_X {
            let ProgressView = CircularProgressView(frame: CGRect(x: 0, y: 0, width: 80, height: 80), lineWidth: 15, rounded: false)
            ProgressView.progressColor = .white

            ProgressView.trackColor = .lightGray
            
    //        ProgressView.center = ProgressView.center
            
    //        self.view.addSubview(ProgressView)
            BloodPressureManagementNotebookView.BloodPressureVewGraph.addSubview(ProgressView)
            
            
            ProgressView.addSubview(showLabel)
            
            ProgressView.progress = random * 0.01
      
            //
        }
        
        
//        ProgressView.progressColor = .blue
//
//        ProgressView.trackColor = .lightGray
//        
////        ProgressView.center = ProgressView.center
//        
////        self.view.addSubview(ProgressView)
//        BloodPressureManagementNotebookView.BloodPressureVewGraph.addSubview(ProgressView)
//        
//        
//        ProgressView.addSubview(showLabel)
//        
//        ProgressView.progress = random * 0.01
//  
//        //

        BloodPressureManagementNotebookView.BloodPressureView.addSubview(BloodPressureManagementNotebookView.BloodPressureVewGraph)
        
        BloodPressureManagementNotebookView.BloodPressureViewBTN = UIButton(frame: CGRect(x: 50, y: BloodPressureManagementNotebookView.BloodPressureViewShowNumLabel2.frame.maxY + 15, width: 130, height: BloodPressureManagementNotebookView.BloodPressureView.frame.size.height / 10))
        BloodPressureManagementNotebookView.BloodPressureViewBTN.setTitle("나의 목표 수정", for: .normal)
        BloodPressureManagementNotebookView.BloodPressureViewBTN.layer.borderWidth = 1
        BloodPressureManagementNotebookView.BloodPressureViewBTN.layer.cornerRadius = 8
        BloodPressureManagementNotebookView.BloodPressureViewBTN.addTarget(self, action: #selector(show(_ :)), for: .touchUpInside)
        
        BloodPressureManagementNotebookView.BloodPressureView.addSubview(BloodPressureManagementNotebookView.BloodPressureViewBTN)
        
        var saveData = UILabel(frame: CGRect(x: 20, y: BloodPressureManagementNotebookView.BloodPressureView.frame.maxY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 12))
        saveData.text = "측정하신 혈압과 맥박을 입력해주세요."
        saveData.font = UIFont.systemFont(ofSize: 18)
        
        scrollView.addSubview(saveData)
        
        var saveView: UIView!
        
//        var afterBTN: UIButton!
//        var beforeBTN: UIButton!
//        var bloodTF: UITextField!
//        var glycated: UITextField!
        
        saveView = UIView(frame: CGRect(x: 20, y: saveData.frame.maxY + 10, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 3))
        saveView.backgroundColor = .white
//        saveView.layer.borderWidth = 1
        saveView.layer.cornerRadius = 8
        scrollView.addSubview(saveView)
        
        var dateView = UIView(frame: CGRect(x: 10, y: 5, width: saveView.frame.size.width - 20, height: self.view.frame.size.height / 14))
        dateView.backgroundColor = .white
        
        saveView.addSubview(dateView)
        
        var dateViewLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 60, height: dateView.frame.height))
        dateViewLabel.text = "일시"
        dateView.addSubview(dateViewLabel)
        
//        date = UILabel(frame: CGRect(x: dateViewLabel.frame.maxX + 50, y: dateViewLabel.frame.minY, width: 200, height: dateView.frame.height))
//        date.text = Date()

        var time = Date()
        var formatter = DateFormatter()
        formatter.dateFormat = "MM.dd.yyyy a h:mm"
        let formattedDateInString = formatter.string(from: time)

        
        
        BloodPressureManagementNotebookView.dateLable = UILabel(frame: CGRect(x: dateViewLabel.frame.maxX + 80, y: dateViewLabel.frame.minY, width: 200, height: dateView.frame.height))
        BloodPressureManagementNotebookView.dateLable.text = formattedDateInString
        
        
        dateView.addSubview(BloodPressureManagementNotebookView.dateLable)
        
        var mysystoleView = UIView(frame: CGRect(x: 10, y: dateView.frame.maxY, width: saveView.frame.size.width - 20, height: self.view.frame.size.height / 14))
        mysystoleView.backgroundColor = .white
        
        saveView.addSubview(mysystoleView)
        
        var mysystoleViewLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 80, height: dateView.frame.height))
        mysystoleViewLabel.text = "수축기"
        mysystoleView.addSubview(mysystoleViewLabel)
        
        
        contractionInputView = UITextField(frame: CGRect(x: mysystoleViewLabel.frame.maxX + 80, y: 0, width: mysystoleViewLabel.frame.width * 2, height: mysystoleViewLabel.frame.height))
        contractionInputView.placeholder = "측정치를 적어주세요."
        mysystoleView.addSubview(contractionInputView)
        
        
        var mydiastoleView = UIView(frame: CGRect(x: 10, y: mysystoleView.frame.maxY, width: saveView.frame.size.width - 20, height: self.view.frame.size.height / 14))
        mydiastoleView.backgroundColor = .white
        
        saveView.addSubview(mydiastoleView)
        
        var mydiastoleViewLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 80, height: dateView.frame.height))
        mydiastoleViewLabel.text = "이완기"
        mydiastoleView.addSubview(mydiastoleViewLabel)
        
        relaxtionInputView = UITextField(frame: CGRect(x: mysystoleViewLabel.frame.maxX + 80, y: 0, width: mysystoleViewLabel.frame.width * 2, height: mysystoleViewLabel.frame.height))
        relaxtionInputView.placeholder = "측정치를 적어주세요."
        mydiastoleView.addSubview(relaxtionInputView)
        
        
        var mypulseView = UIView(frame: CGRect(x: 10, y: mydiastoleView.frame.maxY, width: saveView.frame.size.width - 20, height: self.view.frame.size.height / 14))
        mypulseView.backgroundColor = .white
        
        saveView.addSubview(mypulseView)
        
        var mypulseViewLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 80, height: dateView.frame.height))
        mypulseViewLabel.text = "맥박"
        mypulseView.addSubview(mypulseViewLabel)
        
        heartRateInputView = UITextField(frame: CGRect(x: mysystoleViewLabel.frame.maxX + 80, y: 0, width: mysystoleViewLabel.frame.width * 2, height: mysystoleViewLabel.frame.height))
        heartRateInputView.placeholder = "측정치를 적어주세요."
        mypulseView.addSubview(heartRateInputView)
        
        let cancelBTN = UIButton(frame: CGRect(x: 0, y: saveView.frame.maxY + 10, width: self.view.frame.size.width / 2, height: self.view.frame.size.height / 12))
        cancelBTN.setTitle("취소", for: .normal)
        cancelBTN.backgroundColor = #colorLiteral(red: 0.6152173877, green: 0.6653684974, blue: 0.7206344604, alpha: 1)
        scrollView.addSubview(cancelBTN)
        
        let saveBTN = UIButton(frame: CGRect(x: cancelBTN.frame.maxX, y: saveView.frame.maxY + 10, width: self.view.frame.size.width / 2, height: self.view.frame.size.height / 12))
        saveBTN.setTitle("저장", for: .normal)
        saveBTN.backgroundColor = #colorLiteral(red: 0.1400382817, green: 0.3497706652, blue: 0.5862404704, alpha: 1)
        saveBTN.addTarget(self, action: #selector(saveData(_ :)), for: .touchUpInside)
        scrollView.addSubview(saveBTN)
        
        
//        testBtn1 = UIButton(frame: CGRect(x: 10, y: 10, width: 50, height: 50))
//        testBtn1.setTitle("눌러", for: .normal)
//        testBtn1.setTitleColor(.black, for: .normal)
//        testBtn1.layer.borderWidth = 1
//        scrollView.addSubview(testBtn1)
//        testBtn1.addTarget(self, action: #selector(rightButton2Pressed(_ :)), for: .touchUpInside)
        
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: menuView.frame.maxY).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: saveBTN.bottomAnchor, constant: 50).isActive = true

        set = UIView(frame: CGRect(x: 10, y: scrollView.frame.minY + 10, width: self.view.frame.width - 20, height: self.view.frame.size.height / 2.3))
        set.backgroundColor = .white
        scrollView.addSubview(set)
        
        var setImgView = UIImageView(frame: CGRect(x: set.frame.size.width / 2.2, y: set.frame.minY + 15, width: 50, height: 60))
        set.addSubview(setImgView)
        
        var setImg = UIImage(named: "bloodSetImg")
        setImgView.image = setImg
    
        set.isHidden = true
        
        var hideView = UIView(frame: CGRect(x: 0, y: set.frame.maxY - 5, width: self.view.frame.width, height: self.view.frame.height))
        hideView.backgroundColor = .lightGray
        set.addSubview(hideView)
        
        var setTitle = UILabel(frame: CGRect(x: set.frame.size.width / 3.8, y: setImgView.frame.maxY, width: 300, height: 50))
        setTitle.font = UIFont.systemFont(ofSize: 18)
        setTitle.text = "나의 혈압 관리 목표 설정하기"
//        setTitle.numberOfLines = 0
        set.addSubview(setTitle)
        
        var Shrink = UILabel(frame: CGRect(x: 20, y: setTitle.frame.maxY + 45, width: 100, height: 30))
        Shrink.text = "수축기"
        Shrink.font = UIFont.systemFont(ofSize: 20)
        set.addSubview(Shrink)

        ShrinkGoal = UITextField(frame: CGRect(x: Shrink.frame.maxX + 30, y: setTitle.frame.maxY + 45, width: 230, height: 30))
        ShrinkGoal.placeholder = "수축기 목표를 입력해주세요."
        ShrinkGoal.font = UIFont.systemFont(ofSize: 20)
        set.addSubview(ShrinkGoal)
        
        var relaxation = UILabel(frame: CGRect(x: 20, y: Shrink.frame.maxY + 10, width: 100, height: 30))
        relaxation.text = "이완기"
        relaxation.font = UIFont.systemFont(ofSize: 20)
        set.addSubview(relaxation)

        relaxationGoal = UITextField(frame: CGRect(x: relaxation.frame.maxX + 30, y: ShrinkGoal.frame.maxY + 10, width: 230, height: 30))
        relaxationGoal.placeholder = "이완기 목표를 입력해주세요."
        relaxationGoal.font = UIFont.systemFont(ofSize: 20)
        set.addSubview(relaxationGoal)
        
        var pulse = UILabel(frame: CGRect(x: 20, y: relaxation.frame.maxY + 10, width: 100, height: 30))
        pulse.text = "맥박"
        pulse.font = UIFont.systemFont(ofSize: 20)
        set.addSubview(pulse)

        pulseGoal = UITextField(frame: CGRect(x: pulse.frame.maxX + 30, y: relaxationGoal.frame.maxY + 10, width: 230, height: 30))
        pulseGoal.placeholder = " 맥박 목표를 입력해주세요."
        pulseGoal.font = UIFont.systemFont(ofSize: 20)
        set.addSubview(pulseGoal)
        
        if IS_IPHONE_X {
            set = UIView(frame: CGRect(x: 10, y: scrollView.frame.minY + 10, width: self.view.frame.width - 20, height: self.view.frame.size.height / 2.3))
            set.backgroundColor = .white
            scrollView.addSubview(set)
            
            var setImgView = UIImageView(frame: CGRect(x: set.frame.size.width / 2.2, y: set.frame.minY + 15, width: 50, height: 60))
            set.addSubview(setImgView)
            
            var setImg = UIImage(named: "bloodSetImg")
            setImgView.image = setImg
        
            set.isHidden = true
            
            var hideView = UIView(frame: CGRect(x: 0, y: set.frame.maxY - 5, width: self.view.frame.width, height: self.view.frame.height))
            hideView.backgroundColor = .lightGray
            set.addSubview(hideView)
            
            var setTitle = UILabel(frame: CGRect(x: set.frame.size.width / 3.8, y: setImgView.frame.maxY, width: 300, height: 50))
            setTitle.font = UIFont.systemFont(ofSize: 18)
            setTitle.text = "나의 혈압 관리 목표 설정하기"
    //        setTitle.numberOfLines = 0
            set.addSubview(setTitle)
            
            var Shrink = UILabel(frame: CGRect(x: 20, y: setTitle.frame.maxY + 45, width: 100, height: 30))
            Shrink.text = "수축기"
            Shrink.font = UIFont.systemFont(ofSize: 20)
            set.addSubview(Shrink)

            ShrinkGoal = UITextField(frame: CGRect(x: Shrink.frame.maxX + 30, y: setTitle.frame.maxY + 45, width: 230, height: 30))
            ShrinkGoal.placeholder = "수축기 목표를 입력해주세요."
            ShrinkGoal.font = UIFont.systemFont(ofSize: 17)
            set.addSubview(ShrinkGoal)
            
            var relaxation = UILabel(frame: CGRect(x: 20, y: Shrink.frame.maxY + 10, width: 100, height: 30))
            relaxation.text = "이완기"
            relaxation.font = UIFont.systemFont(ofSize: 20)
            set.addSubview(relaxation)

            relaxationGoal = UITextField(frame: CGRect(x: relaxation.frame.maxX + 30, y: ShrinkGoal.frame.maxY + 10, width: 230, height: 30))
            relaxationGoal.placeholder = "이완기 목표를 입력해주세요."
            relaxationGoal.font = UIFont.systemFont(ofSize: 17)
            set.addSubview(relaxationGoal)
            
            var pulse = UILabel(frame: CGRect(x: 20, y: relaxation.frame.maxY + 10, width: 100, height: 30))
            pulse.text = "맥박"
            pulse.font = UIFont.systemFont(ofSize: 20)
            set.addSubview(pulse)

            pulseGoal = UITextField(frame: CGRect(x: pulse.frame.maxX + 30, y: relaxationGoal.frame.maxY + 10, width: 230, height: 30))
            pulseGoal.placeholder = " 맥박 목표를 입력해주세요."
            pulseGoal.font = UIFont.systemFont(ofSize: 17)
            set.addSubview(pulseGoal)
            
        }
        
        
        goalCancelBTN = UIButton(frame: CGRect(x: 0, y: self.view.frame.maxY - self.view.frame.size.height / 12 - 150, width: self.view.frame.size.width / 2, height: self.view.frame.size.height / 12))
        goalCancelBTN.setTitle("취소", for: .normal)
        goalCancelBTN.backgroundColor = #colorLiteral(red: 0.6152173877, green: 0.6653684974, blue: 0.7206344604, alpha: 1)
        scrollView.addSubview(goalCancelBTN)
        goalCancelBTN.isHidden = true
        
        goalSaveBTN = UIButton(frame: CGRect(x: cancelBTN.frame.maxX, y: self.view.frame.maxY - self.view.frame.size.height / 12 - 150, width: self.view.frame.size.width / 2, height: self.view.frame.size.height / 12))
        goalSaveBTN.setTitle("저장", for: .normal)
        goalSaveBTN.backgroundColor = #colorLiteral(red: 0.1400382817, green: 0.3497706652, blue: 0.5862404704, alpha: 1)
//        goalSaveBTN.addTarget(self, action: #selector(saveData(_ :)), for: .touchUpInside)
        scrollView.addSubview(goalSaveBTN)
        goalSaveBTN.isHidden = true
        
  
        
        BloodPressureWebView.isHidden = false
        BloodPressureManagementNotebookView.isHidden = true
        bloodPressureListView.isHidden = true
        
        self.dataUpdate()
    }
    
    func moveSelected(view :UIView, button: UIButton) {
        view.center.x = button.center.x
    }
    
    @objc func show(_ sender: UIButton) {
        scrollView.backgroundColor = .lightGray
        BloodPressureManagementNotebookView.BloodPressureView.backgroundColor = .lightGray
        BloodPressureManagementNotebookView.BloodPressureVewGraph.isHidden = true
        set.isHidden = false
        goalCancelBTN.isHidden = false
        goalSaveBTN.isHidden = false
        
        BloodPressureWebView.isHidden = true
        BloodPressureManagementNotebookView.isHidden = true
        bloodPressureListView.isHidden = true
      
        
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

    override func viewWillAppear(_ animated: Bool) {
        
//        self.dataUpdate()
        //        NotificationCenter.default.addObserver(self, selector: #selector(test(_ :)), name: Notification.Name("test"), object: nil)
        
    }
    
    @objc func keyboardWillShow(_ sender: Notification) {
        // 현재 동작하고 있는 이벤트에서 키보드의 frame을 받아옴
        guard let keyboardFrame = sender.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        let keyboardHeight = keyboardFrame.cgRectValue.height

        // ⭐️ 이 조건을 넣어주지 않으면, 각각의 텍스트필드마다 keyboardWillShow 동작이 실행되므로 아래와 같은 현상이 발생
        if view.frame.origin.y == 0 {
            view.frame.origin.y -= keyboardHeight
        }
    }

    @objc func keyboardWillHide(_ sender: Notification) {
        if view.frame.origin.y != 0 {
            view.frame.origin.y = 0
        }
    }

                                               
    func dataUpdate(){
        print("hgdhgfhgfgh")
//        guard let regNumString = userD.object(forKey: USER_KEY.KSR_REGISTRATION_NUMBER) as? String else {
//            toastShow(message: "reg_num is nil error")
//            return
//        }
        
        let regNumString = "SB-12500-1"
        
        
        Server.getData(type: Server.InfoType.BLOOD_USER, otherInfo: ["reg_num":"SB-12500-1"]) { (kData : Data?) in
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
                        
                        
//                        self.bloodPressureNoteView.bloodPressureGoalAndRateView.goalView.valueLabelUpdate(labelIndex: 0, valueLabelString: "수축기", valueString: " \(max) ", unitString: "mmHg")
                        
                        
                        
                        self.bloodPressureListView.dataScrollView.goalView.valueLabelUpdate(labelIndex: 0, valueLabelString: "수축기", valueString: " \(max) ", unitString: "mmHg")
                        self.bloodPressureListView.graphScrollView.goalView.valueLabelUpdate(labelIndex: 0, valueLabelString: "수축기", valueString: " \(max) ", unitString: "mmHg")
                        
//                        self.bloodPressureNoteView.bloodPressureGoalAndRateView.goalView.valueLabelUpdate(labelIndex: 1, valueLabelString: "이완기", valueString: " \(min) ", unitString: "mmHg")
                        self.bloodPressureListView.dataScrollView.goalView.valueLabelUpdate(labelIndex: 1, valueLabelString: "이완기", valueString: " \(min) ", unitString: "mmHg")
                        self.bloodPressureListView.graphScrollView.goalView.valueLabelUpdate(labelIndex: 1, valueLabelString: "이완기", valueString: " \(min) ", unitString: "mmHg")
                        
                        
                        if let success = successValue , let cnt = cntValue {
                            let persent : Int
                            if cnt != 0 {
                                persent = Int(round((Double(success) / Double(cnt)) * 100))
                            }else{
                                persent = 0
                            }
//                            self.bloodPressureNoteView.bloodPressureGoalAndRateView.rateView.valueLabelUpdate(labelIndex: 0, valueLabelString: "수축기", valueString: " \(persent) ", unitString: "%")
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
//                            self.bloodPressureNoteView.bloodPressureGoalAndRateView.rateView.valueLabelUpdate(labelIndex: 1, valueLabelString: "이완기", valueString: " \(persent) ", unitString: "%")
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
    
    @objc func test(_ noti: Notification) {
        print("succestt")
        
        testBtn1.isHidden = true
        
//        BloodPressureWebView.isHidden = true
//        BloodPressureManagementNotebookView.isHidden = false
//        bloodPressureListView.isHidden = true
        

        
        
    }
    
    @objc func saveData(_ sender: UIButton) {
        
        if self.contractionInputView.text == "" {
            toastShow(message: "수축기를 입력하세요.")
            return
        }
        
        if self.relaxtionInputView.text == "" {
            toastShow(message: "이완기를 입력하세요.")
            return
        }
        
        if self.heartRateInputView.text == "" {
            toastShow(message: "맥박을 입력하세요.")
            return
        }
//        
        let max = self.contractionInputView.text!
        let min = self.relaxtionInputView.text!
        let pulse = self.heartRateInputView.text!
//        
//        guard let regNumString = userD.object(forKey: USER_KEY.KSR_REGISTRATION_NUMBER) as? String else {
//            toastShow(message: "reg_num is nil error")
//            return
//        }
        
        
        var formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd a HH:mm"
        var current_date_string = formatter.string(from: Date())
        print(current_date_string)
        
        var formatter_year = DateFormatter()
        formatter_year.dateFormat = "yyyy"
        var current_year_string = formatter_year.string(from: Date())
        print(current_year_string)
        
        var formatter_month = DateFormatter()
        formatter_month.dateFormat = "MM"
        var formatter_month_string = formatter_month.string(from: Date())
        print(formatter_month_string)
        
        var formatter_day = DateFormatter()
        formatter_day.dateFormat = "dd"
        var formatter_day_string = formatter_day.string(from: Date())
        print(formatter_day_string)
        
        var formatter_dayWeek = DateFormatter()
        formatter_dayWeek.dateFormat = "c"
        var formatter_dayWeek_string = formatter_dayWeek.string(from: Date())
        print(formatter_dayWeek_string)
        
        var formatter_week = DateFormatter()
        formatter_week.dateFormat = "w"
        var formatter_week_string = formatter_week.string(from: Date())
        print(formatter_week_string)
        
   
        
        
        let regNumString = "SB-12500-1"
        let sid = "\(UserDefaults.standard.object(forKey: "sid") ?? 0)"
//     let year = dateToStringWithFormat(formatString: "yyyy", date: today)
        let year = current_year_string
         
        let month = formatter_month_string
        let week = formatter_week_string
        let dayweek = formatter_dayWeek_string
        let day = formatter_day_string
        let dateTime = current_date_string
        
//
        let sendDataDic = [
            "user_sid":sid,
//            "reg_num":regNumString,
            "max":max,
            "min":min,
            "pulse":pulse,
            "year":year,
            "month":month,
            "week":week,
            "dayweek":dayweek,
            "day":day,
            "datetime":dateTime,
        ]
        print("sendDataDic:\n\(sendDataDic)")
        Server.getData(type: Server.InfoType.BLOOD_ADD, otherInfo: sendDataDic) { (kData : Data?) in
            if let data = kData {
                if let dataString : String = String(data: data, encoding: String.Encoding.utf8) {
                    print("dataString?:\(dataString)")
                    self.view.endEditing(true)
                    print("go")
//                    self.superCon?.segView.itemButtonPressed(button: (self.superCon?.segView.itemButtons[2])!)
                    
                }
            }
        }
        
        
    }
    
    @objc func rightButton2PressedList(_ button: UIButton) {
        self.bloodPressureListView.graphScrollView.isHidden = true
        self.bloodPressureListView.dataScrollView.isHidden = false

//        self.bloodPressureListView.dataScrollView.dataUpdate()
        dataUpdate()
    }
    
    @objc func rightButton2PressedGraph(_ button: UIButton) {
        
        self.bloodPressureListView.graphScrollView.isHidden = false
        self.bloodPressureListView.dataScrollView.isHidden = true

        self.bloodPressureListView.graphScrollView.dataUpdate(index: 1)
        
        
    }
    
    
    
   @objc func rightButton2Pressed(_ button: UIButton) {
   
           button.isSelected = !button.isSelected
           if button.isSelected {
               //그래프로 보기 -> 데이터로 보기 버튼 활성화
//               self.topBar.rightImageView2?.image = #imageLiteral(resourceName: "goForward")
               self.bloodPressureListView.graphScrollView.isHidden = false
               self.bloodPressureListView.dataScrollView.isHidden = true
   
               self.bloodPressureListView.graphScrollView.dataUpdate(index: 1)
           }else{
               //데이터로 보기 -> 그래프로 보기 버튼 활성화
//               self.topBar.rightImageView2?.image = #imageLiteral(resourceName: "goBack")
               self.bloodPressureListView.graphScrollView.isHidden = true
               self.bloodPressureListView.dataScrollView.isHidden = false
   
               self.bloodPressureListView.dataScrollView.dataUpdate()
           }
       }
    
    @objc func segButtonPressed(_ sender: UIButton) {
print("tab")
        self.view.endEditing(true)
        
        if sender.tag == 0 {
            UIView.animate(withDuration: 0.5, animations: { [self] in
              
            moveSelected(view: UnderBar, button: button1)
                
            })
            BloodPressureWebView.isHidden = false
            BloodPressureManagementNotebookView.isHidden = true
            bloodPressureListView.isHidden = true
            
            label1.textColor = .black
            label2.textColor = .lightGray
            label3.textColor = .lightGray
            
        } else if sender.tag == 1 {
            UIView.animate(withDuration: 0.5, animations: { [self] in
              
            moveSelected(view: UnderBar, button: button2)
                
            })
            
            
            BloodPressureWebView.isHidden = true
            BloodPressureManagementNotebookView.isHidden = false
            bloodPressureListView.isHidden = true
            
            label1.textColor = .lightGray
            label2.textColor = .black
            label3.textColor = .lightGray
        } else if sender.tag == 2 {
            UIView.animate(withDuration: 0.5, animations: { [self] in
              
            moveSelected(view: UnderBar, button: button3)
                
            })
            
            BloodPressureWebView.isHidden = true
            BloodPressureManagementNotebookView.isHidden = true
            bloodPressureListView.isHidden = false
            
            label1.textColor = .lightGray
            label2.textColor = .lightGray
            label3.textColor = .black
        }
    }
    
    
}
