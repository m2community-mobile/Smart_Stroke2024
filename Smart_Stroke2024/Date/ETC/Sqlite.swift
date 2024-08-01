//
//  Sqlite.swift
//  KSR_2024
//
//  Created by m2comm on 2024/05/20.
//

import Foundation
import SQLite3











struct MYSQ: Codable {
   var timer1 : Int = 0
    var timer2 : Int = 0
    var name : String = ""
    var isBefore: Int = 0
var hour: Int = 0
    var minute : Int = 0
var alarm: Int = 0
var week1YN: Int = 0
var week2YN: Int = 0
var week3YN: Int = 0
var week4YN: Int = 0
var week5YN: Int = 0
var week6YN: Int = 0
var week7YN: Int = 0
var gubun1YN: Int = 0
var gubun2YN: Int = 0
var gubun3YN: Int = 0
var gubun4YN: Int = 0
var gubun5YN: Int = 0
var gubun6YN: Int = 0
var gubun7YN: Int = 0
var stime: Int = 0
}



class SQLiteClient {
    
    var db: OpaquePointer?
    let TABLE_NAME: String = "test"
//    var dbConn: OpaquePointer?
    var stmt: OpaquePointer?
    //}
    
    static let shared = SQLiteClient()
    
    
    
    func createTable(){
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("DSDatabase.sqlite")
        
        
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
            print("table not exsist")
        }
        
        let CREATE_QUERY_TEXT : String = "CREATE table if not exists Alarm (idx integer primary key autoincrement, " +
        "timer1 integer, timer2 integer, name text, hour integer, minute integer, alarm integer, " +
        "week1YN integer, week2YN integer, week3YN integer, week4YN integer, week5YN integer, week6YN integer, week7YN integer, " +
        "gubun1YN integer, gubun2YN integer, gubun3YN integer, gubun4YN integer, gubun5YN integer, gubun6YN, gubun7YN integer, " +
        "stime integer, etime integer)"
        
