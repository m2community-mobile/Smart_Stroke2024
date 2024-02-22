//
//  DataStruct.swift
//  KSR
//
//  Created by m2comm on 2018. 7. 20..
//  Copyright © 2018년 m2community. All rights reserved.
//

import UIKit

//약물정보
struct Drug {
    var index = 0
    var name = ""
}


// MARK:DrugNotiInfo
// 약을 먹었다는걸 확인하기 위한 뷰에 표시
struct DrugNotiInfo_KEY {
    static let IS_CHECK = "IS_CHECK"
    static let SELECT_TIME = "SELECT_TIME"
    static let DRUGS = "DRUGS"
//    static let ETC = "ETC"
    
    static let DRUG = "drug"  //"drug\(i)"
    
}

struct DrugNotiInfo {
    
    var alramType : AlramType = .morning
    var isCheck = false
    var selectTime = Date()
    var drugs = [Drug]()
//    var etc = Drug()
    
    var checkDrugs = [Drug]()
//    var checkEtc = Drug()
    
}



//MARK:Alram
enum AlramType : String {
    case morning          = "morning"
    case lunch            = "lunch"
    case dinner           = "dinner"
}

let ALRAM_LIST_FILE_NAME = "ALRAM_LIST_FILE_NAME"

struct AlramInfo {
    
    static let IS_ALRAM = "IS_ALRAM"
    static let ALRAM_TYPE = "ALRAM_TYPE"
    static let HOUR = "HOUR"
    static let MINUTE = "MINUTE"
    static let DRUG = "drug" //"\(drug)\(i)"
//    static let ETC = "ETC"
    
    static let IS_BEFORE = "IS_BEFORE"
    
    //식전 식후
    var isBefore : Bool = false
    
    var isAlram : Bool = false
    
    //아침/점심/저녁
    var alramType : AlramType = .morning
    
    //알람시각
    var hour : Int            = 0
    var minute : Int          = 0
    
    //먹어야 하는 약들
    var drugs : [Drug]        = [Drug]()
    
//    var etc                   = ""
    
    func dataDic() -> [String:Any]{
        var returnDataDic = [String:Any]()
        returnDataDic[AlramInfo.IS_BEFORE] = self.isBefore
        returnDataDic[AlramInfo.IS_ALRAM] = self.isAlram
        returnDataDic[AlramInfo.ALRAM_TYPE] = self.alramType.rawValue
        returnDataDic[AlramInfo.HOUR] = self.hour
        returnDataDic[AlramInfo.MINUTE] = self.minute
//        returnDataDic[AlramInfo.ETC] = self.etc
        for drug in self.drugs {
            returnDataDic["\(AlramInfo.DRUG)\(drug.index)"] = drug.name
        }
        return returnDataDic
    }
    
    static func make(dataDic : [String:Any]) -> AlramInfo{
        var info = AlramInfo()
        info.isBefore = dataDic[AlramInfo.IS_BEFORE] as? Bool ?? false
        info.isAlram = dataDic[AlramInfo.IS_ALRAM] as? Bool ?? false
        info.alramType = AlramType(rawValue: (dataDic[AlramInfo.ALRAM_TYPE] as? String ?? AlramType.morning.rawValue))!
        info.hour = dataDic[AlramInfo.HOUR] as? Int ?? 0
        info.minute = dataDic[AlramInfo.MINUTE] as? Int ?? 0
//        info.etc = dataDic[AlramInfo.ETC] as? String ?? ""
        
        var drugs = [Drug]()
        for i in 0..<7{
            if let drugName = dataDic["\(AlramInfo.DRUG)\(i)"] as? String {
                drugs.append(Drug(index: i, name: drugName))
            }
        }
        if drugs.count > 0{
            info.drugs = drugs
        }
        
        return info
    }
    
}


//MARK:알람을 등록할때 날짜별 변환점 저장
struct AlramDB_KEY {
    
    static let FILE_NAME     = "FILE_NAME"
    
    static let REGISTER_DATE = "REGISTER_DATE"
    
    static let HOUR          = "HOUR"
    static let MINUTE        = "MINUTE"
    
