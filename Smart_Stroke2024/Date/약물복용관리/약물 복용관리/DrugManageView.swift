//
//  DrugManageView.swift
//  KSR
//
//  Created by m2comm on 2018. 6. 27..
//  Copyright © 2018년 m2community. All rights reserved.
//

import UIKit
import RealmSwift
import SQLite3



class DrugManageView: UIScrollView {

    var topView : RegisterdDrugListTopView!
    var calendarView : CalendarView!
    
    var rightBTN : UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.topView = RegisterdDrugListTopView()
        
        // you!!!!!!!!!!
        self.addSubview(self.topView)

        appDel.topView1 = self.topView
        
//        sceneDel?.topView1 = self.topView
        
        self.calendarView = CalendarView()
        self.calendarView.frame.origin.y = self.topView.frame.maxY + 210
        //changeCalendarHeigh
        self.calendarView.frame.size.height = 1250
        self.addSubview(self.calendarView)
        
        self.contentSize.width = SCREEN.WIDTH
        self.contentSize.height = max(self.frame.size.height, self.calendarView.frame.maxY)
        
        
        
    }
    
    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    class CalendarView : UIView
    ,CalendarViewWithManageDelegate
    {

        var yearAndMonthView : YearAndMonthView!
        var weekView : WeekView!
        var calendarViewWithManage : CalendarViewWithManage!
        var todayDate: Int!
        
        convenience init(){
            self.init(frame: CGRect(x: 0, y: 0, width: SCREEN.WIDTH, height: 0))
        }
        
        private override init(frame: CGRect) {
            super.init(frame: frame)
            
            self.yearAndMonthView = YearAndMonthView()
            self.yearAndMonthView.superCalendarView = self
            //바꿔죠
            
            yearAndMonthView.layer.cornerRadius = 8
            yearAndMonthView.layer.maskedCorners = CACornerMask(arrayLiteral:.layerMinXMinYCorner, .layerMaxXMinYCorner)
            
            self.addSubview(self.yearAndMonthView)
            
            let separatorView = UIView(frame: CGRect(x: 0, y: self.yearAndMonthView.frame.maxY, width: SCREEN.WIDTH, height: 0))
            separatorView.backgroundColor = UIColor.white.withAlphaComponent(0.23)
            self.addSubview(separatorView)
            
            self.weekView = WeekView()
            self.weekView.frame.origin.y = separatorView.frame.maxY
            self.addSubview(self.weekView)
            
            self.calendarViewWithManage = CalendarViewWithManage()
            self.calendarViewWithManage.delegate = self
            self.calendarViewWithManage.frame.origin.y = self.weekView.frame.maxY
            
            self.addSubview(self.calendarViewWithManage)
            
            let calendarNoticeView = CalendarNoticeView(frame: CGRect(x: 20, y: self.calendarViewWithManage.frame.maxY - 5, width: SCREEN.WIDTH - 40, height: 77))
//            calendarNoticeView.backgroundColor = UIColor.white.withAlphaComponent(0.3)
            calendarNoticeView.backgroundColor = #colorLiteral(red: 0.9149183631, green: 0.968372643, blue: 0.9661524892, alpha: 1)
            calendarNoticeView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMaxYCorner, .layerMaxXMaxYCorner)
            calendarNoticeView.layer.cornerRadius = 8
            
            
            calendarNoticeView.layoutIfNeeded()
            calendarNoticeView.updateFocusIfNeeded()
            calendarNoticeView.layoutIfNeeded()
            self.addSubview(calendarNoticeView)
            
//            self.frame.size.height = self.calendarViewWithManage.frame.maxY
            self.frame.size.height = calendarNoticeView.frame.maxY
            
            
            let dateString = dateToStringWithFormat(formatString: "yyyy.MM", date: self.currentYearAndMonth)
            
            self.yearAndMonthView.titleLabelTextUpdate(text: dateString)
            
        }
        
        func dataUpdate(){
            //?///?/
            //로컬에서 불러오기
            
            self.calendarViewWithManage.dataArray = AlramCenter.shared.readTakeDrugInfos()
            let dayComponentOfDrugs = RealmCenter.shared.realm.objects(DayComponentOfDrug_R.self)
            
//            print("count test : \(dayComponentOfDrugs.count)")
            
            var kDataArray2 = [DayComponentOfDrug_R]()
            for dayComponentOfDrug in dayComponentOfDrugs {
                kDataArray2.append(dayComponentOfDrug)
                
                
                
                print("kDataArray2:\(kDataArray2)")
                
            }
            self.calendarViewWithManage.dataArray2 = kDataArray2
            self.calendarViewWithManage.calendarView.reloadData()
            
            
            
            
            
            
//            print("count test2 : \(self.calendarViewWithManage.dataArray2.count)")
            
            let takeDays = self.calendarViewWithManage.dataArray2.filter { (dayComponentOfDrug) -> Bool in
                let currentDateString = dateToStringWithFormat(formatString: "yyyyMM", date: self.currentYearAndMonth)
                
                print("currentDateString:\(currentDateString)")
                let dayString = dayComponentOfDrug.Day.subString(start: 0, numberOf: "yyyyMM".count)
                print("dayString:\(dayString)")
                
                
                print("currentDateStringdayString:\(currentDateString)")
                print("currentDateStringdayString:\(dayString)")
                
                return currentDateString == dayString
                
            }
            
            
            
            
            
            
            let takeDatesCountOfcurrentMonth = takeDays.count
            
            print("takeDatesCountOfcurrentMonth count\(takeDatesCountOfcurrentMonth)")
            
            
            
            let takeEat = self.calendarViewWithManage.dataArray2.filter { (dayComponentOfDrug) -> Bool in
                let eat = dayComponentOfDrug.isTake
                
                
                
                print("eat--->\(eat)")
                
                
                
                
                
                return eat
            }
            
            
            
            
            var dayEat = DayComponentOfDrug_R()
            
            
            
            let eat2 = RealmCenter.shared.realm.objects(DayComponentOfDrug_R.self).filter("isTake==%@", true)
                
            print("eat2.count\(eat2.count)")
            
            
            
            
            
            
            
            
            
                    
                
                
                
            
            
            
            var formatter_day = DateFormatter()
            formatter_day.dateFormat = "dd"
            var formatter_day_string = formatter_day.string(from: Date())
            print("formatter_day_string\(formatter_day_string)")
            
            
//             var kind = RealmCenter.shared.realm.objects(DayComponentOfDrug_R.self).filter("isTake==%@", true)
//                print("kind?????\(kind)")
//                
//            
//            for i in 0 ..< kind.count {
//                print("i.count\(i + 1)")
//            }
            
            
            
            
            
    
            
            
            
            
            
            
            
            
            
//            let percent = Int((CGFloat(takeDatesCountOfcurrentMonth) / CGFloat(appDel.currentDayCountOfMonth * 3)) * 100)
            
            
//            print("takeDatesCountOfcurrentMonth:\(takeDatesCountOfcurrentMonth)")
//            
//            
//            
             todayDate = Int(formatter_day_string)
            
            
            
                var percent = 0
                if takeDatesCountOfcurrentMonth == 0 {
                    percent = 0
                } else {
                    
                    
                    
                    
//                    percent = Int(CGFloat(takeDatesCountOfcurrentMonth * 100) / (CGFloat(takeDatesCountOfcurrentMonth) * CGFloat(todayDate)))
                    
                    
                    //이게 퍼센트 마지막 본
                    percent = Int(CGFloat(eat2.count * 100) / (CGFloat(takeDatesCountOfcurrentMonth) * CGFloat(todayDate)))
                    
                    
                    
                    print("percent check:\(percent)")
                    
                    

                    
                }
            
            
            
            appDel.topView1?.labelStringUpdate(valueString: "\(percent)%")
            
            
            appDel.topView2?.labelStringUpdate(valueString: "\(percent)%")
            
            
            self.layoutIfNeeded()
//
            
            
            
            
//            appDel.topView1?.labelStringUpdate(valueString: "\(percent)%")
//            
//            
//            appDel.topView2?.labelStringUpdate(valueString: "\(percent)%")
            
//            sceneDel?.topView1?.labelStringUpdate(valueString: "\(percent)")
//            sceneDel?.topView2?.labelStringUpdate(valueString: "\(percent)")
            
            
            return
            
//            print("DrugManageView dataUpdate")
//            //        self.calendarView.currentYearAndMonth
//            guard let regNumString = userD.object(forKey: USER_KEY.KSR_REGISTRATION_NUMBER) as? String else {
//                toastShow(message: "reg_num is nil error")
//                return
//            }
//            let year = dateToStringWithFormat(formatString: "yyyy", date: self.currentYearAndMonth)
//            let month = dateToStringWithFormat(formatString: "MM", date: self.currentYearAndMonth)
//
//            let sendDataDic = [
//                "reg_num":regNumString,
//                "year":year,
//                "month":month,
//                ]
//            print("sendDataDic:\n\(sendDataDic)")
//            Server.getData(type: Server.InfoType.DRUG_ALRAM_GET, otherInfo: sendDataDic) { (kData : Data?) in
//                if let data = kData {
//                    do {
//                        if let jsonArray = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? [[String:String]] {
//                            print("DRUG_ALRAM_GET jsonArray:\n\(jsonArray)")
//
//                            var newArray = [String]()
//                            for dataDic in jsonArray {
//                                if let dayString = dataDic["day"] {
//                                    newArray.append(dayString)
//                                }
//                            }
//
//                            self.calendarViewWithManage.checkDates = newArray
//                            self.calendarViewWithManage.dataArray = jsonArray
//                            self.calendarViewWithManage.calendarView.reloadData()
//
//                            //?/
//                            let percent = Int((CGFloat(newArray.count) / CGFloat(appDel.currentDayCountOfMonth)) * 100)
//                            appDel.topView1?.labelStringUpdate(valueString: "\(percent)%")
//                            appDel.topView2?.labelStringUpdate(valueString: "\(percent)%")
//                        }
//                    }catch {
//                        print(error.localizedDescription)
//                    }
//                }
//            }
            
        }
        
        func scrollDidEndDeceleratingDate(date: Date) {
            self.currentYearAndMonth = date
            let dateString = dateToStringWithFormat(formatString: "yyyy.MM", date: self.currentYearAndMonth)
            self.yearAndMonthView.titleLabelTextUpdate(text: dateString)
//            self.yearAndMonthView.titleLabelTextUpdate(text: "test")
            
            self.dataUpdate()
        }
        
        
  
        var currentYearAndMonth = Date()
        
        @objc func goBeforeMonth(){
            
            self.currentYearAndMonth = Calendar.current.date(byAdding: DateComponents(month: -1), to: self.currentYearAndMonth)!
            let dateString = dateToStringWithFormat(formatString: "yyyy.MM", date: self.currentYearAndMonth)
            
            self.yearAndMonthView.titleLabelTextUpdate(text: dateString)
            
            self.calendarViewWithManage.calendarView.scrollToDate(self.currentYearAndMonth)
            self.calendarViewWithManage.calendarView.visibleDates { (dateSegmentInfo) in
                print("goBeforeMonth currentCountOfMonth : \(dateSegmentInfo.monthDates.count)")
            }
            
            
            self.dataUpdate()
            
        }
        
        @objc func goNextMonth(){
            
            
            let nextYearAndMonth = Calendar.current.date(byAdding: DateComponents(month: 1), to: self.currentYearAndMonth)!
            
            //
            let nextMonth = Calendar.current.date(bySetting: Calendar.Component.day, value: 1, of: nextYearAndMonth)!
            let todayMonth = Calendar.current.date(bySetting: Calendar.Component.day, value: 1, of: Date())!
            
            if nextMonth.timeIntervalSince1970 >= todayMonth.timeIntervalSince1970 {
                return
            }
            self.currentYearAndMonth = nextYearAndMonth
            //
            
            let dateString = dateToStringWithFormat(formatString: "yyyy.MM", date: self.currentYearAndMonth)
            self.yearAndMonthView.titleLabelTextUpdate(text: dateString)

            self.calendarViewWithManage.calendarView.scrollToDate(self.currentYearAndMonth)
            
            self.calendarViewWithManage.calendarView.visibleDates { (dateSegmentInfo) in
                print("goNextMonth currentCountOfMonth : \(dateSegmentInfo.monthDates.count)")
            }
            self.dataUpdate()
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        class YearAndMonthView : UIView {
            
            var superCalendarView : CalendarView?
            
            convenience init() {
                self.init(frame: CGRect(x: 20, y: 0, width: SCREEN.WIDTH - 40, height: 100))
            }
        
            var leftButton : UIButton!
            var rightButton : UIButton!
            var titleLabel : UILabel!
            
            private override init(frame: CGRect) {
                super.init(frame: frame)
                
                
                
                self.backgroundColor = UIColor(red: 59/255, green: 72/255, blue: 105/255, alpha: 1)
                
                
                
                
                self.titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: self.frame.size.height))
                self.titleLabel.center = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height / 2)
                self.addSubview(self.titleLabel)
                
                self.leftButton = UIButton(frame: CGRect(x: SCREEN.WIDTH * 93/320, y: 0, width: 11.5, height: 20.5))
                self.leftButton.center.y = self.frame.size.height / 2
                self.leftButton.addTarget(self, action: #selector(leftButtonPressed(button:)), for: .touchUpInside)
                self.addSubview(self.leftButton)
                
                let leftButtonImageView = UIImageView(frame: self.leftButton.bounds)
                leftButtonImageView.isUserInteractionEnabled = false
                leftButtonImageView.image = #imageLiteral(resourceName: "icBefore")
                self.leftButton.addSubview(leftButtonImageView)
                
                let leftButtonCenterX = self.leftButton.center.x
                self.leftButton.frame.size.width *= 2
                self.leftButton.center.x = leftButtonCenterX
                leftButtonImageView.center.x = self.leftButton.frame.size.width / 2
                
                self.rightButton = UIButton(frame: CGRect(x: SCREEN.WIDTH - (SCREEN.WIDTH * 93/320) - 11.5 - 44, y: 0, width: 11.5, height: 20.5))
                self.rightButton.center.y = self.frame.size.height / 2
                self.rightButton.addTarget(self, action: #selector(rightButtonPressed(button:)), for: .touchUpInside)
                self.addSubview(self.rightButton)
                
                let rightButtonImageView = UIImageView(frame: self.rightButton.bounds)
                rightButtonImageView.isUserInteractionEnabled = false
                rightButtonImageView.image = #imageLiteral(resourceName: "icNext")
                
                
//                rightButtonImageView.image =  UIImage(named: "goForward")
                self.rightButton.addSubview(rightButtonImageView)
                
                let rightButtonCenterX = self.rightButton.center.x
                self.rightButton.frame.size.width *= 2
//                self.rightButton.center.x = rightButtonCenterX
                rightButtonImageView.center.x = self.rightButton.frame.size.width / 2
                
                let todayButton = UIButton(frame: CGRect(x: SCREEN.WIDTH - (SCREEN.WIDTH * 14/320) - 50, y: 0, width: 50, height: 21))
                todayButton.center.y = self.frame.size.height / 2
                todayButton.layer.borderColor = UIColor.white.cgColor
                todayButton.layer.borderWidth = 1
                todayButton.layer.cornerRadius = todayButton.frame.size.height / 2
                todayButton.backgroundColor = UIColor(red: 59/255, green: 72/255, blue: 105/255, alpha: 1)
                todayButton.setTitle("Today", for: .normal)
                todayButton.setTitleColor(UIColor.white, for: .normal)
                todayButton.addTarget(self, action: #selector(todayButtonPressed(button:)), for: .touchUpInside)
//                self.addSubview(todayButton)
                
                let paragraphStyle = NSMutableParagraphStyle()
                paragraphStyle.alignment = .center
                
                let attribute = [
                    NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12),
                    NSAttributedString.Key.foregroundColor : UIColor.white,
                    NSAttributedString.Key.kern : -0.4, //자간?
                    NSAttributedString.Key.paragraphStyle : paragraphStyle
                ] as! [NSAttributedString.Key : NSObject]
                let stringInfos = [("Today",attribute)] as [(String,[NSAttributedString.Key:NSObject])]
                todayButton.titleLabel?.attributedText = getAttributedString(stringsInfos: stringInfos)
                
                
//                self.titleLabelTextUpdate(text: "2019.03")
            }
            
            @objc func todayButtonPressed(button : UIButton){
                self.superCalendarView?.calendarViewWithManage.calendarView.scrollToDate(Date())
            }
            
            @objc func leftButtonPressed( button : UIButton ){
                print("leftButtonPressed")
                self.superCalendarView?.goBeforeMonth()
            }
            @objc func rightButtonPressed( button : UIButton ){
                print("rightButtonPressed")
                self.superCalendarView?.goNextMonth()
            }
            
            
            func titleLabelTextUpdate( text : String){
                
                let attribute = [
                    NSAttributedString.Key.font : UIFont.systemFont(ofSize: 22),
                    NSAttributedString.Key.foregroundColor : UIColor.white,
                    NSAttributedString.Key.kern : -0.8, //자간?
                    NSAttributedString.Key.paragraphStyle : centerParagraphStyle
                ] as! [NSAttributedString.Key : NSObject]
                let stringInfos = [(text,attribute)] as [(String,[NSAttributedString.Key:NSObject])]
                self.titleLabel.attributedText = getAttributedString(stringsInfos: stringInfos)
            }
            
            
            
            required init?(coder aDecoder: NSCoder) {
                fatalError("init(coder:) has not been implemented")
            }
        }
    
        class WeekView : UIView {
            
            convenience init() {
                self.init(frame: CGRect(x: 20, y: 0, width: SCREEN.WIDTH - 40, height: 30))
            }
            
            private override init(frame: CGRect) {
                super.init(frame: frame)
                
                self.backgroundColor = UIColor(red: 59/255, green: 72/255, blue: 105/255, alpha: 1)
                
                let weekTitles = ["일","월","화","수","목","금","토"]
                for i in 0..<weekTitles.count {
                    let weekTitle = weekTitles[i]
                    let labelWidth = (SCREEN.WIDTH / CGFloat(weekTitles.count)) - 6
                    print("labelWidth: \(labelWidth)")
                    let weekLabel = UILabel(frame: CGRect(
                        x: CGFloat(i) * labelWidth,
                        y: 0,
                        width: labelWidth,
                        height: self.frame.size.height))
                    weekLabel.text = weekTitle
//                    weekLabel.layer.borderWidth = 1
                    weekLabel.textAlignment = .center
                    weekLabel.textColor = UIColor(red: 177/255, green: 188/255, blue: 216/255, alpha: 1)
                    weekLabel.font = UIFont(name: Nanum_Barun_Gothic_OTF_Bold, size: 12.2)
                    self.addSubview(weekLabel)
                }
                
            }
            
            required init?(coder aDecoder: NSCoder) {
                fatalError("init(coder:) has not been implemented")
            }
        }
    }
    
    
    
    
}
