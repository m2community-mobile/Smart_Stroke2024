//
//  DyslipidemiaViewController.swift
//  KSR_2024
//
//  Created by m2comm on 2024/01/18.
//
//
import Foundation
import UIKit



var d1: CGFloat!
var d2: CGFloat!


class DyslipidemiaViewController: BaseViewController, UITextFieldDelegate {
    
    var DyslipidemiaWebView : WebView!
    var DyslipidemiaManagementNotebookView : DyslipidemiaManagementNotebookView!
    var DyslipidemiaManagementTest : DyslipidemiaListView!
    var set: UIView!
    
    var testBtn1: UIButton!
    var testBtn2: UIButton!
    
    var change: UIButton!
    
    //
    var showLabel: UILabel!
    
    var circularProgressBarView: CircularProgressView!
        var circularViewDuration: TimeInterval = 2

    var random: CGFloat!
    var perTest: CGFloat!
    //
    var totalCholesterolGoal: UITextField!
    
    
    var cholesterolInputView: UITextField!
    var hdlInputView: UITextField!
    var ldlInputView: UITextField!
    var neutralFatInputView: UITextField!
    
    var goalCancelBTN: UIButton!
    var goalSaveBTN: UIButton!
    
    
    var saveBTN: UIButton!
    var cancelBTN: UIButton!
    
    
    var UnderBar: UIView!
    var titleName: UILabel!
    
