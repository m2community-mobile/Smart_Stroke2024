//
//  ObesityViewController.swift
//  KSR_2024
//
//  Created by m2comm on 2024/01/18.
//

import Foundation
import UIKit
import ABGaugeViewKit


var bmi1: CGFloat!
var bmi2: CGFloat!


class ObesityViewController: BaseViewController, UITextFieldDelegate {
    
    var ObesityWebView : WebView!
    var ObesityManagementNotebookView : ObesityManagementNotebookView!
    //    var BloodSugarRecordsView : BloodSugarRecordsView!
    var obesityListView : ObesityListView!
    
    var dataArray = [[String:String]]()
    
    var testBtn1: UIButton!
    var testBtn2: UIButton!
    var saveView: UIView!
    var gymKindView: UIView!
    var bmiCheck: UIButton!
    
    var gymSaveData: UILabel!
    var gymSaveView: UIView!
    
    
    
    var showLabel: UILabel!
    
    var cancelBTN: UIButton!
    var saveBTN: UIButton!
    
    var circularProgressBarView: CircularProgressView!
    var circularViewDuration: TimeInterval = 2
    
    var random: CGFloat!
    var perTest: CGFloat!
    //
    
    var heightInputView: UITextField!
    var weightInputView: UITextField!
    var sportsInputView: UITextField!
    var exerciseTime: UITextField!
    
    var UnderBar: UIView!
    var titleName: UILabel!
    
    var graph: UIImageView!
    var graphLabel: UILabel!
    
    var myView: ABGaugeView!
    var imageView: UIImageView!
    
    let datePicker = UIDatePicker()
    var changeTf: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        UnderBar = UIView(frame: CGRect(x: button1.center.x, y: naviBar.frame.maxY + 62, width: SCREEN.WIDTH / 8.8, height: 5))
        //        UnderBar.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        setupKeyboardEvent()
        //        self.view.addSubview(UnderBar)
        hideKeyboardWhenTappedAround()
        //        scrollView.keyboardDismissMode = .interactive
        
        scrollView.keyboardDismissMode = .onDrag
        buttons = [button1, button2, button3]
        
