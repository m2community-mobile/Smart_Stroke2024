////
////  AppDelegate.swift
////  KSR
////
////  Created by m2comm on 2018. 6. 21..
////  Copyright © 2018년 m2community. All rights reserved.
////
//
//import UIKit
//
//@UIApplicationMain
//class AppDelegate: UIResponder, UIApplicationDelegate {
//
//    var window: UIWindow?
//    var mainVC : DrugRegisterViewController?
//    var rightView : RightView?
//
//    var topView1 : RegisterdDrugListTopView?
//    var topView2 : RegisterdDrugListTopView?
//    var currentDayCountOfMonth = 30
var mainVC : MainViewController?

//    var drugManagementVC : DrugManagementViewController?
//
//    var drugNotiView : DrugNotiView?
//
//
//    @objc func goHome(){
//        self.mainVC?.navigationController?.popToRootViewController(animated: true)
//    }
//
//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//
////        if #available(iOS 13.0, *) {
////            self.window?.overrideUserInterfaceStyle = .light // 라이트모드만 지원하기
////        //    self.window?.overrideUserInterfaceStyle = .dark // 다크모드만 지원하기
////        }
//
////        AlramCenter.shared.authorizationCheck()
//        AlramCenter_R.shared.authorizationCheck()
//
//        UIApplication.shared.applicationIconBadgeNumber = 0
//
//        return true
//    }
//
//    func goToKnowViewCon(index : Int, isAnimate : Bool){
//
//        let knowVC = KnowViewController()
//
//        let TITLE_STRING = "TITLE_STRING"
//        let URL_STRING = "URL_STRING"
//
//
//        let dataArray = [
//            [TITLE_STRING : "급성기 뇌졸중",
//            URL_STRING : WebViewURL.KNOW_URL.STROKE],
//            [TITLE_STRING : "위험인자",
//             URL_STRING : WebViewURL.KNOW_URL.RISK_FACTOR],
//            [TITLE_STRING : "응급처치",
//             URL_STRING : WebViewURL.KNOW_URL.EMERGENCY_BEHAVIOR],
//            [TITLE_STRING : "뇌졸중의 치료",
//             URL_STRING : WebViewURL.KNOW_URL.STROKE_CURE],
//            [TITLE_STRING : "환자관리",
//             URL_STRING : WebViewURL.KNOW_URL.PATIENT_MANAGEMENT],
//        ]
//
//        knowVC.titleString = dataArray[index][TITLE_STRING]!
//        knowVC.urlString = dataArray[index][URL_STRING]!
//
//        appDel.mainVC?.navigationController?.pushViewController(knowVC, animated: isAnimate)
//
//        //?/
//
//
//
//    }
//
//
//    func goToKnowViewCon2(indexPath : IndexPath, isAnimate : Bool){
//
//        let knowVC = KnowViewController()
//
//        //"위험인자"
//        let dataArray : [[String]] = [
//            [],
//            [
//                WebViewURL.KNOW_URL.RISK_FACTOR,            //뇌졸중 위험인자
//                WebViewURL.KNOW_URL.HIGH_BLOOD_PRESSURE,    //고혈압
//                WebViewURL.KNOW_URL.DIABETES,               //당뇨병
//                WebViewURL.KNOW_URL.HYPER_LIPIDEMIA,        //고지혈증
//                WebViewURL.KNOW_URL.ATRIAL_FIBRILLATION,    //심방세동
//                WebViewURL.KNOW_URL.SMOKE,                  //흡연
//                WebViewURL.KNOW_URL.DRUNK,                  //음주
//                WebViewURL.KNOW_URL.OBESITY                 //비만
//            ],
//            [],
//            [
//                WebViewURL.KNOW_URL.STROKE_CURE,                //뇌졸중의 치료
//                WebViewURL.KNOW_URL.SERUM_DISSOLUTION,          //혈전용해술
//                WebViewURL.KNOW_URL.MEDICATION,                 //약물치료
//                WebViewURL.KNOW_URL.REHABILITATION_TREATMENT    //재활치료
//
//            ],
//            [
//                WebViewURL.KNOW_URL.PATIENT_MANAGEMENT,         //뇌졸중 식이요법
//                WebViewURL.KNOW_URL.OBESITY_MANAGEMENT,         //비만관리
//                WebViewURL.KNOW_URL.DEMENTA,                    //뇌졸중 후 치매
//                WebViewURL.KNOW_URL.DEPRESSION,                 //뇌졸중 후 우울증
//                WebViewURL.KNOW_URL.LONG_TERM_CARE_FINDINGS     //장기요양소견
//            ]
//        ]
//
//        let titleArray = ["","위험인자","","뇌졸중의 치료","환자 관리"]
//
//        knowVC.titleString = titleArray[indexPath.section]
//        knowVC.urlString = dataArray[indexPath.section][indexPath.row]
//
//        appDel.mainVC?.navigationController?.pushViewController(knowVC, animated: isAnimate)
//    }
//
//    func applicationWillEnterForeground(_ application: UIApplication) {
//        UIApplication.shared.applicationIconBadgeNumber = 0
//    }
//
//
//    //MARK: remoteNotification
//    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
//
//        let deviceTokenString =  deviceToken.reduce("", { $0 + String(format: "%02x", $1)})
//        print("deviceTokenString:\(deviceTokenString)")
//
//        let deviceID = UIDevice.current.identifierForVendor!.uuidString
//        print("deviceID:\(deviceID)")
//
//        let _ = "?device=IOS&token=\(deviceTokenString)&deviceid=\(deviceID)"
//
////        Server.getData(type: Server.InfoType.DEVICE_TOKEN, otherInfo: othString) { (kData : Data? ) in
////            if let data = kData {
////                if let dataString : String = String(data: data, encoding: String.Encoding.utf8) {
////                    print("DEVICE_TOKEN:\(dataString)")
////                }
////            }
////        }
//    }
//
//    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
//        print("didFailToRegisterForRemoteNotificationsWithError:\(error.localizedDescription)")
//    }
//}


