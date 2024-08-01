//
//   MedicationManagementViewController3.swift
//  KSR_2024
//
//  Created by m2comm on 2024/01/29.
//

//
//   MedicationManagementViewController.swift
//  KSR_2024
//
//  Created by m2comm on 2024/01/19.
//

import Foundation
import UIKit

class   MedicationManagementViewController3: BaseViewController, RegisterdDrugListTopViewDelegate {
    
    var MedicationManagementWebView : WebView!
    var MedicationManagementNotebookView : MedicationManagementNotebookView!
//    var BloodSugarRecordsView : BloodSugarRecordsView!
    
    var drugManagerView: DrugManageView!
    
    
    var delegate : RegisterdDrugListTopViewDelegate?
    
    
    var registerdDrugListView : RegisterdDrugListView3!
    
    var drugManagementVC : DrugManagementViewController?
    
//    var test: DrugManageView!
    
    var underNumLabel: UILabel!
    
    var UnderBar: UIView!
    var titleName: UILabel!
    
    var bu: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let panGestureRecongnizer = UIPanGestureRecognizer(target: self, action: #selector(panAction(_ :)))
//        panGestureRecongnizer.delegate = self
////        self.view.addGestureRecognizer(panGestureRecongnizer)
//        scrollView.addGestureRecognizer(panGestureRecongnizer)
        
//        UnderBar = UIView(frame: CGRect(x: button3.center.x, y: naviBar.frame.maxY + 62, width: SCREEN.WIDTH / 8.8, height: 5))
//        UnderBar.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
//        
//        self.view.addSubview(UnderBar)
    
        
        hideKeyboardWhenTappedAround()
        
        buttons = [button1, button2, button3]
        
        self.buttons.forEach {
            $0.addTarget(self, action: #selector(segButtonPressed(_ :)), for: .touchUpInside)
        }
        
//        titleName = UILabel(frame: CGRect(x: self.view.frame.size.width / 2.6, y: 0, width: 150, height: naviBar.frame.height))
////        titleName.text = titleLabel
//        
//        titleName.text = "약물복용 관리"
//        titleName.font = UIFont(name: "SUITE-Regular", size: 20)
//        
//        naviBar.addSubview(titleName)
//        
//     
//        label1.text = "약물복용\n도움말"
//        label2.text = "약물\n복용관리"
//        label3.text = "약물\n등록리스트"
//        
//        self.MedicationManagementWebView = WebView(frame: CGRect(
//            x: 0,
//            y: menuView.frame.maxY,
//            width: SCREEN.WIDTH,
//            height: SCREEN.HEIGHT - menuView.frame.maxY), urlString: "http://ksrapp.m2comm.co.kr/php/info/info04_3a.php")
//        
//        MedicationManagementNotebookView = KSR_2024.MedicationManagementNotebookView(frame: CGRect(x: 0, y: scrollView.frame.minY, width: SCREEN.WIDTH, height: scrollView.frame.height))
//        MedicationManagementNotebookView.backgroundColor = .white
//        scrollView.addSubview(MedicationManagementNotebookView)
//        scrollView.backgroundColor = #colorLiteral(red: 0.1356676817, green: 0.7028286457, blue: 0.8024563789, alpha: 1)
//        
//        self.view.addSubview(self.MedicationManagementWebView)
//        
//        
//        self.registerdDrugListView = RegisterdDrugListView(frame: CGRect(
//            x: 0,
//            y: menuView.frame.maxY,
//            width: SCREEN.WIDTH,
//            height: SCREEN.HEIGHT - menuView.frame.maxY - SAFE_AREA + 150))
////        self.registerdDrugListView.topView.delegate = self
////        self.registerdDrugListView.drugManagementVC = self
//        self.view.addSubview(self.registerdDrugListView)
//        
//        baseUnderBar.frame.origin = CGPoint(x: self.view.frame.size.width / 1.265, y: button3.frame.size.height - 2)
//        
//        MedicationManagementNotebookView.MedicationManagementView = UIView(frame: CGRect(x: 0, y: scrollView.frame.minY, width: self.view.frame.size.width, height: self.view.frame.size.height))
//        MedicationManagementNotebookView.MedicationManagementView.backgroundColor = #colorLiteral(red: 0.1356676817, green: 0.7028286457, blue: 0.8024563789, alpha: 1)
////        BloodSugarManagementNotebookView.FastingBloodSugar.layer.borderWidth = 1
////        ObesityManagementNotebookView.bmiGraphVIew.layer.cornerRadius = 8
//        scrollView.addSubview(MedicationManagementNotebookView.MedicationManagementView)
//        
//        
//    
//        
//        MedicationManagementNotebookView.MedicationManagementViewIcon = UIImageView(frame: CGRect(x: self.view.frame.size.width / 2.3, y: 5, width: 50, height: 50))
////        MedicationManagementNotebookView.MedicationManagementViewIcon.image = UIImage(named: "eat")
//        
//        scrollView.addSubview(MedicationManagementNotebookView.MedicationManagementViewIcon)
//        
//        
//        MedicationManagementNotebookView.MedicationManagementViewHowNum = UILabel(frame: CGRect(x: 20, y: MedicationManagementNotebookView.MedicationManagementViewIcon.frame.maxY + 5, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 13))
////        MedicationManagementNotebookView.MedicationManagementViewHowNum.text = "한 달간 복약 0%를 달성하렸습니다."
//        MedicationManagementNotebookView.MedicationManagementViewHowNum.textAlignment = .center
//        MedicationManagementNotebookView.MedicationManagementViewHowNum.font = UIFont(name: "SUITE-Regular", size: 22)
//        MedicationManagementNotebookView.MedicationManagementViewHowNum.textColor = .white
////        MedicationManagementNotebookView.MedicationManagementViewHowNum.font = UIFont.systemFont(ofSize: 22)
////        MedicationManagementNotebookView.MedicationManagementViewHowNum.layer.borderWidth = 1
//        
////        scrollView.addSubview(MedicationManagementNotebookView.MedicationManagementViewHowNum)
//        
//        
//        var underNumLabel = UILabel(frame: CGRect(x: 20, y: MedicationManagementNotebookView.MedicationManagementViewHowNum.frame.maxY + 5, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 12))
////        underNumLabel.text = "성공적인 치료를 위해서는\n 꾸준한 약물 복용이 중요합니다."
//        underNumLabel.numberOfLines = 0
//        underNumLabel.textAlignment = .center
////        underNumLabel.layer.borderWidth = 1
//        underNumLabel.font = UIFont(name: "SUITE-Regular", size: 15)
//        underNumLabel.textColor = .white
//        underNumLabel.font = UIFont.systemFont(ofSize: 15)
//        
//        scrollView.addSubview(underNumLabel)
//        
//        
//        
//        MedicationManagementNotebookView.MedicationManagementBTN = UIButton(frame: CGRect(x: 80, y: underNumLabel.frame.maxY - 60, width: self.view.frame.size.width - 160, height: self.view.frame.size.height / 13))
//        MedicationManagementNotebookView.MedicationManagementBTN.setTitle("        복약 알림 설정", for: .normal)
//        MedicationManagementNotebookView.MedicationManagementBTN.setTitleColor(.white, for: .normal)
//        
//    
//        var plView = UIImageView()
//    
////        var plView = UIImageView()
//        
////        MedicationManagementNotebookView.MedicationManagementBTN.setImage(UIImage(named: "plust"), for: .normal)
//        if IS_IPHONE_N_PLUS {
//            plView = UIImageView(frame: CGRect(x: MedicationManagementNotebookView.MedicationManagementBTN.frame.size.width / 3.7, y: 17, width: 20, height: 20))
//        } else if IS_IPHONE_X {
//            plView = UIImageView(frame: CGRect(x: MedicationManagementNotebookView.MedicationManagementBTN.frame.size.width / 4.3, y: 20, width: 20, height: 20))
//        } else if IS_IPHONE_N {
//            plView = UIImageView(frame: CGRect(x: MedicationManagementNotebookView.MedicationManagementBTN.frame.size.width / 4.1, y: 18, width: 15, height: 15))
//        } else {
//            plView = UIImageView(frame: CGRect(x: MedicationManagementNotebookView.MedicationManagementBTN.frame.size.width / 3.7, y: 25, width: 20, height: 20))
//        }
//        
//        MedicationManagementNotebookView.MedicationManagementBTN.addSubview(plView)
//        
//        var imagePl = UIImage()
//        imagePl = UIImage(named: "plust")!
//        
//        plView.image = imagePl
//
//        
////        MedicationManagementNotebookView.MedicationManagementBTN.setImage(UIImage(named: "plust"), for: .normal)
//    
//        
//        MedicationManagementNotebookView.MedicationManagementBTN.imageEdgeInsets = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
//        
//        
//        MedicationManagementNotebookView.MedicationManagementBTN.backgroundColor = #colorLiteral(red: 0.09446402639, green: 0.4838455915, blue: 0.5657636523, alpha: 1)
////        MedicationManagementNotebookView.MedicationManagementBTN.layer.borderWidth = 1
//        MedicationManagementNotebookView.MedicationManagementBTN.layer.cornerRadius = 8
//        
//        
//        
//        
//        MedicationManagementNotebookView.MedicationManagementBTN.addTarget(self, action: #selector(addButtonPressed(button: )), for: .touchUpInside)
//        
//        scrollView.addSubview(MedicationManagementNotebookView.MedicationManagementBTN)
//        
//        drugManagerView = DrugManageView(frame: CGRect(x: 0, y: MedicationManagementNotebookView.MedicationManagementBTN.frame.maxY - 20, width: SCREEN.WIDTH, height: 700))
//        drugManagerView.backgroundColor = .clear
//        MedicationManagementNotebookView.MedicationManagementView.addSubview(drugManagerView)
//        
//        
//        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: menuView.frame.maxY).isActive = true
//        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
////        scrollView.bottomAnchor.constraint(equalTo: MedicationManagementNotebookView.MedicationManagementView.bottomAnchor, constant: 50).isActive = true
//        if IS_IPHONE_N_PLUS {
//            scrollView.bottomAnchor.constraint(equalTo: MedicationManagementNotebookView.MedicationManagementView.bottomAnchor, constant: 250).isActive = true
//        } else {
//            scrollView.bottomAnchor.constraint(equalTo: MedicationManagementNotebookView.MedicationManagementView.bottomAnchor, constant: 150).isActive = true
//        }
//        
//        
//        bu = UIButton(frame: CGRect(x: 80, y: underNumLabel.frame.maxY - 50, width: self.view.frame.size.width - 160, height: 40))
//        
//        bu.setTitle("        복약 알림 설정", for: .normal)
//        bu.setTitleColor(.white, for: .normal)
//        bu.backgroundColor = #colorLiteral(red: 0.09397112578, green: 0.4878631234, blue: 0.5656062961, alpha: 1)
//        bu.layer.cornerRadius = 8
//        bu.addTarget(self, action: #selector(addButtonPressed(button: )), for: .touchUpInside)
////        registerdDrugListView.addSubview(bu)
//        var plView2 = UIImageView()
//        
////        var plView = UIImageView()
//        
////        MedicationManagementNotebookView.MedicationManagementBTN.setImage(UIImage(named: "plust"), for: .normal)
//        if IS_IPHONE_N_PLUS {
//            plView2 = UIImageView(frame: CGRect(x: bu.frame.size.width / 3.7, y: 8, width: 20, height: 20))
//        } else if IS_IPHONE_X {
//            plView2 = UIImageView(frame: CGRect(x: bu.frame.size.width / 4.3, y: 8, width: 20, height: 20))
//        } else if IS_IPHONE_N {
//            plView2 = UIImageView(frame: CGRect(x: bu.frame.size.width / 4.1, y: 8, width: 15, height: 15))
//        } else {
//            plView2 = UIImageView(frame: CGRect(x: bu.frame.size.width / 3.7, y: 8, width: 20, height: 20))
//        }
//        
//        bu.addSubview(plView2)
//        
//        var imagePl2 = UIImage()
//        imagePl2 = UIImage(named: "plust")!
//        
//        plView2.image = imagePl2
//        
//        
//        registerdDrugListView.addSubview(bu)
        
        titleName = UILabel(frame: CGRect(x: self.view.frame.size.width / 2.6, y: 0, width: 150, height: naviBar.frame.height))
//        titleName.text = titleLabel
        
        titleName.text = "약물복용 관리"
        titleName.textColor = .white
        titleName.font = UIFont(name: "SUITE-Regular", size: 20)
        
        naviBar.addSubview(titleName)
     
        label1.text = "약물복용\n도움말"
        label2.text = "약물\n복용관리"
        label3.text = "약물\n등록리스트"
        
        baseUnderBar.frame.origin = CGPoint(x: self.view.frame.size.width / 1.265, y: button3.frame.size.height - 2)
        
//        self.MedicationManagementWebView = WebView(frame: CGRect(
//            x: 0,
//            y: menuView.frame.maxY,
//            width: SCREEN.WIDTH,
//            height: SCREEN.HEIGHT - menuView.frame.maxY), urlString: "http://ksrapp.m2comm.co.kr/php/info/info04_3a.php")
//        
//        MedicationManagementNotebookView = KSR_2024.MedicationManagementNotebookView(frame: CGRect(x: 0, y: scrollView.frame.minY, width: SCREEN.WIDTH, height: scrollView.frame.height))
//        MedicationManagementNotebookView.backgroundColor = .white
//        scrollView.addSubview(MedicationManagementNotebookView)
//        scrollView.backgroundColor = #colorLiteral(red: 0.1356676817, green: 0.7028286457, blue: 0.8024563789, alpha: 1)
//        
//        self.view.addSubview(self.MedicationManagementWebView)
//        
//        
//        self.registerdDrugListView = RegisterdDrugListView(frame: CGRect(
//            x: 0,
//            y: menuView.frame.maxY,
//            width: SCREEN.WIDTH,
//            height: SCREEN.HEIGHT))
////            height: SCREEN.HEIGHT - menuView.frame.maxY - SAFE_AREA + 150))
////        self.registerdDrugListView.topView.delegate = self
////        self.registerdDrugListView.drugManagementVC = self
//        self.view.addSubview(self.registerdDrugListView)
//        
//        baseUnderBar.frame.origin = CGPoint(x: self.view.frame.size.width / 1.265, y: button3.frame.size.height - 2)
//        
//        MedicationManagementNotebookView.MedicationManagementView = UIView(frame: CGRect(x: 0, y: scrollView.frame.minY, width: self.view.frame.size.width, height: self.view.frame.size.height))
////        MedicationManagementNotebookView.MedicationManagementView.backgroundColor = #colorLiteral(red: 0.1356676817, green: 0.7028286457, blue: 0.8024563789, alpha: 1)
//        MedicationManagementNotebookView.MedicationManagementView.setGradient2(color1: UIColor(red: 35.0 / 255.0, green: 207.0 / 255.0, blue: 193.0 / 255.0, alpha: 1), color2: UIColor(red: 35.0 / 255.0, green: 173.0 / 255.0, blue: 207 / 255.0, alpha: 1))
////        BloodSugarManagementNotebookView.FastingBloodSugar.layer.borderWidth = 1
////        ObesityManagementNotebookView.bmiGraphVIew.layer.cornerRadius = 8
//        scrollView.addSubview(MedicationManagementNotebookView.MedicationManagementView)
//        
//        
//    
//        
//        MedicationManagementNotebookView.MedicationManagementViewIcon = UIImageView(frame: CGRect(x: self.view.frame.size.width / 2.3, y: 30, width: 50, height: 50))
//        MedicationManagementNotebookView.MedicationManagementViewIcon.image = UIImage(named: "eat")
//        
////        scrollView.addSubview(MedicationManagementNotebookView.MedicationManagementViewIcon)
//        
//        
//        MedicationManagementNotebookView.MedicationManagementViewHowNum = UILabel(frame: CGRect(x: 20, y: MedicationManagementNotebookView.MedicationManagementViewIcon.frame.maxY + 5, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 13))
////        MedicationManagementNotebookView.MedicationManagementViewHowNum.text = "한 달간 복약 0%를 달성하였습니다."
////        MedicationManagementNotebookView.MedicationManagementViewHowNum.backgroundColor = .clear
//                
//        
//        
//        
////        if (UserDefaults.standard.string(forKey: "at") != "") {
////            MedicationManagementNotebookView.MedicationManagementViewHowNum.text = UserDefaults.standard.string(forKey: "at")
////        } else {
////            MedicationManagementNotebookView.MedicationManagementViewHowNum.text = UserDefaults.standard.string(forKey: "at")
////        }
//        
//
//        
//        
//        
//        
//        
//        MedicationManagementNotebookView.MedicationManagementViewHowNum.textAlignment = .center
//        MedicationManagementNotebookView.MedicationManagementViewHowNum.font = UIFont(name: "SUITE-Regular", size: 22)
//        MedicationManagementNotebookView.MedicationManagementViewHowNum.textColor = .white
////        MedicationManagementNotebookView.MedicationManagementViewHowNum.font = UIFont.systemFont(ofSize: 22)
////        MedicationManagementNotebookView.MedicationManagementViewHowNum.layer.borderWidth = 1
//        MedicationManagementNotebookView.MedicationManagementViewHowNum.numberOfLines = 0
//        scrollView.addSubview(MedicationManagementNotebookView.MedicationManagementViewHowNum)
//        
////        self.labelStringUpdate3(valueString: "0%")
//        
//        
//       
//        
//        
//        
////        self.labelStringUpdate(valueString: "0%")
//        
//        UserDefaults.standard.set(MedicationManagementNotebookView.MedicationManagementViewHowNum.text, forKey: "test")
//        print("test---->\(UserDefaults.standard.string(forKey: "test"))")
////        print("test---->\(self.labelStringUpdate(valueString: "0%"))")
//        
//        underNumLabel = UILabel(frame: CGRect(x: 20, y: MedicationManagementNotebookView.MedicationManagementViewHowNum.frame.maxY + 5, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 12))
////        underNumLabel.text = "성공적인 치료를 위해서는\n 꾸준한 약물 복용이 중요합니다."
//        underNumLabel.numberOfLines = 0
//        underNumLabel.textAlignment = .center
////        underNumLabel.layer.borderWidth = 1
//        underNumLabel.font = UIFont(name: "SUITE-Regular", size: 15)
//        underNumLabel.textColor = .white
//        underNumLabel.font = UIFont.systemFont(ofSize: 15)
//        
//        scrollView.addSubview(underNumLabel)
//        
//        
//        if IS_IPHONE_N {
//            MedicationManagementNotebookView.MedicationManagementBTN = UIButton(frame: CGRect(x: 80, y: underNumLabel.frame.maxY - 50, width: self.view.frame.size.width - 160, height: self.view.frame.size.height / 16.5))
//        } else {
//            MedicationManagementNotebookView.MedicationManagementBTN = UIButton(frame: CGRect(x: 80, y: underNumLabel.frame.maxY - 60, width: self.view.frame.size.width - 160, height: self.view.frame.size.height / 16.5))
//        }
//        MedicationManagementNotebookView.MedicationManagementBTN.setTitle("        복약 알림 설정", for: .normal)
//        MedicationManagementNotebookView.MedicationManagementBTN.setTitleColor(.white, for: .normal)
//        
//        
//        var plView = UIImageView()
//        
////        MedicationManagementNotebookView.MedicationManagementBTN.setImage(UIImage(named: "plust"), for: .normal)
//        if IS_IPHONE_N_PLUS {
//            plView = UIImageView(frame: CGRect(x: MedicationManagementNotebookView.MedicationManagementBTN.frame.size.width / 3.7, y: 11, width: 20, height: 20))
//        } else if IS_IPHONE_X {
//            plView = UIImageView(frame: CGRect(x: MedicationManagementNotebookView.MedicationManagementBTN.frame.size.width / 4.3, y: 20, width: 20, height: 20))
//        } else if IS_IPHONE_N {
//            plView = UIImageView(frame: CGRect(x: MedicationManagementNotebookView.MedicationManagementBTN.frame.size.width / 4.1, y: 15, width: 15, height: 15))
//        } else if IS_IPHONE_12PRO_MAX {
//            plView = UIImageView(frame: CGRect(x: MedicationManagementNotebookView.MedicationManagementBTN.frame.size.width / 3.7, y: 18, width: 20, height: 20))
//        } else if IS_IPHONE_15PRO_MAX {
//            plView = UIImageView(frame: CGRect(x: MedicationManagementNotebookView.MedicationManagementBTN.frame.size.width / 3.7, y: 18, width: 20, height: 20))
//        } else if IS_IPHONE_12PRO {
//            plView = UIImageView(frame: CGRect(x: MedicationManagementNotebookView.MedicationManagementBTN.frame.size.width / 3.7, y: 17, width: 17, height: 17))
//        } else if IS_IPHONE_15PRO {
//            plView = UIImageView(frame: CGRect(x: MedicationManagementNotebookView.MedicationManagementBTN.frame.size.width / 3.7, y: 17, width: 17, height: 17))
//        } else {
//            plView = UIImageView(frame: CGRect(x: MedicationManagementNotebookView.MedicationManagementBTN.frame.size.width / 3.7, y: 25, width: 20, height: 20))
//        }
//        
//        MedicationManagementNotebookView.MedicationManagementBTN.addSubview(plView)
//        
//        var imagePl = UIImage()
//        imagePl = UIImage(named: "plust")!
//        
//        plView.image = imagePl
//
//        
//        
//        
//        
//        
//        MedicationManagementNotebookView.MedicationManagementBTN.contentMode = .scaleAspectFill
//        
//        
//        
//        MedicationManagementNotebookView.MedicationManagementBTN.imageEdgeInsets = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
//        
//        
//        MedicationManagementNotebookView.MedicationManagementBTN.backgroundColor = #colorLiteral(red: 0.09446402639, green: 0.4838455915, blue: 0.5657636523, alpha: 1)
////        MedicationManagementNotebookView.MedicationManagementBTN.layer.borderWidth = 1
//        MedicationManagementNotebookView.MedicationManagementBTN.layer.cornerRadius = 8
//        
//        
//        
//        
//        MedicationManagementNotebookView.MedicationManagementBTN.addTarget(self, action: #selector(addButtonPressed(button: )), for: .touchUpInside)
//        
//        
//        scrollView.addSubview(MedicationManagementNotebookView.MedicationManagementBTN)
//          
//          
//          drugManagerView = DrugManageView(frame: CGRect(x: 0, y: 0, width: SCREEN.WIDTH, height: 1200))
//          
//  //         한 달간 0%
//          drugManagerView.backgroundColor = .clear
//          
//
//          
//          
//          MedicationManagementNotebookView.MedicationManagementView.addSubview(drugManagerView)
//          
//          
//          
//          drugManagerView.addSubview(MedicationManagementNotebookView.MedicationManagementBTN)
//        
////        scrollView.addSubview(MedicationManagementNotebookView.MedicationManagementBTN)
//        
//        drugManagerView = DrugManageView(frame: CGRect(x: 0, y: MedicationManagementNotebookView.MedicationManagementBTN.frame.maxY - 20, width: SCREEN.WIDTH, height: 700))
//        drugManagerView.backgroundColor = .clear
//        
//        
//        
//        
////        MedicationManagementNotebookView.MedicationManagementBTN = UIButton(frame: CGRect(x: 80, y: underNumLabel.frame.maxY - 60, width: self.view.frame.size.width - 160, height: self.view.frame.size.height / 16.5))
////        MedicationManagementNotebookView.MedicationManagementBTN.setTitle("        복약 알림 설정", for: .normal)
////        MedicationManagementNotebookView.MedicationManagementBTN.setTitleColor(.white, for: .normal)
////        
////    
////        var plView = UIImageView()
////        
//////        MedicationManagementNotebookView.MedicationManagementBTN.setImage(UIImage(named: "plust"), for: .normal)
////        if IS_IPHONE_N_PLUS {
////            plView = UIImageView(frame: CGRect(x: MedicationManagementNotebookView.MedicationManagementBTN.frame.size.width / 3.7, y: 17, width: 20, height: 20))
////        } else if IS_IPHONE_X {
////            plView = UIImageView(frame: CGRect(x: MedicationManagementNotebookView.MedicationManagementBTN.frame.size.width / 4.3, y: 20, width: 20, height: 20))
////        } else if IS_IPHONE_N {
////            plView = UIImageView(frame: CGRect(x: MedicationManagementNotebookView.MedicationManagementBTN.frame.size.width / 4.1, y: 18, width: 15, height: 15))
////        } else {
////            plView = UIImageView(frame: CGRect(x: MedicationManagementNotebookView.MedicationManagementBTN.frame.size.width / 3.7, y: 25, width: 20, height: 20))
////        }
////        
////        MedicationManagementNotebookView.MedicationManagementBTN.addSubview(plView)
////        
////        var imagePl = UIImage()
////        imagePl = UIImage(named: "plust")!
////        
////        plView.image = imagePl
////
////        
////        
////        
////        
////        
////        MedicationManagementNotebookView.MedicationManagementBTN.contentMode = .scaleAspectFill
////        
////        
////        
////        MedicationManagementNotebookView.MedicationManagementBTN.imageEdgeInsets = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
////        
////        
////        MedicationManagementNotebookView.MedicationManagementBTN.backgroundColor = #colorLiteral(red: 0.09446402639, green: 0.4838455915, blue: 0.5657636523, alpha: 1)
//////        MedicationManagementNotebookView.MedicationManagementBTN.layer.borderWidth = 1
////        MedicationManagementNotebookView.MedicationManagementBTN.layer.cornerRadius = 8
////        
////        
////        
////        
////        MedicationManagementNotebookView.MedicationManagementBTN.addTarget(self, action: #selector(addButtonPressed(button: )), for: .touchUpInside)
////        
////        
////        
////        
////        scrollView.addSubview(MedicationManagementNotebookView.MedicationManagementBTN)
////        
////        drugManagerView = DrugManageView(frame: CGRect(x: 0, y: MedicationManagementNotebookView.MedicationManagementBTN.frame.maxY - 20, width: SCREEN.WIDTH, height: 700))
////        drugManagerView.backgroundColor = .clear
//        
//
//        
//        
//        MedicationManagementNotebookView.MedicationManagementView.addSubview(drugManagerView)
//        
//        
//        
//        
//        
//        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: menuView.frame.maxY).isActive = true
//        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//        if IS_IPHONE_N_PLUS {
//            scrollView.bottomAnchor.constraint(equalTo: MedicationManagementNotebookView.MedicationManagementView.bottomAnchor, constant: 250).isActive = true
//        } else {
//            scrollView.bottomAnchor.constraint(equalTo: MedicationManagementNotebookView.MedicationManagementView.bottomAnchor, constant: 150).isActive = true
//        }
//        
//        
//        
//        
//       
//        
//        
//        bu = UIButton(frame: CGRect(x: 80, y: underNumLabel.frame.maxY - 50, width: self.view.frame.size.width - 160, height: 55))
//        
//        bu.setTitle("        복약 알림 설정", for: .normal)
//        bu.setTitleColor(.white, for: .normal)
//        bu.backgroundColor = #colorLiteral(red: 0.09397112578, green: 0.4878631234, blue: 0.5656062961, alpha: 1)
//        bu.layer.cornerRadius = 8
//        bu.addTarget(self, action: #selector(addButtonPressed(button: )), for: .touchUpInside)
////        registerdDrugListView.addSubview(bu)
//        var plView2 = UIImageView()
//        
////        var plView = UIImageView()
//        
////        MedicationManagementNotebookView.MedicationManagementBTN.setImage(UIImage(named: "plust"), for: .normal)
//        if IS_IPHONE_N_PLUS {
//            plView2 = UIImageView(frame: CGRect(x: bu.frame.size.width / 3.7, y: 16, width: 20, height: 20))
//        } else if IS_IPHONE_X {
//            plView2 = UIImageView(frame: CGRect(x: bu.frame.size.width / 4.3, y: 8, width: 20, height: 20))
//        } else if IS_IPHONE_N {
//            plView2 = UIImageView(frame: CGRect(x: bu.frame.size.width / 4.1, y: 8, width: 15, height: 15))
//        } else if IS_IPHONE_12PRO_MAX {
//            plView2 = UIImageView(frame: CGRect(x: bu.frame.size.width / 3.7, y: 16, width: 20, height: 20))
//        } else if IS_IPHONE_15PRO_MAX {
//            plView2 = UIImageView(frame: CGRect(x: bu.frame.size.width / 3.7, y: 16, width: 20, height: 20))
//        } else if IS_IPHONE_12PRO {
//            plView2 = UIImageView(frame: CGRect(x: bu.frame.size.width / 3.7, y: 18, width: 17, height: 17))
//        }else {
//            plView2 = UIImageView(frame: CGRect(x: bu.frame.size.width / 3.7, y: 8, width: 20, height: 20))
//        }
//        
//        bu.addSubview(plView2)
//        
//        var imagePl2 = UIImage()
//        imagePl2 = UIImage(named: "plust")!
        self.MedicationManagementWebView = WebView(frame: CGRect(
            x: 0,
            y: menuView.frame.maxY,
            width: SCREEN.WIDTH,
            height: SCREEN.HEIGHT - menuView.frame.maxY), urlString: "http://ksrapp.m2comm.co.kr/php/info/info04_3a.php")
        
        MedicationManagementNotebookView = Smart_Stroke2024.MedicationManagementNotebookView(frame: CGRect(x: 0, y: scrollView.frame.minY, width: SCREEN.WIDTH, height: scrollView.frame.height))
        MedicationManagementNotebookView.backgroundColor = .white
        scrollView.addSubview(MedicationManagementNotebookView)
        
        
        scrollView.backgroundColor = #colorLiteral(red: 0.1356676817, green: 0.7028286457, blue: 0.8024563789, alpha: 1)
        
        self.view.addSubview(self.MedicationManagementWebView)
        
        
        self.registerdDrugListView = RegisterdDrugListView3(frame: CGRect(
            x: 0,
            y: menuView.frame.maxY,
            width: SCREEN.WIDTH,
            height: SCREEN.HEIGHT))
//            height: SCREEN.HEIGHT - menuView.frame.maxY - SAFE_AREA + 150))
//        self.registerdDrugListView.topView.delegate = self
//        self.registerdDrugListView.drugManagementVC = self
//        registerdDrugListView.setGradient2(color1: UIColor(red: 35.0 / 255.0, green: 207.0 / 255.0, blue: 193.0 / 255.0, alpha: 1), color2: UIColor(red: 35.0 / 255.0, green: 173.0 / 255.0, blue: 207 / 255.0, alpha: 1))
        self.view.addSubview(self.registerdDrugListView)
        
        
        self.registerdDrugListView.drugManagementVC = self

        
        self.drugManagementVC = DrugManagementViewController()

        
        
        
        
        
        
        MedicationManagementNotebookView.MedicationManagementView = UIView(frame: CGRect(x: 0, y: scrollView.frame.minY, width: self.view.frame.size.width, height: self.view.frame.size.height))
//        MedicationManagementNotebookView.MedicationManagementView.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        
        MedicationManagementNotebookView.MedicationManagementView.setGradient2(color1: UIColor(red: 35.0 / 255.0, green: 207.0 / 255.0, blue: 193.0 / 255.0, alpha: 1), color2: UIColor(red: 35.0 / 255.0, green: 173.0 / 255.0, blue: 207 / 255.0, alpha: 1))
//        BloodSugarManagementNotebookView.FastingBloodSugar.layer.borderWidth = 1
//        ObesityManagementNotebookView.bmiGraphVIew.layer.cornerRadius = 8
        scrollView.addSubview(MedicationManagementNotebookView.MedicationManagementView)
        
        
    
        
        MedicationManagementNotebookView.MedicationManagementViewIcon = UIImageView(frame: CGRect(x: self.view.frame.size.width / 2.3, y: 30, width: 50, height: 50))
        MedicationManagementNotebookView.MedicationManagementViewIcon.image = UIImage(named: "eat")
        
//        scrollView.addSubview(MedicationManagementNotebookView.MedicationManagementViewIcon)
        
        
        MedicationManagementNotebookView.MedicationManagementViewHowNum = UILabel(frame: CGRect(x: 20, y: MedicationManagementNotebookView.MedicationManagementViewIcon.frame.maxY + 5, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 11))
//        MedicationManagementNotebookView.MedicationManagementViewHowNum.text = "한 달간 복약 0%를 달성하였습니다."
//        MedicationManagementNotebookView.MedicationManagementViewHowNum.backgroundColor = .clear
                
        
        
        
//        if (UserDefaults.standard.string(forKey: "at") != "") {
//            MedicationManagementNotebookView.MedicationManagementViewHowNum.text = UserDefaults.standard.string(forKey: "at")
//        } else {
//            MedicationManagementNotebookView.MedicationManagementViewHowNum.text = UserDefaults.standard.string(forKey: "at")
//        }
        

        
        
        
        
        
        MedicationManagementNotebookView.MedicationManagementViewHowNum.textAlignment = .center
        MedicationManagementNotebookView.MedicationManagementViewHowNum.font = UIFont(name: "SUITE-Regular", size: 22)
        MedicationManagementNotebookView.MedicationManagementViewHowNum.textColor = .white
//        MedicationManagementNotebookView.MedicationManagementViewHowNum.font = UIFont.systemFont(ofSize: 22)
//        MedicationManagementNotebookView.MedicationManagementViewHowNum.layer.borderWidth = 1
        MedicationManagementNotebookView.MedicationManagementViewHowNum.numberOfLines = 0
        scrollView.addSubview(MedicationManagementNotebookView.MedicationManagementViewHowNum)
        
        
        
//        MedicationManagementNotebookView.MedicationManagementViewHowNum.text = UserDefaults.standard.string(forKey: "s") ?? ""
        
//        self.labelStringUpdate3(valueString: "0%")
        
        
     
       
        
        
        
//        self.labelStringUpdate(valueString: "0%")
        
        UserDefaults.standard.set(MedicationManagementNotebookView.MedicationManagementViewHowNum.text, forKey: "test")
        print("test---->\(UserDefaults.standard.string(forKey: "test"))")
//        print("test---->\(self.labelStringUpdate(valueString: "0%"))")
        
        underNumLabel = UILabel(frame: CGRect(x: 20, y: MedicationManagementNotebookView.MedicationManagementViewHowNum.frame.maxY + 5, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 12))
//        underNumLabel.text = "성공적인 치료를 위해서는\n 꾸준한 약물 복용이 중요합니다."
        underNumLabel.numberOfLines = 0
        underNumLabel.textAlignment = .center
//        underNumLabel.layer.borderWidth = 1
        underNumLabel.font = UIFont(name: "SUITE-Regular", size: 15)
        underNumLabel.textColor = .white
        underNumLabel.font = UIFont.systemFont(ofSize: 15)
        
        scrollView.addSubview(underNumLabel)
        
        
//        if IS_IPHONE_N {
//            MedicationManagementNotebookView.MedicationManagementBTN = UIButton(frame: CGRect(x: 80, y: underNumLabel.frame.maxY - 50, width: self.view.frame.size.width - 160, height: self.view.frame.size.height / 16.5))
//        } else if IS_IPHONE_12PRO_MAX {
//            MedicationManagementNotebookView.MedicationManagementBTN = UIButton(frame: CGRect(x: 80, y: underNumLabel.frame.maxY - 60, width: self.view.frame.size.width - 160, height: self.view.frame.size.height / 16.5))
//        } else if IS_IPHONE_15PRO_MAX {
//            MedicationManagementNotebookView.MedicationManagementBTN = UIButton(frame: CGRect(x: 80, y: underNumLabel.frame.maxY - 60, width: self.view.frame.size.width - 160, height: self.view.frame.size.height / 16.5))
//        } else if IS_IPHONE_12PRO {
//            MedicationManagementNotebookView.MedicationManagementBTN = UIButton(frame: CGRect(x: 80, y: underNumLabel.frame.maxY - 40, width: self.view.frame.size.width - 160, height: self.view.frame.size.height / 16.5))
//        } else if IS_IPHONE_15PRO {
//            MedicationManagementNotebookView.MedicationManagementBTN = UIButton(frame: CGRect(x: 80, y: underNumLabel.frame.maxY - 40, width: self.view.frame.size.width - 160, height: self.view.frame.size.height / 16.5))
//        } else if IS_IPHONE_N_PLUS {
//            MedicationManagementNotebookView.MedicationManagementBTN = UIButton(frame: CGRect(x: 80, y: underNumLabel.frame.maxY - 30, width: self.view.frame.size.width - 160, height: self.view.frame.size.height / 16.5))
//        } else {
//            MedicationManagementNotebookView.MedicationManagementBTN = UIButton(frame: CGRect(x: 80, y: underNumLabel.frame.maxY - 60, width: self.view.frame.size.width - 160, height: self.view.frame.size.height / 16.5))
//        }
//        MedicationManagementNotebookView.MedicationManagementBTN.setTitle("        복약 알림 설정", for: .normal)
//        MedicationManagementNotebookView.MedicationManagementBTN.setTitleColor(.white, for: .normal)
//        
//        
//        var plView = UIImageView()
//        
////        MedicationManagementNotebookView.MedicationManagementBTN.setImage(UIImage(named: "plust"), for: .normal)
//        if IS_IPHONE_N_PLUS {
//            plView = UIImageView(frame: CGRect(x: MedicationManagementNotebookView.MedicationManagementBTN.frame.size.width / 3.7, y: 11, width: 20, height: 20))
//        } else if IS_IPHONE_X {
//            plView = UIImageView(frame: CGRect(x: MedicationManagementNotebookView.MedicationManagementBTN.frame.size.width / 4.3, y: 20, width: 20, height: 20))
//        } else if IS_IPHONE_N {
//            plView = UIImageView(frame: CGRect(x: MedicationManagementNotebookView.MedicationManagementBTN.frame.size.width / 4.1, y: 15, width: 15, height: 15))
//        } else if IS_IPHONE_12PRO_MAX {
//            plView = UIImageView(frame: CGRect(x: MedicationManagementNotebookView.MedicationManagementBTN.frame.size.width / 3.7, y: 18, width: 20, height: 20))
//        } else if IS_IPHONE_15PRO_MAX {
//            plView = UIImageView(frame: CGRect(x: MedicationManagementNotebookView.MedicationManagementBTN.frame.size.width / 3.7, y: 18, width: 20, height: 20))
//        } else if IS_IPHONE_12PRO {
//            plView = UIImageView(frame: CGRect(x: MedicationManagementNotebookView.MedicationManagementBTN.frame.size.width / 4.1, y: 17, width: 17, height: 17))
//        } else if IS_IPHONE_15PRO {
//            plView = UIImageView(frame: CGRect(x: MedicationManagementNotebookView.MedicationManagementBTN.frame.size.width / 4.1, y: 17, width: 17, height: 17))
//        } else {
//            plView = UIImageView(frame: CGRect(x: MedicationManagementNotebookView.MedicationManagementBTN.frame.size.width / 3.7, y: 25, width: 20, height: 20))
//        }
//        
//        MedicationManagementNotebookView.MedicationManagementBTN.addSubview(plView)
        if IS_IPHONE_N {
            MedicationManagementNotebookView.MedicationManagementBTN = UIButton(frame: CGRect(x: 80, y: underNumLabel.frame.maxY - 20, width: self.view.frame.size.width - 160, height: self.view.frame.size.height / 16.5))
        } else if IS_IPHONE_MINI {
            MedicationManagementNotebookView.MedicationManagementBTN = UIButton(frame: CGRect(x: 80, y: underNumLabel.frame.maxY - 20, width: self.view.frame.size.width - 160, height: self.view.frame.size.height / 18.5))
        }  else if IS_IPHONE_12PRO_MAX {
            MedicationManagementNotebookView.MedicationManagementBTN = UIButton(frame: CGRect(x: 80, y: underNumLabel.frame.maxY - 50, width: self.view.frame.size.width - 160, height: self.view.frame.size.height / 16.5))
        } else if IS_IPHONE_15PRO_MAX {
            MedicationManagementNotebookView.MedicationManagementBTN = UIButton(frame: CGRect(x: 80, y: underNumLabel.frame.maxY - 50, width: self.view.frame.size.width - 160, height: self.view.frame.size.height / 16.5))
        } else if IS_IPHONE_12PRO {
            MedicationManagementNotebookView.MedicationManagementBTN = UIButton(frame: CGRect(x: 80, y: underNumLabel.frame.maxY - 40, width: self.view.frame.size.width - 160, height: self.view.frame.size.height / 16.5))
        } else if IS_IPHONE_15PRO {
            MedicationManagementNotebookView.MedicationManagementBTN = UIButton(frame: CGRect(x: 80, y: underNumLabel.frame.maxY - 40, width: self.view.frame.size.width - 160, height: self.view.frame.size.height / 16.5))
        } else if IS_IPHONE_N_PLUS {
            MedicationManagementNotebookView.MedicationManagementBTN = UIButton(frame: CGRect(x: 80, y: underNumLabel.frame.maxY - 20, width: self.view.frame.size.width - 160, height: self.view.frame.size.height / 16.5))
        } else {
            MedicationManagementNotebookView.MedicationManagementBTN = UIButton(frame: CGRect(x: 80, y: underNumLabel.frame.maxY - 60, width: self.view.frame.size.width - 160, height: self.view.frame.size.height / 16.5))
        }
        MedicationManagementNotebookView.MedicationManagementBTN.setTitle("        복약 알림 설정", for: .normal)
        MedicationManagementNotebookView.MedicationManagementBTN.setTitleColor(.white, for: .normal)
        
        
        var plView = UIImageView()
        
//        MedicationManagementNotebookView.MedicationManagementBTN.setImage(UIImage(named: "plust"), for: .normal)
        if IS_IPHONE_N_PLUS {
            plView = UIImageView(frame: CGRect(x: MedicationManagementNotebookView.MedicationManagementBTN.frame.size.width / 3.7, y: 11, width: 20, height: 20))
        }
//        else if IS_IPHONE_X {
//            plView = UIImageView(frame: CGRect(x: MedicationManagementNotebookView.MedicationManagementBTN.frame.size.width / 4.3, y: 20, width: 20, height: 20))
//        }
        else if IS_IPHONE_N {
            plView = UIImageView(frame: CGRect(x: MedicationManagementNotebookView.MedicationManagementBTN.frame.size.width / 4.1, y: 13, width: 15, height: 15))
        }else if IS_IPHONE_MINI {
            plView = UIImageView(frame: CGRect(x: MedicationManagementNotebookView.MedicationManagementBTN.frame.size.width / 4.1, y: 14, width: 15, height: 15))
        } else if IS_IPHONE_12PRO_MAX {
            plView = UIImageView(frame: CGRect(x: MedicationManagementNotebookView.MedicationManagementBTN.frame.size.width / 3.7, y: 18, width: 20, height: 20))
        } else if IS_IPHONE_15PRO_MAX {
            plView = UIImageView(frame: CGRect(x: MedicationManagementNotebookView.MedicationManagementBTN.frame.size.width / 3.7, y: 18, width: 20, height: 20))
        } else if IS_IPHONE_12PRO {
            plView = UIImageView(frame: CGRect(x: MedicationManagementNotebookView.MedicationManagementBTN.frame.size.width / 4.1, y: 17, width: 17, height: 17))
        } else if IS_IPHONE_15PRO {
            plView = UIImageView(frame: CGRect(x: MedicationManagementNotebookView.MedicationManagementBTN.frame.size.width / 4.1, y: 17, width: 17, height: 17))
        } else {
            plView = UIImageView(frame: CGRect(x: MedicationManagementNotebookView.MedicationManagementBTN.frame.size.width / 3.7, y: 25, width: 20, height: 20))
        }
        
        MedicationManagementNotebookView.MedicationManagementBTN.addSubview(plView)
        
        
        var imagePl = UIImage()
        imagePl = UIImage(named: "plust")!
        
        plView.image = imagePl
        
        
        
//        if IS_IPHONE_N {
//            MedicationManagementNotebookView.MedicationManagementBTN = UIButton(frame: CGRect(x: 80, y: underNumLabel.frame.maxY - 50, width: self.view.frame.size.width - 160, height: self.view.frame.size.height / 16.5))
//        } else {
//            MedicationManagementNotebookView.MedicationManagementBTN = UIButton(frame: CGRect(x: 80, y: underNumLabel.frame.maxY - 60, width: self.view.frame.size.width - 160, height: self.view.frame.size.height / 16.5))
//        }
//        MedicationManagementNotebookView.MedicationManagementBTN.setTitle("        복약 알림 설정", for: .normal)
//        MedicationManagementNotebookView.MedicationManagementBTN.setTitleColor(.white, for: .normal)
//        
//        
//        var plView = UIImageView()
//        
////        MedicationManagementNotebookView.MedicationManagementBTN.setImage(UIImage(named: "plust"), for: .normal)
//        if IS_IPHONE_N_PLUS {
//            plView = UIImageView(frame: CGRect(x: MedicationManagementNotebookView.MedicationManagementBTN.frame.size.width / 3.7, y: 11, width: 20, height: 20))
//        } else if IS_IPHONE_X {
//            plView = UIImageView(frame: CGRect(x: MedicationManagementNotebookView.MedicationManagementBTN.frame.size.width / 4.3, y: 20, width: 20, height: 20))
//        } else if IS_IPHONE_N {
//            plView = UIImageView(frame: CGRect(x: MedicationManagementNotebookView.MedicationManagementBTN.frame.size.width / 4.1, y: 15, width: 15, height: 15))
//        } else if IS_IPHONE_12PRO_MAX {
//            plView = UIImageView(frame: CGRect(x: MedicationManagementNotebookView.MedicationManagementBTN.frame.size.width / 3.7, y: 18, width: 20, height: 20))
//        } else if IS_IPHONE_15PRO_MAX {
//            plView = UIImageView(frame: CGRect(x: MedicationManagementNotebookView.MedicationManagementBTN.frame.size.width / 3.7, y: 18, width: 20, height: 20))
//        } else if IS_IPHONE_12PRO {
//            plView = UIImageView(frame: CGRect(x: MedicationManagementNotebookView.MedicationManagementBTN.frame.size.width / 3.7, y: 17, width: 17, height: 17))
//        } else if IS_IPHONE_15PRO {
//            plView = UIImageView(frame: CGRect(x: MedicationManagementNotebookView.MedicationManagementBTN.frame.size.width / 3.7, y: 17, width: 17, height: 17))
//        } else {
//            plView = UIImageView(frame: CGRect(x: MedicationManagementNotebookView.MedicationManagementBTN.frame.size.width / 3.7, y: 25, width: 20, height: 20))
//        }
//        
//        MedicationManagementNotebookView.MedicationManagementBTN.addSubview(plView)
//        
//        
//        
//        var imagePl = UIImage()
//        imagePl = UIImage(named: "plust")!
//        
//        plView.image = imagePl

        
        
        
        
        
        MedicationManagementNotebookView.MedicationManagementBTN.contentMode = .scaleAspectFill
        
        
        
//        MedicationManagementNotebookView.MedicationManagementBTN.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        
        
        MedicationManagementNotebookView.MedicationManagementBTN.backgroundColor = #colorLiteral(red: 0.09446402639, green: 0.4838455915, blue: 0.5657636523, alpha: 1)
//        MedicationManagementNotebookView.MedicationManagementBTN.layer.borderWidth = 1
        MedicationManagementNotebookView.MedicationManagementBTN.layer.cornerRadius = 8
        
        
        
        
        MedicationManagementNotebookView.MedicationManagementBTN.addTarget(self, action: #selector(addButtonPressed(button: )), for: .touchUpInside)
        
        
        
        
//        scrollView.addSubview(MedicationManagementNotebookView.MedicationManagementBTN)
        
        
        drugManagerView = DrugManageView(frame: CGRect(x: 0, y: 0, width: SCREEN.WIDTH, height: 1200))
        
//         한 달간 0%
        drugManagerView.backgroundColor = .clear
        

        
        
        MedicationManagementNotebookView.MedicationManagementView.addSubview(drugManagerView)
        
        
        
        drugManagerView.addSubview(MedicationManagementNotebookView.MedicationManagementBTN)
        
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: menuView.frame.maxY).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        if IS_IPHONE_N_PLUS {
            scrollView.bottomAnchor.constraint(equalTo: MedicationManagementNotebookView.MedicationManagementView.bottomAnchor, constant: 250).isActive = true
        } else {
            scrollView.bottomAnchor.constraint(equalTo: MedicationManagementNotebookView.MedicationManagementView.bottomAnchor, constant: 150).isActive = true
        }
        
        
        
        
//        bu = UIButton(frame: CGRect(x: 80, y: underNumLabel.frame.maxY - 65, width: self.view.frame.size.width - 160, height: 55))
//        if IS_IPHONE_12PRO {
//            bu = UIButton(frame: CGRect(x: 80, y: underNumLabel.frame.maxY - 45, width: self.view.frame.size.width - 160, height: 55))
//        }
//        if IS_IPHONE_15PRO {
//            bu = UIButton(frame: CGRect(x: 80, y: underNumLabel.frame.maxY - 45, width: self.view.frame.size.width - 160, height: 55))
//        }
//        if IS_IPHONE_N_PLUS {
//            bu = UIButton(frame: CGRect(x: 80, y: underNumLabel.frame.maxY - 35, width: self.view.frame.size.width - 160, height: 55))
//        }
//        
////        bu = UIButton(frame: CGRect(x: 80, y: underNumLabel.frame.maxY - 65, width: self.view.frame.size.width - 160, height: 55))
//        
//        bu.setTitle("        복약 알림 설정", for: .normal)
//        bu.setTitleColor(.white, for: .normal)
//        
//        bu.backgroundColor = #colorLiteral(red: 0.09397112578, green: 0.4878631234, blue: 0.5656062961, alpha: 1)
//        bu.layer.cornerRadius = 8
//        bu.addTarget(self, action: #selector(addButtonPressed(button: )), for: .touchUpInside)
////        registerdDrugListView.addSubview(bu)
//        var plView2 = UIImageView()
        bu = UIButton(frame: CGRect(x: 80, y: underNumLabel.frame.maxY - 65, width: self.view.frame.size.width - 160, height: 55))
        if IS_IPHONE_12PRO_MAX {
            bu = UIButton(frame: CGRect(x: 80, y: underNumLabel.frame.maxY - 50, width: self.view.frame.size.width - 160, height: 55))
        }
        if IS_IPHONE_15PRO_MAX {
            bu = UIButton(frame: CGRect(x: 80, y: underNumLabel.frame.maxY - 55, width: self.view.frame.size.width - 160, height: 55))
        }
        if IS_IPHONE_12PRO {
            bu = UIButton(frame: CGRect(x: 80, y: underNumLabel.frame.maxY - 40, width: self.view.frame.size.width - 160, height: 50))
        }
        if IS_IPHONE_15PRO {
            bu = UIButton(frame: CGRect(x: 80, y: underNumLabel.frame.maxY - 40, width: self.view.frame.size.width - 160, height: 49))
        }
        if IS_IPHONE_N_PLUS {
            bu = UIButton(frame: CGRect(x: 80, y: underNumLabel.frame.maxY - 20, width: self.view.frame.size.width - 160, height: 45))
        }
        if IS_IPHONE_N {
            bu = UIButton(frame: CGRect(x: 80, y: underNumLabel.frame.maxY - 20, width: self.view.frame.size.width - 160, height: 40))
        }
        if IS_IPHONE_MINI {
            bu = UIButton(frame: CGRect(x: 80, y: underNumLabel.frame.maxY - 20, width: self.view.frame.size.width - 160, height: 40))
        }
        bu.setTitle("        복약 알림 설정", for: .normal)
        bu.setTitleColor(.white, for: .normal)
        
        bu.backgroundColor = #colorLiteral(red: 0.09397112578, green: 0.4878631234, blue: 0.5656062961, alpha: 1)
        bu.layer.cornerRadius = 8
        bu.addTarget(self, action: #selector(addButtonPressed(button: )), for: .touchUpInside)
//        registerdDrugListView.addSubview(bu)
        var plView2 = UIImageView()
        
//        var plView = UIImageView()
        
//        MedicationManagementNotebookView.MedicationManagementBTN.setImage(UIImage(named: "plust"), for: .normal)
//        if IS_IPHONE_N_PLUS {
//            plView2 = UIImageView(frame: CGRect(x: bu.frame.size.width / 3.7, y: 16, width: 20, height: 20))
//        } else if IS_IPHONE_X {
//            plView2 = UIImageView(frame: CGRect(x: bu.frame.size.width / 4.3, y: 8, width: 20, height: 20))
//        } else if IS_IPHONE_N {
//            plView2 = UIImageView(frame: CGRect(x: bu.frame.size.width / 4.1, y: 8, width: 15, height: 15))
//        } else if IS_IPHONE_12PRO_MAX {
//            plView2 = UIImageView(frame: CGRect(x: bu.frame.size.width / 3.7, y: 16, width: 20, height: 20))
//        } else if IS_IPHONE_15PRO_MAX {
//            plView2 = UIImageView(frame: CGRect(x: bu.frame.size.width / 3.7, y: 16, width: 20, height: 20))
//        } else if IS_IPHONE_12PRO {
//            plView2 = UIImageView(frame: CGRect(x: bu.frame.size.width / 3.7, y: 18, width: 17, height: 17))
//        }else {
//            plView2 = UIImageView(frame: CGRect(x: bu.frame.size.width / 3.7, y: 8, width: 20, height: 20))
//        }
//        
//        bu.addSubview(plView2)
        
//        if IS_IPHONE_N_PLUS {
//            plView2 = UIImageView(frame: CGRect(x: bu.frame.size.width / 3.7, y: 16, width: 20, height: 20))
//        } else if IS_IPHONE_X {
//            plView2 = UIImageView(frame: CGRect(x: bu.frame.size.width / 4.3, y: 8, width: 20, height: 20))
//        } else if IS_IPHONE_N {
//            plView2 = UIImageView(frame: CGRect(x: bu.frame.size.width / 4.1, y: 8, width: 15, height: 15))
//        } else if IS_IPHONE_12PRO_MAX {
//            plView2 = UIImageView(frame: CGRect(x: bu.frame.size.width / 3.7, y: 16, width: 20, height: 20))
//        } else if IS_IPHONE_15PRO_MAX {
//            plView2 = UIImageView(frame: CGRect(x: bu.frame.size.width / 3.7, y: 16, width: 20, height: 20))
//        } else if IS_IPHONE_12PRO {
//            plView2 = UIImageView(frame: CGRect(x: bu.frame.size.width / 4.3, y: 18, width: 17, height: 17))
//        } else if IS_IPHONE_15PRO {
//            plView2 = UIImageView(frame: CGRect(x: bu.frame.size.width / 4.3, y: 18, width: 17, height: 17))
//        } else {
//            plView2 = UIImageView(frame: CGRect(x: bu.frame.size.width / 3.9, y: 8, width: 20, height: 20))
//        }
//        
//        var imagePl2 = UIImage()
//        imagePl2 = UIImage(named: "plust")!
//        
//        plView2.image = imagePl2
        if IS_IPHONE_N_PLUS {
            plView2 = UIImageView(frame: CGRect(x: bu.frame.size.width / 3.7, y: 11, width: 20, height: 20))
        }
//        else if IS_IPHONE_X {
//            plView2 = UIImageView(frame: CGRect(x: bu.frame.size.width / 4.3, y: 8, width: 20, height: 20))
//        }
        else if IS_IPHONE_N {
            plView2 = UIImageView(frame: CGRect(x: bu.frame.size.width / 4.1, y: 12, width: 15, height: 15))
        } else if IS_IPHONE_MINI {
            plView2 = UIImageView(frame: CGRect(x: bu.frame.size.width / 4.1, y: 12, width: 15, height: 15))
        } else if IS_IPHONE_12PRO_MAX {
            plView2 = UIImageView(frame: CGRect(x: bu.frame.size.width / 3.7, y: 18, width: 20, height: 20))
        } else if IS_IPHONE_15PRO_MAX {
            plView2 = UIImageView(frame: CGRect(x: bu.frame.size.width / 3.7, y: 18, width: 20, height: 20))
        } else if IS_IPHONE_12PRO {
            plView2 = UIImageView(frame: CGRect(x: bu.frame.size.width / 4.1, y: 17, width: 17, height: 18))
        } else if IS_IPHONE_15PRO {
            plView2 = UIImageView(frame: CGRect(x: bu.frame.size.width / 4.1, y: 17, width: 17, height: 18))
        } else {
            plView2 = UIImageView(frame: CGRect(x: bu.frame.size.width / 3.9, y: 8, width: 20, height: 20))
        }
        
        bu.addSubview(plView2)
        
        var imagePl2 = UIImage()
        imagePl2 = UIImage(named: "plust")!
        
        plView2.image = imagePl2
        
        
        registerdDrugListView.addSubview(bu)
        
//        plView2.image = imagePl2
        
        
        registerdDrugListView.addSubview(bu)
        
        MedicationManagementNotebookView.MedicationManagementBTN.isHidden = true
        drugManagerView.isHidden = true
        
        MedicationManagementWebView.isHidden = true
        MedicationManagementNotebookView.isHidden = true
        registerdDrugListView.isHidden = false
        self.registerdDrugListView.dataUpdate()
        
        
        registerdDrugListView.frame.size.height = SCREEN.HEIGHT - menuView.frame.maxY - SAFE_AREA + 150
        registerdDrugListView.drugRegisterTableView.frame.size.height = 500
        
        bu.isHidden = false
        
        
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: menuView.frame.maxY).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: MedicationManagementNotebookView.bottomAnchor, constant: 50).isActive = true
    }
//    override func viewDidAppear(_ animated: Bool) {
//        UnderBar = UIView(frame: CGRect(x: button3.center.x, y: naviBar.frame.maxY + 62, width: SCREEN.WIDTH / 8.5, height: 5))
//                UnderBar.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
//                self.view.addSubview(UnderBar)
//    }
    
