import UIKit


func showDrugNotiView(date kDate: Date){
    
    let date = Calendar.current.date(bySettingHour: 23, minute: 59, second: 59, of: kDate)!
    
    let timeString = dateToStringWithFormat(formatString: "YYYYMMdd", date: date)
    
    var alrams = [Alram_R]()
    for key in ALRAM_KEY.KEYS {
        if let targetAlram = RealmCenter.shared.realm.objects(Alram_R.self).filter("alramKey=%@", key).filter("registerTime<=%@", date).last {
            alrams.append(targetAlram)
        }
    }
    
    if alrams.count == 0 {return}
    
    print("alrams : \(alrams)")
    
//    DayComponentOfDrug_R
    
    var dayComponentOfDrugs = [DayComponentOfDrug_R]()
    
    for i in 0..<alrams.count {
        
        let alram = alrams[i]AlramCenter.shared.readTakeDrugInfos()
        
        
        if let dayComponentOfDrug = RealmCenter.shared.realm.objects(DayComponentOfDrug_R.self).filter("Day==%@", timeString).filter("alramKey==%@",alram.alramKey).last {
           //이미 있는 경우

            //약물 리스트가 동일한지 확인
            let checkKindOfDrugs = alram.kindOfDrugs.filter("isCheck==%@",true)
            if checkKindOfDrugs.count > 0 {
                //1 약물의 갯수가 동일한가
                if dayComponentOfDrug.kindOfDrugs.count == checkKindOfDrugs.count {
                    //모든 약물 이름이 동일한가
                    var check = true
                    for i in 0..<checkKindOfDrugs.count {
                        let kindOfDrug_Day = checkKindOfDrugs[i]
                        
                        //같은 이름의 약물이 있는지 찾기
                        if let _ = dayComponentOfDrug.kindOfDrugs.filter("name==%@", kindOfDrug_Day.name).first {
                            //약물의 이름이 같은게 존재
                            
                        }else{
                            //약물 이름이 같은게 없음
                            check = false
                            
                        }
                    }
                    
                    //모든 체크를 통과하면 담기
                    if check {
                        
                        dayComponentOfDrugs.append(dayComponentOfDrug)
                        continue
                    }else{
                        
                        RealmCenter.shared.write(doSomething: { (realm) in
                            realm.delete(dayComponentOfDrug)
                        }) { (success, error) in
//                            print("기존거 삭제 : \(success ? "성공":"실패")")
                        }
                    }
                }
            }
        }
        //약물리스트가 다르거나,
        //없는 경우 -> 알람 정보를 기반으로 새로 생성
        print("없는 경우 -> 알람 정보를 기반으로 새로 생성")
        dayComponentOfDrugs.append(makeNewDayComponentOfDrug(alram: alram, timeString: timeString))

    }
    
    DispatchQueue.main.async {
        appDel.drugNotiView?.removeFromSuperview()
        appDel.drugNotiView = DrugNotiView(drugNotiInfos: dayComponentOfDrugs)
        appDel.drugNotiView!.date = date
        appDel.window?.addSubview(appDel.drugNotiView!)
    }
}

func makeNewDayComponentOfDrug(alram : Alram_R, timeString : String) -> DayComponentOfDrug_R {
    
    let newDayComponentOfDrug = DayComponentOfDrug_R()
    newDayComponentOfDrug.Day =  timeString
    newDayComponentOfDrug.alramKey = alram.alramKey
    newDayComponentOfDrug.isTake = false
    newDayComponentOfDrug.hour = alram.hour
    newDayComponentOfDrug.minute = alram.minute
    
    for i in 0..<alram.kindOfDrugs.count {
        let kindOfDrugOfAlram = alram.kindOfDrugs[i]
        if kindOfDrugOfAlram.isCheck {
            let newKindOfDrug = KindOfDrug_R()
            newKindOfDrug.isCheck = kindOfDrugOfAlram.isCheck
            newKindOfDrug.name = kindOfDrugOfAlram.name
            for drug in kindOfDrugOfAlram.drugs{
                newKindOfDrug.drugs.append(drug)

            }
            newDayComponentOfDrug.kindOfDrugs.append(newKindOfDrug)
        }
    }
    
    RealmCenter.shared.write(doSomething: { (realm) in
        realm.add(newDayComponentOfDrug)
    }) { (success, error) in
        
    }
    
    return newDayComponentOfDrug
}