    var saveData: UILabel!
    var saveView: UIView!
    var keyCounter = 0
    let datePicker = UIDatePicker()
    var changeTf: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        keyCounter = 0
        NotificationCenter.default.addObserver(self, selector: #selector(didRecieveTestNotification(_:)), name: NSNotification.Name("ch1"), object: nil)
//        UnderBar = UIView(frame: CGRect(x: button1.center.x, y: naviBar.frame.maxY + 62, width: SCREEN.WIDTH / 8.8, height: 5))
//        UnderBar.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
//        
//        self.view.addSubview(UnderBar)
        setupKeyboardEvent()
        hideKeyboardWhenTappedAround()
        scrollView.keyboardDismissMode = .onDrag
        buttons = [button1, button2, button3]
        
        self.buttons.forEach {
            $0.addTarget(self, action: #selector(segButtonPressed(_ :)), for: .touchUpInside)
        }
        
        titleName = UILabel(frame: CGRect(x: self.view.frame.size.width / 2.6, y: 0, width: 150, height: naviBar.frame.height))
//        titleName.text = titleLabel
        
        titleName.text = "이상지질혈증"
        titleName.textColor = .white
        titleName.font = UIFont(name: "SUITE-Regular", size: 20)
        
        naviBar.addSubview(titleName)
        
        label1.text = "관리\n도움말"
        label1.font = UIFont(name: "SUITE-Regular", size: 14)
        label2.text = "이상지질혈증\n관리수첩"
        label2.font = UIFont(name: "SUITE-Regular", size: 14)
        label3.text = "이상지질혈증\n기록보기"
        label3.font = UIFont(name: "SUITE-Regular", size: 14)
        
        label1.textColor = .black
        label2.textColor = .lightGray
        label3.textColor = .lightGray
        
        
        
        
        self.DyslipidemiaWebView = WebView(frame: CGRect(
            x: 0,
            y: menuView.frame.maxY,
            width: SCREEN.WIDTH,
            height: SCREEN.HEIGHT - menuView.frame.maxY), urlString: "http://ksrapp.m2comm.co.kr/php/info/info02_4a.php")
        
        DyslipidemiaManagementNotebookView = Smart_Stroke2024.DyslipidemiaManagementNotebookView(frame: CGRect(x: 0, y: scrollView.frame.minY, width: SCREEN.WIDTH, height: scrollView.frame.height))
        DyslipidemiaManagementNotebookView.backgroundColor = .white
        scrollView.addSubview(DyslipidemiaManagementNotebookView)
        
        self.view.addSubview(self.DyslipidemiaWebView)
        
        self.DyslipidemiaManagementTest = Smart_Stroke2024.DyslipidemiaListView(frame: CGRect(
            x: 0,
            y: menuView.frame.maxY,
            width: SCREEN.WIDTH,
            height: SCREEN.HEIGHT - menuView.frame.maxY))
        
//        self.DyslipidemiaManagementTest.backgroundColor = .white
        self.view.addSubview(self.DyslipidemiaManagementTest)
        
        DyslipidemiaManagementTest.backgroundColor = #colorLiteral(red: 0.9450935721, green: 0.9524920583, blue: 0.9736705422, alpha: 1)
        if IS_IPHONE_X {
            testBtn1 = UIButton(frame: CGRect(x: SCREEN.WIDTH / 2.4, y: 20, width: 100, height: 50))
        }else if IS_IPHONE_N{
            testBtn1 = UIButton(frame: CGRect(x: SCREEN.WIDTH / 2.6, y: 20, width: 100, height: 50))
        } else {
            testBtn1 = UIButton(frame: CGRect(x: SCREEN.WIDTH / 2.2, y: 20, width: 100, height: 50))
        }
        testBtn1.setTitle("리스트보기", for: .normal)
        testBtn1.setTitleColor(.white, for: .normal)
        testBtn1.backgroundColor = #colorLiteral(red: 0, green: 0.5898328424, blue: 0.8106423616, alpha: 1)
        
        testBtn1.layer.cornerRadius = 8
        DyslipidemiaManagementTest.addSubview(testBtn1)
        testBtn1.addTarget(self, action: #selector(rightButton2PressedList(_ :)), for: .touchUpInside)
        
        
        testBtn2 = UIButton(frame: CGRect(x: testBtn1.frame.maxX + 5, y: 20, width: 100, height: 50))
        testBtn2.setTitle("그래프보기", for: .normal)
        testBtn2.setTitleColor(#colorLiteral(red: 0.1406538188, green: 0.347869575, blue: 0.5851272941, alpha: 1), for: .normal)
        testBtn2.layer.borderWidth = 1
        testBtn2.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        testBtn2.layer.borderColor = #colorLiteral(red: 0.6836393476, green: 0.7600957155, blue: 0.8458803296, alpha: 1).cgColor
        testBtn2.layer.cornerRadius = 8
        DyslipidemiaManagementTest.addSubview(testBtn2)
        testBtn2.addTarget(self, action: #selector(rightButton2PressedGraph(_ :)), for: .touchUpInside)
        
        
        
        
        
        
        
        DyslipidemiaManagementNotebookView.DyslipidemiahVIew = UIView(frame: CGRect(x: 0, y: scrollView.frame.minY, width: self.view.frame.size.width, height: self.view.frame.size.height / 4))
//        DyslipidemiaManagementNotebookView.DyslipidemiahVIew.backgroundColor = #colorLiteral(red: 0.8870372176, green: 0.396627903, blue: 0.2913144231, alpha: 1)
        
        DyslipidemiaManagementNotebookView.DyslipidemiahVIew.setGradient2(color1: UIColor(red: 230 / 255, green: 83 / 255.0, blue: 90 / 255.0, alpha: 1), color2: UIColor(red: 220 / 255.0, green: 116 / 255.0, blue: 54 / 255.0, alpha: 1))
        
//        BloodSugarManagementNotebookView.FastingBloodSugar.layer.borderWidth = 1
//        ObesityManagementNotebookView.bmiGraphVIew.layer.cornerRadius = 8
        scrollView.addSubview(DyslipidemiaManagementNotebookView.DyslipidemiahVIew)
        
        
        let strokeUnderBar = UIView(frame: CGRect(x: 0, y: DyslipidemiaManagementNotebookView.DyslipidemiahVIew.frame.minY + 20, width: 1, height: DyslipidemiaManagementNotebookView.DyslipidemiahVIew.frame.size.height - 40))
strokeUnderBar.backgroundColor =  #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1).withAlphaComponent(0.8)
        strokeUnderBar.center.x = DyslipidemiaManagementNotebookView.DyslipidemiahVIew.frame.size.width / 2
        DyslipidemiaManagementNotebookView.DyslipidemiahVIew.addSubview(strokeUnderBar)
   /////////////////
        
        DyslipidemiaManagementNotebookView.DyslipidemiaVIewLabel = UILabel(frame: CGRect(x: 50, y: DyslipidemiaManagementNotebookView.DyslipidemiahVIew.frame.minY + 20, width: 130, height: DyslipidemiaManagementNotebookView.DyslipidemiahVIew.frame.size.height / 4))
        
        if IS_IPHONE_12PRO {
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewLabel = UILabel(frame: CGRect(x: 35, y: DyslipidemiaManagementNotebookView.DyslipidemiahVIew.frame.minY + 20, width: 130, height: DyslipidemiaManagementNotebookView.DyslipidemiahVIew.frame.size.height / 4))
        }
        if IS_IPHONE_15PRO {
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewLabel = UILabel(frame: CGRect(x: 35, y: DyslipidemiaManagementNotebookView.DyslipidemiahVIew.frame.minY + 20, width: 130, height: DyslipidemiaManagementNotebookView.DyslipidemiahVIew.frame.size.height / 4))
        }
        
        if IS_IPHONE_N {
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewLabel = UILabel(frame: CGRect(x: 30, y: DyslipidemiaManagementNotebookView.DyslipidemiahVIew.frame.minY + 20, width: 130, height: DyslipidemiaManagementNotebookView.DyslipidemiahVIew.frame.size.height / 4))
        }
        if IS_IPHONE_MINI{
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewLabel = UILabel(frame: CGRect(x: 30, y: DyslipidemiaManagementNotebookView.DyslipidemiahVIew.frame.minY + 20, width: 130, height: DyslipidemiaManagementNotebookView.DyslipidemiahVIew.frame.size.height / 4))
        }
        
        if IS_IPHONE_N_PLUS {
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewLabel = UILabel(frame: CGRect(x: 40, y: DyslipidemiaManagementNotebookView.DyslipidemiahVIew.frame.minY + 20, width: 130, height: DyslipidemiaManagementNotebookView.DyslipidemiahVIew.frame.size.height / 4))
        }
        if IS_IPHONE_12PRO_MAX {
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewLabel = UILabel(frame: CGRect(x: 45, y: DyslipidemiaManagementNotebookView.DyslipidemiahVIew.frame.minY + 20, width: 130, height: DyslipidemiaManagementNotebookView.DyslipidemiahVIew.frame.size.height / 4))
        }
        if IS_IPHONE_15PRO_MAX {
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewLabel = UILabel(frame: CGRect(x: 45, y: DyslipidemiaManagementNotebookView.DyslipidemiahVIew.frame.minY + 20, width: 130, height: DyslipidemiaManagementNotebookView.DyslipidemiahVIew.frame.size.height / 4))
        }
        
        DyslipidemiaManagementNotebookView.DyslipidemiaVIewLabel.text = "나의 콜레스테롤\n  목표 수치는?"
        DyslipidemiaManagementNotebookView.DyslipidemiaVIewLabel.numberOfLines = 0
        DyslipidemiaManagementNotebookView.DyslipidemiaVIewLabel.textColor = .white
        DyslipidemiaManagementNotebookView.DyslipidemiaVIewLabel.textAlignment = .center
        
        if IS_IPHONE_12PRO_MAX {
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewLabel.font = UIFont(name: "SUITE-Regular", size: 20)
        } else if IS_IPHONE_15PRO_MAX {
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewLabel.font = UIFont(name: "SUITE-Regular", size: 20)
        } else if IS_IPHONE_N_PLUS {
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewLabel.font = UIFont(name: "SUITE-Regular", size: 17)
        } else if IS_IPHONE_X {
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewLabel.font = UIFont(name: "SUITE-Regular", size: 15)
        } else {
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewLabel.font = UIFont(name: "SUITE-Regular", size: 15)
        }
        
        
        
       

        DyslipidemiaManagementNotebookView.DyslipidemiahVIew.addSubview(DyslipidemiaManagementNotebookView.DyslipidemiaVIewLabel)

        DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowNumLabelNumber = UILabel(frame: CGRect(x: 60, y: DyslipidemiaManagementNotebookView.DyslipidemiaVIewLabel.frame.maxY + 2, width: 55, height: DyslipidemiaManagementNotebookView.DyslipidemiahVIew.frame.size.height / 3))
        
        
        if IS_IPHONE_12PRO {
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowNumLabelNumber = UILabel(frame: CGRect(x: 45, y: DyslipidemiaManagementNotebookView.DyslipidemiaVIewLabel.frame.maxY + 2, width: 55, height: DyslipidemiaManagementNotebookView.DyslipidemiahVIew.frame.size.height / 3))
        }
        if IS_IPHONE_15PRO {
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowNumLabelNumber = UILabel(frame: CGRect(x: 45, y: DyslipidemiaManagementNotebookView.DyslipidemiaVIewLabel.frame.maxY + 2, width: 55, height: DyslipidemiaManagementNotebookView.DyslipidemiahVIew.frame.size.height / 3))
        }
        
        if IS_IPHONE_N {
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowNumLabelNumber = UILabel(frame: CGRect(x: 40, y: DyslipidemiaManagementNotebookView.DyslipidemiaVIewLabel.frame.maxY + 2, width: 55, height: DyslipidemiaManagementNotebookView.DyslipidemiahVIew.frame.size.height / 3))
        }
        if IS_IPHONE_MINI {
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowNumLabelNumber = UILabel(frame: CGRect(x: 40, y: DyslipidemiaManagementNotebookView.DyslipidemiaVIewLabel.frame.maxY + 2, width: 55, height: DyslipidemiaManagementNotebookView.DyslipidemiahVIew.frame.size.height / 3))
        }
        
        if IS_IPHONE_N_PLUS {
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowNumLabelNumber = UILabel(frame: CGRect(x: 50, y: DyslipidemiaManagementNotebookView.DyslipidemiaVIewLabel.frame.maxY + 2, width: 55, height: DyslipidemiaManagementNotebookView.DyslipidemiahVIew.frame.size.height / 3))
            
        }
        if IS_IPHONE_12PRO_MAX {
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowNumLabelNumber = UILabel(frame: CGRect(x: 55, y: DyslipidemiaManagementNotebookView.DyslipidemiaVIewLabel.frame.maxY + 2, width: 55, height: DyslipidemiaManagementNotebookView.DyslipidemiahVIew.frame.size.height / 3))
        }
        if IS_IPHONE_15PRO_MAX {
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowNumLabelNumber = UILabel(frame: CGRect(x: 55, y: DyslipidemiaManagementNotebookView.DyslipidemiaVIewLabel.frame.maxY + 2, width: 55, height: DyslipidemiaManagementNotebookView.DyslipidemiahVIew.frame.size.height / 3))
        }
        
//        DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowNumLabelNumber.text = "120"
        DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowNumLabelNumber.textColor = .white
        DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowNumLabelNumber.textAlignment = .right
        
        DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowNumLabelNumber.font = UIFont(name: "SUITE-Heavy", size: 26)
        
        DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowNumLabelNumber.numberOfLines = 0
//        DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowNumLabelNumber.font = UIFont.systemFont(ofSize: 27)

        DyslipidemiaManagementNotebookView.DyslipidemiahVIew.addSubview(DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowNumLabelNumber)
        
        
        DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowNumLabel = UILabel(frame: CGRect(x: DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowNumLabelNumber.frame.maxX + 5, y: DyslipidemiaManagementNotebookView.DyslipidemiaVIewLabel.frame.maxY + 2, width: 50, height: DyslipidemiaManagementNotebookView.DyslipidemiahVIew.frame.size.height / 3))
        DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowNumLabel.textAlignment = .center
        DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowNumLabel.text = "mg/dL"
        DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowNumLabel.textColor = .white
        
        DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowNumLabel.font = UIFont(name: "SUITE-Regular", size: 13)
        DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowNumLabel.numberOfLines = 0
        
        

        DyslipidemiaManagementNotebookView.DyslipidemiahVIew.addSubview(DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowNumLabel)

        DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowLabel = UILabel(frame: CGRect(x: DyslipidemiaManagementNotebookView.DyslipidemiahVIew.frame.maxX - 150, y: DyslipidemiaManagementNotebookView.DyslipidemiahVIew.frame.minY + 20, width: 130, height: DyslipidemiaManagementNotebookView.DyslipidemiahVIew.frame.size.height / 4))
        
        
        
        
        
        
        if IS_IPHONE_12PRO {
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowLabel = UILabel(frame: CGRect(x: DyslipidemiaManagementNotebookView.DyslipidemiahVIew.frame.maxX - 120, y: DyslipidemiaManagementNotebookView.DyslipidemiahVIew.frame.minY + 20, width: 130, height: DyslipidemiaManagementNotebookView.DyslipidemiahVIew.frame.size.height / 4))
        }
        if IS_IPHONE_15PRO {
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowLabel = UILabel(frame: CGRect(x: DyslipidemiaManagementNotebookView.DyslipidemiahVIew.frame.maxX - 120, y: DyslipidemiaManagementNotebookView.DyslipidemiahVIew.frame.minY + 20, width: 130, height: DyslipidemiaManagementNotebookView.DyslipidemiahVIew.frame.size.height / 4))
        }
        if IS_IPHONE_N {
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowLabel = UILabel(frame: CGRect(x: DyslipidemiaManagementNotebookView.DyslipidemiahVIew.frame.maxX - 120, y: DyslipidemiaManagementNotebookView.DyslipidemiahVIew.frame.minY + 20, width: 130, height: DyslipidemiaManagementNotebookView.DyslipidemiahVIew.frame.size.height / 4))
        }
        if IS_IPHONE_MINI {
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowLabel = UILabel(frame: CGRect(x: DyslipidemiaManagementNotebookView.DyslipidemiahVIew.frame.maxX - 120, y: DyslipidemiaManagementNotebookView.DyslipidemiahVIew.frame.minY + 20, width: 130, height: DyslipidemiaManagementNotebookView.DyslipidemiahVIew.frame.size.height / 4))
        }
        if IS_IPHONE_N_PLUS {
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowLabel = UILabel(frame: CGRect(x: DyslipidemiaManagementNotebookView.DyslipidemiahVIew.frame.maxX - 130, y: DyslipidemiaManagementNotebookView.DyslipidemiahVIew.frame.minY + 20, width: 130, height: DyslipidemiaManagementNotebookView.DyslipidemiahVIew.frame.size.height / 4))
        }
        
        
        
        
        DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowLabel.text = " 목표 수치\n달성율은?"
        
        if IS_IPHONE_12PRO_MAX {
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowLabel.font = UIFont(name: "SUITE-Regular", size: 20)
        } else if IS_IPHONE_15PRO_MAX {
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowLabel.font = UIFont(name: "SUITE-Regular", size: 20)
        } else if IS_IPHONE_N_PLUS {
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowLabel.font = UIFont(name: "SUITE-Regular", size: 17)
        } else if IS_IPHONE_X {
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowLabel.font = UIFont(name: "SUITE-Regular", size: 15)
        } else {
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowLabel.font = UIFont(name: "SUITE-Regular", size: 15)
        }
        
        
        DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowLabel.numberOfLines = 0
        DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowLabel.textColor = .white
        
        DyslipidemiaManagementNotebookView.DyslipidemiahVIew.addSubview(DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowLabel)
//

        DyslipidemiaManagementNotebookView.DyslipidemiaVIewGraph = UIView(frame: CGRect(x: DyslipidemiaManagementNotebookView.DyslipidemiaVIewLabel.frame.maxX + 50, y: DyslipidemiaManagementNotebookView.DyslipidemiaVIewLabel.frame.maxY + 20, width: self.view.frame.size.width / 2.8, height: DyslipidemiaManagementNotebookView.DyslipidemiahVIew.frame.size.height / 2))
        DyslipidemiaManagementNotebookView.DyslipidemiaVIewGraph.backgroundColor = .clear

        if IS_IPHONE_N_PLUS {
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewGraph = UIView(frame: CGRect(x: DyslipidemiaManagementNotebookView.DyslipidemiaVIewLabel.frame.maxX + 60, y: DyslipidemiaManagementNotebookView.DyslipidemiaVIewLabel.frame.maxY, width: self.view.frame.size.width / 2.8, height: DyslipidemiaManagementNotebookView.DyslipidemiahVIew.frame.size.height / 2))
        }
        if IS_IPHONE_X {
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewGraph = UIView(frame: CGRect(x: DyslipidemiaManagementNotebookView.DyslipidemiaVIewLabel.frame.maxX, y: DyslipidemiaManagementNotebookView.DyslipidemiaVIewLabel.frame.maxY, width: self.view.frame.size.width / 2.8, height: DyslipidemiaManagementNotebookView.DyslipidemiahVIew.frame.size.height / 2))
        }
        
        
        if IS_IPHONE_12PRO {
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewGraph = UIView(frame: CGRect(x: DyslipidemiaManagementNotebookView.DyslipidemiaVIewLabel.frame.maxX + 90, y: DyslipidemiaManagementNotebookView.DyslipidemiaVIewLabel.frame.maxY + 20, width: self.view.frame.size.width / 2.8, height: DyslipidemiaManagementNotebookView.DyslipidemiahVIew.frame.size.height / 2))
        }
        if IS_IPHONE_15PRO {
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewGraph = UIView(frame: CGRect(x: DyslipidemiaManagementNotebookView.DyslipidemiaVIewLabel.frame.maxX + 90, y: DyslipidemiaManagementNotebookView.DyslipidemiaVIewLabel.frame.maxY + 20, width: self.view.frame.size.width / 2.8, height: DyslipidemiaManagementNotebookView.DyslipidemiahVIew.frame.size.height / 2))
        }
        if IS_IPHONE_N {
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewGraph = UIView(frame: CGRect(x: DyslipidemiaManagementNotebookView.DyslipidemiaVIewLabel.frame.maxX + 100, y: DyslipidemiaManagementNotebookView.DyslipidemiaVIewLabel.frame.maxY + 20, width: self.view.frame.size.width / 2.8, height: DyslipidemiaManagementNotebookView.DyslipidemiahVIew.frame.size.height / 2))
        }
        if IS_IPHONE_MINI {
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewGraph = UIView(frame: CGRect(x: DyslipidemiaManagementNotebookView.DyslipidemiaVIewLabel.frame.maxX + 50, y: DyslipidemiaManagementNotebookView.DyslipidemiaVIewLabel.frame.maxY + 10, width: self.view.frame.size.width / 2.8, height: DyslipidemiaManagementNotebookView.DyslipidemiahVIew.frame.size.height / 2))
        }
        
        
        if IS_IPHONE_12PRO_MAX {
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewGraph = UIView(frame: CGRect(x: DyslipidemiaManagementNotebookView.DyslipidemiaVIewLabel.frame.maxX + 60, y: DyslipidemiaManagementNotebookView.DyslipidemiaVIewLabel.frame.maxY + 20, width: self.view.frame.size.width / 2.8, height: DyslipidemiaManagementNotebookView.DyslipidemiahVIew.frame.size.height / 2))
        }
        if IS_IPHONE_15PRO_MAX {
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewGraph = UIView(frame: CGRect(x: DyslipidemiaManagementNotebookView.DyslipidemiaVIewLabel.frame.maxX + 60, y: DyslipidemiaManagementNotebookView.DyslipidemiaVIewLabel.frame.maxY + 20, width: self.view.frame.size.width / 2.8, height: DyslipidemiaManagementNotebookView.DyslipidemiahVIew.frame.size.height / 2))
        }
        ////////////
        
        DyslipidemiaManagementNotebookView.DyslipidemiahVIew.addSubview(DyslipidemiaManagementNotebookView.DyslipidemiaVIewGraph)
        
        //
        random = CGFloat(arc4random_uniform(UInt32(101))) //between 0 and n-1
        
//        self.view.backgroundColor = .white
        // Do any additional setup after loading the view.
        showLabel = UILabel(frame: CGRect(x: 47, y: 33, width: 43, height: 30))
        //        showLabel.layer.borderWidth = 1
                
    //            var changeShowLabel = Int(random)
        var changeShowLabel = UserDefaults.standard.object(forKey: "persentD")
        print(changeShowLabel, "여기의 값은?")
        showLabel.textAlignment = .center
        showLabel.font = UIFont(name: "SUITE-Heavy", size: 13)
        showLabel.textColor = .white
        showLabel.text = "\(changeShowLabel ?? 0)%"
//        showLabel = UILabel(frame: CGRect(x: 37, y: 25, width: 40, height: 30))
        if IS_IPHONE_N_PLUS {
            showLabel = UILabel(frame: CGRect(x: 39, y: 29, width: 45, height: 30))
//            showLabel.font = UIFont(name: "SUITE-Heavy", size: 13)
//            showLabel.textColor = .white
            
//                    showLabel.layer.borderWidth = 1
            showLabel.textAlignment = .center
        //            var changeShowLabel = Int(random)
                    var changeShowLabel = UserDefaults.standard.object(forKey: "persentD")
                    print(changeShowLabel, "여기의 값은?")
//            showLabel.layer.borderWidth = 1
                    showLabel.font = UIFont(name: "SUITE-Heavy", size: 11)
                    showLabel.textColor = .white
                    showLabel.text = "\(changeShowLabel ?? 0)%"
//                    showLabel.text = UserDefaults.standard.string(forKey: "perB")
            
            
            
        }
        if IS_IPHONE_X {
            showLabel = UILabel(frame: CGRect(x: 35, y: 33, width: 45, height: 30))
//                    showLabel.layer.borderWidth = 1
                    
        //            var changeShowLabel = Int(random)
                    var changeShowLabel = UserDefaults.standard.object(forKey: "persentD")
                    print(changeShowLabel, "여기의 값은?")
            showLabel.textAlignment = .center
                    showLabel.font = UIFont(name: "SUITE-Heavy", size: 14)
                    showLabel.textColor = .white
                    showLabel.text = "\(changeShowLabel ?? 0)%"
        }
        if IS_IPHONE_12PRO_MAX {
            showLabel = UILabel(frame: CGRect(x: 42, y: 33, width: 43, height: 30))
            //        showLabel.layer.borderWidth = 1
                    
        //            var changeShowLabel = Int(random)
            var changeShowLabel = UserDefaults.standard.object(forKey: "persentD")
            print(changeShowLabel, "여기의 값은?")
            showLabel.textAlignment = .center
            showLabel.font = UIFont(name: "SUITE-Heavy", size: 13)
            showLabel.textColor = .white
            showLabel.text = "\(changeShowLabel ?? 0)%"
        }
        if IS_IPHONE_15PRO_MAX {
            showLabel = UILabel(frame: CGRect(x: 42, y: 33, width: 43, height: 30))
            //        showLabel.layer.borderWidth = 1
                    
        //            var changeShowLabel = Int(random)
            var changeShowLabel = UserDefaults.standard.object(forKey: "persentD")
            print(changeShowLabel, "여기의 값은?")
            showLabel.textAlignment = .center
            showLabel.font = UIFont(name: "SUITE-Heavy", size: 13)
            showLabel.textColor = .white
            showLabel.text = "\(changeShowLabel ?? 0)%"
        }
        if IS_IPHONE_N {
            showLabel = UILabel(frame: CGRect(x: 5, y: 15, width: 50, height: 30))
//                    showLabel.layer.borderWidth = 1
                    
        //            var changeShowLabel = Int(random)
            var changeShowLabel = UserDefaults.standard.object(forKey: "persentD")
            print(changeShowLabel, "여기의 값은?")
            showLabel.textAlignment = .center
            showLabel.textAlignment = .center
            showLabel.font = UIFont(name: "SUITE-Heavy", size: 12)
            showLabel.textColor = .white
            showLabel.text = "\(changeShowLabel ?? 0)%"
        }
        if IS_IPHONE_12PRO {
            showLabel = UILabel(frame: CGRect(x: 21, y: 31, width: 50, height: 30))
//                    showLabel.layer.borderWidth = 1
                    
        //            var changeShowLabel = Int(random)
            var changeShowLabel = UserDefaults.standard.object(forKey: "persentD")
            print(changeShowLabel, "여기의 값은?")
            showLabel.textAlignment = .center
            showLabel.textAlignment = .center
            showLabel.font = UIFont(name: "SUITE-Heavy", size: 12)
            showLabel.textColor = .white
            showLabel.text = "\(changeShowLabel ?? 0)%"
        }
        
        if IS_IPHONE_15PRO {
            showLabel = UILabel(frame: CGRect(x: 21, y: 31, width: 50, height: 30))
//                    showLabel.layer.borderWidth = 1
                    
        //            var changeShowLabel = Int(random)
            var changeShowLabel = UserDefaults.standard.object(forKey: "persentD")
            print(changeShowLabel, "여기의 값은?")
            showLabel.textAlignment = .center
            showLabel.textAlignment = .center
            showLabel.font = UIFont(name: "SUITE-Heavy", size: 12)
            showLabel.textColor = .white
            showLabel.text = "\(changeShowLabel ?? 0)%"
        }
        
//        showLabel.layer.borderWidth = 1
        
//        var changeShowLabel = Int(random)
        
        
        
//        showLabel.text = "\(changeShowLabel ?? 00)%"
        
        
        
        
        if IS_IPHONE_X {
            let ProgressView = CircularProgressView(frame: CGRect(x: 17, y: 9, width: 80, height: 80), lineWidth: 10, rounded: false)
            
            ProgressView.progressColor = .white
            
            ProgressView.trackColor = .white.withAlphaComponent(0.5)
            
            //        ProgressView.center = ProgressView.center
            
            //        self.view.addSubview(ProgressView)
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewGraph.addSubview(ProgressView)
            
            
            ProgressView.addSubview(showLabel)
            
            if UserDefaults.standard.object(forKey: "perGraphD") == nil {
                ProgressView.progress = 0
                showLabel.textAlignment = .center
            } else {
                ProgressView.progress = UserDefaults.standard.object(forKey: "perGraphD") as! CGFloat * 0.01
            }
            
//            ProgressView.progress = UserDefaults.standard.object(forKey: "perGraphD") as! CGFloat * 0.01
        } else if IS_IPHONE_12PRO_MAX {
            let ProgressView = CircularProgressView(frame: CGRect(x: 19, y: 4, width: 90, height: 90), lineWidth: 10, rounded: false)
            
            ProgressView.progressColor = .white

            ProgressView.trackColor = .white.withAlphaComponent(0.5)
            
    //        ProgressView.center = ProgressView.center
            
    //        self.view.addSubview(ProgressView)
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewGraph.addSubview(ProgressView)
            
            
            ProgressView.addSubview(showLabel)
            
//            ProgressView.progress = random * 0.01
            
            
//            ProgressView.addSubview(showLabel)
            
//            ProgressView.progress = UserDefaults.standard.object(forKey: "perGraphD") as! CGFloat * 0.01
            if UserDefaults.standard.object(forKey: "perGraphD") == nil {
                ProgressView.progress = 0
                showLabel.textAlignment = .center
            } else {
                ProgressView.progress = UserDefaults.standard.object(forKey: "perGraphD") as! CGFloat * 0.01
            }
            
        } else if IS_IPHONE_15PRO_MAX {
            let ProgressView = CircularProgressView(frame: CGRect(x: 19, y: 4, width: 90, height: 90), lineWidth: 10, rounded: false)
            
            ProgressView.progressColor = .white

            ProgressView.trackColor = .white.withAlphaComponent(0.5)
            
    //        ProgressView.center = ProgressView.center
            
    //        self.view.addSubview(ProgressView)
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewGraph.addSubview(ProgressView)
            
            
            ProgressView.addSubview(showLabel)
            
//            ProgressView.progress = random * 0.01
            
            
//            ProgressView.addSubview(showLabel)
            
//            ProgressView.progress = UserDefaults.standard.object(forKey: "perGraphD") as! CGFloat * 0.01
            if UserDefaults.standard.object(forKey: "perGraphD") == nil {
                ProgressView.progress = 0
                showLabel.textAlignment = .center
            } else {
                ProgressView.progress = UserDefaults.standard.object(forKey: "perGraphD") as! CGFloat * 0.01
            }
            
        } else if IS_IPHONE_N_PLUS {
            let ProgressView = CircularProgressView(frame: CGRect(x: 25, y: 10, width: 70, height: 70), lineWidth: 10, rounded: false)
            
            ProgressView.progressColor = .white
            
            ProgressView.trackColor = .white.withAlphaComponent(0.5)
            
            //        ProgressView.center = ProgressView.center
            
            //        self.view.addSubview(ProgressView)
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewGraph.addSubview(ProgressView)
            
            
            ProgressView.addSubview(showLabel)
            
//            ProgressView.progress = random * 0.01
//            ProgressView.progress = UserDefaults.standard.object(forKey: "perGraphD") as! CGFloat * 0.01
            if UserDefaults.standard.object(forKey: "perGraphD") == nil {
                ProgressView.progress = 0
                showLabel.textAlignment = .center
            } else {
                ProgressView.progress = UserDefaults.standard.object(forKey: "perGraphD") as! CGFloat * 0.01
            }
        }  else if IS_IPHONE_N {
            let ProgressView = CircularProgressView(frame: CGRect(x: -5, y:-5, width: 70, height: 70), lineWidth: 10, rounded: false)
            
            ProgressView.progressColor = .white
            
            ProgressView.trackColor = .white.withAlphaComponent(0.5)
            
            //        ProgressView.center = ProgressView.center
            
            //        self.view.addSubview(ProgressView)
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewGraph.addSubview(ProgressView)
            
            
            ProgressView.addSubview(showLabel)
            
//            ProgressView.progress = random * 0.01
//            ProgressView.progress = UserDefaults.standard.object(forKey: "perGraphD") as! CGFloat * 0.01
            if UserDefaults.standard.object(forKey: "perGraphD") == nil {
                ProgressView.progress = 0
                showLabel.textAlignment = .center
            } else {
                ProgressView.progress = UserDefaults.standard.object(forKey: "perGraphD") as! CGFloat * 0.01
            }
        } else if IS_IPHONE_12PRO {
            let ProgressView = CircularProgressView(frame: CGRect(x: -1, y: 4, width: 90, height: 90), lineWidth: 10, rounded: false)
            
            ProgressView.progressColor = .white

            ProgressView.trackColor = .white.withAlphaComponent(0.5)
            
    //        ProgressView.center = ProgressView.center
            
    //        self.view.addSubview(ProgressView)
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewGraph.addSubview(ProgressView)
            
            
            ProgressView.addSubview(showLabel)
            
//            ProgressView.progress = random * 0.01
            
            
//            ProgressView.addSubview(showLabel)
            
//            ProgressView.progress = UserDefaults.standard.object(forKey: "perGraphD") as! CGFloat * 0.01
            if UserDefaults.standard.object(forKey: "perGraphD") == nil {
                ProgressView.progress = 0
                showLabel.textAlignment = .center
            } else {
                ProgressView.progress = UserDefaults.standard.object(forKey: "perGraphD") as! CGFloat * 0.01
            }
            
        } else if IS_IPHONE_15PRO {
            let ProgressView = CircularProgressView(frame: CGRect(x: -1, y: 4, width: 90, height: 90), lineWidth: 10, rounded: false)
            
            ProgressView.progressColor = .white

            ProgressView.trackColor = .white.withAlphaComponent(0.5)
            
    //        ProgressView.center = ProgressView.center
            
    //        self.view.addSubview(ProgressView)
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewGraph.addSubview(ProgressView)
            
            
            ProgressView.addSubview(showLabel)
            
//            ProgressView.progress = random * 0.01
            
            
//            ProgressView.addSubview(showLabel)
            
//            ProgressView.progress = UserDefaults.standard.object(forKey: "perGraphD") as! CGFloat * 0.01
            if UserDefaults.standard.object(forKey: "perGraphD") == nil {
                ProgressView.progress = 0
                showLabel.textAlignment = .center
            } else {
                ProgressView.progress = UserDefaults.standard.object(forKey: "perGraphD") as! CGFloat * 0.01
            }
            
        } else {
            let ProgressView = CircularProgressView(frame: CGRect(x: 25, y: 10, width: 70, height: 70), lineWidth: 10, rounded: false)
            
            ProgressView.progressColor = .white
            
            ProgressView.trackColor = .white.withAlphaComponent(0.5)
            
            //        ProgressView.center = ProgressView.center
            
            //        self.view.addSubview(ProgressView)
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewGraph.addSubview(ProgressView)
            
            
            ProgressView.addSubview(showLabel)
            
//            ProgressView.progress = random * 0.01
//            ProgressView.progress = UserDefaults.standard.object(forKey: "perGraphD") as! CGFloat * 0.01
            if UserDefaults.standard.object(forKey: "perGraphD") == nil {
                ProgressView.progress = 0
                showLabel.textAlignment = .center
            } else {
                ProgressView.progress = UserDefaults.standard.object(forKey: "perGraphD") as! CGFloat * 0.01
            }
        }
  
        //
        
        
        
        DyslipidemiaManagementNotebookView.DyslipidemiaVIewBTN.translatesAutoresizingMaskIntoConstraints = false
        /////////////
        if IS_IPHONE_N_PLUS {
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewBTN = UIButton(frame: CGRect(x: 60, y: DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowNumLabel.frame.maxY + 15, width: 95, height: DyslipidemiaManagementNotebookView.DyslipidemiahVIew.frame.size.height / 9))

        } else if IS_IPHONE_N {
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewBTN = UIButton(frame: CGRect(x: 50, y: DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowNumLabel.frame.maxY + 15, width: 90, height: DyslipidemiaManagementNotebookView.DyslipidemiahVIew.frame.size.height / 9))
            
        }
//        else if IS_IPHONE_MINI {
//            DyslipidemiaManagementNotebookView.DyslipidemiaVIewBTN = UIButton(frame: CGRect(x: 40, y: DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowNumLabel.frame.maxY + 15, width: 90, height: DyslipidemiaManagementNotebookView.DyslipidemiahVIew.frame.size.height / 9))
//            
//        }
        else if IS_IPHONE_12PRO {
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewBTN = UIButton(frame: CGRect(x: 45, y: DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowNumLabel.frame.maxY + 15, width: 115, height: DyslipidemiaManagementNotebookView.DyslipidemiahVIew.frame.size.height / 9.5))
        }  else if IS_IPHONE_15PRO {
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewBTN = UIButton(frame: CGRect(x: 45, y: DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowNumLabel.frame.maxY + 15, width: 115, height: DyslipidemiaManagementNotebookView.DyslipidemiahVIew.frame.size.height / 9.5))
        } else {
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewBTN = UIButton(frame: CGRect(x: 50, y: DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowNumLabel.frame.maxY + 15, width: 115, height: DyslipidemiaManagementNotebookView.DyslipidemiahVIew.frame.size.height / 9))
        }
        //////
//        DyslipidemiaManagementNotebookView.DyslipidemiaVIewBTN = UIButton(frame: CGRect(x: 50, y: DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowNumLabel.frame.maxY + 15, width: 115, height: DyslipidemiaManagementNotebookView.DyslipidemiahVIew.frame.size.height / 9))
        DyslipidemiaManagementNotebookView.DyslipidemiaVIewBTN.setTitle("   나의 목표 수정", for: .normal)
        if IS_IPHONE_12PRO {
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewBTN.setTitle("    나의 목표 수정", for: .normal)
        }
        if IS_IPHONE_15PRO {
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewBTN.setTitle("    나의 목표 수정", for: .normal)
        }
//        DyslipidemiaManagementNotebookView.DyslipidemiaVIewBTN.layer.borderWidth = 1
        DyslipidemiaManagementNotebookView.DyslipidemiaVIewBTN.backgroundColor = #colorLiteral(red: 0.5165280104, green: 0.2370750308, blue: 0.2192360759, alpha: 1)
        DyslipidemiaManagementNotebookView.DyslipidemiaVIewBTN.layer.cornerRadius = 12
        if IS_IPHONE_N {
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewBTN.layer.cornerRadius = 8
        }
        if IS_IPHONE_N_PLUS {
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewBTN.layer.cornerRadius = 10
        }
        if IS_IPHONE_12PRO {
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewBTN.layer.cornerRadius = 10
        }
//        DyslipidemiaManagementNotebookView.DyslipidemiaVIewBTN.setImage(UIImage(named: "myGoal"), for: .normal)
        
        
        var penBtnImageView = UIImageView(frame: CGRect(x: 7, y: 8, width: 10, height: 10))
        if IS_IPHONE_12PRO {
            penBtnImageView = UIImageView(frame: CGRect(x: 11, y: 6, width: 10, height: 10))
        } else if IS_IPHONE_15PRO {
            penBtnImageView = UIImageView(frame: CGRect(x: 9, y: 6, width: 10, height: 10))
        } else if IS_IPHONE_N_PLUS {
            penBtnImageView = UIImageView(frame: CGRect(x: 9, y: 5, width: 9, height: 9))
        } else if IS_IPHONE_N {
            penBtnImageView = UIImageView(frame: CGRect(x: 8, y: 5, width: 8, height: 8))
        } else if IS_IPHONE_12PRO_MAX {
            penBtnImageView = UIImageView(frame: CGRect(x: 8, y: 8, width: 10, height: 10))
        } else if IS_IPHONE_15PRO_MAX {
            penBtnImageView = UIImageView(frame: CGRect(x: 8, y: 8, width: 10, height: 10))
        }
        let penBtnImage = UIImage(named: "myGoal")
        penBtnImageView.image = penBtnImage
        
        DyslipidemiaManagementNotebookView.DyslipidemiaVIewBTN.addSubview(penBtnImageView)

        
//        DyslipidemiaManagementNotebookView.DyslipidemiaVIewBTN.imageEdgeInsets = UIEdgeInsets(top: 10, left: -3, bottom: 10, right: 4)
        
        
//        if IS_IPHONE_12PRO_MAX {
//            DyslipidemiaManagementNotebookView.DyslipidemiaVIewBTN.imageEdgeInsets = UIEdgeInsets(top: 10, left: -3, bottom: 10, right: 4)
//        } else {
//            DyslipidemiaManagementNotebookView.DyslipidemiaVIewBTN.imageEdgeInsets = UIEdgeInsets(top: 6, left: -3, bottom: 6, right: 4)
//        }
        
        if IS_IPHONE_N_PLUS {
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewBTN.titleLabel?.font = UIFont(name: "SUITE-Regular", size: 11)
        } else if IS_IPHONE_N {
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewBTN.titleLabel?.font = UIFont(name: "SUITE-Regular", size: 10)
        } else if IS_IPHONE_12PRO {
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewBTN.titleLabel?.font = UIFont(name: "SUITE-Regular", size: 12)
        } else if IS_IPHONE_15PRO {
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewBTN.titleLabel?.font = UIFont(name: "SUITE-Regular", size: 12)
        } else if IS_IPHONE_12PRO_MAX {
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewBTN.titleLabel?.font = UIFont(name: "SUITE-Regular", size: 12)
        } else if IS_IPHONE_15PRO_MAX {
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewBTN.titleLabel?.font = UIFont(name: "SUITE-Regular", size: 12)
        } else {
            DyslipidemiaManagementNotebookView.DyslipidemiaVIewBTN.titleLabel?.font = UIFont(name: "SUITE-Regular", size: 14)
        }
        
//        DyslipidemiaManagementNotebookView.DyslipidemiaVIewBTN.titleLabel?.font = UIFont(name: "SUITE-Regular", size: 14)
        DyslipidemiaManagementNotebookView.DyslipidemiaVIewBTN.addTarget(self, action: #selector(show(_ :)), for: .touchUpInside)
        
        DyslipidemiaManagementNotebookView.DyslipidemiahVIew.addSubview(DyslipidemiaManagementNotebookView.DyslipidemiaVIewBTN)
        
        
//        if IS_IPHONE_X {
//            DyslipidemiaManagementNotebookView.DyslipidemiaVIewBTN = UIButton(frame: CGRect(x: 50, y: DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowNumLabel.frame.maxY + 15, width: 115, height: DyslipidemiaManagementNotebookView.DyslipidemiahVIew.frame.size.height / 10))
//            DyslipidemiaManagementNotebookView.DyslipidemiaVIewBTN.setTitle("나의 목표 수정", for: .normal)
//            
//            
//            DyslipidemiaManagementNotebookView.DyslipidemiaVIewBTN.setImage(UIImage(named: "myGoal"), for: .normal)
//
//            
//            DyslipidemiaManagementNotebookView.DyslipidemiaVIewBTN.imageEdgeInsets = UIEdgeInsets(top: 10, left: -3, bottom: 10, right: 4)
//            
//            DyslipidemiaManagementNotebookView.DyslipidemiaVIewBTN.titleLabel?.font = UIFont(name: "SUITE-Regular", size: 14)
//            
//            DyslipidemiaManagementNotebookView.DyslipidemiaVIewBTN.layer.borderWidth = 1
//            
//            DyslipidemiaManagementNotebookView.DyslipidemiaVIewBTN.layer.cornerRadius = 12
//            DyslipidemiaManagementNotebookView.DyslipidemiaVIewBTN.addTarget(self, action: #selector(show(_ :)), for: .touchUpInside)
//            
//            DyslipidemiaManagementNotebookView.DyslipidemiahVIew.addSubview(DyslipidemiaManagementNotebookView.DyslipidemiaVIewBTN)
//        } else {
//            DyslipidemiaManagementNotebookView.DyslipidemiaVIewBTN = UIButton(frame: CGRect(x: 50, y: DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowNumLabel.frame.maxY + 15, width: 115, height: DyslipidemiaManagementNotebookView.DyslipidemiahVIew.frame.size.height / 10))
//            DyslipidemiaManagementNotebookView.DyslipidemiaVIewBTN.setTitle("나의 목표 수정", for: .normal)
//            
//            
//            DyslipidemiaManagementNotebookView.DyslipidemiaVIewBTN.setImage(UIImage(named: "myGoal"), for: .normal)
//
//            
//            DyslipidemiaManagementNotebookView.DyslipidemiaVIewBTN.imageEdgeInsets = UIEdgeInsets(top: 10, left: -3, bottom: 10, right: 4)
//            
//            DyslipidemiaManagementNotebookView.DyslipidemiaVIewBTN.titleLabel?.font = UIFont(name: "SUITE-Regular", size: 14)
//            DyslipidemiaManagementNotebookView.DyslipidemiaVIewBTN.titleLabel?.font = UIFont.systemFont(ofSize: 14)
//            DyslipidemiaManagementNotebookView.DyslipidemiaVIewBTN.layer.borderWidth = 1
//            DyslipidemiaManagementNotebookView.DyslipidemiaVIewBTN.layer.cornerRadius = 12
//            DyslipidemiaManagementNotebookView.DyslipidemiaVIewBTN.addTarget(self, action: #selector(show(_ :)), for: .touchUpInside)
//            
//            DyslipidemiaManagementNotebookView.DyslipidemiahVIew.addSubview(DyslipidemiaManagementNotebookView.DyslipidemiaVIewBTN)
//        }
//        
        saveData = UILabel(frame: CGRect(x: 20, y: DyslipidemiaManagementNotebookView.DyslipidemiahVIew.frame.maxY + 2, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 12))
        saveData.text = "혈중 지질 수치를 입력해주세요."
        
        saveData.font = UIFont(name: "SUITE-Regular", size: 18)
        
        
        scrollView.addSubview(saveData)
        
//        var saveView: UIView!
        
//        var afterBTN: UIButton!
//        var beforeBTN: UIButton!
//        var bloodTF: UITextField!
//        var glycated: UITextField!
        
        saveView = UIView(frame: CGRect(x: 20, y: saveData.frame.maxY + 2, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 2.5))
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
        dateViewLabel.layer.addBorder([.bottom], color: .lightGray, width: 1)
        dateViewLabel.font = UIFont(name: "SUITE-Regular", size: 17)
        
//        date = UILabel(frame: CGRect(x: dateViewLabel.frame.maxX + 50, y: dateViewLabel.frame.minY, width: 200, height: dateView.frame.height))
//        date.text = Date()
        var time = Date()
        var formatter = DateFormatter()
//        formatter.dateFormat = "MM.dd.yyyy a h:mm"
        formatter.locale = Locale(identifier: "ko_KR")

        formatter.dateFormat = "yyyy.MM.dd a h:mm"
        formatter.amSymbol = "오전"
            formatter.pmSymbol = "오후"
            
        
        
        let formattedDateInString = formatter.string(from: time)
        
        
        changeTf = UITextField(frame: CGRect(x: dateViewLabel.frame.maxX, y: dateViewLabel.frame.minY, width: saveView.frame.size.width - 40 - dateViewLabel.frame.width, height: dateView.frame.height))
        changeTf.placeholder = formattedDateInString
        
        
        changeTf.textAlignment = .right
        changeTf.layer.addBorder([.bottom], color: .lightGray, width: 1)
        dateView.addSubview(changeTf)
        
         
//        showDatePicker()
        
        setupToolBar()
        setupDatePicker()
        
        
        //        if IS_IPHONE_X {
        DyslipidemiaManagementNotebookView.dateLable = UILabel(frame: CGRect(x: dateViewLabel.frame.maxX, y: dateViewLabel.frame.minY, width: dateView.frame.size.width - 20 - dateViewLabel.frame.width, height: dateView.frame.height))
        //        }
        //        if IS_IPHONE_12PRO_MAX {
        //            BloodPressureManagementNotebookView.dateLable = UILabel(frame: CGRect(x: dateViewLabel.frame.maxX, y: dateViewLabel.frame.minY, width: 200, height: dateView.frame.height))
        //        }
        //        if IS_IPHONE_N_PLUS {
        //            BloodPressureManagementNotebookView.dateLable = UILabel(frame: CGRect(x: dateViewLabel.frame.maxX, y: dateViewLabel.frame.minY, width: 200, height: dateView.frame.height))
        //        }
        //        BloodPressureManagementNotebookView.dateLable.layer.borderWidth = 1
        DyslipidemiaManagementNotebookView.dateLable.text = formattedDateInString
        DyslipidemiaManagementNotebookView.dateLable.textAlignment = .right
        DyslipidemiaManagementNotebookView.dateLable.layer.addBorder([.bottom], color: .lightGray, width: 1)
                
//                dateView.addSubview(DyslipidemiaManagementNotebookView.dateLable)
        
        var mycholesterolView = UIView(frame: CGRect(x: 10, y: dateView.frame.maxY, width: saveView.frame.size.width - 20, height: self.view.frame.size.height / 14))
        mycholesterolView.backgroundColor = .white
        
        saveView.addSubview(mycholesterolView)
        
        var mycholesterolViewLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 100, height: dateView.frame.height))
        mycholesterolViewLabel.text = "총 콜레스테롤"
        
        mycholesterolViewLabel.font = UIFont(name: "SUITE-Regular", size: 17)
        mycholesterolViewLabel.layer.addBorder([.bottom], color: .lightGray, width: 1)
        mycholesterolView.addSubview(mycholesterolViewLabel)
        
   
        
        
        
//        cholesterolInputView = UITextField(frame: CGRect(x: mycholesterolViewLabel.frame.maxX + 75, y: 0, width: mycholesterolViewLabel.frame.width * 2, height: mycholesterolViewLabel.frame.height))
//        cholesterolInputView.placeholder = "측정치를 적어주세요."
//        mycholesterolView.addSubview(cholesterolInputView)
        
            cholesterolInputView = UITextField(frame: CGRect(x: mycholesterolViewLabel.frame.maxX, y: 0, width: dateView.frame.size.width - 20 - mycholesterolViewLabel.frame.width, height: mycholesterolViewLabel.frame.height))
            cholesterolInputView.placeholder = "측정치를 적어주세요."
        cholesterolInputView.keyboardType = .numberPad
            
        cholesterolInputView.textAlignment = .right
        cholesterolInputView.layer.addBorder([.bottom], color: .lightGray, width: 1)
        cholesterolInputView.font = UIFont(name: "SUITE-Regular", size: 17)
        cholesterolInputView.delegate = self
        mycholesterolView.addSubview(cholesterolInputView)
        
        
        
            
            
        

        
        
        var myHdlCholesterolView = UIView(frame: CGRect(x: 10, y: mycholesterolView.frame.maxY, width: saveView.frame.size.width - 20, height: self.view.frame.size.height / 14))
        myHdlCholesterolView.backgroundColor = .white
        
        saveView.addSubview(myHdlCholesterolView)
        
        var myHdlCholesterolViewLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 110, height: dateView.frame.height))
        myHdlCholesterolViewLabel.text = "HDL콜레스테롤"
        
        myHdlCholesterolViewLabel.font = UIFont(name: "SUITE-Regular", size: 17)
        myHdlCholesterolViewLabel.layer.addBorder([.bottom], color: .lightGray, width: 1)
        myHdlCholesterolView.addSubview(myHdlCholesterolViewLabel)
        
        
       
        
   
        
        hdlInputView = UITextField(frame: CGRect(x: myHdlCholesterolViewLabel.frame.maxX, y: 0, width: dateView.frame.size.width - 20 - myHdlCholesterolViewLabel.frame.width, height: myHdlCholesterolViewLabel.frame.height))
            hdlInputView.placeholder = "측정치를 적어주세요."
            
        hdlInputView.keyboardType = .numberPad
        hdlInputView.textAlignment = .right
        hdlInputView.layer.addBorder([.bottom], color: .lightGray, width: 1)
        hdlInputView.font = UIFont(name: "SUITE-Regular", size: 17)
        hdlInputView.delegate = self
        myHdlCholesterolView.addSubview(hdlInputView)
        
        
        
        var myLdlCholesterolView = UIView(frame: CGRect(x: 10, y: myHdlCholesterolView.frame.maxY, width: saveView.frame.size.width - 20, height: self.view.frame.size.height / 14))
        myLdlCholesterolView.backgroundColor = .white
        
        saveView.addSubview(myLdlCholesterolView)
        
        var myLdlCholesterolViewLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 105, height: dateView.frame.height))
        myLdlCholesterolViewLabel.text = "LDL콜레스테롤"
        
