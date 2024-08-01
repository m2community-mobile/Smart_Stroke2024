//
//  RegisterdDrugListView.swift
//  KSR
//
//  Created by m2comm on 2018. 6. 26..
//  Copyright © 2018년 m2community. All rights reserved.
//

//약물복용 관리 뷰

import UIKit
import RealmSwift
import SQLite3


var my: String!

class RegisterdDrugListView: UIView
,UITableViewDataSource, UITableViewDelegate, RegisterdDrugListTopViewDelegate
    ,DrugRegisterTableViewCellDelegate
{
    
    
//1
//    var drugManagementVC : DrugManagementViewController?
    
    
    
   //2
    var drugManagementVC : MedicationManagementViewController?
//    var drugManagementVC2 : MedicationManagementViewController2?
//    var drugManagementVC3 : MedicationManagementViewController3?
    
    
    
    var topView : RegisterdDrugListTopView!
    
    var drugRegisterTableView : UITableView!
    
 
    
    
    
    
//    let cellSpacingHeight: CGFloat = 50
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = #colorLiteral(red: 0.1337758601, green: 0.7149671912, blue: 0.7978705764, alpha: 1)
//        self.backgroundColor = .clear
        
        let localrealm = try! Realm()
        
        
        
        
        self.setGradient2(color1: UIColor(red: 35.0 / 255.0, green: 207.0 / 255.0, blue: 193.0 / 255.0, alpha: 1), color2: UIColor(red: 35.0 / 255.0, green: 173.0 / 255.0, blue: 207 / 255.0, alpha: 1))
        
        
        self.topView = RegisterdDrugListTopView()
        self.topView.delegate = self
        self.addSubview(self.topView)
        
        appDel.topView2 = self.topView
//        sceneDel?.topView2 = self.topView

        drugRegisterTableView = UITableView(frame: CGRect(x: 15, y: self.topView.frame.maxY + 180, width: SCREEN.WIDTH - 30, height: self.frame.size.height - self.topView.frame.maxY))
        
        if IS_IPHONE_12PRO_MAX {
            drugRegisterTableView = UITableView(frame: CGRect(x: 15, y: self.topView.frame.maxY + 200, width: SCREEN.WIDTH - 30, height: self.frame.size.height - self.topView.frame.maxY))
        }
        
        if IS_IPHONE_15PRO_MAX {
            drugRegisterTableView = UITableView(frame: CGRect(x: 15, y: self.topView.frame.maxY + 200, width: SCREEN.WIDTH - 30, height: self.frame.size.height - self.topView.frame.maxY))
        }
        
        drugRegisterTableView.delegate = self
        drugRegisterTableView.dataSource = self
        
        
        drugRegisterTableView.register(DrugRegisterTableViewCell.self, forCellReuseIdentifier: "DrugRegisterTableViewCell")
        drugRegisterTableView.register(DrugRegisterTableViewDrugListCell.self, forCellReuseIdentifier: "DrugRegisterTableViewDrugListCell")
        
        drugRegisterTableView.layer.cornerRadius = 8
        
//        drugRegisterTableView.separatorStyle = .none
        drugRegisterTableView.translatesAutoresizingMaskIntoConstraints = false
        drugRegisterTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 400, right: 0)
        
//        drugRegisterTableView.contentInset.bottom = 81

        drugRegisterTableView.backgroundColor = .clear
        

        
                
        
        
        
//        drugRegisterTableView.backgroundColor = .white
        if #available(iOS 15.0, *) {
            drugRegisterTableView.sectionHeaderTopPadding = 1
                }
       

        
        drugRegisterTableView.separatorColor = UIColor(white: 217/255, alpha: 1)
        self.addSubview(drugRegisterTableView)
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()

//        drugRegisterTableView.frame = drugRegisterTableView.frame.inset(by: UIEdgeInsets(top: 16.0, left: 16, bottom: 16, right: 16))
    }
    
    
    
    
    
