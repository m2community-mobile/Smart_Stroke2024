//
//  RightView.swift
//  KSR
//
//  Created by m2comm on 2018. 7. 10..
//  Copyright © 2018년 m2community. All rights reserved.
//

import UIKit
//[ARRAY,TITLE]

struct MainViewOfRightViewData {
    static let KEY_ARRAY = "ARRAY"
    static let KEY_TITLE = "TITLE"
    
    static let MainViewOfRightViewDataArray = [
        [
            [MainViewOfRightViewData.KEY_TITLE : "급성기 뇌졸중"],
            [MainViewOfRightViewData.KEY_TITLE : "위험인자",
             MainViewOfRightViewData.KEY_ARRAY : ["뇌졸중 위험인자","고혈압","당뇨병","고지혈증","심방세동","흡연","음주","비만"]],
            [MainViewOfRightViewData.KEY_TITLE : "응급처치"],
            [MainViewOfRightViewData.KEY_TITLE : "뇌졸중의 치료",
             MainViewOfRightViewData.KEY_ARRAY : ["뇌졸중의 치료","혈전용해술","약물치료","재활치료"]],
            [MainViewOfRightViewData.KEY_TITLE : "환자 관리",
             MainViewOfRightViewData.KEY_ARRAY : ["뇌졸중 식이요법","비만 관리 및 운동","뇌졸중 후 치매","뇌졸중 후 우울증","장기요양소견 및 뇌병변 장애등급"]]
        ],
        [
            [MainViewOfRightViewData.KEY_TITLE : "뇌졸중 관리"],
            [MainViewOfRightViewData.KEY_TITLE : "혈압"],
            [MainViewOfRightViewData.KEY_TITLE : "당뇨"],
            [MainViewOfRightViewData.KEY_TITLE : "이상지질혈증"],
            [MainViewOfRightViewData.KEY_TITLE : "비만관리 및 운동"],
            [MainViewOfRightViewData.KEY_TITLE : "약물복용관리"]
        ]
    ]
    
}


class RightView: UIView, TopBarDelegate,  MainViewOfRightViewDelegate {

    convenience init() {
        self.init(frame: SCREEN.BOUND)
    }
    
    var mainView : MainViewOfRightView!
    
    var leftButtons = [LeftButton]()
    let leftButtonImageName = ["sub_know_","sub_note_","sub_notice_"]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        self.frame.origin.x = SCREEN.WIDTH
        self.alpha = 0
        
        let topBar = TopBar()
        topBar.leftImageView.image = #imageLiteral(resourceName: "btn_home")
        topBar.rightImageView.image = #imageLiteral(resourceName: "btn_closed")
        topBar.delegate = self
        topBar.navigationBar.backgroundColor = UIColor(red: 59/255, green: 77/255, blue: 91/255, alpha: 1)
        topBar.statusBar.backgroundColor = UIColor(red: 59/255, green: 77/255, blue: 91/255, alpha: 1)
        self.addSubview(topBar)
        
        topBar.addRightButton2()
        topBar.rightImageView2?.image = #imageLiteral(resourceName: "btn_w_logour")
        
        
        let leftView = UIScrollView(frame: CGRect(x: 0, y:  topBar.frame.maxY, width: 70, height: SCREEN.HEIGHT - topBar.frame.maxY))
        leftView.backgroundColor = UIColor(red: 84/255, green: 153/255, blue: 244/255, alpha: 1)
        self.addSubview(leftView)
        
        mainView = MainViewOfRightView(frame: CGRect(x: leftView.frame.maxX, y: leftView.frame.origin.y, width: SCREEN.WIDTH - leftView.frame.size.width, height: leftView.frame.size.height))
        mainView.backgroundColor = UIColor.white
        mainView.delegate = self
        self.addSubview(mainView)
        
        
        let buttonHeight : CGFloat = 100
        