    //MARK:RegisterdDrugListTopViewDelegate
    @objc func addButtonPressed(button: UIButton) {
        print("tap")
        
        let drugRegisterViewController = DrugRegisterViewController()
        drugRegisterViewController.modalPresentationStyle = .fullScreen
        self.present(drugRegisterViewController, animated: true) {
            
        }
    }
    
    
    @objc func addButtonPressed(_ button : UIButton ){
        self.delegate?.addButtonPressed?(button: button)
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
            MedicationManagementWebView.isHidden = false
            MedicationManagementNotebookView.isHidden = true
            registerdDrugListView.isHidden = true
        } else if sender.tag == 1 {
            UIView.animate(withDuration: 0.5, animations: { [self] in
              
//            moveSelected(view: UnderBar, button: button2)
                
            })
            
            MedicationManagementNotebookView.MedicationManagementBTN.isHidden = false
            drugManagerView.isHidden = false
            MedicationManagementWebView.isHidden = true
            MedicationManagementNotebookView.isHidden = false
            drugManagerView.calendarView.dataUpdate()
            registerdDrugListView.isHidden = true
            
//            registerdDrugListView.isHidden = false
//            registerdDrugListView.frame.size.height = 140
            
            
            registerdDrugListView.drugRegisterTableView.frame.size.height = 0
            bu.isHidden = true
            
        } else if sender.tag == 2 {
            UIView.animate(withDuration: 0.5, animations: { [self] in
              
//            moveSelected(view: UnderBar, button: button3)
                
            })
            
            MedicationManagementNotebookView.MedicationManagementBTN.isHidden = true
            drugManagerView.isHidden = true
            MedicationManagementWebView.isHidden = true
            MedicationManagementNotebookView.isHidden = true
            registerdDrugListView.isHidden = false
            self.registerdDrugListView.dataUpdate()
            
            registerdDrugListView.frame.size.height = SCREEN.HEIGHT - menuView.frame.maxY - SAFE_AREA + 150
            registerdDrugListView.drugRegisterTableView.frame.size.height = 500
            
            bu.isHidden = false
        }
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool{
         return true
        }
    
    
//    @objc func panAction (_ sender : UIPanGestureRecognizer){
//        scrollView.isScrollEnabled = true
//        let velocity = sender.velocity(in: self.view)
//    if abs(velocity.x) > abs(velocity.y) {
//    velocity.x < 0 ? print("left") :  print("right")
//    }
//    else if abs(velocity.y) > abs(velocity.x) {
//    velocity.y < 0 ? print("up") :  print("down")
////        if velocity.y < 0 {
////            print("123")
////            registerdDrugListView.isHidden = true
////
////
////
////        } else {
////            print("34")
////
////
//////            registerdDrugListView.isHidden = false
////
////
////
////
////
////        }
//        
//        
////        if scrollView.contentOffset.y > 0 {
////            if scrollView.contentOffset.y < 110 {
////              print("1")
////            } else {
////                print("2")
////            }
////          } else {
////              print("1")
////          }
//        
//        if scrollView.contentOffset.y > -2 {
//              print("1")
//                        registerdDrugListView.isHidden = true
//            } else {
//              print("2")
//                            registerdDrugListView.isHidden = false
//          }
//       
//        
//        
//        
//    }
//}
    func labelStringUpdate3( valueString : String ) {
        
        let beforeString = "한 달간 복약"
        let afterString = "를 달성하였습니다.\n성공적인 치료를 위해서는 꾸준한\n약물 복용이 중요합니다."
        
        let defaultAttribute = [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17),
//            NSAttributedString.Key.foregroundColor : UIColor.black,
            NSAttributedString.Key.foregroundColor : UIColor.white,
            NSAttributedString.Key.kern : -0.48 //자간?
        ] as! [NSAttributedString.Key : NSObject]
        let valueAttribute = [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 22),
//            NSAttributedString.Key.foregroundColor : UIColor(red: 221.0 / 255.0, green: 15.0 / 255.0, blue: 15.0 / 255.0, alpha: 1.0),
            NSAttributedString.Key.foregroundColor : UIColor.yellow,
        ] as [NSAttributedString.Key : NSObject]
        
        
        let stringInfos = [
            (beforeString,defaultAttribute),
            (valueString,valueAttribute),
            (afterString,defaultAttribute)
            ]
        as [(String,[NSAttributedString.Key:NSObject])]
        self.MedicationManagementNotebookView.MedicationManagementViewHowNum.attributedText = getAttributedString(stringsInfos: stringInfos)
        
      
        