//    var alramList = [AlramInfo]()
//    lazy var alramList : Results<Alram_R> = {
//        return RealmCenter.shared.realm.objects(Alram_R.self)
//    }()
    var alramList = [Alram_R]()
    var mysq = [MYSQ]()
    
    func dataUpdate(){
        self.alramList = [Alram_R]()
        
        
        ///이거 주석시 등록리스트 등록 안됨
        
        
        
        
        
        for key in ALRAM_KEY.KEYS {
            let alrams = RealmCenter.shared.realm.objects(Alram_R.self).filter("alramKey==%@", key);
                       print("alram --> \(alrams)")
           
                       if alrams.count > 0 {
                           for alram in alrams {
           
                               alramList.append(alram)
           
                           }
           
           
           
                       }
//            if let alram = RealmCenter.shared.realm.objects(Alram_R.self).filter("alramKey==%@", key).last {
//                
//                alramList.append(alram)
//            }
//            

            
            
            
            
            
            
//            if let alram = RealmCenter.shared.realm.objects(Alram_R.self).filter("alramKey!=%@", key).last {
//                
//                alramList.append(alram)
//            }
            
        }
        
        ////
        
        self.drugRegisterTableView.reloadData()
    }
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//
//        drugRegisterTableView.frame = drugRegisterTableView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
//    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row % 2 == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "DrugRegisterTableViewCell", for: indexPath) as! DrugRegisterTableViewCell
//            
//            cell.delegate = self
//
            
//
//            cell.frame = cell.frame.inset(by: UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0))
//            
////            cell.separatorInset = UIEdgeInsets.zero
//            
//            
//            let newIndex = (indexPath.row / 2)
//
//            let alram = self.alramList[newIndex]
//
            cell.backgroundColor = .clear
            
//            cell.backgroundColor = .yellow
//            cell.frame = cell.frame.inset(by: UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0))
            
            
            
            
            
//            var hour = alram.hour
//            var amplString = ""
//            if hour <= 12 {
//                amplString = "오전"
//            }else{
//                amplString = "오후"
//                hour -= 12
//            }
//
//            cell.labelUpdate(ampmString: amplString, timeString: String(format: "%02d:%02d",hour,alram.minute))
//            cell.switchButton.isOn = alram.isAlram
//
//            cell.switchButton.tag = newIndex
//            cell.editButton.tag = newIndex
//            cell.deleteButton.tag = newIndex
            cell.selectionStyle = .none
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "DrugRegisterTableViewDrugListCell", for: indexPath) as! DrugRegisterTableViewDrugListCell
            
            
            
            
            
            
            
            
            cell.frame = cell.frame.inset(by: UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0))
            cell.backgroundColor = .white
            
                      

            cell.delegate = self


            cell.frame = cell.frame.inset(by: UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0))

//            cell.separatorInset = UIEdgeInsets.zero


            let newIndex = (indexPath.row / 2)
            
         

            let alram = self.alramList[newIndex]

            var idx = alram.idx //
            
            var hour = alram.hour
            var amplString = ""
            
            if hour <= 12 {
                amplString = "오전"
            }else{
                amplString = "오후"
                hour -= 12
            }
            

//            cell.labelUpdate(ampmString: amplString, timeString: String(format: "%02d:%02d",hour,alram.minute))
            cell.labelUpdate(ampmString: amplString, timeString: String(format: "%02d:%02d",hour,alram.minute), hiddenLabel: "\(idx)")
            
            
            
            
            cell.switchButton.isOn = alram.isAlram

            cell.switchButton.tag = newIndex
            cell.editButton.tag = newIndex
            cell.deleteButton.tag = newIndex
            cell.frame.origin.y = 20
            
            
            
            
