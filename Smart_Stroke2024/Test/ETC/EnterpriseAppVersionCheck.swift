//
//  EnterpriseAppVersionCheck.swift
//  KSR
//
//  Created by m2comm on 2018. 7. 23..
//  Copyright © 2018년 m2community. All rights reserved.
//

import Foundation

func enterpriseAppVersionCheck(complete : @escaping (Bool) -> Void  ){
    
    let BASE_URL = "https://ezv.kr:4447/ipa/KSR_Enter.plist"
    
    if let urlString = BASE_URL.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
        let url = URL(string: urlString)
        if let url = url {
            let sessionConfiguration = URLSessionConfiguration.default
            let urlSession = URLSession(configuration: sessionConfiguration, delegate: nil, delegateQueue: nil)
            let dataTask = urlSession.dataTask(with: url, completionHandler: { (kData : Data?, urlResponse : URLResponse?, error : Error?) in
                if let httpResponse = urlResponse as? HTTPURLResponse {
                    if httpResponse.statusCode == 200 {
                        if let data = kData {
                            if let plistDic = try? PropertyListSerialization.propertyList(from: data, options: PropertyListSerialization.ReadOptions.mutableContainers, format: nil) as! [String:Any] {
                                if let items = plistDic["items"] as? [Any] {
                                    if let firstItem = items.first as? [String:Any] {
                                        if let metadataDic = firstItem["metadata"] as? [String:String] {
                                            if var versionString = metadataDic["bundle-version"] {
                                                versionString = versionString.replacingOccurrences(of: ".", with: "")
                                                if versionString.count == 2 { versionString = "\(versionString)0" }
                                                let versionOfServer = Int(versionString)!
                                                print("versionOfServer : \(versionOfServer)")
                                                print("currentAppVersion : \(currentAppVersion())")
                                                complete(versionOfServer > currentAppVersion())
                                                return
                                            }
                                        }}}}}}
                    
                }
                complete(false)
            })
            dataTask.resume()
        }
    }
}


func currentAppVersion() -> Int  {
    
    let infoDic = Bundle.main.infoDictionary
    var currentVersion = infoDic!["CFBundleShortVersionString"] as! String
    currentVersion = currentVersion.replacingOccurrences(of: ".", with: "")
    if currentVersion.count == 2 { currentVersion = "\(currentVersion)0" }
    return Int(currentVersion)!
    
}
