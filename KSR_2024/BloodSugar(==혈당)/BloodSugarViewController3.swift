//
//  BloodSugarViewController3.swift
//  KSR_2024
//
//  Created by m2comm on 2024/01/29.
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
//class BloodSugarViewController3: BaseViewController {
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
//        BloodSugarWebView.isHidden = false
//        BloodSugarManagementNotebookView.isHidden = true
//        bloodSugarListView.isHidden = true
//        
//        BloodSugarWebView.isHidden = true
//        BloodSugarManagementNotebookView.isHidden = true
//        bloodSugarListView.isHidden = false
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
//

//import UIKit
//
//class BloodSugarViewController3: BaseViewController {
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
//        BloodSugarManagementNotebookView.isHidden = true
//        bloodSugarListView.isHidden = false
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



class BloodSugarViewController3: BaseViewController {
    
    var BloodSugarWebView : WebView!
    var BloodSugarManagementNotebookView : BloodSugarManagementNotebookView!
    var BloodSugarRecordsView : BloodSugarRecordsView!
    
        var bloodSugarListView : BloodSugarListView!
    
    var testBtn1: UIButton!
    var testBtn2: UIButton!
    
    var show: UILabel!
    var random: CGFloat!
    
    var bloodSugarTF: UITextField!
    var glycatedHemoglobinTF: UITextField!
    
    var UnderBar: UIView!
    var titleName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        UnderBar = UIView(frame: CGRect(x: button3.center.x, y: naviBar.frame.maxY + 62, width: SCREEN.WIDTH / 8.8, height: 5))
//        UnderBar.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
//        
//        self.view.addSubview(UnderBar)
        
        setupKeyboardEvent()
        
        hideKeyboardWhenTappedAround()
        
        buttons = [button1, button2, button3]
        
