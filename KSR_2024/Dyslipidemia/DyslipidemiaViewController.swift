//
//  DyslipidemiaViewController.swift
//  KSR_2024
//
//  Created by m2comm on 2024/01/18.
//
//
//import Foundation
//import UIKit
//
//class DyslipidemiaViewController: BaseViewController {
//    
//    var DyslipidemiaWebView : WebView!
//    var DyslipidemiaManagementNotebookView : DyslipidemiaManagementNotebookView!
//    var DyslipidemiaManagementTest : DyslipidemiaManagementTest!
//    
//    var change: UIButton!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        buttons = [button1, button2, button3]
//        
//        self.buttons.forEach {
//            $0.addTarget(self, action: #selector(segButtonPressed(_ :)), for: .touchUpInside)
//        }
//        
//        label1.text = "관리\n도움말"
//        label2.text = "이상지질혈증\n관리수첩"
//        label3.text = "이상지질혈증\n기록보기"
//        
//        self.DyslipidemiaWebView = WebView(frame: CGRect(
//            x: 0,
//            y: menuView.frame.maxY,
//            width: SCREEN.WIDTH,
//            height: SCREEN.HEIGHT - menuView.frame.maxY), urlString: "https://korl.or.kr/workshop/2023fall/app/html/contents/welcome.html")
//        
//        DyslipidemiaManagementNotebookView = KSR_2024.DyslipidemiaManagementNotebookView(frame: CGRect(x: 0, y: scrollView.frame.minY, width: SCREEN.WIDTH, height: scrollView.frame.height))
//        DyslipidemiaManagementNotebookView.backgroundColor = .white
//        scrollView.addSubview(DyslipidemiaManagementNotebookView)
//        
//        self.view.addSubview(self.DyslipidemiaWebView)
//        
//        DyslipidemiaManagementNotebookView.DyslipidemiahVIew = UIView(frame: CGRect(x: 0, y: scrollView.frame.minY, width: self.view.frame.size.width, height: self.view.frame.size.height / 5))
//        DyslipidemiaManagementNotebookView.DyslipidemiahVIew.backgroundColor = #colorLiteral(red: 0.8870372176, green: 0.396627903, blue: 0.2913144231, alpha: 1)
////        BloodSugarManagementNotebookView.FastingBloodSugar.layer.borderWidth = 1
////        ObesityManagementNotebookView.bmiGraphVIew.layer.cornerRadius = 8
//        scrollView.addSubview(DyslipidemiaManagementNotebookView.DyslipidemiahVIew)
//        
//   
//        
//        DyslipidemiaManagementNotebookView.DyslipidemiaVIewLabel = UILabel(frame: CGRect(x: self.view.frame.size.width / 5, y: DyslipidemiaManagementNotebookView.DyslipidemiahVIew.frame.minY + 20, width: self.view.frame.size.width / 3, height: DyslipidemiaManagementNotebookView.DyslipidemiahVIew.frame.size.height / 4))
//        DyslipidemiaManagementNotebookView.DyslipidemiaVIewLabel.text = "나의 콜레스테롤\n  목표 수치는?"
//        DyslipidemiaManagementNotebookView.DyslipidemiaVIewLabel.numberOfLines = 0
//        DyslipidemiaManagementNotebookView.DyslipidemiaVIewLabel.textColor = .white
//        DyslipidemiaManagementNotebookView.DyslipidemiaVIewLabel.font = UIFont.systemFont(ofSize: 17)
//
//        DyslipidemiaManagementNotebookView.DyslipidemiahVIew.addSubview(DyslipidemiaManagementNotebookView.DyslipidemiaVIewLabel)
//
//        DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowNumLabel = UILabel(frame: CGRect(x: self.view.frame.size.width / 5.4, y: DyslipidemiaManagementNotebookView.DyslipidemiaVIewLabel.frame.maxY + 2, width: self.view.frame.size.width / 2, height: DyslipidemiaManagementNotebookView.DyslipidemiahVIew.frame.size.height / 3))
//        DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowNumLabel.text = " 120mg/dL"
//        DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowNumLabel.textColor = .white
//        DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowNumLabel.font = UIFont.systemFont(ofSize: 25)
//
//        DyslipidemiaManagementNotebookView.DyslipidemiahVIew.addSubview(DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowNumLabel)
//
//        DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowLabel = UILabel(frame: CGRect(x: DyslipidemiaManagementNotebookView.DyslipidemiaVIewLabel.frame.maxX + 5, y: DyslipidemiaManagementNotebookView.DyslipidemiahVIew.frame.minY, width: self.view.frame.size.width / 2.5, height: DyslipidemiaManagementNotebookView.DyslipidemiahVIew.frame.size.height / 2))
//        DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowLabel.text = "목표 수치 달성율은?"
//        DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowLabel.textColor = .white
//        DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowLabel.font = UIFont.systemFont(ofSize: 17)
//
//        DyslipidemiaManagementNotebookView.DyslipidemiahVIew.addSubview(DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowLabel)
////
//
//        DyslipidemiaManagementNotebookView.DyslipidemiaVIewGraph = UIView(frame: CGRect(x: DyslipidemiaManagementNotebookView.DyslipidemiaVIewLabel.frame.maxX + 5, y: DyslipidemiaManagementNotebookView.DyslipidemiaVIewLabel.frame.maxY + 1, width: self.view.frame.size.width / 2.8, height: DyslipidemiaManagementNotebookView.DyslipidemiahVIew.frame.size.height / 2))
//        DyslipidemiaManagementNotebookView.DyslipidemiaVIewGraph.backgroundColor = .white
//
//        DyslipidemiaManagementNotebookView.DyslipidemiahVIew.addSubview(DyslipidemiaManagementNotebookView.DyslipidemiaVIewGraph)
//        
//        DyslipidemiaManagementNotebookView.DyslipidemiaVIewBTN = UIButton(frame: CGRect(x: DyslipidemiaManagementNotebookView.DyslipidemiaVIewLabel.frame.minX, y: DyslipidemiaManagementNotebookView.DyslipidemiaVIewShowNumLabel.frame.maxY + 2, width: self.view.frame.size.width / 3, height: DyslipidemiaManagementNotebookView.DyslipidemiahVIew.frame.size.height / 5))
//        DyslipidemiaManagementNotebookView.DyslipidemiaVIewBTN.setTitle("나의 목표 수정", for: .normal)
//        DyslipidemiaManagementNotebookView.DyslipidemiaVIewBTN.layer.borderWidth = 1
//        DyslipidemiaManagementNotebookView.DyslipidemiaVIewBTN.layer.cornerRadius = 8
//        
//        DyslipidemiaManagementNotebookView.DyslipidemiahVIew.addSubview(DyslipidemiaManagementNotebookView.DyslipidemiaVIewBTN)
//        
//        var saveData = UILabel(frame: CGRect(x: 20, y: DyslipidemiaManagementNotebookView.DyslipidemiahVIew.frame.maxY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 12))
//        saveData.text = "혈중 지질 수치를 입력해주세요."
//        saveData.font = UIFont.systemFont(ofSize: 18)
//        
//        scrollView.addSubview(saveData)
//        
//        var saveView: UIView!
//        
////        var afterBTN: UIButton!
////        var beforeBTN: UIButton!
////        var bloodTF: UITextField!
////        var glycated: UITextField!
//        
//        saveView = UIView(frame: CGRect(x: 20, y: saveData.frame.maxY + 10, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 2.5))
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
//        DyslipidemiaManagementNotebookView.dateLable = UILabel(frame: CGRect(x: dateViewLabel.frame.maxX + 130, y: dateViewLabel.frame.minY, width: 200, height: dateView.frame.height))
//        DyslipidemiaManagementNotebookView.dateLable.text = formattedDateInString
//        
//        
//        dateView.addSubview(DyslipidemiaManagementNotebookView.dateLable)
//        
//        var mycholesterolView = UIView(frame: CGRect(x: 10, y: dateView.frame.maxY, width: saveView.frame.size.width - 20, height: self.view.frame.size.height / 14))
//        mycholesterolView.backgroundColor = .white
//        
//        saveView.addSubview(mycholesterolView)
//        
//        var mycholesterolViewLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 80, height: dateView.frame.height))
//        mycholesterolViewLabel.text = "총 콜레스테롤"
//        mycholesterolView.addSubview(mycholesterolViewLabel)
//        
//        var myHdlCholesterolView = UIView(frame: CGRect(x: 10, y: mycholesterolView.frame.maxY, width: saveView.frame.size.width - 20, height: self.view.frame.size.height / 14))
//        myHdlCholesterolView.backgroundColor = .white
//        
//        saveView.addSubview(myHdlCholesterolView)
//        
//        var myHdlCholesterolViewLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 80, height: dateView.frame.height))
//        myHdlCholesterolViewLabel.text = "HDL콜레스테롤"
//        myHdlCholesterolView.addSubview(myHdlCholesterolViewLabel)
//        
//        var myLdlCholesterolView = UIView(frame: CGRect(x: 10, y: myHdlCholesterolView.frame.maxY, width: saveView.frame.size.width - 20, height: self.view.frame.size.height / 14))
//        myLdlCholesterolView.backgroundColor = .white
//        
//        saveView.addSubview(myLdlCholesterolView)
//        
//        var myLdlCholesterolViewLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 80, height: dateView.frame.height))
//        myLdlCholesterolViewLabel.text = "HDL콜레스테롤"
//        myLdlCholesterolView.addSubview(myLdlCholesterolViewLabel)
//        
//        var myneutralFatlView = UIView(frame: CGRect(x: 10, y: myLdlCholesterolView.frame.maxY, width: saveView.frame.size.width - 20, height: self.view.frame.size.height / 14))
//        myLdlCholesterolView.backgroundColor = .white
//        
//
//        saveView.addSubview(myneutralFatlView)
//        
//        var myneutralFatlViewLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 80, height: dateView.frame.height))
//        myneutralFatlViewLabel.text = "중성지방"
//        myneutralFatlView.addSubview(myneutralFatlViewLabel)
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
//        self.DyslipidemiaManagementTest = KSR_2024.DyslipidemiaManagementTest(frame: CGRect(
//            x: 0,
//            y: menuView.frame.maxY,
//            width: SCREEN.WIDTH,
//            height: SCREEN.HEIGHT - menuView.frame.maxY))
//        self.view.addSubview(self.DyslipidemiaManagementTest)
//        
//        
//        
//    }
//    
//    @objc func segButtonPressed(_ sender: UIButton) {
//print("tab")
//        self.view.endEditing(true)
//        
//        if sender.tag == 0 {
//            DyslipidemiaWebView.isHidden = false
//            DyslipidemiaManagementNotebookView.isHidden = true
//            DyslipidemiaManagementTest.isHidden = true
//        } else if sender.tag == 1 {
//            DyslipidemiaWebView.isHidden = true
//            DyslipidemiaManagementNotebookView.isHidden = false
//            DyslipidemiaManagementTest.isHidden = true
//        } else if sender.tag == 2 {
//            DyslipidemiaWebView.isHidden = true
//            DyslipidemiaManagementNotebookView.isHidden = true
//            DyslipidemiaManagementTest.isHidden = false
//        }
//    }
//}
