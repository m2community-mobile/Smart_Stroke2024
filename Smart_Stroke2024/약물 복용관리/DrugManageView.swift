//
//  DrugManageView.swift
//  KSR
//
//  Created by m2comm on 2018. 6. 27..
//  Copyright © 2018년 m2community. All rights reserved.
//

import UIKit
import RealmSwift

class DrugManageView: UIScrollView {

//    var topView : RegisterdDrugListTopView!
    var calendarView : CalendarView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        self.topView = RegisterdDrugListTopView()
//        self.addSubview(self.topView)

//        appDel.topView1 = self.topView
        
        self.calendarView = CalendarView()
        self.calendarView.frame.origin.y = 0
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
        
        convenience init(){
            self.init(frame: CGRect(x: 0, y: 0, width: SCREEN.WIDTH, height: 0))
        }
        
        private override init(frame: CGRect) {
            super.init(frame: frame)
            
            self.yearAndMonthView = YearAndMonthView()
            self.yearAndMonthView.superCalendarView = self
            self.addSubview(self.yearAndMonthView)
            
            let separatorView = UIView(frame: CGRect(x: 0, y: self.yearAndMonthView.frame.maxY, width: SCREEN.WIDTH, height: 0.5))
            separatorView.backgroundColor = UIColor.white.withAlphaComponent(0.23)
            self.addSubview(separatorView)
            
            self.weekView = WeekView()
            self.weekView.frame.origin.y = separatorView.frame.maxY
            self.addSubview(self.weekView)
            
            self.calendarViewWithManage = CalendarViewWithManage()
            self.calendarViewWithManage.delegate = self
            self.calendarViewWithManage.frame.origin.y = self.weekView.frame.maxY
            self.addSubview(self.calendarViewWithManage)
            
            let calendarNoticeView = CalendarNoticeView(frame: CGRect(x: 0, y: self.calendarViewWithManage.frame.maxY, width: SCREEN.WIDTH, height: 65))
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
            
            var kDataArray2 = [DayComponentOfDrug_R]()
            for dayComponentOfDrug in dayComponentOfDrugs {
                kDataArray2.append(dayComponentOfDrug)
            }
            self.calendarViewWithManage.dataArray2 = kDataArray2
            self.calendarViewWithManage.calendarView.reloadData()
            
            let takeDays = self.calendarViewWithManage.dataArray2.filter { (dayComponentOfDrug) -> Bool in
                let currentDateString = dateToStringWithFormat(formatString: "yyyyMM", date: self.currentYearAndMonth)
                let dayString = dayComponentOfDrug.Day.subString(start: 0, numberOf: "yyyyMM".count)
                return currentDateString == dayString
            }
            
            let takeDatesCountOfcurrentMonth = takeDays.count
            
            let percent = Int((CGFloat(takeDatesCountOfcurrentMonth) / CGFloat(sceneDel!.currentDayCountOfMonth * 3)) * 100)
//            appDel.topView1?.labelStringUpdate(valueString: "\(percent)%")
//            appDel.topView2?.labelStringUpdate(valueString: "\(percent)%")
            
            
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
                self.init(frame: CGRect(x: 0, y: 0, width: SCREEN.WIDTH, height: 50))
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
                
                self.rightButton = UIButton(frame: CGRect(x: SCREEN.WIDTH - (SCREEN.WIDTH * 93/320) - 11.5, y: 0, width: 11.5, height: 20.5))
                self.rightButton.center.y = self.frame.size.height / 2
                self.rightButton.addTarget(self, action: #selector(rightButtonPressed(button:)), for: .touchUpInside)
                self.addSubview(self.rightButton)
                
                let rightButtonImageView = UIImageView(frame: self.rightButton.bounds)
                rightButtonImageView.isUserInteractionEnabled = false
                rightButtonImageView.image = #imageLiteral(resourceName: "icNext")
                self.rightButton.addSubview(rightButtonImageView)
                
                let rightButtonCenterX = self.rightButton.center.x
                self.rightButton.frame.size.width *= 2
                self.rightButton.center.x = rightButtonCenterX
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
                self.addSubview(todayButton)
                
                let paragraphStyle = NSMutableParagraphStyle()
                paragraphStyle.alignment = .center
                
                let attribute = [
                    NSAttributedString.Key.font : UIFont(name: ROBOTO_MEDIUM, size: 11)!,
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
                    NSAttributedString.Key.font : UIFont(name: Nanum_Barun_Gothic_OTF_Bold, size: 19)!,
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
                self.init(frame: CGRect(x: 0, y: 0, width: SCREEN.WIDTH, height: 30))
            }
            
            private override init(frame: CGRect) {
                super.init(frame: frame)
                
                self.backgroundColor = UIColor(red: 59/255, green: 72/255, blue: 105/255, alpha: 1)
                
                let weekTitles = ["일","월","화","수","목","금","토"]
                for i in 0..<weekTitles.count {
                    let weekTitle = weekTitles[i]
                    let labelWidth = SCREEN.WIDTH / CGFloat(weekTitles.count)
                    let weekLabel = UILabel(frame: CGRect(
                        x: CGFloat(i) * labelWidth,
                        y: 0,
                        width: labelWidth,
                        height: self.frame.size.height))
                    weekLabel.text = weekTitle
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