        self.buttons.forEach {
            $0.addTarget(self, action: #selector(segButtonPressed(_ :)), for: .touchUpInside)
        }
        
        titleName = UILabel()
        //        titleName.text = titleLabel
        
        
        titleName.text = "비만관리 및 운동"
        titleName.textColor = .white
        titleName.font = UIFont(name: "SUITE-Regular", size: 20)
        
        naviBar.addSubview(titleName)
        
        
        titleName.translatesAutoresizingMaskIntoConstraints = false
        
        titleName.centerXAnchor.constraint(equalTo: naviBar.centerXAnchor).isActive = true
        titleName.centerYAnchor.constraint(equalTo: naviBar.centerYAnchor).isActive = true
        titleName.textAlignment = .center
        
        label1.text = "비만 관리\n도움말"
        label1.font = UIFont(name: "SUITE-Regular", size: 14)
        label2.text = "비만\n관리수첩"
        label1.font = UIFont(name: "SUITE-Regular", size: 14)
        label3.text = "비만 관리\n기록보기"
        label1.font = UIFont(name: "SUITE-Regular", size: 14)
        
        label1.textColor = .black
        label2.textColor = .lightGray
        label3.textColor = .lightGray
        
        self.ObesityWebView = WebView(frame: CGRect(
            x: 0,
            y: menuView.frame.maxY,
            width: SCREEN.WIDTH,
            height: SCREEN.HEIGHT - menuView.frame.maxY), urlString: "http://ksrapp.m2comm.co.kr/php/info/info02_8a.php")
        
        ObesityManagementNotebookView = Smart_Stroke2024.ObesityManagementNotebookView(frame: CGRect(x: 0, y: scrollView.frame.minY, width: SCREEN.WIDTH, height: scrollView.frame.height))
        ObesityManagementNotebookView.backgroundColor = .white
        scrollView.addSubview(ObesityManagementNotebookView)
        
        self.view.addSubview(self.ObesityWebView)
        
        
        
        ObesityManagementNotebookView.bmiGraphVIew = UIView(frame: CGRect(x: 0, y: scrollView.frame.minY, width: self.view.frame.size.width, height: self.view.frame.size.height / 3.6))
        //        ObesityManagementNotebookView.bmiGraphVIew.backgroundColor = #colorLiteral(red: 0.2467908859, green: 0.3821293116, blue: 0.5973587036, alpha: 1)
        
        ObesityManagementNotebookView.bmiGraphVIew.setGradient2(color1: UIColor(red: 63 / 255, green: 85 / 255.0, blue: 152 / 255.0, alpha: 1), color2: UIColor(red: 62 / 255.0, green: 104 / 255.0, blue: 152 / 255.0, alpha: 1))
        //        BloodSugarManagementNotebookView.FastingBloodSugar.layer.borderWidth = 1
        //        ObesityManagementNotebookView.bmiGraphVIew.layer.cornerRadius = 8
        scrollView.addSubview(ObesityManagementNotebookView.bmiGraphVIew)
        
        
        let strokeUnderBar = UIView(frame: CGRect(x: 0, y: ObesityManagementNotebookView.bmiGraphVIew.frame.minY + 20, width: 1, height: ObesityManagementNotebookView.bmiGraphVIew.frame.size.height - 40))
        strokeUnderBar.backgroundColor =  #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1).withAlphaComponent(0.8)
        strokeUnderBar.center.x = ObesityManagementNotebookView.bmiGraphVIew.frame.size.width / 2
        ObesityManagementNotebookView.bmiGraphVIew.addSubview(strokeUnderBar)
        
        self.obesityListView = ObesityListView(frame: CGRect(
            x: 0,
            y: menuView.frame.maxY,
            width: SCREEN.WIDTH,
            height: SCREEN.HEIGHT))
        obesityListView.backgroundColor = .white
        self.view.addSubview(self.obesityListView)
        
        
        obesityListView.backgroundColor = #colorLiteral(red: 0.9450935721, green: 0.9524920583, blue: 0.9736705422, alpha: 1)
        if IS_IPHONE_X {
            testBtn1 = UIButton(frame: CGRect(x: SCREEN.WIDTH / 2.4, y: 20, width: 100, height: 50))
        } else if IS_IPHONE_N{
            testBtn1 = UIButton(frame: CGRect(x: SCREEN.WIDTH / 2.6, y: 20, width: 100, height: 50))
        } else {
            testBtn1 = UIButton(frame: CGRect(x: SCREEN.WIDTH / 2.2, y: 20, width: 100, height: 50))
        }
        testBtn1.setTitle("리스트보기", for: .normal)
        testBtn1.setTitleColor(.white, for: .normal)
        testBtn1.backgroundColor = #colorLiteral(red: 0, green: 0.5898328424, blue: 0.8106423616, alpha: 1)
        
        testBtn1.layer.cornerRadius = 8
        obesityListView.addSubview(testBtn1)
        testBtn1.addTarget(self, action: #selector(rightButton2PressedList(_ :)), for: .touchUpInside)
        
        
        testBtn2 = UIButton(frame: CGRect(x: testBtn1.frame.maxX + 5, y: 20, width: 100, height: 50))
        testBtn2.setTitle("그래프보기", for: .normal)
        testBtn2.setTitleColor(#colorLiteral(red: 0.1406538188, green: 0.347869575, blue: 0.5851272941, alpha: 1), for: .normal)
        testBtn2.layer.borderWidth = 1
        testBtn2.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        testBtn2.layer.borderColor = #colorLiteral(red: 0.6836393476, green: 0.7600957155, blue: 0.8458803296, alpha: 1).cgColor
        testBtn2.layer.cornerRadius = 8
        obesityListView.addSubview(testBtn2)
        testBtn2.addTarget(self, action: #selector(rightButton2PressedGraph(_ :)), for: .touchUpInside)
        
        
        
        
        
        //        var bmiGraphVIewLabel: UILabel!
        //        var bmiGraphVIewShowLabel: UILabel!
        //        var bmiGraphVIewShowNumLabel: UILabel!
        //        var bmiGraphVIewGraph: UIView!
        
        ObesityManagementNotebookView.bmiGraphVIewLabel = UILabel(frame: CGRect(x: 59, y: ObesityManagementNotebookView.bmiGraphVIew.frame.minY + 22, width: 130, height: ObesityManagementNotebookView.bmiGraphVIew.frame.size.height / 4))
        ObesityManagementNotebookView.bmiGraphVIewLabel.text = "   나의 BMI\n목표 수치는?"
        
        if IS_IPHONE_12PRO_MAX {
            ObesityManagementNotebookView.bmiGraphVIewLabel.font = UIFont(name: "SUITE-Regular", size: 20)
        } else if IS_IPHONE_15PRO_MAX {
            ObesityManagementNotebookView.bmiGraphVIewLabel.font = UIFont(name: "SUITE-Regular", size: 20)
        } else if IS_IPHONE_N_PLUS {
            ObesityManagementNotebookView.bmiGraphVIewLabel.font = UIFont(name: "SUITE-Regular", size: 17)
        } else if IS_IPHONE_X {
            ObesityManagementNotebookView.bmiGraphVIewLabel.font = UIFont(name: "SUITE-Regular", size: 15)
        } else {
            ObesityManagementNotebookView.bmiGraphVIewLabel.font = UIFont(name: "SUITE-Regular", size: 17)
        }
        
        ObesityManagementNotebookView.bmiGraphVIewLabel.numberOfLines = 0
        ObesityManagementNotebookView.bmiGraphVIewLabel.textColor = .white
        
        
        ObesityManagementNotebookView.bmiGraphVIew.addSubview(ObesityManagementNotebookView.bmiGraphVIewLabel)
        
        
        
        ObesityManagementNotebookView.bmiGraphVIewShowLabel = UILabel(frame: CGRect(x: 32, y: ObesityManagementNotebookView.bmiGraphVIewLabel.frame.maxY + 10, width: self.view.frame.size.width / 2, height: ObesityManagementNotebookView.bmiGraphVIew.frame.size.height / 2))
        ObesityManagementNotebookView.bmiGraphVIewShowLabel.text = "18.5~23"
        ObesityManagementNotebookView.bmiGraphVIewShowLabel.textColor = .white
        
        
        if IS_IPHONE_12PRO_MAX {
            ObesityManagementNotebookView.bmiGraphVIewShowLabel.font = UIFont(name: "SUITE-Heavy", size: 37)
        } else if IS_IPHONE_15PRO_MAX {
            ObesityManagementNotebookView.bmiGraphVIewShowLabel.font = UIFont(name: "SUITE-Heavy", size: 37)
        } else if IS_IPHONE_N_PLUS {
            ObesityManagementNotebookView.bmiGraphVIewShowLabel.font = UIFont(name: "SUITE-Heavy", size: 35)
        } else if IS_IPHONE_X {
            ObesityManagementNotebookView.bmiGraphVIewShowLabel.font = UIFont(name: "SUITE-Heavy", size: 32)
        } else {
            ObesityManagementNotebookView.bmiGraphVIewShowLabel.font = UIFont(name: "SUITE-Heavy", size: 35)
        }
        
        
        
        ObesityManagementNotebookView.bmiGraphVIew.addSubview(ObesityManagementNotebookView.bmiGraphVIewShowLabel)
        
        
        
        
        
        
        
        ///////////
        
        
        
        
        if IS_IPHONE_X {
            ObesityManagementNotebookView.bmiGraphVIewShowNumLabel = UILabel(frame: CGRect(x: ObesityManagementNotebookView.bmiGraphVIew.frame.maxX - 120, y: ObesityManagementNotebookView.bmiGraphVIew.frame.minY + 20, width: self.view.frame.size.width / 2.5, height: ObesityManagementNotebookView.bmiGraphVIew.frame.size.height / 4))
            ObesityManagementNotebookView.bmiGraphVIewShowNumLabel.text = "목표 수치\n달성율은?"
        } else if IS_IPHONE_MINI {
            ObesityManagementNotebookView.bmiGraphVIewShowNumLabel = UILabel(frame: CGRect(x: ObesityManagementNotebookView.bmiGraphVIew.frame.maxX - 120, y: ObesityManagementNotebookView.bmiGraphVIew.frame.minY + 20, width: self.view.frame.size.width / 2.5, height: ObesityManagementNotebookView.bmiGraphVIew.frame.size.height / 4))
            ObesityManagementNotebookView.bmiGraphVIewShowNumLabel.text = "목표 수치\n달성율은?"
        } else if IS_IPHONE_N {
            ObesityManagementNotebookView.bmiGraphVIewShowNumLabel = UILabel(frame: CGRect(x: ObesityManagementNotebookView.bmiGraphVIew.frame.maxX - 120, y: ObesityManagementNotebookView.bmiGraphVIew.frame.minY + 20, width: self.view.frame.size.width / 2.5, height: ObesityManagementNotebookView.bmiGraphVIew.frame.size.height / 4))
            ObesityManagementNotebookView.bmiGraphVIewShowNumLabel.text = "목표 수치\n달성율은?"
        } else if IS_IPHONE_N_PLUS {
            ObesityManagementNotebookView.bmiGraphVIewShowNumLabel = UILabel(frame: CGRect(x: ObesityManagementNotebookView.bmiGraphVIew.frame.maxX - 130, y: ObesityManagementNotebookView.bmiGraphVIew.frame.minY + 20, width: self.view.frame.size.width / 2.5, height: ObesityManagementNotebookView.bmiGraphVIew.frame.size.height / 4))
            ObesityManagementNotebookView.bmiGraphVIewShowNumLabel.text = "목표 수치\n달성율은?"
        }else if IS_IPHONE_12PRO {
            ObesityManagementNotebookView.bmiGraphVIewShowNumLabel = UILabel(frame: CGRect(x: ObesityManagementNotebookView.bmiGraphVIew.frame.maxX - 125, y: ObesityManagementNotebookView.bmiGraphVIew.frame.minY + 20, width: self.view.frame.size.width / 2.5, height: ObesityManagementNotebookView.bmiGraphVIew.frame.size.height / 4))
            ObesityManagementNotebookView.bmiGraphVIewShowNumLabel.text = "목표 수치\n달성율은?"
        } else if IS_IPHONE_15PRO {
            ObesityManagementNotebookView.bmiGraphVIewShowNumLabel = UILabel(frame: CGRect(x: ObesityManagementNotebookView.bmiGraphVIew.frame.maxX - 125, y: ObesityManagementNotebookView.bmiGraphVIew.frame.minY + 20, width: self.view.frame.size.width / 2.5, height: ObesityManagementNotebookView.bmiGraphVIew.frame.size.height / 4))
            ObesityManagementNotebookView.bmiGraphVIewShowNumLabel.text = "목표 수치\n달성율은?"
        } else {
            ObesityManagementNotebookView.bmiGraphVIewShowNumLabel = UILabel(frame: CGRect(x: ObesityManagementNotebookView.bmiGraphVIew.frame.maxX - 150, y: ObesityManagementNotebookView.bmiGraphVIew.frame.minY + 20, width: self.view.frame.size.width / 2.5, height: ObesityManagementNotebookView.bmiGraphVIew.frame.size.height / 4))
            ObesityManagementNotebookView.bmiGraphVIewShowNumLabel.text = "목표 수치\n달성율은?"
        }
        
        
        if IS_IPHONE_12PRO_MAX {
            ObesityManagementNotebookView.bmiGraphVIewShowNumLabel.font = UIFont(name: "SUITE-Regular", size: 20)
        } else if IS_IPHONE_15PRO_MAX {
            ObesityManagementNotebookView.bmiGraphVIewShowNumLabel.font = UIFont(name: "SUITE-Regular", size: 20)
        } else if IS_IPHONE_N_PLUS {
            ObesityManagementNotebookView.bmiGraphVIewShowNumLabel.font = UIFont(name: "SUITE-Regular", size: 17)
        } else if IS_IPHONE_X {
            ObesityManagementNotebookView.bmiGraphVIewShowNumLabel.font = UIFont(name: "SUITE-Regular", size: 16)
        } else {
            ObesityManagementNotebookView.bmiGraphVIewShowNumLabel.font = UIFont(name: "SUITE-Regular", size: 17)
        }
        
        ObesityManagementNotebookView.bmiGraphVIewShowNumLabel.textColor = .white
        ObesityManagementNotebookView.bmiGraphVIewShowNumLabel.numberOfLines = 0
        
        
        
        ObesityManagementNotebookView.bmiGraphVIew.addSubview(ObesityManagementNotebookView.bmiGraphVIewShowNumLabel)
        
        
        
        
        ObesityManagementNotebookView.bmiGraphVIewGraph = UIView(frame: CGRect(x: ObesityManagementNotebookView.bmiGraphVIewLabel.frame.maxX + 55, y: ObesityManagementNotebookView.bmiGraphVIewShowNumLabel.frame.maxY + 30, width: self.view.frame.size.width / 3.5, height: ObesityManagementNotebookView.bmiGraphVIew.frame.size.height / 2))
        ObesityManagementNotebookView.bmiGraphVIewGraph.backgroundColor = .clear
        if IS_IPHONE_N_PLUS {
            ObesityManagementNotebookView.bmiGraphVIewGraph = UIView(frame: CGRect(x: ObesityManagementNotebookView.bmiGraphVIewLabel.frame.maxX + 70, y: ObesityManagementNotebookView.bmiGraphVIewShowNumLabel.frame.maxY + 10, width: self.view.frame.size.width / 3.5, height: ObesityManagementNotebookView.bmiGraphVIew.frame.size.height / 2))
        }
        if IS_IPHONE_X {
            ObesityManagementNotebookView.bmiGraphVIewGraph = UIView(frame: CGRect(x: ObesityManagementNotebookView.bmiGraphVIewLabel.frame.maxX + 50, y: ObesityManagementNotebookView.bmiGraphVIewShowNumLabel.frame.maxY + 12, width: self.view.frame.size.width / 3.5, height: ObesityManagementNotebookView.bmiGraphVIew.frame.size.height / 2))
        }
        if IS_IPHONE_12PRO {
            ObesityManagementNotebookView.bmiGraphVIewGraph = UIView(frame: CGRect(x: ObesityManagementNotebookView.bmiGraphVIewLabel.frame.maxX + 75, y: ObesityManagementNotebookView.bmiGraphVIewShowNumLabel.frame.maxY + 10, width: self.view.frame.size.width / 3.5, height: ObesityManagementNotebookView.bmiGraphVIew.frame.size.height / 2))
        }
        if IS_IPHONE_15PRO {
            ObesityManagementNotebookView.bmiGraphVIewGraph = UIView(frame: CGRect(x: ObesityManagementNotebookView.bmiGraphVIewLabel.frame.maxX + 75, y: ObesityManagementNotebookView.bmiGraphVIewShowNumLabel.frame.maxY + 10, width: self.view.frame.size.width / 3.5, height: ObesityManagementNotebookView.bmiGraphVIew.frame.size.height / 2))
        }
        if IS_IPHONE_N {
            ObesityManagementNotebookView.bmiGraphVIewGraph = UIView(frame: CGRect(x: ObesityManagementNotebookView.bmiGraphVIewLabel.frame.maxX + 77, y: ObesityManagementNotebookView.bmiGraphVIewShowNumLabel.frame.maxY + 25, width: self.view.frame.size.width / 3.5, height: ObesityManagementNotebookView.bmiGraphVIew.frame.size.height / 2))
        }
        if IS_IPHONE_MINI {
            ObesityManagementNotebookView.bmiGraphVIewGraph = UIView(frame: CGRect(x: ObesityManagementNotebookView.bmiGraphVIewLabel.frame.maxX + 67, y: ObesityManagementNotebookView.bmiGraphVIewShowNumLabel.frame.maxY + 25, width: self.view.frame.size.width / 3.5, height: ObesityManagementNotebookView.bmiGraphVIew.frame.size.height / 2))
        }
        
        ObesityManagementNotebookView.bmiGraphVIew.addSubview(ObesityManagementNotebookView.bmiGraphVIewGraph)
        ////////////
        
        //
        random = CGFloat(arc4random_uniform(UInt32(101))) //between 0 and n-1
        
        self.view.backgroundColor = .white
        // Do any additional setup after loading the view.
        showLabel = UILabel(frame: CGRect(x: 34, y: 29, width: 42, height: 30))
        var changeShowLabel = UserDefaults.standard.object(forKey: "persentB")
        print(changeShowLabel, "여기의 값은?")
        
        showLabel.font = UIFont(name: "SUITE-Heavy", size: 11)
        showLabel.textColor = .white
        showLabel.textAlignment = .center
        //        showLabel.text = "\(changeShowLabel ?? 00)%"
        showLabel.text = "\(changeShowLabel ?? 0)%"
        if IS_IPHONE_12PRO_MAX {
            showLabel = UILabel(frame: CGRect(x: 42, y: 30, width: 42, height: 30))
            //                    showLabel.layer.borderWidth = 1
            //            var changeShowLabel = Int(random)
            showLabel.textAlignment = .center
            //            showLabel.font = UIFont(name: "SUITE-Heavy", size: 16)
            //            showLabel.textColor = .white
            //            showLabel.text = "\(changeShowLabel ?? 00)%"
            var changeShowLabel = UserDefaults.standard.object(forKey: "persentB")
            print(changeShowLabel, "여기의 값은?")
            
            showLabel.font = UIFont(name: "SUITE-Heavy", size: 13)
            showLabel.textColor = .white
            showLabel.text = "\(changeShowLabel ?? 0)%"
        }
        if IS_IPHONE_15PRO_MAX {
            showLabel = UILabel(frame: CGRect(x: 42, y: 30, width: 42, height: 30))
            //                    showLabel.layer.borderWidth = 1
            //            var changeShowLabel = Int(random)
            showLabel.textAlignment = .center
            //            showLabel.font = UIFont(name: "SUITE-Heavy", size: 16)
            //            showLabel.textColor = .white
            //            showLabel.text = "\(changeShowLabel ?? 00)%"
            var changeShowLabel = UserDefaults.standard.object(forKey: "persentB")
            print(changeShowLabel, "여기의 값은?")
            
            showLabel.font = UIFont(name: "SUITE-Heavy", size: 13)
            showLabel.textColor = .white
            showLabel.text = "\(changeShowLabel ?? 0)%"
        }
        if IS_IPHONE_X {
            showLabel = UILabel(frame: CGRect(x: 18, y: 30, width: 45, height: 30))
            var changeShowLabel = UserDefaults.standard.object(forKey: "persentB")
            print(changeShowLabel, "여기의 값은?")
            showLabel.textAlignment = .center
            //            showLabel.layer.borderWidth = 1
            showLabel.font = UIFont(name: "SUITE-Heavy", size: 14)
            showLabel.textColor = .white
            showLabel.text = "\(changeShowLabel ?? 0)%"
        }
        
        if IS_IPHONE_N_PLUS {
            showLabel = UILabel(frame: CGRect(x: 25, y: 29, width: 50, height: 30))
            var changeShowLabel = UserDefaults.standard.object(forKey: "persentB")
            print(changeShowLabel, "여기의 값은?")
            
            showLabel.font = UIFont(name: "SUITE-Heavy", size: 11)
            showLabel.textColor = .white
            showLabel.text = "\(changeShowLabel ?? 0)%"
            //            showLabel.layer.borderWidth = 1
            showLabel.textAlignment = .center
        }
        if IS_IPHONE_N {
            showLabel = UILabel(frame: CGRect(x: 3, y: 20, width: 54, height: 30))
            //            showLabel.layer.borderWidth = 1
            var changeShowLabel = UserDefaults.standard.object(forKey: "persentB")
            print(changeShowLabel, "여기의 값은?")
            showLabel.textAlignment = .center
            showLabel.font = UIFont(name: "SUITE-Heavy", size: 11)
            showLabel.textColor = .white
            showLabel.text = "\(changeShowLabel ?? 0)%"
        }
        if IS_IPHONE_12PRO {
            showLabel = UILabel(frame: CGRect(x: 11, y: 28, width: 54, height: 30))
            //            showLabel.layer.borderWidth = 1
            var changeShowLabel = UserDefaults.standard.object(forKey: "persentB")
            print(changeShowLabel, "여기의 값은?")
            showLabel.textAlignment = .center
            showLabel.font = UIFont(name: "SUITE-Heavy", size: 11)
            showLabel.textColor = .white
            showLabel.text = "\(changeShowLabel ?? 0)%"
        }
        if IS_IPHONE_15PRO {
            showLabel = UILabel(frame: CGRect(x: 11, y: 28, width: 54, height: 30))
            //            showLabel.layer.borderWidth = 1
            var changeShowLabel = UserDefaults.standard.object(forKey: "persentB")
            print(changeShowLabel, "여기의 값은?")
            showLabel.textAlignment = .center
            showLabel.font = UIFont(name: "SUITE-Heavy", size: 11)
            showLabel.textColor = .white
            showLabel.text = "\(changeShowLabel ?? 0)%"
        }
        
        
        //        let ProgressView = CircularProgressView(frame: CGRect(x: 8, y: 5, width: 80, height: 80), lineWidth: 10, rounded: false)
        //
        //        ProgressView.progressColor = .white
        //
        //        ProgressView.trackColor = .white.withAlphaComponent(0.5)
        //
        //        //        ProgressView.center = ProgressView.center
        //
        //        //        self.view.addSubview(ProgressView)
        //        ObesityManagementNotebookView.bmiGraphVIewGraph.addSubview(ProgressView)
        //
        //
        //        ProgressView.addSubview(showLabel)
        //
        //        if UserDefaults.standard.object(forKey: "perGraphB") == nil {
        //            perTest = 00
        //        } else {
        //            perTest = UserDefaults.standard.object(forKey: "perGraphB") as! CGFloat * 0.01
        //        }
        //        ProgressView.progress = perTest
        
        if IS_IPHONE_12PRO_MAX {
            let ProgressView = CircularProgressView(frame: CGRect(x: 15, y: -2, width: 95, height: 95), lineWidth: 10, rounded: false)
            
            ProgressView.progressColor = .white
            
            ProgressView.trackColor = .white.withAlphaComponent(0.5)
            
            //        ProgressView.center = ProgressView.center
            
            //        self.view.addSubview(ProgressView)
            ObesityManagementNotebookView.bmiGraphVIewGraph.addSubview(ProgressView)
            
            
            ProgressView.addSubview(showLabel)
            
            if UserDefaults.standard.object(forKey: "perGraphB") == nil {
                perTest = 00
                showLabel.textAlignment = .center
            } else {
                perTest = UserDefaults.standard.object(forKey: "perGraphB") as! CGFloat * 0.01
            }
            ProgressView.progress = perTest
            
            //            ProgressView.progress = random * 0.01
        }
        if IS_IPHONE_15PRO_MAX {
            let ProgressView = CircularProgressView(frame: CGRect(x: 15, y: -2, width: 95, height: 95), lineWidth: 10, rounded: false)
            
            ProgressView.progressColor = .white
            
            ProgressView.trackColor = .white.withAlphaComponent(0.5)
            
            //        ProgressView.center = ProgressView.center
            
            //        self.view.addSubview(ProgressView)
            ObesityManagementNotebookView.bmiGraphVIewGraph.addSubview(ProgressView)
            
            
            ProgressView.addSubview(showLabel)
            
            if UserDefaults.standard.object(forKey: "perGraphB") == nil {
                perTest = 00
                showLabel.textAlignment = .center
            } else {
                perTest = UserDefaults.standard.object(forKey: "perGraphB") as! CGFloat * 0.01
            }
            ProgressView.progress = perTest
            
            //            ProgressView.progress = random * 0.01
        }
        if IS_IPHONE_X {
            let ProgressView = CircularProgressView(frame: CGRect(x: -3, y: 5, width: 85, height: 85), lineWidth: 10, rounded: false)
            
            ProgressView.progressColor = .white
            
            ProgressView.trackColor = .white.withAlphaComponent(0.5)
            
            //        ProgressView.center = ProgressView.center
            
            //        self.view.addSubview(ProgressView)
            ObesityManagementNotebookView.bmiGraphVIewGraph.addSubview(ProgressView)
            
            
            ProgressView.addSubview(showLabel)
            
            if UserDefaults.standard.object(forKey: "perGraphB") == nil {
                perTest = 00
                showLabel.textAlignment = .center
            } else {
                perTest = UserDefaults.standard.object(forKey: "perGraphB") as! CGFloat * 0.01
            }
            ProgressView.progress = perTest
        }
        //
        if IS_IPHONE_N_PLUS {
            let ProgressView = CircularProgressView(frame: CGRect(x: 8, y: 5, width: 80, height: 80), lineWidth: 10, rounded: false)
            
            ProgressView.progressColor = .white
            
            ProgressView.trackColor = .white.withAlphaComponent(0.5)
            
            //        ProgressView.center = ProgressView.center
            
            //        self.view.addSubview(ProgressView)
            ObesityManagementNotebookView.bmiGraphVIewGraph.addSubview(ProgressView)
            
            
            ProgressView.addSubview(showLabel)
            
            if UserDefaults.standard.object(forKey: "perGraphB") == nil {
                perTest = 00
                showLabel.textAlignment = .center
            } else {
                perTest = UserDefaults.standard.object(forKey: "perGraphB") as! CGFloat * 0.01
            }
            ProgressView.progress = perTest
        }
        if IS_IPHONE_N {
            let ProgressView = CircularProgressView(frame: CGRect(x: -10, y: -4, width: 80, height: 80), lineWidth: 10, rounded: false)
            
            ProgressView.progressColor = .white
            
            ProgressView.trackColor = .white.withAlphaComponent(0.5)
            
            //        ProgressView.center = ProgressView.center
            
            //        self.view.addSubview(ProgressView)
            ObesityManagementNotebookView.bmiGraphVIewGraph.addSubview(ProgressView)
            
            
            ProgressView.addSubview(showLabel)
            
            if UserDefaults.standard.object(forKey: "perGraphB") == nil {
                perTest = 00
                showLabel.textAlignment = .center
            } else {
                perTest = UserDefaults.standard.object(forKey: "perGraphB") as! CGFloat * 0.01
            }
            ProgressView.progress = perTest
        }
        //
        if IS_IPHONE_12PRO {
            let ProgressView = CircularProgressView(frame: CGRect(x: -3, y: 5, width: 80, height: 80), lineWidth: 10, rounded: false)
            
            ProgressView.progressColor = .white
            
            ProgressView.trackColor = .white.withAlphaComponent(0.5)
            
            //        ProgressView.center = ProgressView.center
            
            //        self.view.addSubview(ProgressView)
            ObesityManagementNotebookView.bmiGraphVIewGraph.addSubview(ProgressView)
            
            
            ProgressView.addSubview(showLabel)
            
            if UserDefaults.standard.object(forKey: "perGraphB") == nil {
                perTest = 00
                showLabel.textAlignment = .center
            } else {
                perTest = UserDefaults.standard.object(forKey: "perGraphB") as! CGFloat * 0.01
            }
            ProgressView.progress = perTest
        }
        if IS_IPHONE_15PRO {
            let ProgressView = CircularProgressView(frame: CGRect(x: -3, y: 5, width: 80, height: 80), lineWidth: 10, rounded: false)
            
            ProgressView.progressColor = .white
            
            ProgressView.trackColor = .white.withAlphaComponent(0.5)
            
            //        ProgressView.center = ProgressView.center
            
            //        self.view.addSubview(ProgressView)
            ObesityManagementNotebookView.bmiGraphVIewGraph.addSubview(ProgressView)
            
            
            ProgressView.addSubview(showLabel)
            
            if UserDefaults.standard.object(forKey: "perGraphB") == nil {
                perTest = 00
                showLabel.textAlignment = .center
            } else {
                perTest = UserDefaults.standard.object(forKey: "perGraphB") as! CGFloat * 0.01
            }
            ProgressView.progress = perTest
        }
        
        
        var saveData = UILabel(frame: CGRect(x: 20, y: ObesityManagementNotebookView.bmiGraphVIewGraph.frame.maxY + 8, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 12))
        saveData.text = "키와 체중을 입력해주세요."
        //        saveData.font = UIFont.systemFont(ofSize: 18)
        saveData.font = UIFont(name: "SUITE-Regular", size: 18)
        
        scrollView.addSubview(saveData)
        
        //        var saveView: UIView!
        
        //        var afterBTN: UIButton!
        //        var beforeBTN: UIButton!
        //        var bloodTF: UITextField!
        //        var glycated: UITextField!
        
        //        saveView = UIView(frame: CGRect(x: 20, y: saveData.frame.maxY + 2, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 3))
        saveView = UIView(frame: CGRect(x: 20, y: saveData.frame.maxY + 2, width: self.view.frame.size.width - 40, height: 550))
        if IS_IPHONE_N {
            saveView = UIView(frame: CGRect(x: 20, y: saveData.frame.maxY + 2, width: self.view.frame.size.width - 40, height: 450))
        }
        if IS_IPHONE_MINI {
            saveView = UIView(frame: CGRect(x: 20, y: saveData.frame.maxY + 2, width: self.view.frame.size.width - 40, height: 470))
        }
        
        if IS_IPHONE_N_PLUS {
            saveView = UIView(frame: CGRect(x: 20, y: saveData.frame.maxY + 2, width: self.view.frame.size.width - 40, height: 500))
        }
        //        if IS_IPHONE_X {
        //            saveView = UIView(frame: CGRect(x: 20, y: saveData.frame.maxY + 2, width: self.view.frame.size.width - 40, height: 450))
        //        }
        
        if IS_IPHONE_12PRO {
            saveView = UIView(frame: CGRect(x: 20, y: saveData.frame.maxY + 2, width: self.view.frame.size.width - 40, height: 500))
        }
        if IS_IPHONE_15PRO {
            saveView = UIView(frame: CGRect(x: 20, y: saveData.frame.maxY + 2, width: self.view.frame.size.width - 40, height: 500))
        }
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
        
        ObesityManagementNotebookView.dateLable = UILabel(frame: CGRect(x: dateViewLabel.frame.maxX, y: dateViewLabel.frame.minY, width: dateView.frame.size.width - 20 - dateViewLabel.frame.width, height: dateView.frame.height))
        ObesityManagementNotebookView.dateLable.text = formattedDateInString
        
        ObesityManagementNotebookView.dateLable.text = formattedDateInString
        ObesityManagementNotebookView.dateLable.textAlignment = .right
        ObesityManagementNotebookView.dateLable.layer.addBorder([.bottom], color: .lightGray, width: 1)
        
        //            dateView.addSubview(ObesityManagementNotebookView.dateLable)
        
        
        
        
        var myHeightLabelView = UIView(frame: CGRect(x: 10, y: dateView.frame.maxY, width: saveView.frame.size.width - 20, height: self.view.frame.size.height / 14))
        myHeightLabelView.backgroundColor = .white
        
        saveView.addSubview(myHeightLabelView)
        
        var myHeightLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 80, height: dateView.frame.height))
        myHeightLabel.text = "키"
        
        myHeightLabel.font = UIFont(name: "SUITE-Regular", size: 17)
        myHeightLabel.layer.addBorder([.bottom], color: .lightGray, width: 1)
        myHeightLabelView.addSubview(myHeightLabel)
        
        heightInputView = UITextField(frame: CGRect(x: myHeightLabel.frame.maxX, y: 0, width: dateView.frame.size.width - 20 - myHeightLabel.frame.width, height: myHeightLabel.frame.height))
        heightInputView.placeholder = "키를 입력해 주세요."
        heightInputView.keyboardType = .numberPad
        heightInputView.textAlignment = .right
        heightInputView.font = UIFont(name: "SUITE-Regular", size: 17)
        heightInputView.layer.addBorder([.bottom], color: .lightGray, width: 1)
        heightInputView.delegate = self
        myHeightLabelView.addSubview(heightInputView)
        
        var myWeightView = UIView(frame: CGRect(x: 10, y: myHeightLabelView.frame.maxY, width: saveView.frame.size.width - 20, height: self.view.frame.size.height / 14))
        myWeightView.backgroundColor = .white
        
        saveView.addSubview(myWeightView)
        
        var myWeightLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 80, height: dateView.frame.height))
        myWeightLabel.text = "체중"
        