    static let DRUGS         = "DRUGS"
    
    static let DRUG          = "drug" // "drug\(i)"
//    static let ETC           = "etc"
    
    static let IS_BEFORE = "IS_BEFORE"
    
}

struct AlramDB {
    
    var fileName            = ""
    
    var registerDate : Date = Date()
    
    var isBefore : Bool = false
    
    //알람시각
    var hour : Int          = 0
    var minute : Int        = 0
    
    //먹어야 하는 약들
    var drugs : [Drug]      = [Drug]()
//    var etc                 = ""
    
    func dataDic() -> [String:Any] {
        var returnDataDic =
            [
                AlramDB_KEY.FILE_NAME : fileName,
                AlramDB_KEY.IS_BEFORE : isBefore,
                AlramDB_KEY.REGISTER_DATE : registerDate.timeIntervalSince1970,
                AlramDB_KEY.HOUR : hour,
                AlramDB_KEY.MINUTE : minute,
//                AlramDB_KEY.ETC : etc
                ] as [String:Any]
        
        for drug in drugs {
            let index = drug.index
            returnDataDic["\(AlramDB_KEY.DRUG)\(index)"] = drug.name
        }
        return returnDataDic
    }
    
    static func make(dataDic : [String:Any]) -> AlramDB {
        
        var db          = AlramDB()
        db.isBefore     = dataDic[AlramDB_KEY.IS_BEFORE] as! Bool
        db.fileName     = dataDic[AlramDB_KEY.FILE_NAME] as! String
        db.registerDate = Date(timeIntervalSince1970: dataDic[AlramDB_KEY.REGISTER_DATE] as! TimeInterval)
        db.hour         = dataDic[AlramDB_KEY.HOUR] as! Int
        db.minute       = dataDic[AlramDB_KEY.MINUTE] as! Int

        var drugs           = [Drug]()
        for i in 0..<7 {
            if let drugName = dataDic["\(AlramDB_KEY.DRUG)\(i)"] as? String {
                drugs.append(Drug(index: i, name: drugName))
            }
        }
        if drugs.count > 0{
            db.drugs        = drugs
        }
        
//        if let etcDrugName  = dataDic[AlramDB_KEY.ETC] as? String {
//            db.etc          = etcDrugName
//        }
        
        return db
    }
}



//MARK:각 날짜별 약을 먹었다는걸 저장하기 위한 정보
struct TakingDrug {
    
    static let FILE_NAME = "TakingDrug"
    
    static let TAKE_DATE = "TAKE_DATE"
    static let TYPE      = "TYPE"
    static let DRUG      = "DRUG"
//    static let ETC       = "ETC"
    
    var takeDate : Date = Date()
    var type : AlramType = .morning
    var drugs : [Drug] = [Drug]()
//    var etc : String = ""
    
    func dataDic() -> [String:Any] {
        var returnDataDic = [String:Any]()
        returnDataDic[TakingDrug.TAKE_DATE] = self.takeDate.timeIntervalSince1970
        returnDataDic[TakingDrug.TYPE] = self.type.rawValue
        
        for drug in self.drugs {
//            if drug.index == 5 {
//                returnDataDic[TakingDrug.ETC] = drug.name
//            }else{
                returnDataDic["\(TakingDrug.DRUG)\(drug.index)"] = drug.name
//            }
        }
        return returnDataDic
    }
    
    static func make(dataDic : [String:Any]) -> TakingDrug {
        var drugInfo = TakingDrug()
        drugInfo.takeDate = Date(timeIntervalSince1970: dataDic[TakingDrug.TAKE_DATE] as! TimeInterval)
        drugInfo.type = AlramType(rawValue: dataDic[TakingDrug.TYPE] as! String)!
//        drugInfo.etc = dataDic[TakingDrug.ETC] as? String ?? ""
        
        var drugs = [Drug]()
        for i in 0..<7 {
            if let drugName = dataDic["\(TakingDrug.DRUG)\(i)"] as? String {
                drugs.append(Drug(index: i, name: drugName))
            }
        }
        drugInfo.drugs = drugs
        
        return drugInfo
    }
}
