////
////  BloodSugarViewController2.swift
////  KSR_2024
////
////  Created by m2comm on 2024/01/29.
////
//
//import Foundation
//import UIKit
//
////class CircleView: UIView {
////
////    let borderWidth: CGFloat = 20
////
////    let startAngle = CGFloat(Double.pi)
////    let middleAngle = CGFloat(Double.pi + Double.pi / 2)
////    let endAngle = CGFloat(2 * Double.pi)
////    var primaryColor = UIColor.red
////    var secondaryColor = UIColor.blue
////    var currentStrokeValue = CGFloat(0)
////
////    override func draw(_ rect: CGRect) {
////        let center = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2)
////        let radius = CGFloat(self.frame.width / 2 - borderWidth)
////        let path1 = UIBezierPath(arcCenter: center, radius: radius, startAngle: startAngle, endAngle: middleAngle, clockwise: true)
////        let path2 = UIBezierPath(arcCenter: center, radius: radius, startAngle: middleAngle, endAngle: endAngle, clockwise: true)
////        path1.lineWidth = borderWidth
////        primaryColor.setStroke()
////        path1.stroke()
////        path2.lineWidth = borderWidth
////        secondaryColor.setStroke()
////        path2.stroke()
////    }
////
////}
//
//
//
//class BloodSugarViewController2: BaseViewController {
//    
//    var BloodSugarWebView : WebView!
//    var BloodSugarManagementNotebookView : BloodSugarManagementNotebookView!
//    var BloodSugarRecordsView : BloodSugarRecordsView!
//    
//        var bloodSugarListView : BloodSugarListView!
//    
//    var testBtn1: UIButton!
//    var testBtn2: UIButton!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        label1.text = "혈당관리\n도움말"
//        label2.text = "혈당\n관리수첩"
//        label3.text = "혈당\n기록보기"
//        
//        self.BloodSugarWebView = WebView(frame: CGRect(
//            x: 0,
//            y: menuView.frame.maxY,
//            width: SCREEN.WIDTH,
//            height: SCREEN.HEIGHT - menuView.frame.maxY), urlString: "https://www.naver.com")
//        
//        BloodSugarManagementNotebookView = KSR_2024.BloodSugarManagementNotebookView(frame: CGRect(x: 0, y: scrollView.frame.minY, width: SCREEN.WIDTH, height: scrollView.frame.height))
//        BloodSugarManagementNotebookView.backgroundColor = .white
//        scrollView.addSubview(BloodSugarManagementNotebookView)
//        
//        
//        
//        
//        self.view.addSubview(self.BloodSugarWebView)
//        
//        
//        self.bloodSugarListView = BloodSugarListView(frame: CGRect(
//                    x: 0,
//                    y: menuView.frame.maxY,
//                    width: SCREEN.WIDTH,
//                    height: SCREEN.HEIGHT - menuView.frame.maxY - SAFE_AREA))
//        
//        self.bloodSugarListView.backgroundColor = .white
//                self.view.addSubview(self.bloodSugarListView)
//        
////                self.segView.itemButtonPressed(button: self.segView.itemButtons[1])
//        //        self.segButtonPressed(index: 0)
//        
//                self.dataUpdate()
//        
//        testBtn1 = UIButton(frame: CGRect(x: SCREEN.WIDTH / 2, y: 20, width: 100, height: 60))
//        testBtn1.setTitle("리스트보기", for: .normal)
//        testBtn1.setTitleColor(.black, for: .normal)
//        testBtn1.layer.borderWidth = 1
//        bloodSugarListView.addSubview(testBtn1)
//        testBtn1.addTarget(self, action: #selector(rightButton2PressedList(_ :)), for: .touchUpInside)
//        
//        
//        testBtn2 = UIButton(frame: CGRect(x: testBtn1.frame.maxX + 5, y: 20, width: 100, height: 60))
//        testBtn2.setTitle("그래프보기", for: .normal)
//        testBtn2.setTitleColor(.black, for: .normal)
//        testBtn2.layer.borderWidth = 1
//        bloodSugarListView.addSubview(testBtn2)
//        testBtn2.addTarget(self, action: #selector(rightButton2PressedGraph(_ :)), for: .touchUpInside)
//        
//        
//        
//        buttons = [button1, button2, button3]
//        
//        self.buttons.forEach {
//            $0.addTarget(self, action: #selector(segButtonPressed(_ :)), for: .touchUpInside)
//        }
//        
//        BloodSugarManagementNotebookView.FastingBloodSugar = UIView(frame: CGRect(x: 20, y: scrollView.frame.minY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 5))
//        BloodSugarManagementNotebookView.FastingBloodSugar.backgroundColor = #colorLiteral(red: 0.002579513937, green: 0.765566349, blue: 0.8613703847, alpha: 1)
////        BloodSugarManagementNotebookView.FastingBloodSugar.layer.borderWidth = 1
//        BloodSugarManagementNotebookView.FastingBloodSugar.layer.cornerRadius = 8
//        
//        scrollView.addSubview(BloodSugarManagementNotebookView.FastingBloodSugar)
//        
//        BloodSugarManagementNotebookView.FastingBloodSugarLabel = UILabel(frame: CGRect(x: 30, y: 25, width: BloodSugarManagementNotebookView.FastingBloodSugar.frame.size.width / 2.5, height: BloodSugarManagementNotebookView.FastingBloodSugar.frame.size.height / 6))
//        BloodSugarManagementNotebookView.FastingBloodSugarLabel.text = "나의 혈압 목표 수치는?"
//        BloodSugarManagementNotebookView.FastingBloodSugarLabel.textAlignment = .center
//        BloodSugarManagementNotebookView.FastingBloodSugarLabel.font = UIFont.systemFont(ofSize: 16)
//        BloodSugarManagementNotebookView.FastingBloodSugarLabel.textColor = .white
//        BloodSugarManagementNotebookView.FastingBloodSugar.addSubview(BloodSugarManagementNotebookView.FastingBloodSugarLabel)
//        
//        BloodSugarManagementNotebookView.FastingBloodSugarShowLabel = UILabel(frame: CGRect(x: 30, y: BloodSugarManagementNotebookView.FastingBloodSugarLabel.frame.maxY + 20, width: BloodSugarManagementNotebookView.FastingBloodSugar.frame.size.width / 2.5, height: BloodSugarManagementNotebookView.FastingBloodSugar.frame.size.height / 6))
//     BloodSugarManagementNotebookView.FastingBloodSugarShowLabel.text = "금식혈당\n(Fasting glucose)"
//        BloodSugarManagementNotebookView.FastingBloodSugarShowLabel.textAlignment = .center
//        BloodSugarManagementNotebookView.FastingBloodSugarShowLabel.numberOfLines = 0
//        BloodSugarManagementNotebookView.FastingBloodSugarShowLabel.font = UIFont.systemFont(ofSize: 12)
//        BloodSugarManagementNotebookView.FastingBloodSugarShowLabel.textColor = .white
//        BloodSugarManagementNotebookView.FastingBloodSugar.addSubview(BloodSugarManagementNotebookView.FastingBloodSugarShowLabel)
//        
//        BloodSugarManagementNotebookView.FastingBloodSugarShowNumLabel = UILabel(frame: CGRect(x: 30, y: BloodSugarManagementNotebookView.FastingBloodSugarShowLabel.frame.maxY + 20, width: BloodSugarManagementNotebookView.FastingBloodSugar.frame.size.width / 2.5, height: BloodSugarManagementNotebookView.FastingBloodSugar.frame.size.height / 6))
//     BloodSugarManagementNotebookView.FastingBloodSugarShowNumLabel.text = "120mg/dL 이하"
//        BloodSugarManagementNotebookView.FastingBloodSugarShowNumLabel.textAlignment = .center
//        BloodSugarManagementNotebookView.FastingBloodSugarShowNumLabel.font = UIFont.systemFont(ofSize: 16)
//        BloodSugarManagementNotebookView.FastingBloodSugarShowNumLabel.textColor = .white
//        BloodSugarManagementNotebookView.FastingBloodSugar.addSubview(BloodSugarManagementNotebookView.FastingBloodSugarShowNumLabel)
//        
//        BloodSugarManagementNotebookView.FastingBloodSugarPercent = UILabel(frame: CGRect(x: BloodSugarManagementNotebookView.FastingBloodSugarLabel.frame.maxX + 20, y: 25, width: BloodSugarManagementNotebookView.FastingBloodSugar.frame.size.width / 2.5, height: BloodSugarManagementNotebookView.FastingBloodSugar.frame.size.height / 6))
//        BloodSugarManagementNotebookView.FastingBloodSugarPercent.text = "목표 수치 달성율은?"
//        BloodSugarManagementNotebookView.FastingBloodSugarPercent.textAlignment = .center
//        BloodSugarManagementNotebookView.FastingBloodSugarPercent.font = UIFont.systemFont(ofSize: 16)
//        BloodSugarManagementNotebookView.FastingBloodSugarPercent.textColor = .white
//        BloodSugarManagementNotebookView.FastingBloodSugar.addSubview(BloodSugarManagementNotebookView.FastingBloodSugarPercent)
//        
//        BloodSugarManagementNotebookView.FastingBloodSugarGraph = UIView(frame: CGRect(x: BloodSugarManagementNotebookView.FastingBloodSugarPercent.frame.minX, y: BloodSugarManagementNotebookView.FastingBloodSugarPercent.frame.maxY + 20, width: BloodSugarManagementNotebookView.FastingBloodSugar.frame.size.width / 2.5, height: BloodSugarManagementNotebookView.FastingBloodSugar.frame.size.height / 2.2))
//        BloodSugarManagementNotebookView.FastingBloodSugarGraph.backgroundColor = .yellow
////        BloodSugarManagementNotebookView.FastingBloodSugar.layer.borderWidth = 1
////        BloodSugarManagementNotebookView.FastingBloodSugar.layer.cornerRadius = 8
//        BloodSugarManagementNotebookView.FastingBloodSugar.addSubview(BloodSugarManagementNotebookView.FastingBloodSugarGraph)
//        
//        
//        
////        let slayer = CAShapeLayer()
////        let center = CGPoint(x: (BloodSugarManagementNotebookView.FastingBloodSugarGraph.frame.width / 2) + 4, y: BloodSugarManagementNotebookView.FastingBloodSugarGraph.frame.height - 8)
////         let radius: CGFloat = BloodSugarManagementNotebookView.FastingBloodSugarGraph.frame.height - 16
////         let startAngle: CGFloat = 4 * .pi / 4
////         let endAngle: CGFloat = 0.0
////         slayer.path = UIBezierPath(arcCenter: center,
////                                       radius: radius,
////                                       startAngle: startAngle,
////                                       endAngle: endAngle,
////                                       clockwise: true).cgPath
////         slayer.lineWidth = 15.0
////        slayer.lineCap = CAShapeLayerLineCap.round
////         slayer.strokeColor = UIColor.blue.cgColor
////         slayer.fillColor = UIColor.clear.cgColor
//////         self.layer.addSublayer(slayer)
////        BloodSugarManagementNotebookView.FastingBloodSugarGraph.layer.addSublayer(slayer)
//        
//        animate()
//        
//        
//        
//        BloodSugarManagementNotebookView.PostprandialBloodSugar = UIView(frame: CGRect(x: 20, y: BloodSugarManagementNotebookView.FastingBloodSugar.frame.maxY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 5))
//        BloodSugarManagementNotebookView.PostprandialBloodSugar.backgroundColor = #colorLiteral(red: 0.009351861663, green: 0.4616524577, blue: 0.943269372, alpha: 1)
////        BloodSugarManagementNotebookView.FastingBloodSugar.layer.borderWidth = 1
//        BloodSugarManagementNotebookView.PostprandialBloodSugar.layer.cornerRadius = 8
//        scrollView.addSubview(BloodSugarManagementNotebookView.PostprandialBloodSugar)
//        
//        BloodSugarManagementNotebookView.PostprandialBloodSugarLabel = UILabel(frame: CGRect(x: 30, y: 25, width: BloodSugarManagementNotebookView.PostprandialBloodSugar.frame.size.width / 2.5, height: BloodSugarManagementNotebookView.PostprandialBloodSugar.frame.size.height / 6))
//        BloodSugarManagementNotebookView.PostprandialBloodSugarLabel.text = "나의 혈압 목표 수치는?"
//        BloodSugarManagementNotebookView.PostprandialBloodSugarLabel.textAlignment = .center
//        BloodSugarManagementNotebookView.PostprandialBloodSugarLabel.font = UIFont.systemFont(ofSize: 16)
//        BloodSugarManagementNotebookView.PostprandialBloodSugarLabel.textColor = .white
//        BloodSugarManagementNotebookView.PostprandialBloodSugar.addSubview(BloodSugarManagementNotebookView.PostprandialBloodSugarLabel)
//        
//        BloodSugarManagementNotebookView.PostprandialBloodSugarShowLabel = UILabel(frame: CGRect(x: 30, y: BloodSugarManagementNotebookView.PostprandialBloodSugarLabel.frame.maxY + 20, width: BloodSugarManagementNotebookView.PostprandialBloodSugar.frame.size.width / 2.5, height: BloodSugarManagementNotebookView.PostprandialBloodSugar.frame.size.height / 6))
//     BloodSugarManagementNotebookView.PostprandialBloodSugarShowLabel.text = "식수혈당\n(Postprandial glucose)"
//        BloodSugarManagementNotebookView.PostprandialBloodSugarShowLabel.textAlignment = .center
//        BloodSugarManagementNotebookView.PostprandialBloodSugarShowLabel.numberOfLines = 0
//        BloodSugarManagementNotebookView.PostprandialBloodSugarShowLabel.font = UIFont.systemFont(ofSize: 12)
//        BloodSugarManagementNotebookView.PostprandialBloodSugarShowLabel.textColor = .white
//        BloodSugarManagementNotebookView.PostprandialBloodSugar.addSubview(BloodSugarManagementNotebookView.PostprandialBloodSugarShowLabel)
//        
//        BloodSugarManagementNotebookView.PostprandialBloodSugarShowNumLabel = UILabel(frame: CGRect(x: 30, y: BloodSugarManagementNotebookView.PostprandialBloodSugarShowLabel.frame.maxY + 20, width: BloodSugarManagementNotebookView.PostprandialBloodSugar.frame.size.width / 2.5, height: BloodSugarManagementNotebookView.PostprandialBloodSugar.frame.size.height / 6))
//     BloodSugarManagementNotebookView.PostprandialBloodSugarShowNumLabel.text = "220mg/dL 이하"
//        BloodSugarManagementNotebookView.PostprandialBloodSugarShowNumLabel.textAlignment = .center
//        BloodSugarManagementNotebookView.PostprandialBloodSugarShowNumLabel.font = UIFont.systemFont(ofSize: 16)
//        BloodSugarManagementNotebookView.PostprandialBloodSugarShowNumLabel.textColor = .white
//        BloodSugarManagementNotebookView.PostprandialBloodSugar.addSubview(BloodSugarManagementNotebookView.PostprandialBloodSugarShowNumLabel)
//        
//        BloodSugarManagementNotebookView.PostprandialBloodSugarPercent = UILabel(frame: CGRect(x: BloodSugarManagementNotebookView.PostprandialBloodSugarShowNumLabel.frame.maxX + 20, y: 25, width: BloodSugarManagementNotebookView.PostprandialBloodSugar.frame.size.width / 2.5, height: BloodSugarManagementNotebookView.PostprandialBloodSugar.frame.size.height / 6))
//        BloodSugarManagementNotebookView.PostprandialBloodSugarPercent.text = "목표 수치 달성율은?"
//        BloodSugarManagementNotebookView.PostprandialBloodSugarPercent.textAlignment = .center
//        BloodSugarManagementNotebookView.PostprandialBloodSugarPercent.font = UIFont.systemFont(ofSize: 16)
//        BloodSugarManagementNotebookView.PostprandialBloodSugarPercent.textColor = .white
//        BloodSugarManagementNotebookView.PostprandialBloodSugar.addSubview(BloodSugarManagementNotebookView.PostprandialBloodSugarPercent)
//        
//        BloodSugarManagementNotebookView.PostprandialBloodSugarGraph = UIView(frame: CGRect(x: BloodSugarManagementNotebookView.PostprandialBloodSugarPercent.frame.minX, y: BloodSugarManagementNotebookView.PostprandialBloodSugarPercent.frame.maxY + 20, width: BloodSugarManagementNotebookView.PostprandialBloodSugar.frame.size.width / 2.5, height: BloodSugarManagementNotebookView.PostprandialBloodSugar.frame.size.height / 2.2))
//        BloodSugarManagementNotebookView.PostprandialBloodSugarGraph.backgroundColor = .yellow
////        BloodSugarManagementNotebookView.FastingBloodSugar.layer.borderWidth = 1
////        BloodSugarManagementNotebookView.FastingBloodSugar.layer.cornerRadius = 8
//        BloodSugarManagementNotebookView.PostprandialBloodSugar.addSubview(BloodSugarManagementNotebookView.PostprandialBloodSugarGraph)
//     
//       
//        BloodSugarManagementNotebookView.GlycatedHemoglobin = UIView(frame: CGRect(x: 20, y: BloodSugarManagementNotebookView.PostprandialBloodSugar.frame.maxY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 5))
//        BloodSugarManagementNotebookView.GlycatedHemoglobin.backgroundColor = #colorLiteral(red: 0.4349892437, green: 0.1282797456, blue: 0.8903027177, alpha: 1)
////        BloodSugarManagementNotebookView.FastingBloodSugar.layer.borderWidth = 1
//        BloodSugarManagementNotebookView.GlycatedHemoglobin.layer.cornerRadius = 8
//        scrollView.addSubview(BloodSugarManagementNotebookView.GlycatedHemoglobin)
//        
//        BloodSugarManagementNotebookView.GlycatedHemoglobinLabel = UILabel(frame: CGRect(x: 30, y: 25, width: BloodSugarManagementNotebookView.GlycatedHemoglobin.frame.size.width / 2.5, height: BloodSugarManagementNotebookView.GlycatedHemoglobin.frame.size.height / 6))
//        BloodSugarManagementNotebookView.GlycatedHemoglobinLabel.text = "나의 혈압 목표 수치는?"
//        BloodSugarManagementNotebookView.GlycatedHemoglobinLabel.textAlignment = .center
//        BloodSugarManagementNotebookView.GlycatedHemoglobinLabel.font = UIFont.systemFont(ofSize: 16)
//        BloodSugarManagementNotebookView.GlycatedHemoglobinLabel.textColor = .white
//        BloodSugarManagementNotebookView.GlycatedHemoglobin.addSubview(BloodSugarManagementNotebookView.GlycatedHemoglobinLabel)
//        
//        BloodSugarManagementNotebookView.GlycatedHemoglobinShowLabel = UILabel(frame: CGRect(x: 30, y: BloodSugarManagementNotebookView.GlycatedHemoglobinLabel.frame.maxY + 20, width: BloodSugarManagementNotebookView.GlycatedHemoglobin.frame.size.width / 2.5, height: BloodSugarManagementNotebookView.GlycatedHemoglobin.frame.size.height / 6))
//     BloodSugarManagementNotebookView.GlycatedHemoglobinShowLabel.text = "식수혈당\n(Postprandial glucose)"
//        BloodSugarManagementNotebookView.GlycatedHemoglobinShowLabel.textAlignment = .center
//        BloodSugarManagementNotebookView.GlycatedHemoglobinShowLabel.numberOfLines = 0
//        BloodSugarManagementNotebookView.GlycatedHemoglobinShowLabel.font = UIFont.systemFont(ofSize: 12)
//        BloodSugarManagementNotebookView.GlycatedHemoglobinShowLabel.textColor = .white
//        BloodSugarManagementNotebookView.GlycatedHemoglobin.addSubview(BloodSugarManagementNotebookView.GlycatedHemoglobinShowLabel)
//        
//        BloodSugarManagementNotebookView.GlycatedHemoglobinShowNumLabel = UILabel(frame: CGRect(x: 30, y: BloodSugarManagementNotebookView.GlycatedHemoglobinShowLabel.frame.maxY + 20, width: BloodSugarManagementNotebookView.GlycatedHemoglobin.frame.size.width / 2.5, height: BloodSugarManagementNotebookView.GlycatedHemoglobin.frame.size.height / 6))
//     BloodSugarManagementNotebookView.GlycatedHemoglobinShowNumLabel.text = "220mg/dL 이하"
//        BloodSugarManagementNotebookView.GlycatedHemoglobinShowNumLabel.textAlignment = .center
//        BloodSugarManagementNotebookView.GlycatedHemoglobinShowNumLabel.font = UIFont.systemFont(ofSize: 16)
//        BloodSugarManagementNotebookView.GlycatedHemoglobinShowNumLabel.textColor = .white
//        BloodSugarManagementNotebookView.GlycatedHemoglobin.addSubview(BloodSugarManagementNotebookView.GlycatedHemoglobinShowNumLabel)
//        
//        BloodSugarManagementNotebookView.GlycatedHemoglobinPercent = UILabel(frame: CGRect(x: BloodSugarManagementNotebookView.GlycatedHemoglobinShowNumLabel.frame.maxX + 20, y: 25, width: BloodSugarManagementNotebookView.GlycatedHemoglobin.frame.size.width / 2.5, height: BloodSugarManagementNotebookView.GlycatedHemoglobin.frame.size.height / 6))
//        BloodSugarManagementNotebookView.GlycatedHemoglobinPercent.text = "목표 수치 달성율은?"
//        BloodSugarManagementNotebookView.GlycatedHemoglobinPercent.textAlignment = .center
//        BloodSugarManagementNotebookView.GlycatedHemoglobinPercent.font = UIFont.systemFont(ofSize: 16)
//        BloodSugarManagementNotebookView.GlycatedHemoglobinPercent.textColor = .white
//        BloodSugarManagementNotebookView.GlycatedHemoglobin.addSubview(BloodSugarManagementNotebookView.GlycatedHemoglobinPercent)
//        
//        BloodSugarManagementNotebookView.GlycatedHemoglobinGraph = UIView(frame: CGRect(x: BloodSugarManagementNotebookView.GlycatedHemoglobinPercent.frame.minX, y: BloodSugarManagementNotebookView.PostprandialBloodSugarPercent.frame.maxY + 20, width: BloodSugarManagementNotebookView.GlycatedHemoglobin.frame.size.width / 2.5, height: BloodSugarManagementNotebookView.GlycatedHemoglobin.frame.size.height / 2.2))
//        BloodSugarManagementNotebookView.GlycatedHemoglobinGraph.backgroundColor = .yellow
////        BloodSugarManagementNotebookView.FastingBloodSugar.layer.borderWidth = 1
////        BloodSugarManagementNotebookView.FastingBloodSugar.layer.cornerRadius = 8
//        BloodSugarManagementNotebookView.GlycatedHemoglobin.addSubview(BloodSugarManagementNotebookView.GlycatedHemoglobinGraph)
//        
//        var saveData = UILabel(frame: CGRect(x: 20, y: BloodSugarManagementNotebookView.GlycatedHemoglobin.frame.maxY + 30, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 12))
//        saveData.text = "측정하신 혈당을 입력해주세요."
//        saveData.font = UIFont.systemFont(ofSize: 22)
//        
//        scrollView.addSubview(saveData)
//        
//        
//        var saveView: UIView!
//        
////        var afterBTN: UIButton!
////        var beforeBTN: UIButton!
////        var bloodTF: UITextField!
////        var glycated: UITextField!
//        
//        saveView = UIView(frame: CGRect(x: 20, y: saveData.frame.maxY + 10, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 3))
//        saveView.backgroundColor = .white
////        saveView.layer.borderWidth = 1
//        saveView.layer.cornerRadius = 8
//        scrollView.addSubview(saveView)
//        
//        var dateView = UIView(frame: CGRect(x: 10, y: 5, width: saveView.frame.size.width - 20, height: self.view.frame.size.height / 14))
//        dateView.backgroundColor = .white
//        
//        saveView.addSubview(dateView)
//        
//        var dateViewLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 60, height: dateView.frame.height))
//        dateViewLabel.text = "일시"
//        dateView.addSubview(dateViewLabel)
//        
////        date = UILabel(frame: CGRect(x: dateViewLabel.frame.maxX + 50, y: dateViewLabel.frame.minY, width: 200, height: dateView.frame.height))
////        date.text = Date()
//
//        var time = Date()
//        var formatter = DateFormatter()
//        formatter.dateFormat = "MM dd yyyy, h:mm:ss a"
//        let formattedDateInString = formatter.string(from: time)
//
//        
//        
//        BloodSugarManagementNotebookView.dateLable = UILabel(frame: CGRect(x: dateViewLabel.frame.maxX + 130, y: dateViewLabel.frame.minY, width: 200, height: dateView.frame.height))
//        BloodSugarManagementNotebookView.dateLable.text = formattedDateInString
//        
//        
//        dateView.addSubview(BloodSugarManagementNotebookView.dateLable)
//        
//        var eatView = UIView(frame: CGRect(x: 10, y: dateView.frame.maxY, width: saveView.frame.size.width - 20, height: self.view.frame.size.height / 14))
//        eatView.backgroundColor = .white
//        
//        saveView.addSubview(eatView)
//        
//        var eatVLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 80, height: dateView.frame.height))
//        eatVLabel.text = "식사 상태"
//        eatView.addSubview(eatVLabel)
//        
//        var bloodSugarView = UIView(frame: CGRect(x: 10, y: eatView.frame.maxY, width: saveView.frame.size.width - 20, height: self.view.frame.size.height / 14))
//        bloodSugarView.backgroundColor = .white
//        
//        saveView.addSubview(bloodSugarView)
//        
//        var bloodSugarLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 80, height: dateView.frame.height))
//        bloodSugarLabel.text = "혈당"
//        bloodSugarView.addSubview(bloodSugarLabel)
//        
//        var gyView = UIView(frame: CGRect(x: 10, y: bloodSugarView.frame.maxY, width: saveView.frame.size.width - 20, height: self.view.frame.size.height / 14))
//        gyView.backgroundColor = .white
//        
//        saveView.addSubview(gyView)
//        
//        var gyLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 80, height: dateView.frame.height))
//        gyLabel.text = "당화혈색소"
//        gyView.addSubview(gyLabel)
//        
//        let cancelBTN = UIButton(frame: CGRect(x: 0, y: saveView.frame.maxY + 10, width: self.view.frame.size.width / 2, height: self.view.frame.size.height / 12))
//        cancelBTN.setTitle("취소", for: .normal)
//        cancelBTN.backgroundColor = .yellow
//        scrollView.addSubview(cancelBTN)
//        
//        let saveBTN = UIButton(frame: CGRect(x: cancelBTN.frame.maxX, y: saveView.frame.maxY + 10, width: self.view.frame.size.width / 2, height: self.view.frame.size.height / 12))
//        saveBTN.setTitle("저장", for: .normal)
//        saveBTN.backgroundColor = .blue
//        scrollView.addSubview(saveBTN)
//        
//        
//        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: menuView.frame.maxY).isActive = true
//        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//        scrollView.bottomAnchor.constraint(equalTo: saveBTN.bottomAnchor, constant: 50).isActive = true
//        
//        
//        //--------------
//        BloodSugarRecordsView = KSR_2024.BloodSugarRecordsView(frame: CGRect(x: 0, y: scrollView.frame.minY, width: SCREEN.WIDTH, height: scrollView.frame.height))
//        BloodSugarRecordsView.backgroundColor = .yellow
//        BloodSugarManagementNotebookView.addSubview(BloodSugarRecordsView)
//        
//        
//        
//        BloodSugarRecordsView.test = UIView(frame: CGRect(x: 0, y: scrollView.frame.minY, width: 500, height: self.view.frame.height))
//        BloodSugarRecordsView.test.backgroundColor = .white
//        
////        scrollView.addSubview(BloodSugarRecordsView.test)
//        
//        BloodSugarWebView.isHidden = true
//        BloodSugarManagementNotebookView.isHidden = false
//        bloodSugarListView.isHidden = true
//        
//        
//       
//        
//    }
//    
//        func dataUpdate(){
//    
//            guard let regNumString = userD.object(forKey: USER_KEY.KSR_REGISTRATION_NUMBER) as? String else {
//                toastShow(message: "reg_num is nil error")
//                return
//            }
//    
//            Server.getData(type: Server.InfoType.SUGAR_USER, otherInfo: ["reg_num":regNumString]) { (kData : Data?) in
//                if let data = kData {
//                    do {
//                        if let jsonDic = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String:String] {
//                            print("\(Server.InfoType.SUGAR_USER) : \n\(jsonDic)")
//    
//                            /*
//                             ["cnt1": "7", "seccess2": "0", "cnt3": "7", "seccess3": "0", "cnt2": "1", "result": "7", "seccess1": "3"]
//                             */
//    
//                            let seccess1 = jsonDic["seccess1"] ?? ""
//                            let seccess2 = jsonDic["seccess2"] ?? ""
//                            let seccess3 = jsonDic["seccess3"] ?? ""
//    
//                            let successValue1 = Int(seccess1, radix: 10)
//                            let successValue2 = Int(seccess2, radix: 10)
//                            let successValue3 = Int(seccess3, radix: 10)
//    
//                            let cnt1 = jsonDic["cnt1"] ?? ""
//                            let cnt2 = jsonDic["cnt2"] ?? ""
//                            let cnt3 = jsonDic["cnt3"] ?? ""
//    
//                            let cntValue1 = Int(cnt1, radix: 10)
//                            let cntValue2 = Int(cnt2, radix: 10)
//                            let cntValue3 = Int(cnt3, radix: 10)
//    
//                            if let success = successValue1 , let cnt = cntValue1 {
//                                let persent : Int
//                                if cnt != 0 {
//                                    persent = Int(round((Double(success) / Double(cnt)) * 100))
//                                }else{
//                                    persent = 0
//                                }
////                                self.bloodSugarNoteView.bloodSugarGoalAndRateView.rateView.valueLabelUpdate(labelIndex: 0, valueString: " \(persent) ", unitString: "%")
//                                self.bloodSugarListView.dataScrollView.rateView.valueLabelUpdate(labelIndex: 0, valueString: " \(persent) ", unitString: "%")
//                                self.bloodSugarListView.graphScrollView.rateView.valueLabelUpdate(labelIndex: 0, valueString: " \(persent) ", unitString: "%")
//                            }
//    
//                            if let success = successValue2 , let cnt = cntValue2 {
//                                let persent : Int
//                                if cnt != 0 {
//                                    //?/
//                                    print("success : \(success)")
//                                    print("cnt : \(cnt)")
//                                    persent = Int(round((Double(success) / Double(cnt)) * 100))
//                                }else{
//                                    persent = 0
//                                }
////                                self.bloodSugarNoteView.bloodSugarGoalAndRateView.rateView.valueLabelUpdate(labelIndex: 1, valueString: " \(persent) ", unitString: "%")
//                                self.bloodSugarListView.dataScrollView.rateView.valueLabelUpdate(labelIndex: 1, valueString: " \(persent) ", unitString: "%")
//                                self.bloodSugarListView.graphScrollView.rateView.valueLabelUpdate(labelIndex: 1, valueString: " \(persent) ", unitString: "%")
//                            }
//    
//    
//    
//                            if let success = successValue3 , let cnt = cntValue3 {
//                                let persent : Int
//                                if cnt != 0 {
//                                    persent = Int(round((Double(success) / Double(cnt)) * 100))
//                                }else{
//                                    persent = 0
//                                }
////                                self.bloodSugarNoteView.bloodSugarGoalAndRateView.rateView.valueLabelUpdate(labelIndex: 2, valueString: " \(persent) ", unitString: "%")
//                                self.bloodSugarListView.dataScrollView.rateView.valueLabelUpdate(labelIndex: 2, valueString: " \(persent) ", unitString: "%")
//                                self.bloodSugarListView.graphScrollView.rateView.valueLabelUpdate(labelIndex: 2, valueString: " \(persent) ", unitString: "%")
//                            }
//    
//    
//    
//    
//    
//    
//    
//    //                        self.bloodSugarNoteView.//?/
//    
//                        }
//                    }catch {
//                        print("error:\(error.localizedDescription)")
//                    }
//                }
//            }
//    
//    
//    
//        }
//
//
//    
//    @objc func rightButton2PressedList(_ button: UIButton) {
//        self.bloodSugarListView.graphScrollView.isHidden = true
//        self.bloodSugarListView.dataScrollView.isHidden = false
//
//        self.bloodSugarListView.dataScrollView.dataUpdate()
//    }
//    
//    @objc func rightButton2PressedGraph(_ button: UIButton) {
//        
//        self.bloodSugarListView.graphScrollView.isHidden = false
//        self.bloodSugarListView.dataScrollView.isHidden = true
//
////        self.bloodSugarListView.graphScrollView.dataUpdate(index: 1)
//        
//        
//    }
//    
//    func animate()
//      {
//        let slayer = CAShapeLayer()
//          let center = CGPoint(x: (BloodSugarManagementNotebookView.FastingBloodSugarGraph.frame.width / 2) + 4, y: BloodSugarManagementNotebookView.FastingBloodSugarGraph.frame.height - 8)
//          let radius: CGFloat = BloodSugarManagementNotebookView.FastingBloodSugarGraph.frame.height - 16
//        let startAngle: CGFloat = 4 * .pi / 4
//        let endAngle: CGFloat = 0.0
//        slayer.path = UIBezierPath(arcCenter: center,
//                                 radius: radius,
//                                 startAngle: startAngle,
//                                 endAngle: endAngle,
//                                 clockwise: true).cgPath
//        slayer.lineWidth = 15.0
//          slayer.lineCap = CAShapeLayerLineCap.round
//        slayer.strokeColor = UIColor.blue.cgColor
//        slayer.fillColor = UIColor.clear.cgColor
//          BloodSugarManagementNotebookView.FastingBloodSugarGraph.layer.addSublayer(slayer)
//        slayer.strokeEnd = 0.0
//
//        let animation = CABasicAnimation(keyPath: "strokeEnd")
//        animation.duration = 60.0   //Customize the time of your animation here.
//        animation.fromValue = 0.0
//        animation.toValue = 1.0
//        animation.timingFunction = CAMediaTimingFunction(name:
//                                                            CAMediaTimingFunctionName.linear)
//        slayer.strokeEnd = 1.0
//        slayer.add(animation, forKey: nil)
//      }
//    
//    
//    
//    @objc func segButtonPressed(_ sender: UIButton) {
//print("tab")
//        self.view.endEditing(true)
//        
//        if sender.tag == 0 {
//            BloodSugarWebView.isHidden = false
//            BloodSugarManagementNotebookView.isHidden = true
//            bloodSugarListView.isHidden = true
//        } else if sender.tag == 1 {
//            BloodSugarWebView.isHidden = true
//            BloodSugarManagementNotebookView.isHidden = false
//            bloodSugarListView.isHidden = true
//        } else if sender.tag == 2 {
//            BloodSugarWebView.isHidden = true
//            BloodSugarManagementNotebookView.isHidden = true
//            bloodSugarListView.isHidden = false
//        }
//    }
//    
//    
//}
//import UIKit
//
//class BloodSugarViewController2: BaseViewController {
//    
//    var BloodSugarWebView : WebView!
//    var BloodSugarManagementNotebookView : BloodSugarManagementNotebookView!
//    var BloodSugarRecordsView : BloodSugarRecordsView!
//    
//        var bloodSugarListView : BloodSugarListView!
//    
//    var testBtn1: UIButton!
//    var testBtn2: UIButton!
//    
//    var show: UILabel!
//    var random: CGFloat!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        label1.text = "혈당관리\n도움말"
//        label2.text = "혈당\n관리수첩"
//        label3.text = "혈당\n기록보기"
//        
//        self.BloodSugarWebView = WebView(frame: CGRect(
//            x: 0,
//            y: menuView.frame.maxY,
//            width: SCREEN.WIDTH,
//            height: SCREEN.HEIGHT - menuView.frame.maxY), urlString: URL_Addres.what_is_diabetes)
//        
//        BloodSugarManagementNotebookView = KSR_2024.BloodSugarManagementNotebookView(frame: CGRect(x: 0, y: scrollView.frame.minY, width: SCREEN.WIDTH, height: scrollView.frame.height))
//        BloodSugarManagementNotebookView.backgroundColor = .white
//        scrollView.addSubview(BloodSugarManagementNotebookView)
//        
//        
//        
//        
//        self.view.addSubview(self.BloodSugarWebView)
//        
//        
//        self.bloodSugarListView = BloodSugarListView(frame: CGRect(
//                    x: 0,
//                    y: menuView.frame.maxY,
//                    width: SCREEN.WIDTH,
//                    height: SCREEN.HEIGHT - menuView.frame.maxY - SAFE_AREA))
//        
//        self.bloodSugarListView.backgroundColor = .white
//                self.view.addSubview(self.bloodSugarListView)
//        
////                self.segView.itemButtonPressed(button: self.segView.itemButtons[1])
//        //        self.segButtonPressed(index: 0)
//        
//                self.dataUpdate()
//        
//        testBtn1 = UIButton(frame: CGRect(x: SCREEN.WIDTH / 2, y: 20, width: 100, height: 60))
//        testBtn1.setTitle("리스트보기", for: .normal)
//        testBtn1.setTitleColor(.black, for: .normal)
//        testBtn1.layer.borderWidth = 1
//        bloodSugarListView.addSubview(testBtn1)
//        testBtn1.addTarget(self, action: #selector(rightButton2PressedList(_ :)), for: .touchUpInside)
//        
//        
//        testBtn2 = UIButton(frame: CGRect(x: testBtn1.frame.maxX + 5, y: 20, width: 100, height: 60))
//        testBtn2.setTitle("그래프보기", for: .normal)
//        testBtn2.setTitleColor(.black, for: .normal)
//        testBtn2.layer.borderWidth = 1
//        bloodSugarListView.addSubview(testBtn2)
//        testBtn2.addTarget(self, action: #selector(rightButton2PressedGraph(_ :)), for: .touchUpInside)
//        
//        
//        
//        buttons = [button1, button2, button3]
//        
//        self.buttons.forEach {
//            $0.addTarget(self, action: #selector(segButtonPressed(_ :)), for: .touchUpInside)
//        }
//        
//        BloodSugarManagementNotebookView.FastingBloodSugar = UIView(frame: CGRect(x: 20, y: scrollView.frame.minY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 5))
//        BloodSugarManagementNotebookView.FastingBloodSugar.backgroundColor = #colorLiteral(red: 0.002579513937, green: 0.765566349, blue: 0.8613703847, alpha: 1)
////        BloodSugarManagementNotebookView.FastingBloodSugar.layer.borderWidth = 1
//        BloodSugarManagementNotebookView.FastingBloodSugar.layer.cornerRadius = 8
//        
//        scrollView.addSubview(BloodSugarManagementNotebookView.FastingBloodSugar)
//        
//        BloodSugarManagementNotebookView.FastingBloodSugarLabel = UILabel(frame: CGRect(x: 30, y: 25, width: BloodSugarManagementNotebookView.FastingBloodSugar.frame.size.width / 2.5, height: BloodSugarManagementNotebookView.FastingBloodSugar.frame.size.height / 6))
//        BloodSugarManagementNotebookView.FastingBloodSugarLabel.text = "나의 혈압 목표 수치는?"
//        BloodSugarManagementNotebookView.FastingBloodSugarLabel.textAlignment = .center
//        BloodSugarManagementNotebookView.FastingBloodSugarLabel.font = UIFont.systemFont(ofSize: 16)
//        BloodSugarManagementNotebookView.FastingBloodSugarLabel.textColor = .white
//        BloodSugarManagementNotebookView.FastingBloodSugar.addSubview(BloodSugarManagementNotebookView.FastingBloodSugarLabel)
//        
//        BloodSugarManagementNotebookView.FastingBloodSugarShowLabel = UILabel(frame: CGRect(x: 30, y: BloodSugarManagementNotebookView.FastingBloodSugarLabel.frame.maxY + 20, width: BloodSugarManagementNotebookView.FastingBloodSugar.frame.size.width / 2.5, height: BloodSugarManagementNotebookView.FastingBloodSugar.frame.size.height / 6))
//     BloodSugarManagementNotebookView.FastingBloodSugarShowLabel.text = "금식혈당\n(Fasting glucose)"
//        BloodSugarManagementNotebookView.FastingBloodSugarShowLabel.textAlignment = .center
//        BloodSugarManagementNotebookView.FastingBloodSugarShowLabel.numberOfLines = 0
//        BloodSugarManagementNotebookView.FastingBloodSugarShowLabel.font = UIFont.systemFont(ofSize: 12)
//        BloodSugarManagementNotebookView.FastingBloodSugarShowLabel.textColor = .white
//        BloodSugarManagementNotebookView.FastingBloodSugar.addSubview(BloodSugarManagementNotebookView.FastingBloodSugarShowLabel)
//        
//        BloodSugarManagementNotebookView.FastingBloodSugarShowNumLabel = UILabel(frame: CGRect(x: 30, y: BloodSugarManagementNotebookView.FastingBloodSugarShowLabel.frame.maxY + 20, width: BloodSugarManagementNotebookView.FastingBloodSugar.frame.size.width / 2.5, height: BloodSugarManagementNotebookView.FastingBloodSugar.frame.size.height / 6))
//     BloodSugarManagementNotebookView.FastingBloodSugarShowNumLabel.text = "120mg/dL 이하"
//        BloodSugarManagementNotebookView.FastingBloodSugarShowNumLabel.textAlignment = .center
//        BloodSugarManagementNotebookView.FastingBloodSugarShowNumLabel.font = UIFont.systemFont(ofSize: 16)
//        BloodSugarManagementNotebookView.FastingBloodSugarShowNumLabel.textColor = .white
//        BloodSugarManagementNotebookView.FastingBloodSugar.addSubview(BloodSugarManagementNotebookView.FastingBloodSugarShowNumLabel)
//        
//        BloodSugarManagementNotebookView.FastingBloodSugarPercent = UILabel(frame: CGRect(x: BloodSugarManagementNotebookView.FastingBloodSugarLabel.frame.maxX + 20, y: 25, width: BloodSugarManagementNotebookView.FastingBloodSugar.frame.size.width / 2.5, height: BloodSugarManagementNotebookView.FastingBloodSugar.frame.size.height / 6))
//        BloodSugarManagementNotebookView.FastingBloodSugarPercent.text = "목표 수치 달성율은?"
//        BloodSugarManagementNotebookView.FastingBloodSugarPercent.textAlignment = .center
//        BloodSugarManagementNotebookView.FastingBloodSugarPercent.font = UIFont.systemFont(ofSize: 16)
//        BloodSugarManagementNotebookView.FastingBloodSugarPercent.textColor = .white
//        BloodSugarManagementNotebookView.FastingBloodSugar.addSubview(BloodSugarManagementNotebookView.FastingBloodSugarPercent)
//        
//        BloodSugarManagementNotebookView.FastingBloodSugarGraph = UIView(frame: CGRect(x: BloodSugarManagementNotebookView.FastingBloodSugarPercent.frame.minX, y: BloodSugarManagementNotebookView.FastingBloodSugarPercent.frame.maxY + 20, width: BloodSugarManagementNotebookView.FastingBloodSugar.frame.size.width / 2.5, height: BloodSugarManagementNotebookView.FastingBloodSugar.frame.size.height / 2.2))
//        BloodSugarManagementNotebookView.FastingBloodSugarGraph.backgroundColor = .clear
////        BloodSugarManagementNotebookView.FastingBloodSugar.layer.borderWidth = 1
////        BloodSugarManagementNotebookView.FastingBloodSugar.layer.cornerRadius = 8
//        BloodSugarManagementNotebookView.FastingBloodSugar.addSubview(BloodSugarManagementNotebookView.FastingBloodSugarGraph)
//        
//        
//        
////        let slayer = CAShapeLayer()
////        let center = CGPoint(x: (BloodSugarManagementNotebookView.FastingBloodSugarGraph.frame.width / 2) + 4, y: BloodSugarManagementNotebookView.FastingBloodSugarGraph.frame.height - 8)
////         let radius: CGFloat = BloodSugarManagementNotebookView.FastingBloodSugarGraph.frame.height - 16
////         let startAngle: CGFloat = 4 * .pi / 4
////         let endAngle: CGFloat = 0.0
////         slayer.path = UIBezierPath(arcCenter: center,
////                                       radius: radius,
////                                       startAngle: startAngle,
////                                       endAngle: endAngle,
////                                       clockwise: true).cgPath
////         slayer.lineWidth = 15.0
////        slayer.lineCap = CAShapeLayerLineCap.round
////         slayer.strokeColor = UIColor.blue.cgColor
////         slayer.fillColor = UIColor.clear.cgColor
//////         self.layer.addSublayer(slayer)
////        BloodSugarManagementNotebookView.FastingBloodSugarGraph.layer.addSublayer(slayer)
//        
//        animate()
//        
//        
//        
//        BloodSugarManagementNotebookView.PostprandialBloodSugar = UIView(frame: CGRect(x: 20, y: BloodSugarManagementNotebookView.FastingBloodSugar.frame.maxY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 5))
//        BloodSugarManagementNotebookView.PostprandialBloodSugar.backgroundColor = #colorLiteral(red: 0.009351861663, green: 0.4616524577, blue: 0.943269372, alpha: 1)
////        BloodSugarManagementNotebookView.FastingBloodSugar.layer.borderWidth = 1
//        BloodSugarManagementNotebookView.PostprandialBloodSugar.layer.cornerRadius = 8
//        scrollView.addSubview(BloodSugarManagementNotebookView.PostprandialBloodSugar)
//        
//        BloodSugarManagementNotebookView.PostprandialBloodSugarLabel = UILabel(frame: CGRect(x: 30, y: 25, width: BloodSugarManagementNotebookView.PostprandialBloodSugar.frame.size.width / 2.5, height: BloodSugarManagementNotebookView.PostprandialBloodSugar.frame.size.height / 6))
//        BloodSugarManagementNotebookView.PostprandialBloodSugarLabel.text = "나의 혈압 목표 수치는?"
//        BloodSugarManagementNotebookView.PostprandialBloodSugarLabel.textAlignment = .center
//        BloodSugarManagementNotebookView.PostprandialBloodSugarLabel.font = UIFont.systemFont(ofSize: 16)
//        BloodSugarManagementNotebookView.PostprandialBloodSugarLabel.textColor = .white
//        BloodSugarManagementNotebookView.PostprandialBloodSugar.addSubview(BloodSugarManagementNotebookView.PostprandialBloodSugarLabel)
//        
//        BloodSugarManagementNotebookView.PostprandialBloodSugarShowLabel = UILabel(frame: CGRect(x: 30, y: BloodSugarManagementNotebookView.PostprandialBloodSugarLabel.frame.maxY + 20, width: BloodSugarManagementNotebookView.PostprandialBloodSugar.frame.size.width / 2.5, height: BloodSugarManagementNotebookView.PostprandialBloodSugar.frame.size.height / 6))
//     BloodSugarManagementNotebookView.PostprandialBloodSugarShowLabel.text = "식수혈당\n(Postprandial glucose)"
//        BloodSugarManagementNotebookView.PostprandialBloodSugarShowLabel.textAlignment = .center
//        BloodSugarManagementNotebookView.PostprandialBloodSugarShowLabel.numberOfLines = 0
//        BloodSugarManagementNotebookView.PostprandialBloodSugarShowLabel.font = UIFont.systemFont(ofSize: 12)
//        BloodSugarManagementNotebookView.PostprandialBloodSugarShowLabel.textColor = .white
//        BloodSugarManagementNotebookView.PostprandialBloodSugar.addSubview(BloodSugarManagementNotebookView.PostprandialBloodSugarShowLabel)
//        
//        BloodSugarManagementNotebookView.PostprandialBloodSugarShowNumLabel = UILabel(frame: CGRect(x: 30, y: BloodSugarManagementNotebookView.PostprandialBloodSugarShowLabel.frame.maxY + 20, width: BloodSugarManagementNotebookView.PostprandialBloodSugar.frame.size.width / 2.5, height: BloodSugarManagementNotebookView.PostprandialBloodSugar.frame.size.height / 6))
//     BloodSugarManagementNotebookView.PostprandialBloodSugarShowNumLabel.text = "220mg/dL 이하"
//        BloodSugarManagementNotebookView.PostprandialBloodSugarShowNumLabel.textAlignment = .center
//        BloodSugarManagementNotebookView.PostprandialBloodSugarShowNumLabel.font = UIFont.systemFont(ofSize: 16)
//        BloodSugarManagementNotebookView.PostprandialBloodSugarShowNumLabel.textColor = .white
//        BloodSugarManagementNotebookView.PostprandialBloodSugar.addSubview(BloodSugarManagementNotebookView.PostprandialBloodSugarShowNumLabel)
//        
//        BloodSugarManagementNotebookView.PostprandialBloodSugarPercent = UILabel(frame: CGRect(x: BloodSugarManagementNotebookView.PostprandialBloodSugarShowNumLabel.frame.maxX + 20, y: 25, width: BloodSugarManagementNotebookView.PostprandialBloodSugar.frame.size.width / 2.5, height: BloodSugarManagementNotebookView.PostprandialBloodSugar.frame.size.height / 6))
//        BloodSugarManagementNotebookView.PostprandialBloodSugarPercent.text = "목표 수치 달성율은?"
//        BloodSugarManagementNotebookView.PostprandialBloodSugarPercent.textAlignment = .center
//        BloodSugarManagementNotebookView.PostprandialBloodSugarPercent.font = UIFont.systemFont(ofSize: 16)
//        BloodSugarManagementNotebookView.PostprandialBloodSugarPercent.textColor = .white
//        BloodSugarManagementNotebookView.PostprandialBloodSugar.addSubview(BloodSugarManagementNotebookView.PostprandialBloodSugarPercent)
//        
//        BloodSugarManagementNotebookView.PostprandialBloodSugarGraph = UIView(frame: CGRect(x: BloodSugarManagementNotebookView.PostprandialBloodSugarPercent.frame.minX, y: BloodSugarManagementNotebookView.PostprandialBloodSugarPercent.frame.maxY + 20, width: BloodSugarManagementNotebookView.PostprandialBloodSugar.frame.size.width / 2.5, height: BloodSugarManagementNotebookView.PostprandialBloodSugar.frame.size.height / 2.2))
//        BloodSugarManagementNotebookView.PostprandialBloodSugarGraph.backgroundColor = .clear
////        BloodSugarManagementNotebookView.FastingBloodSugar.layer.borderWidth = 1
////        BloodSugarManagementNotebookView.FastingBloodSugar.layer.cornerRadius = 8
//        BloodSugarManagementNotebookView.PostprandialBloodSugar.addSubview(BloodSugarManagementNotebookView.PostprandialBloodSugarGraph)
//        
//        animate2()
//     
//       
//        BloodSugarManagementNotebookView.GlycatedHemoglobin = UIView(frame: CGRect(x: 20, y: BloodSugarManagementNotebookView.PostprandialBloodSugar.frame.maxY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 5))
//        BloodSugarManagementNotebookView.GlycatedHemoglobin.backgroundColor = #colorLiteral(red: 0.4349892437, green: 0.1282797456, blue: 0.8903027177, alpha: 1)
////        BloodSugarManagementNotebookView.FastingBloodSugar.layer.borderWidth = 1
//        BloodSugarManagementNotebookView.GlycatedHemoglobin.layer.cornerRadius = 8
//        scrollView.addSubview(BloodSugarManagementNotebookView.GlycatedHemoglobin)
//        
//        BloodSugarManagementNotebookView.GlycatedHemoglobinLabel = UILabel(frame: CGRect(x: 30, y: 25, width: BloodSugarManagementNotebookView.GlycatedHemoglobin.frame.size.width / 2.5, height: BloodSugarManagementNotebookView.GlycatedHemoglobin.frame.size.height / 6))
//        BloodSugarManagementNotebookView.GlycatedHemoglobinLabel.text = "나의 혈압 목표 수치는?"
//        BloodSugarManagementNotebookView.GlycatedHemoglobinLabel.textAlignment = .center
//        BloodSugarManagementNotebookView.GlycatedHemoglobinLabel.font = UIFont.systemFont(ofSize: 16)
//        BloodSugarManagementNotebookView.GlycatedHemoglobinLabel.textColor = .white
//        BloodSugarManagementNotebookView.GlycatedHemoglobin.addSubview(BloodSugarManagementNotebookView.GlycatedHemoglobinLabel)
//        
//        BloodSugarManagementNotebookView.GlycatedHemoglobinShowLabel = UILabel(frame: CGRect(x: 30, y: BloodSugarManagementNotebookView.GlycatedHemoglobinLabel.frame.maxY + 20, width: BloodSugarManagementNotebookView.GlycatedHemoglobin.frame.size.width / 2.5, height: BloodSugarManagementNotebookView.GlycatedHemoglobin.frame.size.height / 6))
//     BloodSugarManagementNotebookView.GlycatedHemoglobinShowLabel.text = "식수혈당\n(Postprandial glucose)"
//        BloodSugarManagementNotebookView.GlycatedHemoglobinShowLabel.textAlignment = .center
//        BloodSugarManagementNotebookView.GlycatedHemoglobinShowLabel.numberOfLines = 0
//        BloodSugarManagementNotebookView.GlycatedHemoglobinShowLabel.font = UIFont.systemFont(ofSize: 12)
//        BloodSugarManagementNotebookView.GlycatedHemoglobinShowLabel.textColor = .white
//        BloodSugarManagementNotebookView.GlycatedHemoglobin.addSubview(BloodSugarManagementNotebookView.GlycatedHemoglobinShowLabel)
//        
//        BloodSugarManagementNotebookView.GlycatedHemoglobinShowNumLabel = UILabel(frame: CGRect(x: 30, y: BloodSugarManagementNotebookView.GlycatedHemoglobinShowLabel.frame.maxY + 20, width: BloodSugarManagementNotebookView.GlycatedHemoglobin.frame.size.width / 2.5, height: BloodSugarManagementNotebookView.GlycatedHemoglobin.frame.size.height / 6))
//     BloodSugarManagementNotebookView.GlycatedHemoglobinShowNumLabel.text = "220mg/dL 이하"
//        BloodSugarManagementNotebookView.GlycatedHemoglobinShowNumLabel.textAlignment = .center
//        BloodSugarManagementNotebookView.GlycatedHemoglobinShowNumLabel.font = UIFont.systemFont(ofSize: 16)
//        BloodSugarManagementNotebookView.GlycatedHemoglobinShowNumLabel.textColor = .white
//        BloodSugarManagementNotebookView.GlycatedHemoglobin.addSubview(BloodSugarManagementNotebookView.GlycatedHemoglobinShowNumLabel)
//        
//        BloodSugarManagementNotebookView.GlycatedHemoglobinPercent = UILabel(frame: CGRect(x: BloodSugarManagementNotebookView.GlycatedHemoglobinShowNumLabel.frame.maxX + 20, y: 25, width: BloodSugarManagementNotebookView.GlycatedHemoglobin.frame.size.width / 2.5, height: BloodSugarManagementNotebookView.GlycatedHemoglobin.frame.size.height / 6))
//        BloodSugarManagementNotebookView.GlycatedHemoglobinPercent.text = "목표 수치 달성율은?"
//        BloodSugarManagementNotebookView.GlycatedHemoglobinPercent.textAlignment = .center
//        BloodSugarManagementNotebookView.GlycatedHemoglobinPercent.font = UIFont.systemFont(ofSize: 16)
//        BloodSugarManagementNotebookView.GlycatedHemoglobinPercent.textColor = .white
//        BloodSugarManagementNotebookView.GlycatedHemoglobin.addSubview(BloodSugarManagementNotebookView.GlycatedHemoglobinPercent)
//        
//        BloodSugarManagementNotebookView.GlycatedHemoglobinGraph = UIView(frame: CGRect(x: BloodSugarManagementNotebookView.GlycatedHemoglobinPercent.frame.minX, y: BloodSugarManagementNotebookView.PostprandialBloodSugarPercent.frame.maxY + 20, width: BloodSugarManagementNotebookView.GlycatedHemoglobin.frame.size.width / 2.5, height: BloodSugarManagementNotebookView.GlycatedHemoglobin.frame.size.height / 2.2))
//        BloodSugarManagementNotebookView.GlycatedHemoglobinGraph.backgroundColor = .clear
////        BloodSugarManagementNotebookView.FastingBloodSugar.layer.borderWidth = 1
////        BloodSugarManagementNotebookView.FastingBloodSugar.layer.cornerRadius = 8
//        BloodSugarManagementNotebookView.GlycatedHemoglobin.addSubview(BloodSugarManagementNotebookView.GlycatedHemoglobinGraph)
//        
//        
//        animate3()
//        
//        var saveData = UILabel(frame: CGRect(x: 20, y: BloodSugarManagementNotebookView.GlycatedHemoglobin.frame.maxY + 30, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 12))
//        saveData.text = "측정하신 혈당을 입력해주세요."
//        saveData.font = UIFont.systemFont(ofSize: 22)
//        
//        scrollView.addSubview(saveData)
//        
//        
//        var saveView: UIView!
//        
////        var afterBTN: UIButton!
////        var beforeBTN: UIButton!
////        var bloodTF: UITextField!
////        var glycated: UITextField!
//        
//        saveView = UIView(frame: CGRect(x: 20, y: saveData.frame.maxY + 10, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 3))
//        saveView.backgroundColor = .white
////        saveView.layer.borderWidth = 1
//        saveView.layer.cornerRadius = 8
//        scrollView.addSubview(saveView)
//        
//        var dateView = UIView(frame: CGRect(x: 10, y: 5, width: saveView.frame.size.width - 20, height: self.view.frame.size.height / 14))
//        dateView.backgroundColor = .white
//        
//        saveView.addSubview(dateView)
//        
//        var dateViewLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 60, height: dateView.frame.height))
//        dateViewLabel.text = "일시"
//        dateView.addSubview(dateViewLabel)
//        
////        date = UILabel(frame: CGRect(x: dateViewLabel.frame.maxX + 50, y: dateViewLabel.frame.minY, width: 200, height: dateView.frame.height))
////        date.text = Date()
//
//        var time = Date()
//        var formatter = DateFormatter()
//        formatter.dateFormat = "MM dd yyyy, h:mm:ss a"
//        let formattedDateInString = formatter.string(from: time)
//
//        
//        
//        BloodSugarManagementNotebookView.dateLable = UILabel(frame: CGRect(x: dateViewLabel.frame.maxX + 130, y: dateViewLabel.frame.minY, width: 200, height: dateView.frame.height))
//        BloodSugarManagementNotebookView.dateLable.text = formattedDateInString
//        
//        
//        dateView.addSubview(BloodSugarManagementNotebookView.dateLable)
//        
//        var eatView = UIView(frame: CGRect(x: 10, y: dateView.frame.maxY, width: saveView.frame.size.width - 20, height: self.view.frame.size.height / 14))
//        eatView.backgroundColor = .white
//        
//        saveView.addSubview(eatView)
//        
//        var eatVLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 80, height: dateView.frame.height))
//        eatVLabel.text = "식사 상태"
//        eatView.addSubview(eatVLabel)
//        
//        var bloodSugarView = UIView(frame: CGRect(x: 10, y: eatView.frame.maxY, width: saveView.frame.size.width - 20, height: self.view.frame.size.height / 14))
//        bloodSugarView.backgroundColor = .white
//        
//        saveView.addSubview(bloodSugarView)
//        
//        var bloodSugarLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 80, height: dateView.frame.height))
//        bloodSugarLabel.text = "혈당"
//        bloodSugarView.addSubview(bloodSugarLabel)
//        
//        var gyView = UIView(frame: CGRect(x: 10, y: bloodSugarView.frame.maxY, width: saveView.frame.size.width - 20, height: self.view.frame.size.height / 14))
//        gyView.backgroundColor = .white
//        
//        saveView.addSubview(gyView)
//        
//        var gyLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 80, height: dateView.frame.height))
//        gyLabel.text = "당화혈색소"
//        gyView.addSubview(gyLabel)
//        
//        let cancelBTN = UIButton(frame: CGRect(x: 0, y: saveView.frame.maxY + 10, width: self.view.frame.size.width / 2, height: self.view.frame.size.height / 12))
//        cancelBTN.setTitle("취소", for: .normal)
//        cancelBTN.backgroundColor = .yellow
//        scrollView.addSubview(cancelBTN)
//        
//        let saveBTN = UIButton(frame: CGRect(x: cancelBTN.frame.maxX, y: saveView.frame.maxY + 10, width: self.view.frame.size.width / 2, height: self.view.frame.size.height / 12))
//        saveBTN.setTitle("저장", for: .normal)
//        saveBTN.backgroundColor = .blue
//        scrollView.addSubview(saveBTN)
//        
//        
//        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: menuView.frame.maxY).isActive = true
//        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//        scrollView.bottomAnchor.constraint(equalTo: saveBTN.bottomAnchor, constant: 50).isActive = true
//        
//        
//        //--------------
//        BloodSugarRecordsView = KSR_2024.BloodSugarRecordsView(frame: CGRect(x: 0, y: scrollView.frame.minY, width: SCREEN.WIDTH, height: scrollView.frame.height))
//        BloodSugarRecordsView.backgroundColor = .yellow
//        BloodSugarManagementNotebookView.addSubview(BloodSugarRecordsView)
//        
//        
//        
//        BloodSugarRecordsView.test = UIView(frame: CGRect(x: 0, y: scrollView.frame.minY, width: 500, height: self.view.frame.height))
//        BloodSugarRecordsView.test.backgroundColor = .white
//        
////        scrollView.addSubview(BloodSugarRecordsView.test)
//        
//        BloodSugarWebView.isHidden = true
//        BloodSugarManagementNotebookView.isHidden = false
//        bloodSugarListView.isHidden = true
//        
//        
//       
//        
//    }
//    
//        func dataUpdate(){
//    
//            guard let regNumString = userD.object(forKey: USER_KEY.KSR_REGISTRATION_NUMBER) as? String else {
//                toastShow(message: "reg_num is nil error")
//                return
//            }
//    
//            Server.getData(type: Server.InfoType.SUGAR_USER, otherInfo: ["reg_num":regNumString]) { (kData : Data?) in
//                if let data = kData {
//                    do {
//                        if let jsonDic = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String:String] {
//                            print("\(Server.InfoType.SUGAR_USER) : \n\(jsonDic)")
//    
//                            /*
//                             ["cnt1": "7", "seccess2": "0", "cnt3": "7", "seccess3": "0", "cnt2": "1", "result": "7", "seccess1": "3"]
//                             */
//    
//                            let seccess1 = jsonDic["seccess1"] ?? ""
//                            let seccess2 = jsonDic["seccess2"] ?? ""
//                            let seccess3 = jsonDic["seccess3"] ?? ""
//    
//                            let successValue1 = Int(seccess1, radix: 10)
//                            let successValue2 = Int(seccess2, radix: 10)
//                            let successValue3 = Int(seccess3, radix: 10)
//    
//                            let cnt1 = jsonDic["cnt1"] ?? ""
//                            let cnt2 = jsonDic["cnt2"] ?? ""
//                            let cnt3 = jsonDic["cnt3"] ?? ""
//    
//                            let cntValue1 = Int(cnt1, radix: 10)
//                            let cntValue2 = Int(cnt2, radix: 10)
//                            let cntValue3 = Int(cnt3, radix: 10)
//    
//                            if let success = successValue1 , let cnt = cntValue1 {
//                                let persent : Int
//                                if cnt != 0 {
//                                    persent = Int(round((Double(success) / Double(cnt)) * 100))
//                                }else{
//                                    persent = 0
//                                }
////                                self.bloodSugarNoteView.bloodSugarGoalAndRateView.rateView.valueLabelUpdate(labelIndex: 0, valueString: " \(persent) ", unitString: "%")
//                                self.bloodSugarListView.dataScrollView.rateView.valueLabelUpdate(labelIndex: 0, valueString: " \(persent) ", unitString: "%")
//                                self.bloodSugarListView.graphScrollView.rateView.valueLabelUpdate(labelIndex: 0, valueString: " \(persent) ", unitString: "%")
//                            }
//    
//                            if let success = successValue2 , let cnt = cntValue2 {
//                                let persent : Int
//                                if cnt != 0 {
//                                    //?/
//                                    print("success : \(success)")
//                                    print("cnt : \(cnt)")
//                                    persent = Int(round((Double(success) / Double(cnt)) * 100))
//                                }else{
//                                    persent = 0
//                                }
////                                self.bloodSugarNoteView.bloodSugarGoalAndRateView.rateView.valueLabelUpdate(labelIndex: 1, valueString: " \(persent) ", unitString: "%")
//                                self.bloodSugarListView.dataScrollView.rateView.valueLabelUpdate(labelIndex: 1, valueString: " \(persent) ", unitString: "%")
//                                self.bloodSugarListView.graphScrollView.rateView.valueLabelUpdate(labelIndex: 1, valueString: " \(persent) ", unitString: "%")
//                            }
//    
//    
//    
//                            if let success = successValue3 , let cnt = cntValue3 {
//                                let persent : Int
//                                if cnt != 0 {
//                                    persent = Int(round((Double(success) / Double(cnt)) * 100))
//                                }else{
//                                    persent = 0
//                                }
////                                self.bloodSugarNoteView.bloodSugarGoalAndRateView.rateView.valueLabelUpdate(labelIndex: 2, valueString: " \(persent) ", unitString: "%")
//                                self.bloodSugarListView.dataScrollView.rateView.valueLabelUpdate(labelIndex: 2, valueString: " \(persent) ", unitString: "%")
//                                self.bloodSugarListView.graphScrollView.rateView.valueLabelUpdate(labelIndex: 2, valueString: " \(persent) ", unitString: "%")
//                            }
//    
//    
//    
//    
//    
//    
//    
//    //                        self.bloodSugarNoteView.//?/
//    
//                        }
//                    }catch {
//                        print("error:\(error.localizedDescription)")
//                    }
//                }
//            }
//    
//    
//    
//        }
//
//
//    
//    @objc func rightButton2PressedList(_ button: UIButton) {
//        self.bloodSugarListView.graphScrollView.isHidden = true
//        self.bloodSugarListView.dataScrollView.isHidden = false
//
//        self.bloodSugarListView.dataScrollView.dataUpdate()
//    }
//    
//    @objc func rightButton2PressedGraph(_ button: UIButton) {
//        
//        self.bloodSugarListView.graphScrollView.isHidden = false
//        self.bloodSugarListView.dataScrollView.isHidden = true
//
////        self.bloodSugarListView.graphScrollView.dataUpdate(index: 1)
//        
//        
//    }
//    
//    func animate()
//      {
//          
//          random = CGFloat(arc4random_uniform(UInt32(101))) //between 0 and n-1
//          
//        let slayer = CAShapeLayer()
//          let center = CGPoint(x: (BloodSugarManagementNotebookView.FastingBloodSugarGraph.frame.width / 2) + 4, y: BloodSugarManagementNotebookView.FastingBloodSugarGraph.frame.height - 8)
//          let radius: CGFloat = BloodSugarManagementNotebookView.FastingBloodSugarGraph.frame.height - 16
//        let startAngle: CGFloat = 4 * .pi / 4
////        let endAngle: CGFloat = 0.0
//          
//          let endAngle: CGFloat = random / 180 * .pi * 2 - .pi
//          
//        slayer.path = UIBezierPath(arcCenter: center,
//                                 radius: radius,
//                                 startAngle: startAngle,
//                                 endAngle: endAngle,
////                                   endAngle: CGFloat = random / 180 * .pi * 2 - .pi,
//                                 clockwise: true).cgPath
//        slayer.lineWidth = 15.0
//          slayer.lineCap = CAShapeLayerLineCap.round
//          
//        slayer.strokeColor = UIColor.blue.cgColor
//        slayer.fillColor = UIColor.clear.cgColor
//          BloodSugarManagementNotebookView.FastingBloodSugarGraph.layer.addSublayer(slayer)
//        slayer.strokeEnd = 0.0
//
//        let animation = CABasicAnimation(keyPath: "strokeEnd")
//        animation.duration = 60.0   //Customize the time of your animation here.
//        animation.fromValue = 0.0
//        animation.toValue = 1.0
//        animation.timingFunction = CAMediaTimingFunction(name:
//                                                            CAMediaTimingFunctionName.linear)
//        slayer.strokeEnd = 1.0
//        slayer.add(animation, forKey: nil)
//          
//          
//          
//          
//          show = UILabel(frame: CGRect(x: 0, y: 0, width: 400, height: 30))
//          show.text = "\(random ?? 00)"
//          
//          BloodSugarManagementNotebookView.FastingBloodSugarGraph.addSubview(show)
//          
//          
//          
//      }
//    
//    func animate2()
//      {
//        let slayer = CAShapeLayer()
//          let center = CGPoint(x: (BloodSugarManagementNotebookView.FastingBloodSugarGraph.frame.width / 2) + 4, y: BloodSugarManagementNotebookView.FastingBloodSugarGraph.frame.height - 8)
//          let radius: CGFloat = BloodSugarManagementNotebookView.FastingBloodSugarGraph.frame.height - 16
//        let startAngle: CGFloat = 4 * .pi / 4
////        let endAngle: CGFloat = 0.0
//          
//          let endAngle: CGFloat = 15 / 180 * .pi * 2 - .pi
//        slayer.path = UIBezierPath(arcCenter: center,
//                                 radius: radius,
//                                 startAngle: startAngle,
//                                 endAngle: endAngle,
//                                 clockwise: true).cgPath
//        slayer.lineWidth = 15.0
//          slayer.lineCap = CAShapeLayerLineCap.round
//        slayer.strokeColor = UIColor.blue.cgColor
//        slayer.fillColor = UIColor.clear.cgColor
//          BloodSugarManagementNotebookView.PostprandialBloodSugarGraph.layer.addSublayer(slayer)
//        slayer.strokeEnd = 0.0
//
//        let animation = CABasicAnimation(keyPath: "strokeEnd")
//        animation.duration = 60.0   //Customize the time of your animation here.
//        animation.fromValue = 0.0
//        animation.toValue = 1.0
//        animation.timingFunction = CAMediaTimingFunction(name:
//                                                            CAMediaTimingFunctionName.linear)
//        slayer.strokeEnd = 1.0
//        slayer.add(animation, forKey: nil)
//      }
//    
//    func animate3()
//      {
//        let slayer = CAShapeLayer()
//          let center = CGPoint(x: (BloodSugarManagementNotebookView.FastingBloodSugarGraph.frame.width / 2) + 4, y: BloodSugarManagementNotebookView.FastingBloodSugarGraph.frame.height - 8)
//          let radius: CGFloat = BloodSugarManagementNotebookView.FastingBloodSugarGraph.frame.height - 16
//        let startAngle: CGFloat = 4 * .pi / 4
////        let endAngle: CGFloat = 0.0
//          
//          let endAngle: CGFloat = 15 / 180 * .pi * 2 - .pi
//        slayer.path = UIBezierPath(arcCenter: center,
//                                 radius: radius,
//                                 startAngle: startAngle,
//                                 endAngle: endAngle,
//                                 clockwise: true).cgPath
//        slayer.lineWidth = 15.0
//          slayer.lineCap = CAShapeLayerLineCap.round
//        slayer.strokeColor = UIColor.blue.cgColor
//        slayer.fillColor = UIColor.clear.cgColor
//          BloodSugarManagementNotebookView.GlycatedHemoglobinGraph.layer.addSublayer(slayer)
//        slayer.strokeEnd = 0.0
//
//        let animation = CABasicAnimation(keyPath: "strokeEnd")
//        animation.duration = 60.0   //Customize the time of your animation here.
//        animation.fromValue = 0.0
//        animation.toValue = 1.0
//        animation.timingFunction = CAMediaTimingFunction(name:
//                                                            CAMediaTimingFunctionName.linear)
//        slayer.strokeEnd = 1.0
//        slayer.add(animation, forKey: nil)
//      }
//    
//    
//    @objc func segButtonPressed(_ sender: UIButton) {
//print("tab")
//        self.view.endEditing(true)
//        
//        if sender.tag == 0 {
//            BloodSugarWebView.isHidden = false
//            BloodSugarManagementNotebookView.isHidden = true
//            bloodSugarListView.isHidden = true
//        } else if sender.tag == 1 {
//            BloodSugarWebView.isHidden = true
//            BloodSugarManagementNotebookView.isHidden = false
//            bloodSugarListView.isHidden = true
//        } else if sender.tag == 2 {
//            BloodSugarWebView.isHidden = true
//            BloodSugarManagementNotebookView.isHidden = true
//            bloodSugarListView.isHidden = false
//        }
//    }
//    
//    
//}


import Foundation
import UIKit

//class CircleView: UIView {
//
//    let borderWidth: CGFloat = 20
//
//    let startAngle = CGFloat(Double.pi)
//    let middleAngle = CGFloat(Double.pi + Double.pi / 2)
//    let endAngle = CGFloat(2 * Double.pi)
//    var primaryColor = UIColor.red
//    var secondaryColor = UIColor.blue
//    var currentStrokeValue = CGFloat(0)
//
//    override func draw(_ rect: CGRect) {
//        let center = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2)
//        let radius = CGFloat(self.frame.width / 2 - borderWidth)
//        let path1 = UIBezierPath(arcCenter: center, radius: radius, startAngle: startAngle, endAngle: middleAngle, clockwise: true)
//        let path2 = UIBezierPath(arcCenter: center, radius: radius, startAngle: middleAngle, endAngle: endAngle, clockwise: true)
//        path1.lineWidth = borderWidth
//        primaryColor.setStroke()
//        path1.stroke()
//        path2.lineWidth = borderWidth
//        secondaryColor.setStroke()
//        path2.stroke()
//    }
//
//}



class BloodSugarViewController2: BaseViewController, UITextFieldDelegate {
    
    var BloodSugarWebView : WebView!
    var BloodSugarManagementNotebookView : BloodSugarManagementNotebookView!
    var BloodSugarRecordsView : BloodSugarRecordsView!
    
        var bloodSugarListView : BloodSugarListView!
    
    var testBtn1: UIButton!
    var testBtn2: UIButton!
    
    var show: UILabel!
    var random: CGFloat!
    var showLabel: UILabel!
    
    var bloodSugarTF: UITextField!
    var glycatedHemoglobinTF: UITextField!
    
    var UnderBar: UIView!
    var titleName: UILabel!
    
    let hcpView = HalfCircleProgressView()
    let hcpView2 = HalfCircleProgressView2()
    let hcpView3 = HalfCircleProgressView3()
    
    let pctLabel = UILabel()
    
    var woman: UIButton!
    var man: UIButton!
    var arrBTN: [UIButton]!
    
    let datePicker = UIDatePicker()
    
    var changeTf: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        UnderBar = UIView(frame: CGRect(x: button2.center.x, y: naviBar.frame.maxY + 62, width: SCREEN.WIDTH / 8.8, height: 5))
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
        
        titleName = UILabel(frame: CGRect(x: self.view.frame.size.width / 2.2, y: 0, width: 150, height: naviBar.frame.height))
        //        titleName.text = titleLabel
        
        titleName.text = "혈당"
        titleName.textColor = .white
        titleName.font = UIFont(name: "SUITE-Regular", size: 20)
        
        naviBar.addSubview(titleName)
        
        label1.text = "혈당관리\n도움말"
        label1.font = UIFont(name: "SUITE-Regular", size: 14)
        label2.text = "혈당\n관리수첩"
        label2.font = UIFont(name: "SUITE-Regular", size: 14)
        label3.text = "혈당\n기록보기"
        label3.font = UIFont(name: "SUITE-Regular", size: 14)
        
        
        label1.textColor = .lightGray
        label2.textColor = .black
        label3.textColor = .lightGray
        
        
        self.BloodSugarWebView = WebView(frame: CGRect(
            x: 0,
            y: menuView.frame.maxY,
            width: SCREEN.WIDTH,
            height: SCREEN.HEIGHT - menuView.frame.maxY), urlString: URL_Addres.what_is_diabetes)
        
        BloodSugarManagementNotebookView = Smart_Stroke2024.BloodSugarManagementNotebookView(frame: CGRect(x: 0, y: scrollView.frame.minY, width: SCREEN.WIDTH, height: scrollView.frame.height))
        BloodSugarManagementNotebookView.backgroundColor = .white
        scrollView.addSubview(BloodSugarManagementNotebookView)
        
        
        
        
        self.view.addSubview(self.BloodSugarWebView)
        
        
        
        self.bloodSugarListView = BloodSugarListView(frame: CGRect(
            x: 0,
            y: menuView.frame.maxY,
            width: SCREEN.WIDTH,
            height: SCREEN.HEIGHT - menuView.frame.maxY))
        
        self.bloodSugarListView.backgroundColor = .yellow
        self.view.addSubview(self.bloodSugarListView)
        
        //                self.segView.itemButtonPressed(button: self.segView.itemButtons[1])
        //        self.segButtonPressed(index: 0)
        baseUnderBar.frame.origin = CGPoint(x: self.view.frame.size.width / 2.2, y: button2.frame.size.height - 2)
        self.dataUpdate()
        
        bloodSugarListView.backgroundColor = #colorLiteral(red: 0.9450935721, green: 0.9524920583, blue: 0.9736705422, alpha: 1)
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
        bloodSugarListView.addSubview(testBtn1)
        testBtn1.addTarget(self, action: #selector(rightButton2PressedList(_ :)), for: .touchUpInside)
        
        
        testBtn2 = UIButton(frame: CGRect(x: testBtn1.frame.maxX + 5, y: 20, width: 100, height: 50))
        testBtn2.setTitle("그래프보기", for: .normal)
        testBtn2.setTitleColor(#colorLiteral(red: 0.1406538188, green: 0.347869575, blue: 0.5851272941, alpha: 1), for: .normal)
        testBtn2.layer.borderWidth = 1
        testBtn2.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        testBtn2.layer.borderColor = #colorLiteral(red: 0.6836393476, green: 0.7600957155, blue: 0.8458803296, alpha: 1).cgColor
        testBtn2.layer.cornerRadius = 8
        bloodSugarListView.addSubview(testBtn2)
        testBtn2.addTarget(self, action: #selector(rightButton2PressedGraph(_ :)), for: .touchUpInside)
        
        
        
        
        BloodSugarManagementNotebookView.FastingBloodSugar = UIView(frame: CGRect(x: 20, y: scrollView.frame.minY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 4.5))
        
        if IS_IPHONE_N {
            BloodSugarManagementNotebookView.FastingBloodSugar = UIView(frame: CGRect(x: 20, y: scrollView.frame.minY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 4))        }
        
        if IS_IPHONE_N_PLUS {
            BloodSugarManagementNotebookView.FastingBloodSugar = UIView(frame: CGRect(x: 20, y: scrollView.frame.minY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 4))
        } 
        //        BloodSugarManagementNotebookView.FastingBloodSugar.backgroundColor = #colorLiteral(red: 0.002579513937, green: 0.765566349, blue: 0.8613703847, alpha: 1)
        BloodSugarManagementNotebookView.FastingBloodSugar.setGradient3(color1: UIColor(red: 0.0 / 255.0, green: 187 / 255.0, blue: 241.0 / 255.0, alpha: 1), color2: UIColor(red: 0.0 / 255.0, green: 200 / 255.0, blue: 207 / 255.0, alpha: 1))
        //        BloodSugarManagementNotebookView.FastingBloodSugar.layer.borderWidth = 1
        BloodSugarManagementNotebookView.FastingBloodSugar.layer.cornerRadius = 8
        
        scrollView.addSubview(BloodSugarManagementNotebookView.FastingBloodSugar)
        
        
        let strokeUnderBar = UIView(frame: CGRect(x: 0, y: BloodSugarManagementNotebookView.FastingBloodSugar.frame.minY, width: 1, height: BloodSugarManagementNotebookView.FastingBloodSugar.frame.size.height - 40))
strokeUnderBar.backgroundColor =  #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1).withAlphaComponent(0.8)
        strokeUnderBar.center.x = BloodSugarManagementNotebookView.FastingBloodSugar.frame.size.width / 2
        BloodSugarManagementNotebookView.FastingBloodSugar.addSubview(strokeUnderBar)
        
        
        BloodSugarManagementNotebookView.FastingBloodSugarLabel = UILabel(frame: CGRect(x: 20, y: 20, width: 140, height: BloodSugarManagementNotebookView.FastingBloodSugar.frame.size.height / 4))
        BloodSugarManagementNotebookView.FastingBloodSugarLabel.text = "나의 혈당\n목표 수치는?"
        //        BloodSugarManagementNotebookView.FastingBloodSugarLabel.numberOfLines = 0
        //        BloodSugarManagementNotebookView.FastingBloodSugarLabel.textAlignment = .center
        //        BloodSugarManagementNotebookView.FastingBloodSugarLabel.layer.borderWidth = 1
        //        BloodSugarManagementNotebookView.FastingBloodSugarLabel.font = UIFont.systemFont(ofSize: 20)
        
        //        if IS_IPHONE_12PRO_MAX {
        //            BloodSugarManagementNotebookView.FastingBloodSugarLabel.font = UIFont(name: "SUITE-Regular", size: 20)
        //        } else if IS_IPHONE_N_PLUS {
        //            BloodSugarManagementNotebookView.FastingBloodSugarLabel.font = UIFont(name: "SUITE-Regular", size: 17)
        //        } else if IS_IPHONE_X {
        //            BloodSugarManagementNotebookView.FastingBloodSugarLabel.font = UIFont(name: "SUITE-Regular", size: 15)
        //        } else {
        //            BloodSugarManagementNotebookView.FastingBloodSugarLabel.font = UIFont(name: "SUITE-Regular", size: 15)
        //        }
        //        BloodSugarManagementNotebookView.FastingBloodSugarLabel.numberOfLines = 0
        //        BloodSugarManagementNotebookView.FastingBloodSugarLabel.textAlignment = .center
        //
        //        BloodSugarManagementNotebookView.FastingBloodSugarLabel.textColor = .white
        //        BloodSugarManagementNotebookView.FastingBloodSugar.addSubview(BloodSugarManagementNotebookView.FastingBloodSugarLabel)
        //
        //        BloodSugarManagementNotebookView.FastingBloodSugarShowLabel = UILabel(frame: CGRect(x: 15, y: BloodSugarManagementNotebookView.FastingBloodSugarLabel.frame.maxY + 20, width: 150, height: BloodSugarManagementNotebookView.FastingBloodSugar.frame.size.height / 6))
        //     BloodSugarManagementNotebookView.FastingBloodSugarShowLabel.text = "금식혈당\n(Fasting glucose)"
        //
        //        if IS_IPHONE_12PRO_MAX {
        //            BloodSugarManagementNotebookView.FastingBloodSugarShowLabel.font = UIFont(name: "SUITE-Regular", size: 14)
        //        } else if IS_IPHONE_N_PLUS {
        //            BloodSugarManagementNotebookView.FastingBloodSugarShowLabel.font = UIFont(name: "SUITE-Regular", size: 11)
        //        } else if IS_IPHONE_X {
        //            BloodSugarManagementNotebookView.FastingBloodSugarShowLabel.font = UIFont(name: "SUITE-Regular", size: 11)
        //        } else {
        //            BloodSugarManagementNotebookView.FastingBloodSugarShowLabel.font = UIFont(name: "SUITE-Regular", size: 11)
        //        }
        //
        //        BloodSugarManagementNotebookView.FastingBloodSugarShowLabel.textAlignment = .center
        //        BloodSugarManagementNotebookView.FastingBloodSugarShowLabel.numberOfLines = 0
        //
        //
        //        BloodSugarManagementNotebookView.FastingBloodSugarShowLabel.textColor = .white
        //        BloodSugarManagementNotebookView.FastingBloodSugar.addSubview(BloodSugarManagementNotebookView.FastingBloodSugarShowLabel)
        //
        //        BloodSugarManagementNotebookView.FastingBloodSugarShowNumLabelNumber = UILabel(frame: CGRect(x: 40, y: BloodSugarManagementNotebookView.FastingBloodSugarShowLabel.frame.maxY + 20, width: 50, height: BloodSugarManagementNotebookView.FastingBloodSugar.frame.size.height / 6))
        //        BloodSugarManagementNotebookView.FastingBloodSugarShowNumLabelNumber.text = "120"
        //           BloodSugarManagementNotebookView.FastingBloodSugarShowNumLabelNumber.textAlignment = .right
        //
        //        BloodSugarManagementNotebookView.FastingBloodSugarShowNumLabelNumber.font = UIFont(name: "SUITE-Heavy", size: 26)
        ////           BloodSugarManagementNotebookView.FastingBloodSugarShowNumLabelNumber.font = UIFont.systemFont(ofSize: 30)
        ////        if IS_IPHONE_N_PLUS {
        ////            BloodSugarManagementNotebookView.FastingBloodSugarShowNumLabelNumber.font = UIFont.systemFont(ofSize: 23)
        ////
        ////            BloodSugarManagementNotebookView.FastingBloodSugarShowNumLabelNumber.numberOfLines = 0
        ////        }
        ////        if IS_IPHONE_X {
        ////            BloodSugarManagementNotebookView.FastingBloodSugarShowNumLabelNumber.font = UIFont.systemFont(ofSize: 23)
        ////
        ////            BloodSugarManagementNotebookView.FastingBloodSugarShowNumLabelNumber.numberOfLines = 0
        ////        }
        //
        //           BloodSugarManagementNotebookView.FastingBloodSugarShowNumLabelNumber.textColor = .white
        //           BloodSugarManagementNotebookView.FastingBloodSugarShowNumLabelNumber.numberOfLines = 0
        //           BloodSugarManagementNotebookView.FastingBloodSugar.addSubview(BloodSugarManagementNotebookView.FastingBloodSugarShowNumLabelNumber)
        //
        //
        //
        //        BloodSugarManagementNotebookView.FastingBloodSugarShowNumLabel = UILabel(frame: CGRect(x: BloodSugarManagementNotebookView.FastingBloodSugarShowNumLabelNumber.frame.maxX + 5, y: BloodSugarManagementNotebookView.FastingBloodSugarShowLabel.frame.maxY + 20, width: 50, height: BloodSugarManagementNotebookView.FastingBloodSugar.frame.size.height / 5))
        //     BloodSugarManagementNotebookView.FastingBloodSugarShowNumLabel.text = "mg/dL\n이하"
        //        BloodSugarManagementNotebookView.FastingBloodSugarShowNumLabel.textAlignment = .left
        //        BloodSugarManagementNotebookView.FastingBloodSugarShowNumLabel.font = UIFont(name: "SUITE-Regular", size: 13)
        //        BloodSugarManagementNotebookView.FastingBloodSugarShowNumLabel.numberOfLines = 0
        ////        BloodSugarManagementNotebookView.FastingBloodSugarShowNumLabel.font = UIFont.systemFont(ofSize: 14)
        ////        if IS_IPHONE_N_PLUS {
        ////            BloodSugarManagementNotebookView.FastingBloodSugarShowNumLabel.font = UIFont.systemFont(ofSize: 12)
        ////
        ////            BloodSugarManagementNotebookView.FastingBloodSugarShowNumLabel.numberOfLines = 0
        ////        }
        ////        if IS_IPHONE_X {
        ////            BloodSugarManagementNotebookView.FastingBloodSugarShowNumLabel.font = UIFont.systemFont(ofSize: 12)
        ////
        ////            BloodSugarManagementNotebookView.FastingBloodSugarShowNumLabel.numberOfLines = 0
        ////        }
        //
        //        BloodSugarManagementNotebookView.FastingBloodSugarShowNumLabel.textColor = .white
        //        BloodSugarManagementNotebookView.FastingBloodSugarShowNumLabel.numberOfLines = 0
        //        BloodSugarManagementNotebookView.FastingBloodSugar.addSubview(BloodSugarManagementNotebookView.FastingBloodSugarShowNumLabel)
        //
        //        BloodSugarManagementNotebookView.FastingBloodSugarPercent = UILabel(frame: CGRect(x: BloodSugarManagementNotebookView.FastingBloodSugar.frame.maxX - 180, y: 20, width: 130, height: BloodSugarManagementNotebookView.FastingBloodSugar.frame.size.height / 4))
        //        BloodSugarManagementNotebookView.FastingBloodSugarPercent.text = "목표 수치\n달성율은?"
        //
        //        if IS_IPHONE_12PRO_MAX {
        //            BloodSugarManagementNotebookView.FastingBloodSugarPercent.font = UIFont(name: "SUITE-Regular", size: 20)
        //        } else if IS_IPHONE_N_PLUS {
        //            BloodSugarManagementNotebookView.FastingBloodSugarPercent.font = UIFont(name: "SUITE-Regular", size: 17)
        //        } else if IS_IPHONE_X {
        //            BloodSugarManagementNotebookView.FastingBloodSugarPercent.font = UIFont(name: "SUITE-Regular", size: 15)
        //        } else {
        //            BloodSugarManagementNotebookView.FastingBloodSugarPercent.font = UIFont(name: "SUITE-Regular", size: 15)
        //        }
        //
        //
        //        BloodSugarManagementNotebookView.FastingBloodSugarPercent.numberOfLines = 0
        //        BloodSugarManagementNotebookView.FastingBloodSugarPercent.textAlignment = .center
        //
        //
        //
        //
        //
        //        BloodSugarManagementNotebookView.FastingBloodSugarPercent.textColor = .white
        //        BloodSugarManagementNotebookView.FastingBloodSugar.addSubview(BloodSugarManagementNotebookView.FastingBloodSugarPercent)
        //
        //        BloodSugarManagementNotebookView.FastingBloodSugarGraph = UIView(frame: CGRect(x: BloodSugarManagementNotebookView.FastingBloodSugarPercent.frame.minX, y: BloodSugarManagementNotebookView.FastingBloodSugarPercent.frame.maxY + 20, width: BloodSugarManagementNotebookView.FastingBloodSugar.frame.size.width / 3, height: BloodSugarManagementNotebookView.FastingBloodSugar.frame.size.height / 2.2))
        //        BloodSugarManagementNotebookView.FastingBloodSugarGraph.backgroundColor = .clear
        ////        BloodSugarManagementNotebookView.FastingBloodSugarGraph.layer.borderWidth = 1
        ////        BloodSugarManagementNotebookView.FastingBloodSugar.layer.cornerRadius = 8
        //        BloodSugarManagementNotebookView.FastingBloodSugar.addSubview(BloodSugarManagementNotebookView.FastingBloodSugarGraph)
        //
        //
        //        // we want the arc to be inset a bit, so we'll embed it in a "container"
        //        let container = UIView()
        //        container.backgroundColor = .systemYellow
        //
        //        container.translatesAutoresizingMaskIntoConstraints = false
        //        BloodSugarManagementNotebookView.FastingBloodSugar.addSubview(container)
        //
        //        hcpView.translatesAutoresizingMaskIntoConstraints = false
        //        container.addSubview(hcpView)
        //
        //        //                let g = view.safeAreaLayoutGuide
        //        if IS_IPHONE_12PRO_MAX {
        //            NSLayoutConstraint.activate([
        //
        //                container.leadingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugar.leadingAnchor, constant: 190.0),
        //                container.trailingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugar.trailingAnchor, constant: 10.0),
        //                container.heightAnchor.constraint(equalTo: container.widthAnchor, multiplier: 0.6),
        //                //            container.centerXAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerXAnchor),
        //                container.centerYAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerYAnchor, constant: 100),
        //
        //                // let's inset our progress view by 40-points on each side
        //                hcpView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 40.0),
        //                hcpView.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -40.0),
        //
        //                // give hcpView a 2:1 ratio
        //                hcpView.heightAnchor.constraint(equalTo: hcpView.widthAnchor, multiplier: 1.0 / 2.0),
        //
        //                hcpView.centerYAnchor.constraint(equalTo: container.centerYAnchor),
        //
        //
        //            ])/////durl
        //
        //
        //        } else if IS_IPHONE_X  {
        //            NSLayoutConstraint.activate([
        //
        //                container.leadingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugar.leadingAnchor, constant: 150.0),
        //                container.trailingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugar.trailingAnchor, constant: -10.0),
        //                container.heightAnchor.constraint(equalTo: container.widthAnchor, multiplier: 1.2),
        //                //            container.centerXAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerXAnchor),
        //                container.centerYAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerYAnchor, constant: 100),
        //
        //                // let's inset our progress view by 40-points on each side
        //                hcpView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 40.0),
        //                hcpView.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -40.0),
        //
        //                // give hcpView a 2:1 ratio
        //                hcpView.heightAnchor.constraint(equalTo: hcpView.widthAnchor, multiplier: 1.0 / 2.0),
        //
        //                hcpView.centerYAnchor.constraint(equalTo: container.centerYAnchor),
        //
        //            ])
        //        } else if IS_IPHONE_N_PLUS  {
        //            NSLayoutConstraint.activate([
        //
        //                container.leadingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugar.leadingAnchor, constant: 175),
        //                container.trailingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugar.trailingAnchor, constant: 10.0),
        //                container.heightAnchor.constraint(equalTo: container.widthAnchor, multiplier: 1),
        //                //            container.centerXAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerXAnchor),
        //                container.centerYAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerYAnchor, constant: 90),
        //
        //                // let's inset our progress view by 40-points on each side
        //                hcpView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 40.0),
        //                hcpView.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -40.0),
        //
        //                // give hcpView a 2:1 ratio
        //                hcpView.heightAnchor.constraint(equalTo: hcpView.widthAnchor, multiplier: 1.0 / 2.0),
        //
        //                hcpView.centerYAnchor.constraint(equalTo: container.centerYAnchor),
        //
        //            ])
        //        } else if IS_IPHONE_N  {
        //            NSLayoutConstraint.activate([
        //
        //                container.leadingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugar.leadingAnchor, constant: 155),
        //                container.trailingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugar.trailingAnchor, constant: 0.0),
        //                container.heightAnchor.constraint(equalTo: container.widthAnchor, multiplier: 1),
        //                //            container.centerXAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerXAnchor),
        //                container.centerYAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerYAnchor, constant: 80),
        //
        //                // let's inset our progress view by 40-points on each side
        //                hcpView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 40.0),
        //                hcpView.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -40.0),
        //
        //                // give hcpView a 2:1 ratio
        //                hcpView.heightAnchor.constraint(equalTo: hcpView.widthAnchor, multiplier: 1.0 / 2.0),
        //
        //                hcpView.centerYAnchor.constraint(equalTo: container.centerYAnchor),
        //
        //            ])
        //        } else if IS_IPHONE_12PRO  {
        //            NSLayoutConstraint.activate([
        //
        //                container.leadingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugar.leadingAnchor, constant: 155),
        //                container.trailingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugar.trailingAnchor, constant: 0.0),
        //                container.heightAnchor.constraint(equalTo: container.widthAnchor, multiplier: 1),
        //                //            container.centerXAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerXAnchor),
        //                container.centerYAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerYAnchor, constant: 80),
        //
        //                // let's inset our progress view by 40-points on each side
        //                hcpView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 40.0),
        //                hcpView.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -40.0),
        //
        //                // give hcpView a 2:1 ratio
        //                hcpView.heightAnchor.constraint(equalTo: hcpView.widthAnchor, multiplier: 1.0 / 2.0),
        //
        //                hcpView.centerYAnchor.constraint(equalTo: container.centerYAnchor),
        //
        //            ])
        //        } else {
        //            NSLayoutConstraint.activate([
        //
        //                container.leadingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugar.leadingAnchor, constant: 165),
        //                container.trailingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugar.trailingAnchor, constant: 10.0),
        //                container.heightAnchor.constraint(equalTo: container.widthAnchor, multiplier: 1),
        //                //            container.centerXAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerXAnchor),
        //                container.centerYAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerYAnchor, constant: 90),
        //
        //                // let's inset our progress view by 40-points on each side
        //                hcpView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 40.0),
        //                hcpView.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -40.0),
        //
        //                // give hcpView a 2:1 ratio
        //                hcpView.heightAnchor.constraint(equalTo: hcpView.widthAnchor, multiplier: 1.0 / 2.0),
        //
        //                hcpView.centerYAnchor.constraint(equalTo: container.centerYAnchor),
        //
        //            ])
        //        }
        ////        hcpView.progress = UserDefaults.standard.object(forKey: "perGraphS1") as! CGFloat * 0.01
        //        if UserDefaults.standard.object(forKey: "perGraphS1") == nil {
        //            hcpView.progress = 00
        //        } else {
        //            hcpView.progress = UserDefaults.standard.object(forKey: "perGraphS1") as! CGFloat * 0.01
        //        }
        //
        //
        //
        //        if IS_IPHONE_12PRO_MAX {
        //            showLabel = UILabel(frame: CGRect(x: 44, y: 32, width: 42, height: 30))
        //
        //            hcpView.addSubview(showLabel)
        //
        //            //        showLabel.layer.borderWidth = 1
        //
        ////            var changeShowLabel = Int(random)
        //            var changeShowLabel = UserDefaults.standard.object(forKey: "persenS1")
        //            print(changeShowLabel, "여기의 값은?")
        //            showLabel.textAlignment = .center
        //            showLabel.font = UIFont(name: "SUITE-Heavy", size: 13)
        //            showLabel.textColor = .white
        //            showLabel.text = "\(changeShowLabel ?? 0)%"
        ////            showLabel.text = UserDefaults.standard.string(forKey: "perB")
        //        } else if IS_IPHONE_X {
        //            showLabel = UILabel(frame: CGRect(x: 27, y: 23, width: 45, height: 30))
        //
        //            hcpView.addSubview(showLabel)
        //
        //            //        showLabel.layer.borderWidth = 1
        //
        ////            var changeShowLabel = Int(random)
        //            var changeShowLabel = UserDefaults.standard.object(forKey: "persenS1")
        //            print(changeShowLabel, "여기의 값은?")
        //
        //            showLabel.font = UIFont(name: "SUITE-Heavy", size: 13)
        //            showLabel.textColor = .white
        //            showLabel.textAlignment = .center
        //            showLabel.text = "\(changeShowLabel ?? 0)%"
        ////            showLabel.text = UserDefaults.standard.string(forKey: "perB")
        //        } else if IS_IPHONE_N_PLUS {
        //            showLabel = UILabel(frame: CGRect(x: 40, y: 31, width: 50, height: 30))
        //
        //            hcpView.addSubview(showLabel)
        //
        //            //        showLabel.layer.borderWidth = 1
        //            showLabel.textAlignment = .center
        ////            var changeShowLabel = Int(random)
        //            var changeShowLabel = UserDefaults.standard.object(forKey: "persenS1")
        //            print(changeShowLabel, "여기의 값은?")
        //
        //            showLabel.font = UIFont(name: "SUITE-Heavy", size: 12)
        //            showLabel.textColor = .white
        //            showLabel.text = "\(changeShowLabel ?? 0)%"
        ////            showLabel.text = UserDefaults.standard.string(forKey: "perB")
        //        } else if IS_IPHONE_N {
        //            showLabel = UILabel(frame: CGRect(x: 25, y: 28, width: 51, height: 30))
        //
        //            hcpView.addSubview(showLabel)
        //
        //            //        showLabel.layer.borderWidth = 1
        //            showLabel.textAlignment = .center
        ////            var changeShowLabel = Int(random)
        //            var changeShowLabel = UserDefaults.standard.object(forKey: "persenS1")
        //            print(changeShowLabel, "여기의 값은?")
        //            showLabel.textAlignment = .center
        //            showLabel.font = UIFont(name: "SUITE-Heavy", size: 12)
        //            showLabel.textColor = .white
        //            showLabel.text = "\(changeShowLabel ?? 0)%"
        ////            showLabel.text = UserDefaults.standard.string(forKey: "perB")
        //        } else if IS_IPHONE_12PRO {
        //            showLabel = UILabel(frame: CGRect(x: 34, y: 28, width: 51, height: 30))
        //
        //            hcpView.addSubview(showLabel)
        //
        ////                    showLabel.layer.borderWidth = 1
        //
        ////            var changeShowLabel = Int(random)
        //            var changeShowLabel = UserDefaults.standard.object(forKey: "persenS1")
        //            print(changeShowLabel, "여기의 값은?")
        //            showLabel.textAlignment = .center
        //            showLabel.font = UIFont(name: "SUITE-Heavy", size: 12)
        //            showLabel.textColor = .white
        //            showLabel.text = "\(changeShowLabel ?? 0)%"
        ////            showLabel.text = UserDefaults.standard.string(forKey: "perB")
        //        } else {
        //            showLabel = UILabel(frame: CGRect(x: 49, y: 31, width: 42, height: 30))
        //
        //            hcpView.addSubview(showLabel)
        //
        //            //        showLabel.layer.borderWidth = 1
        //            showLabel.textAlignment = .center
        ////            var changeShowLabel = Int(random)
        //            var changeShowLabel = UserDefaults.standard.object(forKey: "persenS1")
        //            print(changeShowLabel, "여기의 값은?")
        //
        //            showLabel.font = UIFont(name: "SUITE-Heavy", size: 12)
        //            showLabel.textColor = .white
        //            showLabel.text = "\(changeShowLabel ?? 0)%"
        ////            showLabel.text = UserDefaults.standard.string(forKey: "perB")
        //        }
        //        pctLabel.translatesAutoresizingMaskIntoConstraints = false
        //        hcpView.addSubview(pctLabel)
        //        // add the pctLabel in the middle of the arc
        //        NSLayoutConstraint.activate([
        //            pctLabel.centerXAnchor.constraint(equalTo: hcpView.centerXAnchor),
        //            pctLabel.centerYAnchor.constraint(equalTo: hcpView.centerYAnchor),
        //        ])
        //
        //        // let's add some percent / progress buttons
        ////                let btnStack = UIStackView()
        ////                btnStack.spacing = 4
        ////                btnStack.distribution = .fillEqually
        ////                [0.0, 0.1, 0.25, 0.33, 0.61, 0.8, 1.0].forEach { v in
        ////                    let b = UIButton()
        ////                    b.setTitle("\(v)", for: [])
        ////                    b.setTitleColor(.white, for: .normal)
        ////                    b.setTitleColor(.lightGray, for: .highlighted)
        ////                    b.titleLabel?.font = .systemFont(ofSize: 13.0, weight: .bold)
        ////                    b.backgroundColor = .systemGreen
        ////                    b.layer.cornerRadius = 6
        ////                    b.addTarget(self, action: #selector(btnTapped(_:)), for: .touchUpInside)
        ////                    btnStack.addArrangedSubview(b)
        ////                }
        ////
        ////                btnStack.translatesAutoresizingMaskIntoConstraints = false
        ////                view.addSubview(btnStack)
        //
        //        // let's add a slider to set the progress
        ////                let slider = UISlider()
        ////                slider.translatesAutoresizingMaskIntoConstraints = false
        ////                view.addSubview(slider)
        ////
        ////                NSLayoutConstraint.activate([
        ////
        ////                    btnStack.topAnchor.constraint(equalTo: container.bottomAnchor, constant: 20.0),
        ////                    btnStack.leadingAnchor.constraint(equalTo: g.leadingAnchor, constant: 20.0),
        ////                    btnStack.trailingAnchor.constraint(equalTo: g.trailingAnchor, constant: -20.0),
        ////
        ////                    slider.topAnchor.constraint(equalTo: btnStack.bottomAnchor, constant: 20.0),
        ////                    slider.leadingAnchor.constraint(equalTo: g.leadingAnchor, constant: 20.0),
        ////                    slider.trailingAnchor.constraint(equalTo: g.trailingAnchor, constant: -20.0),
        ////
        ////                ])
        ////
        ////                slider.addTarget(self, action: #selector(sliderChanged(_:)), for: .valueChanged)
        ////
        ////                sliderChanged(slider)
        //
        //        container.backgroundColor = .clear
        //
        //
        //
        ////        let slayer = CAShapeLayer()
        ////        let center = CGPoint(x: (BloodSugarManagementNotebookView.FastingBloodSugarGraph.frame.width / 2) + 4, y: BloodSugarManagementNotebookView.FastingBloodSugarGraph.frame.height - 8)
        ////         let radius: CGFloat = BloodSugarManagementNotebookView.FastingBloodSugarGraph.frame.height - 16
        ////         let startAngle: CGFloat = 4 * .pi / 4
        ////         let endAngle: CGFloat = 0.0
        ////         slayer.path = UIBezierPath(arcCenter: center,
        ////                                       radius: radius,
        ////                                       startAngle: startAngle,
        ////                                       endAngle: endAngle,
        ////                                       clockwise: true).cgPath
        ////         slayer.lineWidth = 15.0
        ////        slayer.lineCap = CAShapeLayerLineCap.round
        ////         slayer.strokeColor = UIColor.blue.cgColor
        ////         slayer.fillColor = UIColor.clear.cgColor
        //////         self.layer.addSublayer(slayer)
        ////        BloodSugarManagementNotebookView.FastingBloodSugarGraph.layer.addSublayer(slayer)
        //
        ////        animate()
        //
        //
        //        BloodSugarManagementNotebookView.PostprandialBloodSugar = UIView(frame: CGRect(x: 20, y: BloodSugarManagementNotebookView.FastingBloodSugar.frame.maxY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 4))
        ////        BloodSugarManagementNotebookView.PostprandialBloodSugar.backgroundColor = #colorLiteral(red: 0.009351861663, green: 0.4616524577, blue: 0.943269372, alpha: 1)
        //        BloodSugarManagementNotebookView.PostprandialBloodSugar.setGradient3(color1: UIColor(red: 0.0 / 255.0, green: 74 / 255.0, blue: 241.0 / 255.0, alpha: 1), color2: UIColor(red: 0.0 / 255.0, green: 130 / 255.0, blue: 241 / 255.0, alpha: 1))
        ////        BloodSugarManagementNotebookView.FastingBloodSugar.layer.borderWidth = 1
        //        BloodSugarManagementNotebookView.PostprandialBloodSugar.layer.cornerRadius = 8
        //        scrollView.addSubview(BloodSugarManagementNotebookView.PostprandialBloodSugar)
        //
        //
        //        BloodSugarManagementNotebookView.PostprandialBloodSugarLabel = UILabel(frame: CGRect(x: 20, y: 20, width: 140, height: BloodSugarManagementNotebookView.PostprandialBloodSugar.frame.size.height / 4))
        //        BloodSugarManagementNotebookView.PostprandialBloodSugarLabel.text = "나의 혈압\n목표 수치는?"
        ////        BloodSugarManagementNotebookView.PostprandialBloodSugarLabel.textAlignment = .center
        ////        BloodSugarManagementNotebookView.PostprandialBloodSugarLabel.numberOfLines = 0
        //
        //        if IS_IPHONE_12PRO_MAX {
        //            BloodSugarManagementNotebookView.PostprandialBloodSugarLabel.font = UIFont(name: "SUITE-Regular", size: 20)
        //        } else if IS_IPHONE_N_PLUS {
        //            BloodSugarManagementNotebookView.PostprandialBloodSugarLabel.font = UIFont(name: "SUITE-Regular", size: 17)
        //        } else if IS_IPHONE_X {
        //            BloodSugarManagementNotebookView.PostprandialBloodSugarLabel.font = UIFont(name: "SUITE-Regular", size: 15)
        //        } else {
        //            BloodSugarManagementNotebookView.PostprandialBloodSugarLabel.font = UIFont(name: "SUITE-Regular", size: 15)
        //        }
        //        BloodSugarManagementNotebookView.PostprandialBloodSugarLabel.numberOfLines = 0
        //        BloodSugarManagementNotebookView.PostprandialBloodSugarLabel.textAlignment = .center
        //
        //
        //
        //        BloodSugarManagementNotebookView.PostprandialBloodSugarLabel.textColor = .white
        //
        //
        //        BloodSugarManagementNotebookView.PostprandialBloodSugar.addSubview(BloodSugarManagementNotebookView.PostprandialBloodSugarLabel)
        //
        //
        //
        //
        //        BloodSugarManagementNotebookView.PostprandialBloodSugarShowLabel = UILabel(frame: CGRect(x: 15, y: BloodSugarManagementNotebookView.PostprandialBloodSugarLabel.frame.maxY + 20, width: 150, height: BloodSugarManagementNotebookView.PostprandialBloodSugar.frame.size.height / 6))
        //     BloodSugarManagementNotebookView.PostprandialBloodSugarShowLabel.text = "식후혈당\n(Postprandial glucose)"
        //
        //
        //        if IS_IPHONE_12PRO_MAX {
        //            BloodSugarManagementNotebookView.PostprandialBloodSugarShowLabel.font = UIFont(name: "SUITE-Regular", size: 14)
        //        } else if IS_IPHONE_N_PLUS {
        //            BloodSugarManagementNotebookView.PostprandialBloodSugarShowLabel.font = UIFont(name: "SUITE-Regular", size: 11)
        //        } else if IS_IPHONE_X {
        //            BloodSugarManagementNotebookView.PostprandialBloodSugarShowLabel.font = UIFont(name: "SUITE-Regular", size: 11)
        //        } else {
        //            BloodSugarManagementNotebookView.PostprandialBloodSugarShowLabel.font = UIFont(name: "SUITE-Regular", size: 11)
        //        }
        //
        //        BloodSugarManagementNotebookView.PostprandialBloodSugarShowLabel.textAlignment = .center
        //        BloodSugarManagementNotebookView.PostprandialBloodSugarShowLabel.numberOfLines = 0
        //
        //
        //
        //        BloodSugarManagementNotebookView.PostprandialBloodSugarShowLabel.textColor = .white
        //        BloodSugarManagementNotebookView.PostprandialBloodSugar.addSubview(BloodSugarManagementNotebookView.PostprandialBloodSugarShowLabel)
        //
        //
        //
        //        BloodSugarManagementNotebookView.PostprandialBloodSugarShowNumLabelNumber = UILabel(frame: CGRect(x: 40, y: BloodSugarManagementNotebookView.PostprandialBloodSugarShowLabel.frame.maxY + 20, width: 50, height: BloodSugarManagementNotebookView.FastingBloodSugar.frame.size.height / 6))
        //        BloodSugarManagementNotebookView.PostprandialBloodSugarShowNumLabelNumber.text = "120"
        //
        //           BloodSugarManagementNotebookView.PostprandialBloodSugarShowNumLabelNumber.textAlignment = .right
        //        BloodSugarManagementNotebookView.PostprandialBloodSugarShowNumLabelNumber.font = UIFont(name: "SUITE-Heavy", size: 26)
        //
        //           BloodSugarManagementNotebookView.PostprandialBloodSugarShowNumLabelNumber.textColor = .white
        //           BloodSugarManagementNotebookView.PostprandialBloodSugarShowNumLabelNumber.numberOfLines = 0
        //           BloodSugarManagementNotebookView.PostprandialBloodSugar.addSubview(BloodSugarManagementNotebookView.PostprandialBloodSugarShowNumLabelNumber)
        //
        //
        //
        //
        //
        //
        //        BloodSugarManagementNotebookView.PostprandialBloodSugarShowNumLabel = UILabel(frame: CGRect(x: BloodSugarManagementNotebookView.PostprandialBloodSugarShowNumLabelNumber.frame.maxX + 5, y: BloodSugarManagementNotebookView.PostprandialBloodSugarShowLabel.frame.maxY + 20, width: 50, height: BloodSugarManagementNotebookView.PostprandialBloodSugar.frame.size.height / 5))
        //     BloodSugarManagementNotebookView.PostprandialBloodSugarShowNumLabel.text = "mg/dL\n이하"
        //
        //        BloodSugarManagementNotebookView.PostprandialBloodSugarShowNumLabel.textAlignment = .left
        //        BloodSugarManagementNotebookView.PostprandialBloodSugarShowNumLabel.numberOfLines = 0
        //        BloodSugarManagementNotebookView.PostprandialBloodSugarShowNumLabel.font = UIFont(name: "SUITE-Regular", size: 13)
        //
        //        BloodSugarManagementNotebookView.PostprandialBloodSugarShowNumLabel.textColor = .white
        //        BloodSugarManagementNotebookView.PostprandialBloodSugar.addSubview(BloodSugarManagementNotebookView.PostprandialBloodSugarShowNumLabel)
        //
        //
        //
        //
        //
        //        BloodSugarManagementNotebookView.PostprandialBloodSugarPercent = UILabel(frame: CGRect(x: BloodSugarManagementNotebookView.PostprandialBloodSugar.frame.maxX - 180, y: 20, width: 130, height: BloodSugarManagementNotebookView.PostprandialBloodSugar.frame.size.height / 4))
        //        BloodSugarManagementNotebookView.PostprandialBloodSugarPercent.text = "목표 수치\n달성율은?"
        //
        //        if IS_IPHONE_12PRO_MAX {
        //            BloodSugarManagementNotebookView.PostprandialBloodSugarPercent.font = UIFont(name: "SUITE-Regular", size: 20)
        //        } else if IS_IPHONE_N_PLUS {
        //            BloodSugarManagementNotebookView.PostprandialBloodSugarPercent.font = UIFont(name: "SUITE-Regular", size: 17)
        //        } else if IS_IPHONE_X {
        //            BloodSugarManagementNotebookView.PostprandialBloodSugarPercent.font = UIFont(name: "SUITE-Regular", size: 15)
        //        } else {
        //            BloodSugarManagementNotebookView.PostprandialBloodSugarPercent.font = UIFont(name: "SUITE-Regular", size: 15)
        //        }
        //
        //
        //
        //        BloodSugarManagementNotebookView.PostprandialBloodSugarPercent.textAlignment = .center
        //        BloodSugarManagementNotebookView.PostprandialBloodSugarPercent.numberOfLines = 0
        //
        //        BloodSugarManagementNotebookView.PostprandialBloodSugarPercent.textColor = .white
        //        BloodSugarManagementNotebookView.PostprandialBloodSugar.addSubview(BloodSugarManagementNotebookView.PostprandialBloodSugarPercent)
        //
        //
        //        // we want the arc to be inset a bit, so we'll embed it in a "container"
        //        let container2 = UIView()
        //        container2.backgroundColor = .systemYellow
        //
        //        container2.translatesAutoresizingMaskIntoConstraints = false
        //        BloodSugarManagementNotebookView.PostprandialBloodSugar.addSubview(container2)
        //
        //        hcpView2.translatesAutoresizingMaskIntoConstraints = false
        //        container2.addSubview(hcpView2)
        //        if IS_IPHONE_12PRO_MAX {
        //            //                let g = view.safeAreaLayoutGuide
        //            NSLayoutConstraint.activate([
        //
        //                container2.leadingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.PostprandialBloodSugar.leadingAnchor, constant: 190.0),
        //                container2.trailingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.PostprandialBloodSugar.trailingAnchor, constant: 10.0),
        //                container2.heightAnchor.constraint(equalTo: container.widthAnchor, multiplier: 0.6),
        //                //            container.centerXAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerXAnchor),
        //                container2.centerYAnchor.constraint(equalTo: BloodSugarManagementNotebookView.PostprandialBloodSugarPercent.centerYAnchor, constant: 120),
        //
        //                // let's inset our progress view by 40-points on each side
        //                hcpView2.leadingAnchor.constraint(equalTo: container2.leadingAnchor, constant: 40.0),
        //                hcpView2.trailingAnchor.constraint(equalTo: container2.trailingAnchor, constant: -40.0),
        //
        //                // give hcpView a 2:1 ratio
        //                hcpView2.heightAnchor.constraint(equalTo: hcpView2.widthAnchor, multiplier: 1.0 / 2.0),
        //
        //                hcpView2.centerYAnchor.constraint(equalTo: container2.centerYAnchor),
        //
        //            ])
        //        } else if IS_IPHONE_X {
        //            //                let g = view.safeAreaLayoutGuide
        //            NSLayoutConstraint.activate([
        //
        //                container2.leadingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.PostprandialBloodSugar.leadingAnchor, constant: 150),
        //                container2.trailingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.PostprandialBloodSugar.trailingAnchor, constant: -10.0),
        //                container2.heightAnchor.constraint(equalTo: container.widthAnchor, multiplier: 1.2),
        //                //            container.centerXAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerXAnchor),
        //                container2.centerYAnchor.constraint(equalTo: BloodSugarManagementNotebookView.PostprandialBloodSugarPercent.centerYAnchor, constant: 100),
        //
        //                // let's inset our progress view by 40-points on each side
        //                hcpView2.leadingAnchor.constraint(equalTo: container2.leadingAnchor, constant: 40.0),
        //                hcpView2.trailingAnchor.constraint(equalTo: container2.trailingAnchor, constant: -40.0),
        //
        //                // give hcpView a 2:1 ratio
        //                hcpView2.heightAnchor.constraint(equalTo: hcpView2.widthAnchor, multiplier: 1.0 / 2.0),
        //
        //                hcpView2.centerYAnchor.constraint(equalTo: container2.centerYAnchor),
        //
        //            ])
        //        } else if IS_IPHONE_N_PLUS  {
        //            //                let g = view.safeAreaLayoutGuide
        //            NSLayoutConstraint.activate([
        //
        //                container2.leadingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.PostprandialBloodSugar.leadingAnchor, constant: 175),
        //                container2.trailingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.PostprandialBloodSugar.trailingAnchor, constant: 10.0),
        //                container2.heightAnchor.constraint(equalTo: container.widthAnchor, multiplier: 1),
        //                //            container.centerXAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerXAnchor),
        //                container2.centerYAnchor.constraint(equalTo: BloodSugarManagementNotebookView.PostprandialBloodSugarPercent.centerYAnchor, constant: 85),
        //
        //                // let's inset our progress view by 40-points on each side
        //                hcpView2.leadingAnchor.constraint(equalTo: container2.leadingAnchor, constant: 40.0),
        //                hcpView2.trailingAnchor.constraint(equalTo: container2.trailingAnchor, constant: -40.0),
        //
        //                // give hcpView a 2:1 ratio
        //                hcpView2.heightAnchor.constraint(equalTo: hcpView2.widthAnchor, multiplier: 1.0 / 2.0),
        //
        //                hcpView2.centerYAnchor.constraint(equalTo: container2.centerYAnchor),
        //
        //            ])
        //        } else if IS_IPHONE_N  {
        //            //                let g = view.safeAreaLayoutGuide
        //            NSLayoutConstraint.activate([
        //
        //                container2.leadingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.PostprandialBloodSugar.leadingAnchor, constant: 155),
        //                container2.trailingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.PostprandialBloodSugar.trailingAnchor, constant: 0.0),
        //                container2.heightAnchor.constraint(equalTo: container.widthAnchor, multiplier: 1),
        //                //            container.centerXAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerXAnchor),
        //                container2.centerYAnchor.constraint(equalTo: BloodSugarManagementNotebookView.PostprandialBloodSugarPercent.centerYAnchor, constant: 80),
        //
        //                // let's inset our progress view by 40-points on each side
        //                hcpView2.leadingAnchor.constraint(equalTo: container2.leadingAnchor, constant: 40.0),
        //                hcpView2.trailingAnchor.constraint(equalTo: container2.trailingAnchor, constant: -40.0),
        //
        //                // give hcpView a 2:1 ratio
        //                hcpView2.heightAnchor.constraint(equalTo: hcpView2.widthAnchor, multiplier: 1.0 / 2.0),
        //
        //                hcpView2.centerYAnchor.constraint(equalTo: container2.centerYAnchor),
        //
        //            ])
        //        } else if IS_IPHONE_12PRO  {
        //            //                let g = view.safeAreaLayoutGuide
        //            NSLayoutConstraint.activate([
        //
        //                container2.leadingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.PostprandialBloodSugar.leadingAnchor, constant: 155),
        //                container2.trailingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.PostprandialBloodSugar.trailingAnchor, constant: 0.0),
        //                container2.heightAnchor.constraint(equalTo: container.widthAnchor, multiplier: 1),
        //                //            container.centerXAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerXAnchor),
        //                container2.centerYAnchor.constraint(equalTo: BloodSugarManagementNotebookView.PostprandialBloodSugarPercent.centerYAnchor, constant: 80),
        //
        //                // let's inset our progress view by 40-points on each side
        //                hcpView2.leadingAnchor.constraint(equalTo: container2.leadingAnchor, constant: 40.0),
        //                hcpView2.trailingAnchor.constraint(equalTo: container2.trailingAnchor, constant: -40.0),
        //
        //                // give hcpView a 2:1 ratio
        //                hcpView2.heightAnchor.constraint(equalTo: hcpView2.widthAnchor, multiplier: 1.0 / 2.0),
        //
        //                hcpView2.centerYAnchor.constraint(equalTo: container2.centerYAnchor),
        //
        //            ])
        //        } else {
        //            //                let g = view.safeAreaLayoutGuide
        //            NSLayoutConstraint.activate([
        //
        //                container2.leadingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.PostprandialBloodSugar.leadingAnchor, constant: 175),
        //                container2.trailingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.PostprandialBloodSugar.trailingAnchor, constant: 10.0),
        //                container2.heightAnchor.constraint(equalTo: container.widthAnchor, multiplier: 1),
        //                //            container.centerXAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerXAnchor),
        //                container2.centerYAnchor.constraint(equalTo: BloodSugarManagementNotebookView.PostprandialBloodSugarPercent.centerYAnchor, constant: 85),
        //
        //                // let's inset our progress view by 40-points on each side
        //                hcpView2.leadingAnchor.constraint(equalTo: container2.leadingAnchor, constant: 40.0),
        //                hcpView2.trailingAnchor.constraint(equalTo: container2.trailingAnchor, constant: -40.0),
        //
        //                // give hcpView a 2:1 ratio
        //                hcpView2.heightAnchor.constraint(equalTo: hcpView2.widthAnchor, multiplier: 1.0 / 2.0),
        //
        //                hcpView2.centerYAnchor.constraint(equalTo: container2.centerYAnchor),
        //
        //            ])
        //        }
        //        if UserDefaults.standard.object(forKey: "perGraphS2") == nil {
        //            hcpView.progress = 00
        //        } else {
        //            hcpView2.progress = UserDefaults.standard.object(forKey: "perGraphS2") as! CGFloat * 0.01
        //        }
        ////            hcpView2.progress = UserDefaults.standard.object(forKey: "perGraphS2") as! CGFloat * 0.01
        ////        hcpView2.progress = 0.3
        //
        //        if IS_IPHONE_12PRO_MAX {
        //            showLabel = UILabel(frame: CGRect(x: 49, y: 32, width: 42, height: 30))
        //
        //            hcpView2.addSubview(showLabel)
        //
        //            //        showLabel.layer.borderWidth = 1
        //
        ////            var changeShowLabel = Int(random)
        //            var changeShowLabel = UserDefaults.standard.object(forKey: "persenS2")
        //            print(changeShowLabel, "여기의 값은?")
        //
        //            showLabel.font = UIFont(name: "SUITE-Heavy", size: 13)
        //            showLabel.textColor = .white
        //            showLabel.text = "\(changeShowLabel ?? 0)%"
        ////            showLabel.text = UserDefaults.standard.string(forKey: "perB")
        //        } else if IS_IPHONE_X {
        //            showLabel = UILabel(frame: CGRect(x: 27, y: 23, width: 45, height: 30))
        //
        //            hcpView2.addSubview(showLabel)
        //
        //            //        showLabel.layer.borderWidth = 1
        //
        ////            var changeShowLabel = Int(random)
        //            var changeShowLabel = UserDefaults.standard.object(forKey: "persenS2")
        //            print(changeShowLabel, "여기의 값은?")
        //            showLabel.textAlignment = .center
        //            showLabel.font = UIFont(name: "SUITE-Heavy", size: 13)
        //            showLabel.textColor = .white
        //            showLabel.text = "\(changeShowLabel ?? 0)%"
        ////            showLabel.text = UserDefaults.standard.string(forKey: "perB")
        //        } else if IS_IPHONE_N_PLUS {
        //            showLabel = UILabel(frame: CGRect(x: 40, y: 31, width: 50, height: 30))
        //
        //            hcpView2.addSubview(showLabel)
        //
        //            //        showLabel.layer.borderWidth = 1
        //            showLabel.textAlignment = .center
        ////            var changeShowLabel = Int(random)
        //            var changeShowLabel = UserDefaults.standard.object(forKey: "persenS2")
        //            print(changeShowLabel, "여기의 값은?")
        //
        //            showLabel.font = UIFont(name: "SUITE-Heavy", size: 12)
        //            showLabel.textColor = .white
        //            showLabel.text = "\(changeShowLabel ?? 0)%"
        ////            showLabel.text = UserDefaults.standard.string(forKey: "perB")
        //        } else if IS_IPHONE_N {
        //            showLabel = UILabel(frame: CGRect(x: 25, y: 28, width: 51, height: 30))
        //
        //            hcpView2.addSubview(showLabel)
        //
        //            //        showLabel.layer.borderWidth = 1
        //            showLabel.textAlignment = .center
        ////            var changeShowLabel = Int(random)
        //            var changeShowLabel = UserDefaults.standard.object(forKey: "persenS2")
        //            print(changeShowLabel, "여기의 값은?")
        //
        //            showLabel.font = UIFont(name: "SUITE-Heavy", size: 12)
        //            showLabel.textColor = .white
        //            showLabel.text = "\(changeShowLabel ?? 0)%"
        ////            showLabel.text = UserDefaults.standard.string(forKey: "perB")
        //        } else if IS_IPHONE_12PRO {
        //            showLabel = UILabel(frame: CGRect(x: 37, y: 30, width: 45, height: 30))
        //
        //            hcpView2.addSubview(showLabel)
        //
        //            //        showLabel.layer.borderWidth = 1
        //
        ////            var changeShowLabel = Int(random)
        //            var changeShowLabel = UserDefaults.standard.object(forKey: "persenS2")
        //            print(changeShowLabel, "여기의 값은?")
        //            showLabel.textAlignment = .center
        //            showLabel.font = UIFont(name: "SUITE-Heavy", size: 13)
        //            showLabel.textColor = .white
        //            showLabel.text = "\(changeShowLabel ?? 0)%"
        ////            showLabel.text = UserDefaults.standard.string(forKey: "perB")
        //        } else {
        //            showLabel = UILabel(frame: CGRect(x: 39, y: 28, width: 42, height: 30))
        //
        //            hcpView2.addSubview(showLabel)
        //
        //            //        showLabel.layer.borderWidth = 1
        //
        ////            var changeShowLabel = Int(random)
        //            var changeShowLabel = UserDefaults.standard.object(forKey: "persenS2")
        //            print(changeShowLabel, "여기의 값은?")
        //
        //            showLabel.font = UIFont(name: "SUITE-Heavy", size: 12)
        //            showLabel.textColor = .white
        //            showLabel.text = "\(changeShowLabel ?? 0)%"
        ////            showLabel.text = UserDefaults.standard.string(forKey: "perB")
        //        }
        //
        //        pctLabel.translatesAutoresizingMaskIntoConstraints = false
        //        hcpView2.addSubview(pctLabel)
        //        // add the pctLabel in the middle of the arc
        //        NSLayoutConstraint.activate([
        //            pctLabel.centerXAnchor.constraint(equalTo: hcpView2.centerXAnchor),
        //            pctLabel.centerYAnchor.constraint(equalTo: hcpView2.centerYAnchor),
        //        ])
        //
        //        // let's add some percent / progress buttons
        ////                let btnStack = UIStackView()
        ////                btnStack.spacing = 4
        ////                btnStack.distribution = .fillEqually
        ////                [0.0, 0.1, 0.25, 0.33, 0.61, 0.8, 1.0].forEach { v in
        ////                    let b = UIButton()
        ////                    b.setTitle("\(v)", for: [])
        ////                    b.setTitleColor(.white, for: .normal)
        ////                    b.setTitleColor(.lightGray, for: .highlighted)
        ////                    b.titleLabel?.font = .systemFont(ofSize: 13.0, weight: .bold)
        ////                    b.backgroundColor = .systemGreen
        ////                    b.layer.cornerRadius = 6
        ////                    b.addTarget(self, action: #selector(btnTapped(_:)), for: .touchUpInside)
        ////                    btnStack.addArrangedSubview(b)
        ////                }
        ////
        ////                btnStack.translatesAutoresizingMaskIntoConstraints = false
        ////                view.addSubview(btnStack)
        //
        //        // let's add a slider to set the progress
        ////                let slider = UISlider()
        ////                slider.translatesAutoresizingMaskIntoConstraints = false
        ////                view.addSubview(slider)
        ////
        ////                NSLayoutConstraint.activate([
        ////
        ////                    btnStack.topAnchor.constraint(equalTo: container.bottomAnchor, constant: 20.0),
        ////                    btnStack.leadingAnchor.constraint(equalTo: g.leadingAnchor, constant: 20.0),
        ////                    btnStack.trailingAnchor.constraint(equalTo: g.trailingAnchor, constant: -20.0),
        ////
        ////                    slider.topAnchor.constraint(equalTo: btnStack.bottomAnchor, constant: 20.0),
        ////                    slider.leadingAnchor.constraint(equalTo: g.leadingAnchor, constant: 20.0),
        ////                    slider.trailingAnchor.constraint(equalTo: g.trailingAnchor, constant: -20.0),
        ////
        ////                ])
        ////
        ////                slider.addTarget(self, action: #selector(sliderChanged(_:)), for: .valueChanged)
        ////
        ////                sliderChanged(slider)
        //
        //        container2.backgroundColor = .clear
        //
        //
        //
        //
        //        BloodSugarManagementNotebookView.PostprandialBloodSugarGraph = UIView(frame: CGRect(x: BloodSugarManagementNotebookView.PostprandialBloodSugarPercent.frame.minX, y: BloodSugarManagementNotebookView.PostprandialBloodSugarPercent.frame.maxY + 20, width: BloodSugarManagementNotebookView.PostprandialBloodSugar.frame.size.width / 3, height: BloodSugarManagementNotebookView.PostprandialBloodSugar.frame.size.height / 2.2))
        //        BloodSugarManagementNotebookView.PostprandialBloodSugarGraph.backgroundColor = .clear
        ////        BloodSugarManagementNotebookView.FastingBloodSugar.layer.borderWidth = 1
        ////        BloodSugarManagementNotebookView.FastingBloodSugar.layer.cornerRadius = 8
        //        BloodSugarManagementNotebookView.PostprandialBloodSugar.addSubview(BloodSugarManagementNotebookView.PostprandialBloodSugarGraph)
        //
        ////        animate2()
        //
        //
        //        BloodSugarManagementNotebookView.GlycatedHemoglobin = UIView(frame: CGRect(x: 20, y: BloodSugarManagementNotebookView.PostprandialBloodSugar.frame.maxY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 4))
        ////        BloodSugarManagementNotebookView.GlycatedHemoglobin.backgroundColor = #colorLiteral(red: 0.4349892437, green: 0.1282797456, blue: 0.8903027177, alpha: 1)
        //        BloodSugarManagementNotebookView.GlycatedHemoglobin.setGradient3(color1: UIColor(red: 128 / 255.0, green: 34 / 255.0, blue: 234 / 255.0, alpha: 1), color2: UIColor(red: 50.0 / 255.0, green: 14 / 255.0, blue: 203 / 255.0, alpha: 1))
        ////        BloodSugarManagementNotebookView.FastingBloodSugar.layer.borderWidth = 1
        //        BloodSugarManagementNotebookView.GlycatedHemoglobin.layer.cornerRadius = 8
        //        scrollView.addSubview(BloodSugarManagementNotebookView.GlycatedHemoglobin)
        //
        //
        //
        //        BloodSugarManagementNotebookView.GlycatedHemoglobinLabel = UILabel(frame: CGRect(x: 20, y: 20, width: 140, height: BloodSugarManagementNotebookView.GlycatedHemoglobin.frame.size.height / 4))
        //        BloodSugarManagementNotebookView.GlycatedHemoglobinLabel.text = "나의 혈압\n목표 수치는?"
        //        BloodSugarManagementNotebookView.GlycatedHemoglobinLabel.textAlignment = .center
        //        BloodSugarManagementNotebookView.GlycatedHemoglobinLabel.numberOfLines = 0
        //
        //
        //        if IS_IPHONE_12PRO_MAX {
        //            BloodSugarManagementNotebookView.GlycatedHemoglobinLabel.font = UIFont(name: "SUITE-Regular", size: 20)
        //        } else if IS_IPHONE_N_PLUS {
        //            BloodSugarManagementNotebookView.GlycatedHemoglobinLabel.font = UIFont(name: "SUITE-Regular", size: 17)
        //        } else if IS_IPHONE_X {
        //            BloodSugarManagementNotebookView.GlycatedHemoglobinLabel.font = UIFont(name: "SUITE-Regular", size: 15)
        //        } else {
        //            BloodSugarManagementNotebookView.GlycatedHemoglobinLabel.font = UIFont(name: "SUITE-Regular", size: 15)
        //        }
        //        BloodSugarManagementNotebookView.GlycatedHemoglobinLabel.textAlignment = .center
        //        BloodSugarManagementNotebookView.GlycatedHemoglobinLabel.numberOfLines = 0
        //
        //
        //        BloodSugarManagementNotebookView.GlycatedHemoglobinLabel.textColor = .white
        //        BloodSugarManagementNotebookView.GlycatedHemoglobin.addSubview(BloodSugarManagementNotebookView.GlycatedHemoglobinLabel)
        //
        //
        //
        //
        //
        //        BloodSugarManagementNotebookView.GlycatedHemoglobinShowLabel = UILabel(frame: CGRect(x: 15, y: BloodSugarManagementNotebookView.GlycatedHemoglobinLabel.frame.maxY + 20, width: 150, height: BloodSugarManagementNotebookView.GlycatedHemoglobin.frame.size.height / 6))
        //     BloodSugarManagementNotebookView.GlycatedHemoglobinShowLabel.text = "당호혈색소\n(HbA1c)"
        //
        //        if IS_IPHONE_12PRO_MAX {
        //            BloodSugarManagementNotebookView.GlycatedHemoglobinShowLabel.font = UIFont(name: "SUITE-Regular", size: 14)
        //        } else if IS_IPHONE_N_PLUS {
        //            BloodSugarManagementNotebookView.GlycatedHemoglobinShowLabel.font = UIFont(name: "SUITE-Regular", size: 11)
        //        } else if IS_IPHONE_X {
        //            BloodSugarManagementNotebookView.GlycatedHemoglobinShowLabel.font = UIFont(name: "SUITE-Regular", size: 11)
        //        } else {
        //            BloodSugarManagementNotebookView.GlycatedHemoglobinShowLabel.font = UIFont(name: "SUITE-Regular", size: 11)
        //        }
        //
        //        BloodSugarManagementNotebookView.GlycatedHemoglobinShowLabel.textAlignment = .center
        //        BloodSugarManagementNotebookView.GlycatedHemoglobinShowLabel.numberOfLines = 0
        //
        //        BloodSugarManagementNotebookView.GlycatedHemoglobinShowLabel.textColor = .white
        //        BloodSugarManagementNotebookView.GlycatedHemoglobin.addSubview(BloodSugarManagementNotebookView.GlycatedHemoglobinShowLabel)
        //
        //
        //        BloodSugarManagementNotebookView.GlycatedHemoglobinShowNumLabelNumber = UILabel(frame: CGRect(x: BloodSugarManagementNotebookView.GlycatedHemoglobin.frame.size.width / 5.8, y: BloodSugarManagementNotebookView.GlycatedHemoglobinShowLabel.frame.maxY + 20, width: 50, height: BloodSugarManagementNotebookView.FastingBloodSugar.frame.size.height / 6))
        //        BloodSugarManagementNotebookView.GlycatedHemoglobinShowNumLabelNumber.text = "7.0"
        //
        //           BloodSugarManagementNotebookView.GlycatedHemoglobinShowNumLabelNumber.textAlignment = .right
        //        BloodSugarManagementNotebookView.GlycatedHemoglobinShowNumLabelNumber.font = UIFont(name: "SUITE-Heavy", size: 26)
        //
        //
        //           BloodSugarManagementNotebookView.GlycatedHemoglobinShowNumLabelNumber.textColor = .white
        //           BloodSugarManagementNotebookView.GlycatedHemoglobinShowNumLabelNumber.numberOfLines = 0
        //           BloodSugarManagementNotebookView.GlycatedHemoglobin.addSubview(BloodSugarManagementNotebookView.GlycatedHemoglobinShowNumLabelNumber)
        //
        //
        //
        //
        //
        //
        ////        BloodSugarManagementNotebookView.GlycatedHemoglobinShowNumLabel = UILabel(frame: CGRect(x: 30, y: BloodSugarManagementNotebookView.GlycatedHemoglobinShowLabel.frame.maxY + 20, width: BloodSugarManagementNotebookView.GlycatedHemoglobin.frame.size.width / 2.5, height: BloodSugarManagementNotebookView.GlycatedHemoglobin.frame.size.height / 6))
        ////     BloodSugarManagementNotebookView.GlycatedHemoglobinShowNumLabel.text = "220mg/dL 이하"
        ////        BloodSugarManagementNotebookView.GlycatedHemoglobinShowNumLabel.textAlignment = .center
        ////        BloodSugarManagementNotebookView.GlycatedHemoglobinShowNumLabel.font = UIFont.systemFont(ofSize: 16)
        ////        BloodSugarManagementNotebookView.GlycatedHemoglobinShowNumLabel.textColor = .white
        ////        BloodSugarManagementNotebookView.GlycatedHemoglobin.addSubview(BloodSugarManagementNotebookView.GlycatedHemoglobinShowNumLabel)
        //
        //
        //
        //
        //
        //
        //
        //        BloodSugarManagementNotebookView.GlycatedHemoglobinPercent = UILabel(frame: CGRect(x: BloodSugarManagementNotebookView.GlycatedHemoglobin.frame.maxX - 180, y: 20, width: 130, height: BloodSugarManagementNotebookView.GlycatedHemoglobin.frame.size.height / 4))
        //        BloodSugarManagementNotebookView.GlycatedHemoglobinPercent.text = "목표 수치\n달성율은?"
        //
        //
        //        if IS_IPHONE_12PRO_MAX {
        //            BloodSugarManagementNotebookView.GlycatedHemoglobinPercent.font = UIFont(name: "SUITE-Regular", size: 20)
        //        } else if IS_IPHONE_N_PLUS {
        //            BloodSugarManagementNotebookView.GlycatedHemoglobinPercent.font = UIFont(name: "SUITE-Regular", size: 17)
        //        } else if IS_IPHONE_X {
        //            BloodSugarManagementNotebookView.GlycatedHemoglobinPercent.font = UIFont(name: "SUITE-Regular", size: 15)
        //        } else {
        //            BloodSugarManagementNotebookView.GlycatedHemoglobinPercent.font = UIFont(name: "SUITE-Regular", size: 15)
        //        }
        //
        ////        BloodSugarManagementNotebookView.GlycatedHemoglobinPercent.font = UIFont(name: "SUITE-Regular", size: 13)
        //        BloodSugarManagementNotebookView.GlycatedHemoglobinPercent.textAlignment = .center
        //        BloodSugarManagementNotebookView.GlycatedHemoglobinPercent.numberOfLines = 0
        //
        //        BloodSugarManagementNotebookView.GlycatedHemoglobinPercent.textColor = .white
        //        BloodSugarManagementNotebookView.GlycatedHemoglobin.addSubview(BloodSugarManagementNotebookView.GlycatedHemoglobinPercent)
        //
        //
        //        // we want the arc to be inset a bit, so we'll embed it in a "container"
        //        let container3 = UIView()
        //        container3.backgroundColor = .systemYellow
        //
        //        container3.translatesAutoresizingMaskIntoConstraints = false
        //        BloodSugarManagementNotebookView.GlycatedHemoglobin.addSubview(container3)
        //
        //        hcpView3.translatesAutoresizingMaskIntoConstraints = false
        //        container3.addSubview(hcpView3)
        //        if IS_IPHONE_12PRO_MAX {
        //            //                let g = view.safeAreaLayoutGuide
        //            NSLayoutConstraint.activate([
        //
        //                container3.leadingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.GlycatedHemoglobin.leadingAnchor, constant: 190.0),
        //                container3.trailingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.GlycatedHemoglobin.trailingAnchor, constant: 10.0),
        //                container3.heightAnchor.constraint(equalTo: container.widthAnchor, multiplier: 0.6),
        //                //            container.centerXAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerXAnchor),
        //                container3.centerYAnchor.constraint(equalTo: BloodSugarManagementNotebookView.GlycatedHemoglobinPercent.centerYAnchor, constant: 120),
        //
        //                // let's inset our progress view by 40-points on each side
        //                hcpView3.leadingAnchor.constraint(equalTo: container3.leadingAnchor, constant: 40.0),
        //                hcpView3.trailingAnchor.constraint(equalTo: container3.trailingAnchor, constant: -40.0),
        //
        //                // give hcpView a 2:1 ratio
        //                hcpView3.heightAnchor.constraint(equalTo: hcpView3.widthAnchor, multiplier: 1.0 / 2.0),
        //
        //                hcpView3.centerYAnchor.constraint(equalTo: container3.centerYAnchor),
        //
        //            ])
        //
        //        } else if IS_IPHONE_X  {
        //            //                let g = view.safeAreaLayoutGuide
        //            NSLayoutConstraint.activate([
        //
        //                container3.leadingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.GlycatedHemoglobin.leadingAnchor, constant: 150),
        //                container3.trailingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.GlycatedHemoglobin.trailingAnchor, constant: -10.0),
        //                container3.heightAnchor.constraint(equalTo: container.widthAnchor, multiplier: 1.2),
        //                //            container.centerXAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerXAnchor),
        //                container3.centerYAnchor.constraint(equalTo: BloodSugarManagementNotebookView.GlycatedHemoglobinPercent.centerYAnchor, constant: 100),
        //
        //                // let's inset our progress view by 40-points on each side
        //                hcpView3.leadingAnchor.constraint(equalTo: container3.leadingAnchor, constant: 40.0),
        //                hcpView3.trailingAnchor.constraint(equalTo: container3.trailingAnchor, constant: -40.0),
        //
        //                // give hcpView a 2:1 ratio
        //                hcpView3.heightAnchor.constraint(equalTo: hcpView3.widthAnchor, multiplier: 1.0 / 2.0),
        //
        //                hcpView3.centerYAnchor.constraint(equalTo: container3.centerYAnchor),
        //
        //            ])
        //        } else if IS_IPHONE_N_PLUS  {
        //            //                let g = view.safeAreaLayoutGuide
        //            NSLayoutConstraint.activate([
        //
        //                container3.leadingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.GlycatedHemoglobin.leadingAnchor, constant: 175),
        //                container3.trailingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.GlycatedHemoglobin.trailingAnchor, constant: 10.0),
        //                container3.heightAnchor.constraint(equalTo: container.widthAnchor, multiplier: 1),
        //                //            container.centerXAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerXAnchor),
        //                container3.centerYAnchor.constraint(equalTo: BloodSugarManagementNotebookView.GlycatedHemoglobinPercent.centerYAnchor, constant: 90),
        //
        //                // let's inset our progress view by 40-points on each side
        //                hcpView3.leadingAnchor.constraint(equalTo: container3.leadingAnchor, constant: 40.0),
        //                hcpView3.trailingAnchor.constraint(equalTo: container3.trailingAnchor, constant: -40.0),
        //
        //                // give hcpView a 2:1 ratio
        //                hcpView3.heightAnchor.constraint(equalTo: hcpView3.widthAnchor, multiplier: 1.0 / 2.0),
        //
        //                hcpView3.centerYAnchor.constraint(equalTo: container3.centerYAnchor),
        //
        //            ])
        //        } else if IS_IPHONE_N  {
        //            //                let g = view.safeAreaLayoutGuide
        //            NSLayoutConstraint.activate([
        //
        //                container3.leadingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.GlycatedHemoglobin.leadingAnchor, constant: 155),
        //                container3.trailingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.GlycatedHemoglobin.trailingAnchor, constant: 0.0),
        //                container3.heightAnchor.constraint(equalTo: container.widthAnchor, multiplier: 1),
        //                //            container.centerXAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerXAnchor),
        //                container3.centerYAnchor.constraint(equalTo: BloodSugarManagementNotebookView.GlycatedHemoglobinPercent.centerYAnchor, constant: 80),
        //
        //                // let's inset our progress view by 40-points on each side
        //                hcpView3.leadingAnchor.constraint(equalTo: container3.leadingAnchor, constant: 40.0),
        //                hcpView3.trailingAnchor.constraint(equalTo: container3.trailingAnchor, constant: -40.0),
        //
        //                // give hcpView a 2:1 ratio
        //                hcpView3.heightAnchor.constraint(equalTo: hcpView3.widthAnchor, multiplier: 1.0 / 2.0),
        //
        //                hcpView3.centerYAnchor.constraint(equalTo: container3.centerYAnchor),
        //
        //            ])
        //        } else if IS_IPHONE_12PRO  {
        //            //                let g = view.safeAreaLayoutGuide
        //            NSLayoutConstraint.activate([
        //
        //                container3.leadingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.GlycatedHemoglobin.leadingAnchor, constant: 155),
        //                container3.trailingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.GlycatedHemoglobin.trailingAnchor, constant: 0.0),
        //                container3.heightAnchor.constraint(equalTo: container.widthAnchor, multiplier: 1),
        //                //            container.centerXAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerXAnchor),
        //                container3.centerYAnchor.constraint(equalTo: BloodSugarManagementNotebookView.GlycatedHemoglobinPercent.centerYAnchor, constant: 80),
        //
        //                // let's inset our progress view by 40-points on each side
        //                hcpView3.leadingAnchor.constraint(equalTo: container3.leadingAnchor, constant: 40.0),
        //                hcpView3.trailingAnchor.constraint(equalTo: container3.trailingAnchor, constant: -40.0),
        //
        //                // give hcpView a 2:1 ratio
        //                hcpView3.heightAnchor.constraint(equalTo: hcpView3.widthAnchor, multiplier: 1.0 / 2.0),
        //
        //                hcpView3.centerYAnchor.constraint(equalTo: container3.centerYAnchor),
        //
        //            ])
        //        } else {
        //            //                let g = view.safeAreaLayoutGuide
        //            NSLayoutConstraint.activate([
        //
        //                container3.leadingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.GlycatedHemoglobin.leadingAnchor, constant: 165),
        //                container3.trailingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.GlycatedHemoglobin.trailingAnchor, constant: 10.0),
        //                container3.heightAnchor.constraint(equalTo: container.widthAnchor, multiplier: 1),
        //                //            container.centerXAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerXAnchor),
        //                container3.centerYAnchor.constraint(equalTo: BloodSugarManagementNotebookView.GlycatedHemoglobinPercent.centerYAnchor, constant: 85),
        //
        //                // let's inset our progress view by 40-points on each side
        //                hcpView3.leadingAnchor.constraint(equalTo: container3.leadingAnchor, constant: 40.0),
        //                hcpView3.trailingAnchor.constraint(equalTo: container3.trailingAnchor, constant: -40.0),
        //
        //                // give hcpView a 2:1 ratio
        //                hcpView3.heightAnchor.constraint(equalTo: hcpView3.widthAnchor, multiplier: 1.0 / 2.0),
        //
        //                hcpView3.centerYAnchor.constraint(equalTo: container3.centerYAnchor),
        //
        //            ])
        //        }
        //
        //        if UserDefaults.standard.object(forKey: "perGraphS3") == nil {
        //            hcpView3.progress = 00
        //        } else {
        //            hcpView3.progress = UserDefaults.standard.object(forKey: "perGraphS3") as! CGFloat * 0.01
        //        }
        ////        hcpView3.progress = UserDefaults.standard.object(forKey: "perGraphS3") as! CGFloat * 0.01
        //
        //
        //        if IS_IPHONE_12PRO_MAX {
        //            showLabel = UILabel(frame: CGRect(x: 49, y: 32, width: 42, height: 30))
        //
        //            hcpView3.addSubview(showLabel)
        //
        //            //        showLabel.layer.borderWidth = 1
        //
        ////            var changeShowLabel = Int(random)
        //            var changeShowLabel = UserDefaults.standard.object(forKey: "persenS3")
        //            print(changeShowLabel, "여기의 값은?")
        //
        //            showLabel.font = UIFont(name: "SUITE-Heavy", size: 13)
        //            showLabel.textColor = .white
        //            showLabel.text = "\(changeShowLabel ?? 0)%"
        ////            showLabel.text = UserDefaults.standard.string(forKey: "perB")
        //        } else if IS_IPHONE_X {
        //            showLabel = UILabel(frame: CGRect(x: 27, y: 23, width: 45, height: 30))
        //
        //            hcpView3.addSubview(showLabel)
        //
        //            //        showLabel.layer.borderWidth = 1
        //
        ////            var changeShowLabel = Int(random)
        //            var changeShowLabel = UserDefaults.standard.object(forKey: "persenS3")
        //            print(changeShowLabel, "여기의 값은?")
        //            showLabel.textAlignment = .center
        //            showLabel.font = UIFont(name: "SUITE-Heavy", size: 13)
        //            showLabel.textColor = .white
        //            showLabel.text = "\(changeShowLabel ?? 0)%"
        ////            showLabel.text = UserDefaults.standard.string(forKey: "perB")
        //        } else if IS_IPHONE_N_PLUS {
        //            showLabel = UILabel(frame: CGRect(x: 40, y: 31, width: 50, height: 30))
        //
        //            hcpView3.addSubview(showLabel)
        //
        //            //        showLabel.layer.borderWidth = 1
        //            showLabel.textAlignment = .center
        ////            var changeShowLabel = Int(random)
        //            var changeShowLabel = UserDefaults.standard.object(forKey: "persenS3")
        //            print(changeShowLabel, "여기의 값은?")
        //
        //            showLabel.font = UIFont(name: "SUITE-Heavy", size: 12)
        //            showLabel.textColor = .white
        //            showLabel.text = "\(changeShowLabel ?? 0)%"
        ////            showLabel.text = UserDefaults.standard.string(forKey: "perB")
        //        } else if IS_IPHONE_N {
        //            showLabel = UILabel(frame: CGRect(x: 25, y: 28, width: 51, height: 30))
        //
        //            hcpView3.addSubview(showLabel)
        //
        //            //        showLabel.layer.borderWidth = 1
        //            showLabel.textAlignment = .center
        ////            var changeShowLabel = Int(random)
        //            var changeShowLabel = UserDefaults.standard.object(forKey: "persenS3")
        //            print(changeShowLabel, "여기의 값은?")
        //
        //            showLabel.font = UIFont(name: "SUITE-Heavy", size: 12)
        //            showLabel.textColor = .white
        //            showLabel.text = "\(changeShowLabel ?? 0)%"
        ////            showLabel.text = UserDefaults.standard.string(forKey: "perB")
        //        } else if IS_IPHONE_12PRO {
        //            showLabel = UILabel(frame: CGRect(x: 37, y: 30, width: 45, height: 30))
        //
        //            hcpView3.addSubview(showLabel)
        //
        //            //        showLabel.layer.borderWidth = 1
        //
        ////            var changeShowLabel = Int(random)
        //            var changeShowLabel = UserDefaults.standard.object(forKey: "persenS3")
        //            print(changeShowLabel, "여기의 값은?")
        //            showLabel.textAlignment = .center
        //            showLabel.font = UIFont(name: "SUITE-Heavy", size: 13)
        //            showLabel.textColor = .white
        //            showLabel.text = "\(changeShowLabel ?? 0)%"
        ////            showLabel.text = UserDefaults.standard.string(forKey: "perB")
        //        } else {
        //            showLabel = UILabel(frame: CGRect(x: 39, y: 28, width: 42, height: 30))
        //
        //            hcpView3.addSubview(showLabel)
        //
        //            //        showLabel.layer.borderWidth = 1
        //
        ////            var changeShowLabel = Int(random)
        //            var changeShowLabel = UserDefaults.standard.object(forKey: "persenS3")
        //            print(changeShowLabel, "여기의 값은?")
        //
        //            showLabel.font = UIFont(name: "SUITE-Heavy", size: 12)
        //            showLabel.textColor = .white
        //            showLabel.text = "\(changeShowLabel ?? 0)%"
        ////            showLabel.text = UserDefaults.standard.string(forKey: "perB")
        //        }
        //
        //        pctLabel.translatesAutoresizingMaskIntoConstraints = false
        //        hcpView3.addSubview(pctLabel)
        //        // add the pctLabel in the middle of the arc
        //        NSLayoutConstraint.activate([
        //            pctLabel.centerXAnchor.constraint(equalTo: hcpView3.centerXAnchor),
        //            pctLabel.centerYAnchor.constraint(equalTo: hcpView3.centerYAnchor),
        //        ])
        //
        //        // let's add some percent / progress buttons
        ////                let btnStack = UIStackView()
        ////                btnStack.spacing = 4
        ////                btnStack.distribution = .fillEqually
        ////                [0.0, 0.1, 0.25, 0.33, 0.61, 0.8, 1.0].forEach { v in
        ////                    let b = UIButton()
        ////                    b.setTitle("\(v)", for: [])
        ////                    b.setTitleColor(.white, for: .normal)
        ////                    b.setTitleColor(.lightGray, for: .highlighted)
        ////                    b.titleLabel?.font = .systemFont(ofSize: 13.0, weight: .bold)
        ////                    b.backgroundColor = .systemGreen
        ////                    b.layer.cornerRadius = 6
        ////                    b.addTarget(self, action: #selector(btnTapped(_:)), for: .touchUpInside)
        ////                    btnStack.addArrangedSubview(b)
        ////                }
        ////
        ////                btnStack.translatesAutoresizingMaskIntoConstraints = false
        ////                view.addSubview(btnStack)
        //
        //        // let's add a slider to set the progress
        ////                let slider = UISlider()
        ////                slider.translatesAutoresizingMaskIntoConstraints = false
        ////                view.addSubview(slider)
        ////
        ////                NSLayoutConstraint.activate([
        ////
        ////                    btnStack.topAnchor.constraint(equalTo: container.bottomAnchor, constant: 20.0),
        ////                    btnStack.leadingAnchor.constraint(equalTo: g.leadingAnchor, constant: 20.0),
        ////                    btnStack.trailingAnchor.constraint(equalTo: g.trailingAnchor, constant: -20.0),
        ////
        ////                    slider.topAnchor.constraint(equalTo: btnStack.bottomAnchor, constant: 20.0),
        ////                    slider.leadingAnchor.constraint(equalTo: g.leadingAnchor, constant: 20.0),
        ////                    slider.trailingAnchor.constraint(equalTo: g.trailingAnchor, constant: -20.0),
        ////
        ////                ])
        ////
        ////                slider.addTarget(self, action: #selector(sliderChanged(_:)), for: .valueChanged)
        ////
        ////                sliderChanged(slider)
        //
        //        container3.backgroundColor = .clear
        //
        //        BloodSugarManagementNotebookView.GlycatedHemoglobinGraph = UIView(frame: CGRect(x: BloodSugarManagementNotebookView.GlycatedHemoglobinPercent.frame.minX, y: BloodSugarManagementNotebookView.PostprandialBloodSugarPercent.frame.maxY + 20, width: BloodSugarManagementNotebookView.GlycatedHemoglobin.frame.size.width / 3, height: BloodSugarManagementNotebookView.GlycatedHemoglobin.frame.size.height / 2.2))
        //        BloodSugarManagementNotebookView.GlycatedHemoglobinGraph.backgroundColor = .clear
        ////        BloodSugarManagementNotebookView.FastingBloodSugar.layer.borderWidth = 1
        ////        BloodSugarManagementNotebookView.FastingBloodSugar.layer.cornerRadius = 8
        //        BloodSugarManagementNotebookView.GlycatedHemoglobin.addSubview(BloodSugarManagementNotebookView.GlycatedHemoglobinGraph)
        //
        //
        ////        animate3()
        //
        //        var saveData = UILabel(frame: CGRect(x: 20, y: BloodSugarManagementNotebookView.GlycatedHemoglobin.frame.maxY + 30, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 12))
        //        saveData.text = "측정하신 혈당을 입력해주세요."
        ////        saveData.font = UIFont.systemFont(ofSize: 22)
        //        saveData.font = UIFont(name: "SUITE-Regular", size: 18)
        //
        //        scrollView.addSubview(saveData)
        //
        //
        //        var saveView: UIView!
        //
        ////        var afterBTN: UIButton!
        ////        var beforeBTN: UIButton!
        ////        var bloodTF: UITextField!
        ////        var glycated: UITextField!
        //
        //        saveView = UIView(frame: CGRect(x: 20, y: saveData.frame.maxY + 10, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 3))
        //        saveView.backgroundColor = .white
        ////        saveView.layer.borderWidth = 1
        //        saveView.layer.cornerRadius = 8
        //        scrollView.addSubview(saveView)
        //
        //        var dateView = UIView(frame: CGRect(x: 10, y: 5, width: saveView.frame.size.width - 20, height: self.view.frame.size.height / 14))
        //        dateView.backgroundColor = .white
        //
        //        saveView.addSubview(dateView)
        //
        //        var dateViewLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 60, height: dateView.frame.height))
        //        dateViewLabel.text = "일시"
        //        dateViewLabel.layer.addBorder([.bottom], color: .lightGray, width: 1)
        //        dateViewLabel.font = UIFont(name: "SUITE-Regular", size: 17)
        //        dateView.addSubview(dateViewLabel)
        //
        ////        date = UILabel(frame: CGRect(x: dateViewLabel.frame.maxX + 50, y: dateViewLabel.frame.minY, width: 200, height: dateView.frame.height))
        ////        date.text = Date()
        //
        //        var time = Date()
        //        var formatter = DateFormatter()
        ////        formatter.dateFormat = "MM.dd.yyyy a h:mm"
        //        formatter.locale = Locale(identifier: "ko_KR")
        //
        //        formatter.dateFormat = "yyyy.MM.dd a h:mm"
        //        formatter.amSymbol = "오전"
        //            formatter.pmSymbol = "오후"
        //
        //        let formattedDateInString = formatter.string(from: time)
        //
        //
        //
        //        BloodSugarManagementNotebookView.dateLable = UILabel(frame: CGRect(x: dateViewLabel.frame.maxX, y: dateViewLabel.frame.minY, width: saveView.frame.size.width - 40 - dateViewLabel.frame.width, height: dateView.frame.height))
        //        BloodSugarManagementNotebookView.dateLable.text = formattedDateInString
        //        BloodSugarManagementNotebookView.dateLable.textAlignment = .right
        //        BloodSugarManagementNotebookView.dateLable.layer.addBorder([.bottom], color: .lightGray, width: 1)
        //
        //        dateView.addSubview(BloodSugarManagementNotebookView.dateLable)
        //
        //        var eatView = UIView(frame: CGRect(x: 10, y: dateView.frame.maxY, width: saveView.frame.size.width - 20, height: self.view.frame.size.height / 14))
        //        eatView.backgroundColor = .white
        //
        //        saveView.addSubview(eatView)
        //
        //
        //
        //
        //        var eatVLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 80, height: dateView.frame.height))
        //        eatVLabel.text = "식사 상태"
        //        eatVLabel.layer.addBorder([.bottom], color: .lightGray, width: 1)
        //        eatVLabel.font = UIFont(name: "SUITE-Regular", size: 17)
        //        eatView.addSubview(eatVLabel)
        //
        //
        //        var innerView = UIView(frame: CGRect(x: eatVLabel.frame.maxX, y: 0, width: eatView.frame.size.width - 20 - eatVLabel.frame.width, height: eatView.frame.height))
        ////        innerView.layer.borderWidth = 1
        //        innerView.layer.addBorder([.bottom], color: .lightGray, width: 1)
        //
        ////        bloodSugarLabel.font = UIFont(name: "SUITE-Regular", size: 17)
        //        eatView.addSubview(innerView)
        //
        ////        if IS_IPHONE_X {
        ////            woman = UIButton(frame: CGRect(x: eatVLabel.frame.maxX + 45, y: 12, width: self.view.frame.size.width / 4.5, height: 35))
        ////        } else if IS_IPHONE_N {
        ////            woman = UIButton(frame: CGRect(x: eatVLabel.frame.maxX + 40, y: 12, width: self.view.frame.size.width / 4.5, height: 35))
        ////        } else {
        ////            woman = UIButton(frame: CGRect(x: eatVLabel.frame.maxX + 55, y: 12, width: self.view.frame.size.width / 4.5, height: 35))
        ////        }
        //////        woman = UIButton(frame: CGRect(x: eatVLabel.frame.maxX + 55, y: 10, width: self.view.frame.size.width / 4.5, height: 35))
        ////        woman.setTitle("공복", for: .normal)
        ////        woman.layer.cornerRadius = 8
        //////        woman.backgroundColor = #colorLiteral(red: 0.8938891292, green: 0.9134108424, blue: 0.9262667298, alpha: 1)
        ////        woman.setTitleColor(UIColor(red: 0.7011209726, green: 0.7713823915, blue: 0.8184124827, alpha: 1), for: .normal)
        ////        woman.contentHorizontalAlignment = .center
        //////        woman.addTarget(self, action: #selector(womanClick(_ :)), for: .touchUpInside)
        //////        woman.titleLabel?.font = UIFont.systemFont(ofSize: 11)
        ////        woman.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        ////        woman.layer.borderWidth = 0.3
        //////        woman.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
        ////        woman.tag = 0
        ////
        ////        //        womanBTN.setImage(UIImage(named: "id"), for: .normal)
        //////        womanBTN.addTarget(self, action: #selector(test(_ :)), for: .touchUpInside)
        ////        eatView.addSubview(woman)
        ////
        ////        if IS_IPHONE_X {
        ////            man = UIButton(frame: CGRect(x: woman.frame.maxX + 5, y: 12, width: self.view.frame.size.width / 4.5, height: 35))
        ////        } else if IS_IPHONE_N {
        ////            man = UIButton(frame: CGRect(x: woman.frame.maxX + 11, y: 12, width: self.view.frame.size.width / 4.5, height: 35))
        ////        } else {
        ////            man = UIButton(frame: CGRect(x: woman.frame.maxX + 11, y: 12, width: self.view.frame.size.width / 4.5, height: 35))
        ////        }
        //////        man = UIButton(frame: CGRect(x: woman.frame.maxX + 25, y: birthdayTF.frame.maxY + 10, width: self.view.frame.size.width / 2.5, height: 50))
        ////        man.setTitle("식후", for: .normal)
        //////        man.backgroundColor = #colorLiteral(red: 0.8938891292, green: 0.9134108424, blue: 0.9262667298, alpha: 1)
        ////        man.layer.cornerRadius = 8
        ////        man.layer.borderWidth = 0.3
        ////
        ////        man.setTitleColor(UIColor(red: 0.7011209726, green: 0.7713823915, blue: 0.8184124827, alpha: 1), for: .normal)
        ////        man.contentHorizontalAlignment = .center
        //////        man.titleLabel?.font = UIFont.systemFont(ofSize: 11)
        ////        man.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        //////        man.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
        ////        man.tag = 1
        ////
        ////        //        womanBTN.setImage(UIImage(named: "id"), for: .normal)
        //////        menBTN.addTarget(self, action: #selector(test(_ :)), for: .touchUpInside)
        ////        eatView.addSubview(man)
        ////
        ////        arrBTN = [woman, man]
        //        if IS_IPHONE_X {
        //            woman = UIButton(frame: CGRect(x: eatVLabel.frame.maxX + 70, y: 12, width: self.view.frame.size.width / 5.3, height: 35))
        //        } else if IS_IPHONE_N {
        //            woman = UIButton(frame: CGRect(x: eatVLabel.frame.maxX + 67, y: 7, width: self.view.frame.size.width / 5.3, height: 35))
        //        } else if IS_IPHONE_12PRO_MAX {
        //            woman = UIButton(frame: CGRect(x: eatVLabel.frame.maxX + 100, y: 12, width: self.view.frame.size.width / 5.3, height: 35))
        //        } else if IS_IPHONE_12PRO {
        //            woman = UIButton(frame: CGRect(x: eatVLabel.frame.maxX + 82, y: 12, width: self.view.frame.size.width / 5.3, height: 35))
        //        } else if IS_IPHONE_N_PLUS {
        //            woman = UIButton(frame: CGRect(x: eatVLabel.frame.maxX + 92, y: 10, width: self.view.frame.size.width / 5.3, height: 35))
        //        } else {
        //            woman = UIButton(frame: CGRect(x: eatVLabel.frame.maxX + 90, y: 12, width: self.view.frame.size.width / 5.3, height: 35))
        //        }
        
        
        if IS_IPHONE_12PRO_MAX {
            BloodSugarManagementNotebookView.FastingBloodSugarLabel.font = UIFont(name: "SUITE-Regular", size: 20)
        } else if IS_IPHONE_15PRO_MAX {
            BloodSugarManagementNotebookView.FastingBloodSugarLabel.font = UIFont(name: "SUITE-Regular", size: 20)
        } else if IS_IPHONE_N_PLUS {
            BloodSugarManagementNotebookView.FastingBloodSugarLabel.font = UIFont(name: "SUITE-Regular", size: 17)
        } else if IS_IPHONE_X {
            BloodSugarManagementNotebookView.FastingBloodSugarLabel.font = UIFont(name: "SUITE-Regular", size: 15)
        } else {
            BloodSugarManagementNotebookView.FastingBloodSugarLabel.font = UIFont(name: "SUITE-Regular", size: 15)
        }
        BloodSugarManagementNotebookView.FastingBloodSugarLabel.numberOfLines = 0
        BloodSugarManagementNotebookView.FastingBloodSugarLabel.textAlignment = .center
        
        BloodSugarManagementNotebookView.FastingBloodSugarLabel.textColor = .white
        BloodSugarManagementNotebookView.FastingBloodSugar.addSubview(BloodSugarManagementNotebookView.FastingBloodSugarLabel)
        
        BloodSugarManagementNotebookView.FastingBloodSugarShowLabel = UILabel(frame: CGRect(x: 15, y: BloodSugarManagementNotebookView.FastingBloodSugarLabel.frame.maxY + 20, width: 150, height: BloodSugarManagementNotebookView.FastingBloodSugar.frame.size.height / 6))
        BloodSugarManagementNotebookView.FastingBloodSugarShowLabel.text = "금식혈당\n(Fasting glucose)"
        
        if IS_IPHONE_12PRO_MAX {
            BloodSugarManagementNotebookView.FastingBloodSugarShowLabel.font = UIFont(name: "SUITE-Regular", size: 13)
        } else if IS_IPHONE_15PRO_MAX {
            BloodSugarManagementNotebookView.FastingBloodSugarShowLabel.font = UIFont(name: "SUITE-Regular", size: 13)
        } else if IS_IPHONE_N_PLUS {
            BloodSugarManagementNotebookView.FastingBloodSugarShowLabel.font = UIFont(name: "SUITE-Regular", size: 11)
        } else if IS_IPHONE_X {
            BloodSugarManagementNotebookView.FastingBloodSugarShowLabel.font = UIFont(name: "SUITE-Regular", size: 11)
        } else {
            BloodSugarManagementNotebookView.FastingBloodSugarShowLabel.font = UIFont(name: "SUITE-Regular", size: 11)
        }
        
        BloodSugarManagementNotebookView.FastingBloodSugarShowLabel.textAlignment = .center
        BloodSugarManagementNotebookView.FastingBloodSugarShowLabel.numberOfLines = 0
        
        
        BloodSugarManagementNotebookView.FastingBloodSugarShowLabel.textColor = .white
        BloodSugarManagementNotebookView.FastingBloodSugar.addSubview(BloodSugarManagementNotebookView.FastingBloodSugarShowLabel)
        
        BloodSugarManagementNotebookView.FastingBloodSugarShowNumLabelNumber = UILabel(frame: CGRect(x: 40, y: BloodSugarManagementNotebookView.FastingBloodSugarShowLabel.frame.maxY + 20, width: 50, height: BloodSugarManagementNotebookView.FastingBloodSugar.frame.size.height / 6))
        BloodSugarManagementNotebookView.FastingBloodSugarShowNumLabelNumber.text = "120"
        BloodSugarManagementNotebookView.FastingBloodSugarShowNumLabelNumber.textAlignment = .right
        
        BloodSugarManagementNotebookView.FastingBloodSugarShowNumLabelNumber.font = UIFont(name: "SUITE-Heavy", size: 26)
        //           BloodSugarManagementNotebookView.FastingBloodSugarShowNumLabelNumber.font = UIFont.systemFont(ofSize: 30)
        //        if IS_IPHONE_N_PLUS {
        //            BloodSugarManagementNotebookView.FastingBloodSugarShowNumLabelNumber.font = UIFont.systemFont(ofSize: 23)
        //
        //            BloodSugarManagementNotebookView.FastingBloodSugarShowNumLabelNumber.numberOfLines = 0
        //        }
        //        if IS_IPHONE_X {
        //            BloodSugarManagementNotebookView.FastingBloodSugarShowNumLabelNumber.font = UIFont.systemFont(ofSize: 23)
        //
        //            BloodSugarManagementNotebookView.FastingBloodSugarShowNumLabelNumber.numberOfLines = 0
        //        }
        
        BloodSugarManagementNotebookView.FastingBloodSugarShowNumLabelNumber.textColor = .white
        BloodSugarManagementNotebookView.FastingBloodSugarShowNumLabelNumber.numberOfLines = 0
        BloodSugarManagementNotebookView.FastingBloodSugar.addSubview(BloodSugarManagementNotebookView.FastingBloodSugarShowNumLabelNumber)
        
        
        
        BloodSugarManagementNotebookView.FastingBloodSugarShowNumLabel = UILabel(frame: CGRect(x: BloodSugarManagementNotebookView.FastingBloodSugarShowNumLabelNumber.frame.maxX + 5, y: BloodSugarManagementNotebookView.FastingBloodSugarShowLabel.frame.maxY + 20, width: 50, height: BloodSugarManagementNotebookView.FastingBloodSugar.frame.size.height / 5))
        BloodSugarManagementNotebookView.FastingBloodSugarShowNumLabel.text = "mg/dL\n이하"
        BloodSugarManagementNotebookView.FastingBloodSugarShowNumLabel.textAlignment = .left
        BloodSugarManagementNotebookView.FastingBloodSugarShowNumLabel.font = UIFont(name: "SUITE-Regular", size: 13)
        BloodSugarManagementNotebookView.FastingBloodSugarShowNumLabel.numberOfLines = 0
        //        BloodSugarManagementNotebookView.FastingBloodSugarShowNumLabel.font = UIFont.systemFont(ofSize: 14)
        //        if IS_IPHONE_N_PLUS {
        //            BloodSugarManagementNotebookView.FastingBloodSugarShowNumLabel.font = UIFont.systemFont(ofSize: 12)
        //
        //            BloodSugarManagementNotebookView.FastingBloodSugarShowNumLabel.numberOfLines = 0
        //        }
        //        if IS_IPHONE_X {
        //            BloodSugarManagementNotebookView.FastingBloodSugarShowNumLabel.font = UIFont.systemFont(ofSize: 12)
        //
        //            BloodSugarManagementNotebookView.FastingBloodSugarShowNumLabel.numberOfLines = 0
        //        }
        
        BloodSugarManagementNotebookView.FastingBloodSugarShowNumLabel.textColor = .white
        BloodSugarManagementNotebookView.FastingBloodSugarShowNumLabel.numberOfLines = 0
        BloodSugarManagementNotebookView.FastingBloodSugar.addSubview(BloodSugarManagementNotebookView.FastingBloodSugarShowNumLabel)
        
        
        
        
        
        
        
        BloodSugarManagementNotebookView.FastingBloodSugarPercent = UILabel(frame: CGRect(x: BloodSugarManagementNotebookView.FastingBloodSugar.frame.maxX - 180, y: 20, width: 130, height: BloodSugarManagementNotebookView.FastingBloodSugar.frame.size.height / 4))
               
               if IS_IPHONE_N {
                   BloodSugarManagementNotebookView.FastingBloodSugarPercent = UILabel(frame: CGRect(x: BloodSugarManagementNotebookView.FastingBloodSugar.frame.maxX - 170, y: 20, width: 130, height: BloodSugarManagementNotebookView.FastingBloodSugar.frame.size.height / 4))
                   
               }
               if IS_IPHONE_12PRO {
                   BloodSugarManagementNotebookView.FastingBloodSugarPercent = UILabel(frame: CGRect(x: BloodSugarManagementNotebookView.FastingBloodSugar.frame.maxX - 170, y: 20, width: 130, height: BloodSugarManagementNotebookView.FastingBloodSugar.frame.size.height / 4))
                   
               }
               if IS_IPHONE_15PRO {
                   BloodSugarManagementNotebookView.FastingBloodSugarPercent = UILabel(frame: CGRect(x: BloodSugarManagementNotebookView.FastingBloodSugar.frame.maxX - 170, y: 20, width: 130, height: BloodSugarManagementNotebookView.FastingBloodSugar.frame.size.height / 4))
                   
               }
               if IS_IPHONE_MINI {
                   BloodSugarManagementNotebookView.FastingBloodSugarPercent = UILabel(frame: CGRect(x: BloodSugarManagementNotebookView.FastingBloodSugar.frame.maxX - 170, y: 20, width: 130, height: BloodSugarManagementNotebookView.FastingBloodSugar.frame.size.height / 4))
                   
               }
               
               
               
               BloodSugarManagementNotebookView.FastingBloodSugarPercent.text = "목표 수치\n달성율은?"
               
               if IS_IPHONE_12PRO_MAX {
                   BloodSugarManagementNotebookView.FastingBloodSugarPercent.font = UIFont(name: "SUITE-Regular", size: 20)
               } else if IS_IPHONE_15PRO_MAX {
                   BloodSugarManagementNotebookView.FastingBloodSugarPercent.font = UIFont(name: "SUITE-Regular", size: 20)
               } else if IS_IPHONE_N_PLUS {
                   BloodSugarManagementNotebookView.FastingBloodSugarPercent.font = UIFont(name: "SUITE-Regular", size: 17)
               } else if IS_IPHONE_MINI {
                   BloodSugarManagementNotebookView.FastingBloodSugarPercent.font = UIFont(name: "SUITE-Regular", size: 15)
               } else {
                   BloodSugarManagementNotebookView.FastingBloodSugarPercent.font = UIFont(name: "SUITE-Regular", size: 15)
               }
               
               
               BloodSugarManagementNotebookView.FastingBloodSugarPercent.numberOfLines = 0
               BloodSugarManagementNotebookView.FastingBloodSugarPercent.textAlignment = .center
               
               
               
               
               
               BloodSugarManagementNotebookView.FastingBloodSugarPercent.textColor = .white
               BloodSugarManagementNotebookView.FastingBloodSugar.addSubview(BloodSugarManagementNotebookView.FastingBloodSugarPercent)
               
               
               // we want the arc to be inset a bit, so we'll embed it in a "container"
               let container = UIView()
               container.backgroundColor = .systemYellow
               
               container.translatesAutoresizingMaskIntoConstraints = false
               BloodSugarManagementNotebookView.FastingBloodSugar.addSubview(container)
               
               hcpView.translatesAutoresizingMaskIntoConstraints = false
               container.addSubview(hcpView)
               
               //                let g = view.safeAreaLayoutGuide
               if IS_IPHONE_12PRO_MAX {
                   NSLayoutConstraint.activate([
                       
                       container.leadingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugar.leadingAnchor, constant: 190.0),
                       container.trailingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugar.trailingAnchor, constant: 10.0),
                       container.heightAnchor.constraint(equalTo: container.widthAnchor, multiplier: 0.6),
                       //            container.centerXAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerXAnchor),
                       container.centerYAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerYAnchor, constant: 100),
                       
                       // let's inset our progress view by 40-points on each side
                       hcpView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 40.0),
                       hcpView.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -40.0),
                       
                       // give hcpView a 2:1 ratio
                       hcpView.heightAnchor.constraint(equalTo: hcpView.widthAnchor, multiplier: 1.0 / 2.0),
                       
                       hcpView.centerYAnchor.constraint(equalTo: container.centerYAnchor),
                       
                       
                   ])/////durl
                   
                   
               } else if IS_IPHONE_15PRO_MAX {
                   NSLayoutConstraint.activate([
                       
                       container.leadingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugar.leadingAnchor, constant: 190.0),
                       container.trailingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugar.trailingAnchor, constant: 10.0),
                       container.heightAnchor.constraint(equalTo: container.widthAnchor, multiplier: 0.6),
                       //            container.centerXAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerXAnchor),
                       container.centerYAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerYAnchor, constant: 100),
                       
                       // let's inset our progress view by 40-points on each side
                       hcpView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 40.0),
                       hcpView.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -40.0),
                       
                       // give hcpView a 2:1 ratio
                       hcpView.heightAnchor.constraint(equalTo: hcpView.widthAnchor, multiplier: 1.0 / 2.0),
                       
                       hcpView.centerYAnchor.constraint(equalTo: container.centerYAnchor),
                       
                       
                   ])/////durl
                   
                   
               }
       //        else if IS_IPHONE_X  {
       //            NSLayoutConstraint.activate([
       //
       //                container.leadingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugar.leadingAnchor, constant: 150.0),
       //                container.trailingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugar.trailingAnchor, constant: -10.0),
       //                container.heightAnchor.constraint(equalTo: container.widthAnchor, multiplier: 1.2),
       //                //            container.centerXAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerXAnchor),
       //                container.centerYAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerYAnchor, constant: 100),
       //
       //                // let's inset our progress view by 40-points on each side
       //                hcpView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 40.0),
       //                hcpView.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -40.0),
       //
       //                // give hcpView a 2:1 ratio
       //                hcpView.heightAnchor.constraint(equalTo: hcpView.widthAnchor, multiplier: 1.0 / 2.0),
       //
       //                hcpView.centerYAnchor.constraint(equalTo: container.centerYAnchor),
       //
       //            ])
       //        }
               else if IS_IPHONE_N_PLUS  {
                   NSLayoutConstraint.activate([
                       
                       container.leadingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugar.leadingAnchor, constant: 175),
                       container.trailingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugar.trailingAnchor, constant: 10.0),
                       container.heightAnchor.constraint(equalTo: container.widthAnchor, multiplier: 1),
                       //            container.centerXAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerXAnchor),
                       container.centerYAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerYAnchor, constant: 90),
                       
                       // let's inset our progress view by 40-points on each side
                       hcpView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 40.0),
                       hcpView.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -40.0),
                       
                       // give hcpView a 2:1 ratio
                       hcpView.heightAnchor.constraint(equalTo: hcpView.widthAnchor, multiplier: 1.0 / 2.0),
                       
                       hcpView.centerYAnchor.constraint(equalTo: container.centerYAnchor),
                       
                   ])
               } else if IS_IPHONE_N  {
                   NSLayoutConstraint.activate([
                       
                       container.leadingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugar.leadingAnchor, constant: 165),
                       container.trailingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugar.trailingAnchor, constant: 10.0),
                       container.heightAnchor.constraint(equalTo: container.widthAnchor, multiplier: 1),
                       //            container.centerXAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerXAnchor),
                       container.centerYAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerYAnchor, constant: 80),
                       
                       // let's inset our progress view by 40-points on each side
                       hcpView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 40.0),
                       hcpView.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -40.0),
                       
                       // give hcpView a 2:1 ratio
                       hcpView.heightAnchor.constraint(equalTo: hcpView.widthAnchor, multiplier: 1.0 / 2.0),
                       
                       hcpView.centerYAnchor.constraint(equalTo: container.centerYAnchor),
                       
                   ])
               } else if IS_IPHONE_MINI  {
                   NSLayoutConstraint.activate([
                       
                       container.leadingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugar.leadingAnchor, constant: 165),
                       container.trailingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugar.trailingAnchor, constant: 10.0),
                       container.heightAnchor.constraint(equalTo: container.widthAnchor, multiplier: 1),
                       //            container.centerXAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerXAnchor),
                       container.centerYAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerYAnchor, constant: 80),
                       
                       // let's inset our progress view by 40-points on each side
                       hcpView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 40.0),
                       hcpView.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -40.0),
                       
                       // give hcpView a 2:1 ratio
                       hcpView.heightAnchor.constraint(equalTo: hcpView.widthAnchor, multiplier: 1.0 / 2.0),
                       
                       hcpView.centerYAnchor.constraint(equalTo: container.centerYAnchor),
                       
                   ])
               } else if IS_IPHONE_12PRO  {
                   NSLayoutConstraint.activate([
                       
                       container.leadingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugar.leadingAnchor, constant: 165),
                       container.trailingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugar.trailingAnchor, constant: 10.0),
                       container.heightAnchor.constraint(equalTo: container.widthAnchor, multiplier: 1),
                       //            container.centerXAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerXAnchor),
                       container.centerYAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerYAnchor, constant: 80),
                       
                       // let's inset our progress view by 40-points on each side
                       hcpView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 40.0),
                       hcpView.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -40.0),
                       
                       // give hcpView a 2:1 ratio
                       hcpView.heightAnchor.constraint(equalTo: hcpView.widthAnchor, multiplier: 1.0 / 2.0),
                       
                       hcpView.centerYAnchor.constraint(equalTo: container.centerYAnchor),
                       
                   ])
               } else if IS_IPHONE_15PRO  {
                   NSLayoutConstraint.activate([
                       
                       container.leadingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugar.leadingAnchor, constant: 165),
                       container.trailingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugar.trailingAnchor, constant: 10.0),
                       container.heightAnchor.constraint(equalTo: container.widthAnchor, multiplier: 1),
                       //            container.centerXAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerXAnchor),
                       container.centerYAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerYAnchor, constant: 80),
                       
                       // let's inset our progress view by 40-points on each side
                       hcpView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 40.0),
                       hcpView.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -40.0),
                       
                       // give hcpView a 2:1 ratio
                       hcpView.heightAnchor.constraint(equalTo: hcpView.widthAnchor, multiplier: 1.0 / 2.0),
                       
                       hcpView.centerYAnchor.constraint(equalTo: container.centerYAnchor),
                       
                   ])
               } else {
                   NSLayoutConstraint.activate([
                       
                       container.leadingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugar.leadingAnchor, constant: 165),
                       container.trailingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugar.trailingAnchor, constant: 10.0),
                       container.heightAnchor.constraint(equalTo: container.widthAnchor, multiplier: 1),
                       //            container.centerXAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerXAnchor),
                       container.centerYAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerYAnchor, constant: 90),
                       
                       // let's inset our progress view by 40-points on each side
                       hcpView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 40.0),
                       hcpView.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -40.0),
                       
                       // give hcpView a 2:1 ratio
                       hcpView.heightAnchor.constraint(equalTo: hcpView.widthAnchor, multiplier: 1.0 / 2.0),
                       
                       hcpView.centerYAnchor.constraint(equalTo: container.centerYAnchor),
                       
                   ])
               }
               
               
               
               ////////////
               if UserDefaults.standard.object(forKey: "perGraphS1") == nil {
                   hcpView.progress = 00
               } else {
                   hcpView.progress = UserDefaults.standard.object(forKey: "perGraphS1") as! CGFloat * 0.01
               }
               
               
               if IS_IPHONE_12PRO_MAX {
                   showLabel = UILabel(frame: CGRect(x: 44, y: 32, width: 42, height: 30))
                   
                   hcpView.addSubview(showLabel)
                   
       //                    showLabel.layer.borderWidth = 1
                   showLabel.textAlignment = .center
       //            var changeShowLabel = Int(random)
                   var changeShowLabel = UserDefaults.standard.object(forKey: "persenS1")
                   print(changeShowLabel, "여기의 값은?")
                   
                   showLabel.font = UIFont(name: "SUITE-Heavy", size: 13)
                   showLabel.textColor = .white
                   
                   showLabel.text = "\(changeShowLabel ?? 0)%"
       //            showLabel.text = UserDefaults.standard.string(forKey: "perB")
               } else if IS_IPHONE_15PRO_MAX {
                   showLabel = UILabel(frame: CGRect(x: 44, y: 32, width: 42, height: 30))
                   
                   hcpView.addSubview(showLabel)
                   
       //                    showLabel.layer.borderWidth = 1
                   showLabel.textAlignment = .center
       //            var changeShowLabel = Int(random)
                   var changeShowLabel = UserDefaults.standard.object(forKey: "persenS1")
                   print(changeShowLabel, "여기의 값은?")
                   
                   showLabel.font = UIFont(name: "SUITE-Heavy", size: 13)
                   showLabel.textColor = .white
                   
                   showLabel.text = "\(changeShowLabel ?? 0)%"
       //            showLabel.text = UserDefaults.standard.string(forKey: "perB")
               } else if IS_IPHONE_X {
                   showLabel = UILabel(frame: CGRect(x: 27, y: 23, width: 45, height: 30))
                   
                   hcpView.addSubview(showLabel)
                   
                   //        showLabel.layer.borderWidth = 1
                   
       //            var changeShowLabel = Int(random)
                   var changeShowLabel = UserDefaults.standard.object(forKey: "persenS1")
                   print(changeShowLabel, "여기의 값은?")
                   showLabel.textAlignment = .center
                   showLabel.font = UIFont(name: "SUITE-Heavy", size: 13)
                   showLabel.textColor = .white
       //            showLabel.layer.borderWidth = 1
                   showLabel.text = "\(changeShowLabel ?? 0)%"
       //            showLabel.text = UserDefaults.standard.string(forKey: "perB")
               } else if IS_IPHONE_N_PLUS {
                   showLabel = UILabel(frame: CGRect(x: 40, y: 31, width: 50, height: 30))
                   
                   hcpView.addSubview(showLabel)
                   
       //                    showLabel.layer.borderWidth = 1
                   showLabel.textAlignment = .center
       //            var changeShowLabel = Int(random)
                   var changeShowLabel = UserDefaults.standard.object(forKey: "persenS1")
                   print(changeShowLabel, "여기의 값은?")
                   
                   showLabel.font = UIFont(name: "SUITE-Heavy", size: 12)
                   showLabel.textColor = .white
                   showLabel.text = "\(changeShowLabel ?? 0)%"
       //            showLabel.text = UserDefaults.standard.string(forKey: "perB")
               } else if IS_IPHONE_N {
                   showLabel = UILabel(frame: CGRect(x: 25, y: 28, width: 51, height: 30))
                   
                   hcpView.addSubview(showLabel)
                   
       //                    showLabel.layer.borderWidth = 1
                   
       //            var changeShowLabel = Int(random)
                   var changeShowLabel = UserDefaults.standard.object(forKey: "persenS1")
                   print(changeShowLabel, "여기의 값은?")
                   showLabel.textAlignment = .center
                   showLabel.font = UIFont(name: "SUITE-Heavy", size: 12)
                   showLabel.textColor = .white
                   showLabel.text = "\(changeShowLabel ?? 0)%"
       //            showLabel.text = UserDefaults.standard.string(forKey: "perB")
               } else if IS_IPHONE_12PRO {
                   showLabel = UILabel(frame: CGRect(x: 34, y: 28, width: 51, height: 30))
                   
                   hcpView.addSubview(showLabel)
                   
       //                    showLabel.layer.borderWidth = 1
                   
       //            var changeShowLabel = Int(random)
                   var changeShowLabel = UserDefaults.standard.object(forKey: "persenS1")
                   print(changeShowLabel, "여기의 값은?")
                   showLabel.textAlignment = .center
                   showLabel.font = UIFont(name: "SUITE-Heavy", size: 12)
                   showLabel.textColor = .white
                   showLabel.text = "\(changeShowLabel ?? 0)%"
       //            showLabel.text = UserDefaults.standard.string(forKey: "perB")
               } else if IS_IPHONE_15PRO {
                   showLabel = UILabel(frame: CGRect(x: 34, y: 28, width: 51, height: 30))
                   
                   hcpView.addSubview(showLabel)
                   
       //                    showLabel.layer.borderWidth = 1
                   
       //            var changeShowLabel = Int(random)
                   var changeShowLabel = UserDefaults.standard.object(forKey: "persenS1")
                   print(changeShowLabel, "여기의 값은?")
                   showLabel.textAlignment = .center
                   showLabel.font = UIFont(name: "SUITE-Heavy", size: 12)
                   showLabel.textColor = .white
                   showLabel.text = "\(changeShowLabel ?? 0)%"
       //            showLabel.text = UserDefaults.standard.string(forKey: "perB")
               } else {
                   showLabel = UILabel(frame: CGRect(x: 49, y: 31, width: 42, height: 30))
                   
                   hcpView.addSubview(showLabel)
                   
                   //        showLabel.layer.borderWidth = 1
                   
       //            var changeShowLabel = Int(random)
                   var changeShowLabel = UserDefaults.standard.object(forKey: "persenS1")
                   print(changeShowLabel, "여기의 값은?")
                   showLabel.textAlignment = .center
                   showLabel.font = UIFont(name: "SUITE-Heavy", size: 12)
                   showLabel.textColor = .white
                   showLabel.text = "\(changeShowLabel ?? 0)%"
       //            showLabel.text = UserDefaults.standard.string(forKey: "perB")
               }
               
               
               
               
               pctLabel.translatesAutoresizingMaskIntoConstraints = false
               hcpView.addSubview(pctLabel)
               // add the pctLabel in the middle of the arc
               NSLayoutConstraint.activate([
                   pctLabel.centerXAnchor.constraint(equalTo: hcpView.centerXAnchor),
                   pctLabel.centerYAnchor.constraint(equalTo: hcpView.centerYAnchor),
               ])
               
               // let's add some percent / progress buttons
               //                let btnStack = UIStackView()
               //                btnStack.spacing = 4
               //                btnStack.distribution = .fillEqually
               //                [0.0, 0.1, 0.25, 0.33, 0.61, 0.8, 1.0].forEach { v in
               //                    let b = UIButton()
               //                    b.setTitle("\(v)", for: [])
               //                    b.setTitleColor(.white, for: .normal)
               //                    b.setTitleColor(.lightGray, for: .highlighted)
               //                    b.titleLabel?.font = .systemFont(ofSize: 13.0, weight: .bold)
               //                    b.backgroundColor = .systemGreen
               //                    b.layer.cornerRadius = 6
               //                    b.addTarget(self, action: #selector(btnTapped(_:)), for: .touchUpInside)
               //                    btnStack.addArrangedSubview(b)
               //                }
               //
               //                btnStack.translatesAutoresizingMaskIntoConstraints = false
               //                view.addSubview(btnStack)
               
               // let's add a slider to set the progress
               //                let slider = UISlider()
               //                slider.translatesAutoresizingMaskIntoConstraints = false
               //                view.addSubview(slider)
               //
               //                NSLayoutConstraint.activate([
               //
               //                    btnStack.topAnchor.constraint(equalTo: container.bottomAnchor, constant: 20.0),
               //                    btnStack.leadingAnchor.constraint(equalTo: g.leadingAnchor, constant: 20.0),
               //                    btnStack.trailingAnchor.constraint(equalTo: g.trailingAnchor, constant: -20.0),
               //
               //                    slider.topAnchor.constraint(equalTo: btnStack.bottomAnchor, constant: 20.0),
               //                    slider.leadingAnchor.constraint(equalTo: g.leadingAnchor, constant: 20.0),
               //                    slider.trailingAnchor.constraint(equalTo: g.trailingAnchor, constant: -20.0),
               //
               //                ])
               //
               //                slider.addTarget(self, action: #selector(sliderChanged(_:)), for: .valueChanged)
               //
               //                sliderChanged(slider)
               
               container.backgroundColor = .clear
               
               
               
               
               BloodSugarManagementNotebookView.FastingBloodSugarGraph = UIView(frame: CGRect(x: BloodSugarManagementNotebookView.FastingBloodSugarPercent.frame.minX, y: BloodSugarManagementNotebookView.FastingBloodSugarPercent.frame.maxY + 20, width: BloodSugarManagementNotebookView.FastingBloodSugar.frame.size.width / 3, height: BloodSugarManagementNotebookView.FastingBloodSugar.frame.size.height / 2.2))
               BloodSugarManagementNotebookView.FastingBloodSugarGraph.backgroundColor = .clear
               //        BloodSugarManagementNotebookView.FastingBloodSugarGraph.layer.borderWidth = 1
                       BloodSugarManagementNotebookView.FastingBloodSugar.layer.cornerRadius = 8
               BloodSugarManagementNotebookView.FastingBloodSugar.addSubview(BloodSugarManagementNotebookView.FastingBloodSugarGraph)
               
               
               
               //        let slayer = CAShapeLayer()
               //        let center = CGPoint(x: (BloodSugarManagementNotebookView.FastingBloodSugarGraph.frame.width / 2) + 4, y: BloodSugarManagementNotebookView.FastingBloodSugarGraph.frame.height - 8)
               //         let radius: CGFloat = BloodSugarManagementNotebookView.FastingBloodSugarGraph.frame.height - 16
               //         let startAngle: CGFloat = 4 * .pi / 4
               //         let endAngle: CGFloat = 0.0
               //         slayer.path = UIBezierPath(arcCenter: center,
               //                                       radius: radius,
               //                                       startAngle: startAngle,
               //                                       endAngle: endAngle,
               //                                       clockwise: true).cgPath
               //         slayer.lineWidth = 15.0
               //        slayer.lineCap = CAShapeLayerLineCap.round
               //         slayer.strokeColor = UIColor.blue.cgColor
               //         slayer.fillColor = UIColor.clear.cgColor
               ////         self.layer.addSublayer(slayer)
               //        BloodSugarManagementNotebookView.FastingBloodSugarGraph.layer.addSublayer(slayer)
               
               //        animate()
               
               
       //        BloodSugarManagementNotebookView.PostprandialBloodSugar = UIView(frame: CGRect(x: 20, y: BloodSugarManagementNotebookView.FastingBloodSugar.frame.maxY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 4.5))
       //        if IS_IPHONE_N {
       //            BloodSugarManagementNotebookView.PostprandialBloodSugar = UIView(frame: CGRect(x: 20, y: BloodSugarManagementNotebookView.FastingBloodSugar.frame.maxY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 4))
       //        }
       //
       //        if IS_IPHONE_N_PLUS {
       //            BloodSugarManagementNotebookView.PostprandialBloodSugar = UIView(frame: CGRect(x: 20, y: BloodSugarManagementNotebookView.FastingBloodSugar.frame.maxY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 4))
       //        }
               
               BloodSugarManagementNotebookView.PostprandialBloodSugar = UIView(frame: CGRect(x: 20, y: BloodSugarManagementNotebookView.FastingBloodSugar.frame.maxY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 5.5))
               if IS_IPHONE_N {
                   BloodSugarManagementNotebookView.PostprandialBloodSugar = UIView(frame: CGRect(x: 20, y: BloodSugarManagementNotebookView.FastingBloodSugar.frame.maxY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 5))
               }
               
               if IS_IPHONE_N_PLUS {
                   BloodSugarManagementNotebookView.PostprandialBloodSugar = UIView(frame: CGRect(x: 20, y: BloodSugarManagementNotebookView.FastingBloodSugar.frame.maxY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 5))
               }
               
               //        BloodSugarManagementNotebookView.PostprandialBloodSugar.backgroundColor = #colorLiteral(red: 0.009351861663, green: 0.4616524577, blue: 0.943269372, alpha: 1)
               BloodSugarManagementNotebookView.PostprandialBloodSugar.setGradient3(color1: UIColor(red: 0.0 / 255.0, green: 74 / 255.0, blue: 241.0 / 255.0, alpha: 1), color2: UIColor(red: 0.0 / 255.0, green: 130 / 255.0, blue: 241 / 255.0, alpha: 1))
               //        BloodSugarManagementNotebookView.FastingBloodSugar.layer.borderWidth = 1
               BloodSugarManagementNotebookView.PostprandialBloodSugar.layer.cornerRadius = 8
               scrollView.addSubview(BloodSugarManagementNotebookView.PostprandialBloodSugar)
               
               
               
               let strokeUnderBar2 = UIView(frame: CGRect(x: 0, y: 20, width: 1, height: BloodSugarManagementNotebookView.PostprandialBloodSugar.frame.size.height - 40))
               strokeUnderBar2.backgroundColor =  #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1).withAlphaComponent(0.8)

               strokeUnderBar2.center.x = BloodSugarManagementNotebookView.PostprandialBloodSugar.frame.size.width / 2
               BloodSugarManagementNotebookView.PostprandialBloodSugar.addSubview(strokeUnderBar2)
               
               
               
               BloodSugarManagementNotebookView.PostprandialBloodSugarLabel = UILabel(frame: CGRect(x: 20, y: 20, width: 140, height: BloodSugarManagementNotebookView.PostprandialBloodSugar.frame.size.height / 4))
               BloodSugarManagementNotebookView.PostprandialBloodSugarLabel.text = ""
               //        BloodSugarManagementNotebookView.PostprandialBloodSugarLabel.textAlignment = .center
               //        BloodSugarManagementNotebookView.PostprandialBloodSugarLabel.numberOfLines = 0
               
               if IS_IPHONE_12PRO_MAX {
                   BloodSugarManagementNotebookView.PostprandialBloodSugarLabel.font = UIFont(name: "SUITE-Regular", size: 20)
               } else if IS_IPHONE_15PRO_MAX {
                   BloodSugarManagementNotebookView.PostprandialBloodSugarLabel.font = UIFont(name: "SUITE-Regular", size: 20)
               } else if IS_IPHONE_N_PLUS {
                   BloodSugarManagementNotebookView.PostprandialBloodSugarLabel.font = UIFont(name: "SUITE-Regular", size: 17)
               } else if IS_IPHONE_X {
                   BloodSugarManagementNotebookView.PostprandialBloodSugarLabel.font = UIFont(name: "SUITE-Regular", size: 15)
               } else {
                   BloodSugarManagementNotebookView.PostprandialBloodSugarLabel.font = UIFont(name: "SUITE-Regular", size: 15)
               }
               BloodSugarManagementNotebookView.PostprandialBloodSugarLabel.numberOfLines = 0
               BloodSugarManagementNotebookView.PostprandialBloodSugarLabel.textAlignment = .center
               
               
               
               BloodSugarManagementNotebookView.PostprandialBloodSugarLabel.textColor = .white
               
               //삭제할것
               BloodSugarManagementNotebookView.PostprandialBloodSugar.addSubview(BloodSugarManagementNotebookView.PostprandialBloodSugarLabel)
               
               
               
               
               BloodSugarManagementNotebookView.PostprandialBloodSugarShowLabel = UILabel(frame: CGRect(x: 15, y: 22, width: 150, height: BloodSugarManagementNotebookView.PostprandialBloodSugar.frame.size.height / 4))
               BloodSugarManagementNotebookView.PostprandialBloodSugarShowLabel.text = "식후혈당\n(Postprandial glucose)"
               
               
               if IS_IPHONE_12PRO_MAX {
                   BloodSugarManagementNotebookView.PostprandialBloodSugarShowLabel.font = UIFont(name: "SUITE-Regular", size: 13)
               } else if IS_IPHONE_15PRO_MAX {
                   BloodSugarManagementNotebookView.PostprandialBloodSugarShowLabel.font = UIFont(name: "SUITE-Regular", size: 13)
               } else if IS_IPHONE_N_PLUS {
                   BloodSugarManagementNotebookView.PostprandialBloodSugarShowLabel.font = UIFont(name: "SUITE-Regular", size: 11)
               } else if IS_IPHONE_X {
                   BloodSugarManagementNotebookView.PostprandialBloodSugarShowLabel.font = UIFont(name: "SUITE-Regular", size: 11)
               } else {
                   BloodSugarManagementNotebookView.PostprandialBloodSugarShowLabel.font = UIFont(name: "SUITE-Regular", size: 11)
               }
               
               BloodSugarManagementNotebookView.PostprandialBloodSugarShowLabel.textAlignment = .center
               BloodSugarManagementNotebookView.PostprandialBloodSugarShowLabel.numberOfLines = 0
               
               
               
               BloodSugarManagementNotebookView.PostprandialBloodSugarShowLabel.textColor = .white
               BloodSugarManagementNotebookView.PostprandialBloodSugar.addSubview(BloodSugarManagementNotebookView.PostprandialBloodSugarShowLabel)
               
               
               
               BloodSugarManagementNotebookView.PostprandialBloodSugarShowNumLabelNumber = UILabel(frame: CGRect(x: 40, y: BloodSugarManagementNotebookView.PostprandialBloodSugarShowLabel.frame.maxY + 20, width: 50, height: BloodSugarManagementNotebookView.FastingBloodSugar.frame.size.height / 6))
               BloodSugarManagementNotebookView.PostprandialBloodSugarShowNumLabelNumber.text = "120"
               
               BloodSugarManagementNotebookView.PostprandialBloodSugarShowNumLabelNumber.textAlignment = .right
               BloodSugarManagementNotebookView.PostprandialBloodSugarShowNumLabelNumber.font = UIFont(name: "SUITE-Heavy", size: 26)
               
               BloodSugarManagementNotebookView.PostprandialBloodSugarShowNumLabelNumber.textColor = .white
               BloodSugarManagementNotebookView.PostprandialBloodSugarShowNumLabelNumber.numberOfLines = 0
               BloodSugarManagementNotebookView.PostprandialBloodSugar.addSubview(BloodSugarManagementNotebookView.PostprandialBloodSugarShowNumLabelNumber)
               
               
               
               
               
               
               BloodSugarManagementNotebookView.PostprandialBloodSugarShowNumLabel = UILabel(frame: CGRect(x: BloodSugarManagementNotebookView.PostprandialBloodSugarShowNumLabelNumber.frame.maxX + 5, y: BloodSugarManagementNotebookView.PostprandialBloodSugarShowLabel.frame.maxY + 20, width: 50, height: BloodSugarManagementNotebookView.PostprandialBloodSugar.frame.size.height / 3))
               BloodSugarManagementNotebookView.PostprandialBloodSugarShowNumLabel.text = "mg/dL\n이하"
               
               BloodSugarManagementNotebookView.PostprandialBloodSugarShowNumLabel.textAlignment = .left
               BloodSugarManagementNotebookView.PostprandialBloodSugarShowNumLabel.numberOfLines = 0
               BloodSugarManagementNotebookView.PostprandialBloodSugarShowNumLabel.font = UIFont(name: "SUITE-Regular", size: 13)
               
               BloodSugarManagementNotebookView.PostprandialBloodSugarShowNumLabel.textColor = .white
               BloodSugarManagementNotebookView.PostprandialBloodSugar.addSubview(BloodSugarManagementNotebookView.PostprandialBloodSugarShowNumLabel)
               
               
               
               
               
               BloodSugarManagementNotebookView.PostprandialBloodSugarPercent = UILabel(frame: CGRect(x: BloodSugarManagementNotebookView.PostprandialBloodSugar.frame.maxX - 180, y: 20, width: 130, height: BloodSugarManagementNotebookView.PostprandialBloodSugar.frame.size.height / 4))
               BloodSugarManagementNotebookView.PostprandialBloodSugarPercent.text = ""
               
               if IS_IPHONE_12PRO_MAX {
                   BloodSugarManagementNotebookView.PostprandialBloodSugarPercent.font = UIFont(name: "SUITE-Regular", size: 20)
               } else if IS_IPHONE_15PRO_MAX {
                   BloodSugarManagementNotebookView.PostprandialBloodSugarPercent.font = UIFont(name: "SUITE-Regular", size: 20)
               } else if IS_IPHONE_N_PLUS {
                   BloodSugarManagementNotebookView.PostprandialBloodSugarPercent.font = UIFont(name: "SUITE-Regular", size: 17)
               } else if IS_IPHONE_X {
                   BloodSugarManagementNotebookView.PostprandialBloodSugarPercent.font = UIFont(name: "SUITE-Regular", size: 15)
               } else {
                   BloodSugarManagementNotebookView.PostprandialBloodSugarPercent.font = UIFont(name: "SUITE-Regular", size: 15)
               }
               
               
               
               BloodSugarManagementNotebookView.PostprandialBloodSugarPercent.textAlignment = .center
               BloodSugarManagementNotebookView.PostprandialBloodSugarPercent.numberOfLines = 0
               
               BloodSugarManagementNotebookView.PostprandialBloodSugarPercent.textColor = .white
               BloodSugarManagementNotebookView.PostprandialBloodSugar.addSubview(BloodSugarManagementNotebookView.PostprandialBloodSugarPercent)
               
               
               
               
               
               // we want the arc to be inset a bit, so we'll embed it in a "container"
               let container2 = UIView()
               container2.backgroundColor = .systemYellow
               
               container2.translatesAutoresizingMaskIntoConstraints = false
               BloodSugarManagementNotebookView.PostprandialBloodSugar.addSubview(container2)
               
               hcpView2.translatesAutoresizingMaskIntoConstraints = false
               container2.addSubview(hcpView2)
               if IS_IPHONE_12PRO_MAX {
                   //                let g = view.safeAreaLayoutGuide
                   NSLayoutConstraint.activate([
                       
                       container2.leadingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.PostprandialBloodSugar.leadingAnchor, constant: 190.0),
                       container2.trailingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.PostprandialBloodSugar.trailingAnchor, constant: 10.0),
                       container2.heightAnchor.constraint(equalTo: container.widthAnchor, multiplier: 0.6),
                       //            container.centerXAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerXAnchor),
                       container2.centerYAnchor.constraint(equalTo: BloodSugarManagementNotebookView.PostprandialBloodSugarPercent.centerYAnchor, constant: 45),
                       
                       // let's inset our progress view by 40-points on each side
                       hcpView2.leadingAnchor.constraint(equalTo: container2.leadingAnchor, constant: 40.0),
                       hcpView2.trailingAnchor.constraint(equalTo: container2.trailingAnchor, constant: -40.0),
                       
                       // give hcpView a 2:1 ratio
                       hcpView2.heightAnchor.constraint(equalTo: hcpView2.widthAnchor, multiplier: 1.0 / 2.0),
                       
                       hcpView2.centerYAnchor.constraint(equalTo: container2.centerYAnchor),
                       
                   ])
               } else if IS_IPHONE_15PRO_MAX {
                   //                let g = view.safeAreaLayoutGuide
                   NSLayoutConstraint.activate([
                       
                       container2.leadingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.PostprandialBloodSugar.leadingAnchor, constant: 190.0),
                       container2.trailingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.PostprandialBloodSugar.trailingAnchor, constant: 10.0),
                       container2.heightAnchor.constraint(equalTo: container.widthAnchor, multiplier: 0.6),
                       //            container.centerXAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerXAnchor),
                       container2.centerYAnchor.constraint(equalTo: BloodSugarManagementNotebookView.PostprandialBloodSugarPercent.centerYAnchor, constant: 45),
                       
                       // let's inset our progress view by 40-points on each side
                       hcpView2.leadingAnchor.constraint(equalTo: container2.leadingAnchor, constant: 40.0),
                       hcpView2.trailingAnchor.constraint(equalTo: container2.trailingAnchor, constant: -40.0),
                       
                       // give hcpView a 2:1 ratio
                       hcpView2.heightAnchor.constraint(equalTo: hcpView2.widthAnchor, multiplier: 1.0 / 2.0),
                       
                       hcpView2.centerYAnchor.constraint(equalTo: container2.centerYAnchor),
                       
                   ])
               }
       //        else if IS_IPHONE_X {
       //            //                let g = view.safeAreaLayoutGuide
       //            NSLayoutConstraint.activate([
       //
       //                container2.leadingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.PostprandialBloodSugar.leadingAnchor, constant: 150),
       //                container2.trailingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.PostprandialBloodSugar.trailingAnchor, constant: -10.0),
       //                container2.heightAnchor.constraint(equalTo: container.widthAnchor, multiplier: 1.2),
       //                //            container.centerXAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerXAnchor),
       //                container2.centerYAnchor.constraint(equalTo: BloodSugarManagementNotebookView.PostprandialBloodSugarPercent.centerYAnchor, constant: 45),
       //
       //                // let's inset our progress view by 40-points on each side
       //                hcpView2.leadingAnchor.constraint(equalTo: container2.leadingAnchor, constant: 40.0),
       //                hcpView2.trailingAnchor.constraint(equalTo: container2.trailingAnchor, constant: -40.0),
       //
       //                // give hcpView a 2:1 ratio
       //                hcpView2.heightAnchor.constraint(equalTo: hcpView2.widthAnchor, multiplier: 1.0 / 2.0),
       //
       //                hcpView2.centerYAnchor.constraint(equalTo: container2.centerYAnchor),
       //
       //            ])
       //        }
               else if IS_IPHONE_N_PLUS  {
                   //                let g = view.safeAreaLayoutGuide
                   NSLayoutConstraint.activate([
                       
                       container2.leadingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.PostprandialBloodSugar.leadingAnchor, constant: 175),
                       container2.trailingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.PostprandialBloodSugar.trailingAnchor, constant: 10.0),
                       container2.heightAnchor.constraint(equalTo: container.widthAnchor, multiplier: 1),
                       //            container.centerXAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerXAnchor),
                       container2.centerYAnchor.constraint(equalTo: BloodSugarManagementNotebookView.PostprandialBloodSugarPercent.centerYAnchor, constant: 40),
                       
                       // let's inset our progress view by 40-points on each side
                       hcpView2.leadingAnchor.constraint(equalTo: container2.leadingAnchor, constant: 40.0),
                       hcpView2.trailingAnchor.constraint(equalTo: container2.trailingAnchor, constant: -40.0),
                       
                       // give hcpView a 2:1 ratio
                       hcpView2.heightAnchor.constraint(equalTo: hcpView2.widthAnchor, multiplier: 1.0 / 2.0),
                       
                       hcpView2.centerYAnchor.constraint(equalTo: container2.centerYAnchor),
                       
                   ])
               } else if IS_IPHONE_N  {
                   //                let g = view.safeAreaLayoutGuide
                   NSLayoutConstraint.activate([
                       
                       container2.leadingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.PostprandialBloodSugar.leadingAnchor, constant: 165),
                       container2.trailingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.PostprandialBloodSugar.trailingAnchor, constant: 10.0),
                       container2.heightAnchor.constraint(equalTo: container.widthAnchor, multiplier: 1),
                       //            container.centerXAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerXAnchor),
                       container2.centerYAnchor.constraint(equalTo: BloodSugarManagementNotebookView.PostprandialBloodSugarPercent.centerYAnchor, constant: 25),
                       
                       // let's inset our progress view by 40-points on each side
                       hcpView2.leadingAnchor.constraint(equalTo: container2.leadingAnchor, constant: 40.0),
                       hcpView2.trailingAnchor.constraint(equalTo: container2.trailingAnchor, constant: -40.0),
                       
                       // give hcpView a 2:1 ratio
                       hcpView2.heightAnchor.constraint(equalTo: hcpView2.widthAnchor, multiplier: 1.0 / 2.0),
                       
                       hcpView2.centerYAnchor.constraint(equalTo: container2.centerYAnchor),
                       
                   ])
               } else if IS_IPHONE_MINI  {
                   //                let g = view.safeAreaLayoutGuide
                   NSLayoutConstraint.activate([
                       
                       container2.leadingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.PostprandialBloodSugar.leadingAnchor, constant: 165),
                       container2.trailingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.PostprandialBloodSugar.trailingAnchor, constant: 10.0),
                       container2.heightAnchor.constraint(equalTo: container.widthAnchor, multiplier: 1),
                       //            container.centerXAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerXAnchor),
                       container2.centerYAnchor.constraint(equalTo: BloodSugarManagementNotebookView.PostprandialBloodSugarPercent.centerYAnchor, constant: 25),
                       
                       // let's inset our progress view by 40-points on each side
                       hcpView2.leadingAnchor.constraint(equalTo: container2.leadingAnchor, constant: 40.0),
                       hcpView2.trailingAnchor.constraint(equalTo: container2.trailingAnchor, constant: -40.0),
                       
                       // give hcpView a 2:1 ratio
                       hcpView2.heightAnchor.constraint(equalTo: hcpView2.widthAnchor, multiplier: 1.0 / 2.0),
                       
                       hcpView2.centerYAnchor.constraint(equalTo: container2.centerYAnchor),
                       
                   ])
               } else if IS_IPHONE_12PRO  {
                   //                let g = view.safeAreaLayoutGuide
                   NSLayoutConstraint.activate([
                       
                       container2.leadingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.PostprandialBloodSugar.leadingAnchor, constant: 165),
                       container2.trailingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.PostprandialBloodSugar.trailingAnchor, constant: 10.0),
                       container2.heightAnchor.constraint(equalTo: container.widthAnchor, multiplier: 1),
                       //            container.centerXAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerXAnchor),
                       container2.centerYAnchor.constraint(equalTo: BloodSugarManagementNotebookView.PostprandialBloodSugarPercent.centerYAnchor, constant: 35),
                       
                       // let's inset our progress view by 40-points on each side
                       hcpView2.leadingAnchor.constraint(equalTo: container2.leadingAnchor, constant: 40.0),
                       hcpView2.trailingAnchor.constraint(equalTo: container2.trailingAnchor, constant: -40.0),
                       
                       // give hcpView a 2:1 ratio
                       hcpView2.heightAnchor.constraint(equalTo: hcpView2.widthAnchor, multiplier: 1.0 / 2.0),
                       
                       hcpView2.centerYAnchor.constraint(equalTo: container2.centerYAnchor),
                       
                   ])
               } else if IS_IPHONE_15PRO  {
                   //                let g = view.safeAreaLayoutGuide
                   NSLayoutConstraint.activate([
                       
                       container2.leadingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.PostprandialBloodSugar.leadingAnchor, constant: 165),
                       container2.trailingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.PostprandialBloodSugar.trailingAnchor, constant: 10.0),
                       container2.heightAnchor.constraint(equalTo: container.widthAnchor, multiplier: 1),
                       //            container.centerXAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerXAnchor),
                       container2.centerYAnchor.constraint(equalTo: BloodSugarManagementNotebookView.PostprandialBloodSugarPercent.centerYAnchor, constant: 35),
                       
                       // let's inset our progress view by 40-points on each side
                       hcpView2.leadingAnchor.constraint(equalTo: container2.leadingAnchor, constant: 40.0),
                       hcpView2.trailingAnchor.constraint(equalTo: container2.trailingAnchor, constant: -40.0),
                       
                       // give hcpView a 2:1 ratio
                       hcpView2.heightAnchor.constraint(equalTo: hcpView2.widthAnchor, multiplier: 1.0 / 2.0),
                       
                       hcpView2.centerYAnchor.constraint(equalTo: container2.centerYAnchor),
                       
                   ])
               } else {
                   //                let g = view.safeAreaLayoutGuide
                   NSLayoutConstraint.activate([
                       
                       container2.leadingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.PostprandialBloodSugar.leadingAnchor, constant: 175),
                       container2.trailingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.PostprandialBloodSugar.trailingAnchor, constant: 10.0),
                       container2.heightAnchor.constraint(equalTo: container.widthAnchor, multiplier: 1),
                       //            container.centerXAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerXAnchor),
                       container2.centerYAnchor.constraint(equalTo: BloodSugarManagementNotebookView.PostprandialBloodSugarPercent.centerYAnchor, constant: 45),
                       
                       // let's inset our progress view by 40-points on each side
                       hcpView2.leadingAnchor.constraint(equalTo: container2.leadingAnchor, constant: 40.0),
                       hcpView2.trailingAnchor.constraint(equalTo: container2.trailingAnchor, constant: -40.0),
                       
                       // give hcpView a 2:1 ratio
                       hcpView2.heightAnchor.constraint(equalTo: hcpView2.widthAnchor, multiplier: 1.0 / 2.0),
                       
                       hcpView2.centerYAnchor.constraint(equalTo: container2.centerYAnchor),
                       
                   ])
               }
              
               if UserDefaults.standard.object(forKey: "perGraphS2") == nil {
                   hcpView2.progress = 00
               } else {
                   hcpView2.progress = UserDefaults.standard.object(forKey: "perGraphS2") as! CGFloat * 0.01
               }
               
       //            hcpView2.progress = UserDefaults.standard.object(forKey: "perGraphS2") as! CGFloat * 0.01
       //        hcpView2.progress = 0.3
               
               if IS_IPHONE_12PRO_MAX {
                   showLabel = UILabel(frame: CGRect(x: 44, y: 32, width: 42, height: 30))
                   
                   hcpView2.addSubview(showLabel)
                   
                   //        showLabel.layer.borderWidth = 1
                   
       //            var changeShowLabel = Int(random)
                   var changeShowLabel = UserDefaults.standard.object(forKey: "persenS2")
                   print(changeShowLabel, "여기의 값은?")
                   showLabel.textAlignment = .center
                   showLabel.font = UIFont(name: "SUITE-Heavy", size: 13)
                   showLabel.textColor = .white
                   showLabel.text = "\(changeShowLabel ?? 0)%"
       //            showLabel.text = UserDefaults.standard.string(forKey: "perB")
               } else if IS_IPHONE_15PRO_MAX {
                   showLabel = UILabel(frame: CGRect(x: 44, y: 32, width: 42, height: 30))
                   
                   hcpView2.addSubview(showLabel)
                   
                   //        showLabel.layer.borderWidth = 1
                   
       //            var changeShowLabel = Int(random)
                   var changeShowLabel = UserDefaults.standard.object(forKey: "persenS2")
                   print(changeShowLabel, "여기의 값은?")
                   showLabel.textAlignment = .center
                   showLabel.font = UIFont(name: "SUITE-Heavy", size: 13)
                   showLabel.textColor = .white
                   showLabel.text = "\(changeShowLabel ?? 0)%"
       //            showLabel.text = UserDefaults.standard.string(forKey: "perB")
               } else if IS_IPHONE_X {
                   showLabel = UILabel(frame: CGRect(x: 27, y: 23, width: 45, height: 30))
                   
                   hcpView2.addSubview(showLabel)
                   
                   //        showLabel.layer.borderWidth = 1
                   
       //            var changeShowLabel = Int(random)
                   var changeShowLabel = UserDefaults.standard.object(forKey: "persenS2")
                   print(changeShowLabel, "여기의 값은?")
                   showLabel.textAlignment = .center
                   showLabel.font = UIFont(name: "SUITE-Heavy", size: 13)
                   showLabel.textColor = .white
                   showLabel.text = "\(changeShowLabel ?? 0)%"
       //            showLabel.text = UserDefaults.standard.string(forKey: "perB")
               } else if IS_IPHONE_N_PLUS {
                   showLabel = UILabel(frame: CGRect(x: 40, y: 31, width: 50, height: 30))
                   
                   hcpView2.addSubview(showLabel)
                   
                   //        showLabel.layer.borderWidth = 1
                   showLabel.textAlignment = .center
       //            var changeShowLabel = Int(random)
                   var changeShowLabel = UserDefaults.standard.object(forKey: "persenS2")
                   print(changeShowLabel, "여기의 값은?")
                   
                   showLabel.font = UIFont(name: "SUITE-Heavy", size: 12)
                   showLabel.textColor = .white
                   showLabel.text = "\(changeShowLabel ?? 0)%"
       //            showLabel.text = UserDefaults.standard.string(forKey: "perB")
               } else if IS_IPHONE_N {
                   showLabel = UILabel(frame: CGRect(x: 25, y: 28, width: 51, height: 30))
                   
                   hcpView2.addSubview(showLabel)
                   
       //                    showLabel.layer.borderWidth = 1
                   
       //            var changeShowLabel = Int(random)
                   var changeShowLabel = UserDefaults.standard.object(forKey: "persenS2")
                   print(changeShowLabel, "여기의 값은?")

                   showLabel.textAlignment = .center
                   showLabel.font = UIFont(name: "SUITE-Heavy", size: 12)
                   showLabel.textColor = .white
                   showLabel.text = "\(changeShowLabel ?? 0)%"
       //            showLabel.text = UserDefaults.standard.string(forKey: "perB")
               } else if IS_IPHONE_12PRO {
                   showLabel = UILabel(frame: CGRect(x: 37, y: 30, width: 45, height: 30))
                   
                   hcpView2.addSubview(showLabel)
                   
                   //        showLabel.layer.borderWidth = 1
                   
       //            var changeShowLabel = Int(random)
                   var changeShowLabel = UserDefaults.standard.object(forKey: "persenS2")
                   print(changeShowLabel, "여기의 값은?")
                   showLabel.textAlignment = .center
                   showLabel.font = UIFont(name: "SUITE-Heavy", size: 13)
                   showLabel.textColor = .white
                   showLabel.text = "\(changeShowLabel ?? 0)%"
       //            showLabel.text = UserDefaults.standard.string(forKey: "perB")
               } else if IS_IPHONE_15PRO {
                   showLabel = UILabel(frame: CGRect(x: 37, y: 30, width: 45, height: 30))
                   
                   hcpView2.addSubview(showLabel)
                   
                   //        showLabel.layer.borderWidth = 1
                   
       //            var changeShowLabel = Int(random)
                   var changeShowLabel = UserDefaults.standard.object(forKey: "persenS2")
                   print(changeShowLabel, "여기의 값은?")
                   showLabel.textAlignment = .center
                   showLabel.font = UIFont(name: "SUITE-Heavy", size: 13)
                   showLabel.textColor = .white
                   showLabel.text = "\(changeShowLabel ?? 0)%"
       //            showLabel.text = UserDefaults.standard.string(forKey: "perB")
               } else {
                   showLabel = UILabel(frame: CGRect(x: 39, y: 28, width: 42, height: 30))
                   
                   hcpView2.addSubview(showLabel)
                   
                   //        showLabel.layer.borderWidth = 1
                   
       //            var changeShowLabel = Int(random)
                   var changeShowLabel = UserDefaults.standard.object(forKey: "persenS2")
                   print(changeShowLabel, "여기의 값은?")
                   
                   showLabel.font = UIFont(name: "SUITE-Heavy", size: 12)
                   showLabel.textColor = .white
                   showLabel.text = "\(changeShowLabel ?? 0)%"
       //            showLabel.text = UserDefaults.standard.string(forKey: "perB")
               }
               
              
               pctLabel.translatesAutoresizingMaskIntoConstraints = false
               hcpView2.addSubview(pctLabel)
               // add the pctLabel in the middle of the arc
               NSLayoutConstraint.activate([
                   pctLabel.centerXAnchor.constraint(equalTo: hcpView2.centerXAnchor),
                   pctLabel.centerYAnchor.constraint(equalTo: hcpView2.centerYAnchor),
               ])
               
               // let's add some percent / progress buttons
       //                let btnStack = UIStackView()
       //                btnStack.spacing = 4
       //                btnStack.distribution = .fillEqually
       //                [0.0, 0.1, 0.25, 0.33, 0.61, 0.8, 1.0].forEach { v in
       //                    let b = UIButton()
       //                    b.setTitle("\(v)", for: [])
       //                    b.setTitleColor(.white, for: .normal)
       //                    b.setTitleColor(.lightGray, for: .highlighted)
       //                    b.titleLabel?.font = .systemFont(ofSize: 13.0, weight: .bold)
       //                    b.backgroundColor = .systemGreen
       //                    b.layer.cornerRadius = 6
       //                    b.addTarget(self, action: #selector(btnTapped(_:)), for: .touchUpInside)
       //                    btnStack.addArrangedSubview(b)
       //                }
       //
       //                btnStack.translatesAutoresizingMaskIntoConstraints = false
       //                view.addSubview(btnStack)
               
               // let's add a slider to set the progress
       //                let slider = UISlider()
       //                slider.translatesAutoresizingMaskIntoConstraints = false
       //                view.addSubview(slider)
       //
       //                NSLayoutConstraint.activate([
       //
       //                    btnStack.topAnchor.constraint(equalTo: container.bottomAnchor, constant: 20.0),
       //                    btnStack.leadingAnchor.constraint(equalTo: g.leadingAnchor, constant: 20.0),
       //                    btnStack.trailingAnchor.constraint(equalTo: g.trailingAnchor, constant: -20.0),
       //
       //                    slider.topAnchor.constraint(equalTo: btnStack.bottomAnchor, constant: 20.0),
       //                    slider.leadingAnchor.constraint(equalTo: g.leadingAnchor, constant: 20.0),
       //                    slider.trailingAnchor.constraint(equalTo: g.trailingAnchor, constant: -20.0),
       //
       //                ])
       //
       //                slider.addTarget(self, action: #selector(sliderChanged(_:)), for: .valueChanged)
       //
       //                sliderChanged(slider)
               
               container2.backgroundColor = .clear
               
               
               
               
               
               
               
               
               
               BloodSugarManagementNotebookView.PostprandialBloodSugarGraph = UIView(frame: CGRect(x: BloodSugarManagementNotebookView.PostprandialBloodSugarPercent.frame.minX, y: BloodSugarManagementNotebookView.PostprandialBloodSugarPercent.frame.maxY + 20, width: BloodSugarManagementNotebookView.PostprandialBloodSugar.frame.size.width / 3, height: BloodSugarManagementNotebookView.PostprandialBloodSugar.frame.size.height / 2.2))
               BloodSugarManagementNotebookView.PostprandialBloodSugarGraph.backgroundColor = .clear
       //        BloodSugarManagementNotebookView.FastingBloodSugar.layer.borderWidth = 1
       //        BloodSugarManagementNotebookView.FastingBloodSugar.layer.cornerRadius = 8
               BloodSugarManagementNotebookView.PostprandialBloodSugar.addSubview(BloodSugarManagementNotebookView.PostprandialBloodSugarGraph)
               
       //        animate2()
            
              
               BloodSugarManagementNotebookView.GlycatedHemoglobin = UIView(frame: CGRect(x: 20, y: BloodSugarManagementNotebookView.PostprandialBloodSugar.frame.maxY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 5.5))
               if IS_IPHONE_N {
                   BloodSugarManagementNotebookView.GlycatedHemoglobin = UIView(frame: CGRect(x: 20, y: BloodSugarManagementNotebookView.PostprandialBloodSugar.frame.maxY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 5))
               }
               
               if IS_IPHONE_N_PLUS {
                   BloodSugarManagementNotebookView.GlycatedHemoglobin = UIView(frame: CGRect(x: 20, y: BloodSugarManagementNotebookView.PostprandialBloodSugar.frame.maxY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 5))
               }
               
               
               
       //        BloodSugarManagementNotebookView.GlycatedHemoglobin.backgroundColor = #colorLiteral(red: 0.4349892437, green: 0.1282797456, blue: 0.8903027177, alpha: 1)
               BloodSugarManagementNotebookView.GlycatedHemoglobin.setGradient3(color1: UIColor(red: 128 / 255.0, green: 34 / 255.0, blue: 234 / 255.0, alpha: 1), color2: UIColor(red: 50.0 / 255.0, green: 14 / 255.0, blue: 203 / 255.0, alpha: 1))
       //        BloodSugarManagementNotebookView.FastingBloodSugar.layer.borderWidth = 1
               BloodSugarManagementNotebookView.GlycatedHemoglobin.layer.cornerRadius = 8
               scrollView.addSubview(BloodSugarManagementNotebookView.GlycatedHemoglobin)
               
               
               
               let strokeUnderBar3 = UIView(frame: CGRect(x: 0, y: 20, width: 1, height: BloodSugarManagementNotebookView.GlycatedHemoglobin.frame.size.height - 40))
               strokeUnderBar3.backgroundColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1).withAlphaComponent(0.8)

               strokeUnderBar3.center.x = BloodSugarManagementNotebookView.GlycatedHemoglobin.frame.size.width / 2
               BloodSugarManagementNotebookView.GlycatedHemoglobin.addSubview(strokeUnderBar3)
               
               
               
               BloodSugarManagementNotebookView.GlycatedHemoglobinLabel = UILabel(frame: CGRect(x: 20, y: 20, width: 140, height: BloodSugarManagementNotebookView.GlycatedHemoglobin.frame.size.height / 4))
               BloodSugarManagementNotebookView.GlycatedHemoglobinLabel.text = ""
               BloodSugarManagementNotebookView.GlycatedHemoglobinLabel.textAlignment = .center
               BloodSugarManagementNotebookView.GlycatedHemoglobinLabel.numberOfLines = 0
               
               
               if IS_IPHONE_12PRO_MAX {
                   BloodSugarManagementNotebookView.GlycatedHemoglobinLabel.font = UIFont(name: "SUITE-Regular", size: 20)
               } else  if IS_IPHONE_15PRO_MAX {
                   BloodSugarManagementNotebookView.GlycatedHemoglobinLabel.font = UIFont(name: "SUITE-Regular", size: 20)
               } else if IS_IPHONE_N_PLUS {
                   BloodSugarManagementNotebookView.GlycatedHemoglobinLabel.font = UIFont(name: "SUITE-Regular", size: 17)
               } else if IS_IPHONE_X {
                   BloodSugarManagementNotebookView.GlycatedHemoglobinLabel.font = UIFont(name: "SUITE-Regular", size: 15)
               } else {
                   BloodSugarManagementNotebookView.GlycatedHemoglobinLabel.font = UIFont(name: "SUITE-Regular", size: 15)
               }
               BloodSugarManagementNotebookView.GlycatedHemoglobinLabel.textAlignment = .center
               BloodSugarManagementNotebookView.GlycatedHemoglobinLabel.numberOfLines = 0
               
               
               BloodSugarManagementNotebookView.GlycatedHemoglobinLabel.textColor = .white
               BloodSugarManagementNotebookView.GlycatedHemoglobin.addSubview(BloodSugarManagementNotebookView.GlycatedHemoglobinLabel)
               
               
           
               
               
               BloodSugarManagementNotebookView.GlycatedHemoglobinShowLabel = UILabel(frame: CGRect(x: 15, y: 22, width: 150, height: BloodSugarManagementNotebookView.GlycatedHemoglobin.frame.size.height / 4))
            BloodSugarManagementNotebookView.GlycatedHemoglobinShowLabel.text = "당화혈색소\n(HbA1c)"
               
               if IS_IPHONE_12PRO_MAX {
                   BloodSugarManagementNotebookView.GlycatedHemoglobinShowLabel.font = UIFont(name: "SUITE-Regular", size: 13)
               } else if IS_IPHONE_15PRO_MAX {
                   BloodSugarManagementNotebookView.GlycatedHemoglobinShowLabel.font = UIFont(name: "SUITE-Regular", size: 13)
               } else if IS_IPHONE_N_PLUS {
                   BloodSugarManagementNotebookView.GlycatedHemoglobinShowLabel.font = UIFont(name: "SUITE-Regular", size: 11)
               } else if IS_IPHONE_X {
                   BloodSugarManagementNotebookView.GlycatedHemoglobinShowLabel.font = UIFont(name: "SUITE-Regular", size: 11)
               } else {
                   BloodSugarManagementNotebookView.GlycatedHemoglobinShowLabel.font = UIFont(name: "SUITE-Regular", size: 11)
               }
               
               BloodSugarManagementNotebookView.GlycatedHemoglobinShowLabel.textAlignment = .center
               BloodSugarManagementNotebookView.GlycatedHemoglobinShowLabel.numberOfLines = 0
               
               BloodSugarManagementNotebookView.GlycatedHemoglobinShowLabel.textColor = .white
               BloodSugarManagementNotebookView.GlycatedHemoglobin.addSubview(BloodSugarManagementNotebookView.GlycatedHemoglobinShowLabel)
               
               
               BloodSugarManagementNotebookView.GlycatedHemoglobinShowNumLabelNumber = UILabel(frame: CGRect(x: BloodSugarManagementNotebookView.GlycatedHemoglobin.frame.size.width / 5.8, y: BloodSugarManagementNotebookView.GlycatedHemoglobinShowLabel.frame.maxY + 20, width: 50, height: BloodSugarManagementNotebookView.FastingBloodSugar.frame.size.height / 6))
               BloodSugarManagementNotebookView.GlycatedHemoglobinShowNumLabelNumber.text = "7.0"
               
                  BloodSugarManagementNotebookView.GlycatedHemoglobinShowNumLabelNumber.textAlignment = .right
               BloodSugarManagementNotebookView.GlycatedHemoglobinShowNumLabelNumber.font = UIFont(name: "SUITE-Heavy", size: 26)
                  
               
                  BloodSugarManagementNotebookView.GlycatedHemoglobinShowNumLabelNumber.textColor = .white
                  BloodSugarManagementNotebookView.GlycatedHemoglobinShowNumLabelNumber.numberOfLines = 0
                  BloodSugarManagementNotebookView.GlycatedHemoglobin.addSubview(BloodSugarManagementNotebookView.GlycatedHemoglobinShowNumLabelNumber)
               
               
               
               
               
               
       //        BloodSugarManagementNotebookView.GlycatedHemoglobinShowNumLabel = UILabel(frame: CGRect(x: 30, y: BloodSugarManagementNotebookView.GlycatedHemoglobinShowLabel.frame.maxY + 20, width: BloodSugarManagementNotebookView.GlycatedHemoglobin.frame.size.width / 2.5, height: BloodSugarManagementNotebookView.GlycatedHemoglobin.frame.size.height / 6))
       //     BloodSugarManagementNotebookView.GlycatedHemoglobinShowNumLabel.text = "220mg/dL 이하"
       //        BloodSugarManagementNotebookView.GlycatedHemoglobinShowNumLabel.textAlignment = .center
       //        BloodSugarManagementNotebookView.GlycatedHemoglobinShowNumLabel.font = UIFont.systemFont(ofSize: 16)
       //        BloodSugarManagementNotebookView.GlycatedHemoglobinShowNumLabel.textColor = .white
       //        BloodSugarManagementNotebookView.GlycatedHemoglobin.addSubview(BloodSugarManagementNotebookView.GlycatedHemoglobinShowNumLabel)
               
               

               
               
               
               
               BloodSugarManagementNotebookView.GlycatedHemoglobinPercent = UILabel(frame: CGRect(x: BloodSugarManagementNotebookView.GlycatedHemoglobin.frame.maxX - 180, y: 20, width: 130, height: BloodSugarManagementNotebookView.GlycatedHemoglobin.frame.size.height / 4))
               BloodSugarManagementNotebookView.GlycatedHemoglobinPercent.text = ""
              
               
               if IS_IPHONE_12PRO_MAX {
                   BloodSugarManagementNotebookView.GlycatedHemoglobinPercent.font = UIFont(name: "SUITE-Regular", size: 20)
               } else if IS_IPHONE_15PRO_MAX {
                   BloodSugarManagementNotebookView.GlycatedHemoglobinPercent.font = UIFont(name: "SUITE-Regular", size: 20)
               } else if IS_IPHONE_N_PLUS {
                   BloodSugarManagementNotebookView.GlycatedHemoglobinPercent.font = UIFont(name: "SUITE-Regular", size: 17)
               } else if IS_IPHONE_X {
                   BloodSugarManagementNotebookView.GlycatedHemoglobinPercent.font = UIFont(name: "SUITE-Regular", size: 15)
               } else {
                   BloodSugarManagementNotebookView.GlycatedHemoglobinPercent.font = UIFont(name: "SUITE-Regular", size: 15)
               }
               
       //        BloodSugarManagementNotebookView.GlycatedHemoglobinPercent.font = UIFont(name: "SUITE-Regular", size: 13)
               BloodSugarManagementNotebookView.GlycatedHemoglobinPercent.textAlignment = .center
               BloodSugarManagementNotebookView.GlycatedHemoglobinPercent.numberOfLines = 0
               
               BloodSugarManagementNotebookView.GlycatedHemoglobinPercent.textColor = .white
               BloodSugarManagementNotebookView.GlycatedHemoglobin.addSubview(BloodSugarManagementNotebookView.GlycatedHemoglobinPercent)
               
               
               // we want the arc to be inset a bit, so we'll embed it in a "container"
               let container3 = UIView()
               container3.backgroundColor = .systemYellow
               
               container3.translatesAutoresizingMaskIntoConstraints = false
               BloodSugarManagementNotebookView.GlycatedHemoglobin.addSubview(container3)
               
               hcpView3.translatesAutoresizingMaskIntoConstraints = false
               container3.addSubview(hcpView3)
               if IS_IPHONE_12PRO_MAX {
                   //                let g = view.safeAreaLayoutGuide
                   NSLayoutConstraint.activate([
                       
                       container3.leadingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.GlycatedHemoglobin.leadingAnchor, constant: 190.0),
                       container3.trailingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.GlycatedHemoglobin.trailingAnchor, constant: 10.0),
                       container3.heightAnchor.constraint(equalTo: container.widthAnchor, multiplier: 0.6),
                       //            container.centerXAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerXAnchor),
                       container3.centerYAnchor.constraint(equalTo: BloodSugarManagementNotebookView.GlycatedHemoglobinPercent.centerYAnchor, constant: 45),
                       
                       // let's inset our progress view by 40-points on each side
                       hcpView3.leadingAnchor.constraint(equalTo: container3.leadingAnchor, constant: 40.0),
                       hcpView3.trailingAnchor.constraint(equalTo: container3.trailingAnchor, constant: -40.0),
                       
                       // give hcpView a 2:1 ratio
                       hcpView3.heightAnchor.constraint(equalTo: hcpView3.widthAnchor, multiplier: 1.0 / 2.0),
                       
                       hcpView3.centerYAnchor.constraint(equalTo: container3.centerYAnchor),
                       
                   ])
                   
               } else if IS_IPHONE_15PRO_MAX {
                   //                let g = view.safeAreaLayoutGuide
                   NSLayoutConstraint.activate([
                       
                       container3.leadingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.GlycatedHemoglobin.leadingAnchor, constant: 190.0),
                       container3.trailingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.GlycatedHemoglobin.trailingAnchor, constant: 10.0),
                       container3.heightAnchor.constraint(equalTo: container.widthAnchor, multiplier: 0.6),
                       //            container.centerXAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerXAnchor),
                       container3.centerYAnchor.constraint(equalTo: BloodSugarManagementNotebookView.GlycatedHemoglobinPercent.centerYAnchor, constant: 45),
                       
                       // let's inset our progress view by 40-points on each side
                       hcpView3.leadingAnchor.constraint(equalTo: container3.leadingAnchor, constant: 40.0),
                       hcpView3.trailingAnchor.constraint(equalTo: container3.trailingAnchor, constant: -40.0),
                       
                       // give hcpView a 2:1 ratio
                       hcpView3.heightAnchor.constraint(equalTo: hcpView3.widthAnchor, multiplier: 1.0 / 2.0),
                       
                       hcpView3.centerYAnchor.constraint(equalTo: container3.centerYAnchor),
                       
                   ])
                   
               }
       //        else if IS_IPHONE_X  {
       //            //                let g = view.safeAreaLayoutGuide
       //            NSLayoutConstraint.activate([
       //
       //                container3.leadingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.GlycatedHemoglobin.leadingAnchor, constant: 150),
       //                container3.trailingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.GlycatedHemoglobin.trailingAnchor, constant: -10.0),
       //                container3.heightAnchor.constraint(equalTo: container.widthAnchor, multiplier: 1.2),
       //                //            container.centerXAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerXAnchor),
       //                container3.centerYAnchor.constraint(equalTo: BloodSugarManagementNotebookView.GlycatedHemoglobinPercent.centerYAnchor, constant: 45),
       //
       //                // let's inset our progress view by 40-points on each side
       //                hcpView3.leadingAnchor.constraint(equalTo: container3.leadingAnchor, constant: 40.0),
       //                hcpView3.trailingAnchor.constraint(equalTo: container3.trailingAnchor, constant: -40.0),
       //
       //                // give hcpView a 2:1 ratio
       //                hcpView3.heightAnchor.constraint(equalTo: hcpView3.widthAnchor, multiplier: 1.0 / 2.0),
       //
       //                hcpView3.centerYAnchor.constraint(equalTo: container3.centerYAnchor),
       //
       //            ])
       //        }
               else if IS_IPHONE_N_PLUS  {
                   //                let g = view.safeAreaLayoutGuide
                   NSLayoutConstraint.activate([
                       
                       container3.leadingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.GlycatedHemoglobin.leadingAnchor, constant: 175),
                       container3.trailingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.GlycatedHemoglobin.trailingAnchor, constant: 10.0),
                       container3.heightAnchor.constraint(equalTo: container.widthAnchor, multiplier: 1),
                       //            container.centerXAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerXAnchor),
                       container3.centerYAnchor.constraint(equalTo: BloodSugarManagementNotebookView.GlycatedHemoglobinPercent.centerYAnchor, constant: 35),
                       
                       // let's inset our progress view by 40-points on each side
                       hcpView3.leadingAnchor.constraint(equalTo: container3.leadingAnchor, constant: 40.0),
                       hcpView3.trailingAnchor.constraint(equalTo: container3.trailingAnchor, constant: -40.0),
                       
                       // give hcpView a 2:1 ratio
                       hcpView3.heightAnchor.constraint(equalTo: hcpView3.widthAnchor, multiplier: 1.0 / 2.0),
                       
                       hcpView3.centerYAnchor.constraint(equalTo: container3.centerYAnchor),
                       
                   ])
               } else if IS_IPHONE_N  {
                   //                let g = view.safeAreaLayoutGuide
                   NSLayoutConstraint.activate([
                       
                       container3.leadingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.GlycatedHemoglobin.leadingAnchor, constant: 165),
                       container3.trailingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.GlycatedHemoglobin.trailingAnchor, constant: 10.0),
                       container3.heightAnchor.constraint(equalTo: container.widthAnchor, multiplier: 1),
                       //            container.centerXAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerXAnchor),
                       container3.centerYAnchor.constraint(equalTo: BloodSugarManagementNotebookView.GlycatedHemoglobinPercent.centerYAnchor, constant: 25),
                       
                       // let's inset our progress view by 40-points on each side
                       hcpView3.leadingAnchor.constraint(equalTo: container3.leadingAnchor, constant: 40.0),
                       hcpView3.trailingAnchor.constraint(equalTo: container3.trailingAnchor, constant: -40.0),
                       
                       // give hcpView a 2:1 ratio
                       hcpView3.heightAnchor.constraint(equalTo: hcpView3.widthAnchor, multiplier: 1.0 / 2.0),
                       
                       hcpView3.centerYAnchor.constraint(equalTo: container3.centerYAnchor),
                       
                   ])
               }else if IS_IPHONE_MINI  {
                   //                let g = view.safeAreaLayoutGuide
                   NSLayoutConstraint.activate([
                       
                       container3.leadingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.GlycatedHemoglobin.leadingAnchor, constant: 165),
                       container3.trailingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.GlycatedHemoglobin.trailingAnchor, constant: 10.0),
                       container3.heightAnchor.constraint(equalTo: container.widthAnchor, multiplier: 1),
                       //            container.centerXAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerXAnchor),
                       container3.centerYAnchor.constraint(equalTo: BloodSugarManagementNotebookView.GlycatedHemoglobinPercent.centerYAnchor, constant: 25),
                       
                       // let's inset our progress view by 40-points on each side
                       hcpView3.leadingAnchor.constraint(equalTo: container3.leadingAnchor, constant: 40.0),
                       hcpView3.trailingAnchor.constraint(equalTo: container3.trailingAnchor, constant: -40.0),
                       
                       // give hcpView a 2:1 ratio
                       hcpView3.heightAnchor.constraint(equalTo: hcpView3.widthAnchor, multiplier: 1.0 / 2.0),
                       
                       hcpView3.centerYAnchor.constraint(equalTo: container3.centerYAnchor),
                       
                   ])
               } else if IS_IPHONE_12PRO {
                   //                let g = view.safeAreaLayoutGuide
                   NSLayoutConstraint.activate([
                       
                       container3.leadingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.GlycatedHemoglobin.leadingAnchor, constant: 165),
                       container3.trailingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.GlycatedHemoglobin.trailingAnchor, constant: 10.0),
                       container3.heightAnchor.constraint(equalTo: container.widthAnchor, multiplier: 1),
                       //            container.centerXAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerXAnchor),
                       container3.centerYAnchor.constraint(equalTo: BloodSugarManagementNotebookView.GlycatedHemoglobinPercent.centerYAnchor, constant: 35),
                       
                       // let's inset our progress view by 40-points on each side
                       hcpView3.leadingAnchor.constraint(equalTo: container3.leadingAnchor, constant: 40.0),
                       hcpView3.trailingAnchor.constraint(equalTo: container3.trailingAnchor, constant: -40.0),
                       
                       // give hcpView a 2:1 ratio
                       hcpView3.heightAnchor.constraint(equalTo: hcpView3.widthAnchor, multiplier: 1.0 / 2.0),
                       
                       hcpView3.centerYAnchor.constraint(equalTo: container3.centerYAnchor),
                       
                   ])
               }else if IS_IPHONE_15PRO {
                   //                let g = view.safeAreaLayoutGuide
                   NSLayoutConstraint.activate([
                       
                       container3.leadingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.GlycatedHemoglobin.leadingAnchor, constant: 165),
                       container3.trailingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.GlycatedHemoglobin.trailingAnchor, constant: 10.0),
                       container3.heightAnchor.constraint(equalTo: container.widthAnchor, multiplier: 1),
                       //            container.centerXAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerXAnchor),
                       container3.centerYAnchor.constraint(equalTo: BloodSugarManagementNotebookView.GlycatedHemoglobinPercent.centerYAnchor, constant: 45),
                       
                       // let's inset our progress view by 40-points on each side
                       hcpView3.leadingAnchor.constraint(equalTo: container3.leadingAnchor, constant: 40.0),
                       hcpView3.trailingAnchor.constraint(equalTo: container3.trailingAnchor, constant: -40.0),
                       
                       // give hcpView a 2:1 ratio
                       hcpView3.heightAnchor.constraint(equalTo: hcpView3.widthAnchor, multiplier: 1.0 / 2.0),
                       
                       hcpView3.centerYAnchor.constraint(equalTo: container3.centerYAnchor),
                       
                   ])
               } else {
                   //                let g = view.safeAreaLayoutGuide
                   NSLayoutConstraint.activate([
                       
                       container3.leadingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.GlycatedHemoglobin.leadingAnchor, constant: 165),
                       container3.trailingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.GlycatedHemoglobin.trailingAnchor, constant: 10.0),
                       container3.heightAnchor.constraint(equalTo: container.widthAnchor, multiplier: 1),
                       //            container.centerXAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerXAnchor),
                       container3.centerYAnchor.constraint(equalTo: BloodSugarManagementNotebookView.GlycatedHemoglobinPercent.centerYAnchor, constant: 45),
                       
                       // let's inset our progress view by 40-points on each side
                       hcpView3.leadingAnchor.constraint(equalTo: container3.leadingAnchor, constant: 40.0),
                       hcpView3.trailingAnchor.constraint(equalTo: container3.trailingAnchor, constant: -40.0),
                       
                       // give hcpView a 2:1 ratio
                       hcpView3.heightAnchor.constraint(equalTo: hcpView3.widthAnchor, multiplier: 1.0 / 2.0),
                       
                       hcpView3.centerYAnchor.constraint(equalTo: container3.centerYAnchor),
                       
                   ])
               }
        
        
//        BloodSugarManagementNotebookView.FastingBloodSugarPercent = UILabel(frame: CGRect(x: BloodSugarManagementNotebookView.FastingBloodSugar.frame.maxX - 180, y: 20, width: 130, height: BloodSugarManagementNotebookView.FastingBloodSugar.frame.size.height / 4))
//        BloodSugarManagementNotebookView.FastingBloodSugarPercent.text = "목표 수치\n달성율은?"
//        
//        if IS_IPHONE_12PRO_MAX {
//            BloodSugarManagementNotebookView.FastingBloodSugarPercent.font = UIFont(name: "SUITE-Regular", size: 20)
//        } else if IS_IPHONE_15PRO_MAX {
//            BloodSugarManagementNotebookView.FastingBloodSugarPercent.font = UIFont(name: "SUITE-Regular", size: 20)
//        } else if IS_IPHONE_N_PLUS {
//            BloodSugarManagementNotebookView.FastingBloodSugarPercent.font = UIFont(name: "SUITE-Regular", size: 17)
//        } else if IS_IPHONE_X {
//            BloodSugarManagementNotebookView.FastingBloodSugarPercent.font = UIFont(name: "SUITE-Regular", size: 15)
//        } else {
//            BloodSugarManagementNotebookView.FastingBloodSugarPercent.font = UIFont(name: "SUITE-Regular", size: 15)
//        }
//        
//        
//        BloodSugarManagementNotebookView.FastingBloodSugarPercent.numberOfLines = 0
//        BloodSugarManagementNotebookView.FastingBloodSugarPercent.textAlignment = .center
//        
//        
//        
//        
//        
//        BloodSugarManagementNotebookView.FastingBloodSugarPercent.textColor = .white
//        BloodSugarManagementNotebookView.FastingBloodSugar.addSubview(BloodSugarManagementNotebookView.FastingBloodSugarPercent)
//        
//        
//        // we want the arc to be inset a bit, so we'll embed it in a "container"
//        let container = UIView()
//        container.backgroundColor = .systemYellow
//        
//        container.translatesAutoresizingMaskIntoConstraints = false
//        BloodSugarManagementNotebookView.FastingBloodSugar.addSubview(container)
//        
//        hcpView.translatesAutoresizingMaskIntoConstraints = false
//        container.addSubview(hcpView)
//        
//        //                let g = view.safeAreaLayoutGuide
//        if IS_IPHONE_12PRO_MAX {
//            NSLayoutConstraint.activate([
//                
//                container.leadingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugar.leadingAnchor, constant: 190.0),
//                container.trailingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugar.trailingAnchor, constant: 10.0),
//                container.heightAnchor.constraint(equalTo: container.widthAnchor, multiplier: 0.6),
//                //            container.centerXAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerXAnchor),
//                container.centerYAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerYAnchor, constant: 100),
//                
//                // let's inset our progress view by 40-points on each side
//                hcpView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 40.0),
//                hcpView.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -40.0),
//                
//                // give hcpView a 2:1 ratio
//                hcpView.heightAnchor.constraint(equalTo: hcpView.widthAnchor, multiplier: 1.0 / 2.0),
//                
//                hcpView.centerYAnchor.constraint(equalTo: container.centerYAnchor),
//                
//                
//            ])/////durl
//            
//            
//        } else if IS_IPHONE_15PRO_MAX {
//            NSLayoutConstraint.activate([
//                
//                container.leadingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugar.leadingAnchor, constant: 190.0),
//                container.trailingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugar.trailingAnchor, constant: 10.0),
//                container.heightAnchor.constraint(equalTo: container.widthAnchor, multiplier: 0.6),
//                //            container.centerXAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerXAnchor),
//                container.centerYAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerYAnchor, constant: 100),
//                
//                // let's inset our progress view by 40-points on each side
//                hcpView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 40.0),
//                hcpView.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -40.0),
//                
//                // give hcpView a 2:1 ratio
//                hcpView.heightAnchor.constraint(equalTo: hcpView.widthAnchor, multiplier: 1.0 / 2.0),
//                
//                hcpView.centerYAnchor.constraint(equalTo: container.centerYAnchor),
//                
//                
//            ])/////durl
//            
//            
//        } else if IS_IPHONE_X  {
//            NSLayoutConstraint.activate([
//                
//                container.leadingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugar.leadingAnchor, constant: 150.0),
//                container.trailingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugar.trailingAnchor, constant: -10.0),
//                container.heightAnchor.constraint(equalTo: container.widthAnchor, multiplier: 1.2),
//                //            container.centerXAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerXAnchor),
//                container.centerYAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerYAnchor, constant: 100),
//                
//                // let's inset our progress view by 40-points on each side
//                hcpView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 40.0),
//                hcpView.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -40.0),
//                
//                // give hcpView a 2:1 ratio
//                hcpView.heightAnchor.constraint(equalTo: hcpView.widthAnchor, multiplier: 1.0 / 2.0),
//                
//                hcpView.centerYAnchor.constraint(equalTo: container.centerYAnchor),
//                
//            ])
//        } else if IS_IPHONE_N_PLUS  {
//            NSLayoutConstraint.activate([
//                
//                container.leadingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugar.leadingAnchor, constant: 175),
//                container.trailingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugar.trailingAnchor, constant: 10.0),
//                container.heightAnchor.constraint(equalTo: container.widthAnchor, multiplier: 1),
//                //            container.centerXAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerXAnchor),
//                container.centerYAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerYAnchor, constant: 90),
//                
//                // let's inset our progress view by 40-points on each side
//                hcpView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 40.0),
//                hcpView.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -40.0),
//                
//                // give hcpView a 2:1 ratio
//                hcpView.heightAnchor.constraint(equalTo: hcpView.widthAnchor, multiplier: 1.0 / 2.0),
//                
//                hcpView.centerYAnchor.constraint(equalTo: container.centerYAnchor),
//                
//            ])
//        } else if IS_IPHONE_N  {
//            NSLayoutConstraint.activate([
//                
//                container.leadingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugar.leadingAnchor, constant: 155),
//                container.trailingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugar.trailingAnchor, constant: 0.0),
//                container.heightAnchor.constraint(equalTo: container.widthAnchor, multiplier: 1),
//                //            container.centerXAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerXAnchor),
//                container.centerYAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerYAnchor, constant: 80),
//                
//                // let's inset our progress view by 40-points on each side
//                hcpView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 40.0),
//                hcpView.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -40.0),
//                
//                // give hcpView a 2:1 ratio
//                hcpView.heightAnchor.constraint(equalTo: hcpView.widthAnchor, multiplier: 1.0 / 2.0),
//                
//                hcpView.centerYAnchor.constraint(equalTo: container.centerYAnchor),
//                
//            ])
//        } else if IS_IPHONE_12PRO  {
//            NSLayoutConstraint.activate([
//                
//                container.leadingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugar.leadingAnchor, constant: 155),
//                container.trailingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugar.trailingAnchor, constant: 0.0),
//                container.heightAnchor.constraint(equalTo: container.widthAnchor, multiplier: 1),
//                //            container.centerXAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerXAnchor),
//                container.centerYAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerYAnchor, constant: 80),
//                
//                // let's inset our progress view by 40-points on each side
//                hcpView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 40.0),
//                hcpView.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -40.0),
//                
//                // give hcpView a 2:1 ratio
//                hcpView.heightAnchor.constraint(equalTo: hcpView.widthAnchor, multiplier: 1.0 / 2.0),
//                
//                hcpView.centerYAnchor.constraint(equalTo: container.centerYAnchor),
//                
//            ])
//        } else if IS_IPHONE_15PRO  {
//            NSLayoutConstraint.activate([
//                
//                container.leadingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugar.leadingAnchor, constant: 155),
//                container.trailingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugar.trailingAnchor, constant: 0.0),
//                container.heightAnchor.constraint(equalTo: container.widthAnchor, multiplier: 1),
//                //            container.centerXAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerXAnchor),
//                container.centerYAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerYAnchor, constant: 80),
//                
//                // let's inset our progress view by 40-points on each side
//                hcpView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 40.0),
//                hcpView.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -40.0),
//                
//                // give hcpView a 2:1 ratio
//                hcpView.heightAnchor.constraint(equalTo: hcpView.widthAnchor, multiplier: 1.0 / 2.0),
//                
//                hcpView.centerYAnchor.constraint(equalTo: container.centerYAnchor),
//                
//            ])
//        } else {
//            NSLayoutConstraint.activate([
//                
//                container.leadingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugar.leadingAnchor, constant: 165),
//                container.trailingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugar.trailingAnchor, constant: 10.0),
//                container.heightAnchor.constraint(equalTo: container.widthAnchor, multiplier: 1),
//                //            container.centerXAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerXAnchor),
//                container.centerYAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerYAnchor, constant: 90),
//                
//                // let's inset our progress view by 40-points on each side
//                hcpView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 40.0),
//                hcpView.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -40.0),
//                
//                // give hcpView a 2:1 ratio
//                hcpView.heightAnchor.constraint(equalTo: hcpView.widthAnchor, multiplier: 1.0 / 2.0),
//                
//                hcpView.centerYAnchor.constraint(equalTo: container.centerYAnchor),
//                
//            ])
//        }
//        if UserDefaults.standard.object(forKey: "perGraphS1") == nil {
//            hcpView.progress = 00
//        } else {
//            hcpView.progress = UserDefaults.standard.object(forKey: "perGraphS1") as! CGFloat * 0.01
//        }
//        
//        
//        if IS_IPHONE_12PRO_MAX {
//            showLabel = UILabel(frame: CGRect(x: 44, y: 32, width: 42, height: 30))
//            
//            hcpView.addSubview(showLabel)
//            
//            //                    showLabel.layer.borderWidth = 1
//            showLabel.textAlignment = .center
//            //            var changeShowLabel = Int(random)
//            var changeShowLabel = UserDefaults.standard.object(forKey: "persenS1")
//            print(changeShowLabel, "여기의 값은?")
//            
//            showLabel.font = UIFont(name: "SUITE-Heavy", size: 13)
//            showLabel.textColor = .white
//            
//            showLabel.text = "\(changeShowLabel ?? 0)%"
//            //            showLabel.text = UserDefaults.standard.string(forKey: "perB")
//        } else if IS_IPHONE_15PRO_MAX {
//            showLabel = UILabel(frame: CGRect(x: 44, y: 32, width: 42, height: 30))
//            
//            hcpView.addSubview(showLabel)
//            
//            //                    showLabel.layer.borderWidth = 1
//            showLabel.textAlignment = .center
//            //            var changeShowLabel = Int(random)
//            var changeShowLabel = UserDefaults.standard.object(forKey: "persenS1")
//            print(changeShowLabel, "여기의 값은?")
//            
//            showLabel.font = UIFont(name: "SUITE-Heavy", size: 13)
//            showLabel.textColor = .white
//            
//            showLabel.text = "\(changeShowLabel ?? 0)%"
//            //            showLabel.text = UserDefaults.standard.string(forKey: "perB")
//        } else if IS_IPHONE_X {
//            showLabel = UILabel(frame: CGRect(x: 27, y: 23, width: 45, height: 30))
//            
//            hcpView.addSubview(showLabel)
//            
//            //        showLabel.layer.borderWidth = 1
//            
//            //            var changeShowLabel = Int(random)
//            var changeShowLabel = UserDefaults.standard.object(forKey: "persenS1")
//            print(changeShowLabel, "여기의 값은?")
//            showLabel.textAlignment = .center
//            showLabel.font = UIFont(name: "SUITE-Heavy", size: 13)
//            showLabel.textColor = .white
//            //            showLabel.layer.borderWidth = 1
//            showLabel.text = "\(changeShowLabel ?? 0)%"
//            //            showLabel.text = UserDefaults.standard.string(forKey: "perB")
//        } else if IS_IPHONE_N_PLUS {
//            showLabel = UILabel(frame: CGRect(x: 40, y: 31, width: 50, height: 30))
//            
//            hcpView.addSubview(showLabel)
//            
//            //                    showLabel.layer.borderWidth = 1
//            showLabel.textAlignment = .center
//            //            var changeShowLabel = Int(random)
//            var changeShowLabel = UserDefaults.standard.object(forKey: "persenS1")
//            print(changeShowLabel, "여기의 값은?")
//            
//            showLabel.font = UIFont(name: "SUITE-Heavy", size: 12)
//            showLabel.textColor = .white
//            showLabel.text = "\(changeShowLabel ?? 0)%"
//            //            showLabel.text = UserDefaults.standard.string(forKey: "perB")
//        } else if IS_IPHONE_N {
//            showLabel = UILabel(frame: CGRect(x: 25, y: 28, width: 51, height: 30))
//            
//            hcpView.addSubview(showLabel)
//            
//            //                    showLabel.layer.borderWidth = 1
//            
//            //            var changeShowLabel = Int(random)
//            var changeShowLabel = UserDefaults.standard.object(forKey: "persenS1")
//            print(changeShowLabel, "여기의 값은?")
//            showLabel.textAlignment = .center
//            showLabel.font = UIFont(name: "SUITE-Heavy", size: 12)
//            showLabel.textColor = .white
//            showLabel.text = "\(changeShowLabel ?? 0)%"
//            //            showLabel.text = UserDefaults.standard.string(forKey: "perB")
//        } else if IS_IPHONE_12PRO {
//            showLabel = UILabel(frame: CGRect(x: 34, y: 28, width: 51, height: 30))
//            
//            hcpView.addSubview(showLabel)
//            
//            //                    showLabel.layer.borderWidth = 1
//            
//            //            var changeShowLabel = Int(random)
//            var changeShowLabel = UserDefaults.standard.object(forKey: "persenS1")
//            print(changeShowLabel, "여기의 값은?")
//            showLabel.textAlignment = .center
//            showLabel.font = UIFont(name: "SUITE-Heavy", size: 12)
//            showLabel.textColor = .white
//            showLabel.text = "\(changeShowLabel ?? 0)%"
//            //            showLabel.text = UserDefaults.standard.string(forKey: "perB")
//        } else if IS_IPHONE_15PRO {
//            showLabel = UILabel(frame: CGRect(x: 34, y: 28, width: 51, height: 30))
//            
//            hcpView.addSubview(showLabel)
//            
//            //                    showLabel.layer.borderWidth = 1
//            
//            //            var changeShowLabel = Int(random)
//            var changeShowLabel = UserDefaults.standard.object(forKey: "persenS1")
//            print(changeShowLabel, "여기의 값은?")
//            showLabel.textAlignment = .center
//            showLabel.font = UIFont(name: "SUITE-Heavy", size: 12)
//            showLabel.textColor = .white
//            showLabel.text = "\(changeShowLabel ?? 0)%"
//            //            showLabel.text = UserDefaults.standard.string(forKey: "perB")
//        } else {
//            showLabel = UILabel(frame: CGRect(x: 49, y: 31, width: 42, height: 30))
//            
//            hcpView.addSubview(showLabel)
//            
//            //        showLabel.layer.borderWidth = 1
//            
//            //            var changeShowLabel = Int(random)
//            var changeShowLabel = UserDefaults.standard.object(forKey: "persenS1")
//            print(changeShowLabel, "여기의 값은?")
//            showLabel.textAlignment = .center
//            showLabel.font = UIFont(name: "SUITE-Heavy", size: 12)
//            showLabel.textColor = .white
//            showLabel.text = "\(changeShowLabel ?? 0)%"
//            //            showLabel.text = UserDefaults.standard.string(forKey: "perB")
//        }
//        
//        
//        
//        
//        pctLabel.translatesAutoresizingMaskIntoConstraints = false
//        hcpView.addSubview(pctLabel)
//        // add the pctLabel in the middle of the arc
//        NSLayoutConstraint.activate([
//            pctLabel.centerXAnchor.constraint(equalTo: hcpView.centerXAnchor),
//            pctLabel.centerYAnchor.constraint(equalTo: hcpView.centerYAnchor),
//        ])
//        
//        // let's add some percent / progress buttons
//        //                let btnStack = UIStackView()
//        //                btnStack.spacing = 4
//        //                btnStack.distribution = .fillEqually
//        //                [0.0, 0.1, 0.25, 0.33, 0.61, 0.8, 1.0].forEach { v in
//        //                    let b = UIButton()
//        //                    b.setTitle("\(v)", for: [])
//        //                    b.setTitleColor(.white, for: .normal)
//        //                    b.setTitleColor(.lightGray, for: .highlighted)
//        //                    b.titleLabel?.font = .systemFont(ofSize: 13.0, weight: .bold)
//        //                    b.backgroundColor = .systemGreen
//        //                    b.layer.cornerRadius = 6
//        //                    b.addTarget(self, action: #selector(btnTapped(_:)), for: .touchUpInside)
//        //                    btnStack.addArrangedSubview(b)
//        //                }
//        //
//        //                btnStack.translatesAutoresizingMaskIntoConstraints = false
//        //                view.addSubview(btnStack)
//        
//        // let's add a slider to set the progress
//        //                let slider = UISlider()
//        //                slider.translatesAutoresizingMaskIntoConstraints = false
//        //                view.addSubview(slider)
//        //
//        //                NSLayoutConstraint.activate([
//        //
//        //                    btnStack.topAnchor.constraint(equalTo: container.bottomAnchor, constant: 20.0),
//        //                    btnStack.leadingAnchor.constraint(equalTo: g.leadingAnchor, constant: 20.0),
//        //                    btnStack.trailingAnchor.constraint(equalTo: g.trailingAnchor, constant: -20.0),
//        //
//        //                    slider.topAnchor.constraint(equalTo: btnStack.bottomAnchor, constant: 20.0),
//        //                    slider.leadingAnchor.constraint(equalTo: g.leadingAnchor, constant: 20.0),
//        //                    slider.trailingAnchor.constraint(equalTo: g.trailingAnchor, constant: -20.0),
//        //
//        //                ])
//        //
//        //                slider.addTarget(self, action: #selector(sliderChanged(_:)), for: .valueChanged)
//        //
//        //                sliderChanged(slider)
//        
//        container.backgroundColor = .clear
//        
//        
//        
//        
//        BloodSugarManagementNotebookView.PostprandialBloodSugar = UIView(frame: CGRect(x: 20, y: BloodSugarManagementNotebookView.FastingBloodSugar.frame.maxY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 5.5))
//        if IS_IPHONE_N {
//            BloodSugarManagementNotebookView.PostprandialBloodSugar = UIView(frame: CGRect(x: 20, y: BloodSugarManagementNotebookView.FastingBloodSugar.frame.maxY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 5))
//        }
//        
//        if IS_IPHONE_N_PLUS {
//            BloodSugarManagementNotebookView.PostprandialBloodSugar = UIView(frame: CGRect(x: 20, y: BloodSugarManagementNotebookView.FastingBloodSugar.frame.maxY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 5))
//        }
//        
//        //        BloodSugarManagementNotebookView.PostprandialBloodSugar.backgroundColor = #colorLiteral(red: 0.009351861663, green: 0.4616524577, blue: 0.943269372, alpha: 1)
//        BloodSugarManagementNotebookView.PostprandialBloodSugar.setGradient3(color1: UIColor(red: 0.0 / 255.0, green: 74 / 255.0, blue: 241.0 / 255.0, alpha: 1), color2: UIColor(red: 0.0 / 255.0, green: 130 / 255.0, blue: 241 / 255.0, alpha: 1))
//        //        BloodSugarManagementNotebookView.FastingBloodSugar.layer.borderWidth = 1
//        BloodSugarManagementNotebookView.PostprandialBloodSugar.layer.cornerRadius = 8
//        scrollView.addSubview(BloodSugarManagementNotebookView.PostprandialBloodSugar)
//        
//        
//        
//        let strokeUnderBar2 = UIView(frame: CGRect(x: 0, y: 20, width: 1, height: BloodSugarManagementNotebookView.PostprandialBloodSugar.frame.size.height - 40))
//        strokeUnderBar2.backgroundColor =  #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1).withAlphaComponent(0.8)
//        strokeUnderBar2.center.x = BloodSugarManagementNotebookView.PostprandialBloodSugar.frame.size.width / 2
//        BloodSugarManagementNotebookView.PostprandialBloodSugar.addSubview(strokeUnderBar2)
//        
//        
//        
//        BloodSugarManagementNotebookView.PostprandialBloodSugarLabel = UILabel(frame: CGRect(x: 20, y: 20, width: 140, height: BloodSugarManagementNotebookView.PostprandialBloodSugar.frame.size.height / 4))
//        BloodSugarManagementNotebookView.PostprandialBloodSugarLabel.text = ""
//        //        BloodSugarManagementNotebookView.PostprandialBloodSugarLabel.textAlignment = .center
//        //        BloodSugarManagementNotebookView.PostprandialBloodSugarLabel.numberOfLines = 0
//        
//        if IS_IPHONE_12PRO_MAX {
//            BloodSugarManagementNotebookView.PostprandialBloodSugarLabel.font = UIFont(name: "SUITE-Regular", size: 20)
//        } else if IS_IPHONE_15PRO_MAX {
//            BloodSugarManagementNotebookView.PostprandialBloodSugarLabel.font = UIFont(name: "SUITE-Regular", size: 20)
//        } else if IS_IPHONE_N_PLUS {
//            BloodSugarManagementNotebookView.PostprandialBloodSugarLabel.font = UIFont(name: "SUITE-Regular", size: 17)
//        } else if IS_IPHONE_X {
//            BloodSugarManagementNotebookView.PostprandialBloodSugarLabel.font = UIFont(name: "SUITE-Regular", size: 15)
//        } else {
//            BloodSugarManagementNotebookView.PostprandialBloodSugarLabel.font = UIFont(name: "SUITE-Regular", size: 15)
//        }
//        BloodSugarManagementNotebookView.PostprandialBloodSugarLabel.numberOfLines = 0
//        BloodSugarManagementNotebookView.PostprandialBloodSugarLabel.textAlignment = .center
//        
//        
//        
//        BloodSugarManagementNotebookView.PostprandialBloodSugarLabel.textColor = .white
//        
//        //삭제할것
//        BloodSugarManagementNotebookView.PostprandialBloodSugar.addSubview(BloodSugarManagementNotebookView.PostprandialBloodSugarLabel)
//        
//        
//        
//        
//        BloodSugarManagementNotebookView.PostprandialBloodSugarShowLabel = UILabel(frame: CGRect(x: 15, y: 22, width: 150, height: BloodSugarManagementNotebookView.PostprandialBloodSugar.frame.size.height / 4))
//        BloodSugarManagementNotebookView.PostprandialBloodSugarShowLabel.text = "식후혈당\n(Postprandial glucose)"
//        
//        
//        if IS_IPHONE_12PRO_MAX {
//            BloodSugarManagementNotebookView.PostprandialBloodSugarShowLabel.font = UIFont(name: "SUITE-Regular", size: 13)
//        } else if IS_IPHONE_15PRO_MAX {
//            BloodSugarManagementNotebookView.PostprandialBloodSugarShowLabel.font = UIFont(name: "SUITE-Regular", size: 13)
//        } else if IS_IPHONE_N_PLUS {
//            BloodSugarManagementNotebookView.PostprandialBloodSugarShowLabel.font = UIFont(name: "SUITE-Regular", size: 11)
//        } else if IS_IPHONE_X {
//            BloodSugarManagementNotebookView.PostprandialBloodSugarShowLabel.font = UIFont(name: "SUITE-Regular", size: 11)
//        } else {
//            BloodSugarManagementNotebookView.PostprandialBloodSugarShowLabel.font = UIFont(name: "SUITE-Regular", size: 11)
//        }
//        
//        BloodSugarManagementNotebookView.PostprandialBloodSugarShowLabel.textAlignment = .center
//        BloodSugarManagementNotebookView.PostprandialBloodSugarShowLabel.numberOfLines = 0
//        
//        
//        
//        BloodSugarManagementNotebookView.PostprandialBloodSugarShowLabel.textColor = .white
//        BloodSugarManagementNotebookView.PostprandialBloodSugar.addSubview(BloodSugarManagementNotebookView.PostprandialBloodSugarShowLabel)
//        
//        
//        
//        BloodSugarManagementNotebookView.PostprandialBloodSugarShowNumLabelNumber = UILabel(frame: CGRect(x: 40, y: BloodSugarManagementNotebookView.PostprandialBloodSugarShowLabel.frame.maxY + 20, width: 50, height: BloodSugarManagementNotebookView.FastingBloodSugar.frame.size.height / 6))
//        BloodSugarManagementNotebookView.PostprandialBloodSugarShowNumLabelNumber.text = "120"
//        
//        BloodSugarManagementNotebookView.PostprandialBloodSugarShowNumLabelNumber.textAlignment = .right
//        BloodSugarManagementNotebookView.PostprandialBloodSugarShowNumLabelNumber.font = UIFont(name: "SUITE-Heavy", size: 26)
//        
//        BloodSugarManagementNotebookView.PostprandialBloodSugarShowNumLabelNumber.textColor = .white
//        BloodSugarManagementNotebookView.PostprandialBloodSugarShowNumLabelNumber.numberOfLines = 0
//        BloodSugarManagementNotebookView.PostprandialBloodSugar.addSubview(BloodSugarManagementNotebookView.PostprandialBloodSugarShowNumLabelNumber)
//        
//        
//        
//        
//        
//        
//        BloodSugarManagementNotebookView.PostprandialBloodSugarShowNumLabel = UILabel(frame: CGRect(x: BloodSugarManagementNotebookView.PostprandialBloodSugarShowNumLabelNumber.frame.maxX + 5, y: BloodSugarManagementNotebookView.PostprandialBloodSugarShowLabel.frame.maxY + 20, width: 50, height: BloodSugarManagementNotebookView.PostprandialBloodSugar.frame.size.height / 3))
//        BloodSugarManagementNotebookView.PostprandialBloodSugarShowNumLabel.text = "mg/dL\n이하"
//        
//        BloodSugarManagementNotebookView.PostprandialBloodSugarShowNumLabel.textAlignment = .left
//        BloodSugarManagementNotebookView.PostprandialBloodSugarShowNumLabel.numberOfLines = 0
//        BloodSugarManagementNotebookView.PostprandialBloodSugarShowNumLabel.font = UIFont(name: "SUITE-Regular", size: 13)
//        
//        BloodSugarManagementNotebookView.PostprandialBloodSugarShowNumLabel.textColor = .white
//        BloodSugarManagementNotebookView.PostprandialBloodSugar.addSubview(BloodSugarManagementNotebookView.PostprandialBloodSugarShowNumLabel)
//        
//        
//        
//        
//        
//        BloodSugarManagementNotebookView.PostprandialBloodSugarPercent = UILabel(frame: CGRect(x: BloodSugarManagementNotebookView.PostprandialBloodSugar.frame.maxX - 180, y: 20, width: 130, height: BloodSugarManagementNotebookView.PostprandialBloodSugar.frame.size.height / 4))
//        BloodSugarManagementNotebookView.PostprandialBloodSugarPercent.text = ""
//        
//        if IS_IPHONE_12PRO_MAX {
//            BloodSugarManagementNotebookView.PostprandialBloodSugarPercent.font = UIFont(name: "SUITE-Regular", size: 20)
//        } else if IS_IPHONE_15PRO_MAX {
//            BloodSugarManagementNotebookView.PostprandialBloodSugarPercent.font = UIFont(name: "SUITE-Regular", size: 20)
//        } else if IS_IPHONE_N_PLUS {
//            BloodSugarManagementNotebookView.PostprandialBloodSugarPercent.font = UIFont(name: "SUITE-Regular", size: 17)
//        } else if IS_IPHONE_X {
//            BloodSugarManagementNotebookView.PostprandialBloodSugarPercent.font = UIFont(name: "SUITE-Regular", size: 15)
//        } else {
//            BloodSugarManagementNotebookView.PostprandialBloodSugarPercent.font = UIFont(name: "SUITE-Regular", size: 15)
//        }
//        
//        
//        
//        BloodSugarManagementNotebookView.PostprandialBloodSugarPercent.textAlignment = .center
//        BloodSugarManagementNotebookView.PostprandialBloodSugarPercent.numberOfLines = 0
//        
//        BloodSugarManagementNotebookView.PostprandialBloodSugarPercent.textColor = .white
//        BloodSugarManagementNotebookView.PostprandialBloodSugar.addSubview(BloodSugarManagementNotebookView.PostprandialBloodSugarPercent)
//        
//        
//        
//        
//        
//        // we want the arc to be inset a bit, so we'll embed it in a "container"
//        let container2 = UIView()
//        container2.backgroundColor = .systemYellow
//        
//        container2.translatesAutoresizingMaskIntoConstraints = false
//        BloodSugarManagementNotebookView.PostprandialBloodSugar.addSubview(container2)
//        
//        hcpView2.translatesAutoresizingMaskIntoConstraints = false
//        container2.addSubview(hcpView2)
//        if IS_IPHONE_12PRO_MAX {
//            //                let g = view.safeAreaLayoutGuide
//            NSLayoutConstraint.activate([
//                
//                container2.leadingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.PostprandialBloodSugar.leadingAnchor, constant: 190.0),
//                container2.trailingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.PostprandialBloodSugar.trailingAnchor, constant: 10.0),
//                container2.heightAnchor.constraint(equalTo: container.widthAnchor, multiplier: 0.6),
//                //            container.centerXAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerXAnchor),
//                container2.centerYAnchor.constraint(equalTo: BloodSugarManagementNotebookView.PostprandialBloodSugarPercent.centerYAnchor, constant: 45),
//                
//                // let's inset our progress view by 40-points on each side
//                hcpView2.leadingAnchor.constraint(equalTo: container2.leadingAnchor, constant: 40.0),
//                hcpView2.trailingAnchor.constraint(equalTo: container2.trailingAnchor, constant: -40.0),
//                
//                // give hcpView a 2:1 ratio
//                hcpView2.heightAnchor.constraint(equalTo: hcpView2.widthAnchor, multiplier: 1.0 / 2.0),
//                
//                hcpView2.centerYAnchor.constraint(equalTo: container2.centerYAnchor),
//                
//            ])
//        } else if IS_IPHONE_15PRO_MAX {
//            //                let g = view.safeAreaLayoutGuide
//            NSLayoutConstraint.activate([
//                
//                container2.leadingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.PostprandialBloodSugar.leadingAnchor, constant: 190.0),
//                container2.trailingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.PostprandialBloodSugar.trailingAnchor, constant: 10.0),
//                container2.heightAnchor.constraint(equalTo: container.widthAnchor, multiplier: 0.6),
//                //            container.centerXAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerXAnchor),
//                container2.centerYAnchor.constraint(equalTo: BloodSugarManagementNotebookView.PostprandialBloodSugarPercent.centerYAnchor, constant: 45),
//                
//                // let's inset our progress view by 40-points on each side
//                hcpView2.leadingAnchor.constraint(equalTo: container2.leadingAnchor, constant: 40.0),
//                hcpView2.trailingAnchor.constraint(equalTo: container2.trailingAnchor, constant: -40.0),
//                
//                // give hcpView a 2:1 ratio
//                hcpView2.heightAnchor.constraint(equalTo: hcpView2.widthAnchor, multiplier: 1.0 / 2.0),
//                
//                hcpView2.centerYAnchor.constraint(equalTo: container2.centerYAnchor),
//                
//            ])
//        } else if IS_IPHONE_X {
//            //                let g = view.safeAreaLayoutGuide
//            NSLayoutConstraint.activate([
//                
//                container2.leadingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.PostprandialBloodSugar.leadingAnchor, constant: 150),
//                container2.trailingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.PostprandialBloodSugar.trailingAnchor, constant: -10.0),
//                container2.heightAnchor.constraint(equalTo: container.widthAnchor, multiplier: 1.2),
//                //            container.centerXAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerXAnchor),
//                container2.centerYAnchor.constraint(equalTo: BloodSugarManagementNotebookView.PostprandialBloodSugarPercent.centerYAnchor, constant: 45),
//                
//                // let's inset our progress view by 40-points on each side
//                hcpView2.leadingAnchor.constraint(equalTo: container2.leadingAnchor, constant: 40.0),
//                hcpView2.trailingAnchor.constraint(equalTo: container2.trailingAnchor, constant: -40.0),
//                
//                // give hcpView a 2:1 ratio
//                hcpView2.heightAnchor.constraint(equalTo: hcpView2.widthAnchor, multiplier: 1.0 / 2.0),
//                
//                hcpView2.centerYAnchor.constraint(equalTo: container2.centerYAnchor),
//                
//            ])
//        } else if IS_IPHONE_N_PLUS  {
//            //                let g = view.safeAreaLayoutGuide
//            NSLayoutConstraint.activate([
//                
//                container2.leadingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.PostprandialBloodSugar.leadingAnchor, constant: 175),
//                container2.trailingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.PostprandialBloodSugar.trailingAnchor, constant: 10.0),
//                container2.heightAnchor.constraint(equalTo: container.widthAnchor, multiplier: 1),
//                //            container.centerXAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerXAnchor),
//                container2.centerYAnchor.constraint(equalTo: BloodSugarManagementNotebookView.PostprandialBloodSugarPercent.centerYAnchor, constant: 40),
//                
//                // let's inset our progress view by 40-points on each side
//                hcpView2.leadingAnchor.constraint(equalTo: container2.leadingAnchor, constant: 40.0),
//                hcpView2.trailingAnchor.constraint(equalTo: container2.trailingAnchor, constant: -40.0),
//                
//                // give hcpView a 2:1 ratio
//                hcpView2.heightAnchor.constraint(equalTo: hcpView2.widthAnchor, multiplier: 1.0 / 2.0),
//                
//                hcpView2.centerYAnchor.constraint(equalTo: container2.centerYAnchor),
//                
//            ])
//        } else if IS_IPHONE_N  {
//            //                let g = view.safeAreaLayoutGuide
//            NSLayoutConstraint.activate([
//                
//                container2.leadingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.PostprandialBloodSugar.leadingAnchor, constant: 155),
//                container2.trailingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.PostprandialBloodSugar.trailingAnchor, constant: 0.0),
//                container2.heightAnchor.constraint(equalTo: container.widthAnchor, multiplier: 1),
//                //            container.centerXAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerXAnchor),
//                container2.centerYAnchor.constraint(equalTo: BloodSugarManagementNotebookView.PostprandialBloodSugarPercent.centerYAnchor, constant: 25),
//                
//                // let's inset our progress view by 40-points on each side
//                hcpView2.leadingAnchor.constraint(equalTo: container2.leadingAnchor, constant: 40.0),
//                hcpView2.trailingAnchor.constraint(equalTo: container2.trailingAnchor, constant: -40.0),
//                
//                // give hcpView a 2:1 ratio
//                hcpView2.heightAnchor.constraint(equalTo: hcpView2.widthAnchor, multiplier: 1.0 / 2.0),
//                
//                hcpView2.centerYAnchor.constraint(equalTo: container2.centerYAnchor),
//                
//            ])
//        } else if IS_IPHONE_12PRO  {
//            //                let g = view.safeAreaLayoutGuide
//            NSLayoutConstraint.activate([
//                
//                container2.leadingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.PostprandialBloodSugar.leadingAnchor, constant: 155),
//                container2.trailingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.PostprandialBloodSugar.trailingAnchor, constant: 0.0),
//                container2.heightAnchor.constraint(equalTo: container.widthAnchor, multiplier: 1),
//                //            container.centerXAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerXAnchor),
//                container2.centerYAnchor.constraint(equalTo: BloodSugarManagementNotebookView.PostprandialBloodSugarPercent.centerYAnchor, constant: 35),
//                
//                // let's inset our progress view by 40-points on each side
//                hcpView2.leadingAnchor.constraint(equalTo: container2.leadingAnchor, constant: 40.0),
//                hcpView2.trailingAnchor.constraint(equalTo: container2.trailingAnchor, constant: -40.0),
//                
//                // give hcpView a 2:1 ratio
//                hcpView2.heightAnchor.constraint(equalTo: hcpView2.widthAnchor, multiplier: 1.0 / 2.0),
//                
//                hcpView2.centerYAnchor.constraint(equalTo: container2.centerYAnchor),
//                
//            ])
//        } else if IS_IPHONE_15PRO  {
//            //                let g = view.safeAreaLayoutGuide
//            NSLayoutConstraint.activate([
//                
//                container2.leadingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.PostprandialBloodSugar.leadingAnchor, constant: 155),
//                container2.trailingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.PostprandialBloodSugar.trailingAnchor, constant: 0.0),
//                container2.heightAnchor.constraint(equalTo: container.widthAnchor, multiplier: 1),
//                //            container.centerXAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerXAnchor),
//                container2.centerYAnchor.constraint(equalTo: BloodSugarManagementNotebookView.PostprandialBloodSugarPercent.centerYAnchor, constant: 35),
//                
//                // let's inset our progress view by 40-points on each side
//                hcpView2.leadingAnchor.constraint(equalTo: container2.leadingAnchor, constant: 40.0),
//                hcpView2.trailingAnchor.constraint(equalTo: container2.trailingAnchor, constant: -40.0),
//                
//                // give hcpView a 2:1 ratio
//                hcpView2.heightAnchor.constraint(equalTo: hcpView2.widthAnchor, multiplier: 1.0 / 2.0),
//                
//                hcpView2.centerYAnchor.constraint(equalTo: container2.centerYAnchor),
//                
//            ])
//        } else {
//            //                let g = view.safeAreaLayoutGuide
//            NSLayoutConstraint.activate([
//                
//                container2.leadingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.PostprandialBloodSugar.leadingAnchor, constant: 175),
//                container2.trailingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.PostprandialBloodSugar.trailingAnchor, constant: 10.0),
//                container2.heightAnchor.constraint(equalTo: container.widthAnchor, multiplier: 1),
//                //            container.centerXAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerXAnchor),
//                container2.centerYAnchor.constraint(equalTo: BloodSugarManagementNotebookView.PostprandialBloodSugarPercent.centerYAnchor, constant: 45),
//                
//                // let's inset our progress view by 40-points on each side
//                hcpView2.leadingAnchor.constraint(equalTo: container2.leadingAnchor, constant: 40.0),
//                hcpView2.trailingAnchor.constraint(equalTo: container2.trailingAnchor, constant: -40.0),
//                
//                // give hcpView a 2:1 ratio
//                hcpView2.heightAnchor.constraint(equalTo: hcpView2.widthAnchor, multiplier: 1.0 / 2.0),
//                
//                hcpView2.centerYAnchor.constraint(equalTo: container2.centerYAnchor),
//                
//            ])
//        }
//       
//        if UserDefaults.standard.object(forKey: "perGraphS2") == nil {
//            hcpView2.progress = 00
//        } else {
//            hcpView2.progress = UserDefaults.standard.object(forKey: "perGraphS2") as! CGFloat * 0.01
//        }
//        
////            hcpView2.progress = UserDefaults.standard.object(forKey: "perGraphS2") as! CGFloat * 0.01
////        hcpView2.progress = 0.3
//        
//        if IS_IPHONE_12PRO_MAX {
//            showLabel = UILabel(frame: CGRect(x: 44, y: 32, width: 42, height: 30))
//            
//            hcpView2.addSubview(showLabel)
//            
//            //        showLabel.layer.borderWidth = 1
//            
////            var changeShowLabel = Int(random)
//            var changeShowLabel = UserDefaults.standard.object(forKey: "persenS2")
//            print(changeShowLabel, "여기의 값은?")
//            showLabel.textAlignment = .center
//            showLabel.font = UIFont(name: "SUITE-Heavy", size: 13)
//            showLabel.textColor = .white
//            showLabel.text = "\(changeShowLabel ?? 0)%"
////            showLabel.text = UserDefaults.standard.string(forKey: "perB")
//        } else if IS_IPHONE_15PRO_MAX {
//            showLabel = UILabel(frame: CGRect(x: 44, y: 32, width: 42, height: 30))
//            
//            hcpView2.addSubview(showLabel)
//            
//            //        showLabel.layer.borderWidth = 1
//            
////            var changeShowLabel = Int(random)
//            var changeShowLabel = UserDefaults.standard.object(forKey: "persenS2")
//            print(changeShowLabel, "여기의 값은?")
//            showLabel.textAlignment = .center
//            showLabel.font = UIFont(name: "SUITE-Heavy", size: 13)
//            showLabel.textColor = .white
//            showLabel.text = "\(changeShowLabel ?? 0)%"
////            showLabel.text = UserDefaults.standard.string(forKey: "perB")
//        } else if IS_IPHONE_X {
//            showLabel = UILabel(frame: CGRect(x: 27, y: 23, width: 45, height: 30))
//            
//            hcpView2.addSubview(showLabel)
//            
//            //        showLabel.layer.borderWidth = 1
//            
////            var changeShowLabel = Int(random)
//            var changeShowLabel = UserDefaults.standard.object(forKey: "persenS2")
//            print(changeShowLabel, "여기의 값은?")
//            showLabel.textAlignment = .center
//            showLabel.font = UIFont(name: "SUITE-Heavy", size: 13)
//            showLabel.textColor = .white
//            showLabel.text = "\(changeShowLabel ?? 0)%"
////            showLabel.text = UserDefaults.standard.string(forKey: "perB")
//        } else if IS_IPHONE_N_PLUS {
//            showLabel = UILabel(frame: CGRect(x: 40, y: 31, width: 50, height: 30))
//            
//            hcpView2.addSubview(showLabel)
//            
//            //        showLabel.layer.borderWidth = 1
//            showLabel.textAlignment = .center
////            var changeShowLabel = Int(random)
//            var changeShowLabel = UserDefaults.standard.object(forKey: "persenS2")
//            print(changeShowLabel, "여기의 값은?")
//            
//            showLabel.font = UIFont(name: "SUITE-Heavy", size: 12)
//            showLabel.textColor = .white
//            showLabel.text = "\(changeShowLabel ?? 0)%"
////            showLabel.text = UserDefaults.standard.string(forKey: "perB")
//        } else if IS_IPHONE_N {
//            showLabel = UILabel(frame: CGRect(x: 25, y: 28, width: 51, height: 30))
//            
//            hcpView2.addSubview(showLabel)
//            
////                    showLabel.layer.borderWidth = 1
//            
////            var changeShowLabel = Int(random)
//            var changeShowLabel = UserDefaults.standard.object(forKey: "persenS2")
//            print(changeShowLabel, "여기의 값은?")
//
//            showLabel.textAlignment = .center
//            showLabel.font = UIFont(name: "SUITE-Heavy", size: 12)
//            showLabel.textColor = .white
//            showLabel.text = "\(changeShowLabel ?? 0)%"
////            showLabel.text = UserDefaults.standard.string(forKey: "perB")
//        } else if IS_IPHONE_12PRO {
//            showLabel = UILabel(frame: CGRect(x: 37, y: 30, width: 45, height: 30))
//            
//            hcpView2.addSubview(showLabel)
//            
//            //        showLabel.layer.borderWidth = 1
//            
////            var changeShowLabel = Int(random)
//            var changeShowLabel = UserDefaults.standard.object(forKey: "persenS2")
//            print(changeShowLabel, "여기의 값은?")
//            showLabel.textAlignment = .center
//            showLabel.font = UIFont(name: "SUITE-Heavy", size: 13)
//            showLabel.textColor = .white
//            showLabel.text = "\(changeShowLabel ?? 0)%"
////            showLabel.text = UserDefaults.standard.string(forKey: "perB")
//        } else if IS_IPHONE_15PRO {
//            showLabel = UILabel(frame: CGRect(x: 37, y: 30, width: 45, height: 30))
//            
//            hcpView2.addSubview(showLabel)
//            
//            //        showLabel.layer.borderWidth = 1
//            
////            var changeShowLabel = Int(random)
//            var changeShowLabel = UserDefaults.standard.object(forKey: "persenS2")
//            print(changeShowLabel, "여기의 값은?")
//            showLabel.textAlignment = .center
//            showLabel.font = UIFont(name: "SUITE-Heavy", size: 13)
//            showLabel.textColor = .white
//            showLabel.text = "\(changeShowLabel ?? 0)%"
////            showLabel.text = UserDefaults.standard.string(forKey: "perB")
//        } else {
//            showLabel = UILabel(frame: CGRect(x: 39, y: 28, width: 42, height: 30))
//            
//            hcpView2.addSubview(showLabel)
//            
//            //        showLabel.layer.borderWidth = 1
//            
////            var changeShowLabel = Int(random)
//            var changeShowLabel = UserDefaults.standard.object(forKey: "persenS2")
//            print(changeShowLabel, "여기의 값은?")
//            
//            showLabel.font = UIFont(name: "SUITE-Heavy", size: 12)
//            showLabel.textColor = .white
//            showLabel.text = "\(changeShowLabel ?? 0)%"
////            showLabel.text = UserDefaults.standard.string(forKey: "perB")
//        }
//        
//       
//        pctLabel.translatesAutoresizingMaskIntoConstraints = false
//        hcpView2.addSubview(pctLabel)
//        // add the pctLabel in the middle of the arc
//        NSLayoutConstraint.activate([
//            pctLabel.centerXAnchor.constraint(equalTo: hcpView2.centerXAnchor),
//            pctLabel.centerYAnchor.constraint(equalTo: hcpView2.centerYAnchor),
//        ])
//        
//        // let's add some percent / progress buttons
////                let btnStack = UIStackView()
////                btnStack.spacing = 4
////                btnStack.distribution = .fillEqually
////                [0.0, 0.1, 0.25, 0.33, 0.61, 0.8, 1.0].forEach { v in
////                    let b = UIButton()
////                    b.setTitle("\(v)", for: [])
////                    b.setTitleColor(.white, for: .normal)
////                    b.setTitleColor(.lightGray, for: .highlighted)
////                    b.titleLabel?.font = .systemFont(ofSize: 13.0, weight: .bold)
////                    b.backgroundColor = .systemGreen
////                    b.layer.cornerRadius = 6
////                    b.addTarget(self, action: #selector(btnTapped(_:)), for: .touchUpInside)
////                    btnStack.addArrangedSubview(b)
////                }
////
////                btnStack.translatesAutoresizingMaskIntoConstraints = false
////                view.addSubview(btnStack)
//        
//        // let's add a slider to set the progress
////                let slider = UISlider()
////                slider.translatesAutoresizingMaskIntoConstraints = false
////                view.addSubview(slider)
////
////                NSLayoutConstraint.activate([
////
////                    btnStack.topAnchor.constraint(equalTo: container.bottomAnchor, constant: 20.0),
////                    btnStack.leadingAnchor.constraint(equalTo: g.leadingAnchor, constant: 20.0),
////                    btnStack.trailingAnchor.constraint(equalTo: g.trailingAnchor, constant: -20.0),
////
////                    slider.topAnchor.constraint(equalTo: btnStack.bottomAnchor, constant: 20.0),
////                    slider.leadingAnchor.constraint(equalTo: g.leadingAnchor, constant: 20.0),
////                    slider.trailingAnchor.constraint(equalTo: g.trailingAnchor, constant: -20.0),
////
////                ])
////
////                slider.addTarget(self, action: #selector(sliderChanged(_:)), for: .valueChanged)
////
////                sliderChanged(slider)
//        
//        container2.backgroundColor = .clear
//        
//        
//        
//        
//        
//        
//        
//        
//        
//        BloodSugarManagementNotebookView.PostprandialBloodSugarGraph = UIView(frame: CGRect(x: BloodSugarManagementNotebookView.PostprandialBloodSugarPercent.frame.minX, y: BloodSugarManagementNotebookView.PostprandialBloodSugarPercent.frame.maxY + 20, width: BloodSugarManagementNotebookView.PostprandialBloodSugar.frame.size.width / 3, height: BloodSugarManagementNotebookView.PostprandialBloodSugar.frame.size.height / 2.2))
//        BloodSugarManagementNotebookView.PostprandialBloodSugarGraph.backgroundColor = .clear
////        BloodSugarManagementNotebookView.FastingBloodSugar.layer.borderWidth = 1
////        BloodSugarManagementNotebookView.FastingBloodSugar.layer.cornerRadius = 8
//        BloodSugarManagementNotebookView.PostprandialBloodSugar.addSubview(BloodSugarManagementNotebookView.PostprandialBloodSugarGraph)
//        
////        animate2()
//     
//       
//        BloodSugarManagementNotebookView.GlycatedHemoglobin = UIView(frame: CGRect(x: 20, y: BloodSugarManagementNotebookView.PostprandialBloodSugar.frame.maxY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 5.5))
//        if IS_IPHONE_N {
//            BloodSugarManagementNotebookView.GlycatedHemoglobin = UIView(frame: CGRect(x: 20, y: BloodSugarManagementNotebookView.PostprandialBloodSugar.frame.maxY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 5))
//        }
//        
//        if IS_IPHONE_N_PLUS {
//            BloodSugarManagementNotebookView.GlycatedHemoglobin = UIView(frame: CGRect(x: 20, y: BloodSugarManagementNotebookView.PostprandialBloodSugar.frame.maxY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 5))
//        }
//        
//        
//        
////        BloodSugarManagementNotebookView.GlycatedHemoglobin.backgroundColor = #colorLiteral(red: 0.4349892437, green: 0.1282797456, blue: 0.8903027177, alpha: 1)
//        BloodSugarManagementNotebookView.GlycatedHemoglobin.setGradient3(color1: UIColor(red: 128 / 255.0, green: 34 / 255.0, blue: 234 / 255.0, alpha: 1), color2: UIColor(red: 50.0 / 255.0, green: 14 / 255.0, blue: 203 / 255.0, alpha: 1))
////        BloodSugarManagementNotebookView.FastingBloodSugar.layer.borderWidth = 1
//        BloodSugarManagementNotebookView.GlycatedHemoglobin.layer.cornerRadius = 8
//        scrollView.addSubview(BloodSugarManagementNotebookView.GlycatedHemoglobin)
//        
//        
//        
//        let strokeUnderBar3 = UIView(frame: CGRect(x: 0, y: 20, width: 1, height: BloodSugarManagementNotebookView.GlycatedHemoglobin.frame.size.height - 40))
//        strokeUnderBar3.backgroundColor =  #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1).withAlphaComponent(0.8)
//        strokeUnderBar3.center.x = BloodSugarManagementNotebookView.GlycatedHemoglobin.frame.size.width / 2
//        BloodSugarManagementNotebookView.GlycatedHemoglobin.addSubview(strokeUnderBar3)
//        
//        
//        
//        BloodSugarManagementNotebookView.GlycatedHemoglobinLabel = UILabel(frame: CGRect(x: 20, y: 20, width: 140, height: BloodSugarManagementNotebookView.GlycatedHemoglobin.frame.size.height / 4))
//        BloodSugarManagementNotebookView.GlycatedHemoglobinLabel.text = ""
//        BloodSugarManagementNotebookView.GlycatedHemoglobinLabel.textAlignment = .center
//        BloodSugarManagementNotebookView.GlycatedHemoglobinLabel.numberOfLines = 0
//        
//        
//        if IS_IPHONE_12PRO_MAX {
//            BloodSugarManagementNotebookView.GlycatedHemoglobinLabel.font = UIFont(name: "SUITE-Regular", size: 20)
//        } else  if IS_IPHONE_15PRO_MAX {
//            BloodSugarManagementNotebookView.GlycatedHemoglobinLabel.font = UIFont(name: "SUITE-Regular", size: 20)
//        } else if IS_IPHONE_N_PLUS {
//            BloodSugarManagementNotebookView.GlycatedHemoglobinLabel.font = UIFont(name: "SUITE-Regular", size: 17)
//        } else if IS_IPHONE_X {
//            BloodSugarManagementNotebookView.GlycatedHemoglobinLabel.font = UIFont(name: "SUITE-Regular", size: 15)
//        } else {
//            BloodSugarManagementNotebookView.GlycatedHemoglobinLabel.font = UIFont(name: "SUITE-Regular", size: 15)
//        }
//        BloodSugarManagementNotebookView.GlycatedHemoglobinLabel.textAlignment = .center
//        BloodSugarManagementNotebookView.GlycatedHemoglobinLabel.numberOfLines = 0
//        
//        
//        BloodSugarManagementNotebookView.GlycatedHemoglobinLabel.textColor = .white
//        BloodSugarManagementNotebookView.GlycatedHemoglobin.addSubview(BloodSugarManagementNotebookView.GlycatedHemoglobinLabel)
//        
//        
//    
//        
//        
//        BloodSugarManagementNotebookView.GlycatedHemoglobinShowLabel = UILabel(frame: CGRect(x: 15, y: 22, width: 150, height: BloodSugarManagementNotebookView.GlycatedHemoglobin.frame.size.height / 4))
//     BloodSugarManagementNotebookView.GlycatedHemoglobinShowLabel.text = "당화혈색소\n(HbA1c)"
//        
//        if IS_IPHONE_12PRO_MAX {
//            BloodSugarManagementNotebookView.GlycatedHemoglobinShowLabel.font = UIFont(name: "SUITE-Regular", size: 13)
//        } else if IS_IPHONE_15PRO_MAX {
//            BloodSugarManagementNotebookView.GlycatedHemoglobinShowLabel.font = UIFont(name: "SUITE-Regular", size: 13)
//        } else if IS_IPHONE_N_PLUS {
//            BloodSugarManagementNotebookView.GlycatedHemoglobinShowLabel.font = UIFont(name: "SUITE-Regular", size: 11)
//        } else if IS_IPHONE_X {
//            BloodSugarManagementNotebookView.GlycatedHemoglobinShowLabel.font = UIFont(name: "SUITE-Regular", size: 11)
//        } else {
//            BloodSugarManagementNotebookView.GlycatedHemoglobinShowLabel.font = UIFont(name: "SUITE-Regular", size: 11)
//        }
//        
//        BloodSugarManagementNotebookView.GlycatedHemoglobinShowLabel.textAlignment = .center
//        BloodSugarManagementNotebookView.GlycatedHemoglobinShowLabel.numberOfLines = 0
//        
//        BloodSugarManagementNotebookView.GlycatedHemoglobinShowLabel.textColor = .white
//        BloodSugarManagementNotebookView.GlycatedHemoglobin.addSubview(BloodSugarManagementNotebookView.GlycatedHemoglobinShowLabel)
//        
//        
//        BloodSugarManagementNotebookView.GlycatedHemoglobinShowNumLabelNumber = UILabel(frame: CGRect(x: BloodSugarManagementNotebookView.GlycatedHemoglobin.frame.size.width / 5.8, y: BloodSugarManagementNotebookView.GlycatedHemoglobinShowLabel.frame.maxY + 20, width: 50, height: BloodSugarManagementNotebookView.FastingBloodSugar.frame.size.height / 6))
//        BloodSugarManagementNotebookView.GlycatedHemoglobinShowNumLabelNumber.text = "7.0"
//        
//           BloodSugarManagementNotebookView.GlycatedHemoglobinShowNumLabelNumber.textAlignment = .right
//        BloodSugarManagementNotebookView.GlycatedHemoglobinShowNumLabelNumber.font = UIFont(name: "SUITE-Heavy", size: 26)
//           
//        
//           BloodSugarManagementNotebookView.GlycatedHemoglobinShowNumLabelNumber.textColor = .white
//           BloodSugarManagementNotebookView.GlycatedHemoglobinShowNumLabelNumber.numberOfLines = 0
//           BloodSugarManagementNotebookView.GlycatedHemoglobin.addSubview(BloodSugarManagementNotebookView.GlycatedHemoglobinShowNumLabelNumber)
//        
//        
//        
//        
//        
//        
////        BloodSugarManagementNotebookView.GlycatedHemoglobinShowNumLabel = UILabel(frame: CGRect(x: 30, y: BloodSugarManagementNotebookView.GlycatedHemoglobinShowLabel.frame.maxY + 20, width: BloodSugarManagementNotebookView.GlycatedHemoglobin.frame.size.width / 2.5, height: BloodSugarManagementNotebookView.GlycatedHemoglobin.frame.size.height / 6))
////     BloodSugarManagementNotebookView.GlycatedHemoglobinShowNumLabel.text = "220mg/dL 이하"
////        BloodSugarManagementNotebookView.GlycatedHemoglobinShowNumLabel.textAlignment = .center
////        BloodSugarManagementNotebookView.GlycatedHemoglobinShowNumLabel.font = UIFont.systemFont(ofSize: 16)
////        BloodSugarManagementNotebookView.GlycatedHemoglobinShowNumLabel.textColor = .white
////        BloodSugarManagementNotebookView.GlycatedHemoglobin.addSubview(BloodSugarManagementNotebookView.GlycatedHemoglobinShowNumLabel)
//        
//        
//
//        
//        
//        
//        
//        BloodSugarManagementNotebookView.GlycatedHemoglobinPercent = UILabel(frame: CGRect(x: BloodSugarManagementNotebookView.GlycatedHemoglobin.frame.maxX - 180, y: 20, width: 130, height: BloodSugarManagementNotebookView.GlycatedHemoglobin.frame.size.height / 4))
//        BloodSugarManagementNotebookView.GlycatedHemoglobinPercent.text = ""
//       
//        
//        if IS_IPHONE_12PRO_MAX {
//            BloodSugarManagementNotebookView.GlycatedHemoglobinPercent.font = UIFont(name: "SUITE-Regular", size: 20)
//        } else if IS_IPHONE_15PRO_MAX {
//            BloodSugarManagementNotebookView.GlycatedHemoglobinPercent.font = UIFont(name: "SUITE-Regular", size: 20)
//        } else if IS_IPHONE_N_PLUS {
//            BloodSugarManagementNotebookView.GlycatedHemoglobinPercent.font = UIFont(name: "SUITE-Regular", size: 17)
//        } else if IS_IPHONE_X {
//            BloodSugarManagementNotebookView.GlycatedHemoglobinPercent.font = UIFont(name: "SUITE-Regular", size: 15)
//        } else {
//            BloodSugarManagementNotebookView.GlycatedHemoglobinPercent.font = UIFont(name: "SUITE-Regular", size: 15)
//        }
//        
////        BloodSugarManagementNotebookView.GlycatedHemoglobinPercent.font = UIFont(name: "SUITE-Regular", size: 13)
//        BloodSugarManagementNotebookView.GlycatedHemoglobinPercent.textAlignment = .center
//        BloodSugarManagementNotebookView.GlycatedHemoglobinPercent.numberOfLines = 0
//        
//        BloodSugarManagementNotebookView.GlycatedHemoglobinPercent.textColor = .white
//        BloodSugarManagementNotebookView.GlycatedHemoglobin.addSubview(BloodSugarManagementNotebookView.GlycatedHemoglobinPercent)
//        
//        
//        // we want the arc to be inset a bit, so we'll embed it in a "container"
//        let container3 = UIView()
//        container3.backgroundColor = .systemYellow
//        
//        container3.translatesAutoresizingMaskIntoConstraints = false
//        BloodSugarManagementNotebookView.GlycatedHemoglobin.addSubview(container3)
//        
//        hcpView3.translatesAutoresizingMaskIntoConstraints = false
//        container3.addSubview(hcpView3)
//        if IS_IPHONE_12PRO_MAX {
//            //                let g = view.safeAreaLayoutGuide
//            NSLayoutConstraint.activate([
//                
//                container3.leadingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.GlycatedHemoglobin.leadingAnchor, constant: 190.0),
//                container3.trailingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.GlycatedHemoglobin.trailingAnchor, constant: 10.0),
//                container3.heightAnchor.constraint(equalTo: container.widthAnchor, multiplier: 0.6),
//                //            container.centerXAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerXAnchor),
//                container3.centerYAnchor.constraint(equalTo: BloodSugarManagementNotebookView.GlycatedHemoglobinPercent.centerYAnchor, constant: 45),
//                
//                // let's inset our progress view by 40-points on each side
//                hcpView3.leadingAnchor.constraint(equalTo: container3.leadingAnchor, constant: 40.0),
//                hcpView3.trailingAnchor.constraint(equalTo: container3.trailingAnchor, constant: -40.0),
//                
//                // give hcpView a 2:1 ratio
//                hcpView3.heightAnchor.constraint(equalTo: hcpView3.widthAnchor, multiplier: 1.0 / 2.0),
//                
//                hcpView3.centerYAnchor.constraint(equalTo: container3.centerYAnchor),
//                
//            ])
//            
//        } else if IS_IPHONE_15PRO_MAX {
//            //                let g = view.safeAreaLayoutGuide
//            NSLayoutConstraint.activate([
//                
//                container3.leadingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.GlycatedHemoglobin.leadingAnchor, constant: 190.0),
//                container3.trailingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.GlycatedHemoglobin.trailingAnchor, constant: 10.0),
//                container3.heightAnchor.constraint(equalTo: container.widthAnchor, multiplier: 0.6),
//                //            container.centerXAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerXAnchor),
//                container3.centerYAnchor.constraint(equalTo: BloodSugarManagementNotebookView.GlycatedHemoglobinPercent.centerYAnchor, constant: 45),
//                
//                // let's inset our progress view by 40-points on each side
//                hcpView3.leadingAnchor.constraint(equalTo: container3.leadingAnchor, constant: 40.0),
//                hcpView3.trailingAnchor.constraint(equalTo: container3.trailingAnchor, constant: -40.0),
//                
//                // give hcpView a 2:1 ratio
//                hcpView3.heightAnchor.constraint(equalTo: hcpView3.widthAnchor, multiplier: 1.0 / 2.0),
//                
//                hcpView3.centerYAnchor.constraint(equalTo: container3.centerYAnchor),
//                
//            ])
//            
//        } else if IS_IPHONE_X  {
//            //                let g = view.safeAreaLayoutGuide
//            NSLayoutConstraint.activate([
//                
//                container3.leadingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.GlycatedHemoglobin.leadingAnchor, constant: 150),
//                container3.trailingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.GlycatedHemoglobin.trailingAnchor, constant: -10.0),
//                container3.heightAnchor.constraint(equalTo: container.widthAnchor, multiplier: 1.2),
//                //            container.centerXAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerXAnchor),
//                container3.centerYAnchor.constraint(equalTo: BloodSugarManagementNotebookView.GlycatedHemoglobinPercent.centerYAnchor, constant: 45),
//                
//                // let's inset our progress view by 40-points on each side
//                hcpView3.leadingAnchor.constraint(equalTo: container3.leadingAnchor, constant: 40.0),
//                hcpView3.trailingAnchor.constraint(equalTo: container3.trailingAnchor, constant: -40.0),
//                
//                // give hcpView a 2:1 ratio
//                hcpView3.heightAnchor.constraint(equalTo: hcpView3.widthAnchor, multiplier: 1.0 / 2.0),
//                
//                hcpView3.centerYAnchor.constraint(equalTo: container3.centerYAnchor),
//                
//            ])
//        } else if IS_IPHONE_N_PLUS  {
//            //                let g = view.safeAreaLayoutGuide
//            NSLayoutConstraint.activate([
//                
//                container3.leadingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.GlycatedHemoglobin.leadingAnchor, constant: 175),
//                container3.trailingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.GlycatedHemoglobin.trailingAnchor, constant: 10.0),
//                container3.heightAnchor.constraint(equalTo: container.widthAnchor, multiplier: 1),
//                //            container.centerXAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerXAnchor),
//                container3.centerYAnchor.constraint(equalTo: BloodSugarManagementNotebookView.GlycatedHemoglobinPercent.centerYAnchor, constant: 35),
//                
//                // let's inset our progress view by 40-points on each side
//                hcpView3.leadingAnchor.constraint(equalTo: container3.leadingAnchor, constant: 40.0),
//                hcpView3.trailingAnchor.constraint(equalTo: container3.trailingAnchor, constant: -40.0),
//                
//                // give hcpView a 2:1 ratio
//                hcpView3.heightAnchor.constraint(equalTo: hcpView3.widthAnchor, multiplier: 1.0 / 2.0),
//                
//                hcpView3.centerYAnchor.constraint(equalTo: container3.centerYAnchor),
//                
//            ])
//        } else if IS_IPHONE_N  {
//            //                let g = view.safeAreaLayoutGuide
//            NSLayoutConstraint.activate([
//                
//                container3.leadingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.GlycatedHemoglobin.leadingAnchor, constant: 155),
//                container3.trailingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.GlycatedHemoglobin.trailingAnchor, constant: 0.0),
//                container3.heightAnchor.constraint(equalTo: container.widthAnchor, multiplier: 1),
//                //            container.centerXAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerXAnchor),
//                container3.centerYAnchor.constraint(equalTo: BloodSugarManagementNotebookView.GlycatedHemoglobinPercent.centerYAnchor, constant: 25),
//                
//                // let's inset our progress view by 40-points on each side
//                hcpView3.leadingAnchor.constraint(equalTo: container3.leadingAnchor, constant: 40.0),
//                hcpView3.trailingAnchor.constraint(equalTo: container3.trailingAnchor, constant: -40.0),
//                
//                // give hcpView a 2:1 ratio
//                hcpView3.heightAnchor.constraint(equalTo: hcpView3.widthAnchor, multiplier: 1.0 / 2.0),
//                
//                hcpView3.centerYAnchor.constraint(equalTo: container3.centerYAnchor),
//                
//            ])
//        } else if IS_IPHONE_12PRO {
//            //                let g = view.safeAreaLayoutGuide
//            NSLayoutConstraint.activate([
//                
//                container3.leadingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.GlycatedHemoglobin.leadingAnchor, constant: 155),
//                container3.trailingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.GlycatedHemoglobin.trailingAnchor, constant: 0.0),
//                container3.heightAnchor.constraint(equalTo: container.widthAnchor, multiplier: 1),
//                //            container.centerXAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerXAnchor),
//                container3.centerYAnchor.constraint(equalTo: BloodSugarManagementNotebookView.GlycatedHemoglobinPercent.centerYAnchor, constant: 35),
//                
//                // let's inset our progress view by 40-points on each side
//                hcpView3.leadingAnchor.constraint(equalTo: container3.leadingAnchor, constant: 40.0),
//                hcpView3.trailingAnchor.constraint(equalTo: container3.trailingAnchor, constant: -40.0),
//                
//                // give hcpView a 2:1 ratio
//                hcpView3.heightAnchor.constraint(equalTo: hcpView3.widthAnchor, multiplier: 1.0 / 2.0),
//                
//                hcpView3.centerYAnchor.constraint(equalTo: container3.centerYAnchor),
//                
//            ])
//        }else if IS_IPHONE_15PRO {
//            //                let g = view.safeAreaLayoutGuide
//            NSLayoutConstraint.activate([
//                
//                container3.leadingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.GlycatedHemoglobin.leadingAnchor, constant: 155),
//                container3.trailingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.GlycatedHemoglobin.trailingAnchor, constant: 0.0),
//                container3.heightAnchor.constraint(equalTo: container.widthAnchor, multiplier: 1),
//                //            container.centerXAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerXAnchor),
//                container3.centerYAnchor.constraint(equalTo: BloodSugarManagementNotebookView.GlycatedHemoglobinPercent.centerYAnchor, constant: 45),
//                
//                // let's inset our progress view by 40-points on each side
//                hcpView3.leadingAnchor.constraint(equalTo: container3.leadingAnchor, constant: 40.0),
//                hcpView3.trailingAnchor.constraint(equalTo: container3.trailingAnchor, constant: -40.0),
//                
//                // give hcpView a 2:1 ratio
//                hcpView3.heightAnchor.constraint(equalTo: hcpView3.widthAnchor, multiplier: 1.0 / 2.0),
//                
//                hcpView3.centerYAnchor.constraint(equalTo: container3.centerYAnchor),
//                
//            ])
//        } else {
//            //                let g = view.safeAreaLayoutGuide
//            NSLayoutConstraint.activate([
//                
//                container3.leadingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.GlycatedHemoglobin.leadingAnchor, constant: 165),
//                container3.trailingAnchor.constraint(equalTo: BloodSugarManagementNotebookView.GlycatedHemoglobin.trailingAnchor, constant: 10.0),
//                container3.heightAnchor.constraint(equalTo: container.widthAnchor, multiplier: 1),
//                //            container.centerXAnchor.constraint(equalTo: BloodSugarManagementNotebookView.FastingBloodSugarPercent.centerXAnchor),
//                container3.centerYAnchor.constraint(equalTo: BloodSugarManagementNotebookView.GlycatedHemoglobinPercent.centerYAnchor, constant: 45),
//                
//                // let's inset our progress view by 40-points on each side
//                hcpView3.leadingAnchor.constraint(equalTo: container3.leadingAnchor, constant: 40.0),
//                hcpView3.trailingAnchor.constraint(equalTo: container3.trailingAnchor, constant: -40.0),
//                
//                // give hcpView a 2:1 ratio
//                hcpView3.heightAnchor.constraint(equalTo: hcpView3.widthAnchor, multiplier: 1.0 / 2.0),
//                
//                hcpView3.centerYAnchor.constraint(equalTo: container3.centerYAnchor),
//                
//            ])
//        }
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        if UserDefaults.standard.object(forKey: "perGraphS3") == nil {
            hcpView3.progress = 00
        } else {
            hcpView3.progress = UserDefaults.standard.object(forKey: "perGraphS3") as! CGFloat * 0.01
        }
//        hcpView3.progress = UserDefaults.standard.object(forKey: "perGraphS3") as! CGFloat * 0.01
        
        
        if IS_IPHONE_12PRO_MAX {
            showLabel = UILabel(frame: CGRect(x: 44, y: 32, width: 42, height: 30))
            
            hcpView3.addSubview(showLabel)
            
            //        showLabel.layer.borderWidth = 1
            showLabel.textAlignment = .center
//            var changeShowLabel = Int(random)
            var changeShowLabel = UserDefaults.standard.object(forKey: "persenS3")
            print(changeShowLabel, "여기의 값은?")
            
            showLabel.font = UIFont(name: "SUITE-Heavy", size: 13)
            showLabel.textColor = .white
            showLabel.text = "\(changeShowLabel ?? 0)%"
//            showLabel.text = UserDefaults.standard.string(forKey: "perB")
        } else if IS_IPHONE_15PRO_MAX {
            showLabel = UILabel(frame: CGRect(x: 44, y: 32, width: 42, height: 30))
            
            hcpView3.addSubview(showLabel)
            
            //        showLabel.layer.borderWidth = 1
            showLabel.textAlignment = .center
//            var changeShowLabel = Int(random)
            var changeShowLabel = UserDefaults.standard.object(forKey: "persenS3")
            print(changeShowLabel, "여기의 값은?")
            
            showLabel.font = UIFont(name: "SUITE-Heavy", size: 13)
            showLabel.textColor = .white
            showLabel.text = "\(changeShowLabel ?? 0)%"
//            showLabel.text = UserDefaults.standard.string(forKey: "perB")
        } else if IS_IPHONE_X {
            showLabel = UILabel(frame: CGRect(x: 27, y: 23, width: 45, height: 30))
            
            hcpView3.addSubview(showLabel)
            
            //        showLabel.layer.borderWidth = 1
            
//            var changeShowLabel = Int(random)
            var changeShowLabel = UserDefaults.standard.object(forKey: "persenS3")
            print(changeShowLabel, "여기의 값은?")
            showLabel.textAlignment = .center
            showLabel.font = UIFont(name: "SUITE-Heavy", size: 13)
            showLabel.textColor = .white
            showLabel.text = "\(changeShowLabel ?? 0)%"
//            showLabel.text = UserDefaults.standard.string(forKey: "perB")
        } else if IS_IPHONE_N_PLUS {
            showLabel = UILabel(frame: CGRect(x: 40, y: 31, width: 50, height: 30))
            
            hcpView3.addSubview(showLabel)
            
            //        showLabel.layer.borderWidth = 1
            showLabel.textAlignment = .center
//            var changeShowLabel = Int(random)
            var changeShowLabel = UserDefaults.standard.object(forKey: "persenS3")
            print(changeShowLabel, "여기의 값은?")
            
            showLabel.font = UIFont(name: "SUITE-Heavy", size: 12)
            showLabel.textColor = .white
            showLabel.text = "\(changeShowLabel ?? 0)%"
//            showLabel.text = UserDefaults.standard.string(forKey: "perB")
        } else if IS_IPHONE_N {
            showLabel = UILabel(frame: CGRect(x: 25, y: 28, width: 51, height: 30))
            
            hcpView3.addSubview(showLabel)
            
//                    showLabel.layer.borderWidth = 1
            
//            var changeShowLabel = Int(random)
            var changeShowLabel = UserDefaults.standard.object(forKey: "persenS3")
            print(changeShowLabel, "여기의 값은?")
            showLabel.textAlignment = .center
            showLabel.font = UIFont(name: "SUITE-Heavy", size: 12)
            showLabel.textColor = .white
            showLabel.text = "\(changeShowLabel ?? 0)%"
//            showLabel.text = UserDefaults.standard.string(forKey: "perB")
        } else if IS_IPHONE_12PRO {
            showLabel = UILabel(frame: CGRect(x: 37, y: 30, width: 45, height: 30))
            
            hcpView3.addSubview(showLabel)
            
            //        showLabel.layer.borderWidth = 1
            
//            var changeShowLabel = Int(random)
            var changeShowLabel = UserDefaults.standard.object(forKey: "persenS3")
            print(changeShowLabel, "여기의 값은?")
            showLabel.textAlignment = .center
            showLabel.font = UIFont(name: "SUITE-Heavy", size: 13)
            showLabel.textColor = .white
            showLabel.text = "\(changeShowLabel ?? 0)%"
//            showLabel.text = UserDefaults.standard.string(forKey: "perB")
        } else if IS_IPHONE_15PRO {
            showLabel = UILabel(frame: CGRect(x: 37, y: 30, width: 45, height: 30))
            
            hcpView3.addSubview(showLabel)
            
            //        showLabel.layer.borderWidth = 1
            
//            var changeShowLabel = Int(random)
            var changeShowLabel = UserDefaults.standard.object(forKey: "persenS3")
            print(changeShowLabel, "여기의 값은?")
            showLabel.textAlignment = .center
            showLabel.font = UIFont(name: "SUITE-Heavy", size: 13)
            showLabel.textColor = .white
            showLabel.text = "\(changeShowLabel ?? 0)%"
//            showLabel.text = UserDefaults.standard.string(forKey: "perB")
        } else {
            showLabel = UILabel(frame: CGRect(x: 39, y: 28, width: 42, height: 30))
            
            hcpView3.addSubview(showLabel)
            
            //        showLabel.layer.borderWidth = 1
            
//            var changeShowLabel = Int(random)
            var changeShowLabel = UserDefaults.standard.object(forKey: "persenS3")
            print(changeShowLabel, "여기의 값은?")
            
            showLabel.font = UIFont(name: "SUITE-Heavy", size: 12)
            showLabel.textColor = .white
            showLabel.text = "\(changeShowLabel ?? 0)%"
//            showLabel.text = UserDefaults.standard.string(forKey: "perB")
        }
        
        
        
        pctLabel.translatesAutoresizingMaskIntoConstraints = false
        hcpView3.addSubview(pctLabel)
        // add the pctLabel in the middle of the arc
        NSLayoutConstraint.activate([
            pctLabel.centerXAnchor.constraint(equalTo: hcpView3.centerXAnchor),
            pctLabel.centerYAnchor.constraint(equalTo: hcpView3.centerYAnchor),
        ])
        
        // let's add some percent / progress buttons
//                let btnStack = UIStackView()
//                btnStack.spacing = 4
//                btnStack.distribution = .fillEqually
//                [0.0, 0.1, 0.25, 0.33, 0.61, 0.8, 1.0].forEach { v in
//                    let b = UIButton()
//                    b.setTitle("\(v)", for: [])
//                    b.setTitleColor(.white, for: .normal)
//                    b.setTitleColor(.lightGray, for: .highlighted)
//                    b.titleLabel?.font = .systemFont(ofSize: 13.0, weight: .bold)
//                    b.backgroundColor = .systemGreen
//                    b.layer.cornerRadius = 6
//                    b.addTarget(self, action: #selector(btnTapped(_:)), for: .touchUpInside)
//                    btnStack.addArrangedSubview(b)
//                }
//
//                btnStack.translatesAutoresizingMaskIntoConstraints = false
//                view.addSubview(btnStack)
        
        // let's add a slider to set the progress
//                let slider = UISlider()
//                slider.translatesAutoresizingMaskIntoConstraints = false
//                view.addSubview(slider)
//
//                NSLayoutConstraint.activate([
//
//                    btnStack.topAnchor.constraint(equalTo: container.bottomAnchor, constant: 20.0),
//                    btnStack.leadingAnchor.constraint(equalTo: g.leadingAnchor, constant: 20.0),
//                    btnStack.trailingAnchor.constraint(equalTo: g.trailingAnchor, constant: -20.0),
//
//                    slider.topAnchor.constraint(equalTo: btnStack.bottomAnchor, constant: 20.0),
//                    slider.leadingAnchor.constraint(equalTo: g.leadingAnchor, constant: 20.0),
//                    slider.trailingAnchor.constraint(equalTo: g.trailingAnchor, constant: -20.0),
//
//                ])
//
//                slider.addTarget(self, action: #selector(sliderChanged(_:)), for: .valueChanged)
//
//                sliderChanged(slider)
        
        container3.backgroundColor = .clear
        
        
        
        
        
        
        
        BloodSugarManagementNotebookView.GlycatedHemoglobinGraph = UIView(frame: CGRect(x: BloodSugarManagementNotebookView.GlycatedHemoglobinPercent.frame.minX, y: BloodSugarManagementNotebookView.PostprandialBloodSugarPercent.frame.maxY + 20, width: BloodSugarManagementNotebookView.GlycatedHemoglobin.frame.size.width / 3, height: BloodSugarManagementNotebookView.GlycatedHemoglobin.frame.size.height / 2.2))
        BloodSugarManagementNotebookView.GlycatedHemoglobinGraph.backgroundColor = .clear
        //        BloodSugarManagementNotebookView.FastingBloodSugar.layer.borderWidth = 1
        //        BloodSugarManagementNotebookView.FastingBloodSugar.layer.cornerRadius = 8
        BloodSugarManagementNotebookView.GlycatedHemoglobin.addSubview(BloodSugarManagementNotebookView.GlycatedHemoglobinGraph)
        
        
        //        animate3()
        
        var saveData = UILabel(frame: CGRect(x: 20, y: BloodSugarManagementNotebookView.GlycatedHemoglobin.frame.maxY + 2, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 12))
        saveData.text = "측정하신 혈당을 입력해주세요."
        //        saveData.font = UIFont.systemFont(ofSize: 22)
        saveData.font = UIFont(name: "SUITE-Regular", size: 18)
        
        scrollView.addSubview(saveData)
        
        
        var saveView: UIView!
        
        //        var afterBTN: UIButton!
        //        var beforeBTN: UIButton!
        //        var bloodTF: UITextField!
        //        var glycated: UITextField!
        
        saveView = UIView(frame: CGRect(x: 20, y: saveData.frame.maxY + 2, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 4.5))
        saveView.backgroundColor = .white
        //        saveView.layer.borderWidth = 1
        saveView.layer.cornerRadius = 8
        scrollView.addSubview(saveView)
        
        var dateView = UIView(frame: CGRect(x: 10, y: 5, width: saveView.frame.size.width - 20, height: self.view.frame.size.height / 14))
        dateView.backgroundColor = .white
        
        saveView.addSubview(dateView)
        
        var dateViewLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 60, height: dateView.frame.height))
        dateViewLabel.text = "일시"
        dateViewLabel.layer.addBorder([.bottom], color: .lightGray, width: 1)
        dateViewLabel.font = UIFont(name: "SUITE-Regular", size: 17)
        dateView.addSubview(dateViewLabel)
        
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
        
        
        //변경
        
        
        
        changeTf = UITextField(frame: CGRect(x: dateViewLabel.frame.maxX, y: dateViewLabel.frame.minY, width: saveView.frame.size.width - 40 - dateViewLabel.frame.width, height: dateView.frame.height))
        changeTf.placeholder = formattedDateInString
        
        
        changeTf.textAlignment = .right
        changeTf.layer.addBorder([.bottom], color: .lightGray, width: 1)
        dateView.addSubview(changeTf)
        
         
//        showDatePicker()
        
        setupToolBar()
        setupDatePicker()
        
        
        
        BloodSugarManagementNotebookView.dateLable = UILabel(frame: CGRect(x: dateViewLabel.frame.maxX, y: dateViewLabel.frame.minY, width: saveView.frame.size.width - 40 - dateViewLabel.frame.width, height: dateView.frame.height))
        BloodSugarManagementNotebookView.dateLable.text = formattedDateInString
        BloodSugarManagementNotebookView.dateLable.textAlignment = .right
        BloodSugarManagementNotebookView.dateLable.layer.addBorder([.bottom], color: .lightGray, width: 1)
        
//        dateView.addSubview(BloodSugarManagementNotebookView.dateLable)
        
        var eatView = UIView(frame: CGRect(x: 10, y: dateView.frame.maxY, width: saveView.frame.size.width - 20, height: self.view.frame.size.height / 14))
        eatView.backgroundColor = .white
        
        saveView.addSubview(eatView)
        
        var eatVLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 80, height: dateView.frame.height))
        eatVLabel.text = "식사 상태"
        eatVLabel.layer.addBorder([.bottom], color: .lightGray, width: 1)
        eatVLabel.font = UIFont(name: "SUITE-Regular", size: 17)
        eatView.addSubview(eatVLabel)
        
        var innerView = UIView(frame: CGRect(x: eatVLabel.frame.maxX, y: 0, width: eatView.frame.size.width - 20 - eatVLabel.frame.width, height: eatView.frame.height))
//        innerView.layer.borderWidth = 1
        innerView.layer.addBorder([.bottom], color: .lightGray, width: 1)

//        bloodSugarLabel.font = UIFont(name: "SUITE-Regular", size: 17)
        eatView.addSubview(innerView)
        
        
        if IS_IPHONE_X {
            woman = UIButton(frame: CGRect(x: eatVLabel.frame.maxX + 70, y: 12, width: self.view.frame.size.width / 5.3, height: 35))
        } else if IS_IPHONE_N {
            woman = UIButton(frame: CGRect(x: eatVLabel.frame.maxX + 67, y: 7, width: self.view.frame.size.width / 5.3, height: 35))
        } else if IS_IPHONE_12PRO_MAX {
            woman = UIButton(frame: CGRect(x: eatVLabel.frame.maxX + 100, y: 12, width: self.view.frame.size.width / 5.3, height: 35))
        } else if IS_IPHONE_15PRO_MAX {
            woman = UIButton(frame: CGRect(x: eatVLabel.frame.maxX + 100, y: 12, width: self.view.frame.size.width / 5.3, height: 35))
        } else if IS_IPHONE_12PRO {
            woman = UIButton(frame: CGRect(x: eatVLabel.frame.maxX + 82, y: 12, width: self.view.frame.size.width / 5.3, height: 35))
        } else if IS_IPHONE_15PRO {
            woman = UIButton(frame: CGRect(x: eatVLabel.frame.maxX + 82, y: 12, width: self.view.frame.size.width / 5.3, height: 35))
        } else if IS_IPHONE_N_PLUS {
            woman = UIButton(frame: CGRect(x: eatVLabel.frame.maxX + 92, y: 10, width: self.view.frame.size.width / 5.3, height: 35))
        } else {
            woman = UIButton(frame: CGRect(x: eatVLabel.frame.maxX + 90, y: 12, width: self.view.frame.size.width / 5.3, height: 35))
        }
        
//        woman = UIButton(frame: CGRect(x: eatVLabel.frame.maxX + 55, y: 10, width: self.view.frame.size.width / 4.5, height: 35))
        woman.setTitle("공복", for: .normal)
        woman.layer.cornerRadius = 8
//        woman.backgroundColor = #colorLiteral(red: 0.8938891292, green: 0.9134108424, blue: 0.9262667298, alpha: 1)
        woman.setTitleColor(UIColor(red: 0.7011209726, green: 0.7713823915, blue: 0.8184124827, alpha: 1), for: .normal)
        woman.contentHorizontalAlignment = .center
//        woman.addTarget(self, action: #selector(womanClick(_ :)), for: .touchUpInside)
//        woman.titleLabel?.font = UIFont.systemFont(ofSize: 11)
        woman.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        woman.layer.borderWidth = 1
        woman.layer.borderColor = #colorLiteral(red: 0.8469004035, green: 0.866093874, blue: 0.8916024566, alpha: 1)
        
//        woman.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
        woman.tag = 0
        
        //        womanBTN.setImage(UIImage(named: "id"), for: .normal)
//        womanBTN.addTarget(self, action: #selector(test(_ :)), for: .touchUpInside)
        eatView.addSubview(woman)
        
        if IS_IPHONE_X {
            man = UIButton(frame: CGRect(x: woman.frame.maxX + 5, y: 12, width: self.view.frame.size.width / 5.3, height: 35))
        } else if IS_IPHONE_N {
            man = UIButton(frame: CGRect(x: woman.frame.maxX + 9, y: 7, width: self.view.frame.size.width / 5.3, height: 35))
        } else if IS_IPHONE_N_PLUS {
            man = UIButton(frame: CGRect(x: woman.frame.maxX + 6, y: 10, width: self.view.frame.size.width / 5.3, height: 35))
        } else {
            man = UIButton(frame: CGRect(x: woman.frame.maxX + 6, y: 12, width: self.view.frame.size.width / 5.3, height: 35))
        }
//        man = UIButton(frame: CGRect(x: woman.frame.maxX + 25, y: birthdayTF.frame.maxY + 10, width: self.view.frame.size.width / 2.5, height: 50))
        man.setTitle("식후", for: .normal)
//        man.backgroundColor = #colorLiteral(red: 0.8938891292, green: 0.9134108424, blue: 0.9262667298, alpha: 1)
        man.layer.cornerRadius = 8
        man.layer.borderWidth = 1
        man.layer.borderColor = #colorLiteral(red: 0.8469004035, green: 0.866093874, blue: 0.8916024566, alpha: 1)
        
        man.setTitleColor(UIColor(red: 0.7011209726, green: 0.7713823915, blue: 0.8184124827, alpha: 1), for: .normal)
        man.contentHorizontalAlignment = .center
//        man.titleLabel?.font = UIFont.systemFont(ofSize: 11)
        man.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
//        man.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
        man.tag = 1
        
        //        womanBTN.setImage(UIImage(named: "id"), for: .normal)
//        menBTN.addTarget(self, action: #selector(test(_ :)), for: .touchUpInside)
        eatView.addSubview(man)
        
        arrBTN = [woman, man]
        
        self.arrBTN.forEach {
            $0.addTarget(self, action: #selector(test(_ :)), for: .touchUpInside)
            
        }
        
        
        
        
        
        var bloodSugarView = UIView(frame: CGRect(x: 10, y: eatView.frame.maxY, width: saveView.frame.size.width - 20, height: self.view.frame.size.height / 14))
        bloodSugarView.backgroundColor = .white
        
        saveView.addSubview(bloodSugarView)
        
        var bloodSugarLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 80, height: dateView.frame.height))
        bloodSugarLabel.text = "혈당"
//        bloodSugarLabel.layer.addBorder([.bottom], color: .lightGray, width: 1)

        bloodSugarLabel.font = UIFont(name: "SUITE-Regular", size: 17)
        bloodSugarView.addSubview(bloodSugarLabel)
        
        bloodSugarTF = UITextField(frame: CGRect(x: bloodSugarLabel.frame.maxX, y: 0, width: saveView.frame.size.width - 40 - bloodSugarLabel.frame.width, height: bloodSugarLabel.frame.height))
        bloodSugarTF.placeholder = "혈당을 입력해 주세요."
        bloodSugarTF.keyboardType = .numberPad
//        bloodSugarTF.layer.addBorder([.bottom], color: .lightGray, width: 1)
        bloodSugarTF.textAlignment = .right
        bloodSugarTF.delegate = self
        bloodSugarTF.font = UIFont(name: "SUITE-Regular", size: 17)
        bloodSugarView.addSubview(bloodSugarTF)
        
//        var gyView = UIView(frame: CGRect(x: 10, y: bloodSugarView.frame.maxY, width: saveView.frame.size.width - 20, height: self.view.frame.size.height / 14))
//        gyView.backgroundColor = .white
//        
//        saveView.addSubview(gyView)
        
//        var gyLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 80, height: dateView.frame.height))
//        gyLabel.text = "당화혈색소"
////        gyLabel.layer.addBorder([.bottom], color: .lightGray, width: 1)
//        gyLabel.font = UIFont(name: "SUITE-Regular", size: 17)
//        gyView.addSubview(gyLabel)
        
//        glycatedHemoglobinTF = UITextField(frame: CGRect(x: gyLabel.frame.maxX, y: 0, width: saveView.frame.size.width - 40 - gyLabel.frame.width, height: gyLabel.frame.height))
//        glycatedHemoglobinTF.placeholder = "측정치를 적어주세요."
////        glycatedHemoglobinTF.layer.addBorder([.bottom], color: .lightGray, width: 1)
//        glycatedHemoglobinTF.textAlignment = .right
//        glycatedHemoglobinTF.font = UIFont(name: "SUITE-Regular", size: 17)
//        gyView.addSubview(glycatedHemoglobinTF)
        
        let cancelBTN = UIButton(frame: CGRect(x: 0, y: saveView.frame.maxY + 10, width: self.view.frame.size.width / 2, height: self.view.frame.size.height / 12))
        cancelBTN.setTitle("취소", for: .normal)
        cancelBTN.titleLabel?.font = UIFont(name: "SUITE-Heavy", size: 17)
        cancelBTN.backgroundColor = #colorLiteral(red: 0.6152173877, green: 0.6653684974, blue: 0.7206344604, alpha: 1)
        scrollView.addSubview(cancelBTN)
        
        let saveBTN = UIButton(frame: CGRect(x: cancelBTN.frame.maxX, y: saveView.frame.maxY + 10, width: self.view.frame.size.width / 2, height: self.view.frame.size.height / 12))
        saveBTN.setTitle("저장", for: .normal)
        saveBTN.titleLabel?.font = UIFont(name: "SUITE-Heavy", size: 17)
        saveBTN.backgroundColor = #colorLiteral(red: 0.1400382817, green: 0.3497706652, blue: 0.5862404704, alpha: 1)
        saveBTN.addTarget(self, action: #selector(saveButtonPressed(_ :)), for: .touchUpInside)
        scrollView.addSubview(saveBTN)
        
        
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: menuView.frame.maxY).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: saveBTN.bottomAnchor, constant: 50).isActive = true
        
        
        //--------------
        BloodSugarRecordsView = Smart_Stroke2024.BloodSugarRecordsView(frame: CGRect(x: 0, y: scrollView.frame.minY, width: SCREEN.WIDTH, height: scrollView.frame.height))
        BloodSugarRecordsView.backgroundColor = .yellow
        BloodSugarManagementNotebookView.addSubview(BloodSugarRecordsView)
        
        
        
        BloodSugarRecordsView.test = UIView(frame: CGRect(x: 0, y: scrollView.frame.minY, width: 500, height: self.view.frame.height))
        BloodSugarRecordsView.test.backgroundColor = .white
        
//        scrollView.addSubview(BloodSugarRecordsView.test)
        
        BloodSugarWebView.isHidden = true
        BloodSugarManagementNotebookView.isHidden = false
        bloodSugarListView.isHidden = true
        
        dataUpdateBloodSugar()
       
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: menuView.frame.maxY).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: saveBTN.bottomAnchor, constant: 0).isActive = true
        
    }
    override func viewDidAppear(_ animated: Bool) {
//        UnderBar = UIView(frame: CGRect(x: button2.center.x, y: naviBar.frame.maxY + 62, width: SCREEN.WIDTH / 8.5, height: 5))
//                UnderBar.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
//                self.view.addSubview(UnderBar)
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
        
        var time = Date()
        var formatter = DateFormatter()
        //        formatter.dateFormat = "MM.dd.yyyy a h:mm"
        formatter.locale = Locale(identifier: "ko_KR")
        
        formatter.dateFormat = "yyyy.MM.dd a h:mm"
        formatter.amSymbol = "오전"
        formatter.pmSymbol = "오후"
        
        let formattedDateInString = formatter.string(from: time)
        
        changeTf.placeholder = formattedDateInString
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
    
    
    
       

    
    @objc func rightButton2PressedList(_ button: UIButton) {
        
        testBtn1.backgroundColor = #colorLiteral(red: 0, green: 0.5898328424, blue: 0.8106423616, alpha: 1)
        testBtn2.backgroundColor = #colorLiteral(red: 0.9462642074, green: 0.9525992274, blue: 0.9730225205, alpha: 1)
        testBtn2.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        testBtn1.setTitleColor(.white, for: .normal)
        testBtn2.setTitleColor(#colorLiteral(red: 36.0 / 255.0, green: 89.0 / 255.0, blue: 149.0 / 255.0, alpha: 1), for: .normal)
        testBtn1.layer.borderWidth = 0
        testBtn2.layer.borderWidth = 1
        testBtn2.layer.borderColor = #colorLiteral(red: 0.6836393476, green: 0.7600957155, blue: 0.8458803296, alpha: 1).cgColor
        self.bloodSugarListView.graphScrollView.isHidden = true
        self.bloodSugarListView.dataScrollView.isHidden = false

        self.bloodSugarListView.dataScrollView.dataUpdate()
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
        
        self.bloodSugarListView.graphScrollView.isHidden = false
        self.bloodSugarListView.dataScrollView.isHidden = true

//        self.bloodSugarListView.graphScrollView.dataUpdate(index: 1)
        
        
    }
    
    func animate()
      {
          
          random = CGFloat(arc4random_uniform(UInt32(101))) //between 0 and n-1
          
        let slayer = CAShapeLayer()
          let center = CGPoint(x: (BloodSugarManagementNotebookView.FastingBloodSugarGraph.frame.width / 2) + 4, y: BloodSugarManagementNotebookView.FastingBloodSugarGraph.frame.height - 8)
          let radius: CGFloat = BloodSugarManagementNotebookView.FastingBloodSugarGraph.frame.height - 16
        let startAngle: CGFloat = 4 * .pi / 4
//        let endAngle: CGFloat = 0.0
          
          let endAngle: CGFloat = random / 180 * .pi * 2 - .pi
          
        slayer.path = UIBezierPath(arcCenter: center,
                                 radius: radius,
                                 startAngle: startAngle,
                                 endAngle: endAngle,
//                                   endAngle: CGFloat = random / 180 * .pi * 2 - .pi,
                                 clockwise: true).cgPath
        slayer.lineWidth = 15.0
          slayer.lineCap = CAShapeLayerLineCap.round
          
        slayer.strokeColor = UIColor.blue.cgColor
        slayer.fillColor = UIColor.clear.cgColor
          BloodSugarManagementNotebookView.FastingBloodSugarGraph.layer.addSublayer(slayer)
        slayer.strokeEnd = 0.0

        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = 60.0   //Customize the time of your animation here.
        animation.fromValue = 0.0
        animation.toValue = 1.0
        animation.timingFunction = CAMediaTimingFunction(name:
                                                            CAMediaTimingFunctionName.linear)
        slayer.strokeEnd = 1.0
        slayer.add(animation, forKey: nil)
          
          
          
          
          show = UILabel(frame: CGRect(x: 40, y: 80, width: 50, height: 30))
          if IS_IPHONE_N_PLUS {
              show = UILabel(frame: CGRect(x: 40, y: 60, width: 50, height: 30))
          }
          
          show.text = "\(random ?? 00)"
          
          
          BloodSugarManagementNotebookView.FastingBloodSugarGraph.addSubview(show)
          
          
          
      }
    
    func animate2()
      {
        let slayer = CAShapeLayer()
          let center = CGPoint(x: (BloodSugarManagementNotebookView.FastingBloodSugarGraph.frame.width / 2) + 4, y: BloodSugarManagementNotebookView.FastingBloodSugarGraph.frame.height - 8)
          let radius: CGFloat = BloodSugarManagementNotebookView.FastingBloodSugarGraph.frame.height - 16
        let startAngle: CGFloat = 4 * .pi / 4
//        let endAngle: CGFloat = 0.0
          
          let endAngle: CGFloat = 15 / 180 * .pi * 2 - .pi
        slayer.path = UIBezierPath(arcCenter: center,
                                 radius: radius,
                                 startAngle: startAngle,
                                 endAngle: endAngle,
                                 clockwise: true).cgPath
        slayer.lineWidth = 15.0
          slayer.lineCap = CAShapeLayerLineCap.round
        slayer.strokeColor = UIColor.blue.cgColor
        slayer.fillColor = UIColor.clear.cgColor
          BloodSugarManagementNotebookView.PostprandialBloodSugarGraph.layer.addSublayer(slayer)
        slayer.strokeEnd = 0.0

        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = 60.0   //Customize the time of your animation here.
        animation.fromValue = 0.0
        animation.toValue = 1.0
        animation.timingFunction = CAMediaTimingFunction(name:
                                                            CAMediaTimingFunctionName.linear)
        slayer.strokeEnd = 1.0
        slayer.add(animation, forKey: nil)
          
          show = UILabel(frame: CGRect(x: 40, y: 80, width: 50, height: 30))
          if IS_IPHONE_N_PLUS {
              show = UILabel(frame: CGRect(x: 40, y: 60, width: 50, height: 30))
          }
          
          show.text = "\(random ?? 00)"
          
          
          BloodSugarManagementNotebookView.PostprandialBloodSugarGraph.addSubview(show)
      }
    
    func animate3()
      {
        let slayer = CAShapeLayer()
          let center = CGPoint(x: (BloodSugarManagementNotebookView.FastingBloodSugarGraph.frame.width / 2) + 4, y: BloodSugarManagementNotebookView.FastingBloodSugarGraph.frame.height - 8)
          let radius: CGFloat = BloodSugarManagementNotebookView.FastingBloodSugarGraph.frame.height - 16
        let startAngle: CGFloat = 4 * .pi / 4
//        let endAngle: CGFloat = 0.0
          
          let endAngle: CGFloat = 15 / 180 * .pi * 2 - .pi
        slayer.path = UIBezierPath(arcCenter: center,
                                 radius: radius,
                                 startAngle: startAngle,
                                 endAngle: endAngle,
                                 clockwise: true).cgPath
        slayer.lineWidth = 15.0
          slayer.lineCap = CAShapeLayerLineCap.round
        slayer.strokeColor = UIColor.blue.cgColor
        slayer.fillColor = UIColor.clear.cgColor
          BloodSugarManagementNotebookView.GlycatedHemoglobinGraph.layer.addSublayer(slayer)
        slayer.strokeEnd = 0.0

        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = 60.0   //Customize the time of your animation here.
        animation.fromValue = 0.0
        animation.toValue = 1.0
        animation.timingFunction = CAMediaTimingFunction(name:
                                                            CAMediaTimingFunctionName.linear)
        slayer.strokeEnd = 1.0
        slayer.add(animation, forKey: nil)
          
          show = UILabel(frame: CGRect(x: 40, y: 80, width: 50, height: 30))
          if IS_IPHONE_N_PLUS {
              show = UILabel(frame: CGRect(x: 40, y: 60, width: 50, height: 30))
          }
          
          show.text = "\(random ?? 00)"
          
          
          BloodSugarManagementNotebookView.GlycatedHemoglobinGraph.addSubview(show)
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
            BloodSugarWebView.isHidden = false
            BloodSugarManagementNotebookView.isHidden = true
            bloodSugarListView.isHidden = true
            label1.textColor = .black
            label2.textColor = .lightGray
            label3.textColor = .lightGray
            
        } else if sender.tag == 1 {
            UIView.animate(withDuration: 0.5, animations: { [self] in
              
//            moveSelected(view: UnderBar, button: button2)
                
            })
            BloodSugarWebView.isHidden = true
            BloodSugarManagementNotebookView.isHidden = false
            bloodSugarListView.isHidden = true
            label1.textColor = .lightGray
            label2.textColor = .black
            label3.textColor = .lightGray
            
        } else if sender.tag == 2 {
            UIView.animate(withDuration: 0.5, animations: { [self] in
              
//            moveSelected(view: UnderBar, button: button3)
                
            })
            BloodSugarWebView.isHidden = true
            BloodSugarManagementNotebookView.isHidden = true
            bloodSugarListView.isHidden = false
            label1.textColor = .lightGray
            label2.textColor = .lightGray
            label3.textColor = .black
            
        }
    }
    
    
    @objc func saveButtonPressed(_ sender: UIButton) {
        
//        if self.beforeOfAfter == nil {
//            toastShow(message: "식사 상태를 선택하세요.")
//            return
//        }
        
        if self.bloodSugarTF.text == "" {
//            toastShow(message: "혈당을 입력해주세요.")
            showToast(message: "혈당을 입력해주세요.", font: UIFont(name: "SUITE-Regular", size: 20)!)
            
            
            return
        }
        
//        if self.glycatedHemoglobinTF.text == "" {
////            toastShow(message: "당화혈색소를 입력해주세요.")
//            showToast(message: "당화혈색소를 입력해주세요.", font: UIFont(name: "SUITE-Regular", size: 20)!)
//        }
        
//        guard let regNumString = userD.object(forKey: USER_KEY.KSR_REGISTRATION_NUMBER) as? String else {
//            toastShow(message: "reg_num is nil error")
//            return
//        }
        let regNumString = "SB-12500-1"
        
        let val = self.bloodSugarTF.text!
//        let hba1c = self.glycatedHemoglobinTF.text!
        
//        let year = dateToStringWithFormat(formatString: "yyyy", date: self.today)
//        let month = dateToStringWithFormat(formatString: "MM", date: self.today)
//        let week = dateToStringWithFormat(formatString: "w", date: self.today)
//        let dayweek = dateToStringWithFormat(formatString: "c", date: self.today)
//        let day = dateToStringWithFormat(formatString: "dd", date: self.today)
//        let dateTime = dateToStringWithFormat(formatString: "yyyy.MM.dd a h:mm", date: self.today)
//        let gubun = (self.beforeOfAfter == .before) ? "1":"2"
        
        
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
        
        
        
//        let year = dateToStringWithFormat(formatString: "yyyy", date: self.today)
              let year = current_year_string
              let month = formatter_month_string
              let week = formatter_week_string
              let dayweek = formatter_dayWeek_string
              let day = formatter_day_string
        
//              let dateTime = current_date_string
        var dateTime = changeTf.text
        
        let sid = "\(UserDefaults.standard.object(forKey: "userSid") ?? 00)"
        
        
        
        
        
        
        let sendDataDic = [
//            "reg_num":regNumString,
            "user_sid":sid,
            "value":val,
//            "hba1c":hba1c,
            "gubun":woman.layer.borderColor == #colorLiteral(red: 0.04341550916, green: 0.639064908, blue: 0.9187603593, alpha: 1) ? "1" : "2",
            "year":year,
            "month":month,
            "week":week,
            "dayweek":dayweek,
            "day":day,
//            "datetime":dateTime,
            "datetime":dateTime,
        ] as? [String:String]
        print("sendDataDic:\n\(sendDataDic)")
        self.showToast(message: "데이터가 등록 되었습니다.", font: UIFont(name: "SUITE-Regular", size: 18)!)
        Server.getData(type: Server.InfoType.SUGAR_ADD, otherInfo: sendDataDic) { (kData : Data?) in
            if let data = kData {
                if let dataString : String = String(data: data, encoding: String.Encoding.utf8) {
                    self.bloodSugarTF.text = ""
                    print("dataString:\(dataString)")
                    self.view.endEditing(true)
//                    self.superCon?.segView.itemButtonPressed(button: (self.superCon?.segView.itemButtons[2])!)
                    
                    self.bloodSugarListView.dataScrollView.dataUpdate()
                }
            }
        }
    }
    
    func dataUpdate(){
        print("hgdhgfhgfgh")
//            guard let regNumString = userD.object(forKey: USER_KEY.KSR_REGISTRATION_NUMBER) as? String else {
//                toastShow(message: "reg_num is nil error")
//                return
//            }
        let regNumString = "SB-12500-1"
        Server.getData(type: Server.InfoType.SUGAR_USER, otherInfo: ["user_sid":"\(UserDefaults.standard.object(forKey: "userSid") ?? 0)"]) { (kData : Data?) in
            if let data = kData {
                do {
                    if let jsonDic = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String:String] {
                        print("\(Server.InfoType.SUGAR_USER) : \n\(jsonDic)")

                        /*
                         ["cnt1": "7", "seccess2": "0", "cnt3": "7", "seccess3": "0", "cnt2": "1", "result": "7", "seccess1": "3"]
                         */

                        let seccess1 = jsonDic["seccess1"] ?? ""
                        let seccess2 = jsonDic["seccess2"] ?? ""
                        let seccess3 = jsonDic["seccess3"] ?? ""

                        let successValue1 = Int(seccess1, radix: 10)
                        let successValue2 = Int(seccess2, radix: 10)
                        let successValue3 = Int(seccess3, radix: 10)

                        let cnt1 = jsonDic["cnt1"] ?? ""
                        let cnt2 = jsonDic["cnt2"] ?? ""
                        let cnt3 = jsonDic["cnt3"] ?? ""

                        let cntValue1 = Int(cnt1, radix: 10)
                        let cntValue2 = Int(cnt2, radix: 10)
                        let cntValue3 = Int(cnt3, radix: 10)

                        if let success = successValue1 , let cnt = cntValue1 {
                            let persent : Int
                            if cnt != 0 {
                                persent = Int(round((Double(success) / Double(cnt)) * 100))
                            }else{
                                persent = 0
                            }
//                                self.bloodSugarNoteView.bloodSugarGoalAndRateView.rateView.valueLabelUpdate(labelIndex: 0, valueString: " \(persent) ", unitString: "%")
                            self.bloodSugarListView.dataScrollView.rateView.valueLabelUpdate(labelIndex: 0, valueString: " \(persent) ", unitString: "%")
                            self.bloodSugarListView.graphScrollView.rateView.valueLabelUpdate(labelIndex: 0, valueString: " \(persent) ", unitString: "%")
                        }

                        if let success = successValue2 , let cnt = cntValue2 {
                            let persent : Int
                            if cnt != 0 {
                                //?/
                                print("success : \(success)")
                                print("cnt : \(cnt)")
                                persent = Int(round((Double(success) / Double(cnt)) * 100))
                            }else{
                                persent = 0
                            }
//                                self.bloodSugarNoteView.bloodSugarGoalAndRateView.rateView.valueLabelUpdate(labelIndex: 1, valueString: " \(persent) ", unitString: "%")
                            self.bloodSugarListView.dataScrollView.rateView.valueLabelUpdate(labelIndex: 1, valueString: " \(persent) ", unitString: "%")
                            self.bloodSugarListView.graphScrollView.rateView.valueLabelUpdate(labelIndex: 1, valueString: " \(persent) ", unitString: "%")
                        }



                        if let success = successValue3 , let cnt = cntValue3 {
                            let persent : Int
                            if cnt != 0 {
                                persent = Int(round((Double(success) / Double(cnt)) * 100))
                            }else{
                                persent = 0
                            }
//                                self.bloodSugarNoteView.bloodSugarGoalAndRateView.rateView.valueLabelUpdate(labelIndex: 2, valueString: " \(persent) ", unitString: "%")
                            self.bloodSugarListView.dataScrollView.rateView.valueLabelUpdate(labelIndex: 2, valueString: " \(persent) ", unitString: "%")
                            self.bloodSugarListView.graphScrollView.rateView.valueLabelUpdate(labelIndex: 2, valueString: " \(persent) ", unitString: "%")
                        }







//                        self.bloodSugarNoteView.//?/

                    }
                }catch {
                    print("error:\(error.localizedDescription)")
                }
            }
        }



    }
    
        func dataUpdateBloodSugar(){
    
//            guard let regNumString = userD.object(forKey: USER_KEY.KSR_REGISTRATION_NUMBER) as? String else {
//                toastShow(message: "reg_num is nil error")
//                return
//            }
            let regNumString = "SB-12500-1"
    
            Server.getData(type: Server.InfoType.SUGAR_USER, otherInfo: ["reg_num":regNumString]) { (kData : Data?) in
                if let data = kData {
                    do {
                        if let jsonDic = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String:String] {
                            print("\(Server.InfoType.SUGAR_USER) : \n\(jsonDic)")
    
                            /*
                             ["cnt1": "7", "seccess2": "0", "cnt3": "7", "seccess3": "0", "cnt2": "1", "result": "7", "seccess1": "3"]
                             */
    
                            let seccess1 = jsonDic["seccess1"] ?? ""
                            let seccess2 = jsonDic["seccess2"] ?? ""
                            let seccess3 = jsonDic["seccess3"] ?? ""
    
                            let successValue1 = Int(seccess1, radix: 10)
                            let successValue2 = Int(seccess2, radix: 10)
                            let successValue3 = Int(seccess3, radix: 10)
    
                            let cnt1 = jsonDic["cnt1"] ?? ""
                            let cnt2 = jsonDic["cnt2"] ?? ""
                            let cnt3 = jsonDic["cnt3"] ?? ""
    
                            let cntValue1 = Int(cnt1, radix: 10)
                            let cntValue2 = Int(cnt2, radix: 10)
                            let cntValue3 = Int(cnt3, radix: 10)
    
                            if let success = successValue1 , let cnt = cntValue1 {
                                let persent : Int
                                if cnt != 0 {
                                    persent = Int(round((Double(success) / Double(cnt)) * 100))
                                }else{
                                    persent = 0
                                }
//                                self.bloodSugarNoteView.bloodSugarGoalAndRateView.rateView.valueLabelUpdate(labelIndex: 0, valueString: " \(persent) ", unitString: "%")
                                self.bloodSugarListView.dataScrollView.rateView.valueLabelUpdate(labelIndex: 0, valueString: " \(persent) ", unitString: "%")
                                self.bloodSugarListView.graphScrollView.rateView.valueLabelUpdate(labelIndex: 0, valueString: " \(persent) ", unitString: "%")
                            }
    
                            if let success = successValue2 , let cnt = cntValue2 {
                                let persent : Int
                                if cnt != 0 {
                                    //?/
                                    print("success : \(success)")
                                    print("cnt : \(cnt)")
                                    persent = Int(round((Double(success) / Double(cnt)) * 100))
                                }else{
                                    persent = 0
                                }
//                                self.bloodSugarNoteView.bloodSugarGoalAndRateView.rateView.valueLabelUpdate(labelIndex: 1, valueString: " \(persent) ", unitString: "%")
                                self.bloodSugarListView.dataScrollView.rateView.valueLabelUpdate(labelIndex: 1, valueString: " \(persent) ", unitString: "%")
                                self.bloodSugarListView.graphScrollView.rateView.valueLabelUpdate(labelIndex: 1, valueString: " \(persent) ", unitString: "%")
                            }
    
    
    
                            if let success = successValue3 , let cnt = cntValue3 {
                                let persent : Int
                                if cnt != 0 {
                                    persent = Int(round((Double(success) / Double(cnt)) * 100))
                                }else{
                                    persent = 0
                                }
//                                self.bloodSugarNoteView.bloodSugarGoalAndRateView.rateView.valueLabelUpdate(labelIndex: 2, valueString: " \(persent) ", unitString: "%")
                                self.bloodSugarListView.dataScrollView.rateView.valueLabelUpdate(labelIndex: 2, valueString: " \(persent) ", unitString: "%")
                                self.bloodSugarListView.graphScrollView.rateView.valueLabelUpdate(labelIndex: 2, valueString: " \(persent) ", unitString: "%")
                            }
    
    
    
    
    
    
    
    //                        self.bloodSugarNoteView.//?/
    
                        }
                    }catch {
                        print("error:\(error.localizedDescription)")
                    }
                }
            }
    
    
    
        }
    //
    
    
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
    
//    @objc func test(_ sender: UIButton) {
//        print("\(sender.tag)")
//        
//        self.arrBTN.forEach {
//            if $0.tag == sender.tag {
////                $0.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
////                $0.backgroundColor = #colorLiteral(red: 0.04341550916, green: 0.639064908, blue: 0.9187603593, alpha: 1)
//                $0.layer.borderColor = #colorLiteral(red: 0.04341550916, green: 0.639064908, blue: 0.9187603593, alpha: 1)
//                $0.setTitleColor(#colorLiteral(red: 0.04341550916, green: 0.639064908, blue: 0.9187603593, alpha: 1), for: .normal)
//                
//            } else {
////                $0.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
//                $0.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
//                $0.setTitleColor(UIColor(red: 0.7011209726, green: 0.7713823915, blue: 0.8184124827, alpha: 1), for: .normal)
//            }
//        }
//    }
    
    
    @objc func test(_ sender: UIButton) {
        print("\(sender.tag)")
        
        self.arrBTN.forEach {
            if $0.tag == sender.tag {
//                $0.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
//                $0.backgroundColor = #colorLiteral(red: 0.04341550916, green: 0.639064908, blue: 0.9187603593, alpha: 1)
                $0.layer.borderColor = #colorLiteral(red: 0.04341550916, green: 0.639064908, blue: 0.9187603593, alpha: 1)
                $0.setTitleColor(#colorLiteral(red: 0.04341550916, green: 0.639064908, blue: 0.9187603593, alpha: 1), for: .normal)
                
            } else {
//                $0.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
                $0.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                $0.layer.borderColor = #colorLiteral(red: 0.8469004035, green: 0.866093874, blue: 0.8916024566, alpha: 1)
                $0.setTitleColor(UIColor(red: 0.7011209726, green: 0.7713823915, blue: 0.8184124827, alpha: 1), for: .normal)
            }
        }
    }
    
    
    func showDatePicker(){
        //Formate Date
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .inline
        
        //ToolBar
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));
        
        toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
        
        changeTf.inputAccessoryView = toolbar
        changeTf.inputView = datePicker
        
      
        
    }
    
    @objc func donedatePicker(){
        
        let formatter = DateFormatter()
        //       formatter.dateFormat = "dd/MM/yyyy"
        formatter.dateFormat = "yyyy.MM.dd a h:mm"
        
        formatter.amSymbol = "오전"
            formatter.pmSymbol = "오후"
        changeTf.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
        
    }
    
    @objc func cancelDatePicker(){
        self.view.endEditing(true)
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
        
        if textField == bloodSugarTF {
            
            guard let textFieldText = bloodSugarTF.text,
                  let rangeOfTextToReplace = Range(range, in: textFieldText) else {
                return false
            }
            let substringToReplace = textFieldText[rangeOfTextToReplace]
            let count = textFieldText.count - substringToReplace.count + string.count
            return count <= 3
        }
//        else if textField == relaxtionInputView {
//
//            guard let textFieldText = relaxtionInputView.text,
//                  let rangeOfTextToReplace = Range(range, in: textFieldText) else {
//                return false
//            }
//            let substringToReplace = textFieldText[rangeOfTextToReplace]
//            let count = textFieldText.count - substringToReplace.count + string.count
//            return count <= 3
//
//        } else if textField == heartRateInputView {
//
//            guard let textFieldText = heartRateInputView.text,
//                  let rangeOfTextToReplace = Range(range, in: textFieldText) else {
//                return false
//            }
//            let substringToReplace = textFieldText[rangeOfTextToReplace]
//            let count = textFieldText.count - substringToReplace.count + string.count
//            return count <= 3
//
//        }
        return true
    }
    
}
