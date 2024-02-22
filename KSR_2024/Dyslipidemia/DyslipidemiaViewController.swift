//
//  DyslipidemiaViewController.swift
//  KSR_2024
//
//  Created by m2comm on 2024/01/18.
//
//
import Foundation
import UIKit

class DyslipidemiaViewController: BaseViewController {
    
    var DyslipidemiaWebView : WebView!
    var DyslipidemiaManagementNotebookView : DyslipidemiaManagementNotebookView!
    var DyslipidemiaManagementTest : DyslipidemiaManagementTest!
    var set: UIView!
    
    var testBtn1: UIButton!
    var testBtn2: UIButton!
    
    var change: UIButton!
    
    //
    var showLabel: UILabel!
    
    var circularProgressBarView: CircularProgressView!
        var circularViewDuration: TimeInterval = 2

    var random: CGFloat!
    //
    var totalCholesterolGoal: UITextField!
    
    
    var cholesterolInputView: UITextField!
    var hdlInputView: UITextField!
    var ldlInputView: UITextField!
    var neutralFatInputView: UITextField!
    
    var goalCancelBTN: UIButton!
    var goalSaveBTN: UIButton!
    
    
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
        
        titleName = UILabel(frame: CGRect(x: self.view.frame.size.width / 2.6, y: 0, width: 150, height: naviBar.frame.height))
//        titleName.text = titleLabel
        
        titleName.text = "이상지질혈증"
        titleName.font = UIFont(name: "SUITE-Regular", size: 20)
        
        naviBar.addSubview(titleName)
        
        label1.text = "관리\n도움말"
        label2.text = "이상지질혈증\n관리수첩"
        label3.text = "이상지질혈증\n기록보기"
        
        label1.textColor = .black
        label2.textColor = .lightGray
        label3.textColor = .lightGray
        
        
        
        
        self.DyslipidemiaWebView = WebView(frame: CGRect(
            x: 0,
            y: menuView.frame.maxY,
            width: SCREEN.WIDTH,
            height: SCREEN.HEIGHT - menuView.frame.maxY), urlString: "http://ksrapp.m2comm.co.kr/html/care/care03_1.html")
        
        DyslipidemiaManagementNotebookView = KSR_2024.DyslipidemiaManagementNotebookView(frame: CGRect(x: 0, y: scrollView.frame.minY, width: SCREEN.WIDTH, height: scrollView.frame.height))
        DyslipidemiaManagementNotebookView.backgroundColor = .white
        scrollView.addSubview(DyslipidemiaManagementNotebookView)
        
        self.view.addSubview(self.DyslipidemiaWebView)
        
        self.DyslipidemiaManagementTest = KSR_2024.DyslipidemiaManagementTest(frame: CGRect(
            x: 0,
            y: menuView.frame.maxY,
            width: SCREEN.WIDTH,
            height: SCREEN.HEIGHT - menuView.frame.maxY))
        
