//
//  CalendarView.swift
//  KSR
//
//  Created by m2comm on 2018. 6. 27..
//  Copyright © 2018년 m2community. All rights reserved.
//

import UIKit
import JTAppleCalendar

@objc protocol CalendarViewWithManageDelegate {
    @objc optional func scrollDidEndDeceleratingDate( date : Date )
}

class CalendarViewWithManage: UIView
,JTAppleCalendarViewDelegate, JTAppleCalendarViewDataSource
{
    convenience init() {
        self.init(frame: CGRect(x: 20, y: 0, width: SCREEN.WIDTH - 40, height: SCREEN.WIDTH / 7 * 6))
    }
    
    var delegate : CalendarViewWithManageDelegate?
    
    let dateFormatter = DateFormatter()
    var calendarView : JTAppleCalendarView!
    
    var checkDates = [String]()
    
    var dataArray = [TakingDrug]()
    
    var dataArray2 = [DayComponentOfDrug_R]()
    
    var firstAlramDB : AlramDB?
    
    func updateFirstAlramDB(){
        firstAlramDB = AlramCenter.shared.readFirstAlramDB()
        self.calendarView.reloadData()
    }
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
    
        self.calendarView = JTAppleCalendarView(frame: self.bounds)
//        self.calendarView.backgroundColor = UIColor.clear
        self.calendarView.calendarDelegate = self
        self.calendarView.calendarDataSource = self
        self.calendarView.scrollingMode = .stopAtEachCalendarFrame
        self.calendarView.scrollDirection = UICollectionView.ScrollDirection.horizontal
        self.calendarView.register(CalendarCell.self, forCellWithReuseIdentifier: "CalendarCell")
        self.calendarView.showsHorizontalScrollIndicator = false
        self.calendarView.showsVerticalScrollIndicator = false
        
        
        
        self.calendarView.reloadData()
        
        
        self.calendarView.scrollToDate(Date())
        
//        self.updateFirstAlramDB()
        
        self.calendarView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMaxYCorner, .layerMaxXMaxYCorner)
        self.calendarView.layer.cornerRadius = 8
        self.addSubview(self.calendarView)
        
        
        
        
        
        
    }
    
    
    
    func calendar(_ calendar: JTAppleCalendarView, didScrollToDateSegmentWith visibleDates: DateSegmentInfo) {
        appDel.currentDayCountOfMonth = visibleDates.monthDates.count
        if let visibleDate = visibleDates.monthDates.first?.date {
            self.delegate?.scrollDidEndDeceleratingDate?(date: visibleDate)
        }
        
        self.calendarView.reloadData()
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func cellColorSetting(cell : CalendarCell, date : Date , cellState : CellState) {
        
        cell.dateLabel.text = cellState.text
        
        
        for i in 0..<3{
            cell.sunImageViews[i].image = UIImage(named: "sun\(i+1)f")!
        }
        
//        for sunImageView in cell.sunImageViews {
//            sunImageView.isHidden = true
//        }
        
        let weekDay = Calendar.current.component(Calendar.Component.weekday, from: date)
        if weekDay == 1 {
            cell.dateLabel.textColor = #colorLiteral(red: 0.937254902, green: 0.3803921569, blue: 0.3803921569, alpha: 1)
        }else if weekDay == 7 {
            cell.dateLabel.textColor = #colorLiteral(red: 0.09411764706, green: 0.4980392157, blue: 0.7960784314, alpha: 1)
        }else{
            cell.dateLabel.textColor = #colorLiteral(red: 0.431372549, green: 0.4274509804, blue: 0.4274509804, alpha: 1)
        }
        
        
        
        
        if cellState.dateBelongsTo == .previousMonthWithinBoundary ||  //이전달
            cellState.dateBelongsTo == .followingMonthWithinBoundary { //다음달
            cell.colorView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            cell.dateLabel.textColor = #colorLiteral(red: 0.8509803922, green: 0.8509803922, blue: 0.8509803922, alpha: 1)
            cell.calendarXImageView.isHidden = true
            
            cell.sunImageViews[0].isHidden = true
            cell.sunImageViews[1].isHidden = true
            cell.sunImageViews[2].isHidden = true
        } else{
            //이번달
            cell.colorView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            
            cell.sunImageViews[0].isHidden = false
            cell.sunImageViews[1].isHidden = false
            cell.sunImageViews[2].isHidden = false
            
//            if dateToStringWithFormat(formatString: "MM", date: date).toInt()! > dateToStringWithFormat(formatString: "MM", date: Date()).toInt()! {
//                cell.dateLabel.textColor = #colorLiteral(red: 0.8509803922, green: 0.8509803922, blue: 0.8509803922, alpha: 1)
//                cell.sunImageViews[0].isHidden = true
//                cell.sunImageViews[1].isHidden = true
//                cell.sunImageViews[2].isHidden = true
//            }
            
            
            
            if dateToStringWithFormat(formatString: "yyyyw", date: date) == dateToStringWithFormat(formatString: "yyyyw", date: Date()) {
//                cell.colorView.backgroundColor = UIColor(white: 0.93, alpha: 1)
                
            }
            if dateToStringWithFormat(formatString: "yyyyMMdd", date: date) == dateToStringWithFormat(formatString: "yyyyMMdd", date: Date()) {
                
                cell.colorView.backgroundColor = UIColor(white: 0.83, alpha: 1)
                cell.colorView.frame.size.height = 35
                cell.colorView.backgroundColor = #colorLiteral(red: 0.3016270101, green: 0.5582068563, blue: 0.8151627183, alpha: 1)
                cell.dateLabel.textColor = .white

//                cell.colorViewBack.backgroundColor = #colorLiteral(red: 0.3016270101, green: 0.5582068563, blue: 0.8151627183, alpha: 1)
            }
            
//            cell.calendarXImageView.isHidden = false
            
//            print("A self.dataArray2:\(self.dataArray2)")
            
            /*
             date:2018-12-06 15:00:00 +0000
             dayString:20181207
             
             dayComponentOfDrug.Day:20181107
             */
            
            
            let dayString = dateToStringWithFormat(formatString: "yyyyMMdd", date: date)//.addingTimeInterval(-9 * 60 * 60))
            for dayComponentOfDrug in self.dataArray2 {
                if dayString  == dayComponentOfDrug.Day {

                    if dayComponentOfDrug.isTake {                        
                        if dayComponentOfDrug.alramKey == ALRAM_KEY.MORNING {
                            print("check")
                            cell.calendarXImageView.isHidden = true
                            cell.sunImageViews[0].image = UIImage(named: "sun\(1)")!
                        }
                        if dayComponentOfDrug.alramKey == ALRAM_KEY.LUNCH {
                            cell.calendarXImageView.isHidden = true
                            cell.sunImageViews[1].image = UIImage(named: "sun\(2)")!
                        }
                        if dayComponentOfDrug.alramKey == ALRAM_KEY.DINNER {
                            cell.calendarXImageView.isHidden = true
                            cell.sunImageViews[2].image = UIImage(named: "sun\(3)")!
                        }
                    }
                    
                }
            }
            
//            if date.timeIntervalSince1970 > Date().timeIntervalSince1970 {
//                //미래 날짜는 x표시 히든
//                cell.calendarXImageView.isHidden = true
//                cell.sunImageViews[0].isHidden = true
//                cell.sunImageViews[1].isHidden = true
//                cell.sunImageViews[2].isHidden = true
//            }
            
            
//            for takingInfo in self.dataArray {
//                if dateToStringWithFormat(formatString: "yyyyMMdd", date: date) == dateToStringWithFormat(formatString: "yyyyMMdd", date: takingInfo.takeDate) {
//
//                    if takingInfo.type == .morning {
//                        cell.calendarXImageView.isHidden = true
//                        cell.sunImageViews[0].image = UIImage(named: "sun\(1)")!
//                    }
//                    if takingInfo.type == .lunch {
//                        cell.calendarXImageView.isHidden = true
//                        cell.sunImageViews[1].image = UIImage(named: "sun\(2)")!
//                    }
//                    if takingInfo.type == .dinner {
//                        cell.calendarXImageView.isHidden = true
//                        cell.sunImageViews[2].image = UIImage(named: "sun\(3)")!
//                    }
//                }
//            }
            
            
            
//            if date.timeIntervalSince1970 > Date().timeIntervalSince1970 {
//                //미래 날짜는 x표시 히든
//                cell.calendarXImageView.isHidden = true
//                cell.sunImageViews[0].isHidden = false
//                cell.sunImageViews[1].isHidden = false
//                cell.sunImageViews[2].isHidden = false
//            }
            
            
            
            
            //시작 미래 다 안보이기(2) 위와 같은애 true , false 만 다름
            if date.timeIntervalSince1970 > Date().timeIntervalSince1970 {
                //미래 날짜는 x표시 히든
                // x히든 보이기
//                if cell.sunImageViews[0].image == UIImage(named: "sun1f") && cell.sunImageViews[1].image == UIImage(named: "sun2f") && cell.sunImageViews[2].image == UIImage(named: "sun3f") {
//                    cell.calendarXImageView.isHidden = false
//                }
                
                cell.calendarXImageView.isHidden = true
                
                cell.sunImageViews[0].isHidden = true
                cell.sunImageViews[1].isHidden = true
                cell.sunImageViews[2].isHidden = true
            }
            

            cell.firstCheckView.isHidden = true
            
           
            //?/
            
//            if let kFirstAlramDB = self.firstAlramDB {
//                if date.timeIntervalSince1970 < kFirstAlramDB.registerDate.timeIntervalSince1970 {
            
            
//            return
            if let firstAlram = RealmCenter.shared.realm.objects(Alram_R.self).first {
                
//                if date.timeIntervalSince1970 < firstAlram.registerTime.timeIntervalSince1970 {
//                    //첫날 이전의 날짜는 x표시 히든
//                    cell.calendarXImageView.isHidden = true
//                    
//                    
//                    //
//                    cell.sunImageViews[0].isHidden = false
//                    cell.sunImageViews[1].isHidden = false
//                    cell.sunImageViews[2].isHidden = false
//                }
        
                //시작 전 날짜 안보이기 (1)
                if date.timeIntervalSince1970 < firstAlram.registerTime.timeIntervalSince1970 {
                    //첫날 이전의 날짜는 x표시 히든
                    cell.calendarXImageView.isHidden = true
                    
                    
                    //
                    cell.sunImageViews[0].isHidden = true
                    cell.sunImageViews[1].isHidden = true
                    cell.sunImageViews[2].isHidden = true
                }
                
                
                // 시작 날짜 제외 안보이고 모두 보이게 하려면 각각 조건들 풀어주기 true -> false
                if date.timeIntervalSince1970 > firstAlram.registerTime.timeIntervalSince1970 && date.timeIntervalSince1970 < Date().timeIntervalSince1970 {
                    // x히든 보이기
                    if cell.sunImageViews[0].image == UIImage(named: "sun1f") && cell.sunImageViews[1].image == UIImage(named: "sun2f") && cell.sunImageViews[2].image == UIImage(named: "sun3f") {
                        cell.calendarXImageView.isHidden = false
                        
                        cell.sunImageViews[0].isHidden = true
                        cell.sunImageViews[1].isHidden = true
                        cell.sunImageViews[2].isHidden = true
                        
                        cell.calendarXImageView.frame.origin.x = 20
                        if IS_IPHONE_12PRO_MAX {
                            cell.calendarXImageView.frame.origin.x = 21
                        }
                        if IS_IPHONE_15PRO_MAX {
                            cell.calendarXImageView.frame.origin.x = 21
                        }
                        cell.calendarXImageView.frame.origin.y = 22
                    }
                }
                
                
                
//                if cell.firstCheckView.isHidden == false {
//                    cell.sunImageViews[0].isHidden = true
//                    cell.sunImageViews[1].isHidden = true
//                    cell.sunImageViews[2].isHidden = true
//                }
                
                
                if dateToStringWithFormat(formatString: "yyyyMMdd", date: firstAlram.registerTime) ==
                    dateToStringWithFormat(formatString: "yyyyMMdd", date: date) {
                    cell.firstCheckView.isHidden = false
                    cell.sunImageViews[0].isHidden = true
                    cell.sunImageViews[1].isHidden = true
                    cell.sunImageViews[2].isHidden = true
                    
                    cell.firstCheckView.frame.origin.x = 20
                    if IS_IPHONE_12PRO_MAX {
                        cell.firstCheckView.frame.origin.x = 25
                    }
                    if IS_IPHONE_15PRO_MAX {
                        cell.firstCheckView.frame.origin.x = 25
                    }
                    cell.firstCheckView.frame.origin.y = 40
                }
                
                
                
                
                // x히든 보이기
//                if cell.sunImageViews[0].image == UIImage(named: "sun1f") && cell.sunImageViews[1].image == UIImage(named: "sun2f") && cell.sunImageViews[2].image == UIImage(named: "sun3f") {
//                    cell.calendarXImageView.isHidden = false
//                }
//                    
                
                
                
                
                
                
                
            }else{
                //알람을 등록한 적이 없다면 x표시 모두 히든
                cell.calendarXImageView.isHidden = true
                cell.sunImageViews[0].isHidden = true
                cell.sunImageViews[1].isHidden = true
                cell.sunImageViews[2].isHidden = true
            }
            //위에와 같음 단지 true false
//            else{
//                //알람을 등록한 적이 없다면 x표시 모두 히든
//                cell.calendarXImageView.isHidden = true
//                cell.sunImageViews[0].isHidden = true
//                cell.sunImageViews[1].isHidden = true
//                cell.sunImageViews[2].isHidden = true
//            }
            
            
            
//            let dateString = dateToStringWithFormat(formatString: "d", date: date)
            
        }
        
        self.calendarView.reloadData()
        
    }
    
    
    //MARK:JTAppleCalendarViewDelegate
    func calendar(_ calendar: JTAppleCalendarView, willDisplay cell: JTAppleCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
        
        
    }
    
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        
        //1분 1시 1일 1년 10년
        
        //5년전부터
        let startDate = Date(timeIntervalSinceNow: -60 * 60 * 24 * 365 * 5)
        
        //5년후까지
        let endDate = Date(timeIntervalSinceNow: 60 * 60 * 24 * 365 * 5)

        let nextMonth = dateToStringWithFormat(formatString: "MM", date: Date()).toInt()! + 1
//        var endDate = Calendar.current.date(bySetting: Calendar.Component.month, value: nextMonth, of: Date())!
//        endDate = Calendar.current.date(bySetting: Calendar.Component.day, value: 1, of: Date())!.addingTimeInterval(-60 * 60 * 24)
        
        
        let parameters = ConfigurationParameters(startDate: startDate, endDate: endDate, numberOfRows : 6)
        return parameters
    }
    
    
    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell{
        
        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "CalendarCell", for: indexPath) as! CalendarCell
        
        self.cellColorSetting(cell: cell, date: date, cellState: cellState)
        
        