//            let newIndex = (indexPath.row / 2)
//            cell.separatorInset = UIEdgeInsets.zero
//            cell.separatorInset = .init(top: 0, left: 0, bottom: 20, right: 0) // <-
//               cell.translatesAutoresizingMaskIntoConstraints = false
            
            
            
            for drugComponnentView2 in cell.drugComponnentView2s {
                // 약 이름 위치
                drugComponnentView2.removeFromSuperview()
            }

//            let alram = self.alramList[newIndex]

            let drugs = alram.kindOfDrugs.filter("isCheck=true")
            //약 갯수에 따른 높이
            for i in 0..<drugs.count {
                let drug = drugs[i]
                let drugComponnentView2 = DrugComponnentView2(frame: CGRect(x: 0, y: 15 + (CGFloat(i) * (17 + 13)), width: self.frame.size.width / 2.5, height: 17), drug: drug)
                cell.addSubview(drugComponnentView2)
//                cell.frame = cell.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
                
                
                
                cell.drugComponnentView2s.append(drugComponnentView2)
                
                
//                cell.frame = cell.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 500, right: 0))
                
            }
            cell.selectionStyle = .none
            
            return cell
        }
        
    }
//    // 각 Section 사이의 간격 설정
//     func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//         return 10
//     }
    
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        let my = UIView(frame: CGRect(x: 15, y: 0, width: SCREEN.WIDTH - 30, height:20))
//        
//        return my
//    }
    
//    // Set the spacing between sections
//        func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//            return 20
//        }
    
    
//     func numberOfSections(in tableView: UITableView) -> Int {
//        return 10
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        print("asdasdasdasdas\(self.alramList.count * 2)")
        
        
        
        
        return self.alramList.count * 2
//        return mysq.count
        
        
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        
        print("call db")
        if indexPath.row % 2 == 0 {
//            return DrugRegisterTableViewCell.height
            return 10
        }
        else{
            let newIndex = (indexPath.row / 2)
            let info = self.alramList[newIndex]
            
            let drugs = info.kindOfDrugs.filter("isCheck=true")
            if drugs.count > 0 {
                return CGFloat(drugs.count * (17 + 13)) + 15 + 15 + 50
            }else{
                return 0
            }
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        tableView.layoutMargins = UIEdgeInsets.zero
        cell.separatorInset = UIEdgeInsets.zero
        cell.layoutMargins = UIEdgeInsets.zero
        
        
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK:DrugRegisterTableViewCellDelegate
    func deleteButtonPressed(button: UIButton) {
        
        
        print("herejklsadjasl")
        
        let targetAlram = self.alramList[button.tag]
        
        
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["\(targetAlram.idx)"])
        UNUserNotificationCenter.current().removeDeliveredNotifications(withIdentifiers: ["\(targetAlram.idx)"])
        
        
        

        
        
        
        
        
        
        print("ccc targetAlram\(targetAlram)")
        print("ccc \(targetAlram.idx)")
        
        if let dayComponent = RealmCenter.shared.realm.objects(DayComponentOfDrug_R.self).filter("alramIdx==%@", targetAlram.idx).first {
            RealmCenter.shared.write(doSomething: { (realm) in
                realm.delete(dayComponent)
                
            }) { (success : Bool, error : String?) in
                
            }
        }
    
        
//        targetAlram.isAlram = false
        
        RealmCenter.shared.write(doSomething: { (realm) in
            realm.delete(targetAlram)
            
        }) { (success : Bool, error : String?) in
            if success {
                self.dataUpdate()
            }
        }
        
//        AlramCenter.shared.removeAlramFromNoti(info: self.alramList[button.tag])
    }
    
    func editButtonPressed(button: UIButton) {

        
        
//        let info = self.alramList[button.tag]
//
//        let drugRegisterVC = DrugRegisterViewController()
//        drugRegisterVC.myAlramInfo = info
//        self.drugManagementVC?.present(drugRegisterVC, animated: true, completion: {
//
//        })

        
        
        let alram = self.alramList[button.tag]
        
        let drugRegisterVC = DrugRegisterViewController()
        drugRegisterVC.myAlram = alram
        
        drugRegisterVC.modalPresentationStyle = .fullScreen
        
        
        
        self.drugManagementVC?.present(drugRegisterVC, animated: true, completion: {
            
        })
        
        
        
        
    }
    
    
    
    func switchButtonValueChanged(switchButton: UISwitch) {
        
        let alram = self.alramList[switchButton.tag]
        RealmCenter.shared.write(doSomething: { (realm) in
            alram.isAlram = !alram.isAlram
            realm.add(alram)
        }) { (success, error) in
            if success {
                AlramCenter_R.shared.updateAlram(alram: alram, complete: { (success) in
                    if success {
                        print("알람 온오프 성공")
                        DispatchQueue.main.async {
                            self.dataUpdate()
                        }
                    }else{
                        DispatchQueue.main.async {
                            toastShow(message: "알람 변경에 실패하였습니다.\n잠시 후 다시 시도해주세요.")
                            switchButton.isOn = !switchButton.isOn
                        }
                    }
                })
            }else{
                DispatchQueue.main.async {
                    toastShow(message: "알람 변경에 실패하였습니다.\n잠시 후 다시 시도해주세요.")
                    switchButton.isOn = !switchButton.isOn
                }
            }
        }
        
        
//        var info = self.alramList[switchButton.tag]
//        info.isAlram = switchButton.isOn
//        AlramCenter.shared.addAlramToNoti(info: info) { (success : Bool) in
//            if success {
//                print("변경 성공")
//            }else{
//                toastShow(message: "알람 변경에 실패하였습니다.\n잠시 후 다시 시도해주세요.")
//                switchButton.isOn = !switchButton.isOn
//            }
//            DispatchQueue.main.async {
//                self.dataUpdate()
//            }
//        }
        
        
    }
    
    
    
}