        self.DyslipidemiaManagementTest.backgroundColor = .white
        self.view.addSubview(self.DyslipidemiaManagementTest)
        
        
        testBtn1 = UIButton(frame: CGRect(x: SCREEN.WIDTH / 2, y: 20, width: 100, height: 60))
        testBtn1.setTitle("리스트보기", for: .normal)
        testBtn1.setTitleColor(.black, for: .normal)
        testBtn1.layer.borderWidth = 1
        DyslipidemiaManagementTest.addSubview(testBtn1)
        testBtn1.addTarget(self, action: #selector(rightButton2PressedList(_ :)), for: .touchUpInside)
        
        
        testBtn2 = UIButton(frame: CGRect(x: testBtn1.frame.maxX + 5, y: 20, width: 100, height: 60))
        testBtn2.setTitle("그래프보기", for: .normal)
        testBtn2.setTitleColor(.black, for: .normal)
        testBtn2.layer.borderWidth = 1
        DyslipidemiaManagementTest.addSubview(testBtn2)
        testBtn2.addTarget(self, action: #selector(rightButton2PressedGraph(_ :)), for: .touchUpInside)
        
        DyslipidemiaManagementNotebookView.DyslipidemiahVIew = UIView(frame: CGRect(x: 0, y: scrollView.frame.minY, width: self.view.frame.size.width, height: self.view.frame.size.height / 4))
        DyslipidemiaManagementNotebookView.DyslipidemiahVIew.backgroundColor = #colorLiteral(red: 0.8870372176, green: 0.396627903, blue: 0.2913144231, alpha: 1)
//        BloodSugarManagementNotebookView.FastingBloodSugar.layer.borderWidth = 1
//        ObesityManagementNotebookView.bmiGraphVIew.layer.cornerRadius = 8
        scrollView.addSubview(DyslipidemiaManagementNotebookView.DyslipidemiahVIew)
        
   
        
        DyslipidemiaManagementNotebookView.DyslipidemiaVIewLabel = UILabel(frame: CGRect(x: 50, y: DyslipidemiaManagementNotebookView.DyslipidemiahVIew.frame.minY + 20, width: self.view.frame.size.width / 3, height: DyslipidemiaManagementNotebookView.DyslipidemiahVIew.frame.size.height / 4))
        DyslipidemiaManagementNotebookView.DyslipidemiaVIewLabel.text = "나의 콜레스테롤\n  목표 수치는?"
        DyslipidemiaManagementNotebookView.DyslipidemiaVIewLabel.numberOfLines = 0
        DyslipidemiaManagementNotebookView.DyslipidemiaVIewLabel.textColor = .white
        DyslipidemiaManagementNotebookView.DyslipidemiaVIewLabel.font = UIFont.systemFont(ofSize: 20)
        if IS_IPHONE_N_PLUS {
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewLabel.font = UIFont.systemFont(ofSize: 16)
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewLabel.numberOfLines = 0
        }
        if IS_IPHONE_X {
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewLabel.font = UIFont.systemFont(ofSize: 18)
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewLabel.numberOfLines = 0
        }

        DyslipidemiaManagementNotebookView.DyslipidemiahVIew.addSubview(DyslipidemiaManagementNotebookView.DyslipidemiaVIewLabel)

        DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowNumLabelNumber = UILabel(frame: CGRect(x: 50, y: DyslipidemiaManagementNotebookView.DyslipidemiaVIewLabel.frame.maxY + 2, width: 50, height: DyslipidemiaManagementNotebookView.DyslipidemiahVIew.frame.size.height / 3))
        DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowNumLabelNumber.text = "120"
        DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowNumLabelNumber.textColor = .white
        DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowNumLabelNumber.textAlignment = .right
        DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowNumLabelNumber.font = UIFont.systemFont(ofSize: 27)
        if IS_IPHONE_N_PLUS {
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowNumLabelNumber.font = UIFont.systemFont(ofSize: 23)
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowNumLabelNumber.numberOfLines = 0
        }
        if IS_IPHONE_X {
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowNumLabelNumber.font = UIFont.systemFont(ofSize: 25)
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowNumLabelNumber.numberOfLines = 0
        }

        DyslipidemiaManagementNotebookView.DyslipidemiahVIew.addSubview(DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowNumLabelNumber)
        
        
        DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowNumLabel = UILabel(frame: CGRect(x: DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowNumLabelNumber.frame.maxX + 5, y: DyslipidemiaManagementNotebookView.DyslipidemiaVIewLabel.frame.maxY + 2, width: 50, height: DyslipidemiaManagementNotebookView.DyslipidemiahVIew.frame.size.height / 3))
        DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowNumLabel.textAlignment = .center
        DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowNumLabel.text = "mg/dL"
        DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowNumLabel.textColor = .white
        DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowNumLabel.font = UIFont.systemFont(ofSize: 16)
        if IS_IPHONE_N_PLUS {
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowNumLabel.font = UIFont.systemFont(ofSize: 12)
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowNumLabel.numberOfLines = 0
        }
        if IS_IPHONE_X {
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowNumLabel.font = UIFont.systemFont(ofSize: 12)
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowNumLabel.numberOfLines = 0
        }

        DyslipidemiaManagementNotebookView.DyslipidemiahVIew.addSubview(DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowNumLabel)

        DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowLabel = UILabel(frame: CGRect(x: DyslipidemiaManagementNotebookView.DyslipidemiahVIew.frame.maxX - 130, y: DyslipidemiaManagementNotebookView.DyslipidemiahVIew.frame.minY + 20, width: self.view.frame.size.width / 2.5, height: DyslipidemiaManagementNotebookView.DyslipidemiahVIew.frame.size.height / 4))
        DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowLabel.text = "목표 수치\n달성율은?"
        DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowLabel.numberOfLines = 0
        DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowLabel.textColor = .white
        DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowLabel.font = UIFont.systemFont(ofSize: 20)
        if IS_IPHONE_N_PLUS {
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowLabel.font = UIFont.systemFont(ofSize: 16)
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowLabel.numberOfLines = 0
        }
        if IS_IPHONE_X {
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowLabel.font = UIFont.systemFont(ofSize: 18)
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowLabel.numberOfLines = 0
        }

        DyslipidemiaManagementNotebookView.DyslipidemiahVIew.addSubview(DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowLabel)
//

        DyslipidemiaManagementNotebookView.DyslipidemiaVIewGraph = UIView(frame: CGRect(x: DyslipidemiaManagementNotebookView.DyslipidemiaVIewLabel.frame.maxX + 50, y: DyslipidemiaManagementNotebookView.DyslipidemiaVIewLabel.frame.maxY + 20, width: self.view.frame.size.width / 2.8, height: DyslipidemiaManagementNotebookView.DyslipidemiahVIew.frame.size.height / 2))
        DyslipidemiaManagementNotebookView.DyslipidemiaVIewGraph.backgroundColor = #colorLiteral(red: 0.8870372176, green: 0.396627903, blue: 0.2913144231, alpha: 1)

        if IS_IPHONE_N_PLUS {
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewGraph = UIView(frame: CGRect(x: DyslipidemiaManagementNotebookView.DyslipidemiaVIewLabel.frame.maxX + 30, y: DyslipidemiaManagementNotebookView.DyslipidemiaVIewLabel.frame.maxY, width: self.view.frame.size.width / 2.8, height: DyslipidemiaManagementNotebookView.DyslipidemiahVIew.frame.size.height / 2))
        }
        if IS_IPHONE_X {
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewGraph = UIView(frame: CGRect(x: DyslipidemiaManagementNotebookView.DyslipidemiaVIewLabel.frame.maxX, y: DyslipidemiaManagementNotebookView.DyslipidemiaVIewLabel.frame.maxY, width: self.view.frame.size.width / 2.8, height: DyslipidemiaManagementNotebookView.DyslipidemiahVIew.frame.size.height / 2))
        }
        
        DyslipidemiaManagementNotebookView.DyslipidemiahVIew.addSubview(DyslipidemiaManagementNotebookView.DyslipidemiaVIewGraph)
        
        //
        random = CGFloat(arc4random_uniform(UInt32(101))) //between 0 and n-1
        
//        self.view.backgroundColor = .white
        // Do any additional setup after loading the view.
        
        showLabel = UILabel(frame: CGRect(x: 37, y: 25, width: 40, height: 30))
        if IS_IPHONE_N_PLUS {
            showLabel = UILabel(frame: CGRect(x: 51, y: 29, width: 40, height: 30))
        }
        if IS_IPHONE_X {
            showLabel = UILabel(frame: CGRect(x: 48, y: 32, width: 40, height: 30))
        }
        if IS_IPHONE_12PRO_MAX {
            showLabel = UILabel(frame: CGRect(x: 51, y: 33, width: 40, height: 30))
        }
//        showLabel.layer.borderWidth = 1
        
        var changeShowLabel = Int(random)
        
        
        
        showLabel.text = "\(changeShowLabel ?? 00)%"
        
        
        
        
        if IS_IPHONE_X {
            let ProgressView = CircularProgressView(frame: CGRect(x: 30, y: 10, width: 80, height: 80), lineWidth: 15, rounded: false)
            
            ProgressView.progressColor = .white
            
            ProgressView.trackColor = .lightGray
            
            //        ProgressView.center = ProgressView.center
            
            //        self.view.addSubview(ProgressView)
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewGraph.addSubview(ProgressView)
            
            
            ProgressView.addSubview(showLabel)
            
            ProgressView.progress = random * 0.01
        } else if IS_IPHONE_12PRO_MAX {
            let ProgressView = CircularProgressView(frame: CGRect(x: 28, y: 10, width: 80, height: 80), lineWidth: 15, rounded: false)
            
            ProgressView.progressColor = .white
            
            ProgressView.trackColor = .lightGray
            
            //        ProgressView.center = ProgressView.center
            
            //        self.view.addSubview(ProgressView)
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewGraph.addSubview(ProgressView)
            
            
            ProgressView.addSubview(showLabel)
            
            ProgressView.progress = random * 0.01
        } else if IS_IPHONE_N_PLUS {
            let ProgressView = CircularProgressView(frame: CGRect(x: 30, y: 10, width: 70, height: 70), lineWidth: 15, rounded: false)
            
            ProgressView.progressColor = .white
            
            ProgressView.trackColor = .lightGray
            
            //        ProgressView.center = ProgressView.center
            
            //        self.view.addSubview(ProgressView)
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewGraph.addSubview(ProgressView)
            
            
            ProgressView.addSubview(showLabel)
            
            ProgressView.progress = random * 0.01
        }
  
        //
        
        
        
        
        
        
        if IS_IPHONE_X {
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewBTN = UIButton(frame: CGRect(x: DyslipidemiaManagementNotebookView.DyslipidemiaVIewLabel.frame.minX + 2, y: DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowNumLabel.frame.maxY + 15, width: 100, height: DyslipidemiaManagementNotebookView.DyslipidemiahVIew.frame.size.height / 10))
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewBTN.setTitle("나의 목표 수정", for: .normal)
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewBTN.titleLabel?.font = UIFont.systemFont(ofSize: 12)
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewBTN.layer.borderWidth = 1
            
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewBTN.layer.cornerRadius = 12
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewBTN.addTarget(self, action: #selector(show(_ :)), for: .touchUpInside)
            
            DyslipidemiaManagementNotebookView.DyslipidemiahVIew.addSubview(DyslipidemiaManagementNotebookView.DyslipidemiaVIewBTN)
        } else {
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewBTN = UIButton(frame: CGRect(x: DyslipidemiaManagementNotebookView.DyslipidemiaVIewLabel.frame.minX, y: DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowNumLabel.frame.maxY + 15, width: 110, height: DyslipidemiaManagementNotebookView.DyslipidemiahVIew.frame.size.height / 10))
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewBTN.setTitle("나의 목표 수정", for: .normal)
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewBTN.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewBTN.layer.borderWidth = 1
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewBTN.layer.cornerRadius = 12
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewBTN.addTarget(self, action: #selector(show(_ :)), for: .touchUpInside)
            
            DyslipidemiaManagementNotebookView.DyslipidemiahVIew.addSubview(DyslipidemiaManagementNotebookView.DyslipidemiaVIewBTN)
        }
        
        var saveData = UILabel(frame: CGRect(x: 20, y: DyslipidemiaManagementNotebookView.DyslipidemiahVIew.frame.maxY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 12))
        saveData.text = "혈중 지질 수치를 입력해주세요."
        saveData.font = UIFont.systemFont(ofSize: 18)
        
        scrollView.addSubview(saveData)
        
        var saveView: UIView!
        
//        var afterBTN: UIButton!
//        var beforeBTN: UIButton!
//        var bloodTF: UITextField!
//        var glycated: UITextField!
        
        saveView = UIView(frame: CGRect(x: 20, y: saveData.frame.maxY + 10, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 2.5))
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

        
        if IS_IPHONE_X {
            DyslipidemiaManagementNotebookView.dateLable = UILabel(frame: CGRect(x: dateViewLabel.frame.maxX + 90, y: dateViewLabel.frame.minY, width: 200, height: dateView.frame.height))
            DyslipidemiaManagementNotebookView.dateLable.text = formattedDateInString
            
            dateView.addSubview(DyslipidemiaManagementNotebookView.dateLable)
        } else {
            DyslipidemiaManagementNotebookView.dateLable = UILabel(frame: CGRect(x: dateViewLabel.frame.maxX + 115, y: dateViewLabel.frame.minY, width: 200, height: dateView.frame.height))
            DyslipidemiaManagementNotebookView.dateLable.text = formattedDateInString
            
            dateView.addSubview(DyslipidemiaManagementNotebookView.dateLable)
        }
        
        var mycholesterolView = UIView(frame: CGRect(x: 10, y: dateView.frame.maxY, width: saveView.frame.size.width - 20, height: self.view.frame.size.height / 14))
        mycholesterolView.backgroundColor = .white
        
        saveView.addSubview(mycholesterolView)
        
        var mycholesterolViewLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 100, height: dateView.frame.height))
        mycholesterolViewLabel.text = "총 콜레스테롤"
        mycholesterolViewLabel.font = UIFont.systemFont(ofSize: 16)
        if IS_IPHONE_N_PLUS {
            mycholesterolViewLabel.font = UIFont.systemFont(ofSize: 12)
        }
        mycholesterolView.addSubview(mycholesterolViewLabel)
        
        
        
//        cholesterolInputView = UITextField(frame: CGRect(x: mycholesterolViewLabel.frame.maxX + 75, y: 0, width: mycholesterolViewLabel.frame.width * 2, height: mycholesterolViewLabel.frame.height))
//        cholesterolInputView.placeholder = "측정치를 적어주세요."
//        mycholesterolView.addSubview(cholesterolInputView)
        if IS_IPHONE_X {
            cholesterolInputView = UITextField(frame: CGRect(x: mycholesterolViewLabel.frame.maxX + 72, y: 0, width: mycholesterolViewLabel.frame.width * 2, height: mycholesterolViewLabel.frame.height))
            cholesterolInputView.placeholder = "측정치를 적어주세요."
            mycholesterolView.addSubview(cholesterolInputView)
        }
        if IS_IPHONE_N_PLUS {
            cholesterolInputView = UITextField(frame: CGRect(x: mycholesterolViewLabel.frame.maxX + 78, y: 0, width: mycholesterolViewLabel.frame.width * 2, height: mycholesterolViewLabel.frame.height))
            cholesterolInputView.placeholder = "측정치를 적어주세요."
            mycholesterolView.addSubview(cholesterolInputView)
        }
        if IS_IPHONE_12PRO_MAX {
            cholesterolInputView = UITextField(frame: CGRect(x: mycholesterolViewLabel.frame.maxX + 80, y: 0, width: mycholesterolViewLabel.frame.width * 2, height: mycholesterolViewLabel.frame.height))
            cholesterolInputView.placeholder = "측정치를 적어주세요."
            mycholesterolView.addSubview(cholesterolInputView)
        }
        
        
        var myHdlCholesterolView = UIView(frame: CGRect(x: 10, y: mycholesterolView.frame.maxY, width: saveView.frame.size.width - 20, height: self.view.frame.size.height / 14))
        myHdlCholesterolView.backgroundColor = .white
        
        saveView.addSubview(myHdlCholesterolView)
        
        var myHdlCholesterolViewLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 105, height: dateView.frame.height))
        myHdlCholesterolViewLabel.text = "HDL콜레스테롤"
        myHdlCholesterolViewLabel.font = UIFont.systemFont(ofSize: 16)
        if IS_IPHONE_N_PLUS {
            myHdlCholesterolViewLabel.font = UIFont.systemFont(ofSize: 12)
        }
        myHdlCholesterolView.addSubview(myHdlCholesterolViewLabel)
        
        
     
