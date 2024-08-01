//realm관련//

import UIKit
import RealmSwift
import SQLite3


struct ALRAM_KEY {
    static let MORNING = "MORNING"
    static let LUNCH = "LUNCH"
    static let DINNER = "DINNER"
    static let KEYS = [
        ALRAM_KEY.MORNING,
        ALRAM_KEY.LUNCH,
        ALRAM_KEY.DINNER
    ]
}


class Alram_R: Object {

    @objc dynamic var idx : Int = 0
    
    
    //알람 생성시각
    @objc dynamic var registerTime : Date = Date()
    
    //식전/식후
    @objc dynamic var isBefore : Bool = false
    
    //알람 등록 여부
    @objc dynamic var isAlram : Bool = false
    
    //아침/점심/저녁
    @objc dynamic var alramKey : String = ""

    //알람시각
    @objc dynamic var hour : Int = 0
    @objc dynamic var minute : Int = 0
    
 
    
    //먹어야 하는 약 종류
    var kindOfDrugs = List<KindOfDrug_R>()
    
    
//    func IncrementaID() -> Int{
//        let realm = try! Realm()
//        if let retNext = realm.objects(Alram_R.self).sorted(byKeyPath: "idx").first?.idx {
//            return retNext + 1
//        }else{
//            return 1
//        }
//    }
    func IncrementaID() -> Int {
        let realm = try! Realm()
        return (realm.objects(Alram_R.self).max(ofProperty: "idx") as Int? ?? 0) + 1
    }

}

//약 대분류
class KindOfDrug_R: Object {

    
    @objc dynamic var idx : Int = 0
    
    
    //약 종류
    @objc dynamic var name : String = ""
    
    //체크 여부
    @objc dynamic var isCheck : Bool = false
    
    //섭취 여부
    @objc dynamic var isTake : Bool = false
    
    //약 소분류
    var drugs = List<Drug_R>()
    
}

//약 소분류
class Drug_R: Object {
    
    
    @objc dynamic var idx : Int = 0
    //약 이름
    @objc dynamic var name : String = ""
    
    //체크 여부
    @objc dynamic var isCheck : Bool = false
}

//각 날, 각 알람에 섭취한 약 정보
class DayComponentOfDrug_R: Object {
    
    @objc dynamic var idx : Int = 0
    
    
    @objc dynamic var alramIdx : Int = 0
    
    
    //아침/점심/저녁
    @objc dynamic var alramKey : String = ""
    
    //날짜 - YYYYMMdd
    @objc dynamic var Day : String = ""

    //약 하나라도 먹으면 체크
    @objc dynamic var isTake : Bool = false

    
   
    
    
    
    //먹어야 하는 약 종류
    var kindOfDrugs = List<KindOfDrug_R>()

    //알람시각
    @objc dynamic var hour : Int = 0
    @objc dynamic var minute : Int = 0
    
    func IncrementaIDX() -> Int {
        let realm = try! Realm()
        return (realm.objects(DayComponentOfDrug_R.self).max(ofProperty: "idx") as Int? ?? 0) + 1
    }
    
    
    
}

//삭제 예정
class DayOfDrug_R: Object {
    
    @objc dynamic var idx : Int = 0
    
    //아침/점심/저녁
    @objc dynamic var alramKey : String = ""
    
    //날짜 - YYYYMMdd
    @objc dynamic var Day : String = ""
    
    //약 하나라도 먹으면 체크
    @objc dynamic var isTake : Bool = false
    
    //먹어야 하는 약 종류
    var kindOfDrugs = List<KindOfDrug_R>()
    
   
    
    
    
    //알람시각
    @objc dynamic var hour : Int = 0
    @objc dynamic var minute : Int = 0
    
    var componentOfDays = List<ComponentOfDay_R>()

}

class ComponentOfDay_R : Object {
    
    @objc dynamic var idx : Int = 0
    
    //아침/점심/저녁
    @objc dynamic var alramKey : String = ""

    //약 섭취 여부
    @objc dynamic var isCheck : Bool = false

    //알람시각
    @objc dynamic var hour : Int = 0
    @objc dynamic var minute : Int = 0

    // 약 종류
  
    //먹어야 하는 약 종류
    var kindOfDrugs = List<KindOfDrug_R>()
}



class RealmCenter: NSObject {
    
    var realm : Realm!
    var isShowLog = true
    var debugMode = false
    
    static let shared : RealmCenter = {
        let sharedCenter = RealmCenter()
        
        do {
            let realm = try Realm()
            sharedCenter.realm = realm
            if sharedCenter.isShowLog { print("Realm Database init Success") }

            if sharedCenter.debugMode {
                do {
                    try realm.write {
                        realm.deleteAll()
                        
                        if sharedCenter.isShowLog { print("deleteAll Success") }
                    }
                }catch {
                    if sharedCenter.isShowLog { print("deleteAll Fail:\n\(error.localizedDescription)" ) }
                }
            }
            
            
        }catch {
            if sharedCenter.isShowLog { print("Realm Database init Fail:\n\(error.localizedDescription)" ) }
        }
        
        return sharedCenter
    }()
    
    
    func write(keyWord : String = "", doSomething : @escaping (_ realm : Realm ) -> Void, complete : @escaping(_ success : Bool, _ errorString : String?) -> Void){
        do {
            try realm.write {
                
//                let idx = realm.objects(Alram_R.self).first
//                
//                let newItem = idx?.idx
//                
//                idx?.idx = idx!.idx + 1
                
                
                doSomething(self.realm)
                
                print("\(doSomething)")
            }
            if isShowLog { print("\(keyWord) Success") }
            complete(true, nil)
        }catch {
            if isShowLog { print("\(keyWord) Fail:\n\(error.localizedDescription)" ) }
            complete(false, error.localizedDescription)
            
        }
    }
    
    
    
    
    
}