@objc protocol RegisterdDrugListTopViewDelegate {
    @objc optional func addButtonPressed( button : UIButton )
}


// 한달간 복약 라벨 뷰
class RegisterdDrugListTopView: UIView {
    
    convenience init() {
        self.init(frame: CGRect(x: 0, y: 0, width: SCREEN.WIDTH, height: 75))
    }
    
    var delegate : RegisterdDrugListTopViewDelegate?
    var bu: UIButton!
    var label : UILabel!
    var addButton : UIButton!
    var myLabel: UILabel!
    var myImage : UIImageView!
    private override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        
        
//        self.backgroundColor = UIColor(red: 241/255, green: 247/255, blue: 255/255, alpha: 1)
//        self.backgroundColor = .yellow
        
        
        
        
         myImage = UIImageView(frame: CGRect(x: self.frame.size.width / 2.6, y: 30, width: 50, height: 50))
        
        if IS_IPHONE_12PRO_MAX {
            myImage = UIImageView(frame: CGRect(x: self.frame.size.width / 2.5, y: 30, width: 75, height: 75))
        }
        
        if IS_IPHONE_15PRO_MAX {
            myImage = UIImageView(frame: CGRect(x: self.frame.size.width / 2.5, y: 30, width: 75, height: 75))
        }
        
        if IS_IPHONE_12PRO {
            myImage = UIImageView(frame: CGRect(x: self.frame.size.width / 2.3, y: 30, width: 60, height: 60))
        }
        if IS_IPHONE_15PRO {
            myImage = UIImageView(frame: CGRect(x: self.frame.size.width / 2.3, y: 30, width: 60, height: 60))
        }
        
        if IS_IPHONE_N {
            myImage = UIImageView(frame: CGRect(x: self.frame.size.width / 2.3, y: 30, width: 60, height: 60))
        }
        
        
        
            
        
         
        
        myImage.image = UIImage(named: "eat")
        