        if IS_IPHONE_X {
            hdlInputView = UITextField(frame: CGRect(x: myHdlCholesterolViewLabel.frame.maxX + 71, y: 0, width: myHdlCholesterolViewLabel.frame.width * 2, height: myHdlCholesterolViewLabel.frame.height))
            hdlInputView.placeholder = "측정치를 적어주세요."
            myHdlCholesterolView.addSubview(hdlInputView)
        }
        if IS_IPHONE_N_PLUS {
            hdlInputView = UITextField(frame: CGRect(x: myHdlCholesterolViewLabel.frame.maxX + 78, y: 0, width: myHdlCholesterolViewLabel.frame.width * 2, height: myHdlCholesterolViewLabel.frame.height))
            hdlInputView.placeholder = "측정치를 적어주세요."
            myHdlCholesterolView.addSubview(hdlInputView)
        }
        if IS_IPHONE_12PRO_MAX {
            hdlInputView = UITextField(frame: CGRect(x: myHdlCholesterolViewLabel.frame.maxX + 80, y: 0, width: myHdlCholesterolViewLabel.frame.width * 2, height: myHdlCholesterolViewLabel.frame.height))
            hdlInputView.placeholder = "측정치를 적어주세요."
            myHdlCholesterolView.addSubview(hdlInputView)
        }
        