        myLdlCholesterolViewLabel.font = UIFont(name: "SUITE-Regular", size: 17)
        myLdlCholesterolViewLabel.layer.addBorder([.bottom], color: .lightGray, width: 1)
        myLdlCholesterolView.addSubview(myLdlCholesterolViewLabel)
        
        
     
        
        
            ldlInputView = UITextField(frame: CGRect(x: myLdlCholesterolViewLabel.frame.maxX, y: 0, width: dateView.frame.size.width - 20 - myLdlCholesterolViewLabel.frame.width, height: myLdlCholesterolViewLabel.frame.height))
            ldlInputView.placeholder = "측정치를 적어주세요."
        ldlInputView.keyboardType = .numberPad
        
        ldlInputView.textAlignment = .right
        ldlInputView.layer.addBorder([.bottom], color: .lightGray, width: 1)
        ldlInputView.font = UIFont(name: "SUITE-Regular", size: 17)
        ldlInputView.delegate = self
        
        myLdlCholesterolView.addSubview(ldlInputView)
        
        
        
        var myneutralFatlView = UIView(frame: CGRect(x: 10, y: myLdlCholesterolView.frame.maxY, width: saveView.frame.size.width - 20, height: self.view.frame.size.height / 14))
        myLdlCholesterolView.backgroundColor = .white
        

