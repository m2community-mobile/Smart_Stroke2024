
//
//  DateFunction.swift
//  KSR
//
//  Created by m2comm on 2018. 7. 3..
//  Copyright © 2018년 m2community. All rights reserved.
//

import Foundation

func stringToDateWithFormat(formatString : String, dateString : String) -> Date? {
    
    let format = DateFormatter()
    format.locale = Locale.current
    format.timeZone = TimeZone.current
    format.dateFormat = formatString
    
    guard let time = format.date(from: dateString) else {
        print("error : \(dateString)")
        return nil
    }
    return time
    
}

func dateToStringWithFormat(formatString : String, date : Date) -> String {
    let format = DateFormatter()
    format.locale = Locale(identifier: "ko-KR")
//    format.locale = Locale.current
    format.timeZone = TimeZone.current
    format.amSymbol = "오전"
    format.pmSymbol = "오후"
    
    format.dateFormat = formatString
    return format.string(from: date)
}

func stringToDate(dateString : String) -> Date?{
    return stringToDateWithFormat(formatString: "yyyy-MM-dd-HH-mm", dateString: dateString)
}

func dateToString(date:Date) -> String {
    return dateToStringWithFormat(formatString: "yyyy년 MM월 dd일 HH시 mm분", date: date)
}

func changeForamt( dateString : String) -> String {
    return dateToString(date: stringToDate(dateString: dateString)!)
}

func midDate(dateStringA : String, dateStringB : String) -> String {
    
    let valueOfDateA = stringToDate(dateString: dateStringA)!.timeIntervalSince1970
    let valueOfDateB = stringToDate(dateString: dateStringB)!.timeIntervalSince1970
    
    let midValueOfDate = (valueOfDateA + valueOfDateB) / 2
    let midDate = Date(timeIntervalSince1970: midValueOfDate)
    
    return dateToString(date: midDate)

}

func between(startTimeString : String, endTimeString:String, startTimeBString : String? = nil) -> String {
    
    guard let startTime = stringToDate(dateString: startTimeString) else { return "error1 : \n\(startTimeString)" }
    guard let endTime = stringToDate(dateString: endTimeString) else { return "error2 : \n\(endTimeString)" }
    
    if let startTimeBString = startTimeBString {
        
        guard let startTimeB = stringToDate(dateString: startTimeBString) else { return "error3 : \n\(startTimeBString)" }
        
        let timeIntervalA = endTime.timeIntervalSince(startTime)
        let timeIntervalB = endTime.timeIntervalSince(startTimeB)
        let midTimeinterval = (timeIntervalA + timeIntervalB) / 2
        
        let midStartTime = Date(timeInterval: -midTimeinterval, since: endTime)
        
        let offsetComps = Calendar.current.dateComponents([.day,.hour,.minute], from: midStartTime, to: endTime)
        if case let (d?,h?,m?) = (offsetComps.day, offsetComps.hour, offsetComps.minute) {
            var returnStrings = [String]()
            if d > 0 {
                returnStrings.append("\(d)일")
            }
            if h > 0 {
                returnStrings.append("\(h)시간")
            }
            if m > 0 {
                returnStrings.append("\(m)분")
            }
            
            return returnStrings.joined(separator: " ")
        }
    }else{
        let offsetComps = Calendar.current.dateComponents([.day,.hour,.minute], from: startTime, to: endTime)
        if case let (d?,h?,m?) = (offsetComps.day, offsetComps.hour, offsetComps.minute) {
            var returnStrings = [String]()
            if d > 0 {
                returnStrings.append("\(d)일")
            }
            if h > 0 {
                returnStrings.append("\(h)시간")
            }
            if m > 0 {
                returnStrings.append("\(m)분")
            }
            
            return returnStrings.joined(separator: " ")
        }
    }
    
    return "error"
}










