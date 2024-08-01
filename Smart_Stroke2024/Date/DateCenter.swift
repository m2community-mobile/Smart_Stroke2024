
import UIKit

/*
 "w" 1년 중 몇번째 주인지
 
 "c" 1주 중에서 몇번째 날인지
 - 일 월 화...
 - 1 2 3..
 
 "yyyy.MM.dd a h:mm"
 "2018.01.01 오전 1:01"
 
 오전/오후 -> amSymbol, pmSymbol
 
 
 */
class DateCenter: NSObject {

    static let shared : DateCenter = {
        let sharedCenter = DateCenter()
        return sharedCenter
    }()
    
    var format = DateFormatter()
 
    func stringToDateWithFormat(
        formatString : String,
        dateString : String,
        locale : Locale = Locale(identifier: "ko-KR"),
        timeZone : TimeZone = TimeZone.current,
        amSymbol : String = "오전",
        pmSymbol : String = "오후") -> Date? {

        format.locale = locale
        format.timeZone = timeZone
        format.amSymbol = amSymbol
        format.pmSymbol = pmSymbol

        format.dateFormat = formatString
        
        guard let time = format.date(from: dateString) else {
            print("error : \(dateString)")
            return nil
        }
        return time
        
    }
    
    
    func dateToStringWithFormat(
        formatString : String,
        date : Date,
        locale : Locale = Locale(identifier: "ko-KR"),
        timeZone : TimeZone = TimeZone.current,
        amSymbol : String = "오전",
        pmSymbol : String = "오후") -> String {
        
        format.locale = locale
        format.timeZone = timeZone
        format.amSymbol = amSymbol
        format.pmSymbol = pmSymbol
        
        format.dateFormat = formatString
        return format.string(from: date)
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
    
    /*
     Date에 정보 추가
     alramDate = Calendar.current.date(bySetting: .weekday, value: index, of: alramDate)!
     alramDate = Calendar.current.date(bySetting: .hour, value: info.hour, of: alramDate)!
     alramDate = Calendar.current.date(bySetting: .minute, value: info.minute, of: alramDate)!
     
     
     */
    
}