        saveView.addSubview(myneutralFatlView)
        
        var myneutralFatlViewLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 100, height: dateView.frame.height))
        myneutralFatlViewLabel.text = "중성지방"
        
        myneutralFatlViewLabel.font = UIFont(name: "SUITE-Regular", size: 17)
        myneutralFatlViewLabel.layer.addBorder([.bottom], color: .lightGray, width: 1)
        myneutralFatlView.addSubview(myneutralFatlViewLabel)
        
  
       
        
      
            neutralFatInputView = UITextField(frame: CGRect(x: myneutralFatlViewLabel.frame.maxX, y: 0, width: dateView.frame.size.width - 20 - myneutralFatlViewLabel.frame.width, height: myneutralFatlViewLabel.frame.height))
            neutralFatInputView.placeholder = "측정치를 적어주세요."
        neutralFatInputView.keyboardType = .numberPad
      
        neutralFatInputView.textAlignment = .right
        neutralFatInputView.layer.addBorder([.bottom], color: .lightGray, width: 1)
        neutralFatInputView.font = UIFont(name: "SUITE-Regular", size: 17)
        neutralFatInputView.delegate = self
        myneutralFatlView.addSubview(neutralFatInputView)
        
        
        
        cancelBTN = UIButton(frame: CGRect(x: 0, y: saveView.frame.maxY + 10, width: self.view.frame.size.width / 2, height: self.view.frame.size.height / 12))
        cancelBTN.setTitle("취소", for: .normal)
        cancelBTN.backgroundColor = #colorLiteral(red: 0.6152173877, green: 0.6653684974, blue: 0.7206344604, alpha: 1)
        cancelBTN.addTarget(self, action: #selector(setDown(_ :)), for: .touchUpInside)
        scrollView.addSubview(cancelBTN)
        
         saveBTN = UIButton(frame: CGRect(x: cancelBTN.frame.maxX, y: saveView.frame.maxY + 10, width: self.view.frame.size.width / 2, height: self.view.frame.size.height / 12))
        saveBTN.setTitle("저장", for: .normal)
        saveBTN.addTarget(self, action: #selector(saveButtonPressed(_ :)), for: .touchUpInside)
        saveBTN.backgroundColor = #colorLiteral(red: 0.1400382817, green: 0.3497706652, blue: 0.5862404704, alpha: 1)
        scrollView.addSubview(saveBTN)
        
        
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: menuView.frame.maxY).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: saveBTN.bottomAnchor, constant: 50).isActive = true
        
        
        
        
        
        if IS_IPHONE_N_PLUS {
            set = UIView(frame: CGRect(x: 20, y: scrollView.frame.minY + 20, width: self.view.frame.width - 40, height: self.view.frame.size.height / 3))
        } 
        if IS_IPHONE_N {
            set = UIView(frame: CGRect(x: 20, y: scrollView.frame.minY + 20, width: self.view.frame.width - 40, height: self.view.frame.size.height / 2.7))
        } else if IS_IPHONE_12PRO_MAX {
            set = UIView(frame: CGRect(x: 20, y: scrollView.frame.minY + 20, width: self.view.frame.width - 40, height: self.view.frame.size.height / 3.5))
        } else if IS_IPHONE_15PRO_MAX {
            set = UIView(frame: CGRect(x: 20, y: scrollView.frame.minY + 20, width: self.view.frame.width - 40, height: self.view.frame.size.height / 3.5))
        }  else if IS_IPHONE_12PRO {
            set = UIView(frame: CGRect(x: 20, y: scrollView.frame.minY + 20, width: self.view.frame.width - 40, height: self.view.frame.size.height / 3.3))
        } else if IS_IPHONE_15PRO {
          set = UIView(frame: CGRect(x: 20, y: scrollView.frame.minY + 20, width: self.view.frame.width - 40, height: self.view.frame.size.height / 3.3))
      }else {
            set = UIView(frame: CGRect(x: 20, y: scrollView.frame.minY + 20, width: self.view.frame.width - 40, height: self.view.frame.size.height / 3))
        }
        set.layer.cornerRadius = 8
        set.backgroundColor = .white
        scrollView.addSubview(set)
        
        var setImgView = UIImageView(frame: CGRect(x: set.frame.size.width / 2.2, y: set.frame.minY + 15, width: 50, height: 60))
        set.addSubview(setImgView)
        
        var setImg = UIImage(named: "setImg")
        setImgView.image = setImg
    
        set.isHidden = true
        
        var hideView = UIView(frame: CGRect(x: 0, y: set.frame.maxY - 5, width: self.view.frame.width, height: self.view.frame.height))