        self.buttons.forEach {
            $0.addTarget(self, action: #selector(segButtonPressed(_ :)), for: .touchUpInside)
        }
        
        titleName = UILabel(frame: CGRect(x: self.view.frame.size.width / 2.2, y: 0, width: 150, height: naviBar.frame.height))
//        titleName.text = titleLabel
        
        titleName.text = "혈당"
        titleName.font = UIFont(name: "SUITE-Regular", size: 20)
        
        naviBar.addSubview(titleName)
        
        label1.text = "혈당관리\n도움말"
        label2.text = "혈당\n관리수첩"
        label3.text = "혈당\n기록보기"
        
        
        label1.textColor = .lightGray
        label2.textColor = .lightGray
        label3.textColor = .black
        
        
        self.BloodSugarWebView = WebView(frame: CGRect(
            x: 0,
            y: menuView.frame.maxY,
            width: SCREEN.WIDTH,
            height: SCREEN.HEIGHT - menuView.frame.maxY), urlString: URL_Addres.what_is_diabetes)
        
        BloodSugarManagementNotebookView = KSR_2024.BloodSugarManagementNotebookView(frame: CGRect(x: 0, y: scrollView.frame.minY, width: SCREEN.WIDTH, height: scrollView.frame.height))
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
        
                self.dataUpdate()
        
        testBtn1 = UIButton(frame: CGRect(x: SCREEN.WIDTH / 2, y: 20, width: 100, height: 60))
        testBtn1.setTitle("리스트보기", for: .normal)
        testBtn1.setTitleColor(.black, for: .normal)
        testBtn1.layer.borderWidth = 1
        bloodSugarListView.addSubview(testBtn1)
        testBtn1.addTarget(self, action: #selector(rightButton2PressedList(_ :)), for: .touchUpInside)
        
        
        testBtn2 = UIButton(frame: CGRect(x: testBtn1.frame.maxX + 5, y: 20, width: 100, height: 60))
        testBtn2.setTitle("그래프보기", for: .normal)
        testBtn2.setTitleColor(.black, for: .normal)
        testBtn2.layer.borderWidth = 1
        bloodSugarListView.addSubview(testBtn2)
        testBtn2.addTarget(self, action: #selector(rightButton2PressedGraph(_ :)), for: .touchUpInside)
        
        
        
    
        
        BloodSugarManagementNotebookView.FastingBloodSugar = UIView(frame: CGRect(x: 20, y: scrollView.frame.minY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 4))
        BloodSugarManagementNotebookView.FastingBloodSugar.backgroundColor = #colorLiteral(red: 0.002579513937, green: 0.765566349, blue: 0.8613703847, alpha: 1)
//        BloodSugarManagementNotebookView.FastingBloodSugar.layer.borderWidth = 1
        BloodSugarManagementNotebookView.FastingBloodSugar.layer.cornerRadius = 8
        
        scrollView.addSubview(BloodSugarManagementNotebookView.FastingBloodSugar)
        
        BloodSugarManagementNotebookView.FastingBloodSugarLabel = UILabel(frame: CGRect(x: 30, y: 20, width: 140, height: BloodSugarManagementNotebookView.FastingBloodSugar.frame.size.height / 4))
        BloodSugarManagementNotebookView.FastingBloodSugarLabel.text = "나의 혈압\n목표 수치는?"
        BloodSugarManagementNotebookView.FastingBloodSugarLabel.numberOfLines = 0
        BloodSugarManagementNotebookView.FastingBloodSugarLabel.textAlignment = .center
//        BloodSugarManagementNotebookView.FastingBloodSugarLabel.layer.borderWidth = 1
        BloodSugarManagementNotebookView.FastingBloodSugarLabel.font = UIFont.systemFont(ofSize: 20)
        if IS_IPHONE_N_PLUS {
            BloodSugarManagementNotebookView.FastingBloodSugarLabel.font = UIFont.systemFont(ofSize: 16)
        
            BloodSugarManagementNotebookView.FastingBloodSugarLabel.numberOfLines = 0
        }
        BloodSugarManagementNotebookView.FastingBloodSugarLabel.textColor = .white
        BloodSugarManagementNotebookView.FastingBloodSugar.addSubview(BloodSugarManagementNotebookView.FastingBloodSugarLabel)
        
        BloodSugarManagementNotebookView.FastingBloodSugarShowLabel = UILabel(frame: CGRect(x: 30, y: BloodSugarManagementNotebookView.FastingBloodSugarLabel.frame.maxY + 20, width: 130, height: BloodSugarManagementNotebookView.FastingBloodSugar.frame.size.height / 6))
     BloodSugarManagementNotebookView.FastingBloodSugarShowLabel.text = "금식혈당\n(Fasting glucose)"
        BloodSugarManagementNotebookView.FastingBloodSugarShowLabel.textAlignment = .center
        BloodSugarManagementNotebookView.FastingBloodSugarShowLabel.numberOfLines = 0
        BloodSugarManagementNotebookView.FastingBloodSugarShowLabel.font = UIFont.systemFont(ofSize: 14)
        
        if IS_IPHONE_N_PLUS {
            BloodSugarManagementNotebookView.FastingBloodSugarShowLabel.font = UIFont.systemFont(ofSize: 10)
        
            BloodSugarManagementNotebookView.FastingBloodSugarShowLabel.numberOfLines = 0
        }
        BloodSugarManagementNotebookView.FastingBloodSugarShowLabel.textColor = .white
        BloodSugarManagementNotebookView.FastingBloodSugar.addSubview(BloodSugarManagementNotebookView.FastingBloodSugarShowLabel)
        
        BloodSugarManagementNotebookView.FastingBloodSugarShowNumLabelNumber = UILabel(frame: CGRect(x: 30, y: BloodSugarManagementNotebookView.FastingBloodSugarShowLabel.frame.maxY + 20, width: 50, height: BloodSugarManagementNotebookView.FastingBloodSugar.frame.size.height / 6))
        BloodSugarManagementNotebookView.FastingBloodSugarShowNumLabelNumber.text = "120"
           BloodSugarManagementNotebookView.FastingBloodSugarShowNumLabelNumber.textAlignment = .right
           BloodSugarManagementNotebookView.FastingBloodSugarShowNumLabelNumber.font = UIFont.systemFont(ofSize: 27)
        if IS_IPHONE_N_PLUS {
            BloodSugarManagementNotebookView.FastingBloodSugarShowNumLabelNumber.font = UIFont.systemFont(ofSize: 23)
        
            BloodSugarManagementNotebookView.FastingBloodSugarShowNumLabelNumber.numberOfLines = 0
        }
        
           BloodSugarManagementNotebookView.FastingBloodSugarShowNumLabelNumber.textColor = .white
           BloodSugarManagementNotebookView.FastingBloodSugarShowNumLabelNumber.numberOfLines = 0
           BloodSugarManagementNotebookView.FastingBloodSugar.addSubview(BloodSugarManagementNotebookView.FastingBloodSugarShowNumLabelNumber)
        
        
        
        BloodSugarManagementNotebookView.FastingBloodSugarShowNumLabel = UILabel(frame: CGRect(x: BloodSugarManagementNotebookView.FastingBloodSugarShowNumLabelNumber.frame.maxX + 5, y: BloodSugarManagementNotebookView.FastingBloodSugarShowLabel.frame.maxY + 20, width: 50, height: BloodSugarManagementNotebookView.FastingBloodSugar.frame.size.height / 6))
     BloodSugarManagementNotebookView.FastingBloodSugarShowNumLabel.text = "  mg/dL\n이하"
        BloodSugarManagementNotebookView.FastingBloodSugarShowNumLabel.textAlignment = .right
        BloodSugarManagementNotebookView.FastingBloodSugarShowNumLabel.font = UIFont.systemFont(ofSize: 14)
        if IS_IPHONE_N_PLUS {
            BloodSugarManagementNotebookView.FastingBloodSugarShowNumLabel.font = UIFont.systemFont(ofSize: 12)
        
            BloodSugarManagementNotebookView.FastingBloodSugarShowNumLabel.numberOfLines = 0
        }
        BloodSugarManagementNotebookView.FastingBloodSugarShowNumLabel.textColor = .white
        BloodSugarManagementNotebookView.FastingBloodSugarShowNumLabel.numberOfLines = 0
        BloodSugarManagementNotebookView.FastingBloodSugar.addSubview(BloodSugarManagementNotebookView.FastingBloodSugarShowNumLabel)
        
        BloodSugarManagementNotebookView.FastingBloodSugarPercent = UILabel(frame: CGRect(x: BloodSugarManagementNotebookView.FastingBloodSugar.frame.maxX - 180, y: 25, width: 130, height: BloodSugarManagementNotebookView.FastingBloodSugar.frame.size.height / 4))
        BloodSugarManagementNotebookView.FastingBloodSugarPercent.text = "목표 수치\n달성율은?"
        BloodSugarManagementNotebookView.FastingBloodSugarPercent.numberOfLines = 0
        BloodSugarManagementNotebookView.FastingBloodSugarPercent.textAlignment = .center
        BloodSugarManagementNotebookView.FastingBloodSugarPercent.font = UIFont.systemFont(ofSize: 20)
        if IS_IPHONE_N_PLUS {
            BloodSugarManagementNotebookView.FastingBloodSugarPercent.font = UIFont.systemFont(ofSize: 16)
        
            BloodSugarManagementNotebookView.FastingBloodSugarPercent.numberOfLines = 0
        }
        BloodSugarManagementNotebookView.FastingBloodSugarPercent.textColor = .white
        BloodSugarManagementNotebookView.FastingBloodSugar.addSubview(BloodSugarManagementNotebookView.FastingBloodSugarPercent)
        
        BloodSugarManagementNotebookView.FastingBloodSugarGraph = UIView(frame: CGRect(x: BloodSugarManagementNotebookView.FastingBloodSugarPercent.frame.minX, y: BloodSugarManagementNotebookView.FastingBloodSugarPercent.frame.maxY + 20, width: BloodSugarManagementNotebookView.FastingBloodSugar.frame.size.width / 3, height: BloodSugarManagementNotebookView.FastingBloodSugar.frame.size.height / 2.2))
        BloodSugarManagementNotebookView.FastingBloodSugarGraph.backgroundColor = .clear
//        BloodSugarManagementNotebookView.FastingBloodSugarGraph.layer.borderWidth = 1
//        BloodSugarManagementNotebookView.FastingBloodSugar.layer.cornerRadius = 8
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
        
        animate()
        
        
        BloodSugarManagementNotebookView.PostprandialBloodSugar = UIView(frame: CGRect(x: 20, y: BloodSugarManagementNotebookView.FastingBloodSugar.frame.maxY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 4))
        BloodSugarManagementNotebookView.PostprandialBloodSugar.backgroundColor = #colorLiteral(red: 0.009351861663, green: 0.4616524577, blue: 0.943269372, alpha: 1)
//        BloodSugarManagementNotebookView.FastingBloodSugar.layer.borderWidth = 1
        BloodSugarManagementNotebookView.PostprandialBloodSugar.layer.cornerRadius = 8
        scrollView.addSubview(BloodSugarManagementNotebookView.PostprandialBloodSugar)
        
       
        BloodSugarManagementNotebookView.PostprandialBloodSugarLabel = UILabel(frame: CGRect(x: 20, y: 20, width: 140, height: BloodSugarManagementNotebookView.PostprandialBloodSugar.frame.size.height / 4))
        BloodSugarManagementNotebookView.PostprandialBloodSugarLabel.text = "나의 혈압\n목표 수치는?"
        BloodSugarManagementNotebookView.PostprandialBloodSugarLabel.textAlignment = .center
        BloodSugarManagementNotebookView.PostprandialBloodSugarLabel.numberOfLines = 0
        BloodSugarManagementNotebookView.PostprandialBloodSugarLabel.font = UIFont.systemFont(ofSize: 20)
        if IS_IPHONE_N_PLUS {
            BloodSugarManagementNotebookView.PostprandialBloodSugarLabel.font = UIFont.systemFont(ofSize: 16)
        
            BloodSugarManagementNotebookView.PostprandialBloodSugarLabel.numberOfLines = 0
        }
        if IS_IPHONE_X {
            BloodSugarManagementNotebookView.PostprandialBloodSugarLabel.font = UIFont.systemFont(ofSize: 15)
        
            BloodSugarManagementNotebookView.PostprandialBloodSugarLabel.numberOfLines = 0
        }
        BloodSugarManagementNotebookView.PostprandialBloodSugarLabel.textColor = .white
      
        
        BloodSugarManagementNotebookView.PostprandialBloodSugar.addSubview(BloodSugarManagementNotebookView.PostprandialBloodSugarLabel)
        
        
        
        
        BloodSugarManagementNotebookView.PostprandialBloodSugarShowLabel = UILabel(frame: CGRect(x: 15, y: BloodSugarManagementNotebookView.PostprandialBloodSugarLabel.frame.maxY + 20, width: 150, height: BloodSugarManagementNotebookView.PostprandialBloodSugar.frame.size.height / 6))
     BloodSugarManagementNotebookView.PostprandialBloodSugarShowLabel.text = "식후혈당\n(Postprandial glucose)"
        BloodSugarManagementNotebookView.PostprandialBloodSugarShowLabel.textAlignment = .center
        BloodSugarManagementNotebookView.PostprandialBloodSugarShowLabel.numberOfLines = 0
        BloodSugarManagementNotebookView.PostprandialBloodSugarShowLabel.font = UIFont.systemFont(ofSize: 14)
        
        if IS_IPHONE_N_PLUS {
            BloodSugarManagementNotebookView.PostprandialBloodSugarShowLabel.font = UIFont.systemFont(ofSize: 11)
        
            BloodSugarManagementNotebookView.PostprandialBloodSugarShowLabel.numberOfLines = 0
        }
        if IS_IPHONE_X {
            BloodSugarManagementNotebookView.PostprandialBloodSugarShowLabel.font = UIFont.systemFont(ofSize: 11)
        
            BloodSugarManagementNotebookView.PostprandialBloodSugarShowLabel.numberOfLines = 0
        }
        BloodSugarManagementNotebookView.PostprandialBloodSugarShowLabel.textColor = .white
        BloodSugarManagementNotebookView.PostprandialBloodSugar.addSubview(BloodSugarManagementNotebookView.PostprandialBloodSugarShowLabel)
        
        
        
        BloodSugarManagementNotebookView.PostprandialBloodSugarShowNumLabelNumber = UILabel(frame: CGRect(x: 40, y: BloodSugarManagementNotebookView.PostprandialBloodSugarShowLabel.frame.maxY + 20, width: 50, height: BloodSugarManagementNotebookView.FastingBloodSugar.frame.size.height / 6))
        BloodSugarManagementNotebookView.PostprandialBloodSugarShowNumLabelNumber.text = "120"
        
           BloodSugarManagementNotebookView.PostprandialBloodSugarShowNumLabelNumber.textAlignment = .right
           BloodSugarManagementNotebookView.PostprandialBloodSugarShowNumLabelNumber.font = UIFont.systemFont(ofSize: 30)
        if IS_IPHONE_N_PLUS {
            BloodSugarManagementNotebookView.PostprandialBloodSugarShowNumLabelNumber.font = UIFont.systemFont(ofSize: 23)
        
            BloodSugarManagementNotebookView.PostprandialBloodSugarShowNumLabelNumber.numberOfLines = 0
        }
        if IS_IPHONE_X {
            BloodSugarManagementNotebookView.PostprandialBloodSugarShowNumLabelNumber.font = UIFont.systemFont(ofSize: 23)
        
            BloodSugarManagementNotebookView.PostprandialBloodSugarShowNumLabelNumber.numberOfLines = 0
        }
           BloodSugarManagementNotebookView.PostprandialBloodSugarShowNumLabelNumber.textColor = .white
           BloodSugarManagementNotebookView.PostprandialBloodSugarShowNumLabelNumber.numberOfLines = 0
           BloodSugarManagementNotebookView.PostprandialBloodSugar.addSubview(BloodSugarManagementNotebookView.PostprandialBloodSugarShowNumLabelNumber)
        

  
        
        
        
        BloodSugarManagementNotebookView.PostprandialBloodSugarShowNumLabel = UILabel(frame: CGRect(x: BloodSugarManagementNotebookView.PostprandialBloodSugarShowNumLabelNumber.frame.maxX + 5, y: BloodSugarManagementNotebookView.PostprandialBloodSugarShowLabel.frame.maxY + 20, width: 50, height: BloodSugarManagementNotebookView.PostprandialBloodSugar.frame.size.height / 6))
     BloodSugarManagementNotebookView.PostprandialBloodSugarShowNumLabel.text = "mg/dL\n이하"
        
        BloodSugarManagementNotebookView.PostprandialBloodSugarShowNumLabel.textAlignment = .left
        BloodSugarManagementNotebookView.PostprandialBloodSugarShowNumLabel.font = UIFont.systemFont(ofSize: 14)
        BloodSugarManagementNotebookView.PostprandialBloodSugarShowNumLabel.numberOfLines = 0
        if IS_IPHONE_N_PLUS {
            BloodSugarManagementNotebookView.PostprandialBloodSugarShowNumLabel.font = UIFont.systemFont(ofSize: 12)
        
            BloodSugarManagementNotebookView.PostprandialBloodSugarShowNumLabel.numberOfLines = 0
        }
        if IS_IPHONE_X {
            BloodSugarManagementNotebookView.PostprandialBloodSugarShowNumLabel.font = UIFont.systemFont(ofSize: 12)
        
            BloodSugarManagementNotebookView.PostprandialBloodSugarShowNumLabel.numberOfLines = 0
        }
        BloodSugarManagementNotebookView.PostprandialBloodSugarShowNumLabel.textColor = .white
        BloodSugarManagementNotebookView.PostprandialBloodSugar.addSubview(BloodSugarManagementNotebookView.PostprandialBloodSugarShowNumLabel)
        
        
        
        
        
        BloodSugarManagementNotebookView.PostprandialBloodSugarPercent = UILabel(frame: CGRect(x: BloodSugarManagementNotebookView.PostprandialBloodSugar.frame.maxX - 180, y: 20, width: 130, height: BloodSugarManagementNotebookView.PostprandialBloodSugar.frame.size.height / 4))
        BloodSugarManagementNotebookView.PostprandialBloodSugarPercent.text = "목표 수치\n달성율은?"
        BloodSugarManagementNotebookView.PostprandialBloodSugarPercent.textAlignment = .center
        BloodSugarManagementNotebookView.PostprandialBloodSugarPercent.numberOfLines = 0
        BloodSugarManagementNotebookView.PostprandialBloodSugarPercent.font = UIFont.systemFont(ofSize: 20)
        if IS_IPHONE_N_PLUS {
            BloodSugarManagementNotebookView.PostprandialBloodSugarPercent.font = UIFont.systemFont(ofSize: 16)
        
            BloodSugarManagementNotebookView.PostprandialBloodSugarPercent.numberOfLines = 0
        }
        if IS_IPHONE_X {
            BloodSugarManagementNotebookView.PostprandialBloodSugarPercent.font = UIFont.systemFont(ofSize: 16)
        
            BloodSugarManagementNotebookView.PostprandialBloodSugarPercent.numberOfLines = 0
        }
        BloodSugarManagementNotebookView.PostprandialBloodSugarPercent.textColor = .white
        BloodSugarManagementNotebookView.PostprandialBloodSugar.addSubview(BloodSugarManagementNotebookView.PostprandialBloodSugarPercent)
        
   

        
        
        
        BloodSugarManagementNotebookView.PostprandialBloodSugarGraph = UIView(frame: CGRect(x: BloodSugarManagementNotebookView.PostprandialBloodSugarPercent.frame.minX, y: BloodSugarManagementNotebookView.PostprandialBloodSugarPercent.frame.maxY + 20, width: BloodSugarManagementNotebookView.PostprandialBloodSugar.frame.size.width / 3, height: BloodSugarManagementNotebookView.PostprandialBloodSugar.frame.size.height / 2.2))
        BloodSugarManagementNotebookView.PostprandialBloodSugarGraph.backgroundColor = .clear
//        BloodSugarManagementNotebookView.FastingBloodSugar.layer.borderWidth = 1
//        BloodSugarManagementNotebookView.FastingBloodSugar.layer.cornerRadius = 8
        BloodSugarManagementNotebookView.PostprandialBloodSugar.addSubview(BloodSugarManagementNotebookView.PostprandialBloodSugarGraph)
        
        animate2()
     
       
        BloodSugarManagementNotebookView.GlycatedHemoglobin = UIView(frame: CGRect(x: 20, y: BloodSugarManagementNotebookView.PostprandialBloodSugar.frame.maxY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 4))
        BloodSugarManagementNotebookView.GlycatedHemoglobin.backgroundColor = #colorLiteral(red: 0.4349892437, green: 0.1282797456, blue: 0.8903027177, alpha: 1)
//        BloodSugarManagementNotebookView.FastingBloodSugar.layer.borderWidth = 1
        BloodSugarManagementNotebookView.GlycatedHemoglobin.layer.cornerRadius = 8
        scrollView.addSubview(BloodSugarManagementNotebookView.GlycatedHemoglobin)
        
        
        
        BloodSugarManagementNotebookView.GlycatedHemoglobinLabel = UILabel(frame: CGRect(x: 20, y: 20, width: 140, height: BloodSugarManagementNotebookView.GlycatedHemoglobin.frame.size.height / 4))
        BloodSugarManagementNotebookView.GlycatedHemoglobinLabel.text = "나의 혈압\n목표 수치는?"
        BloodSugarManagementNotebookView.GlycatedHemoglobinLabel.textAlignment = .center
        BloodSugarManagementNotebookView.GlycatedHemoglobinLabel.numberOfLines = 0
        BloodSugarManagementNotebookView.GlycatedHemoglobinLabel.font = UIFont.systemFont(ofSize: 20)
        if IS_IPHONE_N_PLUS {
            BloodSugarManagementNotebookView.GlycatedHemoglobinLabel.font = UIFont.systemFont(ofSize: 16)
        
            BloodSugarManagementNotebookView.GlycatedHemoglobinLabel.numberOfLines = 0
        }
        if IS_IPHONE_X {
            BloodSugarManagementNotebookView.GlycatedHemoglobinLabel.font = UIFont.systemFont(ofSize: 16)
            
            BloodSugarManagementNotebookView.GlycatedHemoglobinLabel.numberOfLines = 0
        }
        BloodSugarManagementNotebookView.GlycatedHemoglobinLabel.textColor = .white
        BloodSugarManagementNotebookView.GlycatedHemoglobin.addSubview(BloodSugarManagementNotebookView.GlycatedHemoglobinLabel)
        
        
    
        
        
        BloodSugarManagementNotebookView.GlycatedHemoglobinShowLabel = UILabel(frame: CGRect(x: 15, y: BloodSugarManagementNotebookView.GlycatedHemoglobinLabel.frame.maxY + 20, width: 150, height: BloodSugarManagementNotebookView.GlycatedHemoglobin.frame.size.height / 6))
     BloodSugarManagementNotebookView.GlycatedHemoglobinShowLabel.text = "당호혈색소\n(HbA1c)"
        BloodSugarManagementNotebookView.GlycatedHemoglobinShowLabel.textAlignment = .center
        BloodSugarManagementNotebookView.GlycatedHemoglobinShowLabel.numberOfLines = 0
        BloodSugarManagementNotebookView.GlycatedHemoglobinShowLabel.font = UIFont.systemFont(ofSize: 14)
        
        if IS_IPHONE_N_PLUS {
            BloodSugarManagementNotebookView.GlycatedHemoglobinShowLabel.font = UIFont.systemFont(ofSize: 11)
            
            BloodSugarManagementNotebookView.GlycatedHemoglobinShowLabel.numberOfLines = 0
        }
        
        if IS_IPHONE_X {
            BloodSugarManagementNotebookView.GlycatedHemoglobinShowLabel.font = UIFont.systemFont(ofSize: 11)
            
            BloodSugarManagementNotebookView.GlycatedHemoglobinShowLabel.numberOfLines = 0
        }
        BloodSugarManagementNotebookView.GlycatedHemoglobinShowLabel.textColor = .white
        BloodSugarManagementNotebookView.GlycatedHemoglobin.addSubview(BloodSugarManagementNotebookView.GlycatedHemoglobinShowLabel)
        
        
        BloodSugarManagementNotebookView.GlycatedHemoglobinShowNumLabelNumber = UILabel(frame: CGRect(x: BloodSugarManagementNotebookView.GlycatedHemoglobin.frame.size.width / 5.8, y: BloodSugarManagementNotebookView.GlycatedHemoglobinShowLabel.frame.maxY + 20, width: 50, height: BloodSugarManagementNotebookView.FastingBloodSugar.frame.size.height / 6))
        BloodSugarManagementNotebookView.GlycatedHemoglobinShowNumLabelNumber.text = "7.0"
        
           BloodSugarManagementNotebookView.GlycatedHemoglobinShowNumLabelNumber.textAlignment = .right
           BloodSugarManagementNotebookView.GlycatedHemoglobinShowNumLabelNumber.font = UIFont.systemFont(ofSize: 30)
        if IS_IPHONE_N_PLUS {
            BloodSugarManagementNotebookView.GlycatedHemoglobinShowNumLabelNumber.font = UIFont.systemFont(ofSize: 23)
        
            BloodSugarManagementNotebookView.GlycatedHemoglobinShowNumLabelNumber.numberOfLines = 0
        }
        if IS_IPHONE_X {
            BloodSugarManagementNotebookView.GlycatedHemoglobinShowNumLabelNumber.font = UIFont.systemFont(ofSize: 23)
        
            BloodSugarManagementNotebookView.GlycatedHemoglobinShowNumLabelNumber.numberOfLines = 0
        }
        
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
        BloodSugarManagementNotebookView.GlycatedHemoglobinPercent.text = "목표 수치\n달성율은?"
        BloodSugarManagementNotebookView.GlycatedHemoglobinPercent.textAlignment = .center
        BloodSugarManagementNotebookView.GlycatedHemoglobinPercent.numberOfLines = 0
        BloodSugarManagementNotebookView.GlycatedHemoglobinPercent.font = UIFont.systemFont(ofSize: 20)
        if IS_IPHONE_N_PLUS {
            BloodSugarManagementNotebookView.GlycatedHemoglobinPercent.font = UIFont.systemFont(ofSize: 16)
        
            BloodSugarManagementNotebookView.GlycatedHemoglobinPercent.numberOfLines = 0
        }
        
        if IS_IPHONE_X {
            BloodSugarManagementNotebookView.GlycatedHemoglobinPercent.font = UIFont.systemFont(ofSize: 16)
        
            BloodSugarManagementNotebookView.GlycatedHemoglobinPercent.numberOfLines = 0
        }
        BloodSugarManagementNotebookView.GlycatedHemoglobinPercent.textColor = .white
        BloodSugarManagementNotebookView.GlycatedHemoglobin.addSubview(BloodSugarManagementNotebookView.GlycatedHemoglobinPercent)
        
        
        
        BloodSugarManagementNotebookView.GlycatedHemoglobinGraph = UIView(frame: CGRect(x: BloodSugarManagementNotebookView.GlycatedHemoglobinPercent.frame.minX, y: BloodSugarManagementNotebookView.PostprandialBloodSugarPercent.frame.maxY + 20, width: BloodSugarManagementNotebookView.GlycatedHemoglobin.frame.size.width / 3, height: BloodSugarManagementNotebookView.GlycatedHemoglobin.frame.size.height / 2.2))
        BloodSugarManagementNotebookView.GlycatedHemoglobinGraph.backgroundColor = .clear
//        BloodSugarManagementNotebookView.FastingBloodSugar.layer.borderWidth = 1
//        BloodSugarManagementNotebookView.FastingBloodSugar.layer.cornerRadius = 8
        BloodSugarManagementNotebookView.GlycatedHemoglobin.addSubview(BloodSugarManagementNotebookView.GlycatedHemoglobinGraph)
        
        
        animate3()
        
        var saveData = UILabel(frame: CGRect(x: 20, y: BloodSugarManagementNotebookView.GlycatedHemoglobin.frame.maxY + 30, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 12))
        saveData.text = "측정하신 혈당을 입력해주세요."
        saveData.font = UIFont.systemFont(ofSize: 22)
        
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
        formatter.dateFormat = "MM dd yyyy a h:mm"
        let formattedDateInString = formatter.string(from: time)

        
        
        BloodSugarManagementNotebookView.dateLable = UILabel(frame: CGRect(x: dateViewLabel.frame.maxX + 100, y: dateViewLabel.frame.minY, width: 200, height: dateView.frame.height))
        BloodSugarManagementNotebookView.dateLable.text = formattedDateInString
        
        
        dateView.addSubview(BloodSugarManagementNotebookView.dateLable)
        
        var eatView = UIView(frame: CGRect(x: 10, y: dateView.frame.maxY, width: saveView.frame.size.width - 20, height: self.view.frame.size.height / 14))
        eatView.backgroundColor = .white
        
        saveView.addSubview(eatView)
        
        var eatVLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 80, height: dateView.frame.height))
        eatVLabel.text = "식사 상태"
        eatView.addSubview(eatVLabel)
        
        var bloodSugarView = UIView(frame: CGRect(x: 10, y: eatView.frame.maxY, width: saveView.frame.size.width - 20, height: self.view.frame.size.height / 14))
        bloodSugarView.backgroundColor = .white
        
        saveView.addSubview(bloodSugarView)
        
        var bloodSugarLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 80, height: dateView.frame.height))
        bloodSugarLabel.text = "혈당"
        bloodSugarView.addSubview(bloodSugarLabel)
        
        bloodSugarTF = UITextField(frame: CGRect(x: bloodSugarLabel.frame.maxX + 80, y: 0, width: bloodSugarLabel.frame.width * 2, height: bloodSugarLabel.frame.height))
        bloodSugarTF.placeholder = "측정치를 적어주세요."
        bloodSugarView.addSubview(bloodSugarTF)
        
        var gyView = UIView(frame: CGRect(x: 10, y: bloodSugarView.frame.maxY, width: saveView.frame.size.width - 20, height: self.view.frame.size.height / 14))
        gyView.backgroundColor = .white
        
        saveView.addSubview(gyView)
        
        var gyLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 80, height: dateView.frame.height))
        gyLabel.text = "당화혈색소"
        gyView.addSubview(gyLabel)
        
        glycatedHemoglobinTF = UITextField(frame: CGRect(x: gyLabel.frame.maxX + 80, y: 0, width: gyLabel.frame.width * 2, height: gyLabel.frame.height))
        glycatedHemoglobinTF.placeholder = "측정치를 적어주세요."
        gyView.addSubview(glycatedHemoglobinTF)
        
        let cancelBTN = UIButton(frame: CGRect(x: 0, y: saveView.frame.maxY + 10, width: self.view.frame.size.width / 2, height: self.view.frame.size.height / 12))
        cancelBTN.setTitle("취소", for: .normal)
        cancelBTN.backgroundColor = #colorLiteral(red: 0.6152173877, green: 0.6653684974, blue: 0.7206344604, alpha: 1)
        scrollView.addSubview(cancelBTN)
        
        let saveBTN = UIButton(frame: CGRect(x: cancelBTN.frame.maxX, y: saveView.frame.maxY + 10, width: self.view.frame.size.width / 2, height: self.view.frame.size.height / 12))
        saveBTN.setTitle("저장", for: .normal)
        saveBTN.backgroundColor = #colorLiteral(red: 0.1400382817, green: 0.3497706652, blue: 0.5862404704, alpha: 1)
        saveBTN.addTarget(self, action: #selector(saveButtonPressed(_ :)), for: .touchUpInside)
        scrollView.addSubview(saveBTN)
        
        
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: menuView.frame.maxY).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: saveBTN.bottomAnchor, constant: 50).isActive = true
        
        
        //--------------
        BloodSugarRecordsView = KSR_2024.BloodSugarRecordsView(frame: CGRect(x: 0, y: scrollView.frame.minY, width: SCREEN.WIDTH, height: scrollView.frame.height))
        BloodSugarRecordsView.backgroundColor = .yellow
        BloodSugarManagementNotebookView.addSubview(BloodSugarRecordsView)
        
        
        
        BloodSugarRecordsView.test = UIView(frame: CGRect(x: 0, y: scrollView.frame.minY, width: 500, height: self.view.frame.height))
        BloodSugarRecordsView.test.backgroundColor = .white
        
