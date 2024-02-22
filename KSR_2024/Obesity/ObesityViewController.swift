//
//  ObesityViewController.swift
//  KSR_2024
//
//  Created by m2comm on 2024/01/18.
//

import Foundation
import UIKit

class ObesityViewController: BaseViewController {
    
    var ObesityWebView : WebView!
    var ObesityManagementNotebookView : ObesityManagementNotebookView!
//    var BloodSugarRecordsView : BloodSugarRecordsView!
        var obesityListView : ObesityListView!
    
    var testBtn1: UIButton!
    var testBtn2: UIButton!
    
    var bmiCheck: UIButton!
    
    
    //
    var showLabel: UILabel!
    
    var circularProgressBarView: CircularProgressView!
        var circularViewDuration: TimeInterval = 2

    var random: CGFloat!
    //
    
    var heightInputView: UITextField!
    var weightInputView: UITextField!
    var sportsInputView: UITextField!
    var exerciseTime: UITextField!
    
    var UnderBar: UIView!
    var titleName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UnderBar = UIView(frame: CGRect(x: button1.center.x, y: naviBar.frame.maxY + 62, width: SCREEN.WIDTH / 8.8, height: 5))
        UnderBar.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        self.view.addSubview(UnderBar)

        
        buttons = [button1, button2, button3]
        