//        hideView.backgroundColor = .lightGray
//        hideView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        hideView.backgroundColor = #colorLiteral(red: 0.9462642074, green: 0.9525992274, blue: 0.9730225205, alpha: 1)
        set.addSubview(hideView)
        
        var setTitle = UILabel(frame: CGRect(x: set.frame.size.width / 4, y: setImgView.frame.maxY, width: 300, height: 50))
        setTitle.font = UIFont.systemFont(ofSize: 18)
        setTitle.text = "나의 혈압 관리 목표 설정하기"
//        setTitle.numberOfLines = 0
        set.addSubview(setTitle)
        
        var totalCholesterol = UILabel(frame: CGRect(x: 20, y: setTitle.frame.maxY + 45, width: 100, height: 35))
        totalCholesterol.text = "LDL"
//        Shrink.font = UIFont.systemFont(ofSize: 20)
        totalCholesterol.layer.addBorder([.bottom], color: .lightGray, width: 1)
        totalCholesterol.font = UIFont(name: "SUITE-Regular", size: 17)
        set.addSubview(totalCholesterol)
        
        
        totalCholesterolGoal = UITextField(frame: CGRect(x: totalCholesterol.frame.maxX, y: setTitle.frame.maxY + 45, width: set.frame.size.width - 40 - totalCholesterol.frame.width, height: 35))
        totalCholesterolGoal.placeholder = "목표 수치를 입력해주세요."
        totalCholesterolGoal.keyboardType = .numberPad
        totalCholesterolGoal.textAlignment = .right
//        ShrinkGoal.font = UIFont.systemFont(ofSize: 20)
        totalCholesterolGoal.layer.addBorder([.bottom], color: .lightGray, width: 1)
        totalCholesterolGoal.font = UIFont(name: "SUITE-Regular", size: 17)
        totalCholesterolGoal.delegate = self
        set.addSubview(totalCholesterolGoal)
        
       
        