        for i in 0..<leftButtonImageName.count {
            let leftButton = LeftButton(frame: CGRect(x: 0, y: CGFloat(i) * buttonHeight, width: 70, height: buttonHeight))
            leftButton.tag = i
            leftButton.buttonImageView.image = UIImage(named: "\(leftButtonImageName[i])off")
            leftButton.addTarget(self, action: #selector(leftViewButtonPressed(button:)), for: .touchUpInside)
            leftView.addSubview(leftButton)
            leftButtons.append(leftButton)
        }

        self.leftViewButtonPressed(button: self.leftButtons[0])
        
        

    }
    
    func rightButton2Pressed(button: UIButton) {
        
        let alertCon = UIAlertController(title: "로그아웃", message: "로그아웃 하시겠습니까?", preferredStyle: .alert)
        alertCon.addAction(UIAlertAction(title: "로그아웃", style: .default, handler: { (action) in
            userD.removeObject(forKey: USER_KEY.KSR_REGISTRATION_NUMBER)
            userD.synchronize()
            DispatchQueue.main.async {
//                appDel.mainVC?.navigationController?.popToRootViewController(animated: false)
                sceneDel?.mainVC?.navigationController?.popToRootViewController(animated: false)
                self.close()
            }
        }))
        alertCon.addAction(UIAlertAction(title: "취소", style: .cancel, handler: { (action) in
            
        }))
//        appDel.mainVC?.navigationController?.present(alertCon, animated: true, completion: {
        sceneDel!.mainVC?.navigationController?.present(alertCon, animated: true, completion: {
            
        })
        
        
        
    }
    
    var seletedLeftButtonIndex = 0
    @objc func leftViewButtonPressed(button : LeftButton){
        
        let index = button.tag
        
        self.seletedLeftButtonIndex = index
        print("self.seletedLeftButtonIndex:\(self.seletedLeftButtonIndex)")
        
        if index != 2 {
            self.mainView.dataUpdate(arrayIndex: index)
        }else{
            let knowVC = KnowViewController()

            knowVC.titleString = "공지사항"
//            knowVC.urlString = "http://ksrapp.m2comm.co.kr/bbs/list.php"
            knowVC.urlString = "http://www.strokedb.or.kr/app/bbs/list.asp"
//            appDel.mainVC?.navigationController?.popToRootViewController(animated: false)
//            appDel.mainVC?.navigationController?.pushViewController(knowVC, animated: false)
            sceneDel!.mainVC?.navigationController?.popToRootViewController(animated: false)
            sceneDel!.mainVC?.navigationController?.pushViewController(knowVC, animated: false)
            self.close()
        }
        
        for i in 0..<self.leftButtons.count {
            let targetButton = self.leftButtons[i]
            if targetButton == button {
                targetButton.buttonImageView?.image = UIImage(named: "\(leftButtonImageName[i])on")
            }else{
                targetButton.buttonImageView?.image = UIImage(named: "\(leftButtonImageName[i])off")
            }
        }
    }
    
    //MARK: tableViewDelegate
    func tableView(tableView: MainViewOfRightView, didCellSelectedIndexPath indexPath: IndexPath) {
        //?/
        print("rightView didCellSelectedIndexPath:\(indexPath)")
//        appDel.mainVC?.navigationController?.popToRootViewController(animated: false)
//        appDel.goToKnowViewCon2(indexPath: indexPath, isAnimate: false)
        sceneDel!.mainVC?.navigationController?.popToRootViewController(animated: false)
        sceneDel!.goToKnowViewCon2(indexPath: indexPath, isAnimate: false)
        self.close()
    }
    