class DrugNotiView: UIView, DrugTimeViewDelegate {
    
    var date = Date() {
        willSet(newValue){
            self.updateDateLabel(date: newValue)
        }
    }
    
    var dayOfDrug : DayOfDrug_R!
    var dayComponentOfDrugs = [DayComponentOfDrug_R]()
    
    var dateLabel : UILabel!

    var drugViews = [DrugView]()

    convenience init(drugNotiInfos kDayComponentOfDrugs : [DayComponentOfDrug_R]) {
        self.init(frame: SCREEN.BOUND)

        self.dayComponentOfDrugs = kDayComponentOfDrugs
        
        let backCloseButtonView = UIButton(frame: self.bounds)
        backCloseButtonView.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        backCloseButtonView.addTarget(event: .touchUpInside) { (button) in
            appDel.drugManagementVC?.drugManageView.calendarView.dataUpdate()
            self.removeFromSuperview()
        }
        self.addSubview(backCloseButtonView)
        
        let contentBackView = UIButton(frame: CGRect(x: 0, y: STATUS_BAR_HEIGHT + 30, width: SCREEN.WIDTH * 0.85, height: SCREEN.HEIGHT - (STATUS_BAR_HEIGHT + 30 + 19 + SAFE_AREA)))
        contentBackView.addTarget(event: .touchUpInside) { (button) in
            appDel.drugManagementVC?.drugManageView.calendarView.dataUpdate()
            self.removeFromSuperview()
        }
        contentBackView.center.x = SCREEN.WIDTH / 2
        self.addSubview(contentBackView)
        
        let closeImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 16.5, height: 17))
        closeImageView.center.x = contentBackView.frame.size.width / 2
        closeImageView.image = #imageLiteral(resourceName: "btn_d_closed1")
        closeImageView.isUserInteractionEnabled = false
        contentBackView.addSubview(closeImageView)

        let contentView = UIView(frame: CGRect(x: 0, y: closeImageView.frame.maxY + 14, width: SCREEN.WIDTH * 0.85, height: contentBackView.frame.size.height - (closeImageView.frame.maxY + 14)))
        contentView.backgroundColor = UIColor.white
        contentView.layer.cornerRadius = 2.5
        contentBackView.addSubview(contentView)

        let bgImage = #imageLiteral(resourceName: "bg")
        let bgImageView = UIImageView(frame: contentView.bounds)
        bgImageView.image = bgImage
        bgImageView.frame.size.height = 156
        contentView.addSubview(bgImageView)

        self.dateLabel = UILabel(frame: CGRect(x: 0, y: bgImageView.frame.size.height - 50, width: contentView.frame.size.width, height: 50))
        self.dateLabel.textAlignment = .center
        self.dateLabel.font = UIFont(name: Nanum_Barun_Gothic_OTF, size: 17.5)
        self.dateLabel.textColor = UIColor.white
        self.dateLabel.backgroundColor = UIColor(red: 27/255, green: 36/255, blue: 49/255, alpha: 0.78)
        contentView.addSubview(self.dateLabel)

        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: contentView.frame.size.width, height: bgImageView.frame.size.height - 50))
        titleLabel.backgroundColor = UIColor.clear
        titleLabel.numberOfLines = 4
        titleLabel.textAlignment = .center
        contentView.addSubview(titleLabel)

        let attributedString = NSMutableAttributedString(string: "성공적인 치료를 위해서는 \n꾸준한 약물 복용이 중요합니다.\n\n오늘 약물을 복용하셨나요?", attributes: [
            .font: UIFont(name: Nanum_Barun_Gothic_OTF, size: 13.0)!,
            .foregroundColor: UIColor(white: 1.0, alpha: 1.0),
            .kern: -0.26
            ])
        attributedString.addAttributes([
            .font: UIFont(name: Nanum_Barun_Gothic_OTF, size: 18.0)!,
            .kern: -0.36
            ], range: NSRange(location: 33, length: 14))
        titleLabel.attributedText = attributedString

        let scrollView = UIScrollView(frame: CGRect(x: 0, y: dateLabel.frame.maxY, width: contentView.frame.size.width, height: contentView.frame.size.height - dateLabel.frame.maxY))
        contentView.addSubview(scrollView)

        var maxY : CGFloat = 0

        for i in 0..<self.dayComponentOfDrugs.count {
            let drugView = DrugView(originY: maxY, sizeWidth: contentView.frame.size.width, dayComponentOfDrug: self.dayComponentOfDrugs[i])
            drugView.drugTimeView.delegate = self
            scrollView.addSubview(drugView)
            maxY = drugView.frame.maxY
        }

        if maxY <= scrollView.frame.size.height {
            scrollView.frame.size.height = maxY
            contentView.frame.size.height = scrollView.frame.maxY
            contentBackView.frame.size.height = contentView.frame.maxY
        }
        
        contentBackView.center.y =  self.frame.size.height / 2