//        var dangerBTN2 = UIButton()
//        if IS_IPHONE_N_PLUS {
//            
//            dangerBTN2 = UIButton(frame: CGRect(x: 20, y: pulseGoal.frame.maxY + 15, width: dateView.frame.size.width - 20, height: 35))
//        } else if IS_IPHONE_12PRO_MAX {
//            dangerBTN2 = UIButton(frame: CGRect(x: 20, y: pulseGoal.frame.maxY + 25, width: dateView.frame.size.width - 20, height: 45))
//        } else {
//            dangerBTN2 = UIButton(frame: CGRect(x: 20, y: pulseGoal.frame.maxY + 15, width: dateView.frame.size.width - 20, height: 35))
//        }
////        dangerBTN2 = UIButton(frame: CGRect(x: 20, y: pulseGoal.frame.maxY + 15, width: dateView.frame.size.width - 20, height: 35))
//        dangerBTN2.setTitle("자가 혈압측정 시 주의사항", for: .normal)
//        dangerBTN2.titleLabel?.font = UIFont(name: "SUITE-Regular", size: 17)
//        dangerBTN2.setTitleColor(.blue, for: .normal)
//        dangerBTN2.layer.borderWidth = 1
//        dangerBTN2.layer.cornerRadius = 8
//        dangerBTN2.setImage(UIImage(named: "smRlaVy"), for: .normal)
//        dangerBTN2.imageEdgeInsets = UIEdgeInsets(top: 10, left: -3, bottom: 10, right: 4)
//        dangerBTN2.titleLabel?.textAlignment = .center
//        set.addSubview(dangerBTN2)
        
        
        if IS_IPHONE_X {
            set = UIView(frame: CGRect(x: 20, y: scrollView.frame.minY + 20, width: self.view.frame.width - 40, height: self.view.frame.size.height / 3.2))
            set.layer.cornerRadius = 8
            set.backgroundColor = .white
            scrollView.addSubview(set)
            
            var setImgView = UIImageView(frame: CGRect(x: set.frame.size.width / 2.2, y: set.frame.minY + 15, width: 50, height: 60))
            set.addSubview(setImgView)
            
            var setImg = UIImage(named: "setImg")
            setImgView.image = setImg
        
            set.isHidden = true
            
            var hideView = UIView(frame: CGRect(x: 0, y: set.frame.maxY - 5, width: self.view.frame.width, height: self.view.frame.height))
//            hideView.backgroundColor = .lightGray
//            hideView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            hideView.backgroundColor = #colorLiteral(red: 0.9462642074, green: 0.9525992274, blue: 0.9730225205, alpha: 1)
            set.addSubview(hideView)
            
            var setTitle = UILabel(frame: CGRect(x: set.frame.size.width / 3.8, y: setImgView.frame.maxY, width: 300, height: 50))
            setTitle.font = UIFont.systemFont(ofSize: 18)
            setTitle.text = "나의 혈압 관리 목표 설정하기"
    //        setTitle.numberOfLines = 0
            set.addSubview(setTitle)
            
            var totalCholesterol = UILabel(frame: CGRect(x: 20, y: setTitle.frame.maxY + 45, width: 100, height: 30))
            totalCholesterol.text = "LDL"
    //        Shrink.font = UIFont.systemFont(ofSize: 20)
            totalCholesterol.layer.addBorder([.bottom], color: .lightGray, width: 1)
            totalCholesterol.font = UIFont(name: "SUITE-Regular", size: 17)
            set.addSubview(totalCholesterol)

            totalCholesterolGoal = UITextField(frame: CGRect(x: totalCholesterol.frame.maxX, y: setTitle.frame.maxY + 45, width: set.frame.size.width - 40 - totalCholesterol.frame.width, height: 30))
            totalCholesterolGoal.placeholder = "목표 수치를 입력해주세요."
            totalCholesterolGoal.keyboardType = .numberPad
    //        ShrinkGoal.font = UIFont.systemFont(ofSize: 20)
            totalCholesterolGoal.textAlignment = .right
            totalCholesterolGoal.layer.addBorder([.bottom], color: .lightGray, width: 1)
            totalCholesterolGoal.font = UIFont(name: "SUITE-Regular", size: 17)
            set.addSubview(totalCholesterolGoal)
            
           
            

            
            
            
        }
        
        
        
        
        
        
        
        
        
        
        
//        set = UIView(frame: CGRect(x: 10, y: scrollView.frame.minY + 10, width: self.view.frame.width - 20, height: self.view.frame.size.height / 3.5))
//        set.backgroundColor = .white
//        scrollView.addSubview(set)
//        
//        var setImgView = UIImageView(frame: CGRect(x: set.frame.size.width / 2.2, y: set.frame.minY + 15, width: 50, height: 60))
//        set.addSubview(setImgView)
//        
//        var setImg = UIImage(named: "setImg")
//        setImgView.image = setImg
//    
//        set.isHidden = true
//        
//        var hideView = UIView(frame: CGRect(x: 0, y: set.frame.maxY - 5, width: self.view.frame.width, height: self.view.frame.height))
//        hideView.backgroundColor = .lightGray
//        set.addSubview(hideView)
//        
//        var setTitle = UILabel(frame: CGRect(x: set.frame.size.width / 2.9, y: setImgView.frame.maxY, width: 130, height: 50))
//        setTitle.font = UIFont.systemFont(ofSize: 18)
//        setTitle.text = "  나의 콜레스테롤\n관리 목표설정하기"
//        setTitle.numberOfLines = 0
//        set.addSubview(setTitle)
//        
//        var totalCholesterol = UILabel(frame: CGRect(x: 20, y: setTitle.frame.maxY + 38, width: 100, height: 30))
//        totalCholesterol.text = "총 콜레스테롤"
//        totalCholesterol.font = UIFont.systemFont(ofSize: 18)
//        set.addSubview(totalCholesterol)
//
//        totalCholesterolGoal = UITextField(frame: CGRect(x: totalCholesterol.frame.maxX + 30, y: setTitle.frame.maxY + 38, width: 230, height: 30))
//        totalCholesterolGoal.placeholder = "목표 수치를 입력해주세요."
//        totalCholesterolGoal.font = UIFont.systemFont(ofSize: 20)
//        set.addSubview(totalCholesterolGoal)
//        
//        if IS_IPHONE_X {
//            set = UIView(frame: CGRect(x: 10, y: scrollView.frame.minY + 10, width: self.view.frame.width - 20, height: self.view.frame.size.height / 3.5))
//            set.backgroundColor = .white
//            scrollView.addSubview(set)
//            
//            var setImgView = UIImageView(frame: CGRect(x: set.frame.size.width / 2.2, y: set.frame.minY + 15, width: 50, height: 60))
//            set.addSubview(setImgView)
//            
//            var setImg = UIImage(named: "setImg")
//            setImgView.image = setImg
//        
//            set.isHidden = true
//            
//            var hideView = UIView(frame: CGRect(x: 0, y: set.frame.maxY - 5, width: self.view.frame.width, height: self.view.frame.height))
//            hideView.backgroundColor = .lightGray
//            set.addSubview(hideView)
//            
//            var setTitle = UILabel(frame: CGRect(x: set.frame.size.width / 2.9, y: setImgView.frame.maxY, width: 130, height: 50))
//            setTitle.font = UIFont.systemFont(ofSize: 18)
//            setTitle.text = "  나의 콜레스테롤\n관리 목표설정하기"
//            setTitle.numberOfLines = 0
//            set.addSubview(setTitle)
//            
//            var totalCholesterol = UILabel(frame: CGRect(x: 20, y: setTitle.frame.maxY + 38, width: 100, height: 30))
//            totalCholesterol.text = "총 콜레스테롤"
//            totalCholesterol.font = UIFont.systemFont(ofSize: 18)
//            set.addSubview(totalCholesterol)
//
//            totalCholesterolGoal = UITextField(frame: CGRect(x: totalCholesterol.frame.maxX + 30, y: setTitle.frame.maxY + 38, width: 230, height: 30))
//            totalCholesterolGoal.placeholder = "목표 수치를 입력해주세요."
//            totalCholesterolGoal.font = UIFont.systemFont(ofSize: 17)
//            set.addSubview(totalCholesterolGoal)
//            
//        }
        
        
//        goalCancelBTN = UIButton(frame: CGRect(x: 0, y: self.view.frame.maxY - self.view.frame.size.height / 12 - 150, width: self.view.frame.size.width / 2, height: self.view.frame.size.height / 12))
//        goalCancelBTN.setTitle("취소", for: .normal)
//        goalCancelBTN.backgroundColor = #colorLiteral(red: 0.6152173877, green: 0.6653684974, blue: 0.7206344604, alpha: 1)
//        scrollView.addSubview(goalCancelBTN)
//        goalCancelBTN.addTarget(self, action: #selector(setDown(_ :)), for: .touchUpInside)
//        goalCancelBTN.isHidden = true
//        
//        goalSaveBTN = UIButton(frame: CGRect(x: cancelBTN.frame.maxX, y: self.view.frame.maxY - self.view.frame.size.height / 12 - 150, width: self.view.frame.size.width / 2, height: self.view.frame.size.height / 12))
//        goalSaveBTN.setTitle("저장", for: .normal)
//        goalSaveBTN.backgroundColor = #colorLiteral(red: 0.1400382817, green: 0.3497706652, blue: 0.5862404704, alpha: 1)
//        goalSaveBTN.addTarget(self, action: #selector(saveGoalData(_ :)), for: .touchUpInside)
//        scrollView.addSubview(goalSaveBTN)
//        goalSaveBTN.isHidden = true
        goalCancelBTN = UIButton(frame: CGRect(x: 0, y: self.view.frame.maxY - self.view.frame.size.height / 12 - 190, width: self.view.frame.size.width / 2, height: self.view.frame.size.height / 12))
        goalCancelBTN.setTitle("취소", for: .normal)
