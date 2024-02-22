//
//  DataFunction.swift
//  KSR
//
//  Created by m2comm on 2018. 7. 6..
//  Copyright © 2018년 m2community. All rights reserved.
//

import Foundation

func saveJsonData(fileName : String, saveArray : [Any]) -> Bool{
    
    if let saveJsonData = try? JSONSerialization.data(withJSONObject: saveArray, options: JSONSerialization.WritingOptions.prettyPrinted) {
        if let filePath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last?.appending("/\(fileName).dat"){
            let fileURL = URL(fileURLWithPath: filePath)
            do {
                try saveJsonData.write(to: fileURL)
                return true
            } catch {
                return false
            }
        }
    }
    return false
}


func readJsonData(fileName : String) -> [Any]?{
    
    if let filePath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last?.appending("/\(fileName).dat") {
        let fileURL = URL(fileURLWithPath: filePath)
        if let jsonData = try? Data(contentsOf: fileURL) {
            if let dataArray = (try? JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers)) as? [Any] {
                return dataArray
            }
        }
    }
    
    return nil
}

let applicationDocumentsDirectory: URL = {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "wlsrn.com.data" in the application's documents Application Support directory.
    let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return urls[urls.count-1]
}()