//        closeImageView.frame.origin.y = contentView.frame.origin.y - 14 - closeImageView.frame.size.height
        scrollView.contentSize.height = max(maxY, scrollView.frame.size.height)


        //test
//        self.updateDateLabel(date: Date())


    }

    //MARK:DrugTimeViewDelegate
    func checkButtonPressed(drugTimeView: DrugTimeView) {
        //TODO //?/
        print("checkButtonPressed")
        let alramKey : String
        switch drugTimeView.alramType {
        case .morning:
            alramKey = ALRAM_KEY.MORNING
        case .lunch:
            alramKey = ALRAM_KEY.LUNCH
        case .dinner:
            alramKey = ALRAM_KEY.DINNER
        }
        
        var dayComponentOfDrugisCheck = false
        if let dayComponentOfDrug = (self.dayComponentOfDrugs.filter { (kDayComponentOfDrug) -> Bool in
            return kDayComponentOfDrug.alramKey == alramKey }).first {
            if let drugView = drugTimeView.superview as? DrugView {
                if let drugsView = drugView.drugsView {
                    for drugComponnentView in drugsView.drugComponnentViews {
                        if let kindOfDrug = dayComponentOfDrug.kindOfDrugs.filter("name==%@", drugComponnentView.contentLabel.text!).first {
                            if drugComponnentView.isCheck {
                                dayComponentOfDrugisCheck = true
                            }
                            RealmCenter.shared.write(doSomething: { (realm) in
                                kindOfDrug.isTake = drugComponnentView.isCheck
                            }) { (success : Bool, error : String?) in
                                print("check:\(success)")
                            }
                        }
                        
                    }
                }
            }
            
            RealmCenter.shared.write(doSomething: { (realm) in
                dayComponentOfDrug.isTake = dayComponentOfDrugisCheck
            }) { (success, error) in
                print("dayComponentOfDrug.isTake:\(success)")
            }
            
            DispatchQueue.main.async {
                print("dddd:\(dayComponentOfDrugisCheck)")
                
                drugTimeView.isCheck = dayComponentOfDrugisCheck
            }
        }
        
        
        
      
            //sendDataToServer
            guard let regNumString = userD.object(forKey: USER_KEY.KSR_REGISTRATION_NUMBER) as? String else {
                return
            }

//            //            new HttpParam("reg_num", prefs.getString("reg_num",null)),
//            //            new HttpParam("drug1", ""+chk1),
//            //            new HttpParam("drug2", ""+chk2),
//            //            new HttpParam("drug3", ""+chk3),
//            //            new HttpParam("drug4", ""+chk4),
//            //            new HttpParam("drug5", ""+chk5),
//            //            new HttpParam("etc", temp),
//            //            new HttpParam("year", ""+dateSelected.get(Calendar.YEAR)),
//            //            new HttpParam("month", ""+(dateSelected.get(Calendar.MONTH)+1)),
//            //            new HttpParam("week", ""+dateSelected.get(Calendar.WEEK_OF_YEAR)),
//            //            new HttpParam("dayweek", ""+dateSelected.get(Calendar.DAY_OF_WEEK)),
//            //            new HttpParam("day", ""+dateSelected.get(Calendar.DATE)),
//            //            new HttpParam("datetime", datetime.getText().toString()));
//            //
//
        
//        let date = Calendar.current.date(bySettingHour: 23, minute: 59, second: 59, of: kDate)!
        
        //?/
        let drugView = drugTimeView.superview as! DrugView
//         drugView.dayComponentOfDrug.hour
//            drugView.dayComponentOfDrug.minute
        
        let newDate = Calendar.current.date(bySettingHour: drugView.dayComponentOfDrug.hour, minute: drugView.dayComponentOfDrug.minute, second: 00, of: self.date)!

        
//            let year     = dateToStringWithFormat(formatString: "yyyy", date: self.date)
//            let month    = dateToStringWithFormat(formatString: "MM", date: self.date)
//            let week     = dateToStringWithFormat(formatString: "w", date: self.date)
//            let dayweek  = dateToStringWithFormat(formatString: "c", date: self.date)
//            let day      = dateToStringWithFormat(formatString: "dd", date: self.date)
//            let dateTime = dateToStringWithFormat(formatString: "yyyy.MM.dd a h:mm", date: self.date)
        let year     = dateToStringWithFormat(formatString: "yyyy", date: newDate)
        let month    = dateToStringWithFormat(formatString: "MM", date: newDate)
        let week     = dateToStringWithFormat(formatString: "w", date: newDate)
        let dayweek  = dateToStringWithFormat(formatString: "c", date: newDate)
        let day      = dateToStringWithFormat(formatString: "dd", date: newDate)
        let dateTime = dateToStringWithFormat(formatString: "yyyy.MM.dd a h:mm", date: newDate)
//
//            print("checkDrugs:\(checkDrugs)")
//
            var sendDataDic = [
                "reg_num":regNumString,
                "year":year,
                "month":month,
                "week":week,
                "dayweek":dayweek,
                "day":day,
                "datetime":dateTime,
                
                "hm_htx_asp":"0",
                "hm_htx_clopi":"0",
                "hm_htx_as_dypi" : "0",
                "hm_htx_cilo":"0",
                "hm_htx_trif":"0",
                "hm_htx_ticl":"0",
                
                "hm_htx_wfr":"0",
                "hm_htx_apix":"0",
                "hm_htx_dabig":"0",
                "hm_htx_edo":"0",
                "hm_htx_rivar":"0",
                "hm_htx_lmwh":"0",
                
                "hm_htx_htn":"0",
                "hm_htx_statin":"0",
                "hm_htx_htn_o":"0",
                "hm_htx_dm":"0",
                "hm_htx_dem":"0",
                "etc":"0"
                ]
        
        print("dayComponentOfDrugs:\(dayComponentOfDrugs)")
        
        for dayComponentOfDrug in dayComponentOfDrugs {
            for kindOfDrug in dayComponentOfDrug.kindOfDrugs {
                
                if kindOfDrug.name == "고혈압약" { sendDataDic["hm_htx_htn"] = "1" }
                if kindOfDrug.name == "당뇨약" { sendDataDic["hm_htx_dm"] = "1" }
                if kindOfDrug.name == "치매약" { sendDataDic["hm_htx_dem"] = "1" }
                if kindOfDrug.name == "기타", let etcDrug = kindOfDrug.drugs.first {
                    sendDataDic["etc"] = etcDrug.name
                }
                
                if kindOfDrug.isTake {
                    for drug in kindOfDrug.drugs {
                        if drug.name == "아스피린" { sendDataDic["hm_htx_asp"] = "1" }
                        if drug.name == "클로피도그렐" { sendDataDic["hm_htx_clopi"] = "1" }
                        if drug.name == "아스피린+디피리다몰" { sendDataDic["hm_htx_as_dypi"] = "1" }
                        if drug.name == "실로스타졸" { sendDataDic["hm_htx_cilo"] = "1" }
                        if drug.name == "트리플루살" { sendDataDic["hm_htx_trif"] = "1" }
                        if drug.name == "티클로피딘" { sendDataDic["hm_htx_ticl"] = "1" }
                        
                        if drug.name == "와파린" { sendDataDic["hm_htx_wfr"] = "1" }
                        if drug.name == "아픽사반" { sendDataDic["hm_htx_apix"] = "1" }
                        if drug.name == "다비가트란" { sendDataDic["hm_htx_dabig"] = "1" }
                        if drug.name == "에독사반" { sendDataDic["hm_htx_edo"] = "1" }
                        if drug.name == "리바록사반" { sendDataDic["hm_htx_rivar"] = "1" }
                        if drug.name == "저분자헤파린" { sendDataDic["hm_htx_lmwh"] = "1" }
                        
                        if drug.name == "스타틴" { sendDataDic["hm_htx_statin"] = "1" }
                        if drug.name == "기타 이상지질혈증약" { sendDataDic["hm_htx_htn_o"] = "1" }
                    }
                }
            }
        }
        
        
        
        print("sendDataDic:\n\(sendDataDic)")
        Server.getData(type: Server.InfoType.DRUG_ALRAM_SET, otherInfo: sendDataDic) { (kData:Data?) in
            if let data = kData {
                if let dataString : String = String(data: data, encoding: String.Encoding.utf8) {
                    print("DRUG_ALRAM_SET - return : \(dataString)")
                }
            }
        }
    }
    
    func updateDateLabel( date : Date ){
        self.dateLabel.text = DateCenter.shared.dateToStringWithFormat(formatString: "yyyy년 M월 d일 cccc", date: date)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }



}

