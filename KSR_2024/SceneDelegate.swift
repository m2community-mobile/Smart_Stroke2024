//
//  SceneDelegate.swift
//  KSR_2024
//
//  Created by m2comm on 2024/01/02.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var loginVC : ViewController?
    var mainVC : MainViewController?
    var finishVC : FinishJoinViewController?
    var strokeVC: StrokeManagementHandbookViewController?
    var leftView : LeftView?
    var drugNotiView : DrugNotiView?
    var drugManagementVC : DrugManagementViewController?
//    var rightView : RightView?
//
//    var topView1 : RegisterdDrugListTopView?
//    var topView2 : RegisterdDrugListTopView?
//    var currentDayCountOfMonth = 30
//    
//    var drugManagementVC : DrugManagementViewController?
//    
//    var drugNotiView : DrugNotiView?
    
    @objc func goHome(){
        self.mainVC?.navigationController?.popToRootViewController(animated: true)
    }
    

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        var naviCon = UINavigationController(rootViewController:  MainViewController())
        
        naviCon.isNavigationBarHidden = true
        
        
        
        if isLogin {
            mainVC = MainViewController()
            naviCon = NotRotatableNavigationController(rootViewController: mainVC!)
        }else{
            loginVC = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ViewController") as? ViewController
            naviCon = NotRotatableNavigationController(rootViewController: loginVC!)
        }
        
        
        
        
        
        
        window?.rootViewController = naviCon
        window?.makeKeyAndVisible()
        
        self.leftView = LeftView()
        self.window?.addSubview(self.leftView!)
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

        sceneDel!.mainVC?.navigationController?.pushViewController(knowVC, animated: isAnimate)


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
//        sceneDel!.mainVC?.navigationController?.pushViewController(knowVC, animated: isAnimate)
    }
    

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

