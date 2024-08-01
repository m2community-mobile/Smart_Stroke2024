import UIKit
import UserNotifications

class AlramCenter_R: NSObject,UNUserNotificationCenterDelegate {
    
    static let shared : AlramCenter_R = {
        let sharedCenter = AlramCenter_R()
        return sharedCenter
    }()
    
    let notiCenter = UNUserNotificationCenter.current()
    
    func authorizationCheck() {
        notiCenter.requestAuthorization(options: [.alert,.sound,.badge]) { ( authorization: Bool, error : Error?) in
            if let error = error {
                print("requestAuthorization error : \(error)")
            }else{
                if !authorization {
                    print("권한부여를 해야한다는 안내")
                }else{
                    self.notiCenter.delegate = self
                    DispatchQueue.main.async {
                        UIApplication.shared.registerForRemoteNotifications()
                    }
                }
            }
            
            //처음 실행일때는 알람 제거
            //ios10에서 앱 삭제 후에도 알람이 남아있는 이슈가 있음
            let IS_FIRST = "IS_FIRST"
            if let _ = UserDefaults.standard.object(forKey: IS_FIRST) as? String {
                //not first
                print("not first")
            }else{
                //is first
                print("is first")
                self.notiCenter.removeAllDeliveredNotifications()
                self.notiCenter.removeAllPendingNotificationRequests()
                
                UserDefaults.standard.set(IS_FIRST, forKey: IS_FIRST)
                UserDefaults.standard.synchronize()
            }
        }
    }
    