//        goalCancelBTN.addTarget(self, action: #selector(setDown(_ :)), for: .touchUpInside)
        goalCancelBTN.backgroundColor = #colorLiteral(red: 0.6152173877, green: 0.6653684974, blue: 0.7206344604, alpha: 1)
        scrollView.addSubview(goalCancelBTN)
        goalCancelBTN.isHidden = true
        
        goalSaveBTN = UIButton(frame: CGRect(x: cancelBTN.frame.maxX, y: self.view.frame.maxY - self.view.frame.size.height / 12 - 190, width: self.view.frame.size.width / 2, height: self.view.frame.size.height / 12))
        goalSaveBTN.setTitle("저장", for: .normal)
        goalSaveBTN.backgroundColor = #colorLiteral(red: 0.1400382817, green: 0.3497706652, blue: 0.5862404704, alpha: 1)
        goalSaveBTN.addTarget(self, action: #selector(saveGoalData(_ :)), for: .touchUpInside)
        scrollView.addSubview(goalSaveBTN)
        goalSaveBTN.isHidden = true
        
        
        if IS_IPHONE_N_PLUS {
            goalCancelBTN = UIButton(frame: CGRect(x: 0, y: self.view.frame.maxY - self.view.frame.size.height / 12 - 130, width: self.view.frame.size.width / 2, height: self.view.frame.size.height / 12))
            goalCancelBTN.setTitle("취소", for: .normal)
//            goalCancelBTN.addTarget(self, action: #selector(setDown(_ :)), for: .touchUpInside)
            goalCancelBTN.backgroundColor = #colorLiteral(red: 0.6152173877, green: 0.6653684974, blue: 0.7206344604, alpha: 1)
            scrollView.addSubview(goalCancelBTN)
            goalCancelBTN.isHidden = true
            
            goalSaveBTN = UIButton(frame: CGRect(x: cancelBTN.frame.maxX, y: self.view.frame.maxY - self.view.frame.size.height / 12 - 130, width: self.view.frame.size.width / 2, height: self.view.frame.size.height / 12))
            goalSaveBTN.setTitle("저장", for: .normal)
            goalSaveBTN.backgroundColor = #colorLiteral(red: 0.1400382817, green: 0.3497706652, blue: 0.5862404704, alpha: 1)
            goalSaveBTN.addTarget(self, action: #selector(saveGoalData(_ :)), for: .touchUpInside)
            scrollView.addSubview(goalSaveBTN)
            goalSaveBTN.isHidden = true
        }
        if IS_IPHONE_N {
            goalCancelBTN = UIButton(frame: CGRect(x: 0, y: self.view.frame.maxY - self.view.frame.size.height / 12 - 120, width: self.view.frame.size.width / 2, height: self.view.frame.size.height / 12))
            goalCancelBTN.setTitle("취소", for: .normal)
//            goalCancelBTN.addTarget(self, action: #selector(setDown(_ :)), for: .touchUpInside)
            goalCancelBTN.backgroundColor = #colorLiteral(red: 0.6152173877, green: 0.6653684974, blue: 0.7206344604, alpha: 1)
            scrollView.addSubview(goalCancelBTN)
            goalCancelBTN.isHidden = true
            
            goalSaveBTN = UIButton(frame: CGRect(x: cancelBTN.frame.maxX, y: self.view.frame.maxY - self.view.frame.size.height / 12 - 120, width: self.view.frame.size.width / 2, height: self.view.frame.size.height / 12))
            goalSaveBTN.setTitle("저장", for: .normal)
            goalSaveBTN.backgroundColor = #colorLiteral(red: 0.1400382817, green: 0.3497706652, blue: 0.5862404704, alpha: 1)
            goalSaveBTN.addTarget(self, action: #selector(saveGoalData(_ :)), for: .touchUpInside)
            scrollView.addSubview(goalSaveBTN)
            goalSaveBTN.isHidden = true
        }
     
        
//        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: menuView.frame.maxY).isActive = true
//        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//        scrollView.bottomAnchor.constraint(equalTo: saveBTN.bottomAnchor, constant: 50).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: menuView.frame.maxY).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: saveBTN.bottomAnchor, constant: 0).isActive = true
        
        
        DyslipidemiaWebView.isHidden = false
        DyslipidemiaManagementNotebookView.isHidden = true
        DyslipidemiaManagementTest.isHidden = true
        
        
        if keyCounter == 0 {
//            scrollView.backgroundColor = .lightGray
            scrollView.backgroundColor = #colorLiteral(red: 0.9462642074, green: 0.9525992274, blue: 0.9730225205, alpha: 1)
//            DyslipidemiaManagementNotebookView.DyslipidemiahVIew.backgroundColor = .lightGray
            scrollView.backgroundColor = #colorLiteral(red: 0.9430552125, green: 0.9525354505, blue: 0.9730286002, alpha: 1)
            set.isHidden = false
            goalCancelBTN.isHidden = false
            goalSaveBTN.isHidden = false
            
            DyslipidemiaWebView.isHidden = true
            DyslipidemiaManagementNotebookView.isHidden = true
            DyslipidemiaManagementTest.isHidden = true
            DyslipidemiaManagementNotebookView.DyslipidemiahVIew.isHidden = true
            
            saveView.isHidden = true
            saveData.isHidden = true
            
            keyCounter = 10
            UserDefaults.standard.setValue(keyCounter, forKey: "DyKey")
            
            print("key?????\(keyCounter)")
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        DyslipidemiaWebView.isHidden = false
        DyslipidemiaManagementNotebookView.isHidden = true
        DyslipidemiaManagementTest.isHidden = true
        
        super.viewDidAppear(animated)
        print("------1")
        
//        dataUpdateBl()
//        dataUpdate()
//        singUPData()
        print("------2")
        
        if set.isHidden == false {
            scrollView.isScrollEnabled = false
        } else {
            scrollView.isScrollEnabled = true
        }
    }
    
    @objc func show(_ sender: UIButton) {
//        scrollView.backgroundColor = .lightGray
        
        DyslipidemiaManagementNotebookView.DyslipidemiahVIew.backgroundColor = .lightGray
        set.isHidden = false
        goalCancelBTN.isHidden = false
        goalSaveBTN.isHidden = false
        
        DyslipidemiaWebView.isHidden = true
        DyslipidemiaManagementNotebookView.isHidden = true
        DyslipidemiaManagementTest.isHidden = true
        
        DyslipidemiaManagementNotebookView.DyslipidemiahVIew.isHidden = true
        
        saveView.isHidden = true
        saveData.isHidden = true

        cancelBTN.isHidden = true
        saveBTN.isHidden = true
        
        scrollView.isScrollEnabled = false
        
    }
    
    @objc func rightButton2PressedList(_ button: UIButton) {
        testBtn1.backgroundColor = #colorLiteral(red: 0, green: 0.5898328424, blue: 0.8106423616, alpha: 1)
        testBtn2.backgroundColor = #colorLiteral(red: 0.9462642074, green: 0.9525992274, blue: 0.9730225205, alpha: 1)
        testBtn2.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        testBtn1.setTitleColor(.white, for: .normal)
        testBtn2.setTitleColor(#colorLiteral(red: 36.0 / 255.0, green: 89.0 / 255.0, blue: 149.0 / 255.0, alpha: 1), for: .normal)
        testBtn1.layer.borderWidth = 0
        testBtn2.layer.borderWidth = 1
        testBtn2.layer.borderColor = #colorLiteral(red: 0.6836393476, green: 0.7600957155, blue: 0.8458803296, alpha: 1).cgColor
        self.DyslipidemiaManagementTest.graphScrollView.isHidden = true
        self.DyslipidemiaManagementTest.dataScrollView.isHidden = false

        self.DyslipidemiaManagementTest.dataScrollView.dataUpdate()
    }
    
    @objc func rightButton2PressedGraph(_ button: UIButton) {
        testBtn1.backgroundColor = #colorLiteral(red: 0.9462642074, green: 0.9525992274, blue: 0.9730225205, alpha: 1)
        testBtn1.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        testBtn1.layer.borderWidth = 1
        testBtn2.layer.borderWidth = 0
        
        
        testBtn2.backgroundColor = #colorLiteral(red: 0, green: 0.5898328424, blue: 0.8106423616, alpha: 1)
        testBtn1.layer.borderColor = #colorLiteral(red: 0.6836393476, green: 0.7600957155, blue: 0.8458803296, alpha: 1).cgColor
        
//        testBtn1.setTitleColor(.black, for: .normal)
        testBtn1.setTitleColor(#colorLiteral(red: 36.0 / 255.0, green: 89.0 / 255.0, blue: 149.0 / 255.0, alpha: 1), for: .normal)
        testBtn2.setTitleColor(.white, for: .normal)
        
        self.DyslipidemiaManagementTest.graphScrollView.isHidden = false
        self.DyslipidemiaManagementTest.dataScrollView.isHidden = true

        self.DyslipidemiaManagementTest.graphScrollView.dataUpdate(index: 1)
        
        
    }
    
    func moveSelected(view :UIView, button: UIButton) {
        view.center.x = button.center.x
    }
    
    @objc func segButtonPressed(_ sender: UIButton) {
print("tab")
        self.view.endEditing(true)
        
        if sender.tag == 0 {
            UIView.animate(withDuration: 0.5, animations: { [self] in
              
//            moveSelected(view: UnderBar, button: button1)
                
            })
            DyslipidemiaWebView.isHidden = false
            DyslipidemiaManagementNotebookView.isHidden = true
            DyslipidemiaManagementTest.isHidden = true
            
            label1.textColor = .black
            label2.textColor = .lightGray
            label3.textColor = .lightGray
        } else if sender.tag == 1 {
            UIView.animate(withDuration: 0.5, animations: { [self] in
              
//            moveSelected(view: UnderBar, button: button2)
                
            })
            DyslipidemiaWebView.isHidden = true
            DyslipidemiaManagementNotebookView.isHidden = false
            DyslipidemiaManagementTest.isHidden = true
            
            label1.textColor = .lightGray
            label2.textColor = .black
            label3.textColor = .lightGray
        } else if sender.tag == 2 {
            UIView.animate(withDuration: 0.5, animations: { [self] in
              
//            moveSelected(view: UnderBar, button: button3)
                
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
            showToast(message: "총 콜레스테롤을 입력하세요.", font: UIFont(name: "SUITE-Regular", size: 20)!)
            return
        }
        if self.hdlInputView.text == "" {
            toastShow(message: "LDL 콜레스테롤을 입력하세요.")
            showToast(message: "LDL 콜레스테롤을 입력하세요.", font: UIFont(name: "SUITE-Regular", size: 20)!)
            return
        }
        
        if self.ldlInputView.text == "" {
            toastShow(message: "HDL 콜레스테롤을 입력하세요.")
            showToast(message: "HDL 콜레스테롤을 입력하세요.", font: UIFont(name: "SUITE-Regular", size: 20)!)
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
//        let dateTime = current_date_string
        var dateTime = changeTf.text

        
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
        
        let sid = "\(UserDefaults.standard.object(forKey: "userSid") ?? 0)"

        
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
            ] as? [String:String]
        print("sendDataDic:\n\(sendDataDic)")
        self.showToast(message: "데이터가 등록 되었습니다.", font: UIFont(name: "SUITE-Regular", size: 18)!)
        Server.getData(type: Server.InfoType.CHOLESTEROL_ADD, otherInfo: sendDataDic) { (kData : Data?) in
            if let data = kData {
                if let dataString : String = String(data: data, encoding: String.Encoding.utf8) {
                    self.cholesterolInputView.text = ""
                    self.hdlInputView.text = ""
                    self.ldlInputView.text = ""
                    self.neutralFatInputView.text = ""
                    
             
                    
                    
                    print("CHOLESTEROL_ADD:\(dataString)")
                    self.view.endEditing(true)
//                    self.superCon?.segView.itemButtonPressed(button: (self.superCon?.segView.itemButtons[2])!)
                    
                    self.DyslipidemiaManagementTest.dataScrollView.dataUpdate()
                }
            }
        }
    }
//    func dataUpdateBl() {
////            guard let regNumString = userD.object(forKey: USER_KEY.KSR_REGISTRATION_NUMBER) as? String else {
////                toastShow(message: "reg_num is nil error")
////                return
////            }
//    
//            Server.getData(type: Server.InfoType.CHOLESTEROL_USER, otherInfo: ["user_sid":"\(UserDefaults.standard.object(forKey: "userSid") ?? 0)"]) { (kData : Data?) in
//                if let data = kData {
//                    do {
//                        
//                        if let jsonDic = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String:String] {
//                            print("CHOLESTEROL_USER:\n\(jsonDic)")
//    
//                            let LDL = jsonDic["LDL"] ?? ""
////                            self.dyslipidemiaNoteView.goalAndRateView.goalView.valueLabelUpdate(valueString: " \(LDL) ", unitString: "mg/dL")
////                            self.DyslipidemiaManagementTest.dataScrollView.goalView.valueLabelUpdate(valueString: " \(LDL) ", unitString: "mg/dL")
////                            self.DyslipidemiaManagementTest.graphScrollView.goalView.valueLabelUpdate(valueString: " \(LDL) ", unitString: "mg/dL")
//    
//                            
////                            persent = Int(round((Double(success) / Double(cnt)) * 100))
//                            
//                            
//                            let seccess = jsonDic["success"] ?? ""
//                            let successValue = Int(seccess, radix: 10)
//                            let cnt = jsonDic["cnt"] ?? ""
//                            let cntValue = Int(cnt, radix: 10)
//                            
//                            
//                            if let integerJson = jsonDic["success"]!.toCGFloat(){
//                                      print("Integer conversion successful : \(integerJson)")
//                                      
//                                      
//                                      let z = integerJson
//                                      UserDefaults.standard.setValue(z, forKey: "s")
//                                      d1 = (UserDefaults.standard.object(forKey: "s") as! CGFloat)
//                                      
//                                  }
//                                  else{
//                                      print("Integer conversion failed")
//                                  }
//                                  
//                                  
//                                  if let integerJson = jsonDic["cnt"]!.toCGFloat(){
//                                      print("Integer conversion successful : \(integerJson)")
//                                      
//                                      
//                                      let y = integerJson
//                                      UserDefaults.standard.setValue(y, forKey: "c")
//                                      d2 = (UserDefaults.standard.object(forKey: "c") as! CGFloat)
//                                  }
//                                  else{
//                                      print("Integer conversion failed")
//                                  }
//                                  
//                                  
//                                  print(d1)
//                                  print(d2)
//                            
//                            
//                            
//                            print("여기로 와주세요1")
//                                                   
//                            if let success = successValue , let cnt = cntValue {
//                                print("여기로 와주세요2")
//                                let persentD: Int
//                                let perGraphD: CGFloat
//                                if cnt != 0 {
//                                    
//                                    persentD = Int(round((Double(success) / Double(cnt)) * 100))
//                                    perGraphD = CGFloat(round((Double(success) / Double(cnt)) * 100))
//                                    
//                                    print("---------------1")
//                                    UserDefaults.standard.setValue(persentD, forKey: "persentD")
//                                    print(persentD)
//                                    UserDefaults.standard.setValue(perGraphD, forKey: "perGraphD")
//                                    
//                                    print(perGraphD)
//                                    print("---------------1")
//                                }  else {
//                                    persentD = 0
//                                }
//    //                            self.bloodPressureNoteView.bloodPressureGoalAndRateView.rateView.valueLabelUpdate(labelIndex: 0, valueLabelString: "수축기", valueString: " \(persent) ", unitString: "%")
//    //                            self.bloodPressureListView.dataScrollView.rateView.valueLabelUpdate(labelIndex: 0, valueLabelString: "수축기", valueString: " \(persent) ", unitString: "%")
//    //                            self.bloodPressureListView.graphScrollView.rateView.valueLabelUpdate(labelIndex: 0, valueLabelString: "수축기", valueString: " \(persent) ", unitString: "%")
//                            }
//                            
//
//                            
////                            if let success = successValue , let cnt = cntValue {
////                                let persent : Int
////                                if cnt != 0 {
////                                    persent = Int(round((Double(success) / Double(cnt)) * 100))
////                                }else{
////                                    persent = 0
////                                }
//////                                self.DyslipidemiaManagementTest.goalAndRateView.rateView.valueLabelUpdate(valueString: " \(persent) ", unitString: "%")
//////                                self.DyslipidemiaManagementTest.dataScrollView.rateView.valueLabelUpdate(valueString: " \(persent) ", unitString: "%")
//////                                self.DyslipidemiaManagementTest.graphScrollView.rateView.valueLabelUpdate(valueString: " \(persent) ", unitString: "%")
////                            }
//                        }
//                    }catch {
//                        print("error:\(error.localizedDescription)")
//                    }
//                }
//            }
//    
//        }
    
    
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
        if set.isHidden == true {
            //        keyCounter = keyCounter + 1
            //        print("Key Counter = ",keyCounter)
            // 현재 동작하고 있는 이벤트에서 키보드의 frame을 받아옴
            guard let keyboardFrame = sender.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
            let keyboardHeight = keyboardFrame.cgRectValue.height
            
            // ⭐️ 이 조건을 넣어주지 않으면, 각각의 텍스트필드마다 keyboardWillShow 동작이 실행되므로 아래와 같은 현상이 발생
                    if view.frame.origin.y == 0 {
                        view.frame.origin.y -= keyboardHeight
                    }
        } else {
            guard let keyboardFrame = sender.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
            let keyboardHeight = keyboardFrame.cgRectValue.height
        }
        
//        // 현재 동작하고 있는 이벤트에서 키보드의 frame을 받아옴
//        guard let keyboardFrame = sender.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
//        let keyboardHeight = keyboardFrame.cgRectValue.height
//
//        // ⭐️ 이 조건을 넣어주지 않으면, 각각의 텍스트필드마다 keyboardWillShow 동작이 실행되므로 아래와 같은 현상이 발생
////        if view.frame.origin.y == 0 {
////            view.frame.origin.y -= keyboardHeight
////        }
    }
//    @objc func keyboardWillShow(_ sender: Notification) {
//        // keyboardFrame: 현재 동작하고 있는 이벤트에서 키보드의 frame을 받아옴
//        // currentTextField: 현재 응답을 받고있는 UITextField를 알아냅니다.
//        guard let keyboardFrame = sender.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue,
//              let currentTextField = UIResponder.currentResponder as? UITextField else { return }
//        
//        // Y축으로 키보드의 상단 위치
//        let keyboardTopY = keyboardFrame.cgRectValue.origin.y
//        // 현재 선택한 텍스트 필드의 Frame 값
//        let convertedTextFieldFrame = view.convert(currentTextField.frame,
//                                                  from: currentTextField.superview)
//        // Y축으로 현재 텍스트 필드의 하단 위치
//        let textFieldBottomY = convertedTextFieldFrame.origin.y + convertedTextFieldFrame.size.height
//        
//        // Y축으로 텍스트필드 하단 위치가 키보드 상단 위치보다 클 때 (즉, 텍스트필드가 키보드에 가려질 때가 되겠죠!)
//        if textFieldBottomY > keyboardTopY {
//            let textFieldTopY = convertedTextFieldFrame.origin.y
//            // 노가다를 통해서 모든 기종에 적절한 크기를 설정함.
//            let newFrame = textFieldTopY - keyboardTopY/1.6
//            view.frame.origin.y -= newFrame
//        }
//    }

    @objc func keyboardWillHide(_ sender: Notification) {
        if view.frame.origin.y != 0 {
            view.frame.origin.y = 0
        }
    }
    
    
    @objc func saveGoalData(_ sender: UIButton) {
//        UserDefaults.standard.setValue(totalCholesterolGoal.text, forKey: "ch")
//
//        
//        let vc = DyslipidemiaViewController2()
//       
//                                                                   vc.modalPresentationStyle = .fullScreen
//                                                                   self.present(vc, animated: false)
//        
//        DyslipidemiaWebView.isHidden = true
//        DyslipidemiaManagementNotebookView.isHidden = false
//        DyslipidemiaManagementTest.isHidden = true
//        
//        
//        set.isHidden = true
//        goalCancelBTN.isHidden = true
//        goalSaveBTN.isHidden = true
//        
//        
//        
//        DyslipidemiaManagementNotebookView.DyslipidemiahVIew.isHidden = false
//        
//        saveView.isHidden = false
//        saveData.isHidden = false
//        
//
//        NotificationCenter.default.post(name: NSNotification.Name("ch1"), object: nil, userInfo: nil)
//        NotificationCenter.default.post(name: NSNotification.Name("ch2"), object: nil, userInfo: nil)
        
        if totalCholesterolGoal.text == "" {
            UserDefaults.standard.removeObject(forKey: "ch")
            print("비어있음")
            
            showToast(message: "모든 항목을 입력해 주세요.", font: UIFont.systemFont(ofSize: 15))
            
        } else {
            
            UserDefaults.standard.setValue(totalCholesterolGoal.text, forKey: "ch")
            
            
            
            let vc = DyslipidemiaViewController2()
            
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: false)
            DyslipidemiaWebView.isHidden = true
            DyslipidemiaManagementNotebookView.isHidden = false
            DyslipidemiaManagementTest.isHidden = true
            
            
            set.isHidden = true
            goalCancelBTN.isHidden = true
            goalSaveBTN.isHidden = true
            
            
            
            DyslipidemiaManagementNotebookView.DyslipidemiahVIew.isHidden = false
            
            saveView.isHidden = false
            saveData.isHidden = false
            
            
            NotificationCenter.default.post(name: NSNotification.Name("ch1"), object: nil, userInfo: nil)
            NotificationCenter.default.post(name: NSNotification.Name("ch2"), object: nil, userInfo: nil)
            
            
        }
        
    }
    
    @objc func setDown(_ sender: UIButton) {
        set.isHidden = true
        goalCancelBTN.isHidden = true
        goalSaveBTN.isHidden = true
        
        
        cancelBTN.isHidden = false
        saveBTN.isHidden = false
        DyslipidemiaWebView.isHidden = true
        DyslipidemiaManagementNotebookView.isHidden = false
        DyslipidemiaManagementTest.isHidden = true
        DyslipidemiaManagementNotebookView.DyslipidemiahVIew.isHidden = false
        
        saveView.isHidden = false
        saveData.isHidden = false
        scrollView.isScrollEnabled = true
    }

    
    @objc func didRecieveTestNotification(_ notification: Notification) {
        DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowNumLabelNumber.text = UserDefaults.standard.string(forKey: "ch")
                
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowNumLabelNumber.text = UserDefaults.standard.string(forKey: "ch")
        
        if DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowNumLabelNumber.text != nil {
//            scrollView.backgroundColor = .lightGray
            scrollView.backgroundColor = #colorLiteral(red: 0.9462642074, green: 0.9525992274, blue: 0.9730225205, alpha: 1)
            DyslipidemiaManagementNotebookView.DyslipidemiahVIew.backgroundColor = .lightGray
            set.isHidden = true
            goalCancelBTN.isHidden = true
            goalSaveBTN.isHidden = true
            
            DyslipidemiaWebView.isHidden = true
            DyslipidemiaManagementNotebookView.isHidden = false
            DyslipidemiaManagementTest.isHidden = true
            DyslipidemiaManagementNotebookView.DyslipidemiahVIew.isHidden = false
            
            saveView.isHidden = false
            saveData.isHidden = false
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        var time = Date()
        var formatter = DateFormatter()
        //        formatter.dateFormat = "MM.dd.yyyy a h:mm"
        formatter.locale = Locale(identifier: "ko_KR")
        
        formatter.dateFormat = "yyyy.MM.dd a h:mm"
        formatter.amSymbol = "오전"
        formatter.pmSymbol = "오후"
        
        let formattedDateInString = formatter.string(from: time)
        
        changeTf.placeholder = formattedDateInString
    }
    override func viewWillLayoutSubviews() {
        DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowNumLabelNumber.text = UserDefaults.standard.string(forKey: "ch")
        
        if DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowNumLabelNumber.text != nil {
//            scrollView.backgroundColor = .lightGray
            scrollView.backgroundColor = #colorLiteral(red: 0.9462642074, green: 0.9525992274, blue: 0.9730225205, alpha: 1)
            DyslipidemiaManagementNotebookView.DyslipidemiahVIew.backgroundColor = .lightGray
            set.isHidden = true
            goalCancelBTN.isHidden = true
            goalSaveBTN.isHidden = true
            
            DyslipidemiaWebView.isHidden = true
            DyslipidemiaManagementNotebookView.isHidden = false
            DyslipidemiaManagementTest.isHidden = true
            DyslipidemiaManagementNotebookView.DyslipidemiahVIew.isHidden = false
            
            saveView.isHidden = false
            saveData.isHidden = false
        }
    }
    private func setupToolBar() {
        
        let toolBar = UIToolbar()

        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonHandeler))

        toolBar.items = [flexibleSpace, doneButton]
        // 적절한 사이즈로 toolBar의 크기를 만들어 줍니다.
        toolBar.sizeToFit()

        // textField의 경우 클릭 시 키보드 위에 AccessoryView가 표시된다고 합니다.
        // 현재 inputView를 datePicker로 만들어 줬으니 datePicker위에 표시되겠죠?
        changeTf.inputAccessoryView = toolBar
    }
    private func setupDatePicker() {
        // datePickerModed에는 time, date, dateAndTime, countDownTimer가 존재합니다.
        datePicker.datePickerMode = .dateAndTime
        // datePicker 스타일을 설정합니다. wheels, inline, compact, automatic이 존재합니다.
        datePicker.preferredDatePickerStyle = .wheels
        // 원하는 언어로 지역 설정도 가능합니다.
        datePicker.locale = Locale(identifier: "ko-KR")
        // 값이 변할 때마다 동작을 설정해 줌
        self.datePicker.maximumDate = Date()
        datePicker.addTarget(self, action: #selector(dateChange), for: .valueChanged)
        // textField의 inputView가 nil이라면 기본 할당은 키보드입니다.
        changeTf.inputView = datePicker
        // textField에 오늘 날짜로 표시되게 설정
        changeTf.text = dateFormat(date: Date())
    }
    @objc func doneButtonHandeler(_ sender: UIBarButtonItem) {
        changeTf.text = dateFormat(date: datePicker.date)
        // 키보드 내리기
        changeTf.resignFirstResponder()
    }
    // 값이 변할 때 마다 동작
    @objc func dateChange(_ sender: UIDatePicker) {
        // 값이 변하면 UIDatePicker에서 날자를 받아와 형식을 변형해서 textField에 넣어줍니다.
        changeTf.text = dateFormat(date: sender.date)
    }
    
    // 텍스트 필드에 들어갈 텍스트를 DateFormatter 변환
    private func dateFormat(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd a h:mm"
        formatter.amSymbol = "오전"
            formatter.pmSymbol = "오후"
        
        
        
        return formatter.string(from: date)
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField == cholesterolInputView {
            
            guard let textFieldText = cholesterolInputView.text,
                  let rangeOfTextToReplace = Range(range, in: textFieldText) else {
                return false
            }
            let substringToReplace = textFieldText[rangeOfTextToReplace]
            let count = textFieldText.count - substringToReplace.count + string.count
            return count <= 3
        } else if textField == hdlInputView {
            
            guard let textFieldText = hdlInputView.text,
                  let rangeOfTextToReplace = Range(range, in: textFieldText) else {
                return false
            }
            let substringToReplace = textFieldText[rangeOfTextToReplace]
            let count = textFieldText.count - substringToReplace.count + string.count
            return count <= 3
            
        } else if textField == ldlInputView {
            
            guard let textFieldText = ldlInputView.text,
                  let rangeOfTextToReplace = Range(range, in: textFieldText) else {
                return false
            }
            let substringToReplace = textFieldText[rangeOfTextToReplace]
            let count = textFieldText.count - substringToReplace.count + string.count
            return count <= 3
            
        } else if textField == neutralFatInputView {
            
            guard let textFieldText = neutralFatInputView.text,
                  let rangeOfTextToReplace = Range(range, in: textFieldText) else {
                return false
            }
            let substringToReplace = textFieldText[rangeOfTextToReplace]
            let count = textFieldText.count - substringToReplace.count + string.count
            return count <= 3
            
        } else if textField == totalCholesterolGoal {
            
            guard let textFieldText = totalCholesterolGoal.text,
                  let rangeOfTextToReplace = Range(range, in: textFieldText) else {
                return false
            }
            let substringToReplace = textFieldText[rangeOfTextToReplace]
            let count = textFieldText.count - substringToReplace.count + string.count
            return count <= 3
            
        }
        
        return true
    }
    
}