        self.addSubview(myImage)
        
        
        myLabel = UILabel(frame: CGRect(x: 20, y: myImage.frame.maxY, width: self.frame.size.width - 40, height: 90))
//        myLabel.text = "한 달간 복약 0%를 달성하였습니다."
        myLabel.textAlignment = .center
        
        myLabel.font = UIFont(name: "SUITE-Regular", size: 22)
        myLabel.textColor = .white
//        myLabel.font = UIFont.systemFont(ofSize: 22)
//        myLabel.layer.borderWidth = 1
        
        self.addSubview(myLabel)
        
        
        var mySub = UILabel(frame: CGRect(x: 20, y: myLabel.frame.maxY + 5, width: self.frame.size.width - 40, height: 70))
        mySub.text = "성공적인 치료를 위해서는\n 꾸준한 약물 복용이 중요합니다."
        mySub.numberOfLines = 0
        mySub.textAlignment = .center
//        mySub.layer.borderWidth = 1
        mySub.font = UIFont(name: "SUITE-Regular", size: 15)
        mySub.textColor = .white
        mySub.font = UIFont.systemFont(ofSize: 15)
        
//        self.addSubview(mySub)
        
        
        
        
        
        
        
        
//        self.bu = UIButton(frame: CGRect(x: 80, y: mySub.frame.maxY + 15, width: self.frame.size.width - 160, height: 40))
//        
//        bu.setTitle("        복약 알림 설정", for: .normal)
//        bu.setTitleColor(.white, for: .normal)
//        bu.backgroundColor = #colorLiteral(red: 0.09397112578, green: 0.4878631234, blue: 0.5656062961, alpha: 1)
//        bu.layer.cornerRadius = 8
//        bu.addTarget(self, action: #selector(hmm(_ :)), for: .touchUpInside)
//        self.addSubview(bu)
//        var plView = UIImageView()
//        
////        var plView = UIImageView()
//        
////        MedicationManagementNotebookView.MedicationManagementBTN.setImage(UIImage(named: "plust"), for: .normal)
//        if IS_IPHONE_N_PLUS {
//            plView = UIImageView(frame: CGRect(x: bu.frame.size.width / 3.7, y: 8, width: 20, height: 20))
//        } else if IS_IPHONE_X {
//            plView = UIImageView(frame: CGRect(x: bu.frame.size.width / 4.3, y: 8, width: 20, height: 20))
//        } else if IS_IPHONE_N {
//            plView = UIImageView(frame: CGRect(x: bu.frame.size.width / 4.1, y: 8, width: 15, height: 15))
//        } else {
//            plView = UIImageView(frame: CGRect(x: bu.frame.size.width / 3.7, y: 8, width: 20, height: 20))
//        }
//        
//        bu.addSubview(plView)
//        
//        var imagePl = UIImage()
//        imagePl = UIImage(named: "plust")!
//        
//        plView.image = imagePl
        
        
        
        
        
        
        
        
        
        
        
        self.label = UILabel(frame: CGRect(
            x: -10,
            y: 100,
            width: 400,
            height: 100))
        self.label.numberOfLines = 0
        self.label.backgroundColor = UIColor.clear
        self.label.textAlignment = .center
        self.label.center.x = SCREEN.WIDTH / 2
//        self.addSubview(self.label)
        
        if IS_IPHONE_N {
            self.label = UILabel(frame: CGRect(
                x: -10,
                y: 57,
                width: 400,
                height: 150))
            self.label.numberOfLines = 0
            self.label.backgroundColor = UIColor.clear
            self.label.textAlignment = .center
            self.label.center.x = SCREEN.WIDTH / 2
        }
        self.addSubview(self.label)
        //sample
        //?///?/
//        self.labelStringUpdate(valueString: "0%")
//        self.labelStringUpdate2(valueString: "0%")
        
        
        
        
        
        
       
        
        
        
        