        self.buttons.forEach {
            $0.addTarget(self, action: #selector(segButtonPressed(_ :)), for: .touchUpInside)
        }
        
        titleName = UILabel()
//        titleName.text = titleLabel
        
        titleName.text = "비만관리 및 운동"
        titleName.font = UIFont(name: "SUITE-Regular", size: 20)
        
        naviBar.addSubview(titleName)
        
    
        titleName.translatesAutoresizingMaskIntoConstraints = false
        
        titleName.centerXAnchor.constraint(equalTo: naviBar.centerXAnchor).isActive = true
        titleName.centerYAnchor.constraint(equalTo: naviBar.centerYAnchor).isActive = true
        titleName.textAlignment = .center
        
        label1.text = "비만 관리\n도움말"
        label2.text = "비만\n관리수첩"
        label3.text = "비만 관리\n기록보기"
        
        label1.textColor = .black
        label2.textColor = .lightGray
        label3.textColor = .lightGray
        
        self.ObesityWebView = WebView(frame: CGRect(
            x: 0,
            y: menuView.frame.maxY,
            width: SCREEN.WIDTH,
            height: SCREEN.HEIGHT - menuView.frame.maxY), urlString: "http://ksrapp.m2comm.co.kr/html/care/care04_1.html#")
        
        ObesityManagementNotebookView = KSR_2024.ObesityManagementNotebookView(frame: CGRect(x: 0, y: scrollView.frame.minY, width: SCREEN.WIDTH, height: scrollView.frame.height))
        ObesityManagementNotebookView.backgroundColor = .white
        scrollView.addSubview(ObesityManagementNotebookView)
        
        self.view.addSubview(self.ObesityWebView)
        
        
        
        ObesityManagementNotebookView.bmiGraphVIew = UIView(frame: CGRect(x: 0, y: scrollView.frame.minY, width: self.view.frame.size.width, height: self.view.frame.size.height / 4))
        ObesityManagementNotebookView.bmiGraphVIew.backgroundColor = #colorLiteral(red: 0.2467908859, green: 0.3821293116, blue: 0.5973587036, alpha: 1)
//        BloodSugarManagementNotebookView.FastingBloodSugar.layer.borderWidth = 1
//        ObesityManagementNotebookView.bmiGraphVIew.layer.cornerRadius = 8
        scrollView.addSubview(ObesityManagementNotebookView.bmiGraphVIew)
        
        
        
        
        self.obesityListView = ObesityListView(frame: CGRect(
                    x: 0,
                    y: menuView.frame.maxY,
                    width: SCREEN.WIDTH,
                    height: SCREEN.HEIGHT))
        obesityListView.backgroundColor = .white
                self.view.addSubview(self.obesityListView)
        
        testBtn1 = UIButton(frame: CGRect(x: SCREEN.WIDTH / 2, y: 20, width: 100, height: 60))
        testBtn1.setTitle("리스트보기", for: .normal)
        testBtn1.setTitleColor(.black, for: .normal)
        testBtn1.layer.borderWidth = 1
        obesityListView.addSubview(testBtn1)
        testBtn1.addTarget(self, action: #selector(rightButton2PressedList(_ :)), for: .touchUpInside)
        
        
        testBtn2 = UIButton(frame: CGRect(x: testBtn1.frame.maxX + 5, y: 20, width: 100, height: 60))
        testBtn2.setTitle("그래프보기", for: .normal)
        testBtn2.setTitleColor(.black, for: .normal)
        testBtn2.layer.borderWidth = 1
        obesityListView.addSubview(testBtn2)
        testBtn2.addTarget(self, action: #selector(rightButton2PressedGraph(_ :)), for: .touchUpInside)
        
//        var bmiGraphVIewLabel: UILabel!
//        var bmiGraphVIewShowLabel: UILabel!
//        var bmiGraphVIewShowNumLabel: UILabel!
//        var bmiGraphVIewGraph: UIView!
        
        ObesityManagementNotebookView.bmiGraphVIewLabel = UILabel(frame: CGRect(x: 52, y: ObesityManagementNotebookView.bmiGraphVIew.frame.minY + 22, width: 130, height: ObesityManagementNotebookView.bmiGraphVIew.frame.size.height / 4))
        ObesityManagementNotebookView.bmiGraphVIewLabel.text = "   나의 BMI\n목표 수치는?"
        ObesityManagementNotebookView.bmiGraphVIewLabel.numberOfLines = 0
        ObesityManagementNotebookView.bmiGraphVIewLabel.textColor = .white
        ObesityManagementNotebookView.bmiGraphVIewLabel.font = UIFont.systemFont(ofSize: 20)
        if IS_IPHONE_N_PLUS {
            ObesityManagementNotebookView.bmiGraphVIewLabel.font = UIFont.systemFont(ofSize: 16)
        }
        if IS_IPHONE_X {
            ObesityManagementNotebookView.bmiGraphVIewLabel.font = UIFont.systemFont(ofSize: 17)
        }
        
        ObesityManagementNotebookView.bmiGraphVIew.addSubview(ObesityManagementNotebookView.bmiGraphVIewLabel)
        
        
        if IS_IPHONE_12PRO_MAX {
            ObesityManagementNotebookView.bmiGraphVIewShowLabel = UILabel(frame: CGRect(x: 38, y: ObesityManagementNotebookView.bmiGraphVIewLabel.frame.maxY + 10, width: self.view.frame.size.width / 2, height: ObesityManagementNotebookView.bmiGraphVIew.frame.size.height / 2))
            ObesityManagementNotebookView.bmiGraphVIewShowLabel.text = "18.5~23"
            ObesityManagementNotebookView.bmiGraphVIewShowLabel.textColor = .white
            ObesityManagementNotebookView.bmiGraphVIewShowLabel.font = UIFont.systemFont(ofSize: 37)
            if IS_IPHONE_N_PLUS {
                ObesityManagementNotebookView.bmiGraphVIewShowLabel.font = UIFont.systemFont(ofSize: 31)
            }
            
            ObesityManagementNotebookView.bmiGraphVIew.addSubview(ObesityManagementNotebookView.bmiGraphVIewShowLabel)
            
        }
        if IS_IPHONE_X {
            ObesityManagementNotebookView.bmiGraphVIewShowLabel = UILabel(frame: CGRect(x: 34, y: ObesityManagementNotebookView.bmiGraphVIewLabel.frame.maxY + 10, width: self.view.frame.size.width / 2, height: ObesityManagementNotebookView.bmiGraphVIew.frame.size.height / 2))
            ObesityManagementNotebookView.bmiGraphVIewShowLabel.text = "18.5~23"
            ObesityManagementNotebookView.bmiGraphVIewShowLabel.textColor = .white
           
                ObesityManagementNotebookView.bmiGraphVIewShowLabel.font = UIFont.systemFont(ofSize: 34)
            
            
            ObesityManagementNotebookView.bmiGraphVIew.addSubview(ObesityManagementNotebookView.bmiGraphVIewShowLabel)
        } 
        if IS_IPHONE_N_PLUS {
            ObesityManagementNotebookView.bmiGraphVIewShowLabel = UILabel(frame: CGRect(x: 38, y: ObesityManagementNotebookView.bmiGraphVIewLabel.frame.maxY + 10, width: self.view.frame.size.width / 2, height: ObesityManagementNotebookView.bmiGraphVIew.frame.size.height / 2))
            ObesityManagementNotebookView.bmiGraphVIewShowLabel.text = "18.5~23"
            ObesityManagementNotebookView.bmiGraphVIewShowLabel.textColor = .white
         
            
                ObesityManagementNotebookView.bmiGraphVIewShowLabel.font = UIFont.systemFont(ofSize: 31)
       
            
            ObesityManagementNotebookView.bmiGraphVIew.addSubview(ObesityManagementNotebookView.bmiGraphVIewShowLabel)
            
        }
        
        
        
        
        
        if IS_IPHONE_12PRO_MAX {
            ObesityManagementNotebookView.bmiGraphVIewShowNumLabel = UILabel(frame: CGRect(x: ObesityManagementNotebookView.bmiGraphVIew.frame.maxX - 150, y: ObesityManagementNotebookView.bmiGraphVIew.frame.minY + 20, width: self.view.frame.size.width / 2.5, height: ObesityManagementNotebookView.bmiGraphVIew.frame.size.height / 4))
            ObesityManagementNotebookView.bmiGraphVIewShowNumLabel.text = "목표 수치\n달성율은?"
            ObesityManagementNotebookView.bmiGraphVIewShowNumLabel.textColor = .white
            ObesityManagementNotebookView.bmiGraphVIewShowNumLabel.numberOfLines = 0
            ObesityManagementNotebookView.bmiGraphVIewShowNumLabel.font = UIFont.systemFont(ofSize: 20)
           
            
            ObesityManagementNotebookView.bmiGraphVIew.addSubview(ObesityManagementNotebookView.bmiGraphVIewShowNumLabel)
        }
        if IS_IPHONE_X {
            ObesityManagementNotebookView.bmiGraphVIewShowNumLabel = UILabel(frame: CGRect(x: ObesityManagementNotebookView.bmiGraphVIew.frame.maxX - 130, y: ObesityManagementNotebookView.bmiGraphVIew.frame.minY + 20, width: self.view.frame.size.width / 2.5, height: ObesityManagementNotebookView.bmiGraphVIew.frame.size.height / 4))
            ObesityManagementNotebookView.bmiGraphVIewShowNumLabel.text = "목표 수치\n달성율은?"
            ObesityManagementNotebookView.bmiGraphVIewShowNumLabel.textColor = .white
            ObesityManagementNotebookView.bmiGraphVIewShowNumLabel.numberOfLines = 0
           
           
           
                ObesityManagementNotebookView.bmiGraphVIewShowNumLabel.font = UIFont.systemFont(ofSize: 17)
            
            
            ObesityManagementNotebookView.bmiGraphVIew.addSubview(ObesityManagementNotebookView.bmiGraphVIewShowNumLabel)
        }
        if IS_IPHONE_N_PLUS {
            ObesityManagementNotebookView.bmiGraphVIewShowNumLabel = UILabel(frame: CGRect(x: ObesityManagementNotebookView.bmiGraphVIew.frame.maxX - 140, y: ObesityManagementNotebookView.bmiGraphVIew.frame.minY + 20, width: self.view.frame.size.width / 2.5, height: ObesityManagementNotebookView.bmiGraphVIew.frame.size.height / 4))
            ObesityManagementNotebookView.bmiGraphVIewShowNumLabel.text = "목표 수치\n달성율은?"
            ObesityManagementNotebookView.bmiGraphVIewShowNumLabel.textColor = .white
            ObesityManagementNotebookView.bmiGraphVIewShowNumLabel.numberOfLines = 0
           
                ObesityManagementNotebookView.bmiGraphVIewShowNumLabel.font = UIFont.systemFont(ofSize: 16)
            
           
            
            ObesityManagementNotebookView.bmiGraphVIew.addSubview(ObesityManagementNotebookView.bmiGraphVIewShowNumLabel)
        }
            
        
        
        ObesityManagementNotebookView.bmiGraphVIewGraph = UIView(frame: CGRect(x: ObesityManagementNotebookView.bmiGraphVIewLabel.frame.maxX + 55, y: ObesityManagementNotebookView.bmiGraphVIewShowNumLabel.frame.maxY + 30, width: self.view.frame.size.width / 3.5, height: ObesityManagementNotebookView.bmiGraphVIew.frame.size.height / 2))
        ObesityManagementNotebookView.bmiGraphVIewGraph.backgroundColor = #colorLiteral(red: 0.2467908859, green: 0.3821293116, blue: 0.5973587036, alpha: 1)
        if IS_IPHONE_N_PLUS {
            ObesityManagementNotebookView.bmiGraphVIewGraph = UIView(frame: CGRect(x: ObesityManagementNotebookView.bmiGraphVIewLabel.frame.maxX + 60, y: ObesityManagementNotebookView.bmiGraphVIewShowNumLabel.frame.maxY + 10, width: self.view.frame.size.width / 3.5, height: ObesityManagementNotebookView.bmiGraphVIew.frame.size.height / 2))
        }
        if IS_IPHONE_X {
            ObesityManagementNotebookView.bmiGraphVIewGraph = UIView(frame: CGRect(x: ObesityManagementNotebookView.bmiGraphVIewLabel.frame.maxX + 50, y: ObesityManagementNotebookView.bmiGraphVIewShowNumLabel.frame.maxY + 12, width: self.view.frame.size.width / 3.5, height: ObesityManagementNotebookView.bmiGraphVIew.frame.size.height / 2))
        }
        
        
        ObesityManagementNotebookView.bmiGraphVIew.addSubview(ObesityManagementNotebookView.bmiGraphVIewGraph)
        
        
        //
        random = CGFloat(arc4random_uniform(UInt32(101))) //between 0 and n-1
        
        self.view.backgroundColor = .white
        // Do any additional setup after loading the view.
        if IS_IPHONE_12PRO_MAX {
            showLabel = UILabel(frame: CGRect(x: 42, y: 25, width: 40, height: 30))
            //        showLabel.layer.borderWidth = 1
            var changeShowLabel = Int(random)
            
            
            showLabel.text = "\(changeShowLabel ?? 00)%"
        }
        if IS_IPHONE_X {
            showLabel = UILabel(frame: CGRect(x: 23, y: 30, width: 40, height: 30))
            //        showLabel.layer.borderWidth = 1
            var changeShowLabel = Int(random)
            
            
            showLabel.text = "\(changeShowLabel ?? 00)%"
        }
        
        if IS_IPHONE_N_PLUS {
            showLabel = UILabel(frame: CGRect(x: 32, y: 26, width: 40, height: 30))
            //        showLabel.layer.borderWidth = 1
            var changeShowLabel = Int(random)
            
            
            showLabel.text = "\(changeShowLabel ?? 00)%"
        }
        
   
        
        
        if IS_IPHONE_12PRO_MAX {
            let ProgressView = CircularProgressView(frame: CGRect(x: 17, y: 0, width: 80, height: 80), lineWidth: 15, rounded: false)
            
            ProgressView.progressColor = .white
            
            ProgressView.trackColor = .lightGray
            
            //        ProgressView.center = ProgressView.center
            
            //        self.view.addSubview(ProgressView)
            ObesityManagementNotebookView.bmiGraphVIewGraph.addSubview(ProgressView)
            
            
            ProgressView.addSubview(showLabel)
            
            ProgressView.progress = random * 0.01
        }
        if IS_IPHONE_X {
            let ProgressView = CircularProgressView(frame: CGRect(x: 3, y: 5, width: 80, height: 80), lineWidth: 15, rounded: false)
            
            ProgressView.progressColor = .white
            
            ProgressView.trackColor = .lightGray
            
            //        ProgressView.center = ProgressView.center
            
            //        self.view.addSubview(ProgressView)
            ObesityManagementNotebookView.bmiGraphVIewGraph.addSubview(ProgressView)
            
            
            ProgressView.addSubview(showLabel)
            
            ProgressView.progress = random * 0.01
        }
        //
        if IS_IPHONE_N_PLUS {
            let ProgressView = CircularProgressView(frame: CGRect(x: 13, y: 5, width: 70, height: 70), lineWidth: 15, rounded: false)
            
            ProgressView.progressColor = .white
            
            ProgressView.trackColor = .lightGray
            
            //        ProgressView.center = ProgressView.center
            
            //        self.view.addSubview(ProgressView)
            ObesityManagementNotebookView.bmiGraphVIewGraph.addSubview(ProgressView)
            
            
            ProgressView.addSubview(showLabel)
            
            ProgressView.progress = random * 0.01
        }
        //
        
        
        
        var saveData = UILabel(frame: CGRect(x: 20, y: ObesityManagementNotebookView.bmiGraphVIewGraph.frame.maxY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 12))
        saveData.text = "키와 체중을 입력해주세요."
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

        
        if IS_IPHONE_12PRO_MAX {
            ObesityManagementNotebookView.dateLable = UILabel(frame: CGRect(x: dateViewLabel.frame.maxX + 110, y: dateViewLabel.frame.minY, width: 200, height: dateView.frame.height))
            ObesityManagementNotebookView.dateLable.text = formattedDateInString
            
            
            dateView.addSubview(ObesityManagementNotebookView.dateLable)
        }
        
        if IS_IPHONE_X {
            ObesityManagementNotebookView.dateLable = UILabel(frame: CGRect(x: dateViewLabel.frame.maxX + 85, y: dateViewLabel.frame.minY, width: 200, height: dateView.frame.height))
            ObesityManagementNotebookView.dateLable.text = formattedDateInString
            
            
            dateView.addSubview(ObesityManagementNotebookView.dateLable)
        }
        
        if IS_IPHONE_N_PLUS {
            ObesityManagementNotebookView.dateLable = UILabel(frame: CGRect(x: dateViewLabel.frame.maxX + 95, y: dateViewLabel.frame.minY, width: 200, height: dateView.frame.height))
            ObesityManagementNotebookView.dateLable.text = formattedDateInString
            
            
            dateView.addSubview(ObesityManagementNotebookView.dateLable)
        }
        
        
        
        var myHeightLabelView = UIView(frame: CGRect(x: 10, y: dateView.frame.maxY, width: saveView.frame.size.width - 20, height: self.view.frame.size.height / 14))
        myHeightLabelView.backgroundColor = .white
        
        saveView.addSubview(myHeightLabelView)
        
        var myHeightLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 80, height: dateView.frame.height))
        myHeightLabel.text = "키"
        myHeightLabelView.addSubview(myHeightLabel)
        
        heightInputView = UITextField(frame: CGRect(x: myHeightLabel.frame.maxX + 80, y: 0, width: myHeightLabel.frame.width * 2, height: myHeightLabel.frame.height))
        heightInputView.placeholder = "측정치를 적어주세요."
        myHeightLabelView.addSubview(heightInputView)
        
        var myWeightView = UIView(frame: CGRect(x: 10, y: myHeightLabelView.frame.maxY, width: saveView.frame.size.width - 20, height: self.view.frame.size.height / 14))
        myWeightView.backgroundColor = .white
        
        saveView.addSubview(myWeightView)
        
        var myWeightLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 80, height: dateView.frame.height))
        myWeightLabel.text = "체중"
        myWeightView.addSubview(myWeightLabel)
        
        weightInputView = UITextField(frame: CGRect(x: myWeightLabel.frame.maxX + 80, y: 0, width: myWeightLabel.frame.width * 2, height: myWeightLabel.frame.height))
        weightInputView.placeholder = "측정치를 적어주세요."
        myWeightView.addSubview(weightInputView)
        
        var gyView = UIView(frame: CGRect(x: 10, y: myWeightView.frame.maxY, width: saveView.frame.size.width - 20, height: self.view.frame.size.height / 14))
        gyView.backgroundColor = .white
        
        saveView.addSubview(gyView)
        
        bmiCheck = UIButton(frame: CGRect(x: 20, y: myWeightView.frame.maxY + 5,  width: saveView.frame.size.width - 40, height: self.view.frame.size.height / 13))
        bmiCheck.setTitle("나의 BMI확인하기", for: .normal)
        bmiCheck.setTitleColor(.black, for: .normal)
        bmiCheck.layer.borderWidth = 1
        bmiCheck.layer.cornerRadius = 8
    
        saveView.addSubview(bmiCheck)
        
        
        
        
        var gymSaveData = UILabel(frame: CGRect(x: 20, y: saveView.frame.maxY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 12))
        gymSaveData.text = "운동 시간을 입력해주세요."
        gymSaveData.font = UIFont.systemFont(ofSize: 18)
        
        scrollView.addSubview(gymSaveData)
        
        var gymSaveView: UIView!
        