class DrugView: UIView {

    var dayComponentOfDrug : DayComponentOfDrug_R!
    
    var drugTimeView : DrugTimeView!
    var drugsView : DrugsView!
    var alramType : AlramType = .morning
    
    convenience init(originY : CGFloat, sizeWidth : CGFloat, dayComponentOfDrug : DayComponentOfDrug_R) {
        self.init(frame: CGRect(x: 0, y: originY, width: sizeWidth, height: 0))

        drugTimeView = DrugTimeView(SizeWidth: sizeWidth)

        self.dayComponentOfDrug = dayComponentOfDrug
        
        switch dayComponentOfDrug.alramKey {
        case ALRAM_KEY.MORNING:
            drugTimeView.alramType = .morning
        case ALRAM_KEY.LUNCH:
            drugTimeView.alramType = .lunch
        case ALRAM_KEY.DINNER:
            drugTimeView.alramType = .dinner
        default:
            drugTimeView.alramType = .morning
        }

        drugTimeView.isCheck = dayComponentOfDrug.isTake
        
        drugTimeView.timeStringUpdate(hour: dayComponentOfDrug.hour, minute: dayComponentOfDrug.minute)
        self.addSubview(drugTimeView)
        
        drugsView = DrugsView(originY: drugTimeView.frame.maxY + 15, sizeWidth: sizeWidth, componentOfDay: dayComponentOfDrug)
        
        self.addSubview(drugsView)
        self.frame.size.height = drugsView.frame.maxY

    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class DrugTimeView: UIView {

    var delegate : DrugTimeViewDelegate?

    var alramType : AlramType = .morning
    
    var isCheck = false {
        willSet(newValue) {
            self.backgroundColor = newValue ? UIColor(red: 71/255, green: 187/255, blue: 171/255, alpha: 1) : UIColor(white: 132/255, alpha: 1)
        }
    }

    var timeLabel : UILabel!
    var checkButton : UIButton!

    convenience init(SizeWidth : CGFloat){
        self.init(frame: CGRect(x: 0, y: 0, width: SizeWidth, height: 40))

        self.backgroundColor = UIColor(white: 132/255, alpha: 1)

        timeLabel = UILabel(frame: CGRect(x: 15, y: 0, width: self.frame.size.width / 2, height: self.frame.size.height))
        self.addSubview(timeLabel)

        checkButton = UIButton(frame: CGRect(x: self.frame.size.width - 80 - 12.5, y: 0, width: 80, height: 25))
        checkButton.center.y = self.frame.size.height / 2
        checkButton.layer.cornerRadius = 2.5
        checkButton.layer.borderColor = UIColor.white.cgColor
        checkButton.layer.borderWidth = 0.5
        checkButton.backgroundColor = UIColor.clear
        checkButton.addTarget(event: .touchUpInside) { (button) in
            self.delegate?.checkButtonPressed?(drugTimeView: self)
        }
        self.addSubview(checkButton)

        let checkImage = #imageLiteral(resourceName: "checkCircle")
        let checkImageView = UIImageView(image: checkImage)
        checkImageView.frame = CGRect(x: 10, y: 0, width: 14, height: 14)
        checkImageView.center.y = checkButton.frame.size.height / 2
        checkImageView.isUserInteractionEnabled = false
        checkButton.addSubview(checkImageView)

        let checkButtonTitleLabel = UILabel(frame: CGRect(x: checkImageView.frame.maxX, y: 0, width: checkButton.frame.size.width - checkImageView.frame.maxX, height: checkButton.frame.size.height))
        checkButtonTitleLabel.textAlignment = .center
        checkButtonTitleLabel.font = UIFont(name: Nanum_Barun_Gothic_OTF, size: 13)
        checkButtonTitleLabel.textColor = UIColor.white
        checkButtonTitleLabel.text = "복용확인"
        checkButton.addSubview(checkButtonTitleLabel)

    }

    func timeStringUpdate(hour : Int, minute : Int){
//yyyymmdd
//        let amOrPmString = DateCenter.shared.dateToStringWithFormat(formatString: "a", date: time)
        let amOrPmString = hour > 12 ? "오후" : "오전"
        let timeString = String(format: "%d:%02d", hour > 12 ? hour - 12 : hour, minute)
//            DateCenter.shared.dateToStringWithFormat(formatString: "h:mm", date: time)

        let amOrPmStringAttributed = [
            NSAttributedStringKey.font : UIFont(name: Nanum_Barun_Gothic_OTF, size: 13)!,
            NSAttributedStringKey.foregroundColor: UIColor.white,
            ]
        let timeStringAttributed = [
            NSAttributedStringKey.font: UIFont(name: Nanum_Barun_Gothic_OTF_Bold, size: 20)!,
            NSAttributedStringKey.foregroundColor: UIColor.white,
            ]

        let stringInfos = [
            ("\(amOrPmString) ",amOrPmStringAttributed),
            (timeString,timeStringAttributed)
            ] as [(String,[NSAttributedStringKey:NSObject])]

        self.timeLabel.attributedText = NSMutableAttributedString(stringsInfos: stringInfos)

    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

//DrugTimeView
class DrugsView: UIView {

    var dayComponentOfDrug : DayComponentOfDrug_R!
    
    var drugComponnentViews = [DrugComponnentView]()

    convenience init(originY : CGFloat, sizeWidth : CGFloat, componentOfDay kDayComponentOfDrug : DayComponentOfDrug_R) {
        self.init(frame: CGRect(x: 0, y: originY, width: sizeWidth, height: 0))
        
        self.dayComponentOfDrug = kDayComponentOfDrug
        
        var maxY : CGFloat = 0
        for i in 0..<self.dayComponentOfDrug.kindOfDrugs.count {

            let kindOfDrug = self.dayComponentOfDrug.kindOfDrugs[i]
            
            let drugComponnentView = DrugComponnentView(frame: CGRect(x: 0, y: CGFloat(i) * (17 + 20), width: self.frame.size.width, height: 17), drug: kindOfDrug)
            
            if kindOfDrug.isTake {
                drugComponnentView.checkButtonPressed(button: drugComponnentView.checkButton)
            }
            
            self.addSubview(drugComponnentView)

            drugComponnentViews.append(drugComponnentView)

            maxY = drugComponnentView.frame.maxY
        }
        
        self.frame.size.height = maxY + 26

    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    
}