        myWeightLabel.font = UIFont(name: "SUITE-Regular", size: 17)
        //        myWeightLabel.layer.addBorder([.bottom], color: .lightGray, width: 1)
        myWeightView.addSubview(myWeightLabel)
        
        weightInputView = UITextField(frame: CGRect(x: myWeightLabel.frame.maxX, y: 0, width: dateView.frame.size.width - 20 - myWeightLabel.frame.width, height: myWeightLabel.frame.height))
        weightInputView.placeholder = "체중을 입력해 주세요."
        weightInputView.keyboardType = .numberPad
        weightInputView.textAlignment = .right
        weightInputView.font = UIFont(name: "SUITE-Regular", size: 17)
        weightInputView.delegate = self
        //        weightInputView.layer.addBorder([.bottom], color: .lightGray, width: 1)
        myWeightView.addSubview(weightInputView)
        
        var gyView = UIView(frame: CGRect(x: 10, y: myWeightView.frame.maxY, width: saveView.frame.size.width - 20, height: self.view.frame.size.height / 14))
        gyView.backgroundColor = .white
        
        saveView.addSubview(gyView)
        
        bmiCheck = UIButton(frame: CGRect(x: 20, y: myWeightView.frame.maxY + 5,  width: saveView.frame.size.width - 40, height: self.view.frame.size.height / 19))
        bmiCheck.setTitle("  나의 BMI확인하기", for: .normal)
        