        self.addButton = UIButton(frame: CGRect(x: 0, y: 0, width: 80, height: 47.5))
        self.addButton.frame.origin.x = SCREEN.WIDTH - 80 - 12.5
        self.addButton.center.y = self.frame.size.height / 2
        self.addButton.addTarget(self, action: #selector(addButtonPressed(button:)), for: .touchUpInside)
        self.addSubview(self.addButton)
        
        let roundBack1 = UIView(frame: CGRect(
            x: 0,
            y: 0,
            width: self.addButton.frame.size.width * 0.6,
            height: self.addButton.frame.size.height * 0.6))
        roundBack1.layer.cornerRadius = 10
        roundBack1.backgroundColor = UIColor(red: 48/255, green: 91/255, blue: 201/255, alpha: 1)
        roundBack1.isUserInteractionEnabled = false
//        self.addButton.addSubview(roundBack1)
        
        let roundBack2 = UIView(frame: CGRect(
            x: self.addButton.frame.size.width * 0.4,
            y: self.addButton.frame.size.height * 0.4,
            width: self.addButton.frame.size.width * 0.6,
            height: self.addButton.frame.size.height * 0.6))
        roundBack2.layer.cornerRadius = 10
        roundBack2.backgroundColor = UIColor(red: 48/255, green: 91/255, blue: 201/255, alpha: 1)
        roundBack2.isUserInteractionEnabled = false
//        self.addButton.addSubview(roundBack2)
        
        let rectBack1 = UIView(frame: CGRect(
            x: self.addButton.frame.size.width * 0.4,
            y: 0,
            width: self.addButton.frame.size.width * 0.6,
            height: self.addButton.frame.size.height * 0.6))
        rectBack1.backgroundColor = UIColor(red: 48/255, green: 91/255, blue: 201/255, alpha: 1)
        rectBack1.isUserInteractionEnabled = false
//        self.addButton.addSubview(rectBack1)
        
        let rectBack2 = UIView(frame: CGRect(
            x: 0,
            y: self.addButton.frame.size.height * 0.4,
            width: self.addButton.frame.size.width * 0.6,
            height: self.addButton.frame.size.height * 0.6))
        rectBack2.backgroundColor = UIColor(red: 48/255, green: 91/255, blue: 201/255, alpha: 1)
        rectBack2.isUserInteractionEnabled = false
//        self.addButton.addSubview(rectBack2)
        
        
        
        
        
        
        
        
        
        
        
        
        
        let buttonImageView = UIImageView(frame: CGRect(x: 0, y: 8, width: 10, height: 13))
        buttonImageView.center.x = self.addButton.frame.size.width / 2
//        buttonImageView.image = #imageLiteral(resourceName: "fileMedical")
        buttonImageView.isUserInteractionEnabled = false
        addButton.addSubview(buttonImageView)
        
        let buttonLabel = UILabel(frame: CGRect(x: 0, y: 28.5, width: self.addButton.frame.size.width, height: 10))
        buttonLabel.text = "복약 알림설정"
        buttonLabel.font = UIFont.systemFont(ofSize: 12)
        buttonLabel.textColor = UIColor.white
        buttonLabel.textAlignment = .center
        buttonLabel.isUserInteractionEnabled = false
//        self.addButton.addSubview(buttonLabel)
        
        
        
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(#function)
    }
    
    
    @objc func hmm(_ sender: UIButton) {
        print("tab")
    }
        
    @objc func addButtonPressed( button : UIButton ){
        print("tab123")
        self.delegate?.addButtonPressed?(button: button)
    }
    
//    @objc func addButtonPressed(button: UIButton) {
//        print("tap")
//        
//        let drugRegisterViewController = DrugRegisterViewController()
//        drugRegisterViewController.modalPresentationStyle = .fullScreen
//        self.present(drugRegisterViewController, animated: true) {
//            
//        }
//    }
    
    func labelStringUpdate( valueString : String ) {
        
        let beforeString = "한 달간 복약 "
        let afterString2 = "를 달성하였습니다."
        let afterString = "\n\n성공적인 치료를 위해서는\n꾸준한 약물 복용이 중요합니다."
        
        let defaultAttribute = [
//            findPW.titleLabel?.font = UIFont(name: "SUITE-Regular", size: 15)
//            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20),
            NSAttributedString.Key.font : UIFont(name: "SUITE-Regular", size: 20),
//            NSAttributedString.Key.foregroundColor : UIColor.black,
            NSAttributedString.Key.foregroundColor : UIColor.white,
            NSAttributedString.Key.kern : -0.48 //자간?
        ] as! [NSAttributedString.Key : NSObject]
        
        let defaultAttribute2 = [
            NSAttributedString.Key.font : UIFont(name: "SUITE-Regular", size: 15),
//            NSAttributedString.Key.foregroundColor : UIColor.black,
            NSAttributedString.Key.foregroundColor : UIColor.white,
            NSAttributedString.Key.kern : -0.48 //자간?
        ] as! [NSAttributedString.Key : NSObject]
        
        
        let valueAttribute = [
//            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 26),
            NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 26),
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
//        self.myLabel.numberOfLines = 0
//        self.myLabel.attributedText = getAttributedString(stringsInfos: stringInfos)
        
        self.label.attributedText = getAttributedString(stringsInfos: stringInfos)
        
        
        
        
//        var attributedString = NSMutableAttributedString(attributedString: myLabel.attributedText!)
//        var s = attributedString.string
        
//        UserDefaults.standard.set(s, forKey: "s")
        
//        print("------------->\(label.attributedText)")
//        UserDefaults.standard.setValue(label.text, forKey: "at")
        
//        let fontSize = UIFont(name: "SUITE-Regular", size: 16)
//        let attributedStr = NSMutableAttributedString(string: "한 달간 를 달성햐였습니다.\n성공적인 치료를 위해서는\n꾸준한 약물 복용이 중요합니다.")
//        attributedStr.addAttribute(.font, value: fontSize, range: ("한 달간 를 달성햐였습니다.\n성공적인 치료를 위해서는\n꾸준한 약물 복용이 중요합니다." as! NSString).range(of: "한 달간 를 달성햐였습니다."))
//        
//        
//        myLabel.attributedText = attributedStr
        
        
    }
    
//    func labelStringUpdate2( valueString : String ) {
//        
//        let beforeString = "한 달간 복약"
//        let afterString = "를 달성하였습니다.\n성공적인 치료를 위해서는 꾸준한\n약물 복용이 중요합니다."
//        
//        let defaultAttribute = [
//            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17),
////            NSAttributedString.Key.foregroundColor : UIColor.black,
//            NSAttributedString.Key.foregroundColor : UIColor.white,
//            NSAttributedString.Key.kern : -0.48 //자간?
//        ] as! [NSAttributedString.Key : NSObject]
//        let valueAttribute = [
//            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 22),
////            NSAttributedString.Key.foregroundColor : UIColor(red: 221.0 / 255.0, green: 15.0 / 255.0, blue: 15.0 / 255.0, alpha: 1.0),
//            NSAttributedString.Key.foregroundColor : UIColor.yellow,
//        ] as [NSAttributedString.Key : NSObject]
//        
//        
//        let stringInfos = [
//            (beforeString,defaultAttribute),
//            (valueString,valueAttribute),
//            (afterString,defaultAttribute)
//            ]
//        as [(String,[NSAttributedString.Key:NSObject])]
//        self.label.attributedText = getAttributedString(stringsInfos: stringInfos)
//        
//      
//        print("------=\(label.attributedText)")
//        
//       
//        
//        
//        
////        UserDefaults.standard.setValue(label.text, forKey: "at")
//        
//    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//RegisterdDrugListTopView

//RegisterdDrugListView
