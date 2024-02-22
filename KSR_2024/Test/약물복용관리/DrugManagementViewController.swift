//
//  DrugManagementViewController.swift
//  KSR
//
//  Created by m2comm on 2018. 6. 26..
//  Copyright © 2018년 m2community. All rights reserved.
//

import UIKit

class DrugManagementViewController: UIViewController
,TopBarDelegate, SegmentedViewDelegate, RegisterdDrugListTopViewDelegate
{

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    var topBar : TopBar!
    
    var drugInfoView : WebView!
    var drugManageView : DrugManageView!
    var registerdDrugListView : RegisterdDrugListView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if self.registerdDrugListView.isHidden == false {
            self.registerdDrugListView.dataUpdate()
        }
        
        if self.drugManageView.isHidden == false {
            self.drugManageView.calendarView.dataUpdate()
        }
        
        self.drugManageView.calendarView.calendarViewWithManage.updateFirstAlramDB()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        appDel.drugManagementVC = self
        sceneDel!.drugManagementVC = self
        
        self.view.backgroundColor = UIColor.white
        
        self.topBar = TopBar()
        topBar.titleLabel.text = "약물복용관리"
        topBar.titleLabel.textAlignment = .left
        topBar.leftImageView.image = #imageLiteral(resourceName: "btn_b_back").withRenderingMode(.alwaysTemplate)
        topBar.leftImageView.tintColor = UIColor.white
        topBar.delegate = self
        topBar.rightImageView.image = #imageLiteral(resourceName: "btn_menu").withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
        topBar.rightImageView.tintColor = UIColor.white
        self.view.addSubview(topBar)
        
        let segView = SegmentedView()
        segView.frame.origin.y = topBar.frame.maxY
        segView.addItems(titles: ["약물복용 도움말","약물 복용관리","약물 등록 리스트"])
        segView.delegate = self
        self.view.addSubview(segView)
        
        self.drugInfoView = WebView(frame: CGRect(
            x: 0,
            y: segView.frame.maxY,
            width: SCREEN.WIDTH,
            height: SCREEN.HEIGHT - segView.frame.maxY), urlString: WebViewURL.MANAGEMENT.DRUG_MANAGEMENT)
        self.view.addSubview(self.drugInfoView)
        
        self.registerdDrugListView = RegisterdDrugListView(frame: CGRect(
            x: 0,
            y: segView.frame.maxY,
            width: SCREEN.WIDTH,
            height: SCREEN.HEIGHT - segView.frame.maxY - SAFE_AREA))
        self.registerdDrugListView.topView.delegate = self
        self.registerdDrugListView.drugManagementVC = self
        self.view.addSubview(self.registerdDrugListView)

        self.drugManageView = DrugManageView(frame: CGRect(
            x: 0,
            y: segView.frame.maxY,
            width: SCREEN.WIDTH,
            height: SCREEN.HEIGHT - segView.frame.maxY - SAFE_AREA))
        self.drugManageView.topView.delegate = self
        self.view.addSubview(self.drugManageView)
        
        segView.itemButtonPressed(button: segView.itemButtons[1])
//        self.segButtonPressed(index: 0)
    }
    
    
    
    func rightButtonPressed(button: UIButton) {
//        appDel.rightView?.open()
        sceneDel!.rightView?.open()
    }
    
    //MARK:RegisterdDrugListTopViewDelegate
    func addButtonPressed(button: UIButton) {
        
        
        
        print("tap")
        
        let drugRegisterViewController = DrugRegisterViewController()
        drugRegisterViewController.modalPresentationStyle = .fullScreen
        self.present(drugRegisterViewController, animated: true) {
            
        }
    }
    
    func leftButtonPressed(button: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }

    func segButtonPressed(index : Int) {
        
        self.drugInfoView.isHidden = true
        self.drugManageView.isHidden = true
        self.registerdDrugListView.isHidden = true
        
        if index == 0 {
            self.drugInfoView.isHidden = false
            self.drugInfoView.reloading()
        }else if index == 1 {
            self.drugManageView.isHidden = false
            self.drugManageView.calendarView.dataUpdate()
        }else if index == 2{
            self.registerdDrugListView.isHidden = false
            self.registerdDrugListView.dataUpdate()
        }
        
    }
    
}
