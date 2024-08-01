//DayComponentOfDrug 복용확인//


import UIKit
var myCount = 0

func showDrugNotiView(date kDate: Date){
    
    
    
    let date = Calendar.current.date(bySettingHour: 23, minute: 59, second: 59, of: kDate)!
    
    let timeString = dateToStringWithFormat(formatString: "YYYYMMdd", date: date)
    
    var alrams = [Alram_R]()
    for key in ALRAM_KEY.KEYS {
        
        
        let targetAlram = RealmCenter.shared.realm.objects(Alram_R.self).filter("alramKey=%@", key).filter("registerTime<=%@", date)
        print("alram --> \(targetAlram)")
        
        if targetAlram.count > 0 {
            for alram in targetAlram {
                
                
                // 이거 삭제 시 달력에 저장 안됨
                
                alrams.append(alram)
                
            }
//            
//            
//            
        }
        
//        if let targetAlram = RealmCenter.shared.realm.objects(Alram_R.self).filter("alramKey=%@", key).filter("registerTime<=%@", date).last {
//            alrams.append(targetAlram)
//        }
    }
    
    
    
    
 
    
    
    
    
    
    
    if alrams.count == 0 {return}
    
    print("alrams.count : \(alrams.count)")
    
//    DayComponentOfDrug_R
    
    var dayComponentOfDrugs = [DayComponentOfDrug_R]()
    
    for i in 0..<alrams.count {
        
        
        
//        //달력 클릭시 복약 % +1
//        let alram = alrams[i]
//        print("alram---- \(alram)")
        
        
        let alram = alrams[i]
        
        print("alramcount :\(alram)")
        
        AlramCenter.shared.readTakeDrugInfos()
        
        
        print("alram.idx :\(alram.idx)")
        
        
        
//하는거 없어보여서 주석
//        if let dayComponentOfDrug = RealmCenter.shared.realm.objects(DayComponentOfDrug_R.self).filter("Day==%@", timeString).filter("alramKey==%@",alram.alramKey).first {
////            
//            print("aaa:\(dayComponentOfDrug)")
////
////           //이미 있는 경우
////            
////            
////            
////            
////
////            //약물 리스트가 동일한지 확인
//            let checkKindOfDrugs = alram.kindOfDrugs.filter("isCheck==%@",true)
//            if checkKindOfDrugs.count > 0 {
//                //1 약물의 갯수가 동일한가
//                if dayComponentOfDrug.kindOfDrugs.count == checkKindOfDrugs.count {
//                    //모든 약물 이름이 동일한가
//                    var check = true
//                    for i in 0..<checkKindOfDrugs.count {
//                        let kindOfDrug_Day = checkKindOfDrugs[i]
//                        
//                        //같은 이름의 약물이 있는지 찾기
//                        if let _ = dayComponentOfDrug.kindOfDrugs.filter("name==%@", kindOfDrug_Day.name).first {
//                            //약물의 이름이 같은게 존재
//                            
//                        }else{
//                            //약물 이름이 같은게 없음
//                            check = false
//                            
//                        }
//                    }
//                    
//                    //모든 체크를 통과하면 담기
//                    if check {
//                        
////                        dayComponentOfDrugs.append(dayComponentOfDrug)
////                        continue
//                    }else{
//                        
//                        RealmCenter.shared.write(doSomething: { (realm) in
//                            //// 날짜별 삭제 기능??
////                            realm.delete(dayComponentOfDrug)
//                            
//                        }) { (success, error) in
////                            print("기존거 삭제 : \(success ? "성공":"실패")")
//                        }
//                    }
//                }
//            }
//            
//            
//        }
//        
        
        

        // todo
        
        
        
        //약물리스트가 다르거나,
        //없는 경우 -> 알람 정보를 기반으로 새로 생성
        print("없는 경우 -> 알람 정보를 기반으로 새로 생성")
        dayComponentOfDrugs.append(makeNewDayComponentOfDrug(alram: alram, timeString: timeString))

    }
    
    DispatchQueue.main.async {
        print("?????")
        sceneDel!.drugNotiView?.removeFromSuperview()
        print("?????1")
        sceneDel!.drugNotiView = DrugNotiView(drugNotiInfos: dayComponentOfDrugs)
        print("?????2")
        sceneDel!.drugNotiView!.date = date
        print("?????3")
        sceneDel!.window?.addSubview(sceneDel!.drugNotiView!)
        print("?????4")
//        sceneDel?.drugManagementVC?.drugManageView.calendarView.calendarViewWithManage.layoutIfNeeded()
//        sceneDel?.drugManagementVC?.drugManageView.calendarView.layoutIfNeeded()
        appDel.drugManagementVC?.drugManageView.calendarView.dataUpdate()
        
        
        
        

        
    }
}
// 새로운 알람창 생성(만들기)
func makeNewDayComponentOfDrug(alram : Alram_R, timeString : String) -> DayComponentOfDrug_R {
    
//    let newDayComponentOfDrug = DayComponentOfDrug_R()
//    let idx_alram = RealmCenter.shared.realm.objects(Alram_R.self).filter("idx==%@", alram.idx).first
//    print("idx_alram\(idx_alram)")
//    
//    
//    newDayComponentOfDrug.idx = newDayComponentOfDrug.IncrementaIDX()
//    newDayComponentOfDrug.alramIdx = idx_alram!.idx
//    
//    newDayComponentOfDrug.Day =  timeString
//    newDayComponentOfDrug.alramKey = alram.alramKey
//    newDayComponentOfDrug.isTake = false
//    newDayComponentOfDrug.hour = alram.hour
//    newDayComponentOfDrug.minute = alram.minute
//    
//    for i in 0..<alram.kindOfDrugs.count {
//        let kindOfDrugOfAlram = alram.kindOfDrugs[i]
//        if kindOfDrugOfAlram.isCheck {
//            let newKindOfDrug = KindOfDrug_R()
//            newKindOfDrug.isCheck = kindOfDrugOfAlram.isCheck
//            newKindOfDrug.name = kindOfDrugOfAlram.name
//            for drug in kindOfDrugOfAlram.drugs{
//                newKindOfDrug.drugs.append(drug)
//
//            }
//            newDayComponentOfDrug.kindOfDrugs.append(newKindOfDrug)
//        }
//    }
//    
//    RealmCenter.shared.write(doSomething: { (realm) in
//        realm.add(newDayComponentOfDrug)
//    }) { (success, error) in
//        
//    }
//    
//    return newDayComponentOfDrug
    
    var newDayComponentOfDrug = DayComponentOfDrug_R() //바꾸지좀 마
    
    
    var dbKindOfDrug = Array<KindOfDrug_R>()

    if let dayComponentOfDrug = RealmCenter.shared.realm.objects(DayComponentOfDrug_R.self).filter("alramIdx==%@", alram.idx).filter("Day==%@", timeString).first {
        
//        let dayComponentOfDrug2 = dayComponentOfDrug.kindOfDrugs
//        
        for kindOfDrug in dayComponentOfDrug.kindOfDrugs {
            dbKindOfDrug.append(kindOfDrug)
        }
        

        
        
        RealmCenter.shared.write(doSomething: { (realm) in

            
            
//            let dbKindOfDrugs = dayComponentOfDrug.copy()
            
//            dayComponentOfDrug.Day =  timeString
            dayComponentOfDrug.alramKey = alram.alramKey
//            dayComponentOfDrug.isTake = false
//            dayComponentOfDrug.hour = alram.hour
//            dayComponentOfDrug.minute = alram.minute
            
            dayComponentOfDrug.kindOfDrugs.removeAll()
            
            
//
            for i in 0..<alram.kindOfDrugs.count {
                let kindOfDrugOfAlram = alram.kindOfDrugs[i]
               
                

                if kindOfDrugOfAlram.isCheck {
                    
                    

                    

                            
                            
                    
//                    print("aaa: \(kindOfDrugOfAlram.name)")
//                    print("aaa isCheck: \(kindOfDrugOfAlram.isCheck)")
//                    print("aaa isTake: \(kindOfDrugOfAlram.isTake)")
                    
//                    if let drug = dayComponentOfDrug.kindOfDrugs.filter("name==%@", kindOfDrugOfAlram.name).first {
//                        
//                        print("aaa isTake: \(drug.isTake)")
//
//                        newKindOfDrug.isTake = drug.isTake
//
//                    }
                    
                    let newKindOfDrug = KindOfDrug_R()
                    
                    newKindOfDrug.name = kindOfDrugOfAlram.name
                    
                    let day2 = RealmCenter.shared.realm.objects(DayComponentOfDrug_R.self)
                    
                    print("day2day2day2day2day2day2:\(day2)")
                    
                    
                    for dbDrug in dbKindOfDrug {
                        if kindOfDrugOfAlram.name == dbDrug.name && dbDrug.isTake {
//                            print("aaa isTake: \(dbDrug.name) \(dbDrug.isTake) ")
                            newKindOfDrug.isTake = true
                        }
                    }
                    
                    for drug in kindOfDrugOfAlram.drugs{
                        newKindOfDrug.drugs.append(drug)

                    }
                    dayComponentOfDrug.kindOfDrugs.append(newKindOfDrug)
                }
            }
            
            newDayComponentOfDrug = dayComponentOfDrug


        }) { (success:Bool, error:String?) in
        
        }
//일단 주석
        
      
        
       
        
        newDayComponentOfDrug = dayComponentOfDrug

        
    } else {
//        let newDayComponentOfDrug = DayComponentOfDrug_R()
        
        newDayComponentOfDrug.idx = newDayComponentOfDrug.IncrementaIDX()
        newDayComponentOfDrug.alramIdx = alram.idx
        
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
    
    var eatImg : UIImageView!
    var eatImage : UIImage!
    
    var dateLabelView: UIView!
    
    var dateLabel : UILabel!

    var drugViews = [DrugView]()
    
    var buttonX: UIButton!

    convenience init(drugNotiInfos kDayComponentOfDrugs : [DayComponentOfDrug_R]) {
        self.init(frame: SCREEN.BOUND)
        
        self.backgroundColor = #colorLiteral(red: 0.1343532503, green: 0.7109544873, blue: 0.7980350852, alpha: 1)
        
        
        self.setGradient2(color1: UIColor(red: 35.0 / 255.0, green: 207.0 / 255.0, blue: 193.0 / 255.0, alpha: 1), color2: UIColor(red: 35.0 / 255.0, green: 173.0 / 255.0, blue: 207 / 255.0, alpha: 1))
        
        
        
        
        
        
//        self.backgroundColor = UIColor(patternImage: UIImage(named: "backGround")!)
        
        eatImg = UIImageView(frame: CGRect(x: self.frame.size.width / 2.3, y: 80, width: 50, height: 50))
        eatImg.image = UIImage(named: "eat")
        
        
        self.addSubview(eatImg)
        
       
        
        
        
        self.dayComponentOfDrugs = kDayComponentOfDrugs
        
        let backCloseButtonView = UIButton(frame: CGRect(x: 0, y: 0, width: SCREEN.WIDTH, height: SCREEN.HEIGHT))
//        backCloseButtonView.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        backCloseButtonView.backgroundColor = .clear
        backCloseButtonView.addTarget(event: .touchUpInside) { (button) in
            print("ㄴ나가기")
            self.removeFromSuperview()
            
//            sceneDel!.drugManagementVC?.drugManageView.calendarView.dataUpdate()
        
            
            
            
           
            
            
        }
        
        
        
        
        
        
        self.addSubview(backCloseButtonView)
         // 왠지 얘네 백그라운드 일듯?
        
        let contentBackView = UIButton(frame: CGRect(x: 0, y: 0, width: SCREEN.WIDTH , height: SCREEN.HEIGHT))
        contentBackView.addTarget(event: .touchUpInside) { (button) in
            appDel.drugManagementVC?.drugManageView.calendarView.dataUpdate()
            self.removeFromSuperview()
        }
//        contentBackView.center.x = SCREEN.WIDTH / 2
        self.addSubview(contentBackView)
        
        
        let closeImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 16.5, height: 17))
//        closeImageView.center.x = contentBackView.frame.size.width / 2
        closeImageView.image = #imageLiteral(resourceName: "icDate")
        closeImageView.isUserInteractionEnabled = false
//        contentBackView.addSubview(closeImageView)

        let contentView = UIView(frame: CGRect(x: 0, y: 0, width: SCREEN.WIDTH, height: contentBackView.frame.height))
        contentView.backgroundColor = UIColor.clear
        contentView.layer.cornerRadius = 2.5
        contentBackView.addSubview(contentView)
        
        
        
        
        
//        let buttonX = UIButton(frame: CGRect(x: SCREEN.WIDTH / 1.2, y: 50, width: 30, height: 30))
////        buttonX.backgroundColor = .white
//        buttonX.setImage(UIImage(named: "imgX"), for: .normal)
////        buttonX.addTarget(self, action: #selector(goBack(_ :)), for: .touchUpInside)
//        self.addSubview(buttonX)
//        
////        let imageX = UIImage(named: "imgX")
////        let imageViewX = UIImageView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
////        
////        imageViewX.image = imageX
//////        bgImageView.frame.size.height = 156
////        buttonX.addSubview(imageViewX)

        
        // 수정중
        let bgImage = #imageLiteral(resourceName: "eat")
        let bgImageView = UIImageView(frame: CGRect(x: SCREEN.WIDTH / 2.2, y: 100, width: 60, height: 60))
        bgImageView.image = bgImage
//        bgImageView.frame.size.height = 156
//        self.addSubview(bgImageView)
        
        
        buttonX = UIButton(frame: CGRect(x: SCREEN.WIDTH / 1.2, y: 50, width: 30, height: 30))
//        buttonX.backgroundColor = .white
        buttonX.setImage(UIImage(named: "imgX"), for: .normal)
        buttonX.addTarget(event: .touchUpInside) { (button) in
//            sceneDel!.drugManagementVC?.drugManageView.calendarView.dataUpdate()
            appDel.drugManagementVC?.drugManageView.calendarView.dataUpdate()
            self.removeFromSuperview()
        }
        
        self.addSubview(buttonX)

//        self.dateLabel = UILabel(frame: CGRect(x: 0, y: titleLabel.frame.maxY + 15, width: contentView.frame.size.width, height: 50))
//        self.dateLabel.textAlignment = .center
//        self.dateLabel.font = UIFont(name: Nanum_Barun_Gothic_OTF, size: 17.5)
//        self.dateLabel.textColor = UIColor.white
//        self.dateLabel.backgroundColor = UIColor(red: 27/255, green: 36/255, blue: 49/255, alpha: 0.78)
//        self.addSubview(self.dateLabel)

        
        
        let titleLabel = UILabel(frame: CGRect(x: 0, y: eatImg.frame.maxY + 10, width: SCREEN.WIDTH, height: bgImageView.frame.size.height + 100))
        titleLabel.backgroundColor = UIColor.clear
        titleLabel.numberOfLines = 4
        titleLabel.textAlignment = .center
        self.addSubview(titleLabel)

        let attributedString = NSMutableAttributedString(string: "성공적인 치료를 위해서는 \n꾸준한 약물 복용이 중요합니다.\n\n오늘 약물을 복용하셨나요?", attributes: [
            .font: UIFont(name: "SUITE-Regular", size: 17),
            .foregroundColor: UIColor(white: 1.0, alpha: 1.0),
            .kern: -0.26
            ])
        attributedString.addAttributes([
            .font: UIFont(name: "SUITE-Regular", size: 23),
            .kern: -0.36
            ], range: NSRange(location: 33, length: 14))
        titleLabel.attributedText = attributedString
        
        
        
        self.dateLabelView = UIView(frame: CGRect(x: 0, y: titleLabel.frame.maxY + 5, width: contentView.frame.size.width, height: 50))
        self.dateLabelView.backgroundColor = UIColor(red: 0.1202328876, green: 0.4882584214, blue: 0.5617938042, alpha: 1).withAlphaComponent(0.8)
        self.addSubview(self.dateLabelView)
        
        //time label
        self.dateLabel = UILabel(frame: CGRect(x: 120, y: 0, width: 220, height: 50))
        
        if IS_IPHONE_12PRO_MAX {
            self.dateLabel = UILabel(frame: CGRect(x: 120, y: 0, width: 220, height: 50))
        }
        if IS_IPHONE_15PRO_MAX {
            self.dateLabel = UILabel(frame: CGRect(x: 120, y: 0, width: 220, height: 50))
        }
        if IS_IPHONE_12PRO {
            self.dateLabel = UILabel(frame: CGRect(x: 105, y: 0, width: 220, height: 50))
        }

        if IS_IPHONE_15PRO {
            self.dateLabel = UILabel(frame: CGRect(x: 105, y: 0, width: 220, height: 50))
        }
        if IS_IPHONE_MINI {
            self.dateLabel = UILabel(frame: CGRect(x: 95, y: 0, width: 220, height: 50))
        }
        if IS_IPHONE_N {
            self.dateLabel = UILabel(frame: CGRect(x: 105, y: 0, width: 220, height: 50))
        }

        
//        self.dateLabel.center.x = self.dateLabelView.frame.size.width / 2
        self.dateLabel.textAlignment = .center
        
        self.dateLabel.font = UIFont(name: "SUITE-Regular", size: 17.5)
        self.dateLabel.textColor = UIColor.white
//        self.dateLabel.backgroundColor = UIColor.white.withAlphaComponent(0.3)
//        self.dateLabel.backgroundColor = UIColor(red: 0.1202328876, green: 0.4882584214, blue: 0.5617938042, alpha: 1).withAlphaComponent(0.8)
        
        
        
//        self.dateLabel.backgroundColor = UIColor(red: 27/255, green: 36/255, blue: 49/255, alpha: 0.78)
        dateLabelView.addSubview(self.dateLabel)

        
        
        
        var penBtnImageView = UIImageView(frame: CGRect(x: 110, y: titleLabel.frame.maxY + 32, width: 17, height: 17))
        
        if IS_IPHONE_12PRO_MAX {
            penBtnImageView = UIImageView(frame: CGRect(x: 110, y: titleLabel.frame.maxY + 22, width: 17, height: 17))
        }
        if IS_IPHONE_15PRO_MAX {
            penBtnImageView = UIImageView(frame: CGRect(x: 110, y: titleLabel.frame.maxY + 22, width: 17, height: 17))
        }
        if IS_IPHONE_12PRO {
            penBtnImageView = UIImageView(frame: CGRect(x: 95, y: titleLabel.frame.maxY + 20, width: 17, height: 17))
        }
        if IS_IPHONE_15PRO {
            penBtnImageView = UIImageView(frame: CGRect(x: 95, y: titleLabel.frame.maxY + 20, width: 17, height: 17))
        }
        if IS_IPHONE_MINI {
            penBtnImageView = UIImageView(frame: CGRect(x: 95, y: titleLabel.frame.maxY + 20, width: 17, height: 17))
        }
        if IS_IPHONE_N_PLUS {
            penBtnImageView = UIImageView(frame: CGRect(x: 110, y: titleLabel.frame.maxY + 20, width: 17, height: 17))
        }
        if IS_IPHONE_N {
            penBtnImageView = UIImageView(frame: CGRect(x: 105, y: titleLabel.frame.maxY + 20, width: 17, height: 17))
        }
        
        
//        if IS_IPHONE_12PRO {
//            penBtnImageView = UIImageView(frame: CGRect(x: 12, y: 7, width: 10, height: 10))
//        } else if IS_IPHONE_15PRO {
//            penBtnImageView = UIImageView(frame: CGRect(x: 9, y: 9, width: 10, height: 10))
//        } else if IS_IPHONE_N_PLUS {
//            penBtnImageView = UIImageView(frame: CGRect(x: 9, y: 7, width: 9, height: 9))
//        } else if IS_IPHONE_N {
//            penBtnImageView = UIImageView(frame: CGRect(x: 8, y: 7, width: 8, height: 8))
//        } else if IS_IPHONE_12PRO_MAX {
//            penBtnImageView = UIImageView(frame: CGRect(x: 12, y: 8, width: 10, height: 10))
//        } else if IS_IPHONE_15PRO_MAX {
//            penBtnImageView = UIImageView(frame: CGRect(x: 12, y: 8, width: 10, height: 10))
//        }
        let penBtnImage = UIImage(named: "tiemLeft")
        penBtnImageView.image = penBtnImage
        
        self.addSubview(penBtnImageView)
        
        
        
        
        
        
        //datelabel scrollview
        

        var scrollView = UIScrollView(frame: CGRect(x: 0, y: dateLabel.frame.maxY, width: contentView.frame.size.width, height: contentView.frame.size.height - dateLabel.frame.maxY))
        if IS_IPHONE_12PRO_MAX {
//            scrollView = UIScrollView(frame: CGRect(x: 0, y: 175, width: contentView.frame.size.width, height: contentView.frame.size.height - dateLabel.frame.maxY))
            scrollView = UIScrollView(frame: CGRect(x: 0, y: 370, width: contentView.frame.size.width, height: contentView.frame.size.height - dateLabel.frame.maxY))
//            scrollView.backgroundColor = .yellow
            
            scrollView.updateContentSize()
            
            
        }
        if IS_IPHONE_15PRO_MAX {
            scrollView = UIScrollView(frame: CGRect(x: 0, y: 370, width: contentView.frame.size.width, height: contentView.frame.size.height - dateLabel.frame.maxY))
            scrollView.updateContentSize()
        }
        
        if IS_IPHONE_12PRO {
//            scrollView = UIScrollView(frame: CGRect(x: 0, y: dateLabel.frame.maxY, width: contentView.frame.size.width, height: contentView.frame.size.height - dateLabel.frame.maxY))
            scrollView = UIScrollView(frame: CGRect(x: 0, y: 350, width: contentView.frame.size.width, height: contentView.frame.size.height - dateLabel.frame.maxY))
            scrollView.updateContentSize()
        }
        if IS_IPHONE_15PRO {
//            scrollView = UIScrollView(frame: CGRect(x: 0, y: dateLabel.frame.maxY, width: contentView.frame.size.width, height: contentView.frame.size.height - dateLabel.frame.maxY))
            scrollView = UIScrollView(frame: CGRect(x: 0, y: 350, width: contentView.frame.size.width, height: contentView.frame.size.height - dateLabel.frame.maxY))
            scrollView.updateContentSize()
        }
        if IS_IPHONE_N_PLUS {
//            scrollView = UIScrollView(frame: CGRect(x: 0, y: dateLabel.frame.maxY, width: contentView.frame.size.width, height: contentView.frame.size.height - dateLabel.frame.maxY))
            scrollView = UIScrollView(frame: CGRect(x: 0, y: 355, width: contentView.frame.size.width, height: contentView.frame.size.height - dateLabel.frame.maxY))
            scrollView.updateContentSize()
        }
        if IS_IPHONE_N {
//            scrollView = UIScrollView(frame: CGRect(x: 0, y: dateLabel.frame.maxY, width: contentView.frame.size.width, height: contentView.frame.size.height - dateLabel.frame.maxY))
            scrollView = UIScrollView(frame: CGRect(x: 0, y: 350, width: contentView.frame.size.width, height: contentView.frame.size.height - dateLabel.frame.maxY))
            scrollView.updateContentSize()
        }
        
        if IS_IPHONE_X {
//            scrollView = UIScrollView(frame: CGRect(x: 0, y: dateLabel.frame.maxY, width: contentView.frame.size.width, height: contentView.frame.size.height - dateLabel.frame.maxY))
            scrollView = UIScrollView(frame: CGRect(x: 0, y: 350, width: contentView.frame.size.width, height: contentView.frame.size.height - dateLabel.frame.maxY))
            scrollView.updateContentSize()
        }
        
        contentView.addSubview(scrollView)

        var maxY : CGFloat = 0

        for i in 0..<self.dayComponentOfDrugs.count {
            let drugView = DrugView(originY: maxY, sizeWidth: contentView.frame.size.width, dayComponentOfDrug: self.dayComponentOfDrugs[i])
            drugView.drugTimeView.delegate = self
            scrollView.addSubview(drugView)
            maxY = drugView.frame.maxY
        }

//        if maxY <= scrollView.frame.size.height {
//            scrollView.frame.size.height = maxY
//            contentView.frame.size.height = scrollView.frame.maxY
//            contentBackView.frame.size.height = contentView.frame.maxY
//        }
        
        contentBackView.center.y =  self.frame.size.height / 2
//        closeImageView.frame.origin.y = contentView.frame.origin.y - 14 - closeImageView.frame.size.height
        //임시스크롤뷰높이조정
//        scrollView.contentSize.height = max(maxY, scrollView.frame.size.height + 1500)
        scrollView.updateContentSize()
        
        

        //test
//        self.updateDateLabel(date: Date())

        

    }
    

    
    
    //수정하는곳
    //MARK:DrugTimeViewDelegate
    func checkButtonPressed(drugTimeView: DrugTimeView) {
        
        
//        let DayIdx = RealmCenter.shared.realm.objects(DayComponentOfDrug_R.self).
        
        print("drugTimeView.idxdrugTimeView.idx:\(drugTimeView.idx)")
        
        
        
        print("언제 변경되니?")
        let alramKey : String
        
        switch drugTimeView.alramType {
        case .morning:
            alramKey = ALRAM_KEY.MORNING
        case .lunch:
            alramKey = ALRAM_KEY.LUNCH
        case .dinner:
            alramKey = ALRAM_KEY.DINNER
        }
        
        
        
//        drugTimeView.myLable
        
        
        var dayComponentOfDrugisCheck = false
//        if let dayComponentOfDrug = (self.dayComponentOfDrugs.filter { (kDayComponentOfDrug) -> Bool in
//            return kDayComponentOfDrug.alramKey == alramKey }).first {
//            print("언제야아아아아")
//            if let drugView = drugTimeView.superview as? DrugView {
//                if let drugsView = drugView.drugsView {
//                    for drugComponnentView in drugsView.drugComponnentViews {
//                    print(drugComponnentView.contentLabel.text)
////                        drugComponnentView.contentLabel.text
//                        
//                                                
//                        if let kindOfDrug = dayComponentOfDrug.kindOfDrugs.filter("name==%@", drugComponnentView.contentLabel.text!).first {
//                            
//                            print("drugComponnentView:\(drugComponnentView.contentLabel.text)")
//
//                            if drugComponnentView.isCheck {
//                                dayComponentOfDrugisCheck = true
//                            }
//                            RealmCenter.shared.write(doSomething: { (realm) in
//                                kindOfDrug.isTake = drugComponnentView.isCheck
//                            }) { (success : Bool, error : String?) in
//                                print("error:\(error)")
//                            }
//                        }
//                        
//                    }
//                }
//            }
//            
//            RealmCenter.shared.write(doSomething: { (realm) in
//                dayComponentOfDrug.isTake = dayComponentOfDrugisCheck
//            }) { (success, error) in
//                print("dayComponentOfDrug.isTake:\(success)")
//            }
//            
//            DispatchQueue.main.async {
//                print("여기야??")
//                print("dddd:\(dayComponentOfDrugisCheck)")
//                
//                drugTimeView.isCheck = dayComponentOfDrugisCheck
//                
//                print("1234556789")
//            }
//            
//            print("1234556789")
//        }
        
        
                
        if let dayComponentOfDrug = (self.dayComponentOfDrugs.filter { (kDayComponentOfDrug) -> Bool in
            
            
//            print("hour:\(drugTimeView.timeLabel.text ?? "")")
            
            
//            let amOrPmString = kDayComponentOfDrug.hour > 12 ? "오후" : "오전"
//            let timeString = String(format: "%d:%02d", kDayComponentOfDrug.hour > 12 ? kDayComponentOfDrug.hour - 12 : kDayComponentOfDrug.hour, kDayComponentOfDrug.minute)
//            
//            let zxcxz = amOrPmString + timeString
//            print("zxcxzzxcxzzxcxz>\(zxcxz)")
//            let timeText1 = drugTimeView.timeLabel.text ?? ""
//            let timeText2 = (kDayComponentOfDrug.hour > 12 ? "오후 " : "오전 ") + String(format: "%d:%02d", kDayComponentOfDrug.hour > 12 ? kDayComponentOfDrug.hour - 12 : kDayComponentOfDrug.hour, kDayComponentOfDrug.minute)
//            
//            let compareTime = timeText1 == timeText2
//            
//            print("hour compareTime:\(compareTime)")
//
//            
//            print("hour hour:\(kDayComponentOfDrug.hour)")
//            print("hour min:\(kDayComponentOfDrug.minute)")
            
           
            
//            if drugTimeView.timeLabel.text == kDayComponentOfDrug.
            
            
//            return kDayComponentOfDrug.alramKey == alramKey}).first {
//            return kDayComponentOfDrug.alramKey == alramKey && compareTime }).first {
            return kDayComponentOfDrug.idx == drugTimeView.idx }).first {

//            print("언제야아아아아")
            if let drugView = drugTimeView.superview as? DrugView {
                print("drugViewdrugView:\(drugView)")
                if let drugsView = drugView.drugsView {
                    for drugComponnentView in drugsView.drugComponnentViews {
                    print(drugComponnentView.contentLabel.text)
//                        drugComponnentView.contentLabel.text
                        
                                                
                        var testDate2 = RealmCenter.shared.realm.objects(DayComponentOfDrug_R.self)
                        
                        print("\(testDate2)")
                        
                        
                        
                        
                        
                        if let kindOfDrug = dayComponentOfDrug.kindOfDrugs.filter("name==%@", drugComponnentView.contentLabel.text!).first {
                            
                            print("drugComponnentView content:\(drugComponnentView.contentLabel.text)")
                            print("drugComponnentView isCheck:\(drugComponnentView.isCheck)")

                            if drugComponnentView.isCheck {
                                dayComponentOfDrugisCheck = true
                            }
                            
                            RealmCenter.shared.write(doSomething: { (realm) in
                                kindOfDrug.isTake = drugComponnentView.isCheck
                                
                            }) { (success : Bool, error : String?) in
                                print("error:\(error)")
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
                drugTimeView.isCheck = dayComponentOfDrugisCheck
                
            }
            
        }
        
        
        
        
        
      
            //sendDataToServer
//            guard let regNumString = userD.object(forKey: USER_KEY.KSR_REGISTRATION_NUMBER) as? String else {
//                
//                print("1234556789")
//                return
//            }

        
        print("1234556788")
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
        let sid = "\(UserDefaults.standard.object(forKey: "userSid") ?? 0)"
        let regNumString = "SB-12500-1"
//            print("checkDrugs:\(checkDrugs)")
//
            var sendDataDic = [
                "user_sid":sid,
//                "reg_num":regNumString,
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
                
//                if kindOfDrug.isTake {
//                    for drug in kindOfDrug.drugs {
//                        if drug.name == "아스피린" { sendDataDic["hm_htx_asp"] = "1" }
//                        if drug.name == "클로피도그렐" { sendDataDic["hm_htx_clopi"] = "1" }
//                        if drug.name == "아스피린+디피리다몰" { sendDataDic["hm_htx_as_dypi"] = "1" }
//                        if drug.name == "실로스타졸" { sendDataDic["hm_htx_cilo"] = "1" }
//                        if drug.name == "트리플루살" { sendDataDic["hm_htx_trif"] = "1" }
//                        if drug.name == "티클로피딘" { sendDataDic["hm_htx_ticl"] = "1" }
//                        
//                        if drug.name == "와파린" { sendDataDic["hm_htx_wfr"] = "1" }
//                        if drug.name == "아픽사반" { sendDataDic["hm_htx_apix"] = "1" }
//                        if drug.name == "다비가트란" { sendDataDic["hm_htx_dabig"] = "1" }
//                        if drug.name == "에독사반" { sendDataDic["hm_htx_edo"] = "1" }
//                        if drug.name == "리바록사반" { sendDataDic["hm_htx_rivar"] = "1" }
//                        if drug.name == "저분자헤파린" { sendDataDic["hm_htx_lmwh"] = "1" }
//                        
//                        if drug.name == "스타틴" { sendDataDic["hm_htx_statin"] = "1" }
//                        if drug.name == "기타 이상지질혈증약" { sendDataDic["hm_htx_htn_o"] = "1" }
//                    }
//                }
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
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //time label
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
///asdsadasdsadsa

class DrugView: UIView {

    var dayComponentOfDrug : DayComponentOfDrug_R!
    
    var drugTimeView : DrugTimeView!
    var drugsView : DrugsView!
    var alramType : AlramType = .morning
    
    convenience init(originY : CGFloat, sizeWidth : CGFloat, dayComponentOfDrug : DayComponentOfDrug_R) {
        self.init(frame: CGRect(x: 10, y: originY + 20, width: sizeWidth - 20, height: 0))

        drugTimeView = DrugTimeView(SizeWidth: sizeWidth - 20)
        self.backgroundColor = .white
        self.layer.cornerRadius = 8
        
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
        
        drugTimeView.idx = dayComponentOfDrug.idx
        
        
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
    
    
//    kDayComponentOfDrug.idx
    
    
    
    
    
    var idx : Int = 0
    
    
    var myLable : UILabel!
    
    
    var isCheck = false {
        willSet(newValue) {
            self.backgroundColor = newValue ? UIColor(red: 236/255, green: 244/255, blue: 253/255, alpha: 1) : UIColor(white: 132/255, alpha: 1)
            self.backgroundColor = newValue ? UIColor(red: 0.1175851747, green: 0.2157802284, blue: 0.3549513221, alpha: 1) : UIColor(red: 0.9242094755, green: 0.955763638, blue: 0.993532598, alpha: 1)
            self.timeLabel.textColor = newValue ? UIColor.white : UIColor.black
            
            #colorLiteral(red: 0.9242094755, green: 0.955763638, blue: 0.993532598, alpha: 1)
            #colorLiteral(red: 0.9251995683, green: 0.9560804963, blue: 0.9901352525, alpha: 1)
        }
    }

    var timeLabel : UILabel!
    var checkButton : UIButton!
    


    convenience init(SizeWidth : CGFloat){
        self.init(frame: CGRect(x: 0, y: 0, width: SizeWidth, height: 60))

        myLable = UILabel(frame: CGRect(x: 150, y: 150, width: 100, height: 100))
        myLable.text = "\(myCount)"
        myLable.isHidden = true
        
        
        if myCount < 0 {
            myCount = 1
        }
        
        
        self.addSubview(myLable)
        
        
        
        self.backgroundColor = UIColor(white: 132/255, alpha: 1)
        
        
        self.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMinYCorner, .layerMaxXMinYCorner)
        self.layer.cornerRadius = 8
        
        timeLabel = UILabel(frame: CGRect(x: 15, y: 0, width: self.frame.size.width / 2, height: self.frame.size.height))
        timeLabel.textColor = .white
        self.addSubview(timeLabel)

        checkButton = UIButton(frame: CGRect(x: self.frame.size.width - 80 - 12.5, y: 0, width: 80, height: 35))
        checkButton.center.y = self.frame.size.height / 2
        checkButton.layer.cornerRadius = 4
//        checkButton.layer.borderColor = UIColor.white.cgColor
        
//        checkButton.layer.borderWidth = 0.5
        checkButton.backgroundColor = #colorLiteral(red: 0.01439968869, green: 0.3469957113, blue: 0.8123252988, alpha: 1)
        checkButton.addTarget(event: .touchUpInside) { (button) in
            
            
            self.delegate?.checkButtonPressed?(drugTimeView: self)
            appDel.drugManagementVC?.drugManageView.calendarView.calendarViewWithManage.calendarView.reloadData()
            
            appDel.drugManagementVC?.drugManageView.calendarView.dataUpdate()
            
            appDel.drugManagementVC?.drugManageView.calendarView.setNeedsLayout()
            appDel.drugManagementVC?.drugManageView.calendarView.layoutIfNeeded()
            
            
            // 복용확인 버튼 클릭
            
            
            
            
        }
        self.addSubview(checkButton)

        let checkImage = #imageLiteral(resourceName: "check")
        let checkImageView = UIImageView(image: checkImage)
        checkImageView.frame = CGRect(x: 10, y: 0, width: 14, height: 14)
        checkImageView.center.y = checkButton.frame.size.height / 2
        checkImageView.isUserInteractionEnabled = false
        checkButton.addSubview(checkImageView)

        var checkButtonTitleLabel = UILabel(frame: CGRect(x: checkImageView.frame.maxX, y: 0, width: checkButton.frame.size.width - checkImageView.frame.maxX, height: checkButton.frame.size.height ))
        if IS_IPHONE_12PRO_MAX {
            checkButtonTitleLabel = UILabel(frame: CGRect(x: checkImageView.frame.maxX, y: 0, width: checkButton.frame.size.width - checkImageView.frame.maxX + 10, height: checkButton.frame.size.height ))
        }
        if IS_IPHONE_15PRO_MAX {
            checkButtonTitleLabel = UILabel(frame: CGRect(x: checkImageView.frame.maxX, y: 0, width: checkButton.frame.size.width - checkImageView.frame.maxX + 10, height: checkButton.frame.size.height ))
        }
        if IS_IPHONE_MINI {
            checkButtonTitleLabel = UILabel(frame: CGRect(x: checkImageView.frame.maxX, y: 0, width: checkButton.frame.size.width - checkImageView.frame.maxX + 10, height: checkButton.frame.size.height ))
        }
        if IS_IPHONE_N {
            checkButtonTitleLabel = UILabel(frame: CGRect(x: checkImageView.frame.maxX, y: 0, width: checkButton.frame.size.width - checkImageView.frame.maxX + 10, height: checkButton.frame.size.height ))
        }
        if IS_IPHONE_N_PLUS {
            checkButtonTitleLabel = UILabel(frame: CGRect(x: checkImageView.frame.maxX, y: 0, width: checkButton.frame.size.width - checkImageView.frame.maxX + 10, height: checkButton.frame.size.height ))
        }
        if IS_IPHONE_12PRO {
            checkButtonTitleLabel = UILabel(frame: CGRect(x: checkImageView.frame.maxX, y: 0, width: checkButton.frame.size.width - checkImageView.frame.maxX + 10, height: checkButton.frame.size.height ))
        }
        if IS_IPHONE_15PRO {
            checkButtonTitleLabel = UILabel(frame: CGRect(x: checkImageView.frame.maxX, y: 0, width: checkButton.frame.size.width - checkImageView.frame.maxX + 10, height: checkButton.frame.size.height ))
        }
        
        
//        checkButtonTitleLabel.textAlignment = .center
        checkButtonTitleLabel.font = UIFont(name: "SUITE-Regular", size: 13)
//        checkButtonTitleLabel.font = UIFont(name: Nanum_Barun_Gothic_OTF, size: 13)
        checkButtonTitleLabel.textColor = UIColor.white
        checkButtonTitleLabel.text = " 복용확인"
        checkButton.addSubview(checkButtonTitleLabel)

    }
    
 

    func timeStringUpdate(hour : Int, minute : Int){
//yyyymmdd
//        let amOrPmString = DateCenter.shared.dateToStringWithFormat(formatString: "a", date: time)
        let amOrPmString = hour > 12 ? "오후" : "오전"
        let timeString = String(format: "%d:%02d", hour > 12 ? hour - 12 : hour, minute)
//            DateCenter.shared.dateToStringWcloseithFormat(formatString: "h:mm", date: time)

        let amOrPmStringAttributed = [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12),
            
            
            
            
//            NSAttributedString.Key.font : UIFont(name: "SUITE-SemiBold", size: 12),
//            NSAttributedString.Key.font = UIFont(name: "SUITE-SemiBold", size: 12)
            NSAttributedString.Key.foregroundColor: UIColor.black,
            ]
        let timeStringAttributed = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18),
//            NSAttributedString.Key.font : UIFont(name: "SUITE-SemiBold", size: 15),
            
            
            NSAttributedString.Key.foregroundColor: UIColor.black,
            ]
        
        if let font = UIFont(name: "SUITE-SemiBold", size: 16) {
            let attributes = [NSAttributedString.Key.font: font]
            // do something with attributes
            
            
        } else {
            // The font "Raleway-SemiBold" is not found
        }
        

        let stringInfos = [
            ("\(amOrPmString) ",amOrPmStringAttributed),
            (timeString,timeStringAttributed)
        ] as [(String,[NSAttributedString.Key:NSObject])]

        self.timeLabel.attributedText = NSMutableAttributedString(stringsInfos: stringInfos)
//        self.timeLabel.font = UIFont(name: "SUITE-SemiBold", size: 20)
        if self.backgroundColor == UIColor(red: 0.1175851747, green: 0.2157802284, blue: 0.3549513221, alpha: 1) {
            self.timeLabel.textColor = .white
        } else {
            self.timeLabel.textColor = .black
        }
//        self.timeLabel.textColor = .white
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