//        scrollView.addSubview(BloodSugarRecordsView.test)
        
        BloodSugarWebView.isHidden = true
        BloodSugarManagementNotebookView.isHidden = true
        bloodSugarListView.isHidden = true
        bloodSugarListView.isHidden = false
        
        dataUpdateBloodSugar()
       
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UnderBar = UIView(frame: CGRect(x: button3.center.x, y: naviBar.frame.maxY + 62, width: SCREEN.WIDTH / 8.5, height: 5))
                UnderBar.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                self.view.addSubview(UnderBar)
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


    
    @objc func rightButton2PressedList(_ button: UIButton) {
        self.bloodSugarListView.graphScrollView.isHidden = true
        self.bloodSugarListView.dataScrollView.isHidden = false

        self.bloodSugarListView.dataScrollView.dataUpdate()
    }
    
    @objc func rightButton2PressedGraph(_ button: UIButton) {
        
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
              
            moveSelected(view: UnderBar, button: button1)
                
            })
            BloodSugarWebView.isHidden = false
            BloodSugarManagementNotebookView.isHidden = true
            bloodSugarListView.isHidden = true
            label1.textColor = .black
            label2.textColor = .lightGray
            label3.textColor = .lightGray
            
        } else if sender.tag == 1 {
            UIView.animate(withDuration: 0.5, animations: { [self] in
              
            moveSelected(view: UnderBar, button: button2)
                
            })
            BloodSugarWebView.isHidden = true
            BloodSugarManagementNotebookView.isHidden = false
            bloodSugarListView.isHidden = true
            
            label1.textColor = .lightGray
            label2.textColor = .black
            label3.textColor = .lightGray
            
        } else if sender.tag == 2 {
            UIView.animate(withDuration: 0.5, animations: { [self] in
              
            moveSelected(view: UnderBar, button: button3)
                
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
            toastShow(message: "혈당을 입력해주세요.")
            return
        }
        
        if self.glycatedHemoglobinTF.text == "" {
            toastShow(message: "당화혈색소를 입력해주세요.")
        }
        
//        guard let regNumString = userD.object(forKey: USER_KEY.KSR_REGISTRATION_NUMBER) as? String else {
//            toastShow(message: "reg_num is nil error")
//            return
//        }
        let regNumString = "SB-12500-1"
        
        let val = self.bloodSugarTF.text!
        let hba1c = self.glycatedHemoglobinTF.text!
        
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
              let dateTime = current_date_string
        let sid = "\(UserDefaults.standard.object(forKey: "sid") ?? 0)"
        
        
        
        
        
        
        let sendDataDic = [
//            "reg_num":regNumString,
            "user_sid":sid,
            "value":val,
            "hba1c":hba1c,
            "gubun":"1",
            "year":year,
            "month":month,
            "week":week,
            "dayweek":dayweek,
            "day":day,
            "datetime":dateTime,
            ]
        print("sendDataDic:\n\(sendDataDic)")
        Server.getData(type: Server.InfoType.SUGAR_ADD, otherInfo: sendDataDic) { (kData : Data?) in
            if let data = kData {
                if let dataString : String = String(data: data, encoding: String.Encoding.utf8) {
                    print("dataString:\(dataString)")
                    self.view.endEditing(true)
//                    self.superCon?.segView.itemButtonPressed(button: (self.superCon?.segView.itemButtons[2])!)
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
    
    
    
    
  
    
}