    //알람 업데이트
    func updateAlram(alram : Alram_R, complete : @escaping(_ success : Bool) -> Void){
        
        if !alram.isAlram {
            print("알람 제거")
            notiCenter.removeDeliveredNotifications(withIdentifiers: [alram.alramKey])
            notiCenter.removePendingNotificationRequests(withIdentifiers: [alram.alramKey])
            complete(true)
        }else{
            print("알람 추가")
            let content = UNMutableNotificationContent()
            content.title = "약 복용시간입니다."
            
            var drugNames = [String]()
            for i in 0..<alram.kindOfDrugs.count {
                let kindOfDrug = alram.kindOfDrugs[i]
                drugNames.append(kindOfDrug.name)
            }
            content.body = drugNames.joined(separator: ",")
            content.sound = UNNotificationSound.default()
            
            var alramDate = Date()
            alramDate = Calendar.current.date(bySettingHour: alram.hour, minute:alram.minute, second: 0, of: alramDate)!
            
            let comps = Calendar.current.dateComponents([.hour, .minute], from: alramDate)
            
            let trigger = UNCalendarNotificationTrigger(dateMatching: comps,repeats: true)
            
            let request = UNNotificationRequest(identifier: alram.alramKey, content: content, trigger: trigger)
            
            notiCenter.add(request) { (error : Error?) in
                if error == nil {
                    complete(true)
                }else{
                    complete(false)
                }
            }
        }
    }
    
    
    
    
    
    
    //알람 제거
//    func removeAlramFromNoti( info : AlramInfo){
//
//        let alramId = info.alramType.rawValue
//
//        self.notiCenter.removeDeliveredNotifications(withIdentifiers: [alramId])
//        self.notiCenter.removePendingNotificationRequests(withIdentifiers: [alramId])
//
//        let registerDate = Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: Date())!
//
//
//        let db = AlramDB(fileName: info.alramType.rawValue, registerDate: registerDate, isBefore: info.isBefore, hour: info.hour, minute: info.minute, drugs: info.drugs)
//
//        //알람 목록에서 제거
//        self.removeAlramFromList(info: info)
//
//        //알람 제거 기록(약물 정보를 제거한 정보를 저장)
//        let _ = self.saveAlramToJson(info: db)
//
//    }
//
//    func removeAlramFromList( info : AlramInfo ){
//        let alramListDicArray = readJsonData(fileName: ALRAM_LIST_FILE_NAME)
//            as? [ [String:[String:Any]] ]
//            ?? [ [String:[String:Any]] ]()
//
//        var alramListDic = alramListDicArray.first ?? [String:Any]()
//
//        alramListDic.removeValue(forKey: info.alramType.rawValue)
//
//        let _ = saveJsonData(fileName: ALRAM_LIST_FILE_NAME, saveArray: [alramListDic])
//    }
//
//    //로컬저장소 추가 및 제거
//    func saveAlramToJson( info : AlramDB ) -> Bool{
//
//        //날짜 비교를 위한 데이터
//
//        var jsonArray = readJsonData(fileName: info.fileName) as? [[String:Any]] ?? [[String:Any]]()
//
//        var newArray = [[String:Any]]()
//        for i in 0..<jsonArray.count {
//            let jsonDic = jsonArray[i]
//            if let registerTimeIntervalOfDic = jsonDic[AlramDB_KEY.REGISTER_DATE] as? TimeInterval {
//                let registerTime = Date(timeIntervalSince1970: registerTimeIntervalOfDic)
//
//                //동일한 날짜는 제거
//                if dateToStringWithFormat(formatString: "yyyyMMdd", date: registerTime) !=
//                    dateToStringWithFormat(formatString: "yyyyMMdd", date: info.registerDate) {
//                    newArray.append(jsonDic)
//                }
//            }
//        }
//
//
//        newArray.append(info.dataDic())
//        print("newArray:\(info.dataDic())")
//
//        return saveJsonData(fileName: info.fileName, saveArray: newArray)
//
//    }
//
//    func checkAlrmaFromJson(){
//
//        let morningJsonArray = readJsonData(fileName: AlramType.morning.rawValue) as? [[String:Any]] ?? [[String:Any]]()
//        print("morningJsonArray:")
//        for i in morningJsonArray {
//            print(i)
//        }
//
//        let lunchJsonArray = readJsonData(fileName: AlramType.lunch.rawValue) as? [[String:Any]] ?? [[String:Any]]()
//        print("lunchJsonArray")
//        for i in lunchJsonArray {
//            print(i)
//        }
//
//        let dinnerJsonArray = readJsonData(fileName: AlramType.dinner.rawValue) as? [[String:Any]] ?? [[String:Any]]()
//        print("dinnerJsonArray")
//        for i in dinnerJsonArray{
//            print(i)
//        }
//    }
//
//    func checkAlram(){
//        self.notiCenter.getPendingNotificationRequests { ( notificationRequests : [UNNotificationRequest] ) in
//            print("getPendingNotificationRequests\n")
//            for notificationRequest in notificationRequests {
//                print(notificationRequest)
//            }
//            print()
//        }
//
//        self.notiCenter.getDeliveredNotifications { ( notifications : [UNNotification]) in
//            print("getDeliveredNotifications\n")
//            for notification in notifications {
//                print(notification)
//            }
//            print()
//        }
//    }
//
//    func saveAlramList(info : AlramInfo){
//
//        //?/
//
//        let alramListDicArray = readJsonData(fileName: ALRAM_LIST_FILE_NAME)
//            as? [ [String:[String:Any]] ]
//            ?? [ [String:[String:Any]] ]()
//
//        var alramListDic = alramListDicArray.first ?? [String:Any]()
//
//        alramListDic[info.alramType.rawValue] = info.dataDic()
//
//        let _ = saveJsonData(fileName: ALRAM_LIST_FILE_NAME, saveArray: [alramListDic])
//
//    }
//
//    func readAlramList() -> [AlramInfo]{
//        let alramListDicArray = readJsonData(fileName: ALRAM_LIST_FILE_NAME)
//            as? [ [String:[String:Any]] ]
//            ?? [ [String:[String:Any]] ]()
//
//        let alramListDic = alramListDicArray.first ?? [String:Any]()
//
//        var infos = [AlramInfo]()
//        for key in alramListDic.keys {
//            infos.append(AlramInfo.make(dataDic: alramListDic[key] as! [String : Any]))
//        }
//        return infos
//    }
//
//    func readFirstAlramDB() -> AlramDB? {
//
//        let checkList = [AlramType.morning,
//                         AlramType.lunch,
//                         AlramType.dinner]
//
//        var firstDB : AlramDB?
//
//        for j in 0..<checkList.count {
//            let type = checkList[j]
//            var jsonArray = readJsonData(fileName: type.rawValue) as? [[String:Any]] ?? [[String:Any]]()
//            print("readFirstAlramDB : \(jsonArray)")
//            for i in 0..<jsonArray.count {
//
//                let db = AlramDB.make(dataDic: jsonArray[i])
//                if firstDB == nil {
//                    firstDB = db
//                }
//
//                let timeVlaue = db.registerDate.timeIntervalSince1970
//                if let kFirstDB = firstDB {
//                    if timeVlaue < kFirstDB.registerDate.timeIntervalSince1970 {
//                        firstDB = db
//                    }
//                }
//            }
//        }
//
//        return firstDB
//    }
//
//    func readAlramInfo(targetDate : Date) -> [AlramInfo] {
//
//        let checkList = [AlramType.morning,
//                         AlramType.lunch,
//                         AlramType.dinner]
//        var infos = [AlramInfo]()
//
//        for type in checkList {
//            var jsonArray = readJsonData(fileName: type.rawValue) ?? [[String:Any]]()
//
//            var targetDB : AlramDB?
//            for i in 0..<jsonArray.count {
//                let jsonDic = jsonArray[i]
//                let db = AlramDB.make(dataDic: jsonDic as! [String : Any])
//
//                if db.registerDate.timeIntervalSince1970 <= targetDate.timeIntervalSince1970 {
//                    targetDB = db
//                }else{
//                    break
//                }
//            }
//
//            if let targetDB = targetDB {
//                infos.append(AlramInfo(isBefore: targetDB.isBefore, isAlram: false, alramType: type, hour: targetDB.hour, minute: targetDB.minute, drugs: targetDB.drugs))
//            }
//
//        }
//
//        return infos
//
//    }
//
//    func removeDrugInfo(index:Int) -> Bool{
//        var jsonArray = readJsonData(fileName: TakingDrug.FILE_NAME) as? [[String:Any]] ?? [[String:Any]]()
//        jsonArray.remove(at: index)
//        return saveJsonData(fileName: TakingDrug.FILE_NAME, saveArray: jsonArray)
//    }
//
//    func saveTakeDrugInfos(drugInfo : TakingDrug) {
//        var jsonArray = readJsonData(fileName: TakingDrug.FILE_NAME) as? [[String:Any]] ?? [[String:Any]]()
//        jsonArray.append(drugInfo.dataDic())
//        let _ = saveJsonData(fileName: TakingDrug.FILE_NAME, saveArray: jsonArray)
//    }
//
//    func readTakeDrugInfos() -> [TakingDrug] {
//        let jsonArray = readJsonData(fileName: TakingDrug.FILE_NAME) as? [[String:Any]] ?? [[String:Any]]()
//
//        var drugInfos = [TakingDrug]()
//        for jsonDic in jsonArray {
//            drugInfos.append(TakingDrug.make(dataDic: jsonDic))
//        }
//        return drugInfos
//    }
    
    
    
    
    
    
    //========================================================================//
    //                   UNUserNotificationCenterDelegate                     //
    //========================================================================//
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        print("userNotificationCenter willPresent notification")
        