//
//  AppDelegate.swift
//  KSR
//
//  Created by m2comm on 2018. 6. 21..
//  Copyright © 2018년 m2community. All rights reserved.
//

//import UIKit
//
//@UIApplicationMain
//class AppDelegate: UIResponder, UIApplicationDelegate {
//
//    var window: UIWindow?
//    var mainVC : ViewController?
//    var rightView : RightView?
//
//    var topView1 : RegisterdDrugListTopView?
//    var topView2 : RegisterdDrugListTopView?
//    var currentDayCountOfMonth = 30
//
//    var drugManagementVC : DrugManagementViewController?
//
//    var drugNotiView : DrugNotiView?
//
//
//    @objc func goHome(){
//        self.mainVC?.navigationController?.popToRootViewController(animated: true)
//    }
//
//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//
////        if #available(iOS 13.0, *) {
////            self.window?.overrideUserInterfaceStyle = .light // 라이트모드만 지원하기
////        //    self.window?.overrideUserInterfaceStyle = .dark // 다크모드만 지원하기
////        }
//
////        AlramCenter.shared.authorizationCheck()
//        AlramCenter_R.shared.authorizationCheck()
//
//        UIApplication.shared.applicationIconBadgeNumber = 0
//
//        return true
//    }
//
//    func goToKnowViewCon(index : Int, isAnimate : Bool){
//
//        let knowVC = KnowViewController()
//
//        let TITLE_STRING = "TITLE_STRING"
//        let URL_STRING = "URL_STRING"
//
//
//        let dataArray = [
//            [TITLE_STRING : "급성기 뇌졸중",
//            URL_STRING : WebViewURL.KNOW_URL.STROKE],
//            [TITLE_STRING : "위험인자",
//             URL_STRING : WebViewURL.KNOW_URL.RISK_FACTOR],
//            [TITLE_STRING : "응급처치",
//             URL_STRING : WebViewURL.KNOW_URL.EMERGENCY_BEHAVIOR],
//            [TITLE_STRING : "뇌졸중의 치료",
//             URL_STRING : WebViewURL.KNOW_URL.STROKE_CURE],
//            [TITLE_STRING : "환자관리",
//             URL_STRING : WebViewURL.KNOW_URL.PATIENT_MANAGEMENT],
//        ]
//
//        knowVC.titleString = dataArray[index][TITLE_STRING]!
//        knowVC.urlString = dataArray[index][URL_STRING]!
//
//        appDel.mainVC?.navigationController?.pushViewController(knowVC, animated: isAnimate)
//
//        //?/
//
//
//
//    }
//
//
//    func goToKnowViewCon2(indexPath : IndexPath, isAnimate : Bool){
//
//        let knowVC = KnowViewController()
//
//        //"위험인자"
//        let dataArray : [[String]] = [
//            [],
//            [
//                WebViewURL.KNOW_URL.RISK_FACTOR,            //뇌졸중 위험인자
//                WebViewURL.KNOW_URL.HIGH_BLOOD_PRESSURE,    //고혈압
//                WebViewURL.KNOW_URL.DIABETES,               //당뇨병
//                WebViewURL.KNOW_URL.HYPER_LIPIDEMIA,        //고지혈증
//                WebViewURL.KNOW_URL.ATRIAL_FIBRILLATION,    //심방세동
//                WebViewURL.KNOW_URL.SMOKE,                  //흡연
//                WebViewURL.KNOW_URL.DRUNK,                  //음주
//                WebViewURL.KNOW_URL.OBESITY                 //비만
//            ],
//            [],
//            [
//                WebViewURL.KNOW_URL.STROKE_CURE,                //뇌졸중의 치료
//                WebViewURL.KNOW_URL.SERUM_DISSOLUTION,          //혈전용해술
//                WebViewURL.KNOW_URL.MEDICATION,                 //약물치료
//                WebViewURL.KNOW_URL.REHABILITATION_TREATMENT    //재활치료
//
//            ],
//            [
//                WebViewURL.KNOW_URL.PATIENT_MANAGEMENT,         //뇌졸중 식이요법
//                WebViewURL.KNOW_URL.OBESITY_MANAGEMENT,         //비만관리
//                WebViewURL.KNOW_URL.DEMENTA,                    //뇌졸중 후 치매
//                WebViewURL.KNOW_URL.DEPRESSION,                 //뇌졸중 후 우울증
//                WebViewURL.KNOW_URL.LONG_TERM_CARE_FINDINGS     //장기요양소견
//            ]
//        ]
//
//        let titleArray = ["","위험인자","","뇌졸중의 치료","환자 관리"]
//
//        knowVC.titleString = titleArray[indexPath.section]
//        knowVC.urlString = dataArray[indexPath.section][indexPath.row]
//
//        appDel.mainVC?.navigationController?.pushViewController(knowVC, animated: isAnimate)
//    }
//
//    func applicationWillEnterForeground(_ application: UIApplication) {
//        UIApplication.shared.applicationIconBadgeNumber = 0
//    }
//
//
//    //MARK: remoteNotification
//    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
//
//        let deviceTokenString =  deviceToken.reduce("", { $0 + String(format: "%02x", $1)})
//        print("deviceTokenString:\(deviceTokenString)")
//
//        let deviceID = UIDevice.current.identifierForVendor!.uuidString
//        print("deviceID:\(deviceID)")
//
//        let _ = "?device=IOS&token=\(deviceTokenString)&deviceid=\(deviceID)"
//
////        Server.getData(type: Server.InfoType.DEVICE_TOKEN, otherInfo: othString) { (kData : Data? ) in
////            if let data = kData {
////                if let dataString : String = String(data: data, encoding: String.Encoding.utf8) {
////                    print("DEVICE_TOKEN:\(dataString)")
////                }
////            }
////        }
//    }
//
//    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
//        print("didFailToRegisterForRemoteNotificationsWithError:\(error.localizedDescription)")
//    }
//}
//


