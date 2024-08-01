//
//  Server.swift
//  KSR
//
//  Created by m2comm on 2018. 7. 2..
//  Copyright © 2018년 m2community. All rights reserved.
//

import UIKit
import Alamofire

class Server: NSObject,URLSessionDelegate {
    
    static func postData(urlString:String, method : HTTPMethod = .post, otherInfo : [String:String]? = nil, completion : @escaping ( _ data  : Data? ) -> Void) -> DataRequest? {
        
        guard let url = URL(string: urlString.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!) else {
            completion(nil)
            return nil
        }
        
        
        
        let request = AF.request(url, method: method, parameters: otherInfo).responseData { (dataResponse:DataResponse) in
            if let error = dataResponse.error {
                print("error \(error.localizedDescription)")
                completion(nil)
            }else{
                if dataResponse.response?.statusCode == 200 {
                    completion(dataResponse.data)
                }else{
                    print("httpStatusCode \(String(describing: dataResponse.response?.statusCode))")
                    completion(nil)
                }
            }
        }
        
        return request
    }
    
    
//    static let BASE_URL = "http://www.strokedb.or.kr/"
    
    static let BASE_URL = "http://strokedb.or.kr/"
    
    enum InfoType : String {
        
        case LOG_IN               = "app/login.asp"
        case USER_INFO            = "app_new/get_user.asp"
        
//        case BLOOD_USER           = "app/blood_user.asp"
        case BLOOD_USER           = "app_new/blood_user.asp"
        
        case BLOOD_ADD            = "app_new/set_blood.asp"
//        case BLOOD_GRAPH          = "app_new/get_blood.asp"
        case BLOOD_GRAPH          = "app_new/get_blood.asp"
        
        
        
        
        case BLOOD_DATA_ALL       = "app_new/get_blood2.asp"
        case BLOOD_DEL            = "app/del_blood.asp"
        
//        case SUGAR_USER           = "app/sugar_user.asp"
        case SUGAR_USER           = "app_new/sugar_user.asp"
        
        
//        case SUGAR_GRAPH          = "app/get_sugar.asp"
        case SUGAR_GRAPH          = "app_new/get_sugar.asp"
        
        
        case SUGAR_ADD            = "app_new/set_sugar.asp"
        
        
        case SUGAR_DATA_ALL       = "app_new/get_sugar2.asp"
        case SUGAR_DEL            = "app/del_sugar.asp"
        
//        case BMI_USER             = "app/bmi_user.asp"
        case BMI_USER             = "app_new/bmi_user.asp"
        
        
        case BMI_ADD              = "app_new/set_bmi.asp"
        
        
        
        
        case BMI_DATA_ALL         = "app_new/get_bmi2.asp"
//        case BMI_GRAPH            = "app/get_bmi.asp"
        case BMI_GRAPH            = "app_new/get_bmi.asp"
        
        
        case BMI_DEL              = "app/del_bmi.asp"
        
//        case CHOLESTEROL_USER     = "app/cholesterol_user.asp"
        case CHOLESTEROL_USER     = "app_new/cholesterol_user.asp"
        
        
        
        
        case CHOLESTEROL_ADD      = "app_new/set_cholesterol.asp"
        
        case CHOLESTEROL_DATA_ALL = "app_new/get_cholesterol2.asp"
        
//        case CHOLESTEROL_GRAPH    = "app/get_cholesterol.asp"
        case CHOLESTEROL_GRAPH    = "app_new/get_cholesterol.asp"
        
    
        
        case CHOLESTEROL_DEL      = "app/del_cholesterol.asp"
        
        case DRUG_ALRAM_GET       = "app/get_drug.asp"
        case DRUG_ALRAM_SET       = "app/set_drug.asp"
        
        case FIRST_DRUG_LIST      = "app/get_user_drag.asp"
        
        case GET_NOTICE           = "app/get_noti.asp"
        
//        case DRUG_ALRAM_GET2       = "app/get_drug2.asp"
        
        
    }
    
    
    static func getData(type : InfoType, otherInfo : [String:String]?, completion : @escaping ( _ data  : Data? ) -> Void)  {
        print("here!")
        var otherString = ""
        if let otherInfoDic = otherInfo {
            var otherStrings = [String]()
            for key in otherInfoDic.keys {
                if let value = otherInfoDic[key] {
                    otherStrings.append("\(key)=\(value)")
                }
            }
            otherString = "?\(otherStrings.joined(separator: "&"))"
        }
        // 보내는 곳
        if let urlString = "\(BASE_URL)\(type.rawValue)\(otherString)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
            print("here urlString:\n\(urlString)")
            
            let url = URL(string: urlString)
            if let url = url {
                let sessionConfiguration = URLSessionConfiguration.default
                let urlSession = URLSession(configuration: sessionConfiguration, delegate: nil, delegateQueue: nil)
                let dataTask = urlSession.dataTask(with: url, completionHandler: { (data : Data?, urlResponse : URLResponse?, error : Error?) in
                    if let error = error {
                        print(error.localizedDescription)
                        print("통신별로")
                        toastShow(message: "통신이 원활하지 않습니다.")
                        completion(nil)
                        
                    }else{
                        
                        if let httpResponse = urlResponse as? HTTPURLResponse {
                        
                            if httpResponse.statusCode == 200 {
                        
                                DispatchQueue.main.async {
                        
                                    completion(data)
                        
                                    
                                }
                                
                            }
                        }
                    }
                })
                dataTask.resume()
            }else{
                print("url error : \(urlString)")
                toastShow(message: "통신이 원활하지 않습니다.")
                completion(nil)
            }
        }
    }
    
    //단위테스트
    static func sample() {
        
        print("\(Server.InfoType.LOG_IN)")
        Server.getData(type: Server.InfoType.LOG_IN, otherInfo: ["reg_num":"hs-06475-1"]) { (kData : Data?) in
            if let data = kData {
                if let dataString = String(data: data, encoding: String.Encoding.utf8) {
                    print("dataString:\(dataString)")
                    if dataString == "Y" {
                        print("YES")
                    }else{
                        print("NO")
                    }
                }
            }
        }
        
        
        
//        Server.getData(type: .DISEASE_NAME_CATEGORY, otherInfo: nil) { (data : Data?) in
        
            //리턴 타입이 String일 경우
            //            let dataString : String = String(data: dataValue, encoding: String.Encoding.utf8)
            
            //리턴 타입이 json일 경우
            //            let json = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers)
            //            if let jsonArray = json as? [[String:String]] {
            //                print(jsonArray)
            //            }
            
            //리턴 타입이 이미지일 경우
            //            UIImage(data: data!)
//        }
    }
}