        bmiCheck.layer.borderColor = UIColor(red: 36/255.0, green: 89/255.0, blue: 149/255.0, alpha: 1.0).cgColor
        //        bmiCheck.setImage(UIImage(named: "bmi"), for: .normal)
        
        var penBtnImageView = UIImageView(frame: CGRect(x: 75, y: 10, width: 18, height: 18))
        if IS_IPHONE_12PRO {
            penBtnImageView = UIImageView(frame: CGRect(x: 70, y: 12, width: 20, height: 20))
        } else if IS_IPHONE_15PRO {
            penBtnImageView = UIImageView(frame: CGRect(x: 70, y: 12, width: 20, height: 20))
        } else if IS_IPHONE_N_PLUS {
            penBtnImageView = UIImageView(frame: CGRect(x: 76, y: 10, width: 18, height: 18))
        } else if IS_IPHONE_N {
            penBtnImageView = UIImageView(frame: CGRect(x: 65, y: 9, width: 18, height: 18))
        } else if IS_IPHONE_12PRO_MAX {
            penBtnImageView = UIImageView(frame: CGRect(x: 80, y: 13, width: 20, height: 20))
        } else if IS_IPHONE_15PRO_MAX {
            penBtnImageView = UIImageView(frame: CGRect(x: 80, y: 13, width: 20, height: 20))
        }
        let penBtnImage = UIImage(named: "bmi")
        penBtnImageView.image = penBtnImage
        