//        UserDefaults.standard.setValue(label.text, forKey: "at")
        
    }
    func labelStringUpdate( valueString : String ) {
        
        let beforeString = "한 달간 복약"
        let afterString2 = "를 달성하였습니다."
        let afterString = "\n\n성공적인 치료를 위해서는\n꾸준한 약물 복용이 중요합니다."
        
        let defaultAttribute = [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18),
//            NSAttributedString.Key.foregroundColor : UIColor.black,
            NSAttributedString.Key.foregroundColor : UIColor.white,
            NSAttributedString.Key.kern : -0.48 //자간?
        ] as! [NSAttributedString.Key : NSObject]
        
        let defaultAttribute2 = [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12),
//            NSAttributedString.Key.foregroundColor : UIColor.black,
            NSAttributedString.Key.foregroundColor : UIColor.white,
            NSAttributedString.Key.kern : -0.48 //자간?
        ] as! [NSAttributedString.Key : NSObject]
        
        
        let valueAttribute = [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 24),
//            NSAttributedString.Key.foregroundColor : UIColor(red: 221.0 / 255.0, green: 15.0 / 255.0, blue: 15.0 / 255.0, alpha: 1.0),
            NSAttributedString.Key.foregroundColor : UIColor.yellow,
        ] as [NSAttributedString.Key : NSObject]
        

        let stringInfos = [
            (beforeString,defaultAttribute),
            (valueString,valueAttribute),
            (afterString2,defaultAttribute),
            (afterString,defaultAttribute2)
            ]
        as [(String,[NSAttributedString.Key:NSObject])]
        self.MedicationManagementNotebookView.MedicationManagementViewHowNum.numberOfLines = 0
        self.MedicationManagementNotebookView.MedicationManagementViewHowNum.attributedText = getAttributedString(stringsInfos: stringInfos)
//        print("------------->\(label.attributedText)")
//        UserDefaults.standard.setValue(label.text, forKey: "at")
        
//        let fontSize = UIFont(name: "SUITE-Regular", size: 16)
//        let attributedStr = NSMutableAttributedString(string: "한 달간 를 달성햐였습니다.\n성공적인 치료를 위해서는\n꾸준한 약물 복용이 중요합니다.")
//        attributedStr.addAttribute(.font, value: fontSize, range: ("한 달간 를 달성햐였습니다.\n성공적인 치료를 위해서는\n꾸준한 약물 복용이 중요합니다." as! NSString).range(of: "한 달간 를 달성햐였습니다."))
//
//
//        myLabel.attributedText = attributedStr
        
        
    }
}