//
//  AppDelegate.swift
//  KSR
//
//  Created by m2comm on 2018. 6. 21..
//  Copyright © 2018년 m2community. All rights reserved.
//

import UIKit
import FirebaseCore

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var mainVC : MainViewController?
    var rightView : RightView?

    var topView1 : RegisterdDrugListTopView?
    var topView2 : RegisterdDrugListTopView?
    var currentDayCountOfMonth = 30
    
    var drugManagementVC : DrugManagementViewController?
    
    var drugNotiView : DrugNotiView?
    
    
    
    @objc func goHome(){
        self.mainVC?.navigationController?.popToRootViewController(animated: true)
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
//        if #available(iOS 13.0, *) {
//            self.window?.overrideUserInterfaceStyle = .light // 라이트모드만 지원하기
//        //    self.window?.overrideUserInterfaceStyle = .dark // 다크모드만 지원하기
//        }
        
//        FirebaseApp.configure()
        
//        AlramCenter.shared.authorizationCheck()
        AlramCenter_R.shared.authorizationCheck()
        
        UIApplication.shared.applicationIconBadgeNumber = 0
        
        return true
    }

    func goToKnowViewCon(index : Int, isAnimate : Bool){
        
        let knowVC = KnowViewController()
        
        let TITLE_STRING = "TITLE_STRING"
        let URL_STRING = "URL_STRING"
        
        
        let dataArray = [
            [TITLE_STRING : "급성기 뇌졸중",
            URL_STRING : WebViewURL.KNOW_URL.STROKE],
            [TITLE_STRING : "위험인자",
             URL_STRING : WebViewURL.KNOW_URL.RISK_FACTOR],
            [TITLE_STRING : "응급처치",
             URL_STRING : WebViewURL.KNOW_URL.EMERGENCY_BEHAVIOR],
            [TITLE_STRING : "뇌졸중의 치료",
             URL_STRING : WebViewURL.KNOW_URL.STROKE_CURE],
            [TITLE_STRING : "환자관리",
             URL_STRING : WebViewURL.KNOW_URL.PATIENT_MANAGEMENT],
        ]
        
        knowVC.titleString = dataArray[index][TITLE_STRING]!
        knowVC.urlString = dataArray[index][URL_STRING]!
        
        appDel.mainVC?.navigationController?.pushViewController(knowVC, animated: isAnimate)
        
        //?/
        


    }

    
    func goToKnowViewCon2(indexPath : IndexPath, isAnimate : Bool){
        
//        let knowVC = KnowViewController()
//        
//        //"위험인자"
//        let dataArray : [[String]] = [
//            [],
//            [
//                WebViewURL.KNOW_URL.RISK_FACTOR,            //뇌졸중 위험인자
//                WebViewURL.KNOW_URL.HIGH_BLOOD_PRESSURE,    //고혈압
//                WebViewURL.KNOW_URL.DIABETES,               //당뇨병
//                WebViewURL.KNOW_URL.HYPER_LIPIDEMIA,        //고지혈증
//                WebViewURL.KNOW_URL.ATRIAL_FIBRILLATION,    //심방세동
//                WebViewURL.KNOW_URL.SMOKE,                  //흡연
//                WebViewURL.KNOW_URL.DRUNK,                  //음주
//                WebViewURL.KNOW_URL.OBESITY                 //비만
//            ],
//            [],
//            [
//                WebViewURL.KNOW_URL.STROKE_CURE,                //뇌졸중의 치료
//                WebViewURL.KNOW_URL.SERUM_DISSOLUTION,          //혈전용해술
//                WebViewURL.KNOW_URL.MEDICATION,                 //약물치료
//                WebViewURL.KNOW_URL.REHABILITATION_TREATMENT    //재활치료
//                
//            ],
//            [
//                WebViewURL.KNOW_URL.PATIENT_MANAGEMENT,         //뇌졸중 식이요법
//                WebViewURL.KNOW_URL.OBESITY_MANAGEMENT,         //비만관리
//                WebViewURL.KNOW_URL.DEMENTA,                    //뇌졸중 후 치매
//                WebViewURL.KNOW_URL.DEPRESSION,                 //뇌졸중 후 우울증
//                WebViewURL.KNOW_URL.LONG_TERM_CARE_FINDINGS     //장기요양소견
//            ]
//        ]
//        
//        let titleArray = ["","위험인자","","뇌졸중의 치료","환자 관리"]
//        
//        knowVC.titleString = titleArray[indexPath.section]
//        knowVC.urlString = dataArray[indexPath.section][indexPath.row]
//        
//        appDel.mainVC?.navigationController?.pushViewController(knowVC, animated: isAnimate)
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        UIApplication.shared.applicationIconBadgeNumber = 0
    }
    
    
    //MARK: remoteNotification
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        
        let deviceTokenString =  deviceToken.reduce("", { $0 + String(format: "%02x", $1)})
        print("deviceTokenString:\(deviceTokenString)")
        
        let deviceID = UIDevice.current.identifierForVendor!.uuidString
        print("deviceID:\(deviceID)")
        
        let _ = "?device=IOS&token=\(deviceTokenString)&deviceid=\(deviceID)"
        
//        Server.getData(type: Server.InfoType.DEVICE_TOKEN, otherInfo: othString) { (kData : Data? ) in
//            if let data = kData {
//                if let dataString : String = String(data: data, encoding: String.Encoding.utf8) {
//                    print("DEVICE_TOKEN:\(dataString)")
//                }
//            }
//        }
    }

    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("didFailToRegisterForRemoteNotificationsWithError:\(error.localizedDescription)")
    }
}
