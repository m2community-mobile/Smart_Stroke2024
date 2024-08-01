//
//  RegisterdDrugListView.swift
//  KSR
//
//  Created by m2comm on 2018. 6. 26..
//  Copyright © 2018년 m2community. All rights reserved.
//

import UIKit
import RealmSwift

class RegisterdDrugListView: UIView
,UITableViewDataSource, UITableViewDelegate, RegisterdDrugListTopViewDelegate
    ,DrugRegisterTableViewCellDelegate
{

    var drugManagementVC : DrugManagementViewController?
    var topView : RegisterdDrugListTopView!
    
    var drugRegisterTableView : UITableView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.topView = RegisterdDrugListTopView()
        self.topView.delegate = self
        self.addSubview(self.topView)
        
//        appDel.topView2 = self.topView

        drugRegisterTableView = UITableView(frame: CGRect(x: 0, y: self.topView.frame.maxY, width: SCREEN.WIDTH, height: self.frame.size.height - self.topView.frame.maxY))
        drugRegisterTableView.delegate = self
        drugRegisterTableView.dataSource = self
        drugRegisterTableView.register(DrugRegisterTableViewCell.self, forCellReuseIdentifier: "DrugRegisterTableViewCell")
        drugRegisterTableView.register(DrugRegisterTableViewDrugListCell.self, forCellReuseIdentifier: "DrugRegisterTableViewDrugListCell")
//        drugRegisterTableView.separatorStyle = .none
        drugRegisterTableView.separatorColor = UIColor(white: 217/255, alpha: 1)
        self.addSubview(drugRegisterTableView)
    }
    
//    var alramList = [AlramInfo]()
//    lazy var alramList : Results<Alram_R> = {
//        return RealmCenter.shared.realm.objects(Alram_R.self)
//    }()
    var alramList = [Alram_R]()
    
    func dataUpdate(){
        self.alramList = [Alram_R]()
        for key in ALRAM_KEY.KEYS {
            if let alram = RealmCenter.shared.realm.objects(Alram_R.self).filter("alramKey==%@", key).last {
                alramList.append(alram)
            }
        }
        self.drugRegisterTableView.reloadData()
    }
    
    
    //MARK:,UITableViewDataSource, UITableViewDelegate

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row % 2 == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "DrugRegisterTableViewCell", for: indexPath) as! DrugRegisterTableViewCell
            
            cell.delegate = self

            let newIndex = (indexPath.row / 2)

            let alram = self.alramList[newIndex]

            
            var hour = alram.hour
            var amplString = ""
            if hour <= 12 {
                amplString = "오전"
            }else{
                amplString = "오후"
                hour -= 12
            }

            cell.labelUpdate(ampmString: amplString, timeString: String(format: "%02d:%02d",hour,alram.minute))
            cell.switchButton.isOn = alram.isAlram

            cell.switchButton.tag = newIndex
            cell.editButton.tag = newIndex
            cell.deleteButton.tag = newIndex
            
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "DrugRegisterTableViewDrugListCell", for: indexPath) as! DrugRegisterTableViewDrugListCell
            
            let newIndex = (indexPath.row / 2)

            for drugComponnentView2 in cell.drugComponnentView2s {
                drugComponnentView2.removeFromSuperview()
            }

            let alram = self.alramList[newIndex]

            let drugs = alram.kindOfDrugs.filter("isCheck=true")
            for i in 0..<drugs.count {
                let drug = drugs[i]
                let drugComponnentView2 = DrugComponnentView2(frame: CGRect(x: 0, y: 15 + (CGFloat(i) * (17 + 13)), width: self.frame.size.width, height: 17), drug: drug)
                cell.addSubview(drugComponnentView2)
                
                cell.drugComponnentView2s.append(drugComponnentView2)
                
            }
            
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.alramList.count * 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row % 2 == 0 {
            return DrugRegisterTableViewCell.height
        }else{
            let newIndex = (indexPath.row / 2)
            let info = self.alramList[newIndex]
            
            let drugs = info.kindOfDrugs.filter("isCheck=true")
            if drugs.count > 0 {
                return CGFloat(drugs.count * (17 + 13)) + 15 + 15
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
        let targetAlram = self.alramList[button.tag]
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
        self.drugManagementVC?.present(drugRegisterVC, animated: true, completion: {
            
        })

    }
    
    func switchButtonValueChanged(switchButton: UISwitch) {
        
//        let alram = self.alramList[switchButton.tag]
//        RealmCenter.shared.write(doSomething: { (realm) in
//            alram.isAlram = !alram.isAlram
//            realm.add(alram)
//        }) { (success, error) in
//            if success {
//                AlramCenter_R.shared.updateAlram(alram: alram, complete: { (success) in
//                    if success {
//                        print("알람 온오프 성공")
//                        DispatchQueue.main.async {
//                            self.dataUpdate()
//                        }
//                    }else{
//                        DispatchQueue.main.async {
//                            toastShow(message: "알람 변경에 실패하였습니다.\n잠시 후 다시 시도해주세요.")
//                            switchButton.isOn = !switchButton.isOn
//                        }
//                    }
//                })
//            }else{
//                DispatchQueue.main.async {
//                    toastShow(message: "알람 변경에 실패하였습니다.\n잠시 후 다시 시도해주세요.")
//                    switchButton.isOn = !switchButton.isOn
//                }
//            }
//        }
//        
//        
////        var info = self.alramList[switchButton.tag]
////        info.isAlram = switchButton.isOn
////        AlramCenter.shared.addAlramToNoti(info: info) { (success : Bool) in
////            if success {
////                print("변경 성공")
////            }else{
////                toastShow(message: "알람 변경에 실패하였습니다.\n잠시 후 다시 시도해주세요.")
////                switchButton.isOn = !switchButton.isOn
////            }
////            DispatchQueue.main.async {
////                self.dataUpdate()
////            }
////        }
    }
}