        var myLdlCholesterolView = UIView(frame: CGRect(x: 10, y: myHdlCholesterolView.frame.maxY, width: saveView.frame.size.width - 20, height: self.view.frame.size.height / 14))
        myLdlCholesterolView.backgroundColor = .white
        
        saveView.addSubview(myLdlCholesterolView)
        
        var myLdlCholesterolViewLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 105, height: dateView.frame.height))
        myLdlCholesterolViewLabel.text = "LDL콜레스테롤"
        myLdlCholesterolViewLabel.font = UIFont.systemFont(ofSize: 16)
        if IS_IPHONE_N_PLUS {
            myLdlCholesterolViewLabel.font = UIFont.systemFont(ofSize: 12)
        }
        myLdlCholesterolView.addSubview(myLdlCholesterolViewLabel)
        
        
        
        if IS_IPHONE_X {
            ldlInputView = UITextField(frame: CGRect(x: myLdlCholesterolViewLabel.frame.maxX + 71, y: 0, width: myLdlCholesterolViewLabel.frame.width * 2, height: myLdlCholesterolViewLabel.frame.height))
            ldlInputView.placeholder = "측정치를 적어주세요."
            myLdlCholesterolView.addSubview(ldlInputView)
        }
        if IS_IPHONE_N_PLUS {
            ldlInputView = UITextField(frame: CGRect(x: myLdlCholesterolViewLabel.frame.maxX + 78, y: 0, width: myLdlCholesterolViewLabel.frame.width * 2, height: myLdlCholesterolViewLabel.frame.height))
            ldlInputView.placeholder = "측정치를 적어주세요."
            myLdlCholesterolView.addSubview(ldlInputView)
        }
        if IS_IPHONE_12PRO_MAX {
            ldlInputView = UITextField(frame: CGRect(x: myLdlCholesterolViewLabel.frame.maxX + 80, y: 0, width: myLdlCholesterolViewLabel.frame.width * 2, height: myLdlCholesterolViewLabel.frame.height))
            ldlInputView.placeholder = "측정치를 적어주세요."
            myLdlCholesterolView.addSubview(ldlInputView)
        }
        
        var myneutralFatlView = UIView(frame: CGRect(x: 10, y: myLdlCholesterolView.frame.maxY, width: saveView.frame.size.width - 20, height: self.view.frame.size.height / 14))
        myLdlCholesterolView.backgroundColor = .white
        

        saveView.addSubview(myneutralFatlView)
        
        var myneutralFatlViewLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 100, height: dateView.frame.height))
        myneutralFatlViewLabel.text = "중성지방"
        myneutralFatlViewLabel.font = UIFont.systemFont(ofSize: 16)
        if IS_IPHONE_N_PLUS {
            myneutralFatlViewLabel.font = UIFont.systemFont(ofSize: 12)
        }
        myneutralFatlView.addSubview(myneutralFatlViewLabel)
        
        
        
        if IS_IPHONE_X {
            neutralFatInputView = UITextField(frame: CGRect(x: myneutralFatlViewLabel.frame.maxX + 71, y: 0, width: myneutralFatlViewLabel.frame.width * 2, height: myneutralFatlViewLabel.frame.height))
            neutralFatInputView.placeholder = "측정치를 적어주세요."
            myneutralFatlView.addSubview(neutralFatInputView)
        }
        if IS_IPHONE_N_PLUS {
            neutralFatInputView = UITextField(frame: CGRect(x: myneutralFatlViewLabel.frame.maxX + 78, y: 0, width: myneutralFatlViewLabel.frame.width * 2, height: myneutralFatlViewLabel.frame.height))
            neutralFatInputView.placeholder = "측정치를 적어주세요."
            myneutralFatlView.addSubview(neutralFatInputView)
        }
        if IS_IPHONE_12PRO_MAX {
            neutralFatInputView = UITextField(frame: CGRect(x: myneutralFatlViewLabel.frame.maxX + 80, y: 0, width: myneutralFatlViewLabel.frame.width * 2, height: myneutralFatlViewLabel.frame.height))
            neutralFatInputView.placeholder = "측정치를 적어주세요."
            myneutralFatlView.addSubview(neutralFatInputView)
        }
        
        let cancelBTN = UIButton(frame: CGRect(x: 0, y: saveView.frame.maxY + 10, width: self.view.frame.size.width / 2, height: self.view.frame.size.height / 12))
        cancelBTN.setTitle("취소", for: .normal)
        cancelBTN.backgroundColor = #colorLiteral(red: 0.6152173877, green: 0.6653684974, blue: 0.7206344604, alpha: 1)
        scrollView.addSubview(cancelBTN)
        
        let saveBTN = UIButton(frame: CGRect(x: cancelBTN.frame.maxX, y: saveView.frame.maxY + 10, width: self.view.frame.size.width / 2, height: self.view.frame.size.height / 12))
        saveBTN.setTitle("저장", for: .normal)
        saveBTN.addTarget(self, action: #selector(saveButtonPressed(_ :)), for: .touchUpInside)
        saveBTN.backgroundColor = #colorLiteral(red: 0.1400382817, green: 0.3497706652, blue: 0.5862404704, alpha: 1)
        scrollView.addSubview(saveBTN)
        
        
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: menuView.frame.maxY).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: saveBTN.bottomAnchor, constant: 50).isActive = true
        
        set = UIView(frame: CGRect(x: 10, y: scrollView.frame.minY + 10, width: self.view.frame.width - 20, height: self.view.frame.size.height / 3.5))
        set.backgroundColor = .white
        scrollView.addSubview(set)
        
        var setImgView = UIImageView(frame: CGRect(x: set.frame.size.width / 2.2, y: set.frame.minY + 15, width: 50, height: 60))
        set.addSubview(setImgView)
        
        var setImg = UIImage(named: "setImg")
        setImgView.image = setImg
    
        set.isHidden = true
        
        var hideView = UIView(frame: CGRect(x: 0, y: set.frame.maxY - 5, width: self.view.frame.width, height: self.view.frame.height))
        hideView.backgroundColor = .lightGray
        set.addSubview(hideView)
        
        var setTitle = UILabel(frame: CGRect(x: set.frame.size.width / 2.9, y: setImgView.frame.maxY, width: 130, height: 50))
        setTitle.font = UIFont.systemFont(ofSize: 18)
        setTitle.text = "  나의 콜레스테롤\n관리 목표설정하기"
        setTitle.numberOfLines = 0
        set.addSubview(setTitle)
        
        var totalCholesterol = UILabel(frame: CGRect(x: 20, y: setTitle.frame.maxY + 38, width: 100, height: 30))
        totalCholesterol.text = "총 콜레스테롤"
        totalCholesterol.font = UIFont.systemFont(ofSize: 18)
        set.addSubview(totalCholesterol)

        totalCholesterolGoal = UITextField(frame: CGRect(x: totalCholesterol.frame.maxX + 30, y: setTitle.frame.maxY + 38, width: 230, height: 30))
        totalCholesterolGoal.placeholder = "목표 수치를 입력해주세요."
        totalCholesterolGoal.font = UIFont.systemFont(ofSize: 20)
        set.addSubview(totalCholesterolGoal)
        
        if IS_IPHONE_X {
            set = UIView(frame: CGRect(x: 10, y: scrollView.frame.minY + 10, width: self.view.frame.width - 20, height: self.view.frame.size.height / 3.5))
            set.backgroundColor = .white
            scrollView.addSubview(set)
            
            var setImgView = UIImageView(frame: CGRect(x: set.frame.size.width / 2.2, y: set.frame.minY + 15, width: 50, height: 60))
            set.addSubview(setImgView)
            
            var setImg = UIImage(named: "setImg")
            setImgView.image = setImg
        
            set.isHidden = true
            
            var hideView = UIView(frame: CGRect(x: 0, y: set.frame.maxY - 5, width: self.view.frame.width, height: self.view.frame.height))
            hideView.backgroundColor = .lightGray
            set.addSubview(hideView)
            
            var setTitle = UILabel(frame: CGRect(x: set.frame.size.width / 2.9, y: setImgView.frame.maxY, width: 130, height: 50))
            setTitle.font = UIFont.systemFont(ofSize: 18)
            setTitle.text = "  나의 콜레스테롤\n관리 목표설정하기"
            setTitle.numberOfLines = 0
            set.addSubview(setTitle)
            
            var totalCholesterol = UILabel(frame: CGRect(x: 20, y: setTitle.frame.maxY + 38, width: 100, height: 30))
            totalCholesterol.text = "총 콜레스테롤"
            totalCholesterol.font = UIFont.systemFont(ofSize: 18)
            set.addSubview(totalCholesterol)

            totalCholesterolGoal = UITextField(frame: CGRect(x: totalCholesterol.frame.maxX + 30, y: setTitle.frame.maxY + 38, width: 230, height: 30))
            totalCholesterolGoal.placeholder = "목표 수치를 입력해주세요."
            totalCholesterolGoal.font = UIFont.systemFont(ofSize: 17)
            set.addSubview(totalCholesterolGoal)
            
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
        
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: menuView.frame.maxY).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: saveBTN.bottomAnchor, constant: 50).isActive = true
        
        
        DyslipidemiaWebView.isHidden = false
        DyslipidemiaManagementNotebookView.isHidden = true
        DyslipidemiaManagementTest.isHidden = true
        
        
        
    }
    @objc func show(_ sender: UIButton) {
        scrollView.backgroundColor = .lightGray
        DyslipidemiaManagementNotebookView.DyslipidemiahVIew.backgroundColor = .lightGray
        set.isHidden = false
        goalCancelBTN.isHidden = false
        goalSaveBTN.isHidden = false
        
        DyslipidemiaWebView.isHidden = true
        DyslipidemiaManagementNotebookView.isHidden = true
        DyslipidemiaManagementTest.isHidden = true
      
        
    }
    
    @objc func rightButton2PressedList(_ button: UIButton) {
        self.DyslipidemiaManagementTest.graphScrollView.isHidden = true
        self.DyslipidemiaManagementTest.dataScrollView.isHidden = false

        self.DyslipidemiaManagementTest.dataScrollView.dataUpdate()
    }
    
    @objc func rightButton2PressedGraph(_ button: UIButton) {
        
        self.DyslipidemiaManagementTest.graphScrollView.isHidden = false
        self.DyslipidemiaManagementTest.dataScrollView.isHidden = true

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
            DyslipidemiaWebView.isHidden = false
            DyslipidemiaManagementNotebookView.isHidden = true
            DyslipidemiaManagementTest.isHidden = true
            
            label1.textColor = .black
            label2.textColor = .lightGray
            label3.textColor = .lightGray
        } else if sender.tag == 1 {
            UIView.animate(withDuration: 0.5, animations: { [self] in
              
            moveSelected(view: UnderBar, button: button2)
                
            })
            DyslipidemiaWebView.isHidden = true
            DyslipidemiaManagementNotebookView.isHidden = false
            DyslipidemiaManagementTest.isHidden = true
            
            label1.textColor = .lightGray
            label2.textColor = .black
            label3.textColor = .lightGray
        } else if sender.tag == 2 {
            UIView.animate(withDuration: 0.5, animations: { [self] in
              
            moveSelected(view: UnderBar, button: button3)
                
            })
            DyslipidemiaWebView.isHidden = true
            DyslipidemiaManagementNotebookView.isHidden = true
            DyslipidemiaManagementTest.isHidden = false
            
            label1.textColor = .lightGray
            label2.textColor = .lightGray
            label3.textColor = .black
            
        }
    }
    
    @objc func saveButtonPressed(_ button: UIButton) {

       
        
        if self.cholesterolInputView.text == "" {
            toastShow(message: "총 콜레스테롤을 입력하세요.")
            return
        }
        if self.hdlInputView.text == "" {
            toastShow(message: "LDL 콜레스테롤을 입력하세요.")
            return
        }
        
        if self.ldlInputView.text == "" {
            toastShow(message: "HDL 콜레스테롤을 입력하세요.")
            return
        }
        if self.neutralFatInputView.text == "" {
            toastShow(message: "중성지방을 입력하세요.")
            return
        }
        
//        guard let regNumString = userD.object(forKey: USER_KEY.KSR_REGISTRATION_NUMBER) as? String else {
//            toastShow(message: "reg_num is nil error")
//            return
//        }
        let regNumString = "SB-12500-1"
        
        let total = self.cholesterolInputView.text!
        let hdl = self.hdlInputView.text!
        let ldl = self.ldlInputView.text!
        let mid = self.neutralFatInputView.text!
        
        
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
        
        let year = current_year_string
        let month = formatter_month_string
        let week = formatter_week_string
        let dayweek = formatter_dayWeek_string
        let day = formatter_day_string
        let dateTime = current_date_string

        
//        new HttpParam("reg_num", prefs.getString("reg_num",null)),
//        new HttpParam("total", total.getText().toString()),
//        new HttpParam("hdl", hdl.getText().toString()),
//        new HttpParam("ldl", ldl.getText().toString()),
//        new HttpParam("mid", mid.getText().toString()),
//        new HttpParam("year", ""+dateSelected.get(Calendar.YEAR)),
//        new HttpParam("month", ""+(dateSelected.get(Calendar.MONTH)+1)),
//        new HttpParam("week", ""+dateSelected.get(Calendar.WEEK_OF_YEAR)),
//        new HttpParam("dayweek", ""+dateSelected.get(Calendar.DAY_OF_WEEK)),
//        new HttpParam("day", ""+dateSelected.get(Calendar.DATE)),
//        new HttpParam("datetime", datetime.getText().toString()));
//        CHOLESTEROL_ADD
        
        let sid = "\(UserDefaults.standard.object(forKey: "sid") ?? 0)"

        
//
        
            
        
        
        
        let sendDataDic = [
//            "reg_num":regNumString,
            "user_sid":sid,
            "total":total,
            "hdl":hdl,
            "ldl":ldl,
            "mid":mid,
            "year":year,
            "month":month,
            "week":week,
            "dayweek":dayweek,
            "day":day,
            "datetime":dateTime,
            ]
        print("sendDataDic:\n\(sendDataDic)")
        Server.getData(type: Server.InfoType.CHOLESTEROL_ADD, otherInfo: sendDataDic) { (kData : Data?) in
            if let data = kData {
                if let dataString : String = String(data: data, encoding: String.Encoding.utf8) {
                    print("CHOLESTEROL_ADD:\(dataString)")
                    self.view.endEditing(true)
//                    self.superCon?.segView.itemButtonPressed(button: (self.superCon?.segView.itemButtons[2])!)
                }
            }
        }
    }
    
}