        //알람이 떴을때
        if let _ = notification.request.trigger as? UNCalendarNotificationTrigger {
            print("calendarNoti Show")
        }else if let _ = notification.request.trigger as? UNPushNotificationTrigger {
            print("pushNoti Show")
        }
        
        //배너 호출
        completionHandler([.alert,.sound])
    }
    
    
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        //호출된 배너를 클릭했을때
        //?/
        
        if let _ = response.notification.request.trigger as? UNCalendarNotificationTrigger {
            print("calendarNoti Click")
            showDrugNotiView(date: Date())
        }else if let _ = response.notification.request.trigger as? UNPushNotificationTrigger {
            print("pushNoti Click")
        }
        
        //        let infoDic = response.notification.request.content.userInfo
        //        if let dataDic = infoDic as? [String:Any] {
        //            let info = NotificationInfo.make(dataDic: dataDic)
        //            let body = response.notification.request.content.body
        //            let drugs = body.components(separatedBy: ",")
        //            if drugs.count >= 1, let trigger = response.notification.request.trigger as? UNCalendarNotificationTrigger {
        ////                let drugNotiView = DrugNotiView(drugList: drugs)
        ////                drugNotiView.info = info
        ////                drugNotiView.weekDay = trigger.dateComponents.weekday!
        ////                drugNotiView.dayUpdate()
        ////                appDel.window?.addSubview(drugNotiView)
        ////                appDel.mainVC?.navigationController?.view.addSubview(drugNotiView)
        //            }
        //        }
        
        print("userNotificationCenter didReceive response")
        completionHandler()
        
    }
    
}