    func tableView(tableView: MainViewOfRightView, didHeaderSelectedIndex index: Int) {
        print("rightView didHeaderSelectedIndex:\(index)")

        if seletedLeftButtonIndex == 0 {
//            appDel.mainVC?.navigationController?.popToRootViewController(animated: false)
//            appDel.goToKnowViewCon(index: index, isAnimate: false)
            sceneDel!.mainVC?.navigationController?.popToRootViewController(animated: false)
            sceneDel!.goToKnowViewCon(index: index, isAnimate: false)
            self.close()
        }else{
//            appDel.mainVC?.navigationController?.popToRootViewController(animated: false)
            sceneDel!.mainVC?.navigationController?.popToRootViewController(animated: false)
            

            switch index {
            case 0:
//                let strokeManagementVC = StrokeManagementViewController()
//                appDel.mainVC?.navigationController?.pushViewController(strokeManagementVC, animated: false)
                break
            case 1:
//                let bloodPressureVC = BloodPressureViewController()
//                appDel.mainVC?.navigationController?.pushViewController(bloodPressureVC, animated: false)
                break
            case 2:
//                let bloodSugarVC = BloodSugarViewController()
//                appDel.mainVC?.navigationController?.pushViewController(bloodSugarVC, animated: false)
                break
            case 3:
//                let dyslipidemiaVC = DyslipidemiaViewController()
//                appDel.mainVC?.navigationController?.pushViewController(dyslipidemiaVC, animated: false)
                break
            case 4:
//                let obesityVC = ObesityViewController()
//                appDel.mainVC?.navigationController?.pushViewController(obesityVC, animated: false)
                break
            case 5:
//                let drugManagementVC = DrugManagementViewController()
//                appDel.mainVC?.navigationController?.pushViewController(drugManagementVC, animated: false)
                break
            default:
                break
            }
            self.close()
        }
        
    }
    
    func leftButtonPressed(button: UIButton) {
//        appDel.goHome()
        sceneDel!.goHome()
        
        self.close()
    }
    
    func rightButtonPressed(button: UIButton) {
        self.close()
    }
    
//    func open() {
//
//        appDel.mainVC?.navigationController?.viewControllers.last?.view.endEditing(true)
//
//        self.leftViewButtonPressed(button: self.leftButtons[0])
//        self.mainView.selectedIndex = -1
//        self.mainView.tableView.reloadData()
//
//        //?/
//        if let _ = userD.object(forKey: USER_KEY.KSR_REGISTRATION_NUMBER) as? String {
//            self.leftButtons[2].frame.origin.y = 200
//        }else{
//            self.leftButtons[2].frame.origin.y = 100
//        }
//
//        UIView.animate(withDuration: 0.4, animations: {
//            self.frame.origin.x = 0
//            self.alpha = 1
//        }) { (fi : Bool) in
//
//        }
//    }
    
    func open( isManage : Bool = true) {
        
//        appDel.mainVC?.navigationController?.viewControllers.last?.view.endEditing(true)
        sceneDel!.mainVC?.navigationController?.viewControllers.last?.view.endEditing(true)
        
        if isManage {
            self.leftViewButtonPressed(button: self.leftButtons[1])
        }else{
            self.leftViewButtonPressed(button: self.leftButtons[0])
        }
        
        self.mainView.selectedIndex = -1
        self.mainView.tableView.reloadData()
        
        //?/
        if let _ = userD.object(forKey: USER_KEY.KSR_REGISTRATION_NUMBER) as? String {
            self.leftButtons[2].frame.origin.y = 200
        }else{
            self.leftButtons[2].frame.origin.y = 100
        }
        
        UIView.animate(withDuration: 0.4, animations: {
            self.frame.origin.x = 0
            self.alpha = 1
        }) { (fi : Bool) in
            
        }
    }
    
    @objc func close(){
        UIView.animate(withDuration: 0.4, animations: {
            self.frame.origin.x = SCREEN.WIDTH
            self.alpha = 0
        }) { (fi : Bool) in
            
        }
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    class LeftButton: UIButton {
        
        var buttonImageView : UIImageView!
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            self.buttonImageView = UIImageView(frame: self.bounds)
            self.addSubview(self.buttonImageView)
            
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
}