//        var afterBTN: UIButton!
//        var beforeBTN: UIButton!
//        var bloodTF: UITextField!
//        var glycated: UITextField!
        
        gymSaveView = UIView(frame: CGRect(x: 20, y: gymSaveData.frame.maxY + 10, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 5.5))
        gymSaveView.backgroundColor = .white
//        saveView.layer.borderWidth = 1
        gymSaveView.layer.cornerRadius = 8
        scrollView.addSubview(gymSaveView)
        
        var gymKindView = UIView(frame: CGRect(x: 10, y: 5, width: saveView.frame.size.width - 20, height: self.view.frame.size.height / 14))
        gymKindView.backgroundColor = .white
        
        gymSaveView.addSubview(gymKindView)
        
        var gymKindViewLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 80, height: dateView.frame.height))
        gymKindViewLabel.text = "운동종목"
        gymKindView.addSubview(gymKindViewLabel)
        
        sportsInputView = UITextField(frame: CGRect(x: gymKindViewLabel.frame.maxX + 80, y: 0, width: gymKindViewLabel.frame.width * 2, height: gymKindViewLabel.frame.height))
        sportsInputView.placeholder = "측정치를 적어주세요."
        gymKindView.addSubview(sportsInputView)
        
        
        var gymTimeView = UIView(frame: CGRect(x: 10, y: gymKindView.frame.maxY, width: saveView.frame.size.width - 20, height: self.view.frame.size.height / 14))
        gymTimeView.backgroundColor = .white
        
        gymSaveView.addSubview(gymTimeView)
        
        var gymTimeViewLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 80, height: dateView.frame.height))
        gymTimeViewLabel.text = "운동시간"
        gymTimeView.addSubview(gymTimeViewLabel)
        
        exerciseTime = UITextField(frame: CGRect(x: gymTimeViewLabel.frame.maxX + 80, y: 0, width: gymTimeViewLabel.frame.width * 2, height: gymTimeViewLabel.frame.height))
        exerciseTime.placeholder = "측정치를 적어주세요."
        gymTimeView.addSubview(exerciseTime)
     
        
        let cancelBTN = UIButton(frame: CGRect(x: 0, y: gymSaveView.frame.maxY + 10, width: self.view.frame.size.width / 2, height: self.view.frame.size.height / 12))
        cancelBTN.setTitle("취소", for: .normal)
        cancelBTN.backgroundColor = #colorLiteral(red: 0.6152173877, green: 0.6653684974, blue: 0.7206344604, alpha: 1)
        scrollView.addSubview(cancelBTN)
        
        let saveBTN = UIButton(frame: CGRect(x: cancelBTN.frame.maxX, y: gymSaveView.frame.maxY + 10, width: self.view.frame.size.width / 2, height: self.view.frame.size.height / 12))
        saveBTN.setTitle("저장", for: .normal)
        saveBTN.backgroundColor = #colorLiteral(red: 0.1400382817, green: 0.3497706652, blue: 0.5862404704, alpha: 1)
        saveBTN.addTarget(self, action: #selector(saveData(_ :)), for: .touchUpInside)
        scrollView.addSubview(saveBTN)
        
        
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: menuView.frame.maxY).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: saveBTN.bottomAnchor, constant: 50).isActive = true
        
        ObesityWebView.isHidden = false
        ObesityManagementNotebookView.isHidden = true
        obesityListView.isHidden = true
    }
    
    func rightButton2Pressed(button: UIButton) {
   
           button.isSelected = !button.isSelected
           if button.isSelected {
               //그래프로 보기 -> 데이터로 보기 버튼 활성화
//               self.topBar.rightImageView2?.image = #imageLiteral(resourceName: "list")
               self.obesityListView.graphScrollView.isHidden = false
               self.obesityListView.dataScrollView.isHidden = true
   
               self.obesityListView.graphScrollView.dataUpdate(index: 1)
           }else{
               //데이터로 보기 -> 그래프로 보기 버튼 활성화
//               self.topBar.rightImageView2?.image = #imageLiteral(resourceName: "graph")
               self.obesityListView.graphScrollView.isHidden = true
               self.obesityListView.dataScrollView.isHidden = false
   
               self.obesityListView.dataScrollView.dataUpdate()
           }
       }
    
    @objc func rightButton2PressedList(_ button: UIButton) {
        self.obesityListView.graphScrollView.isHidden = true
        self.obesityListView.dataScrollView.isHidden = false

        self.obesityListView.dataScrollView.dataUpdate()
    }
    
    @objc func rightButton2PressedGraph(_ button: UIButton) {
        
        self.obesityListView.graphScrollView.isHidden = false
        self.obesityListView.dataScrollView.isHidden = true

//        self.bloodSugarListView.graphScrollView.dataUpdate(index: 1)
        
        
    }
    
    func moveSelected(view :UIView, button: UIButton) {
        view.center.x = button.center.x
    }
    
    @objc func segButtonPressed(_ sender: UIButton) {
print("tab")
        self.view.endEditing(true)
        
        if sender.tag == 0 {
            UIView.animate(withDuration: 0.5, animations: { [self] in
              
            moveSelected(view: UnderBar, button: button1)
                
            })
            ObesityWebView.isHidden = false
            ObesityManagementNotebookView.isHidden = true
            obesityListView.isHidden = true
            
            label1.textColor = .black
            label2.textColor = .lightGray
            label3.textColor = .lightGray
            
        } else if sender.tag == 1 {
            UIView.animate(withDuration: 0.5, animations: { [self] in
              
            moveSelected(view: UnderBar, button: button2)
                
            })
            ObesityWebView.isHidden = true
            ObesityManagementNotebookView.isHidden = false
            obesityListView.isHidden = true
            
            label1.textColor = .lightGray
            label2.textColor = .black
            label3.textColor = .lightGray
        } else if sender.tag == 2 {
            UIView.animate(withDuration: 0.5, animations: { [self] in
              
            moveSelected(view: UnderBar, button: button3)
                
            })
            ObesityWebView.isHidden = true
            ObesityManagementNotebookView.isHidden = true
            obesityListView.isHidden = false
            
            label1.textColor = .lightGray
            label2.textColor = .lightGray
            label3.textColor = .black
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
    
    @objc func saveData(_ sender: UIButton) {
        
        if self.heightInputView.text == "" {
            toastShow(message: "키를 입력하세요.")
            return
        }
        
        if self.weightInputView.text == "" {
            toastShow(message: "몸무게를 입력하세요.")
            return
        }
        
        if self.sportsInputView.text == "" {
            toastShow(message: "운동종목을 입력하세요.")
            return
        }
        
        if self.exerciseTime.text == "" {
            toastShow(message: "운동시간을 입력하세요.")
            return
        }
//

        
        
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
        
        
//        guard let regNumString = userD.object(forKey: USER_KEY.KSR_REGISTRATION_NUMBER) as? String else {
//            toastShow(message: "reg_num is nil error")
//            return
//        }

        
        let height = self.heightInputView.text!
        let weight = self.weightInputView.text!
        
        

        let heightValue = height.toCGFloat()!
        let weightValue = weight.toCGFloat()!
        
        let bmi = "\(getBMI(weight: weightValue, height: heightValue))"
        
        let gubun = self.sportsInputView.text!
        let min = self.exerciseTime.text!
        
        
        //?/
//        new HttpParam("height", height.getText().toString()),
//        new HttpParam("weight", weight.getText().toString()),
//        new HttpParam("bmi", bmi),
//        new HttpParam("gubun", gubun.getText().toString()),
//        new HttpParam("min", min.getText().toString()),
//        new HttpParam("year", ""+dateSelected.get(Calendar.YEAR)),
//        new HttpParam("month", ""+(dateSelected.get(Calendar.MONTH)+1)),
//        new HttpParam("week", ""+dateSelected.get(Calendar.WEEK_OF_YEAR)),
//        new HttpParam("dayweek", ""+dateSelected.get(Calendar.DAY_OF_WEEK)),
//        new HttpParam("day", ""+dateSelected.get(Calendar.DATE)),
//        new HttpParam("datetime", datetime.getText().toString()));


        
        
        let sendDataDic = [
            "user_sid":sid,
//            "reg_num":regNumString,
            "height":height,
            "weight":weight,
            "bmi":bmi,
            "gubun":gubun,
            "min":min,
            "year":year,
            "month":month,
            "week":week,
            "dayweek":dayweek,
            "day":day,
            "datetime":dateTime,
            ]
        print("sendDataDic:\n\(sendDataDic)")
        Server.getData(type: Server.InfoType.BMI_ADD, otherInfo: sendDataDic) { (kData : Data?) in
            if let data = kData {
                if let dataString : String = String(data: data, encoding: String.Encoding.utf8) {
                    print("BMI_ADD:\(dataString)")
                    self.view.endEditing(true)
//                    self.superCon?.segView.itemButtonPressed(button: (self.superCon?.segView.itemButtons[2])!)
                }
            }
        }
        
        
    }
    
}
