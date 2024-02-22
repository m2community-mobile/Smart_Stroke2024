//
//   MedicationManagementViewController.swift
//  KSR_2024
//
//  Created by m2comm on 2024/01/19.
//

import Foundation
import UIKit

class   MedicationManagementViewController: BaseViewController, RegisterdDrugListTopViewDelegate {
    
    var MedicationManagementWebView : WebView!
    var MedicationManagementNotebookView : MedicationManagementNotebookView!
//    var BloodSugarRecordsView : BloodSugarRecordsView!
    
    var drugManagerView: DrugManageView!
    
    
    
    
    var delegate : RegisterdDrugListTopViewDelegate?
    
    
    var registerdDrugListView : RegisterdDrugListView!
    
    var drugManagementVC : DrugManagementViewController?
    
//    var test: DrugManageView!
    
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
        
        titleName.text = "약물복용 관리"
        titleName.font = UIFont(name: "SUITE-Regular", size: 20)
        
        naviBar.addSubview(titleName)
     
        label1.text = "약물복용\n도움말"
        label2.text = "약물\n복용관리"
        label3.text = "약물\n등록리스트"
        
        self.MedicationManagementWebView = WebView(frame: CGRect(
            x: 0,
            y: menuView.frame.maxY,
            width: SCREEN.WIDTH,
            height: SCREEN.HEIGHT - menuView.frame.maxY), urlString: "http://ksrapp.m2comm.co.kr/html/care/care05_1a.html")
        
        MedicationManagementNotebookView = KSR_2024.MedicationManagementNotebookView(frame: CGRect(x: 0, y: scrollView.frame.minY, width: SCREEN.WIDTH, height: scrollView.frame.height))
        MedicationManagementNotebookView.backgroundColor = .white
        scrollView.addSubview(MedicationManagementNotebookView)
        scrollView.backgroundColor = #colorLiteral(red: 0.1356676817, green: 0.7028286457, blue: 0.8024563789, alpha: 1)
        
        self.view.addSubview(self.MedicationManagementWebView)
        
        
        self.registerdDrugListView = RegisterdDrugListView(frame: CGRect(
            x: 0,
            y: menuView.frame.maxY,
            width: SCREEN.WIDTH,
            height: SCREEN.HEIGHT - menuView.frame.maxY - SAFE_AREA))
//        self.registerdDrugListView.topView.delegate = self
//        self.registerdDrugListView.drugManagementVC = self
        self.view.addSubview(self.registerdDrugListView)
        
        
        
        MedicationManagementNotebookView.MedicationManagementView = UIView(frame: CGRect(x: 0, y: scrollView.frame.minY, width: self.view.frame.size.width, height: self.view.frame.size.height))
        MedicationManagementNotebookView.MedicationManagementView.backgroundColor = #colorLiteral(red: 0.1356676817, green: 0.7028286457, blue: 0.8024563789, alpha: 1)
//        BloodSugarManagementNotebookView.FastingBloodSugar.layer.borderWidth = 1
//        ObesityManagementNotebookView.bmiGraphVIew.layer.cornerRadius = 8
        scrollView.addSubview(MedicationManagementNotebookView.MedicationManagementView)
        
        
    
        
        MedicationManagementNotebookView.MedicationManagementViewIcon = UIImageView(frame: CGRect(x: self.view.frame.size.width / 2.4, y: 50, width: 100, height: 100))
        MedicationManagementNotebookView.MedicationManagementViewIcon.image = UIImage(systemName: "heart")
        
        scrollView.addSubview(MedicationManagementNotebookView.MedicationManagementViewIcon)
        
        
        MedicationManagementNotebookView.MedicationManagementViewHowNum = UILabel(frame: CGRect(x: 20, y: MedicationManagementNotebookView.MedicationManagementViewIcon.frame.maxY + 5, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 13))
        MedicationManagementNotebookView.MedicationManagementViewHowNum.text = "한 달간 복약 0%를 달성하렸습니다."
        MedicationManagementNotebookView.MedicationManagementViewHowNum.textAlignment = .center
        MedicationManagementNotebookView.MedicationManagementViewHowNum.font = UIFont.systemFont(ofSize: 22)
//        MedicationManagementNotebookView.MedicationManagementViewHowNum.layer.borderWidth = 1
        
        scrollView.addSubview(MedicationManagementNotebookView.MedicationManagementViewHowNum)
        
        
        var underNumLabel = UILabel(frame: CGRect(x: 20, y: MedicationManagementNotebookView.MedicationManagementViewHowNum.frame.maxY + 5, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 12))
        underNumLabel.text = "성공적인 치료를 위해서는\n 꾸준한 약물 복용이 중요합니다."
        underNumLabel.numberOfLines = 0
        underNumLabel.textAlignment = .center
//        underNumLabel.layer.borderWidth = 1
        underNumLabel.font = UIFont.systemFont(ofSize: 15)
        
        scrollView.addSubview(underNumLabel)
        
        
        
        MedicationManagementNotebookView.MedicationManagementBTN = UIButton(frame: CGRect(x: 80, y: underNumLabel.frame.maxY + 10, width: self.view.frame.size.width - 160, height: self.view.frame.size.height / 13))
        MedicationManagementNotebookView.MedicationManagementBTN.setTitle("복약 알림 설정", for: .normal)
        MedicationManagementNotebookView.MedicationManagementBTN.setTitleColor(.white, for: .normal)
        MedicationManagementNotebookView.MedicationManagementBTN.layer.borderWidth = 1
        MedicationManagementNotebookView.MedicationManagementBTN.layer.cornerRadius = 8
        
        
        
        
        MedicationManagementNotebookView.MedicationManagementBTN.addTarget(self, action: #selector(addButtonPressed(button: )), for: .touchUpInside)
        
        scrollView.addSubview(MedicationManagementNotebookView.MedicationManagementBTN)
        
        drugManagerView = DrugManageView(frame: CGRect(x: 0, y: MedicationManagementNotebookView.MedicationManagementBTN.frame.maxY - 20, width: SCREEN.WIDTH, height: 700))
        drugManagerView.backgroundColor = .clear
        
        
        
        
        MedicationManagementNotebookView.MedicationManagementView.addSubview(drugManagerView)
        
        
        
        
        
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: menuView.frame.maxY).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: MedicationManagementNotebookView.MedicationManagementView.bottomAnchor, constant: 150).isActive = true
        
        
        MedicationManagementWebView.isHidden = false
        MedicationManagementNotebookView.isHidden = true
        registerdDrugListView.isHidden = true
    }
    
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
              
            moveSelected(view: UnderBar, button: button1)
                
            })
            MedicationManagementWebView.isHidden = false
            MedicationManagementNotebookView.isHidden = true
            registerdDrugListView.isHidden = true
        } else if sender.tag == 1 {
            UIView.animate(withDuration: 0.5, animations: { [self] in
              
            moveSelected(view: UnderBar, button: button2)
                
            })
            MedicationManagementWebView.isHidden = true
            MedicationManagementNotebookView.isHidden = false
            drugManagerView.calendarView.dataUpdate()
            registerdDrugListView.isHidden = true
        } else if sender.tag == 2 {
            UIView.animate(withDuration: 0.5, animations: { [self] in
              
            moveSelected(view: UnderBar, button: button3)
                
            })
            MedicationManagementWebView.isHidden = true
            MedicationManagementNotebookView.isHidden = true
            registerdDrugListView.isHidden = false
            self.registerdDrugListView.dataUpdate()
        }
    }
    
    
}