        print(CREATE_QUERY_TEXT)
        //        if sqlite3_exec(db, CREATE_QUERY_TEXT, nil, nil, nil) != SQLITE_OK {
        if sqlite3_exec(db, CREATE_QUERY_TEXT, nil, nil, nil) != SQLITE_OK {
            let errMsg = String(cString:sqlite3_errmsg(db))
            print("db table create error : \(errMsg)")
        }
    }
    
    
    //func insert(_ title : String,_ subline : String, _ date : String ){
    
    
    //func insert(_ registerTime : Int,_ alramKey : String, _ isAlram : Int, _ isBefore: Int, _ hour: Int, _ minute : Int) {
    //        var stmt : OpaquePointer?
    //
    //        let INSERT_QUERY_TEXT : String = "INSERT INTO \(TABLE_NAME) (title, subline, date) Values (?,?,?)"
    //
    //        if sqlite3_prepare(db, INSERT_QUERY_TEXT, -1, &stmt, nil) != SQLITE_OK {
    //            let errMsg = String(cString: sqlite3_errmsg(db)!)
    //            print("error preparing insert:v1 \(errMsg)")
    //            return
    //        }
    //
    //        let SQLITE_TRANSIENT = unsafeBitCast(-1, to: sqlite3_destructor_type.self)
    //
    //        if sqlite3_bind_text(stmt, 1, alramKey, -1, SQLITE_TRANSIENT) != SQLITE_OK{
    //            let errMsg = String(cString : sqlite3_errmsg(db)!)
    //            print("failture binding name: \(errMsg)")
    //            return
    //        }
    //
    //
    //          if sqlite3_bind_int(stmt, 2, Int32(isAlram)) != SQLITE_OK {
    //              let errMsg = String(cString : sqlite3_errmsg(db)!)
    //              print("failture binding name: \(errMsg)")
    //              return
    //          }
    //
    //    if sqlite3_bind_int(stmt, 3, Int32(isBefore)) != SQLITE_OK {
    //        let errMsg = String(cString : sqlite3_errmsg(db)!)
    //        print("failture binding name: \(errMsg)")
    //        return
    //    }
    //
    //    if sqlite3_bind_int(stmt, 4, Int32(hour)) != SQLITE_OK {
    //        let errMsg = String(cString : sqlite3_errmsg(db)!)
    //        print("failture binding name: \(errMsg)")
    //        return
    //    }
    //
    //    if sqlite3_bind_int(stmt, 5, Int32(minute)) != SQLITE_OK {
    //        let errMsg = String(cString : sqlite3_errmsg(db)!)
    //        print("failture binding name: \(errMsg)")
    //        return
    //    }
    //
    //    if sqlite3_bind_int(stmt, 6, Int32(registerTime)) != SQLITE_OK {
    //        let errMsg = String(cString : sqlite3_errmsg(db)!)
    //        print("failture binding name: \(errMsg)")
    //        return
    //    }
    //
    //
    ////        if sqlite3_bind_text(stmt, 2, isAlram, -1, SQLITE_TRANSIENT) != SQLITE_OK{
    ////            let errMsg = Int(cString : sqlite3_errmsg(db)!)
    ////            print("failture binding name: \(errMsg)")
    ////            return
    ////        }
    ////
    ////
    ////        if sqlite3_bind_text(stmt, 3, isBefore, -1, SQLITE_TRANSIENT) != SQLITE_OK{
    ////            let errMsg = String(cString : sqlite3_errmsg(db)!)
    ////            print("failture binding name: \(errMsg)")
    ////            return
    ////        }
    //
    //        if sqlite3_step(stmt) != SQLITE_DONE {
    //            let errMsg = String(cString : sqlite3_errmsg(db)!)
    //            print("insert fail :: \(errMsg)")
    //            return
    //        }
    //    }
    //
    //func insert(_ registerTime : Int,_ alramKey : String, _ isAlram : Int, _ isBefore: Int, _ hour: Int, _ minute : Int) {
    ////func insert(_ name: String, _ age: Int) {
    //      // id 는 Auto increment 속성을 갖고 있기에 빼줌.
    //      let insertQuery = "insert into myTable (id, alramKey, registerTime, isAlram, isBefore, hour, minute) values (?, ?, ?);"
    
    
    func insert(_ timer1 : Int,_ timer2 : Int, _ name : String, _ isBefore: Int, _ hour: Int, _ minute : Int, _ alarm: Int, _ week1YN: Int, _ week2YN: Int, _ week3YN: Int, _ week4YN: Int, _ week5YN: Int, _ week6YN: Int, _ week7YN: Int, _ gubun1YN: Int, _ gubun2YN: Int, _ gubun3YN: Int, _ gubun4YN: Int, _ gubun5YN: Int, _ gubun6YN: Int, _ gubun7YN: Int, _ stime: Int) {
        //func insert(_ name: String, _ age: Int) {
        // id 는 Auto increment 속성을 갖고 있기에 빼줌.
        let insertQuery = "insert into Alarm (timer1, timer2, name, hour, minute, alarm, week1YN, week2YN, week3YN, week4YN, week5YN, week6YN, week7YN, gubun1YN, gubun2YN, gubun3YN, gubun4YN, gubun5YN, gubun6YN, gubun7YN, stime) values (?, ?, '?', ?, ?, ?, 0, 0, 0, 0, 0, 0, 0, ?, ?, ?, ?, ?, ?, ?, ?);"
        
        
        var statement: OpaquePointer? = nil
        
        if sqlite3_prepare_v2(db, insertQuery, -1, &statement, nil) == SQLITE_OK {
            
            sqlite3_bind_int(statement, 1, Int32(timer1))
            sqlite3_bind_int(statement, 2, Int32(timer2))
            sqlite3_bind_text(statement, 3, name, -1, nil)
            sqlite3_bind_int(statement, 4, Int32(isBefore))
            sqlite3_bind_int(statement, 5, Int32(hour))
            sqlite3_bind_int(statement, 6, Int32(minute))
            sqlite3_bind_int(statement, 7, Int32(alarm))
            sqlite3_bind_int(statement, 8, Int32(week1YN))
            sqlite3_bind_int(statement, 9, Int32(week2YN))
            sqlite3_bind_int(statement, 10, Int32(week3YN))
            sqlite3_bind_int(statement, 11, Int32(week4YN))
            sqlite3_bind_int(statement, 12, Int32(week5YN))
            sqlite3_bind_int(statement, 13, Int32(week6YN))
            sqlite3_bind_int(statement, 14, Int32(week7YN))
            sqlite3_bind_int(statement, 15, Int32(gubun1YN))
            sqlite3_bind_int(statement, 16, Int32(gubun2YN))
            sqlite3_bind_int(statement, 17, Int32(gubun3YN))
            sqlite3_bind_int(statement, 18, Int32(gubun4YN))
            sqlite3_bind_int(statement, 19, Int32(gubun5YN))
            sqlite3_bind_int(statement, 20, Int32(gubun6YN))
            sqlite3_bind_int(statement, 21, Int32(gubun7YN))
            sqlite3_bind_int(statement, 22, Int32(stime))
            
            
            
            
            
            
        }
        else {
            print("sqlite binding failure")
        }
        
        if sqlite3_step(statement) == SQLITE_DONE {
            print("sqlite insertion success")
        }
        else {
            print("sqlite step failure")
        }
    }
    
    func selectValue(){
        
        let SELECT_QUERY = "SELECT * FROM \(TABLE_NAME)"
        var stmt:OpaquePointer?
        
        
        if sqlite3_prepare(db, SELECT_QUERY, -1, &stmt, nil) != SQLITE_OK{
            let errMsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert: v1\(errMsg)")
            return
        }
        
        while(sqlite3_step(stmt) == SQLITE_ROW){
            let id = sqlite3_column_int(stmt, 0)
            let alramKey = String(cString: sqlite3_column_text(stmt, 1))
            let registerTime = Int(integerLiteral: Int(sqlite3_column_int(stmt, 2)))
            let isAlram = Int(integerLiteral: Int(sqlite3_column_int(stmt, 3)))
            let isBefore = Int(integerLiteral: Int(sqlite3_column_int(stmt, 4)))
            let hour = Int(integerLiteral: Int(sqlite3_column_int(stmt, 5)))
            let minute = Int(integerLiteral: Int(sqlite3_column_int(stmt, 6)))
            
            
            
            
            
            
            
            
            print("read value id : \(id) alramKey : \(alramKey) registerTime : \(registerTime) isAlram : \(isAlram) isBefore : \(isBefore) hour : \(hour) minute : \(minute)")
        }
        
    }
    //func update(_ index:String, _ title : String,_ subline : String, _ date : String){
    func update(_ index:String, _ registerTime : Int,_ alramKey : String, _ isAlram : Int, _ isBefore: Int, _ hour: Int, _ minute : Int){
        let UPDATE_QUERY = "UPDATE \(TABLE_NAME) Set registerTime = '\(registerTime)', alramKey = '\(alramKey)', isAlram= '\(isAlram)', 'isBefore = \(isBefore)', hour = \(hour)', minute = \(minute)' WHERE id == \(index)"
        var stmt:OpaquePointer?
        print(UPDATE_QUERY)
        if sqlite3_prepare(db, UPDATE_QUERY, -1, &stmt, nil) != SQLITE_OK{
            let errMsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing update: v1\(errMsg)")
            return
        }
        
        if sqlite3_step(stmt) != SQLITE_DONE {
            let errMsg = String(cString : sqlite3_errmsg(db)!)
            print("update fail :: \(errMsg)")
            return
        }
        
        sqlite3_finalize(stmt)
        print("update success")
        
    }
    
    
    //func readData(_ tableName: String, _ columm: [String]) -> (Dictionary<Int, Any>) {
    //      let query = "select * from \(TABLE_NAME)"
    //      var statement: OpaquePointer? = nil
    //      var readData = Dictionary<Int,Dictionary<String, String>>()
    //    var result: [MYSQ] = []
    //
    //      if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK {
    //          while sqlite3_step(statement) == SQLITE_ROW {
    //              let id = sqlite3_column_int(statement, 0)
    //              var data = Dictionary<String, String>()
    //              for i in (0..<columm.count) {
    //                  data[columm[i]] = String(cString: sqlite3_column_text(statement, Int32(i + 1)))
    //              }
    //              readData[Int(id)] = data
    ////                let overallData = String(cString: sqlite3_column_text(statement, 1))
    ////                do {
    ////                    let data = try JSONDecoder().decode(OverallData.self, from: overallData.data(using: .utf8)!)
    ////                    print("readData Result : \(id) \(data.candidateItem.name)")
    ////                } catch {
    ////                    print("JSONDecoder Error")
    ////                }
    //          }
    //
    //      } else {
    //          print("read Data prepare fail")
    //      }
    //      sqlite3_finalize(statement)
    //      return readData
    //  }
    
    
    
    
    func readData(_ tableName: String, _ columm: [String]) -> (Dictionary<Int, Any>) {
        let query = "select name, gubun1YN, gubun2YN, gubun3YN, gubun4YN, gubun5YN, gubun6YN, gubun7YN, hour, minute, timer1, timer2, alarm, idx from Alarm order by hour asc, minute asc"
        var statement: OpaquePointer? = nil
        var readData = Dictionary<Int,Dictionary<String, String>>()
        
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK {
            while sqlite3_step(statement) == SQLITE_ROW {
                let id = sqlite3_column_int(statement, 0)
                var data = Dictionary<String, String>()
                for i in (0..<columm.count) {
                    data[columm[i]] = String(cString: sqlite3_column_text(statement, Int32(i + 1)))
                }
                readData[Int(id)] = data
                //                let overallData = String(cString: sqlite3_column_text(statement, 1))
                //                do {
                //                    let data = try JSONDecoder().decode(OverallData.self, from: overallData.data(using: .utf8)!)
                //                    print("readData Result : \(id) \(data.candidateItem.name)")
                //                } catch {
                //                    print("JSONDecoder Error")
                //                }
            }
        } else {
            print("read Data prepare fail")
        }
        sqlite3_finalize(statement)
        return readData
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    func readData() -> [MYSQ] {
        let query: String = "select name, gubun1YN, gubun2YN, gubun3YN, gubun4YN, gubun5YN, gubun6YN, gubun7YN, hour, minute, timer1, timer2, alarm, idx from Alarm order by hour asc, minute asc"
        var statement: OpaquePointer? = nil
        // 아래는 [MyModel]? 이 되면 값이 안 들어간다.
        // Nil을 인식하지 못하는 것으로..
        var result: [MYSQ] = []
        
        if sqlite3_prepare(db, query, -1, &statement, nil) != SQLITE_OK {
            let errorMessage = String(cString: sqlite3_errmsg(db)!)
            print("error while prepare: \(errorMessage)")
            return result
        }
        
        
        while sqlite3_step(statement) == SQLITE_ROW {
            
            //           let id = sqlite3_column_int(statement, 0) // 결과의 0번째 테이블 값
            //           let name = String(cString: sqlite3_column_text(statement, 1)) // 결과의 1번째 테이블 값.
            //           let age = sqlite3_column_int(statement, 2) // 결과의 2번째 테이블 값.
            
            
            let timer1 = sqlite3_column_int(statement, 1) // 결과의 0번째 테이블 값
            var timer2 = sqlite3_column_int(statement, 2) // 결과의 0번째 테이블 값
            var name = String(cString: sqlite3_column_text(statement, 3)) // 결과의 1번째 테이블 값.
            var isBefore = sqlite3_column_int(statement, 4) // 결과의 0번째 테이블 값
            var hour = sqlite3_column_int(statement, 5) // 결과의 0번째 테이블 값
            var minute = sqlite3_column_int(statement, 6) // 결과의 0번째 테이블 값
            var alarm = sqlite3_column_int(statement, 7) // 결과의 0번째 테이블 값
            var week1YN = sqlite3_column_int(statement, 8) // 결과의 0번째 테이블 값
            var week2YN = sqlite3_column_int(statement, 9) // 결과의 0번째 테이블 값
            var week3YN = sqlite3_column_int(statement, 10) // 결과의 0번째 테이블 값
            var week4YN = sqlite3_column_int(statement, 11) // 결과의 0번째 테이블 값
            var week5YN = sqlite3_column_int(statement, 12) // 결과의 0번째 테이블 값
            var week6YN = sqlite3_column_int(statement, 13) // 결과의 0번째 테이블 값
            var week7YN = sqlite3_column_int(statement, 14) // 결과의 0번째 테이블 값
            var gubun1YN = sqlite3_column_int(statement, 15) // 결과의 0번째 테이블 값
            var gubun2YN = sqlite3_column_int(statement, 16) // 결과의 0번째 테이블 값
            var gubun3YN = sqlite3_column_int(statement, 17) // 결과의 0번째 테이블 값
            var gubun4YN = sqlite3_column_int(statement, 18) // 결과의 0번째 테이블 값
            var gubun5YN = sqlite3_column_int(statement, 19) // 결과의 0번째 테이블 값
            var gubun6YN = sqlite3_column_int(statement, 20) // 결과의 0번째 테이블 값
            var gubun7YN = sqlite3_column_int(statement, 21) // 결과의 0번째 테이블 값
            var stime = sqlite3_column_int(statement, 22) // 결과의 0번째 테이블 값
            
            
            result.append(MYSQ(timer1: Int(timer1), timer2: Int(timer2), name: name, isBefore: Int(isBefore), hour: Int(hour), minute: Int(minute), alarm: Int(alarm), week1YN: Int(week1YN), week2YN: Int(week2YN), week3YN: Int(week3YN), week4YN: Int(week4YN), week5YN: Int(week5YN), week6YN: Int(week6YN), week7YN: Int(week7YN), gubun1YN: Int(gubun1YN), gubun2YN: Int(gubun2YN), gubun3YN: Int(gubun3YN),  gubun4YN: Int(gubun4YN),  gubun5YN: Int(gubun5YN),  gubun6YN: Int(gubun6YN),  gubun7YN: Int(gubun7YN),  stime: Int(stime)))
            
            
            print("result.count\(result.count)")
            print("result.count\(result)")
            
            
            
        }
        
        sqlite3_finalize(statement)
        
        return result
    }
    
    
    
    func delete(_ index:String){
        //        readValues()
        let DELETE_QUERY = "DELETE FROM \(TABLE_NAME) WHERE id = \(index)"
        var stmt:OpaquePointer?
        
        print(DELETE_QUERY)
        if sqlite3_prepare_v2(db, DELETE_QUERY, -1, &stmt, nil) != SQLITE_OK{
            let errMsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing delete: v1\(errMsg)")
            return
        }
        
        if sqlite3_step(stmt) != SQLITE_DONE {
            let errMsg = String(cString : sqlite3_errmsg(db)!)
            print("delete fail :: \(errMsg)")
            return
        }
        sqlite3_finalize(stmt)
        
    }
    
    
    //func openDatabase() -> OpaquePointer? {
    //        var db: OpaquePointer? = nil
    //       if sqlite3_open(part1DbPath, &db) == SQLITE_OK {
    //         print("Successfully opened connection to database at \(part1DbPath)")
    //             return db
    //    } else {
    //               print("Unable to open database. Verify that you created the directory described " +
    //                                 "in the Getting Started section.")
    //                PlaygroundPage.current.finishExecution()
    //           }
    //     }
    // let db = openDatabase()
    //
}