        bmiCheck.addSubview(penBtnImageView)
        
        bmiCheck.imageEdgeInsets = UIEdgeInsets(top: 10, left: -3, bottom: 10, right: 4)
        bmiCheck.addTarget(self, action: #selector(showBMI(_ :)), for: .touchUpInside)
        bmiCheck.setTitleColor(.black, for: .normal)
        bmiCheck.layer.borderWidth = 1
        bmiCheck.layer.cornerRadius = 8
        
        saveView.addSubview(bmiCheck)
        
        
        graphLabel = UILabel(frame: CGRect(x: 20, y: bmiCheck.frame.maxY + 5, width: SCREEN.WIDTH - 80, height: 50))
        //        graphLabel.text = "BMI (체질량지수) 는\n 00으로 00입니다."
        graphLabel.text = "BMI (체질량지수) 는\n \(UserDefaults.standard.integer(forKey: "needle"))으로 00입니다."
        
        
        graphLabel.numberOfLines = 0
        graphLabel.textAlignment = .center
        graphLabel.font = UIFont(name: "SUITE-Regular", size: 15)
        graphLabel.textColor = .black
        graphLabel.isHidden = true
        
        let fontSize = UIFont(name: "SUITE-Regular", size: 16)
        let attributedStr = NSMutableAttributedString(string:graphLabel.text!)
        attributedStr.addAttribute(.font, value: fontSize, range: (graphLabel.text as! NSString).range(of: "입니다"))
        
        
        graphLabel.attributedText = attributedStr
        saveView.addSubview(graphLabel)
        
        
        
        //        graphLabel = UILabel(frame: CGRect(x: 20, y: bmiCheck.frame.maxY + 20, width: SCREEN.WIDTH - 80, height: 37))
        //        graphLabel.text = "BMI (체질량지수) 는\n 22.1으로 정상입니다."
        //        graphLabel.numberOfLines = 0
        ////        graphLabel.layer.borderWidth = 1
        //        graphLabel.textAlignment = .center
        //        graphLabel.font = UIFont(name: "SUITE-Regular", size: 14)
        //        graphLabel.textColor = .black
        //        graphLabel.isHidden = true
        //
        ////        self.view.addSubview(imageView)
        //        saveView.addSubview(graphLabel)
        
        
        graph = UIImageView(frame: CGRect(x: 20, y: graphLabel.frame.maxY + 30, width: SCREEN.WIDTH - 80, height: 180))
        
        if IS_IPHONE_N {
            graph = UIImageView(frame: CGRect(x: 20, y: graphLabel.frame.maxY + 30, width: SCREEN.WIDTH - 80, height: 150))
        }
        if IS_IPHONE_X {
            graph = UIImageView(frame: CGRect(x: 20, y: graphLabel.frame.maxY + 30, width: SCREEN.WIDTH - 80, height: 150))
        }
        if IS_IPHONE_X {
            graph = UIImageView(frame: CGRect(x: 20, y: graphLabel.frame.maxY + 30, width: SCREEN.WIDTH - 80, height: 150))
        }
        
        if IS_IPHONE_12PRO {
            graph = UIImageView(frame: CGRect(x: 20, y: graphLabel.frame.maxY + 30, width: SCREEN.WIDTH - 80, height: 165))
        }
        if IS_IPHONE_15PRO {
            graph = UIImageView(frame: CGRect(x: 20, y: graphLabel.frame.maxY + 30, width: SCREEN.WIDTH - 80, height: 165))
        }
        
        if IS_IPHONE_N_PLUS {
            graph = UIImageView(frame: CGRect(x: 20, y: graphLabel.frame.maxY + 30, width: SCREEN.WIDTH - 80, height: 170))
        }
        
        graph.backgroundColor = .clear
        graph.isHidden = true
        graph.image = UIImage(named: "howGraph1")
        graph.alpha = 1
        saveView.addSubview(graph)
        
        if IS_IPHONE_X {
            myView = ABGaugeView(frame: CGRect(x: 0, y: 0, width: graph.frame.width, height: 310))
        } else {
            myView = ABGaugeView(frame: CGRect(x: 0, y: 0, width: graph.frame.width, height: 330))
        }
        //        myView = ABGaugeView(frame: CGRect(x: 0, y: 0, width: graph.frame.width, height: 330))
        myView.backgroundColor = .clear
        
        myView.needleValue = 66/(170 * 170 * 0.0001)
        //        myView.needleValue = 17.2
        print("myView.needleValue:\(myView.needleValue)")
        if myView.needleValue <= 18.5 {
            myView.needleValue = 17
            print("저체중")
        } else if myView.needleValue <= 22.9 {
            myView.needleValue = 42
            print("정상")
        } else if myView.needleValue <= 24.9 {
            myView.needleValue = 58
            print("과체중")
        }else{
            myView.needleValue = 85
            print("비만")
        }
        
        
        graphLabel.isHidden = false
        
        graph.isHidden = false
        
        
        
        //            gymSaveData.frame.origin.y = saveView.frame.maxY + 20
        //
        //            gymSaveView.frame.origin.y = gymSaveData.frame.maxY + 20
        //
        //            cancelBTN.frame.origin.y = gymSaveView.frame.maxY + 10
        //
        //            saveBTN.frame.origin.y = gymSaveView.frame.maxY + 10
        
        
        
        //        graph.addSubview(myView)
        
        
        gymSaveData = UILabel(frame: CGRect(x: 20, y: saveView.frame.maxY, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 14))
        gymSaveData.text = "운동 시간을 입력해주세요."
        saveData.font = UIFont(name: "SUITE-Regular", size: 18)
        //        gymSaveData.font = UIFont.systemFont(ofSize: 18)
        
        //        gymSaveData.frame.origin.y = saveView.frame.maxY + 20
        
        scrollView.addSubview(gymSaveData)
        
        //        var gymSaveView: UIView!
        
        //        var afterBTN: UIButton!
        //        var beforeBTN: UIButton!
        //        var bloodTF: UITextField!
        //        var glycated: UITextField!
        
        gymSaveView = UIView(frame: CGRect(x: 20, y: gymSaveData.frame.maxY + 2, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 6.5))
        gymSaveView.backgroundColor = .white
        //        saveView.layer.borderWidth = 1
        gymSaveView.layer.cornerRadius = 8
        scrollView.addSubview(gymSaveView)
        
        gymKindView = UIView(frame: CGRect(x: 10, y: 5, width: saveView.frame.size.width - 20, height: self.view.frame.size.height / 14))
        gymKindView.backgroundColor = .white
        
        gymSaveView.addSubview(gymKindView)
        
        var gymKindViewLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 80, height: dateView.frame.height))
        gymKindViewLabel.text = "운동종목"
        gymKindViewLabel.font = UIFont(name: "SUITE-Regular", size: 17)
        gymKindViewLabel.layer.addBorder([.bottom], color: .lightGray, width: 1)
        gymKindView.addSubview(gymKindViewLabel)
        
        sportsInputView = UITextField(frame: CGRect(x: gymKindViewLabel.frame.maxX, y: 0, width: dateView.frame.size.width - 20 - gymKindViewLabel.frame.width, height: gymKindViewLabel.frame.height))
        sportsInputView.placeholder = "운동종목을 입력해 주세요."
        sportsInputView.textAlignment = .right
        sportsInputView.font = UIFont(name: "SUITE-Regular", size: 17)
        sportsInputView.layer.addBorder([.bottom], color: .lightGray, width: 1)
        gymKindView.addSubview(sportsInputView)
        
        
        
        
        
        var gymTimeView = UIView(frame: CGRect(x: 10, y: gymKindView.frame.maxY, width: saveView.frame.size.width - 20, height: self.view.frame.size.height / 14))
        gymTimeView.backgroundColor = .white
        
        
        
        gymSaveView.addSubview(gymTimeView)
        
        var gymTimeViewLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 100, height: dateView.frame.height))
        gymTimeViewLabel.text = "운동시간(분)"
        gymTimeViewLabel.font = UIFont(name: "SUITE-Regular", size: 17)
        //        gymTimeViewLabel.layer.addBorder([.bottom], color: .lightGray, width: 1)
        gymTimeView.addSubview(gymTimeViewLabel)
        
        exerciseTime = UITextField(frame: CGRect(x: gymTimeViewLabel.frame.maxX, y: 0, width: dateView.frame.size.width - 20 - gymTimeViewLabel.frame.width, height: gymTimeViewLabel.frame.height))
        exerciseTime.placeholder = "운동시간을 입력해 주세요."
        exerciseTime.keyboardType = .numberPad
        exerciseTime.textAlignment = .right
        exerciseTime.font = UIFont(name: "SUITE-Regular", size: 17)
        exerciseTime.delegate = self
        //        exerciseTime.layer.addBorder([.bottom], color: .lightGray, width: 1)
        gymTimeView.addSubview(exerciseTime)
        
        
        cancelBTN = UIButton(frame: CGRect(x: 0, y: gymSaveView.frame.maxY + 10, width: self.view.frame.size.width / 2, height: self.view.frame.size.height / 12))
        cancelBTN.setTitle("취소", for: .normal)
        cancelBTN.titleLabel?.font = UIFont(name: "SUITE-Heavy", size: 17)
        cancelBTN.backgroundColor = #colorLiteral(red: 0.6152173877, green: 0.6653684974, blue: 0.7206344604, alpha: 1)
        scrollView.addSubview(cancelBTN)
        
        saveBTN = UIButton(frame: CGRect(x: cancelBTN.frame.maxX, y: gymSaveView.frame.maxY + 10, width: self.view.frame.size.width / 2, height: self.view.frame.size.height / 12))
        saveBTN.setTitle("저장", for: .normal)
        saveBTN.titleLabel?.font = UIFont(name: "SUITE-Heavy", size: 17)
        saveBTN.backgroundColor = #colorLiteral(red: 0.1400382817, green: 0.3497706652, blue: 0.5862404704, alpha: 1)
        saveBTN.addTarget(self, action: #selector(saveData(_ :)), for: .touchUpInside)
        scrollView.addSubview(saveBTN)
        
        
        //        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        //        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: menuView.frame.maxY).isActive = true
        //        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        //        scrollView.bottomAnchor.constraint(equalTo: saveBTN.bottomAnchor, constant: 50).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: menuView.frame.maxY).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: saveBTN.bottomAnchor, constant: 0).isActive = true
        
        ObesityWebView.isHidden = false
        ObesityManagementNotebookView.isHidden = true
        obesityListView.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //        dataUpdateB()
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
            self.obesityListView.reloadInputViews()
            self.obesityListView.layoutIfNeeded()
        }
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
        self.obesityListView.graphScrollView.isHidden = true
        self.obesityListView.dataScrollView.isHidden = false
        
        self.obesityListView.dataScrollView.dataUpdate()
        self.obesityListView.reloadInputViews()
        self.obesityListView.layoutIfNeeded()
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
        
        self.obesityListView.graphScrollView.isHidden = false
        self.obesityListView.dataScrollView.isHidden = true
        
        self.obesityListView.graphScrollView.dataUpdate(index: 1)
        self.obesityListView.reloadInputViews()
        self.obesityListView.layoutIfNeeded()
        
    }
    
    func moveSelected(view :UIView, button: UIButton) {
        view.center.x = button.center.x
    }
    
    @objc func showBMI(_ sender: UIButton) {
        
        
        
        
        
        var hStr = heightInputView.text
        print("zxczxcxz:\(hStr)")
        var heStr  = NumberFormatter().number(from: hStr ?? "")
        print("zxczxcxz:\(heStr)")
        var myHeight = CGFloat(truncating: heStr ?? 0)
        print("zxczxcxz:\(myHeight)")
        var wStr = weightInputView.text
        var weStr  = NumberFormatter().number(from: wStr ?? "")
        var myWeight = CGFloat(truncating: weStr ?? 0)
        
        
        //
        //        if hStr == "" && wStr == "" {
        //            bmiCheck.isEnabled = true
        //            let vc = ObesityViewController2()
        //            //
        //                                                                        vc.modalPresentationStyle = .fullScreen
        //                                                                        self.present(vc, animated: false)
        //
        //            showToast(message: "모든 항목을 기입해 주세요.", font: UIFont.systemFont(ofSize: 15))
        //
        //        }
        //
        
        if hStr == "" {
            graphLabel.text = "BMI (체질량지수)를 계산해주세요."
            showToast(message: "키와 몸무게를 기입해 주세요.", font: UIFont.systemFont(ofSize: 15))
            
        } else if wStr == "" {
            graphLabel.text = "BMI (체질량지수)를 계산해주세요."
            showToast(message: "키와 몸무게를 기입해 주세요.", font: UIFont.systemFont(ofSize: 15))
        } else {
            
            
            
            myView.needleValue = myWeight/(myHeight * myHeight * 0.0001)
            //        myView.needleValue = 25
            print("zxczxcxz:\(myView.needleValue)")
            
            UserDefaults.standard.setValue(myView.needleValue, forKey: "needle")
            
            print("--->\(UserDefaults.standard.integer(forKey: "needle"))")
            
            
            //        if myView.needleValue <= 18.5 {
            //            myView.needleValue = 5
            //            print("저체중")
            //        } else if myView.needleValue > 18.5 && myView.needleValue <= 22.9 {
            //            myView.needleValue = 34
            //            print("정상")
            //        } else if myView.needleValue > 22.9 && myView.needleValue <= 24.9 {
            //            myView.needleValue = 68
            //            print("과체중")
            //        }else{
            //            myView.needleValue = 102
            //            print("비만")
            //        }
            
            
            myView.needleValue = CGFloat(UserDefaults.standard.integer(forKey: "needle"))
            //        graphLabel.text = "BMI (체질량지수) 는\n \(UserDefaults.standard.integer(forKey: "needle"))으로 00입니다."
            
            //        if myView.needleValue <= 18.5 {
            //            myView.needleValue = 5
            //            print("저체중")
            //
            //        } else if myView.needleValue > 18.5 && myView.needleValue <= 22.9 {
            //            myView.needleValue = 34
            //            print("정상")
            //        } else if myView.needleValue > 22.9 && myView.needleValue <= 24.9 {
            //            myView.needleValue = 68
            //            print("과체중")
            //        }else{
            //            myView.needleValue = 102
            //            print("비만")
            //        }
            
            if myView.needleValue <= 18.5 {
                myView.needleValue = 5
                print("저체중")
                UserDefaults.standard.setValue("저체중", forKey: "how")
                graph.image = UIImage(named: "howGraph1")
                graphLabel.text = "BMI (체질량지수) 는\n \(UserDefaults.standard.integer(forKey: "needle"))으로 \(UserDefaults.standard.string(forKey: "how") ?? "")입니다."
                
                let fontSize = UIFont(name: "SUITE-Regular", size: 24)
                let attributedStr = NSMutableAttributedString(string:graphLabel.text!)
                attributedStr.addAttribute(.font, value: fontSize, range: (graphLabel.text as! NSString).range(of: "\(UserDefaults.standard.integer(forKey: "needle"))으로 \(UserDefaults.standard.string(forKey: "how") ?? "")입니다."))
                
                
                graphLabel.attributedText = attributedStr
                saveView.addSubview(graphLabel)
            } else if myView.needleValue > 18.5 && myView.needleValue <= 22.9 {
                myView.needleValue = 34
                print("정상")
                UserDefaults.standard.setValue("정상", forKey: "how")
                graph.image = UIImage(named: "howGraph2")
                graphLabel.text = "BMI (체질량지수) 는\n \(UserDefaults.standard.integer(forKey: "needle"))으로 \(UserDefaults.standard.string(forKey: "how") ?? "")입니다."
                
                let fontSize = UIFont(name: "SUITE-Regular", size: 24)
                let attributedStr = NSMutableAttributedString(string:graphLabel.text!)
                attributedStr.addAttribute(.font, value: fontSize, range: (graphLabel.text as! NSString).range(of: "\(UserDefaults.standard.integer(forKey: "needle"))으로 \(UserDefaults.standard.string(forKey: "how") ?? "")입니다."))
                
                
                graphLabel.attributedText = attributedStr
                saveView.addSubview(graphLabel)
            } else if myView.needleValue > 22.9 && myView.needleValue <= 24.9 {
                myView.needleValue = 68
                print("과체중")
                graph.image = UIImage(named: "howGraph3")
                UserDefaults.standard.setValue("과체중", forKey: "how")
                graphLabel.text = "BMI (체질량지수) 는\n \(UserDefaults.standard.integer(forKey: "needle"))으로 \(UserDefaults.standard.string(forKey: "how") ?? "")입니다."
                
                let fontSize = UIFont(name: "SUITE-Regular", size: 24)
                let attributedStr = NSMutableAttributedString(string:graphLabel.text!)
                attributedStr.addAttribute(.font, value: fontSize, range: (graphLabel.text as! NSString).range(of: "\(UserDefaults.standard.integer(forKey: "needle"))으로 \(UserDefaults.standard.string(forKey: "how") ?? "")입니다."))
                
                
                graphLabel.attributedText = attributedStr
                saveView.addSubview(graphLabel)
            }else{
                myView.needleValue = 102
                print("비만")
                UserDefaults.standard.setValue("비만", forKey: "how")
                graph.image = UIImage(named: "howGraph4")
                graphLabel.text = "BMI (체질량지수) 는\n \(UserDefaults.standard.integer(forKey: "needle"))으로 \(UserDefaults.standard.string(forKey: "how") ?? "")입니다."
                
                let fontSize = UIFont(name: "SUITE-Regular", size: 24)
                let attributedStr = NSMutableAttributedString(string:graphLabel.text!)
                attributedStr.addAttribute(.font, value: fontSize, range: (graphLabel.text as! NSString).range(of: "\(UserDefaults.standard.integer(forKey: "needle"))으로 \(UserDefaults.standard.string(forKey: "how") ?? "")입니다."))
                
                
                graphLabel.attributedText = attributedStr
                saveView.addSubview(graphLabel)
            }
            
            //            saveView.frame.size.height = 550
            //
            //        graphLabel.isHidden = false
            //
            //        graph.isHidden = false
            //
            //
            //
            //            gymSaveData.frame.origin.y = saveView.frame.maxY + 20
            //
            //            gymSaveView.frame.origin.y = gymSaveData.frame.maxY + 20
            //
            //            cancelBTN.frame.origin.y = gymSaveView.frame.maxY + 10
            //
            //            saveBTN.frame.origin.y = gymSaveView.frame.maxY + 10
            
        }
    }
    
    @objc func segButtonPressed(_ sender: UIButton) {
        print("tab")
        self.view.endEditing(true)
        
        if sender.tag == 0 {
            UIView.animate(withDuration: 0.5, animations: { [self] in
                
                //            moveSelected(view: UnderBar, button: button1)
                
            })
            ObesityWebView.isHidden = false
            ObesityManagementNotebookView.isHidden = true
            obesityListView.isHidden = true
            
            label1.textColor = .black
            label2.textColor = .lightGray
            label3.textColor = .lightGray
            
        } else if sender.tag == 1 {
            UIView.animate(withDuration: 0.5, animations: { [self] in
                
                //            moveSelected(view: UnderBar, button: button2)
                
            })
            ObesityWebView.isHidden = true
            ObesityManagementNotebookView.isHidden = false
            obesityListView.isHidden = true
            
            label1.textColor = .lightGray
            label2.textColor = .black
            label3.textColor = .lightGray
        } else if sender.tag == 2 {
            UIView.animate(withDuration: 0.5, animations: { [self] in
                
                //            moveSelected(view: UnderBar, button: button3)
                
            })
            ObesityWebView.isHidden = true
            ObesityManagementNotebookView.isHidden = true
            obesityListView.isHidden = false
            
            label1.textColor = .lightGray
            label2.textColor = .lightGray
            label3.textColor = .black
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        //        myView.needleValue = CGFloat(UserDefaults.standard.integer(forKey: "needle"))
        //        graphLabel.text = "BMI (체질량지수) 는\n \(UserDefaults.standard.integer(forKey: "needle"))으로 00입니다."
        graphLabel.text = "BMI (체질량지수) 는\n \(UserDefaults.standard.integer(forKey: "needle"))으로 \(UserDefaults.standard.string(forKey: "how") ?? "")입니다."
        //        self.dataUpdate()
        //        NotificationCenter.default.addObserver(self, selector: #selector(test(_ :)), name: Notification.Name("test"), object: nil)
        
        let fontSize = UIFont(name: "SUITE-Regular", size: 24)
        let attributedStr = NSMutableAttributedString(string:graphLabel.text!)
        attributedStr.addAttribute(.font, value: fontSize, range: (graphLabel.text as! NSString).range(of: "\(UserDefaults.standard.integer(forKey: "needle"))으로 \(UserDefaults.standard.string(forKey: "how") ?? "")입니다."))
        
        
        graphLabel.attributedText = attributedStr
        saveView.addSubview(graphLabel)
        
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
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //        myView.needleValue = CGFloat(UserDefaults.standard.integer(forKey: "needle"))
        //        graphLabel.text = "BMI (체질량지수) 는\n \(UserDefaults.standard.integer(forKey: "needle"))으로 00입니다."
        //        graphLabel.text = "BMI (체질량지수) 는\n \(UserDefaults.standard.integer(forKey: "needle"))으로 \(UserDefaults.standard.string(forKey: "how") ?? "")입니다."
        graphLabel.text = "BMI (체질량지수)를 계산해주세요."
        
        let fontSize = UIFont(name: "SUITE-Regular", size: 24)
        let attributedStr = NSMutableAttributedString(string:graphLabel.text!)
        attributedStr.addAttribute(.font, value: fontSize, range: (graphLabel.text as! NSString).range(of: "\(UserDefaults.standard.integer(forKey: "needle"))으로 \(UserDefaults.standard.string(forKey: "how") ?? "")입니다."))
        
        
        graphLabel.attributedText = attributedStr
        saveView.addSubview(graphLabel)
        
    }
    
    
    
    
    
    @objc func saveData(_ sender: UIButton) {
        
        let bmi: String
        
        if self.heightInputView.text == "" {
            heightInputView.text = "0"
            weightInputView.text = "0"
            bmi = "0"
            return
        }
        
        if self.weightInputView.text == "" {
            weightInputView.text = "0"
            weightInputView.text = "0"
            bmi = "0"
            return
        }
        
        if self.sportsInputView.text == "" {
            toastShow(message: "운동종목을 입력하세요.")
            showToast(message: "운동종목을 입력하세요.", font: UIFont(name: "SUITE-Regular", size: 20)!)
            return
        }
        
        if self.exerciseTime.text == "" {
            toastShow(message: "운동시간을 입력하세요.")
            showToast(message: "운동시간을 입력하세요.", font: UIFont(name: "SUITE-Regular", size: 20)!)
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
        let sid = "\(UserDefaults.standard.object(forKey: "userSid") ?? 0)"
        //     let year = dateToStringWithFormat(formatString: "yyyy", date: today)
        let year = current_year_string
        
        let month = formatter_month_string
        let week = formatter_week_string
        let dayweek = formatter_dayWeek_string
        let day = formatter_day_string
        //        let dateTime = current_date_string
        var dateTime = changeTf.text
        
        //
        
        
        //        guard let regNumString = userD.object(forKey: USER_KEY.KSR_REGISTRATION_NUMBER) as? String else {
        //            toastShow(message: "reg_num is nil error")
        //            return
        //        }
        
        
        let height = self.heightInputView.text!
        let weight = self.weightInputView.text!
        
        
        
        let heightValue = height.toCGFloat()!
        let weightValue = weight.toCGFloat()!
        
        if heightInputView.text == "0" {
            bmi = "0"
        } else {
            bmi = "\(getBMI(weight: weightValue, height: heightValue))"
        }
        //        bmi = "\(getBMI(weight: weightValue, height: heightValue))"
        
        
        
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
        ] as? [String:String]
        print("sendDataDic:\n\(sendDataDic)")
        self.showToast(message: "데이터가 등록 되었습니다.", font: UIFont(name: "SUITE-Regular", size: 18)!)
        Server.getData(type: Server.InfoType.BMI_ADD, otherInfo: sendDataDic) { (kData : Data?) in
            if let data = kData {
                if let dataString : String = String(data: data, encoding: String.Encoding.utf8) {
                    
                    self.heightInputView.text = ""
                    self.weightInputView.text = ""
                    self.sportsInputView.text = ""
                    self.exerciseTime.text = ""
                    
                    
                    
                    
                    print("BMI_ADD:\(dataString)")
                    self.view.endEditing(true)
                    //                    self.superCon?.segView.itemButtonPressed(button: (self.superCon?.segView.itemButtons[2])!)
                    self.obesityListView.dataScrollView.dataUpdate()
                }
            }
        }
        
        
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
        // 현재 동작하고 있는 이벤트에서 키보드의 frame을 받아옴
        guard let keyboardFrame = sender.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        let keyboardHeight = keyboardFrame.cgRectValue.height
        
        // ⭐️ 이 조건을 넣어주지 않으면, 각각의 텍스트필드마다 keyboardWillShow 동작이 실행되므로 아래와 같은 현상이 발생
        if view.frame.origin.y == 0 {
            view.frame.origin.y -= keyboardHeight
        }
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
    
    
    
    
    func dataUpdateB(){
        //           guard let regNumString = userD.object(forKey: USER_KEY.KSR_REGISTRATION_NUMBER) as? String else {
        //               toastShow(message: "reg_num is nil error")
        //               return
        //           }
        
        let sid = "\((UserDefaults.standard.object(forKey: "userSid")) ?? 0)"
        
        Server.getData(type: Server.InfoType.BMI_USER, otherInfo: ["user_sid":sid]) { (kData : Data?) in
            if let data = kData {
                do {
                    if let jsonDic = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String:String] {
                        print("BMI_USER:\n\(jsonDic)")
                        
                        let seccess = jsonDic["success"] ?? ""
                        let successValue = Int(seccess, radix: 10)
                        let cnt = jsonDic["cnt"] ?? ""
                        let cntValue = Int(cnt, radix: 10)
                        
                        
                        
                        
                        
                        
                        if let integerJson = jsonDic["success"]!.toCGFloat(){
                            print("Integer conversion successful : \(integerJson)")
                            
                            
                            let z = integerJson
                            UserDefaults.standard.setValue(z, forKey: "s")
                            bmi1 = (UserDefaults.standard.object(forKey: "s") as! CGFloat)
                            
                        }
                        else{
                            print("Integer conversion failed")
                        }
                        
                        
                        if let integerJson = jsonDic["cnt"]!.toCGFloat(){
                            print("Integer conversion successful : \(integerJson)")
                            
                            
                            let y = integerJson
                            UserDefaults.standard.setValue(y, forKey: "c")
                            bmi2 = (UserDefaults.standard.object(forKey: "c") as! CGFloat)
                        }
                        else{
                            print("Integer conversion failed")
                        }
                        
                        
                        print(bmi1)
                        print(bmi2)
                        
                        
                        //                        self.bloodPressureNoteView.bloodPressureGoalAndRateView.goalView.valueLabelUpdate(labelIndex: 0, valueLabelString: "수축기", valueString: " \(max) ", unitString: "mmHg")
                        //                        self.bloodPressureListView.dataScrollView.goalView.valueLabelUpdate(labelIndex: 0, valueLabelString: "수축기", valueString: " \(max) ", unitString: "mmHg")
                        //                        self.bloodPressureListView.graphScrollView.goalView.valueLabelUpdate(labelIndex: 0, valueLabelString: "수축기", valueString: " \(max) ", unitString: "mmHg")
                        
                        //                        self.bloodPressureNoteView.bloodPressureGoalAndRateView.goalView.valueLabelUpdate(labelIndex: 1, valueLabelString: "이완기", valueString: " \(min) ", unitString: "mmHg")
                        //                        self.bloodPressureListView.dataScrollView.goalView.valueLabelUpdate(labelIndex: 1, valueLabelString: "이완기", valueString: " \(min) ", unitString: "mmHg")
                        //                        self.bloodPressureListView.graphScrollView.goalView.valueLabelUpdate(labelIndex: 1, valueLabelString: "이완기", valueString: " \(min) ", unitString: "mmHg")
                        
                        print("여기로 와주세요1")
                        
                        if let success = successValue , let cnt = cntValue {
                            print("여기로 와주세요2")
                            let persent : Int
                            let perGraph: CGFloat
                            if cnt != 0 {
                                
                                persent = Int(round((Double(success) / Double(cnt)) * 100))
                                perGraph = CGFloat(round((Double(success) / Double(cnt)) * 100))
                                
                                print("---------------1")
                                UserDefaults.standard.setValue(persent, forKey: "persentB")
                                print(persent)
                                UserDefaults.standard.setValue(perGraph, forKey: "perGraphB")
                                
                                print(perGraph)
                                print("---------------1")
                                
                                
                                
                                
                                
                                
                            }else{
                                persent = 0
                            }
                            //
                        }
                        
                        //                           if let success = successValue , let cnt = cntValue {
                        //                               let persent : Int
                        //                               if cnt != 0 {
                        //                                   //?/
                        //   //                                print("success : \(success)")
                        //   //                                print("cnt : \(cnt)")
                        //                                   persent = Int(round((Double(success) / Double(cnt)) * 100))
                        //                               }else{
                        //                                   persent = 0
                        //                               }
                        ////                               self.obesityNoteView.goalAndRateView.rateView.valueLabelUpdate(valueString: " \(persent) ", unitString: "%")
                        ////                               self.obesityListView.dataScrollView.rateView.valueLabelUpdate(valueString: " \(persent) ", unitString: "%")
                        ////                               self.obesityListView.graphScrollView.rateView.valueLabelUpdate(valueString: " \(persent) ", unitString: "%")
                        //
                        //                           }
                    }
                }catch {
                    print("error:\(error.localizedDescription)")
                }
            }
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
        
        if textField == heightInputView {
            
            guard let textFieldText = heightInputView.text,
                  let rangeOfTextToReplace = Range(range, in: textFieldText) else {
                return false
            }
            let substringToReplace = textFieldText[rangeOfTextToReplace]
            let count = textFieldText.count - substringToReplace.count + string.count
            return count <= 3
        } else if textField == weightInputView {
            
            guard let textFieldText = weightInputView.text,
                  let rangeOfTextToReplace = Range(range, in: textFieldText) else {
                return false
            }
            let substringToReplace = textFieldText[rangeOfTextToReplace]
            let count = textFieldText.count - substringToReplace.count + string.count
            return count <= 3
            
        } else if textField == exerciseTime {
            
            guard let textFieldText = exerciseTime.text,
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