@objc protocol RegisterdDrugListTopViewDelegate {
    @objc optional func addButtonPressed( button : UIButton )
}

class RegisterdDrugListTopView: UIView {
    
    convenience init() {
        self.init(frame: CGRect(x: 0, y: 0, width: SCREEN.WIDTH, height: 75))
    }
    
    var delegate : RegisterdDrugListTopViewDelegate?
    var label : UILabel!
    var addButton : UIButton!
    private override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor(red: 241/255, green: 247/255, blue: 255/255, alpha: 1)
        
        self.label = UILabel(frame: CGRect(
            x: 15.5,
            y: 0,
            width: SCREEN.WIDTH - 15.5 - 80 - (12.5 * 2),
            height: self.frame.size.height))
        self.label.numberOfLines = 3
        self.label.backgroundColor = UIColor.clear
        self.addSubview(self.label)
        
        //sample
        //?///?/
        self.labelStringUpdate(valueString: "0%")
        
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
        self.addButton.addSubview(roundBack1)
        
        let roundBack2 = UIView(frame: CGRect(
            x: self.addButton.frame.size.width * 0.4,
            y: self.addButton.frame.size.height * 0.4,
            width: self.addButton.frame.size.width * 0.6,
            height: self.addButton.frame.size.height * 0.6))
        roundBack2.layer.cornerRadius = 10
        roundBack2.backgroundColor = UIColor(red: 48/255, green: 91/255, blue: 201/255, alpha: 1)
        roundBack2.isUserInteractionEnabled = false
        self.addButton.addSubview(roundBack2)
        
        let rectBack1 = UIView(frame: CGRect(
            x: self.addButton.frame.size.width * 0.4,
            y: 0,
            width: self.addButton.frame.size.width * 0.6,
            height: self.addButton.frame.size.height * 0.6))
        rectBack1.backgroundColor = UIColor(red: 48/255, green: 91/255, blue: 201/255, alpha: 1)
        rectBack1.isUserInteractionEnabled = false
        self.addButton.addSubview(rectBack1)
        
        let rectBack2 = UIView(frame: CGRect(
            x: 0,
            y: self.addButton.frame.size.height * 0.4,
            width: self.addButton.frame.size.width * 0.6,
            height: self.addButton.frame.size.height * 0.6))
        rectBack2.backgroundColor = UIColor(red: 48/255, green: 91/255, blue: 201/255, alpha: 1)
        rectBack2.isUserInteractionEnabled = false
        self.addButton.addSubview(rectBack2)
        
        
        let buttonImageView = UIImageView(frame: CGRect(x: 0, y: 8, width: 10, height: 13))
        buttonImageView.center.x = self.addButton.frame.size.width / 2
        buttonImageView.image = #imageLiteral(resourceName: "fileMedical")
        buttonImageView.isUserInteractionEnabled = false
        addButton.addSubview(buttonImageView)
        
        let buttonLabel = UILabel(frame: CGRect(x: 0, y: 28.5, width: self.addButton.frame.size.width, height: 10))
        buttonLabel.text = "복약 알림설정"
        buttonLabel.font = UIFont(name: Nanum_Barun_Gothic_OTF, size: 10)
        buttonLabel.textColor = UIColor.white
        buttonLabel.textAlignment = .center
        buttonLabel.isUserInteractionEnabled = false
        self.addButton.addSubview(buttonLabel)
        
       
        
        
    }
        
    @objc func addButtonPressed( button : UIButton ){
        self.delegate?.addButtonPressed?(button: button)
    }
    
    func labelStringUpdate( valueString : String ) {
        
        let beforeString = "한 달간 복약 "
        let afterString = "를 달성하였습니다.\n성공적인 치료를 위해서는 꾸준한\n약물 복용이 중요합니다."
        
        let defaultAttribute = [
            NSAttributedString.Key.font : UIFont(name: Nanum_Barun_Gothic_OTF_Ultra_Light, size: 12)!,
            NSAttributedString.Key.foregroundColor : UIColor.black,
            NSAttributedString.Key.kern : -0.48 //자간?
        ] as! [NSAttributedString.Key : NSObject]
        let valueAttribute = [
            NSAttributedString.Key.font : UIFont(name: Nanum_Barun_Gothic_OTF_Bold, size: 12)!,
            NSAttributedString.Key.foregroundColor : UIColor(red: 221.0 / 255.0, green: 15.0 / 255.0, blue: 15.0 / 255.0, alpha: 1.0),
        ] as [NSAttributedString.Key : NSObject]
        
        
        let stringInfos = [
            (beforeString,defaultAttribute),
            (valueString,valueAttribute),
            (afterString,defaultAttribute)
            ]
        as [(String,[NSAttributedString.Key:NSObject])]
//        self.label.attributedText = getAttributedString(stringsInfos: stringInfos)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
