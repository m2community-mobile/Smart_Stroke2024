//
//  DrugRegisterViewController.swift
//  KSR
//
//  Created by m2comm on 2018. 6. 26..
//  Copyright © 2018년 m2community. All rights reserved.
//

import UIKit

struct drugDataKey {
    static let kindOfDrug = "kindOfDrug"            //String
    static let drugs = "drugs"
    /*
    [drugName:String,
     isCheck:Bool]
     */
    static let drugName = "drugName"
    static let multiSeletable = "multiSeletable"    //"1" or "0"
    static let isCheck = "isCheck"
}

class DrugRegisterViewController: UIViewController
    ,TopBarDelegate
    ,CancelAndSaveButtonViewDelegate
    ,DrugSelectViewDelegate
    ,SubDrugViewDelegate
{

    var drugDataArray = [ //TODO:서버로부터 데이터를 받을 예정
        [
            drugDataKey.kindOfDrug : "항혈소판제",
            drugDataKey.isCheck : false,
            
            drugDataKey.drugs :
                [
                    [drugDataKey.drugName:"아스피린",
                     drugDataKey.isCheck : false],
                    [drugDataKey.drugName:"클로피도그렐",
                     drugDataKey.isCheck : false],
                    [drugDataKey.drugName:"아스피린+디피리다몰",
                     drugDataKey.isCheck : false],
                    [drugDataKey.drugName:"실로스타졸",
                     drugDataKey.isCheck : false],
                    [drugDataKey.drugName:"트리플루살",
                     drugDataKey.isCheck : false],
                    [drugDataKey.drugName:"티클로피딘",
                     drugDataKey.isCheck : false]
            ],
            
            drugDataKey.multiSeletable : true
        ],
        [
            drugDataKey.kindOfDrug : "항응고제",
            drugDataKey.isCheck : false,
            drugDataKey.drugs : [
                [drugDataKey.drugName:"와파린",
                 drugDataKey.isCheck : false],
                [drugDataKey.drugName:"아픽사반",
                 drugDataKey.isCheck : false],
                [drugDataKey.drugName:"다비가트란",
                 drugDataKey.isCheck : false],
                [drugDataKey.drugName:"에독사반",
                 drugDataKey.isCheck : false],
                [drugDataKey.drugName:"리바록사반",
                 drugDataKey.isCheck : false],
                [drugDataKey.drugName:"저분자헤파린",
                 drugDataKey.isCheck : false]
            ],
            drugDataKey.multiSeletable : true
        ],
        [
            drugDataKey.kindOfDrug : "이상지질혈증",
            drugDataKey.isCheck : false,
            drugDataKey.drugs : [
                [drugDataKey.drugName:"스타틴",
                 drugDataKey.isCheck : false],
                [drugDataKey.drugName:"기타 이상지질혈증약",
                 drugDataKey.isCheck : false]
            ],
            drugDataKey.multiSeletable : true
        ],
        [
            drugDataKey.kindOfDrug : "고혈압약",
            drugDataKey.isCheck : false,
            drugDataKey.drugs : [],
            drugDataKey.multiSeletable : false
        ],
        [
            drugDataKey.kindOfDrug : "당뇨약",
            drugDataKey.isCheck : false,
            drugDataKey.drugs : [],
            drugDataKey.multiSeletable : false
        ],
        [
            drugDataKey.kindOfDrug : "치매약",
            drugDataKey.isCheck : false,
            drugDataKey.drugs : [],
            drugDataKey.multiSeletable : false
        ],
        [
            drugDataKey.kindOfDrug : "기타",
            drugDataKey.isCheck : false,
            drugDataKey.drugs : [],
            drugDataKey.multiSeletable : false
        ]
    ]
    
    var topBar : TopBar!
    var scrollView : UIScrollView!
    
    var timeSettingView : TimeSettingView!
    var weekSettingView : WeekSettingView!
    var drugSelectView : DrugSelectView!
    var checkNotiView : CheckNotiView!
    
    var myAlramInfo : AlramInfo?
    var myAlram : Alram_R?

    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        //TODO: read data and convert dataArray
        
        
        
        
        
        self.topBar = TopBar()
        topBar.titleLabel.text = "복약 알림 설정"
        topBar.titleLabel.font = UIFont(name: Nanum_Barun_Gothic_OTF, size: 14)
        topBar.titleLabel.textAlignment = .center
        self.view.addSubview(topBar)
        
        self.scrollView = UIScrollView(frame: CGRect(x: 0, y: self.topBar.frame.maxY, width: SCREEN.WIDTH, height: SCREEN.HEIGHT - self.topBar.frame.maxY - SAFE_AREA))
        self.view.addSubview(self.scrollView)
        
        let timeSettingTitleView = DrugRegisterHeaderView()
        timeSettingTitleView.titleLabel.text = "시간설정"
        self.scrollView.addSubview(timeSettingTitleView)
        
        timeSettingView = TimeSettingView()
        timeSettingView.frame.origin.y = timeSettingTitleView.frame.maxY
        self.scrollView.addSubview(timeSettingView)
        
//        let weekSettingTitleView = DrugRegisterHeaderView()
//        weekSettingTitleView.frame.origin.y = timeSettingView.frame.maxY
//        weekSettingTitleView.titleLabel.text = "요일설정"
//        self.scrollView.addSubview(weekSettingTitleView)
//
//        weekSettingView = WeekSettingView()
//        weekSettingView.frame.origin.y = weekSettingTitleView.frame.maxY
//        self.scrollView.addSubview(weekSettingView)
        
        let drugSeletTitleView = DrugRegisterHeaderView()
        drugSeletTitleView.frame.origin.y = timeSettingView.frame.maxY
        drugSeletTitleView.titleLabel.text = "약제 종류"
        self.scrollView.addSubview(drugSeletTitleView)
        
        drugSelectView = DrugSelectView(drugDataArray: self.drugDataArray)
        drugSelectView.frame.origin.y = drugSeletTitleView.frame.maxY
        drugSelectView.delegate = self
        self.scrollView.addSubview(drugSelectView)
        
        checkNotiView = CheckNotiView()
        checkNotiView.frame.origin.y = drugSelectView.frame.maxY
        checkNotiView.titleLabel.text = "복약체크 알림"
        self.scrollView.addSubview(checkNotiView)
        
        let cancelAndSaveView = CancelAndSaveButtonView(type: .full)
        cancelAndSaveView.frame.origin.y = max(self.scrollView.frame.size.height - cancelAndSaveView.frame.size.height, checkNotiView.frame.maxY + 20)
        cancelAndSaveView.delegate = self
        self.scrollView.addSubview(cancelAndSaveView)
        
        self.scrollView.contentSize = CGSize(width: SCREEN.WIDTH, height: max(self.scrollView.frame.size.height, cancelAndSaveView.frame.maxY))
        
        
        if userD.object(forKey: "FirstDrugRegisterViewController") == nil {

            guard let regNumString = userD.object(forKey: USER_KEY.KSR_REGISTRATION_NUMBER) as? String else {
                toastShow(message: "reg_num is nil error")
                return
            }

            Server.getData(type: Server.InfoType.FIRST_DRUG_LIST, otherInfo: ["reg_num":regNumString ]) { (kData : Data?) in
                if let data = kData {
                    if let dataDic = data.toJson() as? [String:String] {
                        print("dataDic:\(dataDic)")
                        
                        for i in 0..<self.drugDataArray.count {
                            var drugData = self.drugDataArray[i]
                            if let kindOfDrugName = drugData[drugDataKey.kindOfDrug] as? String {
                                if dataDic["hm_htx_htn"] == "1" && kindOfDrugName == "고혈압약" { drugData[drugDataKey.isCheck] = true }
                                if dataDic["hm_htx_dm"] == "1" && kindOfDrugName == "당뇨약" { drugData[drugDataKey.isCheck] = true }
                                if dataDic["hm_htx_dem"] == "1" && kindOfDrugName == "치매약" { drugData[drugDataKey.isCheck] = true }
                            }
                            if var drugs = drugData[drugDataKey.drugs] as? [[String:Any]] {
                                for j in 0..<drugs.count {
                                    var drug = drugs[j]
                                    if let drugName = drug[drugDataKey.drugName] as? String {
                                        if dataDic["hm_htx_apix"] == "1" && drugName == "아픽사반" { drug[drugDataKey.isCheck] = true; drugData[drugDataKey.isCheck] = true }
                                        if dataDic["hm_htx_as_dypi"] == "1" && drugName == "아스피린+디피리다몰" { drug[drugDataKey.isCheck] = true; drugData[drugDataKey.isCheck] = true }
                                        if dataDic["hm_htx_asp"] == "1" && drugName == "아스피린" { drug[drugDataKey.isCheck] = true; drugData[drugDataKey.isCheck] = true }
                                        if dataDic["hm_htx_cilo"] == "1" && drugName == "실로스타졸" { drug[drugDataKey.isCheck] = true; drugData[drugDataKey.isCheck] = true }
                                        if dataDic["hm_htx_clopi"] == "1" && drugName == "클로피도그렐" { drug[drugDataKey.isCheck] = true; drugData[drugDataKey.isCheck] = true }
                                        if dataDic["hm_htx_dabig"] == "1" && drugName == "다비가트란" { drug[drugDataKey.isCheck] = true; drugData[drugDataKey.isCheck] = true }
                                        if dataDic["hm_htx_dm"] == "1" && drugName == "" { drug[drugDataKey.isCheck] = true; drugData[drugDataKey.isCheck] = true }
                                        if dataDic["hm_htx_edo"] == "1" && drugName == "에독사반" { drug[drugDataKey.isCheck] = true; drugData[drugDataKey.isCheck] = true }
                                        if dataDic["hm_htx_htn"] == "1" && drugName == "" { drug[drugDataKey.isCheck] = true; drugData[drugDataKey.isCheck] = true }
                                        if dataDic["hm_htx_htn_o"] == "1" && drugName == "기타 이상지질혈증약" { drug[drugDataKey.isCheck] = true; drugData[drugDataKey.isCheck] = true }
                                        if dataDic["hm_htx_lmwh"] == "1" && drugName == "저분자헤파린" { drug[drugDataKey.isCheck] = true; drugData[drugDataKey.isCheck] = true }
                                        if dataDic["hm_htx_rivar"] == "1" && drugName == "리바록사반" { drug[drugDataKey.isCheck] = true; drugData[drugDataKey.isCheck] = true }
                                        if dataDic["hm_htx_statin"] == "1" && drugName == "스타틴" { drug[drugDataKey.isCheck] = true; drugData[drugDataKey.isCheck] = true }
                                        if dataDic["hm_htx_ticl"] == "1" && drugName == "티클로피딘" { drug[drugDataKey.isCheck] = true; drugData[drugDataKey.isCheck] = true }
                                        if dataDic["hm_htx_trif"] == "1" && drugName == "트리플루살" { drug[drugDataKey.isCheck] = true; drugData[drugDataKey.isCheck] = true }
                                        if dataDic["hm_htx_wfr"] == "1" && drugName == "와파린" { drug[drugDataKey.isCheck] = true; drugData[drugDataKey.isCheck] = true }
                                        drugs[j] = drug
                                    }
                                }
                                drugData[drugDataKey.drugs] = drugs
                            }
                            self.drugDataArray[i] = drugData
                        }
                        
                        for i in 0..<self.drugSelectView.drugButtons.count {
                            let drugButton = self.drugSelectView.drugButtons[i]
                            
                            for j in 0..<self.drugDataArray.count {
                                let drugData = self.drugDataArray[j]
                                let kindOfDrug = drugData[drugDataKey.kindOfDrug] as! String
                                if drugButton.buttonTitleLabel.text == kindOfDrug {
                                    drugButton.isSelected = drugData[drugDataKey.isCheck] as! Bool
                                }
                            }
                        }
                    }
                }
            }
        }else if let alram = self.myAlram {

            for i in 0..<drugDataArray.count {
                var drugData = drugDataArray[i]
                let kindOfDrug = drugData[drugDataKey.kindOfDrug] as! String
                if let kindOfDrugOfAlram = self.myAlram?.kindOfDrugs.filter("name==%@", kindOfDrug).first {
                    drugData[drugDataKey.isCheck] = kindOfDrugOfAlram.isCheck
                    drugDataArray[i] = drugData
                    
                    if kindOfDrugOfAlram.name == "기타" {
                        if let etcDrug = kindOfDrugOfAlram.drugs.first {
                            drugData[drugDataKey.drugs] = [[
                                drugDataKey.isCheck : etcDrug.isCheck,
                                drugDataKey.drugName : etcDrug.name
                                ]] as [[String:Any]]
                            drugDataArray[i] = drugData
                            
                        }
                    }else{
                        if var drugs = drugData[drugDataKey.drugs] as? [[String:Any]] {
                            for j in 0..<drugs.count {
                                var drug = drugs[j]
                                let drugName = drug[drugDataKey.drugName] as! String
                                
                                if let drugOfAlram = kindOfDrugOfAlram.drugs.filter("name==%@", drugName).first {
                                    
                                    drug[drugDataKey.isCheck] = drugOfAlram.isCheck
                                    
                                    drugs[j] = drug
                                    drugData[drugDataKey.drugs] = drugs
                                    drugDataArray[i] = drugData
                                    
                                }
                                
                            }
                        }
                    }
                }
            }
        
            print("after drugDataArray : \(drugDataArray)")
            
            
            
            
            if alram.isBefore {
                timeSettingView.beforeOrAfterButtonPressed(button: timeSettingView.beforeButton)
            }else{
                timeSettingView.beforeOrAfterButtonPressed(button: timeSettingView.afterButton)
            }
            
            var timeOffSetButtonsIndex : Int = 0
            
            switch alram.alramKey {
            case ALRAM_KEY.MORNING:
                timeOffSetButtonsIndex = 0
            case ALRAM_KEY.LUNCH:
                timeOffSetButtonsIndex = 1
            case ALRAM_KEY.DINNER:
                timeOffSetButtonsIndex = 2
            default:
                timeOffSetButtonsIndex = 0
            }

            timeSettingView.buttonPressed(button: timeSettingView.timeOffSetButtons[timeOffSetButtonsIndex])
            
            for i in 0..<drugSelectView.drugButtons.count {
                let drugButton = drugSelectView.drugButtons[i]
                
                for j in 0..<drugDataArray.count {
                    let drugData = drugDataArray[j]
                    let kindOfDrug = drugData[drugDataKey.kindOfDrug] as! String
                    if drugButton.buttonTitleLabel.text == kindOfDrug {
                        drugButton.isSelected = drugData[drugDataKey.isCheck] as! Bool
                        
                        if drugButton.isSelected && drugButton.buttonTitleLabel.text! == "기타" {
                            UIView.animate(withDuration: 0.3, animations: {
                                self.drugSelectView.textFieldBackView.frame.size.height = 40
                                
                                if let drugs = drugData[drugDataKey.drugs] as? [[String:Any]] {
                                    if let firstDrug = drugs.first {
                                        self.drugSelectView.otherDrugTextField.text = firstDrug[drugDataKey.drugName] as? String
                                    }
                                }
                                
                            }) { (fi) in
                                
                            }
                        }
                        
                        break
                    }
                }
                
//                let targetdrugs = alram.kindOfDrugs.filter("name==%@", drugButton.buttonTitleLabel.text!)
//                if let targetdrug = targetdrugs.first {
//                    if targetdrug.isCheck {
//                        drugButton.isSelected = true
//                    }
//                }
                
            }
            
            checkNotiView.onOffSwitch.isOn = alram.isAlram

            timeSettingView.hourSelectView.time = alram.hour
            timeSettingView.minuteSelectView.time = alram.minute
        }
        
    }
    
    func cancelButtonPressed(button: UIButton) {
        self.dismiss(animated: true) {
            
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            if !touch.view!.isKind(of: UITextField.self) {
                self.view.endEditing(true)
            }
        }
    }
    
    func saveButtonPressed(button: UIButton) {
        print("tap")
        
        if self.timeSettingView.beforOfAfter == nil {
            toastShow(message: "식전 혹은 식후를 선택하세요.")
           return
        }
        
        if self.timeSettingView.timeOffSetSelectedIndex == 0 {
            toastShow(message: "아침/점심/저녁을 선택하세요.")
            return
        }

        var alramKey = ""
        if self.timeSettingView.timeOffSetSelectedIndex == 1 {
            alramKey = ALRAM_KEY.MORNING
        }else if self.timeSettingView.timeOffSetSelectedIndex == 2 {
            alramKey = ALRAM_KEY.LUNCH
        }else{
            alramKey = ALRAM_KEY.DINNER
        }
        
        let alram = Alram_R()
        alram.alramKey = alramKey
        alram.isBefore = self.timeSettingView.beforOfAfter == .before
        alram.isAlram = self.checkNotiView.onOffSwitch.isOn
        alram.hour = self.timeSettingView.hourSelectView.time
        alram.minute = self.timeSettingView.minuteSelectView.time
        for kindOfDrug in self.readDrugs() {
            alram.kindOfDrugs.append(kindOfDrug)
        }
        
        RealmCenter.shared.write(doSomething: { (realm) in
            realm.add(alram)
        }) { (success:Bool, error:String?) in
            if success {
                print("realm.add(alram) : success and updateAlram")
                AlramCenter_R.shared.updateAlram(alram: alram, complete: { (success : Bool) in
                    if success {
                        print("realm.add(alram) : success and updateAlram success")
                        DispatchQueue.main.async {
                            self.dismiss(animated: true, completion: {
                                userD.set("FirstDrugRegisterViewController", forKey: "FirstDrugRegisterViewController")
                                userD.synchronize()
                            })
                        }
                    }
                })
            }
        }
    }
    
    func subDrugViewSubDrugButtonPressed(subDrugView: SubDrugView, subDrugButton: SubDrugButton) {
        
        subDrugButton.isSelected = !subDrugButton.isSelected
        
        var check = false
        for i in 0..<subDrugView.subDrugButtons.count {
            let drugButton = subDrugView.subDrugButtons[i]
            if drugButton.isSelected {
                check = true
            }
        }
        subDrugView.kindOfDrugButton?.isSelected = check
        
        for i in 0..<self.drugDataArray.count {
            var kindOfDrug = self.drugDataArray[i]
            if let kindOfDrugName = kindOfDrug[drugDataKey.kindOfDrug] as? String {
                if kindOfDrugName == subDrugView.kindOfDrugName {
                    kindOfDrug[drugDataKey.isCheck] = check
                    self.drugDataArray[i] = kindOfDrug
                    if var drugs = kindOfDrug[drugDataKey.drugs] as? [[String:Any]] {
                        for j in 0..<drugs.count {
                            var drug = drugs[j]
                            if let drugName = drug[drugDataKey.drugName] as? String {
                                if drugName == subDrugButton.drugName {
                                    drug[drugDataKey.isCheck] = subDrugButton.isSelected
                                    if subDrugButton.isSelected { kindOfDrug[drugDataKey.isCheck] = true }
                                    drugs[j] = drug
                                    kindOfDrug[drugDataKey.drugs] = drugs
                                    self.drugDataArray[i] = kindOfDrug
                                    return
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    func drugButtonPressed(drugSelectView: DrugSelectView, button: TimeOffSetButton) {
//?///?/
        
        print("왜 안돼")
        let index = button.tag

        if let drugs = self.drugDataArray[index][drugDataKey.drugs] as? [[String:Any]],
            drugs.count > 0,
            let kindOfDrugName = self.drugDataArray[index][drugDataKey.kindOfDrug] as? String,
            kindOfDrugName != "기타"
        {
            if let subDrugView = drugSelectView.subDrugView, subDrugView.isShow {
                if button.isShow {
                    
                    //축소 애니메이션
                    UIView.animate(withDuration: 0.3, animations: {
                        drugSelectView.subDrugView?.alpha = 0
                        for i in 0..<drugSelectView.drugButtons.count {
                            let drugButton = drugSelectView.drugButtons[i]
                            drugButton.frame.origin.y = drugButton.originalOrigin.y
                        }
                        self.drugSelectView.textFieldBackView.frame.origin.y = drugSelectView.drugButtons.last!.frame.maxY + 11
                        self.drugSelectView.frame.size.height = drugSelectView.textFieldBackView.frame.maxY + 14 + 40
                        self.checkNotiView.frame.origin.y = self.drugSelectView.frame.maxY
                        
                    }) { (fi) in
                        drugSelectView.subDrugView?.isShow = false
                    }
                    
                    return
                }
            }
            
            //다른 버튼을 눌렀다는 뜻
            for i in 0..<drugSelectView.drugButtons.count {
                let drugButton = drugSelectView.drugButtons[i]
                if drugButton == button {
                    drugButton.isShow = true
                }else{
                    drugButton.isShow = false
                }
            }
            
            print("drugs:\(drugs)")
            drugSelectView.subDrugView?.removeFromSuperview()
            drugSelectView.subDrugView = SubDrugView(drugs: drugs)
            drugSelectView.subDrugView?.kindOfDrugName = button.buttonTitleLabel.text!
            drugSelectView.subDrugView?.kindOfDrugButton = button
            drugSelectView.subDrugView?.frame.origin.y = button.frame.maxY + 10
            drugSelectView.subDrugView?.delegate = self
            let originalHeight = drugSelectView.subDrugView!.frame.size.height
            drugSelectView.subDrugView?.frame.size.height = 0
            drugSelectView.subDrugView?.alpha = 0
            drugSelectView.addSubview(drugSelectView.subDrugView!)
            
            let destinationIndex = index + (3 - (index % 3))
            print("destinationIndex:\(destinationIndex)")
            
            UIView.animate(withDuration: 0.3, animations: {
                
                drugSelectView.subDrugView?.frame.size.height = originalHeight
                drugSelectView.subDrugView?.alpha = 1
                
                for i in 0..<drugSelectView.drugButtons.count {
                    let drugButton = drugSelectView.drugButtons[i]
                    if i < destinationIndex {
                        drugButton.frame.origin.y = drugButton.originalOrigin.y
                    }else{
                        drugButton.frame.origin.y = drugButton.originalOrigin.y + drugSelectView.subDrugView!.frame.size.height + 10
                    }
                }
                
                self.drugSelectView.textFieldBackView.frame.origin.y = drugSelectView.drugButtons.last!.frame.maxY + 11
                self.drugSelectView.frame.size.height = drugSelectView.textFieldBackView.frame.maxY + 14 + 40
                self.checkNotiView.frame.origin.y = self.drugSelectView.frame.maxY
                
            }) { (fi) in
                drugSelectView.subDrugView?.isShow = true
            }
        }else{
            button.isSelected = !button.isSelected
            
            if drugSelectView.drugButtons.last == button {
                if button.isSelected {
                    
                    UIView.animate(withDuration: 0.3, animations: {
                        drugSelectView.textFieldBackView.frame.size.height = 40
                    }) { (fi) in
                        drugSelectView.otherDrugTextField.placeholder = "약제명을 입력해주세요"
                        
                        if let drugs = self.drugDataArray[index][drugDataKey.drugs] as? [[String:Any]] {
                            if let etcDrug = drugs.first, let drugName = etcDrug[drugDataKey.drugName] as? String {
                                drugSelectView.otherDrugTextField.text = drugName
                            }
                        }
                    }
                }else{
                    drugSelectView.otherDrugTextField.placeholder = ""
                    drugSelectView.otherDrugTextField.resignFirstResponder()
                    drugSelectView.otherDrugTextField.text = ""
                    UIView.animate(withDuration: 0.3, animations: {
                        drugSelectView.textFieldBackView.frame.size.height = 0
                    }) { (fi) in }
                }
            }
            
            //?/
            for i in 0..<self.drugDataArray.count {
                var drugData = self.drugDataArray[i]
                if let kindOfDrugName = drugData[drugDataKey.kindOfDrug] as? String {
                    if kindOfDrugName == button.buttonTitleLabel.text! {
                        drugData[drugDataKey.isCheck] = button.isSelected
                        self.drugDataArray[i] = drugData
                        break
                    }
                }
                //                button.buttonTitleLabel.text
            }
        
        }
    }
    
    func readDrugs() -> [KindOfDrug_R]{
        //?/
        var kindOfDrugs = [KindOfDrug_R]()
        print("readDrugs:\(self.drugDataArray)")
        for i in 0..<self.drugDataArray.count {
            var drugData = self.drugDataArray[i]
            guard let kindOfDrugName = drugData[drugDataKey.kindOfDrug] as? String else { print("readDrugs- kindOfDrugName error"); continue }
            let kindOfDrug_R = KindOfDrug_R()
            
            kindOfDrug_R.name = kindOfDrugName

            if kindOfDrugName == "기타" {
                print("kindOfDrugName == 기타")
                let etcDrug = [drugDataKey.drugName:drugSelectView.otherDrugTextField.text!,
                               drugDataKey.isCheck : true] as [String : Any]
                drugData[drugDataKey.drugs] = [etcDrug]
            }
            
            guard let kindOfDrugCheck = drugData[drugDataKey.isCheck] as? Bool else { print("readDrugs- kindOfDrugName error"); continue }
            kindOfDrug_R.isCheck = kindOfDrugCheck
            
            if let drugs = drugData[drugDataKey.drugs] as? [[String:Any]] {
                for j in 0..<drugs.count {
                    let drug = drugs[j]
                    if let isCheck = drug[drugDataKey.isCheck] as? Bool, isCheck,
                        let drugName = drug[drugDataKey.drugName] as? String
                    {
                        let drug_R = Drug_R()
                        drug_R.isCheck = true
                        drug_R.name = drugName
                        
                        kindOfDrug_R.drugs.append(drug_R)
                    }
                }
            }
            kindOfDrugs.append(kindOfDrug_R)
        }
       
        print("readDrugs - kindOfDrugs:\(kindOfDrugs)")
        return kindOfDrugs
    }
    
    class DrugRegisterHeaderView: UIView {
        
        convenience init() {
            self.init(frame: CGRect(x: 0, y: 0, width: SCREEN.WIDTH, height: 32))
        }
        
        var titleLabel : UILabel!
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            self.backgroundColor = UIColor(red: 245/255, green: 246/255, blue: 249/255, alpha: 1)
            
            self.titleLabel = UILabel(frame: CGRect(x: 19.5, y: 0, width: SCREEN.WIDTH - 19.5, height: self.frame.size.height))
            self.titleLabel.font = UIFont(name: Nanum_Barun_Gothic_OTF, size: 12)
            self.addSubview(self.titleLabel)
            
        }
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            for touch in touches {
                if !touch.view!.isKind(of: UITextField.self) {
                    self.endEditing(true)
                }
            }
        }
    }
    
    class CheckNotiView: DrugRegisterHeaderView {
        convenience init() {
            self.init(frame: CGRect(x: 0, y: 0, width: SCREEN.WIDTH, height: 50))
        }
        
        var onOffSwitch : UISwitch!
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            self.onOffSwitch = UISwitch(frame: CGRect(x: SCREEN.WIDTH - 20 - 42, y: 0, width: 42, height: 21))
            self.onOffSwitch.frame.origin.x = SCREEN.WIDTH - 20 - self.onOffSwitch.frame.size.width
            self.onOffSwitch.center.y = self.frame.size.height / 2
            
            self.addSubview(self.onOffSwitch)
        }
        
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            for touch in touches {
                if !touch.view!.isKind(of: UITextField.self) {
                    self.endEditing(true)
                }
            }
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    
    class TimeSettingView: UIView
        ,NumberSelectViewDelegate
    {
        
        
        
        convenience init() {
            self.init(frame: CGRect(x: 0, y: 0, width: SCREEN.WIDTH, height: 147))
        }
        
        var timeOffSetButtons = [TimeOffSetButton]()
        
        let titles = [
            "아침","점심","저녁"
        ]
        
        var beforeButton : TimeOffSetButton!
        var afterButton : TimeOffSetButton!
        var beforOfAfter : BeforeOfAfter?
        
        var hourSelectView : NumberSelectView!
        var minuteSelectView : NumberSelectView!
        
        private override init(frame: CGRect) {
            super.init(frame: frame)
            
            let buttonWidth : CGFloat = (SCREEN.WIDTH - (20 * 2) - (12.5 * 2)) / 3
            var buttonMaxY : CGFloat = 0
            for i in 0..<3 {
                let button = TimeOffSetButton(frame: CGRect(
                    x: 20 + (CGFloat(i) * (buttonWidth + 12.5)) ,
                    y: 13.5,
                    width: buttonWidth,
                    height: 35))
                button.buttonTitleLabel.text = titles[i]
                button.addbuttonImageView()
                button.addTarget(self, action: #selector(buttonPressed(button:)), for: .touchUpInside)
                self.timeOffSetButtons.append(button)
                button.isSelected = false
                self.addSubview(button)
                
                buttonMaxY = button.frame.maxY
            }
            
            self.beforeButton = TimeOffSetButton(frame: CGRect(x: 20, y: buttonMaxY + 19.5, width: 50, height: 25))
            self.beforeButton.nonSelectredTitleColor = UIColor(red: 60/255, green: 125/255, blue: 211/255, alpha: 1)
            self.beforeButton.buttonTitleLabel.font = UIFont(name: Nanum_Barun_Gothic_OTF, size: 12)
            self.beforeButton.addTarget(self, action: #selector(beforeOrAfterButtonPressed(button:)), for: .touchUpInside)
            self.beforeButton.buttonTitleLabel.text = "식전"
            self.addSubview(self.beforeButton)
            
            self.afterButton = TimeOffSetButton(frame: CGRect(x: 20, y: self.beforeButton.frame.maxY + 10, width: 50, height: 25))
            self.afterButton.nonSelectredTitleColor = UIColor(red: 60/255, green: 125/255, blue: 211/255, alpha: 1)
            self.afterButton.buttonTitleLabel.font = UIFont(name: Nanum_Barun_Gothic_OTF, size: 12)
            self.afterButton.addTarget(self, action: #selector(beforeOrAfterButtonPressed(button:)), for: .touchUpInside)
            self.afterButton.buttonTitleLabel.text = "식후"
            self.addSubview(self.afterButton)
            
            self.beforeOrAfterButtonPressed(button: self.beforeButton)
            
            let numberSelectViewWidth : CGFloat = (SCREEN.WIDTH - 84.5 - 35.5 - 20) / 2
            
            hourSelectView = NumberSelectView(frame: CGRect(
                x: 84.5,
                y: buttonMaxY + 19.5,
                width: numberSelectViewWidth,
                height: 60))
            hourSelectView.delegate = self
            self.addSubview(hourSelectView)
            
            let gapViewLabel = UILabel(frame: CGRect(x: hourSelectView.frame.maxX, y: buttonMaxY + 19.5, width: 35.5, height: 60))
            gapViewLabel.font = UIFont(name: Nanum_Barun_Gothic_OTF, size: 24)
            gapViewLabel.textAlignment = .center
            gapViewLabel.text = ":"
            self.addSubview(gapViewLabel)
            
            minuteSelectView = NumberSelectView(frame: CGRect(
                x: gapViewLabel.frame.maxX,
                y: buttonMaxY + 19.5,
                width: numberSelectViewWidth,
                height: 60))
            minuteSelectView.delegate = self
            self.addSubview(minuteSelectView)
            
            
        }
        
        func numberSelectView(numberSelectView: NumberSelectView, minusButtonPressed button: UIButton) {
            if numberSelectView == self.hourSelectView {
                let newTime = numberSelectView.time - 1
                numberSelectView.time = (newTime == -1 ? 23 : newTime)
            }else{
                let newTime = numberSelectView.time - 10
                numberSelectView.time = (newTime == -10 ? 50 : newTime)
            }
        }
        
        func numberSelectView(numberSelectView: NumberSelectView, plusButtonPressed button: UIButton) {
            if numberSelectView == self.hourSelectView {
                let newTime = numberSelectView.time + 1
                numberSelectView.time = (newTime == 24 ? 0 : newTime)
            }else{
                let newTime = numberSelectView.time + 10
                numberSelectView.time = (newTime == 60 ? 0 : newTime)
            }
        }
        
        var timeOffSetSelectedIndex = 0
        @objc func buttonPressed(button : TimeOffSetButton){
            
            for i in 0..<self.timeOffSetButtons.count {
                let timeOffSetButton = self.timeOffSetButtons[i]
                if timeOffSetButton == button {
                    timeOffSetButton.isSelected = true
                    self.timeOffSetSelectedIndex = i + 1
                    
                    if self.timeOffSetSelectedIndex == 1 {
                        self.hourSelectView.time = 7
                    }else if self.timeOffSetSelectedIndex == 2 {
                        self.hourSelectView.time = 12
                    }else if self.timeOffSetSelectedIndex == 3 {
                        self.hourSelectView.time = 18
                    }
                    
                    
                }else{
                    timeOffSetButton.isSelected = false
                }
            }
            
            
        }
        
        @objc func beforeOrAfterButtonPressed(button:UIButton){
            if button == self.beforeButton {
                self.beforeButton.isSelected = true
                self.afterButton.isSelected = false
                self.beforOfAfter = .before
            }else{
                self.beforeButton.isSelected = false
                self.afterButton.isSelected = true
                self.beforOfAfter = .after
            }
        }
        
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            for touch in touches {
                if !touch.view!.isKind(of: UITextField.self) {
                    self.endEditing(true)
                }
            }
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        
        
    }
    
    
    
    
}

class TimeOffSetButton: UIButton {
    
    var isShow = false
    var originalOrigin = CGPoint()
    var editOrigin = CGPoint()
    
    var titleBackView : UIView!
    var buttonTitleLabel : UILabel!
    var buttonImageView : UIImageView?
    
    var selectedTitleColor = UIColor.white
    var nonSelectredTitleColor = UIColor.black
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.originalOrigin = self.frame.origin
        
        self.layer.borderColor = UIColor(white: 218/255, alpha: 1).cgColor
        self.layer.borderWidth = 0.5
        self.backgroundColor = UIColor.white
        self.setTitleColor(UIColor.black, for: .normal)
        
        self.titleBackView = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.size.width * 0.5, height: self.frame.size.height))
        self.titleBackView.isUserInteractionEnabled = false
        self.addSubview(self.titleBackView)
        
        self.buttonTitleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height))
        self.buttonTitleLabel.font = UIFont(name: Nanum_Barun_Gothic_OTF, size: 14)
        self.titleBackView.addSubview(self.buttonTitleLabel)
        
        
        
    }
    
    func addbuttonImageView(){
        self.buttonImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 14, height: 14))
        self.buttonImageView?.center.y = self.frame.size.height / 2
        self.buttonImageView?.image = #imageLiteral(resourceName: "calendarX")
        self.titleBackView.addSubview(self.buttonImageView!)
    }
    
    override var isSelected: Bool {
        willSet(newValue){
            
            self.buttonTitleLabel.textColor = newValue ? self.selectedTitleColor : self.nonSelectredTitleColor
            self.backgroundColor = newValue ? UIColor(red: 60/255, green: 125/255, blue: 211/255, alpha: 1) : UIColor.white
            self.layer.borderWidth = newValue ? 0 : 0.5
            self.layer.borderColor = newValue ? UIColor.clear.cgColor : UIColor(white: 218/255, alpha: 1).cgColor
            
            if newValue {
                var buttonTitleLabelSize = self.buttonTitleLabel.sizeThatFits(CGSize(width: 100, height: 100))
                buttonTitleLabelSize.height = self.frame.size.height
                self.buttonTitleLabel.frame.size = buttonTitleLabelSize
                
                self.buttonImageView?.isHidden = false
                self.buttonImageView?.frame.origin.x = self.buttonTitleLabel.frame.maxX + 8
                
                if let buttonImageView = self.buttonImageView {
                    self.titleBackView.frame.size.width = buttonImageView.frame.maxX
                }
                self.titleBackView.center.x = self.frame.size.width / 2
            }else{
                var buttonTitleLabelSize = self.buttonTitleLabel.sizeThatFits(CGSize(width: 100, height: 100))
                buttonTitleLabelSize.height = self.frame.size.height
                
                self.buttonTitleLabel.frame.size = buttonTitleLabelSize
                self.buttonImageView?.isHidden = true
                self.titleBackView.frame.size.width = self.buttonTitleLabel.frame.maxX
                self.titleBackView.center.x = self.frame.size.width / 2
            }
            
        }
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class WeekSettingView: UIView {
    
    convenience init() {
        self.init(frame: CGRect(x: 0, y: 0, width: SCREEN.WIDTH, height: 71))
    }
    
    var weekSettingButtons = [WeekSettingButton]()
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
        
        let titles = [
            "일","월","화","수","목","금","토"
        ]
        
        let buttonWidth : CGFloat = (SCREEN.WIDTH - (20 * 2) - (10.5 * 6)) / CGFloat(titles.count)
        for i in 0..<titles.count{
            let weekSettingButton = WeekSettingButton(frame: CGRect(
                x: 20 + (CGFloat(i) * (buttonWidth + 10.5)),
                y: 13,
                width: buttonWidth, height: 40))
            weekSettingButton.setTitle(titles[i], for: .normal)
            weekSettingButton.addTarget(self, action: #selector(weekSettingButtonPressed(button:)), for: .touchUpInside)
            self.addSubview(weekSettingButton)
            self.weekSettingButtons.append(weekSettingButton)
        }
        
    }
    
    func readWeekSettings() -> [Bool]{
        var settings = [Bool]()
        for i in 0..<self.weekSettingButtons.count{
            let button = self.weekSettingButtons[i]
            settings.append(button.isSelected)
    
        }
        return settings
    }
    
    @objc func weekSettingButtonPressed(button:WeekSettingButton) {
        button.isSelected = !button.isSelected
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    class WeekSettingButton: UIButton {
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            self.titleLabel?.font = UIFont(name: Nanum_Barun_Gothic_OTF, size: 15)
            
            self.isSelected = false
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override var isSelected: Bool {
            willSet(newValue){
                if newValue {
                    self.backgroundColor = UIColor(red: 59/255, green: 77/255, blue: 91/255, alpha: 1)
                    self.setTitleColor(UIColor.white, for: .normal)
                    self.layer.borderColor = UIColor.clear.cgColor
                    self.layer.borderWidth = 0
                }else{
                    self.backgroundColor = UIColor.clear
                    self.setTitleColor(UIColor.black, for: .normal)
                    self.layer.borderColor = UIColor(white: 218/255, alpha: 1).cgColor
                    self.layer.borderWidth = 0.5
                }
            }
        }
    }
}

@objc protocol DrugSelectViewDelegate {
    @objc optional func etcButtonPressed(button : UIButton) //??
    @objc optional func drugButtonPressed(drugSelectView : DrugSelectView,  button : TimeOffSetButton)
}

//?/
class DrugSelectView: UIView, UITextFieldDelegate {
    
    var delegate : DrugSelectViewDelegate?
    
//    var drugNames = [
//        "항혈소판제","항응고제","고지혈증약","고혈압약","치매약","당뇨약","기타"
//    ]
    
    var subDrugView : SubDrugView?
    
    var drugButtons = [TimeOffSetButton]()
    var otherDrugTextField : UITextField!
    var textFieldBackView : UIView!
    
    var drugDataArray = [[String:Any]]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(drugDataArray kdrugDataArray : [[String:Any]]) {
        self.init(frame: CGRect(x: 0, y: 0, width: SCREEN.WIDTH, height: 158.5))

        self.drugDataArray = kdrugDataArray
        
        let buttonWidth : CGFloat = (SCREEN.WIDTH - (20.5 * 2) - (12.5 * 2)) / 3
        let buttonHeight : CGFloat = 35
        var lastY : CGFloat = 0
        for i in 0..<self.drugDataArray.count {
        
            let buttonX = 20.5 + ((buttonWidth + 12.5) * CGFloat(i % 3))
            let buttonY = 15.5 + ((buttonHeight + 8) * CGFloat(i / 3))
            
            let drugButton = TimeOffSetButton(frame: CGRect(
                x: buttonX,
                y: buttonY,
                width: buttonWidth,
                height: buttonHeight))
            drugButton.buttonTitleLabel.font = UIFont(name: Nanum_Barun_Gothic_OTF, size: 14)
            drugButton.buttonTitleLabel.text = self.drugDataArray[i][drugDataKey.kindOfDrug] as? String
            drugButton.isSelected = false
            drugButton.tag = i
            self.addSubview(drugButton)
            self.drugButtons.append(drugButton)
            
            lastY = drugButton.frame.maxY
            
            drugButton.addTarget(event: UIControl.Event.touchUpInside) { (button) in
                self.delegate?.drugButtonPressed?(drugSelectView: self, button: drugButton)
            }
        }
        
        textFieldBackView = UIView(frame: CGRect(x: 20, y: lastY + 11, width: SCREEN.WIDTH - 40, height: 40))
        textFieldBackView.layer.borderWidth = 0.5
        textFieldBackView.layer.borderColor = UIColor(white: 218/255, alpha: 1).cgColor
        self.addSubview(textFieldBackView)
        
        self.otherDrugTextField = UITextField(frame: CGRect(x: 16, y: 0, width: textFieldBackView.frame.size.width - (16 * 2), height: 40))
        self.otherDrugTextField.font = UIFont(name: Nanum_Barun_Gothic_OTF, size: 12)
        self.otherDrugTextField.placeholder = ""
        self.otherDrugTextField.delegate = self
        self.otherDrugTextField.addDoneCancelToolbar()
        textFieldBackView.addSubview(self.otherDrugTextField)
        
        
        self.frame.size.height = textFieldBackView.frame.maxY + 14
        textFieldBackView.frame.size.height = 0
        
    }
    

    

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            if !touch.view!.isKind(of: UITextField.self) {
                self.endEditing(true)
            }
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldDidBeginEditing")
        //핵심
        let textFieldMaxY = appDel.mainVC!.view.convert(textField.frame, from: textField.superview!).maxY
        let keyBoardHeight : CGFloat = (IS_IPHONE_X ? 377 : 216) + 44
        let targetHeight = (SCREEN.HEIGHT - textFieldMaxY) - keyBoardHeight - 10
        if targetHeight < 0 {
            UIView.animate(withDuration: 0.3, animations: {
                appDel.window?.frame.origin.y = targetHeight
            }) { (fi:Bool) in
                
            }
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.3, animations: {
            appDel.window?.frame.origin.y = 0
        }) { (fi:Bool) in
            
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


@objc protocol NumberSelectViewDelegate {
    @objc optional func numberSelectView(numberSelectView : NumberSelectView, minusButtonPressed button : UIButton);
    @objc optional func numberSelectView(numberSelectView : NumberSelectView, plusButtonPressed button : UIButton);
}


class NumberSelectView: UIView {
    
    var delegate : NumberSelectViewDelegate?
    
    var timeLabel : UILabel!
    
    var minusButton : UIButton!
    var plusButton : UIButton!
    
    var maxValue = 60
    
    var time = 0 {
        willSet(newValue){
            self.timeLabel.text = String(format: "%02d", newValue)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.white
        self.layer.borderColor = UIColor(white: 218/255, alpha: 1).cgColor
        self.layer.borderWidth = 0.5
        
        let buttonWidth : CGFloat = self.frame.size.width * 20/90
        
        minusButton = UIButton(frame: CGRect(
            x: 0, y: 0,
            width: buttonWidth,
            height: self.frame.size.height))
        minusButton.backgroundColor = UIColor(red: 245/255, green: 246/255, blue: 249/255, alpha: 1)
        minusButton.setTitle("-", for: .normal)
        minusButton.titleLabel?.font = UIFont(name: Nanum_Barun_Gothic_OTF, size: 15)
        minusButton.setTitleColor(UIColor(red: 147/255, green: 147/255, blue: 171/255, alpha: 1), for: .normal)
        minusButton.addTarget(self, action: #selector(minusButtonPressed(button:)), for: .touchUpInside)
        self.addSubview(minusButton)
        
        plusButton = UIButton(frame: CGRect(
            x: self.frame.size.width - (buttonWidth), y: 0,
            width: buttonWidth,
            height: self.frame.size.height))
        
        plusButton.backgroundColor = UIColor(red: 245/255, green: 246/255, blue: 249/255, alpha: 1)
        plusButton.setTitle("+", for: .normal)
        plusButton.titleLabel?.font = UIFont(name: Nanum_Barun_Gothic_OTF, size: 15)
        plusButton.setTitleColor(UIColor(red: 147/255, green: 147/255, blue: 171/255, alpha: 1), for: .normal)
        plusButton.addTarget(self, action: #selector(plusButtonPressed(button:)), for: .touchUpInside)
        self.addSubview(plusButton)
        
        self.timeLabel = UILabel(frame: CGRect(x: buttonWidth, y: 0, width: self.frame.size.width - (buttonWidth * 2), height: self.frame.size.height))
        self.timeLabel.backgroundColor = UIColor.white
        self.timeLabel.font = UIFont(name: Nanum_Barun_Gothic_OTF, size: 24)
        self.timeLabel.text = "00"
        self.timeLabel.textAlignment = .center
        self.addSubview(self.timeLabel)
    }
    
    @objc func minusButtonPressed(button : UIButton){
        self.delegate?.numberSelectView?(numberSelectView: self, minusButtonPressed: button)
    }
    
    @objc func plusButtonPressed(button : UIButton){
        self.delegate?.numberSelectView?(numberSelectView: self, plusButtonPressed: button)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            if !touch.view!.isKind(of: UITextField.self) {
                self.endEditing(true)
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

@objc protocol SubDrugViewDelegate {
    @objc optional func subDrugViewSubDrugButtonPressed(subDrugView : SubDrugView, subDrugButton : SubDrugButton)
}

class SubDrugView: UIView {
    
    var delegate : SubDrugViewDelegate?
    var isShow = false
    var kindOfDrugName = ""
    
    var kindOfDrugButton : TimeOffSetButton?
    var subDrugButtons = [SubDrugButton]()
    
    convenience init(drugs : [[String:Any]]) {
        self.init(frame:CGRect(x: 0, y: 0, width: SCREEN.WIDTH, height: 0))
        
//        self.backgroundColor = UIColor.red.withAlphaComponent(0.5)
        
        var maxX : CGFloat = 20.5
        var maxY : CGFloat = 10
        var buttonSizeHeight : CGFloat = 0
        for i in 0..<drugs.count {
            /*
             20.5
             15.5*/
            let subDrugButton = SubDrugButton(frame: CGRect(x: maxX, y: maxY, width: 100, height: 100))
            subDrugButton.indexPath = IndexPath(row: 0, section: 0)
            guard let drugName = drugs[i][drugDataKey.drugName] as? String else { print("drugName error"); continue }
            subDrugButton.setTitle(drugName, for: .normal)
            subDrugButton.drugName = drugName
            subDrugButton.titleLabel?.sizeToFit()
            subDrugButton.frame.size = CGSize(
                width: subDrugButton.titleLabel!.frame.size.width + 20,
                height: subDrugButton.titleLabel!.frame.size.height + 20)
            if subDrugButton.frame.maxX >= SCREEN.WIDTH - 20.5 {
                subDrugButton.frame.origin.x = 20.5
                subDrugButton.frame.origin.y = subDrugButton.frame.maxY + 10
            }
            guard let isCheck = drugs[i][drugDataKey.isCheck] as? Bool else { print("isCheck error"); continue }
            subDrugButton.isSelected = isCheck
            
            maxX = subDrugButton.frame.maxX + 10
            maxY = subDrugButton.frame.origin.y
            buttonSizeHeight = subDrugButton.frame.size.height
            
            subDrugButton.addTarget(event: UIControl.Event.touchUpInside) { (button) in
                self.delegate?.subDrugViewSubDrugButtonPressed?(subDrugView: self, subDrugButton: subDrugButton)
            }
            
            self.addSubview(subDrugButton)
            
            subDrugButtons.append(subDrugButton)
        }
        
        self.frame.size.height = maxY + buttonSizeHeight + 10
        
    }
    
    override init(frame: CGRect) {
        super.init(frame:frame)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
class SubDrugButton: UIButton {
    
    var indexPath = IndexPath(row: 0, section: 0)
    var drugName = ""
    
    override var isSelected: Bool {
        willSet(newValue) {
            self.backgroundColor = newValue ? UIColor(red: 59/255, green: 77/255, blue: 91/255, alpha: 1) : UIColor(white: 247/255, alpha: 1)
            self.layer.borderWidth =  newValue ? 0 : 0.5
            self.setTitleColor(newValue ? UIColor.white : UIColor.black , for: .normal)
        }
        
    }
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        
        self.layer.cornerRadius = 10
        self.backgroundColor = UIColor(white: 247/255, alpha: 1)
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor(white: 218/255, alpha: 1).cgColor
        
        self.titleLabel?.font = UIFont(name: NanumGothicOTF, size: 13)
        self.setTitleColor(UIColor.black, for: .normal)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