//        cell.layer.add = UIColor.black.cgColor
//        cell.layer.borderWidth = 1
        
        self.calendarView.reloadData()
        
        return cell
    }

    func calendar(_ calendar: JTAppleCalendarView, didSelectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        self.calendarView.reloadData()
        print("day click")
        self.calendarView.reloadData()
        //셀을 선택했을때
        if let kCell = cell as? CalendarCell {
            kCell.dateLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            kCell.colorView.backgroundColor = #colorLiteral(red: 0.462745098, green: 0.4745098039, blue: 0.5019607843, alpha: 1)
            
        }
        
//        print("calendar didSelectDate:\(date)")
        
        self.calendarView.layoutIfNeeded()
        
        
        if date.timeIntervalSince1970 <= Date().timeIntervalSince1970 {
            
            print("먼저")
            showDrugNotiView(date: date)
            
            self.calendarView.reloadData()
            
            
            
        } else {
            self.calendarView.reloadData()
        }
        
        
        
        
        
    }
    func calendar(_ calendar: JTAppleCalendarView, didDeselectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        //셀 선택이 해제되었을때
        if let kCell = cell as? CalendarCell {
            self.cellColorSetting(cell: kCell, date: date, cellState: cellState)
            self.calendarView.reloadData()
        }
    }
   
 
}


