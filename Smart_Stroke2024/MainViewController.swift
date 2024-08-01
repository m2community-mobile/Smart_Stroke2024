//
//  MainViewController.swift
//  KSR_2024
//
//  Created by m2comm on 2024/01/02.
//

import Foundation
import UIKit
import Then
import Alamofire
import SQLite3


struct KsrNum: Codable {
    var FAT: String
    var LNT: String
    var age: String
    var app_reg_num: String
    var arrival: String
    var gfr: String
    var gi_abd_cir: String
    var gi_er: String
    var ht: String
    var ind_stroke: String
    var ini_nih: String
    var male: String
    var max: String
    var min: String
    var on_d: String
    var onset_chk: String
    var pre_mrs: String?
    var result1: String
    var result2: String
    var result3: String
    var rf_hx_af: String
    var rf_hx_chd: String
    var rf_hx_dm: String
    var rf_hx_hl: String
    var rf_hx_htn: String
    var rf_hx_pad: String
    var rf_hx_str: String
    var rf_smok: String
    var st_lab_cr: String
    var st_lab_hdl: String?
    var to_toast: String
    var to_toast_ko: String
    var wt: String


}




struct MyInfo: Codable {
    var result: Int
    var data: MyInfoDetail
    var message: String
}

struct MyInfoDetail: Codable {
    
    var birth: String
    var email1: String
    var email2: String
    var hospital: String
    var reg_num: String?
    var sex: String
    var user_id: String
    var user_sid: String
    
    enum CodingKeys: String, CodingKey{
            case birth = "birth"
            case email1 = "email1"
            case email2 = "email2"
            case hospital = "hospital"
            case reg_num = "reg_num"
            case sex = "sex"
            case user_id = "user_id"
        case user_sid = "user_sid"
        }
    
    
    
    
}


class MainViewController: UIViewController{
    
//    var dataList = ["1", "2", "3"]
//    var dataList2 = ["4", "5", "6"]
//    
//    var dataArray = [String]()
    
    
    var mysq : [MYSQ] = []
    
    
    
    
    private var sideMenuViewController = SideMenuViewController()
//       private var dimmingView: UIView?
       
       private lazy var sideMenuButton = UIImageView().then {
           $0.image = UIImage(systemName: "text.justify")
           $0.tintColor = .black
           
           let tap = UITapGestureRecognizer(target: self, action: #selector(presentSideMenu))
           $0.addGestureRecognizer(tap)
           $0.isUserInteractionEnabled = true
       }
    
    var sideBTN: UIButton!

    
    
    
    var isSlideInMenuPresented = false
    lazy var slideMenuPadding: CGFloat = self.view.frame.width * 0.001
    
    
    
    
//    lazy var menuBarButton = UIBarButtonItem(image: UIImage(systemName: "sidebar.leading")?.withRenderingMode(.alwaysOriginal), style: .done, target: self, action: #selector(menuBarButtonItemTapped))

    var naviBarButton: UIButton!
    var naviBarButtonImage: UIImageView!
    
    
    
    @objc func menuBarButtonItemTapped() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut) {
            self.scrollView.frame.origin.x = self.isSlideInMenuPresented ? 0 : self.slideMenuPadding - self.scrollView.frame.width
        } completion: { (finished) in
            print("Animation finished: \(finished)")
            self.isSlideInMenuPresented.toggle()
        }

    }
    //side menu
    lazy var menuView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.03910150751, green: 0.2058883309, blue: 0.4763596654, alpha: 1)
        return view
    }()
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    var buttonView: UIView!
    
    var goBrain : UIButton!
    var managementbrain : UIButton!
    
    
    var myTableView: UITableView!
    var managementTableView: UITableView!
    
    var selected: Bool!
// side menu
    
    

    var titleName = ["뇌졸중관리", " 혈압관리", "당뇨관리", "이상지질혈증관리", "비만관리및운동", "약물복용관리"]
    
    
    
    
    let labelOne: UILabel = {
      let label = UILabel()
      label.text = "Scroll Top"
      label.backgroundColor = .red
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()

    let labelTwo: UILabel = {
      let label = UILabel()
      label.text = ""
      label.backgroundColor = .red
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()

    let scrollView: UIScrollView = {
      let scrollView = UIScrollView()
      scrollView.backgroundColor = .white
      scrollView.translatesAutoresizingMaskIntoConstraints = false
      return scrollView
    }()
    var naviBar : UIView!
    var footer: UIView!
    var testButton : UIButton!
    
    var mainButtonBackView : UIView!
    var mainButtonBackView2 : UIView!
    
    var brainButtonBackView : UIView!
    var brainLabel1: UILabel!
    var brainView1: UIView!
    var brainLB1: UILabel!
    var brainSubLB1: UILabel!
    var brainBTN1: UIButton!
    var brainImage: UIImageView!

    var brainLabel2: UILabel!
    var brainView2: UIView!
    var brainLB2: UILabel!
    var brainSubLB2: UILabel!
    var brainBTN2: UIButton!
    var brainImage2: UIImageView!
    
    var brainLabel3: UILabel!
    var brainView3: UIView!
    var brainLB3: UILabel!
    var brainSubLB3: UILabel!
    var brainBTN3: UIButton!
    var brainImage3: UIImageView!

    var brainLabel4: UILabel!
    var brainView4: UIView!
    var brainLB4: UILabel!
    var brainSubLB4: UILabel!
    var brainBTN4: UIButton!
    var brainImage4: UIImageView!
    
    
    var patientView: UIView!
    var patientLB: UILabel!
    
    var BTNImage1: UIImageView!
    var BTNImage2: UIImageView!
    var BTNImage3: UIImageView!
    var BTNImage4: UIImageView!
    var BTNImage5: UIImageView!
    
    var noticeValueLabel : UILabel!
    
    
    let dbHelper = SQLiteClient.shared
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        print("-------db1")
        
        
        dbHelper.createTable()
//        createTable()
        
        print("-------db2")
 
//        insert("엠투컴", "야근중", "2024")
//        insert(0, 0, "test", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
        
        dbHelper.insert(0, 0, "0", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
        
//        insert(7, 17, "m2", 0, 7, 17, 0, 1, 2, 3, 4, 5, 6, 7, 1, 2, 3, 4, 5, 6, 7, 20240522)
        
        
//        print("--insert")
////        update("0", 202405, "1", 0, 1, 7, 10)
//        
//        
//        
//        
        
//
////        readData("select name, gubun1YN, gubun2YN, gubun3YN, gubun4YN, gubun5YN, gubun6YN, gubun7YN, hour, minute, timer1, timer2, alarm, idx from Alarm order by hour asc, minute asc", ["55"])
////        print(readData("select name, gubun1YN, gubun2YN, gubun3YN, gubun4YN, gubun5YN, gubun6YN, gubun7YN, hour, minute, timer1, timer2, alarm, idx from Alarm order by hour asc, minute asc", ["0"]))
//        
////        readData()
//        print(readData())
//        
//        print("--readData")
        
        
        
        
        
        
        
        
        
        navigationController?.navigationBar.isHidden = true
        
        
//        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        self.navigationController?.navigationBar.shadowImage = UIImage()
//        self.navigationController?.navigationBar.isTranslucent = true
        
        
        
        print("\(UIImage(named: "trash"))")
        
        get()
        
        var mySid = UserDefaults.standard.object(forKey: "userSid")
        print("mySid--> \(mySid ?? "")")
        
        
        
        
        self.view.backgroundColor = .yellow
        
        self.view.addSubview(scrollView)
        
        
        self.view.addSubview(sideMenuButton)
        
        sideBTN = UIButton(frame: CGRect(x: self.view.frame.maxX - 75, y: 50, width: 100, height: 100))
        
        sideBTN.setImage(UIImage(systemName: "line.3.horizontal"), for: .normal)
        sideBTN.addTarget(self, action: #selector(presentSideMenu(_ :)), for: .touchUpInside)
        //        self.view.addSubview(sideBTN)
        
        
        
        //        addDimmingView()
        //SIDE MENU
        //        menuView.pinMenuTo(view, with: slideMenuPadding)
        //        scrollView.edgeTo(view)
        //
        //        buttonView = UIView(frame: CGRect(x: 30, y: 140, width: self.view.frame.size.width - 60, height: 100))
        //        buttonView.backgroundColor = #colorLiteral(red: 0.05414709449, green: 0.2448198497, blue: 0.5320709944, alpha: 1)
        //        buttonView.layer.borderWidth = 1
        //        buttonView.layer.cornerRadius = 8
        //        menuView.addSubview(buttonView)
        //
        //        goBrain = UIButton(frame: CGRect(x: 0, y: buttonView.frame.maxY + 30, width: self.view.frame.size.width / 2, height: 70))
        ////        ksbmrButton.frame.size.width *= 0.5
        //        goBrain.backgroundColor = UIColor.clear
        //        goBrain.setTitle("뇌졸중 바로알기", for: .normal)
        //        goBrain.setTitleColor(.black, for: .normal)
        //        goBrain.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        //        goBrain.layer.borderWidth = 1
        //        goBrain.tag = 0
        //        menuView.addSubview(goBrain)
        //        goBrain.addTarget(self, action: #selector(test(_ :)), for: .touchUpInside)
        //
        //        managementbrain = UIButton(frame: CGRect(x: goBrain.frame.maxX, y: buttonView.frame.maxY + 30, width: self.view.frame.size.width / 2, height: 70))
        ////        nonMemberButton.frame.size.width *= 0.5
        ////        nonMemberButton.frame.origin.x = menuView.frame.width - nonMemberButton.frame.width
        //        managementbrain.setTitle("뇌졸중 관리수첩", for: .normal)
        //        managementbrain.setTitleColor(.black, for: .normal)
        //        managementbrain.backgroundColor = #colorLiteral(red: 0.0745619908, green: 0.1568424106, blue: 0.2876431346, alpha: 1)
        //        managementbrain.layer.borderWidth = 1
        //        managementbrain.tag = 1
        //        menuView.addSubview(managementbrain)
        //        managementbrain.addTarget(self, action: #selector(test2(_ :)), for: .touchUpInside)
        //
        //
        //
        //
        //        myTableView = UITableView(frame: CGRect(x: 0, y: goBrain.frame.maxY, width: self.view.frame.width, height: self.view.frame.height - (menuView.frame.maxY)), style: .grouped)
        //        myTableView.register(GoBrainCell.self, forCellReuseIdentifier: "cell")
        //
        ////        myTableView.register(SideTableViewHeaderView.self, forHeaderFooterViewReuseIdentifier: "SideTableViewHeaderView")
        ////        self.myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        //        myTableView.delegate = self
        //        myTableView.dataSource = self
        //        myTableView.showsVerticalScrollIndicator = false
        //        myTableView.separatorStyle = .none
        //        myTableView.bounces = false
        //        myTableView.backgroundColor = .white
        //        myTableView.backgroundView?.backgroundColor = UIColor.clear
        //        menuView.addSubview(myTableView)
        //
        //        myTableView.reloadData()
        //
        //        managementTableView = UITableView(frame: CGRect(x: 0, y: goBrain.frame.maxY, width: self.view.frame.width, height: self.view.frame.height - (menuView.frame.maxY)), style: .grouped)
        //
        //        managementTableView.register(ManagementbrainCell.self, forCellReuseIdentifier: "cell")
        ////        myTableView.register(SideTableViewHeaderView.self, forHeaderFooterViewReuseIdentifier: "SideTableViewHeaderView")
        ////        self.myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        //        managementTableView.delegate = self
        //        managementTableView.dataSource = self
        //        managementTableView.showsVerticalScrollIndicator = false
        //        managementTableView.separatorStyle = .none
        //        managementTableView.bounces = false
        //        managementTableView.backgroundColor = .white
        //        managementTableView.backgroundView?.backgroundColor = UIColor.clear
        //        menuView.addSubview(managementTableView)
        //
        //        managementTableView.reloadData()
        // SIDE MENU
        
        
        scrollView.backgroundColor = #colorLiteral(red: 0.9293832183, green: 0.944276154, blue: 0.9823971391, alpha: 1)
        self.view.backgroundColor = UIColor.white
        
        let statusBar = UIView(frame: CGRect(x: 0, y: 0, width: SCREEN.WIDTH, height: STATUS_BAR_HEIGHT))
        statusBar.backgroundColor = #colorLiteral(red: 0.9293832183, green: 0.944276154, blue: 0.9823971391, alpha: 1)
        
        self.view.addSubview(statusBar)
        
        naviBar = UIView(frame: CGRect(x: 0, y: statusBar.frame.maxY, width: SCREEN.WIDTH, height: 50))
        naviBar.backgroundColor = #colorLiteral(red: 0.9293832183, green: 0.944276154, blue: 0.9823971391, alpha: 1)
        self.view.addSubview(naviBar)
        
        
        
        
        //        lazy var menuBarButton = UIBarButtonItem(image: UIImage(systemName: "sidebar.leading")?.withRenderingMode(.alwaysOriginal), style: .done, target: self, action: #selector(menuBarButtonItemTapped))
        naviBarButton = UIButton(frame: CGRect(x: naviBar.frame.maxX - 55, y: naviBar.frame.size.height / 5, width: 25, height: 25))
        naviBarButton.backgroundColor = #colorLiteral(red: 0.9332811236, green: 0.9482856393, blue: 0.9821911454, alpha: 1)
        naviBarButtonImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
        naviBarButtonImage.image = UIImage(named: "sideMenu")
        naviBarButton.addTarget(self, action: #selector(presentSideMenu), for: .touchUpInside)
        
        naviBar.addSubview(naviBarButton)
        naviBarButton.addSubview(naviBarButtonImage)
        
        
        
        
        
        
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: naviBar.frame.maxY).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        //          scrollView.addSubview(labelOne)
        //
        //          labelOne.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 40).isActive = true
        //          labelOne.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 40).isActive = true
        
        scrollView.addSubview(labelTwo)
        labelTwo.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 40).isActive = true
        labelTwo.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 3000).isActive = true
        labelTwo.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -40).isActive = true
        
        let smart = UILabel(frame: CGRect(x: 20, y: 0, width: self.view.frame.width - 20, height: naviBar.frame.height))
        
        
        
        
        naviBar.addSubview(smart)
        
        smart.text = "SMART STROKE"
        
        smart.font = UIFont(name: "Pretendard-Bold", size: 28)
        smart.textColor = #colorLiteral(red: 0.08110309392, green: 0.2216313183, blue: 0.4961963296, alpha: 1)
        //        smart.font = UIFont(name: NotoSansCJKkr_Medium, size: 2)
        //        smart.font = UIFont.systemFont(ofSize: 40)
        if IS_IPHONE_12PRO_MAX {
            smart.font = UIFont(name: "Pretendard-Bold", size: 36)
            smart.textColor = #colorLiteral(red: 0.08110309392, green: 0.2216313183, blue: 0.4961963296, alpha: 1)
        }
        if IS_IPHONE_15PRO_MAX {
            smart.font = UIFont(name: "Pretendard-Bold", size: 36)
            smart.textColor = #colorLiteral(red: 0.08110309392, green: 0.2216313183, blue: 0.4961963296, alpha: 1)
        }
        if IS_IPHONE_MINI {
            smart.font = UIFont(name: "Pretendard-Bold", size: 29)
            smart.textColor = #colorLiteral(red: 0.08110309392, green: 0.2216313183, blue: 0.4961963296, alpha: 1)
        }
        
        if IS_IPHONE_X {
            smart.font = UIFont(name: "Pretendard-Bold", size: 30)
            smart.textColor = #colorLiteral(red: 0.08110309392, green: 0.2216313183, blue: 0.4961963296, alpha: 1)
        }
        if IS_IPHONE_N_PLUS {
            smart.font = UIFont(name: "Pretendard-Bold", size: 32)
            smart.textColor = #colorLiteral(red: 0.08110309392, green: 0.2216313183, blue: 0.4961963296, alpha: 1)
        }
        if IS_IPHONE_N {
            smart.font = UIFont(name: "Pretendard-Bold", size: 29)
            smart.textColor = #colorLiteral(red: 0.08110309392, green: 0.2216313183, blue: 0.4961963296, alpha: 1)
        }
        if IS_IPHONE_12PRO {
            smart.font = UIFont(name: "Pretendard-Bold", size: 29)
            smart.textColor = #colorLiteral(red: 0.08110309392, green: 0.2216313183, blue: 0.4961963296, alpha: 1)
        }
        if IS_IPHONE_15PRO {
            smart.font = UIFont(name: "Pretendard-Bold", size: 29)
            smart.textColor = #colorLiteral(red: 0.08110309392, green: 0.2216313183, blue: 0.4961963296, alpha: 1)
        }
        
        
        
        
        
        
        
        
        
        
        let hellow = UILabel(frame: CGRect(x: 20, y: 20, width: self.view.frame.width - 20, height: 20))
        scrollView.addSubview(hellow)
        
        hellow.text = "\(UserDefaults.standard.string(forKey: "myId") ?? "") 님! 반갑습니다."
        //        smart.font = UIFont(name: NotoSansCJKkr_Medium, size: 2)
        hellow.font = UIFont(name: "SUITE-Medium", size: 15)
        hellow.backgroundColor = #colorLiteral(red: 0.9293832183, green: 0.944276154, blue: 0.9823971391, alpha: 1)
        hellow.font = UIFont.systemFont(ofSize: 20)
        
        
        if IS_IPHONE_12PRO_MAX {
            mainButtonBackView = UIView(frame: CGRect(x: 0, y: hellow.frame.maxY, width: SCREEN.WIDTH, height: self.view.frame.height))
            mainButtonBackView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            scrollView.addSubview(mainButtonBackView)
            
            mainButtonBackView2 = UIView(frame: mainButtonBackView.frame)
            mainButtonBackView2.frame.origin.y = mainButtonBackView.frame.origin.y
            
            //        mainButtonBackView2.frame.size.width *= 0.9
            mainButtonBackView2.backgroundColor = #colorLiteral(red: 0.9293832183, green: 0.944276154, blue: 0.9823971391, alpha: 1)
            //        mainButtonBackView2.frame.size.width *= 0.75
            //        if IS_NORCH {
            ////            mainButtonBackView2.frame.size.height *= 0.9
            //            mainButtonBackView2.frame.size.height *= 0.95
            //        }else{
            ////            mainButtonBackView2.frame.size.height *= 0.95
            //            mainButtonBackView2.frame.size.height *= 0.9
            //        }
            mainButtonBackView2.center = mainButtonBackView.center
            scrollView.addSubview(mainButtonBackView2)
            
            let buttonWidthGap : CGFloat = 30
            let buttonHeightGap : CGFloat = 0
            let buttonWidth : CGFloat = (mainButtonBackView2.frame.size.width - (buttonWidthGap * 2)) / 2
            let buttonHeight : CGFloat = (mainButtonBackView2.frame.size.height - (buttonHeightGap * 2)) / 4
            
            
            
            let button1 = UIButton(frame: CGRect(x: 23, y: 20, width: 180, height: 180))
            button1.backgroundColor = #colorLiteral(red: 0.3217396438, green: 0.4377208352, blue: 0.9273169637, alpha: 1)
//            button1.layer.borderWidth = 0.3
            button1.layer.cornerRadius = 12
            
            button1.addTarget(self, action: #selector(go(_ :)), for: .touchUpInside)
            
            mainButtonBackView2.addSubview(button1)
            
            
            let btnImg1 = UIImage(named: "menu1")
            let btnImage1 = UIImageView(frame: CGRect(x: 0, y: 42, width: 70, height: 65))
            
            btnImage1.center.x = button1.frame.width / 2
            btnImage1.image = btnImg1
            button1.addSubview(btnImage1)
            
            let btnLabel1 = UILabel(frame: CGRect(x: 0, y: btnImage1.frame.maxY + 14, width: 140, height: 20))
            btnLabel1.text = "뇌졸중 관리"
            btnLabel1.textAlignment = .center
            btnLabel1.textColor = .white
            btnLabel1.center.x = button1.frame.width / 2
            btnLabel1.font = UIFont(name: "SUITE-Medium", size: 18)
            
            button1.addSubview(btnLabel1)
            
            
            let button2 = UIButton(frame: CGRect(x: button1.frame.maxX + 20, y: 20, width: 180, height: 180))
            button2.backgroundColor = #colorLiteral(red: 0.8247565627, green: 0.2676169872, blue: 0.3877614737, alpha: 1)
//            button2.layer.borderWidth = 0.3
            button2.layer.cornerRadius = 12
            button2.addTarget(self, action: #selector(go1(_ :)), for: .touchUpInside)
            
            mainButtonBackView2.addSubview(button2)
            
            let btnImg2 = UIImage(named: "menu2")
            let btnImage2 = UIImageView(frame: CGRect(x: 0, y: 42, width: 70, height: 65))
            
            btnImage2.center.x = button2.frame.width / 2
            btnImage2.image = btnImg2
            button2.addSubview(btnImage2)
            
            let btnLabel2 = UILabel(frame: CGRect(x: 0, y: btnImage2.frame.maxY + 14, width: 140, height: 20))
            btnLabel2.text = "혈압 관리"
            btnLabel2.textAlignment = .center
            btnLabel2.textColor = .white
            btnLabel2.center.x = button2.frame.width / 2
            btnLabel2.font = UIFont(name: "SUITE-Medium", size: 18)
            button2.addSubview(btnLabel2)
            
            
            
            
            let button3 = UIButton(frame: CGRect(x: 23, y: button1.frame.maxY + 20, width: 180, height: 180))
            button3.backgroundColor = #colorLiteral(red: 0.154723078, green: 0.7071833014, blue: 0.9409560561, alpha: 1)
//            button3.layer.borderWidth = 0.3
            button3.layer.cornerRadius = 12
            button3.addTarget(self, action: #selector(go2(_ :)), for: .touchUpInside)
            
            mainButtonBackView2.addSubview(button3)
            
            let btnImg3 = UIImage(named: "menu3")
            let btnImage3 = UIImageView(frame: CGRect(x: 0, y: 42, width: 70, height: 65))
            
            btnImage3.center.x = button3.frame.width / 2
            btnImage3.image = btnImg3
            button3.addSubview(btnImage3)
            
            let btnLabel3 = UILabel(frame: CGRect(x: 0, y: btnImage3.frame.maxY + 14, width: 140, height: 20))
            btnLabel3.text = "당뇨 관리"
            btnLabel3.textAlignment = .center
            btnLabel3.textColor = .white
            btnLabel3.center.x = button3.frame.width / 2
            btnLabel3.font = UIFont(name: "SUITE-Medium", size: 18)
            button3.addSubview(btnLabel3)
            
            
            
            
            let button4 = UIButton(frame: CGRect(x: button1.frame.maxX + 20, y: button1.frame.maxY + 20, width: 180, height: 180))
            button4.backgroundColor = #colorLiteral(red: 0.1993858814, green: 0.2966046333, blue: 0.6639896035, alpha: 1)
//            button4.layer.borderWidth = 0.3
            button4.layer.cornerRadius = 12
            button4.addTarget(self, action: #selector(go3(_ :)), for: .touchUpInside)
            mainButtonBackView2.addSubview(button4)
            
            let btnImg4 = UIImage(named: "menu4")
            let btnImage4 = UIImageView(frame: CGRect(x: 0, y: 42, width: 70, height: 65))
            
            btnImage4.center.x = button4.frame.width / 2
            btnImage4.image = btnImg4
            button4.addSubview(btnImage4)
            
            let btnLabel4 = UILabel(frame: CGRect(x: 0, y: btnImage4.frame.maxY + 14, width: 140, height: 20))
            btnLabel4.text = "이상지질혈증 관리"
            btnLabel4.textAlignment = .center
            btnLabel4.textColor = .white
            btnLabel4.center.x = button4.frame.width / 2
            btnLabel4.font = UIFont(name: "SUITE-Medium", size: 18)
            button4.addSubview(btnLabel4)
            
            
            let button5 = UIButton(frame: CGRect(x: 23, y: button3.frame.maxY + 20, width: 180, height: 180))
            button5.backgroundColor = #colorLiteral(red: 0.1461726725, green: 0.2094348371, blue: 0.4075749516, alpha: 1)
//            button5.layer.borderWidth = 0.3
            button5.layer.cornerRadius = 12
            button5.addTarget(self, action: #selector(go4(_ :)), for: .touchUpInside)
            
            mainButtonBackView2.addSubview(button5)
            
            let btnImg5 = UIImage(named: "menu5")
            let btnImage5 = UIImageView(frame: CGRect(x: 0, y: 42, width: 70, height: 65))
            
            btnImage5.center.x = button5.frame.width / 2
            btnImage5.image = btnImg5
            button5.addSubview(btnImage5)
            
            let btnLabel5 = UILabel(frame: CGRect(x: 0, y: btnImage5.frame.maxY + 14, width: 140, height: 20))
            btnLabel5.text = "비만관리 및 운동"
            btnLabel5.textAlignment = .center
            btnLabel5.textColor = .white
            btnLabel5.center.x = button5.frame.width / 2
            btnLabel5.font = UIFont(name: "SUITE-Medium", size: 18)
            button5.addSubview(btnLabel5)
            
            
            let button6 = UIButton(frame: CGRect(x: button1.frame.maxX + 20, y: button3.frame.maxY + 20, width: 180, height: 180))
            button6.backgroundColor = #colorLiteral(red: 0.002265253104, green: 0.7014663815, blue: 0.6793519258, alpha: 1)
//            button6.layer.borderWidth = 0.3
            button6.layer.cornerRadius = 12
            button6.addTarget(self, action: #selector(go5(_ :)), for: .touchUpInside)
            mainButtonBackView2.addSubview(button6)
            
            let btnImg6 = UIImage(named: "menu6")
            let btnImage6 = UIImageView(frame: CGRect(x: 0, y: 42, width: 70, height: 65))
            
            btnImage6.center.x = button6.frame.width / 2
            btnImage6.image = btnImg6
            button6.addSubview(btnImage6)
            
            let btnLabel6 = UILabel(frame: CGRect(x: 0, y: btnImage6.frame.maxY + 14, width: 140, height: 20))
            btnLabel6.text = "약물복용 관리"
            btnLabel6.textAlignment = .center
            btnLabel6.textColor = .white
            btnLabel6.center.x = button6.frame.width / 2
            btnLabel6.font = UIFont(name: "SUITE-Medium", size: 18)
            button6.addSubview(btnLabel6)
            
            
            
            mainButtonBackView2.frame.size.height = 650
            
//            for i in 0..<6{
//                
//                let buttonX : CGFloat = (buttonWidth + buttonWidthGap) * CGFloat(i % 2)
//                print(">>>\(buttonX)")
//                
//                let buttonY : CGFloat = (buttonHeight + buttonHeightGap) * CGFloat(i / 2)
//                
//                //            let titleString = INFO.MAIN_INFO[i][INFO.KEY.TITLE] ?? ""
//                
//                let button = MainButton(frame: CGRect(
//                    x: buttonX,
//                    y: buttonY,
//                    width: buttonWidth,
//                    height: buttonHeight), imageName: "menu\(i+1)", name: "\(titleName)")
//                
//                button.addTarget(event: .touchUpInside) { (button) in
//                    //                let infoDic = INFO.MAIN_INFO[i]
//                    
//                    //                contentShow(dataDic: infoDic as [String:Any])
//                }
//                
//                mainButtonBackView2.addSubview(button)
//                
//                if i == 0 {
//                    button.iconImageBackView.backgroundColor = #colorLiteral(red: 0.3217396438, green: 0.4377208352, blue: 0.9273169637, alpha: 1)
//                    button.nameLabel.text = "뇌졸중관리"
//                    button.nameLabel.font = UIFont.systemFont(ofSize: 23)
//                    button.addTarget(self, action: #selector(goBrain(_ :)), for: .touchUpInside)
//                    
//                    
//                } else if i == 1 {
//                    button.iconImageBackView.backgroundColor = #colorLiteral(red: 0.8247565627, green: 0.2676169872, blue: 0.3877614737, alpha: 1)
//                    button.nameLabel.text = "혈압관리"
//                    button.nameLabel.font = UIFont.systemFont(ofSize: 23)
//                    button.addTarget(self, action: #selector(goBloodPressure(_ :)), for: .touchUpInside)
//                } else if i == 2 {
//                    button.iconImageBackView.backgroundColor = #colorLiteral(red: 0.154723078, green: 0.7071833014, blue: 0.9409560561, alpha: 1)
//                    button.nameLabel.text = "당뇨관리"
//                    button.nameLabel.font = UIFont.systemFont(ofSize: 23)
//                    button.addTarget(self, action: #selector(goBloodSugar(_ :)), for: .touchUpInside)
//                } else if i == 3 {
//                    button.iconImageBackView.backgroundColor = #colorLiteral(red: 0.1993858814, green: 0.2966046333, blue: 0.6639896035, alpha: 1)
//                    button.nameLabel.text = "이상지질혈증관리"
//                    button.nameLabel.font = UIFont.systemFont(ofSize: 23)
//                    button.addTarget(self, action: #selector(goDyslipidemia(_ :)), for: .touchUpInside)
//                } else if i == 4 {
//                    button.iconImageBackView.backgroundColor = #colorLiteral(red: 0.1461726725, green: 0.2094348371, blue: 0.4075749516, alpha: 1)
//                    button.nameLabel.text = "비만관리및운동"
//                    button.nameLabel.font = UIFont.systemFont(ofSize: 23)
//                    button.addTarget(self, action: #selector(goObesity(_ :)), for: .touchUpInside)
//                } else if i == 5 {
//                    button.iconImageBackView.backgroundColor = #colorLiteral(red: 0.002265253104, green: 0.7014663815, blue: 0.6793519258, alpha: 1)
//                    button.nameLabel.text = "약물복용관리"
//                    button.nameLabel.font = UIFont.systemFont(ofSize: 23)
//                    button.addTarget(self, action: #selector(goMedicationManagement(_ :)), for: .touchUpInside)
//                }
//                
//            }
        }
        
        if IS_IPHONE_15PRO_MAX {
            mainButtonBackView = UIView(frame: CGRect(x: 0, y: hellow.frame.maxY, width: SCREEN.WIDTH, height: self.view.frame.height))
            mainButtonBackView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            scrollView.addSubview(mainButtonBackView)
            
            mainButtonBackView2 = UIView(frame: mainButtonBackView.frame)
            mainButtonBackView2.frame.origin.y = mainButtonBackView.frame.origin.y
            
            //        mainButtonBackView2.frame.size.width *= 0.9
            mainButtonBackView2.backgroundColor = #colorLiteral(red: 0.9293832183, green: 0.944276154, blue: 0.9823971391, alpha: 1)
            //        mainButtonBackView2.frame.size.width *= 0.75
            //        if IS_NORCH {
            ////            mainButtonBackView2.frame.size.height *= 0.9
            //            mainButtonBackView2.frame.size.height *= 0.95
            //        }else{
            ////            mainButtonBackView2.frame.size.height *= 0.95
            //            mainButtonBackView2.frame.size.height *= 0.9
            //        }
            mainButtonBackView2.center = mainButtonBackView.center
            scrollView.addSubview(mainButtonBackView2)
            
            let buttonWidthGap : CGFloat = 30
            let buttonHeightGap : CGFloat = 0
            let buttonWidth : CGFloat = (mainButtonBackView2.frame.size.width - (buttonWidthGap * 2)) / 2
            let buttonHeight : CGFloat = (mainButtonBackView2.frame.size.height - (buttonHeightGap * 2)) / 4
            
            
            
            let button1 = UIButton(frame: CGRect(x: 23, y: 20, width: 180, height: 180))
            button1.backgroundColor = #colorLiteral(red: 0.3217396438, green: 0.4377208352, blue: 0.9273169637, alpha: 1)
//            button1.layer.borderWidth = 0.3
            button1.layer.cornerRadius = 12
            
            button1.addTarget(self, action: #selector(go(_ :)), for: .touchUpInside)
            
            mainButtonBackView2.addSubview(button1)
            
            
            let btnImg1 = UIImage(named: "menu1")
            let btnImage1 = UIImageView(frame: CGRect(x: 0, y: 42, width: 70, height: 65))
            
            btnImage1.center.x = button1.frame.width / 2
            btnImage1.image = btnImg1
            button1.addSubview(btnImage1)
            
            let btnLabel1 = UILabel(frame: CGRect(x: 0, y: btnImage1.frame.maxY + 14, width: 140, height: 20))
            btnLabel1.text = "뇌졸중 관리"
            btnLabel1.textAlignment = .center
            btnLabel1.textColor = .white
            btnLabel1.center.x = button1.frame.width / 2
            btnLabel1.font = UIFont(name: "SUITE-Medium", size: 18)
            button1.addSubview(btnLabel1)
            
            
            let button2 = UIButton(frame: CGRect(x: button1.frame.maxX + 20, y: 20, width: 180, height: 180))
            button2.backgroundColor = #colorLiteral(red: 0.8247565627, green: 0.2676169872, blue: 0.3877614737, alpha: 1)
//            button2.layer.borderWidth = 0.3
            button2.layer.cornerRadius = 12
            button2.addTarget(self, action: #selector(go1(_ :)), for: .touchUpInside)
            
            mainButtonBackView2.addSubview(button2)
            
            let btnImg2 = UIImage(named: "menu2")
            let btnImage2 = UIImageView(frame: CGRect(x: 0, y: 42, width: 70, height: 65))
            
            btnImage2.center.x = button2.frame.width / 2
            btnImage2.image = btnImg2
            button2.addSubview(btnImage2)
            
            let btnLabel2 = UILabel(frame: CGRect(x: 0, y: btnImage2.frame.maxY + 14, width: 140, height: 20))
            btnLabel2.text = "혈압 관리"
            btnLabel2.textAlignment = .center
            btnLabel2.textColor = .white
            btnLabel2.center.x = button2.frame.width / 2
            btnLabel2.font = UIFont(name: "SUITE-Medium", size: 18)
            button2.addSubview(btnLabel2)
            
            
            
            
            let button3 = UIButton(frame: CGRect(x: 23, y: button1.frame.maxY + 20, width: 180, height: 180))
            button3.backgroundColor = #colorLiteral(red: 0.154723078, green: 0.7071833014, blue: 0.9409560561, alpha: 1)
//            button3.layer.borderWidth = 0.3
            button3.layer.cornerRadius = 12
            button3.addTarget(self, action: #selector(go2(_ :)), for: .touchUpInside)
            
            mainButtonBackView2.addSubview(button3)
            
            let btnImg3 = UIImage(named: "menu3")
            let btnImage3 = UIImageView(frame: CGRect(x: 0, y: 42, width: 70, height: 65))
            
            btnImage3.center.x = button3.frame.width / 2
            btnImage3.image = btnImg3
            button3.addSubview(btnImage3)
            
            let btnLabel3 = UILabel(frame: CGRect(x: 0, y: btnImage3.frame.maxY + 14, width: 140, height: 20))
            btnLabel3.text = "당뇨 관리"
            btnLabel3.textAlignment = .center
            btnLabel3.textColor = .white
            btnLabel3.center.x = button3.frame.width / 2
            btnLabel3.font = UIFont(name: "SUITE-Medium", size: 18)
            button3.addSubview(btnLabel3)
            
            
            
            
            let button4 = UIButton(frame: CGRect(x: button1.frame.maxX + 20, y: button1.frame.maxY + 20, width: 180, height: 180))
            button4.backgroundColor = #colorLiteral(red: 0.1993858814, green: 0.2966046333, blue: 0.6639896035, alpha: 1)
//            button4.layer.borderWidth = 0.3
            button4.layer.cornerRadius = 12
            button4.addTarget(self, action: #selector(go3(_ :)), for: .touchUpInside)
            mainButtonBackView2.addSubview(button4)
            
            let btnImg4 = UIImage(named: "menu4")
            let btnImage4 = UIImageView(frame: CGRect(x: 0, y: 42, width: 70, height: 65))
            
            btnImage4.center.x = button4.frame.width / 2
            btnImage4.image = btnImg4
            button4.addSubview(btnImage4)
            
            let btnLabel4 = UILabel(frame: CGRect(x: 0, y: btnImage4.frame.maxY + 14, width: 140, height: 20))
            btnLabel4.text = "이상지질혈증 관리"
            btnLabel4.textAlignment = .center
            btnLabel4.textColor = .white
            btnLabel4.center.x = button4.frame.width / 2
            btnLabel4.font = UIFont(name: "SUITE-Medium", size: 18)
            button4.addSubview(btnLabel4)
            
            
            let button5 = UIButton(frame: CGRect(x: 23, y: button3.frame.maxY + 20, width: 180, height: 180))
            button5.backgroundColor = #colorLiteral(red: 0.1461726725, green: 0.2094348371, blue: 0.4075749516, alpha: 1)
//            button5.layer.borderWidth = 0.3
            button5.layer.cornerRadius = 12
            button5.addTarget(self, action: #selector(go4(_ :)), for: .touchUpInside)
            
            mainButtonBackView2.addSubview(button5)
            
            let btnImg5 = UIImage(named: "menu5")
            let btnImage5 = UIImageView(frame: CGRect(x: 0, y: 42, width: 70, height: 65))
            
            btnImage5.center.x = button5.frame.width / 2
            btnImage5.image = btnImg5
            button5.addSubview(btnImage5)
            
            let btnLabel5 = UILabel(frame: CGRect(x: 0, y: btnImage5.frame.maxY + 14, width: 140, height: 20))
            btnLabel5.text = "비만관리 및 운동"
            btnLabel5.textAlignment = .center
            btnLabel5.textColor = .white
            btnLabel5.center.x = button5.frame.width / 2
            btnLabel5.font = UIFont(name: "SUITE-Medium", size: 18)
            button5.addSubview(btnLabel5)
            
            
            let button6 = UIButton(frame: CGRect(x: button1.frame.maxX + 20, y: button3.frame.maxY + 20, width: 180, height: 180))
            button6.backgroundColor = #colorLiteral(red: 0.002265253104, green: 0.7014663815, blue: 0.6793519258, alpha: 1)
//            button6.layer.borderWidth = 0.3
            button6.layer.cornerRadius = 12
            button6.addTarget(self, action: #selector(go5(_ :)), for: .touchUpInside)
            mainButtonBackView2.addSubview(button6)
            
            let btnImg6 = UIImage(named: "menu6")
            let btnImage6 = UIImageView(frame: CGRect(x: 0, y: 42, width: 70, height: 65))
            
            btnImage6.center.x = button6.frame.width / 2
            btnImage6.image = btnImg6
            button6.addSubview(btnImage6)
            
            let btnLabel6 = UILabel(frame: CGRect(x: 0, y: btnImage6.frame.maxY + 14, width: 140, height: 20))
            btnLabel6.text = "약물복용 관리"
            btnLabel6.textAlignment = .center
            btnLabel6.textColor = .white
            btnLabel6.center.x = button6.frame.width / 2
            btnLabel6.font = UIFont(name: "SUITE-Medium", size: 18)
            button6.addSubview(btnLabel6)
            
            
            
            mainButtonBackView2.frame.size.height = 650
            
//            for i in 0..<6{
//
//                let buttonX : CGFloat = (buttonWidth + buttonWidthGap) * CGFloat(i % 2)
//                print(">>>\(buttonX)")
//
//                let buttonY : CGFloat = (buttonHeight + buttonHeightGap) * CGFloat(i / 2)
//
//                //            let titleString = INFO.MAIN_INFO[i][INFO.KEY.TITLE] ?? ""
//
//                let button = MainButton(frame: CGRect(
//                    x: buttonX,
//                    y: buttonY,
//                    width: buttonWidth,
//                    height: buttonHeight), imageName: "menu\(i+1)", name: "\(titleName)")
//
//                button.addTarget(event: .touchUpInside) { (button) in
//                    //                let infoDic = INFO.MAIN_INFO[i]
//
//                    //                contentShow(dataDic: infoDic as [String:Any])
//                }
//
//                mainButtonBackView2.addSubview(button)
//
//                if i == 0 {
//                    button.iconImageBackView.backgroundColor = #colorLiteral(red: 0.3217396438, green: 0.4377208352, blue: 0.9273169637, alpha: 1)
//                    button.nameLabel.text = "뇌졸중관리"
//                    button.nameLabel.font = UIFont.systemFont(ofSize: 23)
//                    button.addTarget(self, action: #selector(goBrain(_ :)), for: .touchUpInside)
//
//
//                } else if i == 1 {
//                    button.iconImageBackView.backgroundColor = #colorLiteral(red: 0.8247565627, green: 0.2676169872, blue: 0.3877614737, alpha: 1)
//                    button.nameLabel.text = "혈압관리"
//                    button.nameLabel.font = UIFont.systemFont(ofSize: 23)
//                    button.addTarget(self, action: #selector(goBloodPressure(_ :)), for: .touchUpInside)
//                } else if i == 2 {
//                    button.iconImageBackView.backgroundColor = #colorLiteral(red: 0.154723078, green: 0.7071833014, blue: 0.9409560561, alpha: 1)
//                    button.nameLabel.text = "당뇨관리"
//                    button.nameLabel.font = UIFont.systemFont(ofSize: 23)
//                    button.addTarget(self, action: #selector(goBloodSugar(_ :)), for: .touchUpInside)
//                } else if i == 3 {
//                    button.iconImageBackView.backgroundColor = #colorLiteral(red: 0.1993858814, green: 0.2966046333, blue: 0.6639896035, alpha: 1)
//                    button.nameLabel.text = "이상지질혈증관리"
//                    button.nameLabel.font = UIFont.systemFont(ofSize: 23)
//                    button.addTarget(self, action: #selector(goDyslipidemia(_ :)), for: .touchUpInside)
//                } else if i == 4 {
//                    button.iconImageBackView.backgroundColor = #colorLiteral(red: 0.1461726725, green: 0.2094348371, blue: 0.4075749516, alpha: 1)
//                    button.nameLabel.text = "비만관리및운동"
//                    button.nameLabel.font = UIFont.systemFont(ofSize: 23)
//                    button.addTarget(self, action: #selector(goObesity(_ :)), for: .touchUpInside)
//                } else if i == 5 {
//                    button.iconImageBackView.backgroundColor = #colorLiteral(red: 0.002265253104, green: 0.7014663815, blue: 0.6793519258, alpha: 1)
//                    button.nameLabel.text = "약물복용관리"
//                    button.nameLabel.font = UIFont.systemFont(ofSize: 23)
//                    button.addTarget(self, action: #selector(goMedicationManagement(_ :)), for: .touchUpInside)
//                }
//
//            }
        }
        
        
        
        if IS_IPHONE_MINI {
            
            mainButtonBackView = UIView(frame: CGRect(x: 0, y: hellow.frame.maxY + 15, width: SCREEN.WIDTH, height: self.view.frame.height + 40))
            mainButtonBackView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            scrollView.addSubview(mainButtonBackView)
            
            mainButtonBackView2 = UIView(frame: mainButtonBackView.frame)
            mainButtonBackView2.frame.origin.y = mainButtonBackView.frame.origin.y
            
            //        mainButtonBackView2.frame.size.width *= 0.9
            mainButtonBackView2.backgroundColor = #colorLiteral(red: 0.9293832183, green: 0.944276154, blue: 0.9823971391, alpha: 1)
            //        mainButtonBackView2.frame.size.width *= 0.75
            //        if IS_NORCH {
            ////            mainButtonBackView2.frame.size.height *= 0.9
            //            mainButtonBackView2.frame.size.height *= 0.95
            //        }else{
            ////            mainButtonBackView2.frame.size.height *= 0.95
            //            mainButtonBackView2.frame.size.height *= 0.9
            //        }
            mainButtonBackView2.center = mainButtonBackView.center
            scrollView.addSubview(mainButtonBackView2)
            
            let buttonWidthGap : CGFloat = 5
            let buttonHeightGap : CGFloat = 0
            let buttonWidth : CGFloat = (mainButtonBackView2.frame.size.width - (buttonWidthGap * 2)) / 2
            let buttonHeight : CGFloat = (mainButtonBackView2.frame.size.height - (buttonHeightGap * 2)) / 4
            
            let button1 = UIButton(frame: CGRect(x: 23, y: 20, width: 155, height: 155))
            button1.backgroundColor = #colorLiteral(red: 0.3217396438, green: 0.4377208352, blue: 0.9273169637, alpha: 1)
//            button1.layer.borderWidth = 0.3
            button1.layer.cornerRadius = 12
            
            button1.addTarget(self, action: #selector(go(_ :)), for: .touchUpInside)
            
            mainButtonBackView2.addSubview(button1)
            
            
            let btnImg1 = UIImage(named: "menu1")
            let btnImage1 = UIImageView(frame: CGRect(x: 0, y: 36, width: 60, height: 55))
            
            btnImage1.center.x = button1.frame.width / 2
            btnImage1.image = btnImg1
            button1.addSubview(btnImage1)
            
            let btnLabel1 = UILabel(frame: CGRect(x: 0, y: btnImage1.frame.maxY + 14, width: 140, height: 20))
            btnLabel1.text = "뇌졸중 관리"
            btnLabel1.textAlignment = .center
            btnLabel1.textColor = .white
            btnLabel1.center.x = button1.frame.width / 2
            btnLabel1.font = UIFont(name: "SUITE-Medium", size: 18)
            button1.addSubview(btnLabel1)
            
            
            let button2 = UIButton(frame: CGRect(x: button1.frame.maxX + 20, y: 20, width: 155, height: 155))
            button2.backgroundColor = #colorLiteral(red: 0.8247565627, green: 0.2676169872, blue: 0.3877614737, alpha: 1)
//            button2.layer.borderWidth = 0.3
            button2.layer.cornerRadius = 12
            button2.addTarget(self, action: #selector(go1(_ :)), for: .touchUpInside)
            
            mainButtonBackView2.addSubview(button2)
            
            let btnImg2 = UIImage(named: "menu2")
            let btnImage2 = UIImageView(frame: CGRect(x: 0, y: 36, width: 60, height: 55))
            
            btnImage2.center.x = button2.frame.width / 2
            btnImage2.image = btnImg2
            button2.addSubview(btnImage2)
            
            let btnLabel2 = UILabel(frame: CGRect(x: 0, y: btnImage2.frame.maxY + 14, width: 140, height: 20))
            btnLabel2.text = "혈압 관리"
            btnLabel2.textAlignment = .center
            btnLabel2.textColor = .white
            btnLabel2.center.x = button2.frame.width / 2
            btnLabel2.font = UIFont(name: "SUITE-Medium", size: 18)
            button2.addSubview(btnLabel2)
            
            
            
            
            let button3 = UIButton(frame: CGRect(x: 23, y: button1.frame.maxY + 20, width: 155, height: 155))
            button3.backgroundColor = #colorLiteral(red: 0.154723078, green: 0.7071833014, blue: 0.9409560561, alpha: 1)
//            button3.layer.borderWidth = 0.3
            button3.layer.cornerRadius = 12
            button3.addTarget(self, action: #selector(go2(_ :)), for: .touchUpInside)
            
            mainButtonBackView2.addSubview(button3)
            
            let btnImg3 = UIImage(named: "menu3")
            let btnImage3 = UIImageView(frame: CGRect(x: 0, y: 36, width: 60, height: 55))
            
            btnImage3.center.x = button3.frame.width / 2
            btnImage3.image = btnImg3
            button3.addSubview(btnImage3)
            
            let btnLabel3 = UILabel(frame: CGRect(x: 0, y: btnImage3.frame.maxY + 14, width: 140, height: 20))
            btnLabel3.text = "당뇨 관리"
            btnLabel3.textAlignment = .center
            btnLabel3.textColor = .white
            btnLabel3.center.x = button3.frame.width / 2
            btnLabel3.font = UIFont(name: "SUITE-Medium", size: 18)
            button3.addSubview(btnLabel3)
            
            
            
            
            let button4 = UIButton(frame: CGRect(x: button1.frame.maxX + 20, y: button1.frame.maxY + 20, width: 155, height: 155))
            button4.backgroundColor = #colorLiteral(red: 0.1993858814, green: 0.2966046333, blue: 0.6639896035, alpha: 1)
//            button4.layer.borderWidth = 0.3
            button4.layer.cornerRadius = 12
            button4.addTarget(self, action: #selector(go3(_ :)), for: .touchUpInside)
            mainButtonBackView2.addSubview(button4)
            
            let btnImg4 = UIImage(named: "menu4")
            let btnImage4 = UIImageView(frame: CGRect(x: 0, y: 36, width: 60, height: 55))
            
            btnImage4.center.x = button4.frame.width / 2
            btnImage4.image = btnImg4
            button4.addSubview(btnImage4)
            
            let btnLabel4 = UILabel(frame: CGRect(x: 0, y: btnImage4.frame.maxY + 14, width: 140, height: 20))
            btnLabel4.text = "이상지질혈증 관리"
            btnLabel4.textAlignment = .center
            btnLabel4.textColor = .white
            btnLabel4.center.x = button4.frame.width / 2
            btnLabel4.font = UIFont(name: "SUITE-Medium", size: 18)
            button4.addSubview(btnLabel4)
            
            
            let button5 = UIButton(frame: CGRect(x: 23, y: button3.frame.maxY + 20, width: 155, height: 155))
            button5.backgroundColor = #colorLiteral(red: 0.1461726725, green: 0.2094348371, blue: 0.4075749516, alpha: 1)
//            button5.layer.borderWidth = 0.3
            button5.layer.cornerRadius = 12
            button5.addTarget(self, action: #selector(go4(_ :)), for: .touchUpInside)
            
            mainButtonBackView2.addSubview(button5)
            
            let btnImg5 = UIImage(named: "menu5")
            let btnImage5 = UIImageView(frame: CGRect(x: 0, y: 36, width: 60, height: 55))
            
            btnImage5.center.x = button5.frame.width / 2
            btnImage5.image = btnImg5
            button5.addSubview(btnImage5)
            
            let btnLabel5 = UILabel(frame: CGRect(x: 0, y: btnImage5.frame.maxY + 14, width: 140, height: 20))
            btnLabel5.text = "비만관리 및 운동"
            btnLabel5.textAlignment = .center
            btnLabel5.textColor = .white
            btnLabel5.center.x = button5.frame.width / 2
            btnLabel5.font = UIFont(name: "SUITE-Medium", size: 18)
            button5.addSubview(btnLabel5)
            
            
            let button6 = UIButton(frame: CGRect(x: button1.frame.maxX + 20, y: button3.frame.maxY + 20, width: 155, height: 155))
            button6.backgroundColor = #colorLiteral(red: 0.002265253104, green: 0.7014663815, blue: 0.6793519258, alpha: 1)
//            button6.layer.borderWidth = 0.3
            button6.layer.cornerRadius = 12
            button6.addTarget(self, action: #selector(go5(_ :)), for: .touchUpInside)
            mainButtonBackView2.addSubview(button6)
            
            let btnImg6 = UIImage(named: "menu6")
            let btnImage6 = UIImageView(frame: CGRect(x: 0, y: 36, width: 60, height: 55))
            
            btnImage6.center.x = button6.frame.width / 2
            btnImage6.image = btnImg6
            button6.addSubview(btnImage6)
            
            let btnLabel6 = UILabel(frame: CGRect(x: 0, y: btnImage6.frame.maxY + 14, width: 140, height: 20))
            btnLabel6.text = "약물복용 관리"
            btnLabel6.textAlignment = .center
            btnLabel6.textColor = .white
            btnLabel6.center.x = button6.frame.width / 2
            btnLabel6.font = UIFont(name: "SUITE-Medium", size: 18)
            button6.addSubview(btnLabel6)
            
            
            
            mainButtonBackView2.frame.size.height = 690
            
            
//            for i in 0..<6{
//
//                let buttonX : CGFloat = (buttonWidth + buttonWidthGap) * CGFloat(i % 2)
//                print(">>>\(buttonX)")
//
//                let buttonY : CGFloat = (buttonHeight + buttonHeightGap) * CGFloat(i / 2)
//
//                //            let titleString = INFO.MAIN_INFO[i][INFO.KEY.TITLE] ?? ""
//
//                let button = MainButton(frame: CGRect(
//                    x: buttonX + 5,
//                    y: buttonY,
//                    width: buttonWidth,
//                    height: buttonHeight * 1.2), imageName: "menu\(i+1)", name: "\(titleName)")
//
//                //            button.addTarget(event: .touchUpInside) { (button) in
//                ////                let infoDic = INFO.MAIN_INFO[i]
//                //
//                ////                contentShow(dataDic: infoDic as [String:Any])
//                //            }
//
//                mainButtonBackView2.addSubview(button)
//
//                if i == 0 {
//                    button.iconImageBackView.backgroundColor = #colorLiteral(red: 0.3217396438, green: 0.4377208352, blue: 0.9273169637, alpha: 1)
//                    button.nameLabel.text = "뇌졸중관리"
//                    button.addTarget(self, action: #selector(goBrain(_ :)), for: .touchUpInside)
//                    button.nameLabel.font = UIFont(name: "SUITE-Regular", size: 20)
//                } else if i == 1 {
//                    button.iconImageBackView.backgroundColor = #colorLiteral(red: 0.8247565627, green: 0.2676169872, blue: 0.3877614737, alpha: 1)
//                    button.nameLabel.text = "혈압관리"
//                    button.nameLabel.font = UIFont(name: "SUITE-Regular", size: 20)
//                    button.addTarget(self, action: #selector(goBloodPressure(_ :)), for: .touchUpInside)
//                } else if i == 2 {
//                    button.iconImageBackView.backgroundColor = #colorLiteral(red: 0.154723078, green: 0.7071833014, blue: 0.9409560561, alpha: 1)
//                    button.nameLabel.text = "당뇨관리"
//                    button.nameLabel.font = UIFont(name: "SUITE-Regular", size: 20)
//                    button.addTarget(self, action: #selector(goBloodSugar(_ :)), for: .touchUpInside)
//                } else if i == 3 {
//                    button.iconImageBackView.backgroundColor = #colorLiteral(red: 0.1993858814, green: 0.2966046333, blue: 0.6639896035, alpha: 1)
//                    button.nameLabel.text = "이상지질혈증관리"
//                    button.nameLabel.font = UIFont(name: "SUITE-Regular", size: 20)
//                    button.addTarget(self, action: #selector(goDyslipidemia(_ :)), for: .touchUpInside)
//                } else if i == 4 {
//                    button.iconImageBackView.backgroundColor = #colorLiteral(red: 0.1461726725, green: 0.2094348371, blue: 0.4075749516, alpha: 1)
//                    button.nameLabel.text = "비만관리및운동"
//                    button.nameLabel.font = UIFont(name: "SUITE-Regular", size: 20)
//                    button.addTarget(self, action: #selector(goObesity(_ :)), for: .touchUpInside)
//                } else if i == 5 {
//                    button.iconImageBackView.backgroundColor = #colorLiteral(red: 0.002265253104, green: 0.7014663815, blue: 0.6793519258, alpha: 1)
//                    button.nameLabel.text = "약물복용관리"
//                    button.nameLabel.font = UIFont(name: "SUITE-Regular", size: 20)
//                    button.addTarget(self, action: #selector(goMedicationManagement(_ :)), for: .touchUpInside)
//                }
//
//            }
            
        }
        
        if IS_IPHONE_N {
            
            mainButtonBackView = UIView(frame: CGRect(x: 0, y: hellow.frame.maxY + 15, width: SCREEN.WIDTH, height: self.view.frame.height + 40))
            mainButtonBackView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            scrollView.addSubview(mainButtonBackView)
            
            mainButtonBackView2 = UIView(frame: mainButtonBackView.frame)
            mainButtonBackView2.frame.origin.y = mainButtonBackView.frame.origin.y
            
            //        mainButtonBackView2.frame.size.width *= 0.9
            mainButtonBackView2.backgroundColor = #colorLiteral(red: 0.9293832183, green: 0.944276154, blue: 0.9823971391, alpha: 1)
            //        mainButtonBackView2.frame.size.width *= 0.75
            //        if IS_NORCH {
            ////            mainButtonBackView2.frame.size.height *= 0.9
            //            mainButtonBackView2.frame.size.height *= 0.95
            //        }else{
            ////            mainButtonBackView2.frame.size.height *= 0.95
            //            mainButtonBackView2.frame.size.height *= 0.9
            //        }
            mainButtonBackView2.center = mainButtonBackView.center
            scrollView.addSubview(mainButtonBackView2)
            
            let buttonWidthGap : CGFloat = 5
            let buttonHeightGap : CGFloat = 0
            let buttonWidth : CGFloat = (mainButtonBackView2.frame.size.width - (buttonWidthGap * 2)) / 2
            let buttonHeight : CGFloat = (mainButtonBackView2.frame.size.height - (buttonHeightGap * 2)) / 4
            
            let button1 = UIButton(frame: CGRect(x: 23, y: 20, width: 155, height: 155))
            button1.backgroundColor = #colorLiteral(red: 0.3217396438, green: 0.4377208352, blue: 0.9273169637, alpha: 1)
//            button1.layer.borderWidth = 0.3
            button1.layer.cornerRadius = 12
            
            button1.addTarget(self, action: #selector(go(_ :)), for: .touchUpInside)
            
            mainButtonBackView2.addSubview(button1)
            
            
            let btnImg1 = UIImage(named: "menu1")
            let btnImage1 = UIImageView(frame: CGRect(x: 0, y: 36, width: 60, height: 55))
            
            btnImage1.center.x = button1.frame.width / 2
            btnImage1.image = btnImg1
            button1.addSubview(btnImage1)
            
            let btnLabel1 = UILabel(frame: CGRect(x: 0, y: btnImage1.frame.maxY + 14, width: 140, height: 20))
            btnLabel1.text = "뇌졸중 관리"
            btnLabel1.textAlignment = .center
            btnLabel1.textColor = .white
            btnLabel1.center.x = button1.frame.width / 2
            btnLabel1.font = UIFont(name: "SUITE-Medium", size: 18)
            button1.addSubview(btnLabel1)
            
            
            let button2 = UIButton(frame: CGRect(x: button1.frame.maxX + 20, y: 20, width: 155, height: 155))
            button2.backgroundColor = #colorLiteral(red: 0.8247565627, green: 0.2676169872, blue: 0.3877614737, alpha: 1)
//            button2.layer.borderWidth = 0.3
            button2.layer.cornerRadius = 12
            button2.addTarget(self, action: #selector(go1(_ :)), for: .touchUpInside)
            
            mainButtonBackView2.addSubview(button2)
            
            let btnImg2 = UIImage(named: "menu2")
            let btnImage2 = UIImageView(frame: CGRect(x: 0, y: 36, width: 60, height: 55))
            
            btnImage2.center.x = button2.frame.width / 2
            btnImage2.image = btnImg2
            button2.addSubview(btnImage2)
            
            let btnLabel2 = UILabel(frame: CGRect(x: 0, y: btnImage2.frame.maxY + 14, width: 140, height: 20))
            btnLabel2.text = "혈압 관리"
            btnLabel2.textAlignment = .center
            btnLabel2.textColor = .white
            btnLabel2.center.x = button2.frame.width / 2
            btnLabel2.font = UIFont(name: "SUITE-Medium", size: 18)
            button2.addSubview(btnLabel2)
            
            
            
            
            let button3 = UIButton(frame: CGRect(x: 23, y: button1.frame.maxY + 20, width: 155, height: 155))
            button3.backgroundColor = #colorLiteral(red: 0.154723078, green: 0.7071833014, blue: 0.9409560561, alpha: 1)
//            button3.layer.borderWidth = 0.3
            button3.layer.cornerRadius = 12
            button3.addTarget(self, action: #selector(go2(_ :)), for: .touchUpInside)
            
            mainButtonBackView2.addSubview(button3)
            
            let btnImg3 = UIImage(named: "menu3")
            let btnImage3 = UIImageView(frame: CGRect(x: 0, y: 36, width: 60, height: 55))
            
            btnImage3.center.x = button3.frame.width / 2
            btnImage3.image = btnImg3
            button3.addSubview(btnImage3)
            
            let btnLabel3 = UILabel(frame: CGRect(x: 0, y: btnImage3.frame.maxY + 14, width: 140, height: 20))
            btnLabel3.text = "당뇨 관리"
            btnLabel3.textAlignment = .center
            btnLabel3.textColor = .white
            btnLabel3.center.x = button3.frame.width / 2
            btnLabel3.font = UIFont(name: "SUITE-Medium", size: 18)
            button3.addSubview(btnLabel3)
            
            
            
            
            let button4 = UIButton(frame: CGRect(x: button1.frame.maxX + 20, y: button1.frame.maxY + 20, width: 155, height: 155))
            button4.backgroundColor = #colorLiteral(red: 0.1993858814, green: 0.2966046333, blue: 0.6639896035, alpha: 1)
//            button4.layer.borderWidth = 0.3
            button4.layer.cornerRadius = 12
            button4.addTarget(self, action: #selector(go3(_ :)), for: .touchUpInside)
            mainButtonBackView2.addSubview(button4)
            
            let btnImg4 = UIImage(named: "menu4")
            let btnImage4 = UIImageView(frame: CGRect(x: 0, y: 36, width: 60, height: 55))
            
            btnImage4.center.x = button4.frame.width / 2
            btnImage4.image = btnImg4
            button4.addSubview(btnImage4)
            
            let btnLabel4 = UILabel(frame: CGRect(x: 0, y: btnImage4.frame.maxY + 14, width: 140, height: 20))
            btnLabel4.text = "이상지질혈증 관리"
            btnLabel4.textAlignment = .center
            btnLabel4.textColor = .white
            btnLabel4.center.x = button4.frame.width / 2
            btnLabel4.font = UIFont(name: "SUITE-Medium", size: 18)
            button4.addSubview(btnLabel4)
            
            
            let button5 = UIButton(frame: CGRect(x: 23, y: button3.frame.maxY + 20, width: 155, height: 155))
            button5.backgroundColor = #colorLiteral(red: 0.1461726725, green: 0.2094348371, blue: 0.4075749516, alpha: 1)
//            button5.layer.borderWidth = 0.3
            button5.layer.cornerRadius = 12
            button5.addTarget(self, action: #selector(go4(_ :)), for: .touchUpInside)
            
            mainButtonBackView2.addSubview(button5)
            
            let btnImg5 = UIImage(named: "menu5")
            let btnImage5 = UIImageView(frame: CGRect(x: 0, y: 36, width: 60, height: 55))
            
            btnImage5.center.x = button5.frame.width / 2
            btnImage5.image = btnImg5
            button5.addSubview(btnImage5)
            
            let btnLabel5 = UILabel(frame: CGRect(x: 0, y: btnImage5.frame.maxY + 14, width: 140, height: 20))
            btnLabel5.text = "비만관리 및 운동"
            btnLabel5.textAlignment = .center
            btnLabel5.textColor = .white
            btnLabel5.center.x = button5.frame.width / 2
            btnLabel5.font = UIFont(name: "SUITE-Medium", size: 18)
            button5.addSubview(btnLabel5)
            
            
            let button6 = UIButton(frame: CGRect(x: button1.frame.maxX + 20, y: button3.frame.maxY + 20, width: 155, height: 155))
            button6.backgroundColor = #colorLiteral(red: 0.002265253104, green: 0.7014663815, blue: 0.6793519258, alpha: 1)
//            button6.layer.borderWidth = 0.3
            button6.layer.cornerRadius = 12
            button6.addTarget(self, action: #selector(go5(_ :)), for: .touchUpInside)
            mainButtonBackView2.addSubview(button6)
            
            let btnImg6 = UIImage(named: "menu6")
            let btnImage6 = UIImageView(frame: CGRect(x: 0, y: 36, width: 60, height: 55))
            
            btnImage6.center.x = button6.frame.width / 2
            btnImage6.image = btnImg6
            button6.addSubview(btnImage6)
            
            let btnLabel6 = UILabel(frame: CGRect(x: 0, y: btnImage6.frame.maxY + 14, width: 140, height: 20))
            btnLabel6.text = "약물복용 관리"
            btnLabel6.textAlignment = .center
            btnLabel6.textColor = .white
            btnLabel6.center.x = button6.frame.width / 2
            btnLabel6.font = UIFont(name: "SUITE-Medium", size: 18)
            button6.addSubview(btnLabel6)
            
            
            
            mainButtonBackView2.frame.size.height = 690
            
            
//            for i in 0..<6{
//                
//                let buttonX : CGFloat = (buttonWidth + buttonWidthGap) * CGFloat(i % 2)
//                print(">>>\(buttonX)")
//                
//                let buttonY : CGFloat = (buttonHeight + buttonHeightGap) * CGFloat(i / 2)
//                
//                //            let titleString = INFO.MAIN_INFO[i][INFO.KEY.TITLE] ?? ""
//                
//                let button = MainButton(frame: CGRect(
//                    x: buttonX + 5,
//                    y: buttonY,
//                    width: buttonWidth,
//                    height: buttonHeight * 1.2), imageName: "menu\(i+1)", name: "\(titleName)")
//                
//                //            button.addTarget(event: .touchUpInside) { (button) in
//                ////                let infoDic = INFO.MAIN_INFO[i]
//                //
//                ////                contentShow(dataDic: infoDic as [String:Any])
//                //            }
//                
//                mainButtonBackView2.addSubview(button)
//                
//                if i == 0 {
//                    button.iconImageBackView.backgroundColor = #colorLiteral(red: 0.3217396438, green: 0.4377208352, blue: 0.9273169637, alpha: 1)
//                    button.nameLabel.text = "뇌졸중관리"
//                    button.addTarget(self, action: #selector(goBrain(_ :)), for: .touchUpInside)
//                    button.nameLabel.font = UIFont(name: "SUITE-Regular", size: 20)
//                } else if i == 1 {
//                    button.iconImageBackView.backgroundColor = #colorLiteral(red: 0.8247565627, green: 0.2676169872, blue: 0.3877614737, alpha: 1)
//                    button.nameLabel.text = "혈압관리"
//                    button.nameLabel.font = UIFont(name: "SUITE-Regular", size: 20)
//                    button.addTarget(self, action: #selector(goBloodPressure(_ :)), for: .touchUpInside)
//                } else if i == 2 {
//                    button.iconImageBackView.backgroundColor = #colorLiteral(red: 0.154723078, green: 0.7071833014, blue: 0.9409560561, alpha: 1)
//                    button.nameLabel.text = "당뇨관리"
//                    button.nameLabel.font = UIFont(name: "SUITE-Regular", size: 20)
//                    button.addTarget(self, action: #selector(goBloodSugar(_ :)), for: .touchUpInside)
//                } else if i == 3 {
//                    button.iconImageBackView.backgroundColor = #colorLiteral(red: 0.1993858814, green: 0.2966046333, blue: 0.6639896035, alpha: 1)
//                    button.nameLabel.text = "이상지질혈증관리"
//                    button.nameLabel.font = UIFont(name: "SUITE-Regular", size: 20)
//                    button.addTarget(self, action: #selector(goDyslipidemia(_ :)), for: .touchUpInside)
//                } else if i == 4 {
//                    button.iconImageBackView.backgroundColor = #colorLiteral(red: 0.1461726725, green: 0.2094348371, blue: 0.4075749516, alpha: 1)
//                    button.nameLabel.text = "비만관리및운동"
//                    button.nameLabel.font = UIFont(name: "SUITE-Regular", size: 20)
//                    button.addTarget(self, action: #selector(goObesity(_ :)), for: .touchUpInside)
//                } else if i == 5 {
//                    button.iconImageBackView.backgroundColor = #colorLiteral(red: 0.002265253104, green: 0.7014663815, blue: 0.6793519258, alpha: 1)
//                    button.nameLabel.text = "약물복용관리"
//                    button.nameLabel.font = UIFont(name: "SUITE-Regular", size: 20)
//                    button.addTarget(self, action: #selector(goMedicationManagement(_ :)), for: .touchUpInside)
//                }
//                
//            }
            
        }
        
        if IS_IPHONE_N_PLUS {
            
            mainButtonBackView = UIView(frame: CGRect(x: 0, y: hellow.frame.maxY, width: SCREEN.WIDTH, height: self.view.frame.height + 20))
            mainButtonBackView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            scrollView.addSubview(mainButtonBackView)
            
            mainButtonBackView2 = UIView(frame: mainButtonBackView.frame)
            mainButtonBackView2.frame.origin.y = mainButtonBackView.frame.origin.y
            
            //        mainButtonBackView2.frame.size.width *= 0.9
            mainButtonBackView2.backgroundColor = #colorLiteral(red: 0.9293832183, green: 0.944276154, blue: 0.9823971391, alpha: 1)
            //        mainButtonBackView2.frame.size.width *= 0.75
            //        if IS_NORCH {
            //                mainButtonBackView2.frame.size.height *= 0.9
            //                mainButtonBackView2.frame.size.height *= 0.95
            //        }else{
            ////            mainButtonBackView2.frame.size.height *= 0.95
            //            mainButtonBackView2.frame.size.height *= 0.9
            //        }
            mainButtonBackView2.center = mainButtonBackView.center
            scrollView.addSubview(mainButtonBackView2)
            
            let buttonWidthGap : CGFloat = 5
            let buttonHeightGap : CGFloat = 30
            let buttonWidth : CGFloat = (mainButtonBackView2.frame.size.width - (buttonWidthGap * 2)) / 2
            let buttonHeight : CGFloat = (mainButtonBackView2.frame.size.height - (buttonHeightGap * 2)) / 3.6
            
//            for i in 0..<6{
//                
//                let buttonX : CGFloat = (buttonWidth + buttonWidthGap) * CGFloat(i % 2)
//                print(">>>\(buttonX)")
//                
//                let buttonY : CGFloat = (buttonHeight + buttonHeightGap) * CGFloat(i / 2)
//                
//                //            let titleString = INFO.MAIN_INFO[i][INFO.KEY.TITLE] ?? ""
//                
//                let button = MainButton(frame: CGRect(
//                    x: buttonX - 3,
//                    y: buttonY,
//                    width: buttonWidth * 1.15,
//                    height: buttonHeight), imageName: "menu\(i+1)", name: "\(titleName)")
//                
//                //            button.addTarget(event: .touchUpInside) { (button) in
//                ////                let infoDic = INFO.MAIN_INFO[i]
//                //
//                ////                contentShow(dataDic: infoDic as [String:Any])
//                //            }
//                
//                mainButtonBackView2.addSubview(button)
//                
//                if i == 0 {
//                    button.iconImageBackView.backgroundColor = #colorLiteral(red: 0.3217396438, green: 0.4377208352, blue: 0.9273169637, alpha: 1)
//                    button.nameLabel.text = "뇌졸중관리"
//                    //                    button.nameLabel.font = UIFont.systemFont(ofSize: 22)
//                    button.nameLabel.font = UIFont(name: "SUITE-Regular", size: 22)
//                    button.addTarget(self, action: #selector(goBrain(_ :)), for: .touchUpInside)
//                } else if i == 1 {
//                    button.iconImageBackView.backgroundColor = #colorLiteral(red: 0.8247565627, green: 0.2676169872, blue: 0.3877614737, alpha: 1)
//                    //                    button.nameLabel.font = UIFont.systemFont(ofSize: 22)
//                    button.nameLabel.font = UIFont(name: "SUITE-Regular", size: 22)
//                    button.addTarget(self, action: #selector(goBloodPressure(_ :)), for: .touchUpInside)
//                    button.nameLabel.text = "혈압관리"
//                } else if i == 2 {
//                    button.iconImageBackView.backgroundColor = #colorLiteral(red: 0.154723078, green: 0.7071833014, blue: 0.9409560561, alpha: 1)
//                    //                    button.nameLabel.font = UIFont.systemFont(ofSize: 22)
//                    button.nameLabel.font = UIFont(name: "SUITE-Regular", size: 22)
//                    button.nameLabel.text = "당뇨관리"
//                    button.addTarget(self, action: #selector(goBloodSugar(_ :)), for: .touchUpInside)
//                } else if i == 3 {
//                    button.iconImageBackView.backgroundColor = #colorLiteral(red: 0.1993858814, green: 0.2966046333, blue: 0.6639896035, alpha: 1)
//                    //                    button.nameLabel.font = UIFont.systemFont(ofSize: 22)
//                    button.nameLabel.font = UIFont(name: "SUITE-Regular", size: 22)
//                    button.nameLabel.text = "이상지질혈증관리"
//                    button.addTarget(self, action: #selector(goDyslipidemia(_ :)), for: .touchUpInside)
//                } else if i == 4 {
//                    button.iconImageBackView.backgroundColor = #colorLiteral(red: 0.1461726725, green: 0.2094348371, blue: 0.4075749516, alpha: 1)
//                    //                    button.nameLabel.font = UIFont.systemFont(ofSize: 22)
//                    button.nameLabel.font = UIFont(name: "SUITE-Regular", size: 22)
//                    button.nameLabel.text = "비만관리및운동"
//                    button.addTarget(self, action: #selector(goObesity(_ :)), for: .touchUpInside)
//                } else if i == 5 {
//                    button.iconImageBackView.backgroundColor = #colorLiteral(red: 0.002265253104, green: 0.7014663815, blue: 0.6793519258, alpha: 1)
//                    //                    button.nameLabel.font = UIFont.systemFont(ofSize: 22)
//                    button.nameLabel.font = UIFont(name: "SUITE-Regular", size: 22)
//                    button.nameLabel.text = "약물복용관리"
//                    button.addTarget(self, action: #selector(goMedicationManagement(_ :)), for: .touchUpInside)
//                }
//                
//            }
            
            let button1 = UIButton(frame: CGRect(x: 25, y: 20, width: 170, height: 170))
            button1.backgroundColor = #colorLiteral(red: 0.3217396438, green: 0.4377208352, blue: 0.9273169637, alpha: 1)
//            button1.layer.borderWidth = 0.3
            button1.layer.cornerRadius = 12
            
            button1.addTarget(self, action: #selector(go(_ :)), for: .touchUpInside)
            
            mainButtonBackView2.addSubview(button1)
            
            
            let btnImg1 = UIImage(named: "menu1")
            let btnImage1 = UIImageView(frame: CGRect(x: 0, y: 36, width: 65, height: 60))
            
            btnImage1.center.x = button1.frame.width / 2
            btnImage1.image = btnImg1
            button1.addSubview(btnImage1)
            
            let btnLabel1 = UILabel(frame: CGRect(x: 0, y: btnImage1.frame.maxY + 14, width: 140, height: 20))
            btnLabel1.text = "뇌졸중 관리"
            btnLabel1.textAlignment = .center
            btnLabel1.textColor = .white
            btnLabel1.center.x = button1.frame.width / 2
            btnLabel1.font = UIFont(name: "SUITE-Medium", size: 18)
            button1.addSubview(btnLabel1)
            
            
            let button2 = UIButton(frame: CGRect(x: button1.frame.maxX + 20, y: 20, width: 170, height: 170))
            button2.backgroundColor = #colorLiteral(red: 0.8247565627, green: 0.2676169872, blue: 0.3877614737, alpha: 1)
//            button2.layer.borderWidth = 0.3
            button2.layer.cornerRadius = 12
            button2.addTarget(self, action: #selector(go1(_ :)), for: .touchUpInside)
            
            mainButtonBackView2.addSubview(button2)
            
            let btnImg2 = UIImage(named: "menu2")
            let btnImage2 = UIImageView(frame: CGRect(x: 0, y: 36, width: 65, height: 60))
            
            btnImage2.center.x = button2.frame.width / 2
            btnImage2.image = btnImg2
            button2.addSubview(btnImage2)
            
            let btnLabel2 = UILabel(frame: CGRect(x: 0, y: btnImage2.frame.maxY + 14, width: 140, height: 20))
            btnLabel2.text = "혈압 관리"
            btnLabel2.textAlignment = .center
            btnLabel2.textColor = .white
            btnLabel2.center.x = button2.frame.width / 2
            btnLabel2.font = UIFont(name: "SUITE-Medium", size: 18)
            button2.addSubview(btnLabel2)
            
            
            
            
            let button3 = UIButton(frame: CGRect(x: 25, y: button1.frame.maxY + 20, width: 170, height: 170))
            button3.backgroundColor = #colorLiteral(red: 0.154723078, green: 0.7071833014, blue: 0.9409560561, alpha: 1)
//            button3.layer.borderWidth = 0.3
            button3.layer.cornerRadius = 12
            button3.addTarget(self, action: #selector(go2(_ :)), for: .touchUpInside)
            
            mainButtonBackView2.addSubview(button3)
            
            let btnImg3 = UIImage(named: "menu3")
            let btnImage3 = UIImageView(frame: CGRect(x: 0, y: 36, width: 65, height: 60))
            
            btnImage3.center.x = button3.frame.width / 2
            btnImage3.image = btnImg3
            button3.addSubview(btnImage3)
            
            let btnLabel3 = UILabel(frame: CGRect(x: 0, y: btnImage3.frame.maxY + 14, width: 140, height: 20))
            btnLabel3.text = "당뇨 관리"
            btnLabel3.textAlignment = .center
            btnLabel3.textColor = .white
            btnLabel3.center.x = button3.frame.width / 2
            btnLabel3.font = UIFont(name: "SUITE-Medium", size: 18)
            button3.addSubview(btnLabel3)
            
            
            
            
            let button4 = UIButton(frame: CGRect(x: button1.frame.maxX + 20, y: button1.frame.maxY + 20, width: 170, height: 170))
            button4.backgroundColor = #colorLiteral(red: 0.1993858814, green: 0.2966046333, blue: 0.6639896035, alpha: 1)
//            button4.layer.borderWidth = 0.3
            button4.layer.cornerRadius = 12
            button4.addTarget(self, action: #selector(go3(_ :)), for: .touchUpInside)
            mainButtonBackView2.addSubview(button4)
            
            let btnImg4 = UIImage(named: "menu4")
            let btnImage4 = UIImageView(frame: CGRect(x: 0, y: 36, width: 65, height: 60))
            
            btnImage4.center.x = button4.frame.width / 2
            btnImage4.image = btnImg4
            button4.addSubview(btnImage4)
            
            let btnLabel4 = UILabel(frame: CGRect(x: 0, y: btnImage4.frame.maxY + 14, width: 140, height: 20))
            btnLabel4.text = "이상지질혈증 관리"
            btnLabel4.textAlignment = .center
            btnLabel4.textColor = .white
            btnLabel4.center.x = button4.frame.width / 2
            btnLabel4.font = UIFont(name: "SUITE-Medium", size: 18)
            button4.addSubview(btnLabel4)
            
            
            let button5 = UIButton(frame: CGRect(x: 25, y: button3.frame.maxY + 20, width: 170, height: 170))
            button5.backgroundColor = #colorLiteral(red: 0.1461726725, green: 0.2094348371, blue: 0.4075749516, alpha: 1)
//            button5.layer.borderWidth = 0.3
            button5.layer.cornerRadius = 12
            button5.addTarget(self, action: #selector(go4(_ :)), for: .touchUpInside)
            
            mainButtonBackView2.addSubview(button5)
            
            let btnImg5 = UIImage(named: "menu5")
            let btnImage5 = UIImageView(frame: CGRect(x: 0, y: 36, width: 65, height: 60))
            
            btnImage5.center.x = button5.frame.width / 2
            btnImage5.image = btnImg5
            button5.addSubview(btnImage5)
            
            let btnLabel5 = UILabel(frame: CGRect(x: 0, y: btnImage5.frame.maxY + 14, width: 140, height: 20))
            btnLabel5.text = "비만관리 및 운동"
            btnLabel5.textAlignment = .center
            btnLabel5.textColor = .white
            btnLabel5.center.x = button5.frame.width / 2
            btnLabel5.font = UIFont(name: "SUITE-Medium", size: 18)
            button5.addSubview(btnLabel5)
            
            
            let button6 = UIButton(frame: CGRect(x: button1.frame.maxX + 20, y: button3.frame.maxY + 20, width: 170, height: 170))
            button6.backgroundColor = #colorLiteral(red: 0.002265253104, green: 0.7014663815, blue: 0.6793519258, alpha: 1)
//            button6.layer.borderWidth = 0.3
            button6.layer.cornerRadius = 12
            button6.addTarget(self, action: #selector(go5(_ :)), for: .touchUpInside)
            mainButtonBackView2.addSubview(button6)
            
            let btnImg6 = UIImage(named: "menu6")
            let btnImage6 = UIImageView(frame: CGRect(x: 0, y: 36, width: 65, height: 60))
            
            btnImage6.center.x = button6.frame.width / 2
            btnImage6.image = btnImg6
            button6.addSubview(btnImage6)
            
            let btnLabel6 = UILabel(frame: CGRect(x: 0, y: btnImage6.frame.maxY + 14, width: 140, height: 20))
            btnLabel6.text = "약물복용 관리"
            btnLabel6.textAlignment = .center
            btnLabel6.textColor = .white
            btnLabel6.center.x = button6.frame.width / 2
            btnLabel6.font = UIFont(name: "SUITE-Medium", size: 18)
            button6.addSubview(btnLabel6)
            
            
            
            mainButtonBackView2.frame.size.height = 690
            
        }
        
//        if IS_IPHONE_X {
//            mainButtonBackView = UIView(frame: CGRect(x: 0, y: hellow.frame.maxY, width: SCREEN.WIDTH, height: self.view.frame.height))
//            mainButtonBackView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
//            scrollView.addSubview(mainButtonBackView)
//            
//            mainButtonBackView2 = UIView(frame: mainButtonBackView.frame)
//            mainButtonBackView2.frame.origin.y = mainButtonBackView.frame.origin.y
//            
//            //        mainButtonBackView2.frame.size.width *= 0.9
//            mainButtonBackView2.backgroundColor = #colorLiteral(red: 0.9293832183, green: 0.944276154, blue: 0.9823971391, alpha: 1)
//            //        mainButtonBackView2.frame.size.width *= 0.75
//            //        if IS_NORCH {
//            ////            mainButtonBackView2.frame.size.height *= 0.9
//            //            mainButtonBackView2.frame.size.height *= 0.95
//            //        }else{
//            ////            mainButtonBackView2.frame.size.height *= 0.95
//            //            mainButtonBackView2.frame.size.height *= 0.9
//            //        }
//            mainButtonBackView2.center = mainButtonBackView.center
//            scrollView.addSubview(mainButtonBackView2)
//            
//            let buttonWidthGap : CGFloat = 30
//            let buttonHeightGap : CGFloat = 0
//            let buttonWidth : CGFloat = (mainButtonBackView2.frame.size.width - (buttonWidthGap * 2)) / 2
//            let buttonHeight : CGFloat = (mainButtonBackView2.frame.size.height - (buttonHeightGap * 2)) / 4
//            
//            for i in 0..<6{
//                
//                let buttonX : CGFloat = (buttonWidth + buttonWidthGap) * CGFloat(i % 2)
//                print(">>>\(buttonX)")
//                
//                let buttonY : CGFloat = (buttonHeight + buttonHeightGap) * CGFloat(i / 2)
//                
//                //            let titleString = INFO.MAIN_INFO[i][INFO.KEY.TITLE] ?? ""
//                
//                let button = MainButton(frame: CGRect(
//                    x: buttonX - 3,
//                    y: buttonY,
//                    width: buttonWidth * 1.3,
//                    height: buttonHeight * 1.1), imageName: "menu\(i+1)", name: "\(titleName)")
//                
//                button.addTarget(event: .touchUpInside) { (button) in
//                    //                let infoDic = INFO.MAIN_INFO[i]
//                    
//                    //                contentShow(dataDic: infoDic as [String:Any])
//                }
//                
//                mainButtonBackView2.addSubview(button)
//                
//                if i == 0 {
//                    button.iconImageBackView.backgroundColor = #colorLiteral(red: 0.3217396438, green: 0.4377208352, blue: 0.9273169637, alpha: 1)
//                    button.nameLabel.text = "뇌졸중관리"
//                    button.nameLabel.font = UIFont(name: "SUITE-Regular", size: 22)
//                    button.addTarget(self, action: #selector(goBrain(_ :)), for: .touchUpInside)
//                } else if i == 1 {
//                    button.iconImageBackView.backgroundColor = #colorLiteral(red: 0.8247565627, green: 0.2676169872, blue: 0.3877614737, alpha: 1)
//                    button.nameLabel.text = "혈압관리"
//                    button.nameLabel.font = UIFont(name: "SUITE-Regular", size: 22)
//                    button.addTarget(self, action: #selector(goBloodPressure(_ :)), for: .touchUpInside)
//                } else if i == 2 {
//                    button.iconImageBackView.backgroundColor = #colorLiteral(red: 0.154723078, green: 0.7071833014, blue: 0.9409560561, alpha: 1)
//                    button.nameLabel.text = "당뇨관리"
//                    button.nameLabel.font = UIFont(name: "SUITE-Regular", size: 22)
//                    button.addTarget(self, action: #selector(goBloodSugar(_ :)), for: .touchUpInside)
//                } else if i == 3 {
//                    button.iconImageBackView.backgroundColor = #colorLiteral(red: 0.1993858814, green: 0.2966046333, blue: 0.6639896035, alpha: 1)
//                    button.nameLabel.text = "이상지질혈증관리"
//                    button.nameLabel.font = UIFont(name: "SUITE-Regular", size: 22)
//                    button.addTarget(self, action: #selector(goDyslipidemia(_ :)), for: .touchUpInside)
//                } else if i == 4 {
//                    button.iconImageBackView.backgroundColor = #colorLiteral(red: 0.1461726725, green: 0.2094348371, blue: 0.4075749516, alpha: 1)
//                    button.nameLabel.text = "비만관리및운동"
//                    button.nameLabel.font = UIFont(name: "SUITE-Regular", size: 22)
//                    button.addTarget(self, action: #selector(goObesity(_ :)), for: .touchUpInside)
//                } else if i == 5 {
//                    button.iconImageBackView.backgroundColor = #colorLiteral(red: 0.002265253104, green: 0.7014663815, blue: 0.6793519258, alpha: 1)
//                    button.nameLabel.text = "약물복용관리"
//                    button.nameLabel.font = UIFont(name: "SUITE-Regular", size: 22)
//                    button.addTarget(self, action: #selector(goMedicationManagement(_ :)), for: .touchUpInside)
//                }
//                
//            }
//        }
        
        if IS_IPHONE_12PRO {
            mainButtonBackView = UIView(frame: CGRect(x: 0, y: hellow.frame.maxY, width: SCREEN.WIDTH, height: self.view.frame.height))
            mainButtonBackView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            scrollView.addSubview(mainButtonBackView)
            
            mainButtonBackView2 = UIView(frame: mainButtonBackView.frame)
            mainButtonBackView2.frame.origin.y = mainButtonBackView.frame.origin.y
            
            //        mainButtonBackView2.frame.size.width *= 0.9
            mainButtonBackView2.backgroundColor = #colorLiteral(red: 0.9293832183, green: 0.944276154, blue: 0.9823971391, alpha: 1)
            //        mainButtonBackView2.frame.size.width *= 0.75
            //        if IS_NORCH {
            ////            mainButtonBackView2.frame.size.height *= 0.9
            //            mainButtonBackView2.frame.size.height *= 0.95
            //        }else{
            ////            mainButtonBackView2.frame.size.height *= 0.95
            //            mainButtonBackView2.frame.size.height *= 0.9
            //        }
            mainButtonBackView2.center = mainButtonBackView.center
            scrollView.addSubview(mainButtonBackView2)
            
            let buttonWidthGap : CGFloat = 0
            let buttonHeightGap : CGFloat = 0
            let buttonWidth : CGFloat = (mainButtonBackView2.frame.size.width - (buttonWidthGap * 2)) / 2
            let buttonHeight : CGFloat = (mainButtonBackView2.frame.size.height - (buttonHeightGap * 2)) / 4
            
            let button1 = UIButton(frame: CGRect(x: 23, y: 20, width: 160, height: 160))
            button1.backgroundColor = #colorLiteral(red: 0.3217396438, green: 0.4377208352, blue: 0.9273169637, alpha: 1)
//            button1.layer.borderWidth = 0.3
            button1.layer.cornerRadius = 12
            
            button1.addTarget(self, action: #selector(go(_ :)), for: .touchUpInside)
            mainButtonBackView2.addSubview(button1)
            
            
            let btnImg1 = UIImage(named: "menu1")
            let btnImage1 = UIImageView(frame: CGRect(x: 0, y: 33, width: 65, height: 60))
            
            btnImage1.center.x = button1.frame.width / 2
            btnImage1.image = btnImg1
            
            button1.addSubview(btnImage1)
            
            let btnLabel1 = UILabel(frame: CGRect(x: 0, y: btnImage1.frame.maxY + 14, width: 140, height: 20))
            btnLabel1.text = "뇌졸중 관리"
            btnLabel1.textAlignment = .center
            btnLabel1.textColor = .white
            btnLabel1.center.x = button1.frame.width / 2
            btnLabel1.font = UIFont(name: "SUITE-Regular", size: 18)
            button1.addSubview(btnLabel1)
            
            
            let button2 = UIButton(frame: CGRect(x: button1.frame.maxX + 20, y: 20, width: 160, height: 160))
            button2.backgroundColor = #colorLiteral(red: 0.8247565627, green: 0.2676169872, blue: 0.3877614737, alpha: 1)
//            button2.layer.borderWidth = 0.3
            button2.layer.cornerRadius = 12
            button2.addTarget(self, action: #selector(go1(_ :)), for: .touchUpInside)
            mainButtonBackView2.addSubview(button2)
            
            let btnImg2 = UIImage(named: "menu2")
            let btnImage2 = UIImageView(frame: CGRect(x: 0, y: 33, width: 65, height: 60))
            
            btnImage2.center.x = button2.frame.width / 2
            btnImage2.image = btnImg2
            button2.addSubview(btnImage2)
            
            let btnLabel2 = UILabel(frame: CGRect(x: 0, y: btnImage2.frame.maxY + 14, width: 140, height: 20))
            btnLabel2.text = "혈압 관리"
            btnLabel2.textAlignment = .center
            btnLabel2.textColor = .white
            btnLabel2.center.x = button2.frame.width / 2
            btnLabel2.font = UIFont(name: "SUITE-Regular", size: 18)
            button2.addSubview(btnLabel2)
            
            
            
            
            let button3 = UIButton(frame: CGRect(x: 23, y: button1.frame.maxY + 20, width: 160, height: 160))
            button3.backgroundColor = #colorLiteral(red: 0.154723078, green: 0.7071833014, blue: 0.9409560561, alpha: 1)
//            button3.layer.borderWidth = 0.3
            button3.layer.cornerRadius = 12
            button3.addTarget(self, action: #selector(go2(_ :)), for: .touchUpInside)
            
            mainButtonBackView2.addSubview(button3)
            
            let btnImg3 = UIImage(named: "menu3")
            let btnImage3 = UIImageView(frame: CGRect(x: 0, y: 33, width: 65, height: 60))
            
            btnImage3.center.x = button3.frame.width / 2
            btnImage3.image = btnImg3
            button3.addSubview(btnImage3)
            
            let btnLabel3 = UILabel(frame: CGRect(x: 0, y: btnImage3.frame.maxY + 14, width: 140, height: 20))
            btnLabel3.text = "당뇨 관리"
            btnLabel3.textAlignment = .center
            btnLabel3.textColor = .white
            btnLabel3.center.x = button3.frame.width / 2
            btnLabel3.font = UIFont(name: "SUITE-Regular", size: 18)
            button3.addSubview(btnLabel3)
            
            
            
            
            let button4 = UIButton(frame: CGRect(x: button1.frame.maxX + 20, y: button1.frame.maxY + 20, width: 160, height: 160))
            button4.backgroundColor = #colorLiteral(red: 0.1993858814, green: 0.2966046333, blue: 0.6639896035, alpha: 1)
//            button4.layer.borderWidth = 0.3
            button4.layer.cornerRadius = 12
            button4.addTarget(self, action: #selector(go3(_ :)), for: .touchUpInside)
            mainButtonBackView2.addSubview(button4)
            
            let btnImg4 = UIImage(named: "menu4")
            let btnImage4 = UIImageView(frame: CGRect(x: 0, y: 33, width: 65, height: 60))
            
            btnImage4.center.x = button4.frame.width / 2
            btnImage4.image = btnImg4
            button4.addSubview(btnImage4)
            
            let btnLabel4 = UILabel(frame: CGRect(x: 0, y: btnImage4.frame.maxY + 14, width: 140, height: 20))
            btnLabel4.text = "이상지질혈증관리"
            btnLabel4.textAlignment = .center
            btnLabel4.textColor = .white
            btnLabel4.center.x = button4.frame.width / 2
            btnLabel4.font = UIFont(name: "SUITE-Regular", size: 18)
            button4.addSubview(btnLabel4)
            
            
            let button5 = UIButton(frame: CGRect(x: 23, y: button3.frame.maxY + 20, width: 160, height: 160))
            button5.backgroundColor = #colorLiteral(red: 0.1461726725, green: 0.2094348371, blue: 0.4075749516, alpha: 1)
//            button5.layer.borderWidth = 0.3
            button5.layer.cornerRadius = 12
            button5.addTarget(self, action: #selector(go4(_ :)), for: .touchUpInside)
            
            mainButtonBackView2.addSubview(button5)
            
            let btnImg5 = UIImage(named: "menu5")
            let btnImage5 = UIImageView(frame: CGRect(x: 0, y: 33, width: 65, height: 60))
            
            btnImage5.center.x = button5.frame.width / 2
            btnImage5.image = btnImg5
            button5.addSubview(btnImage5)
            
            let btnLabel5 = UILabel(frame: CGRect(x: 0, y: btnImage5.frame.maxY + 14, width: 140, height: 20))
            btnLabel5.text = "비만관리및운동"
            btnLabel5.textAlignment = .center
            btnLabel5.textColor = .white
            btnLabel5.center.x = button5.frame.width / 2
            btnLabel5.font = UIFont(name: "SUITE-Regular", size: 18)
            button5.addSubview(btnLabel5)
            
            
            let button6 = UIButton(frame: CGRect(x: button1.frame.maxX + 20, y: button3.frame.maxY + 20, width: 160, height: 160))
            button6.backgroundColor = #colorLiteral(red: 0.002265253104, green: 0.7014663815, blue: 0.6793519258, alpha: 1)
//            button6.layer.borderWidth = 0.3
            button6.layer.cornerRadius = 12
            button6.addTarget(self, action: #selector(go5(_ :)), for: .touchUpInside)
            mainButtonBackView2.addSubview(button6)
            
            let btnImg6 = UIImage(named: "menu6")
            let btnImage6 = UIImageView(frame: CGRect(x: 0, y: 33, width: 65, height: 60))
            
            btnImage6.center.x = button6.frame.width / 2
            btnImage6.image = btnImg6
            button6.addSubview(btnImage6)
            
            let btnLabel6 = UILabel(frame: CGRect(x: 0, y: btnImage6.frame.maxY + 14, width: 140, height: 20))
            btnLabel6.text = "약물복용관리"
            btnLabel6.textAlignment = .center
            btnLabel6.textColor = .white
            btnLabel6.center.x = button6.frame.width / 2
            btnLabel6.font = UIFont(name: "SUITE-Regular", size: 18)
            button6.addSubview(btnLabel6)
            
            
            
            mainButtonBackView2.frame.size.height = 710
            
            
            
//            for i in 0..<6{
//                
//                let buttonX : CGFloat = (buttonWidth + buttonWidthGap) * CGFloat(i % 2)
//                print(">>>\(buttonX)")
//                
//                let buttonY : CGFloat = (buttonHeight + buttonHeightGap) * CGFloat(i / 2)
//                
//                //            let titleString = INFO.MAIN_INFO[i][INFO.KEY.TITLE] ?? ""
//                
//                let button = MainButton(frame: CGRect(
//                    x: buttonX - 3,
//                    y: buttonY,
//                    width: buttonWidth,
//                    height: buttonHeight), imageName: "menu\(i+1)", name: "\(titleName)")
//                print("buttonHeight......\(buttonHeight)")
//                
//                print("mainButtonBackView2.frame.size.height......\(mainButtonBackView2.frame.size.height)")
//                
//                button.addTarget(event: .touchUpInside) { (button) in
//                    //                let infoDic = INFO.MAIN_INFO[i]
//                    
//                    //                contentShow(dataDic: infoDic as [String:Any])
//                }
//                
//                mainButtonBackView2.addSubview(button)
//                
//                if i == 0 {
//                    button.iconImageBackView.backgroundColor = #colorLiteral(red: 0.3217396438, green: 0.4377208352, blue: 0.9273169637, alpha: 1)
//                    button.nameLabel.text = "뇌졸중관리"
//                    button.nameLabel.font = UIFont(name: "SUITE-Regular", size: 22)
//                    button.addTarget(self, action: #selector(goBrain(_ :)), for: .touchUpInside)
//                } else if i == 1 {
//                    button.iconImageBackView.backgroundColor = #colorLiteral(red: 0.8247565627, green: 0.2676169872, blue: 0.3877614737, alpha: 1)
//                    button.nameLabel.text = "혈압관리"
//                    button.nameLabel.font = UIFont(name: "SUITE-Regular", size: 22)
//                    button.addTarget(self, action: #selector(goBloodPressure(_ :)), for: .touchUpInside)
//                } else if i == 2 {
//                    button.iconImageBackView.backgroundColor = #colorLiteral(red: 0.154723078, green: 0.7071833014, blue: 0.9409560561, alpha: 1)
//                    button.nameLabel.text = "당뇨관리"
//                    button.nameLabel.font = UIFont(name: "SUITE-Regular", size: 22)
//                    button.addTarget(self, action: #selector(goBloodSugar(_ :)), for: .touchUpInside)
//                } else if i == 3 {
//                    button.iconImageBackView.backgroundColor = #colorLiteral(red: 0.1993858814, green: 0.2966046333, blue: 0.6639896035, alpha: 1)
//                    button.nameLabel.text = "이상지질혈증관리"
//                    button.nameLabel.font = UIFont(name: "SUITE-Regular", size: 22)
//                    button.addTarget(self, action: #selector(goDyslipidemia(_ :)), for: .touchUpInside)
//                } else if i == 4 {
//                    button.iconImageBackView.backgroundColor = #colorLiteral(red: 0.1461726725, green: 0.2094348371, blue: 0.4075749516, alpha: 1)
//                    button.nameLabel.text = "비만관리및운동"
//                    button.nameLabel.font = UIFont(name: "SUITE-Regular", size: 22)
//                    button.addTarget(self, action: #selector(goObesity(_ :)), for: .touchUpInside)
//                } else if i == 5 {
//                    button.iconImageBackView.backgroundColor = #colorLiteral(red: 0.002265253104, green: 0.7014663815, blue: 0.6793519258, alpha: 1)
//                    button.nameLabel.text = "약물복용관리"
//                    button.nameLabel.font = UIFont(name: "SUITE-Regular", size: 22)
//                    button.addTarget(self, action: #selector(goMedicationManagement(_ :)), for: .touchUpInside)
//                }
//                
//            }
        }
        if IS_IPHONE_15PRO {
            mainButtonBackView = UIView(frame: CGRect(x: 0, y: hellow.frame.maxY, width: SCREEN.WIDTH, height: self.view.frame.height))
            mainButtonBackView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            scrollView.addSubview(mainButtonBackView)
            
            mainButtonBackView2 = UIView(frame: mainButtonBackView.frame)
            mainButtonBackView2.frame.origin.y = mainButtonBackView.frame.origin.y
            
            //        mainButtonBackView2.frame.size.width *= 0.9
            mainButtonBackView2.backgroundColor = #colorLiteral(red: 0.9293832183, green: 0.944276154, blue: 0.9823971391, alpha: 1)
            //        mainButtonBackView2.frame.size.width *= 0.75
            //        if IS_NORCH {
            ////            mainButtonBackView2.frame.size.height *= 0.9
            //            mainButtonBackView2.frame.size.height *= 0.95
            //        }else{
            ////            mainButtonBackView2.frame.size.height *= 0.95
            //            mainButtonBackView2.frame.size.height *= 0.9
            //        }
            mainButtonBackView2.center = mainButtonBackView.center
            scrollView.addSubview(mainButtonBackView2)
            
            let buttonWidthGap : CGFloat = 0
            let buttonHeightGap : CGFloat = 0
            let buttonWidth : CGFloat = (mainButtonBackView2.frame.size.width - (buttonWidthGap * 2)) / 2
            let buttonHeight : CGFloat = (mainButtonBackView2.frame.size.height - (buttonHeightGap * 2)) / 4
            
            let button1 = UIButton(frame: CGRect(x: 23, y: 20, width: 160, height: 160))
            button1.backgroundColor = #colorLiteral(red: 0.3217396438, green: 0.4377208352, blue: 0.9273169637, alpha: 1)
//            button1.layer.borderWidth = 0.3
            button1.layer.cornerRadius = 12
            
            button1.addTarget(self, action: #selector(go(_ :)), for: .touchUpInside)
            mainButtonBackView2.addSubview(button1)
            
            
            let btnImg1 = UIImage(named: "menu1")
            let btnImage1 = UIImageView(frame: CGRect(x: 0, y: 33, width: 65, height: 60))
            
            btnImage1.center.x = button1.frame.width / 2
            btnImage1.image = btnImg1
            
            button1.addSubview(btnImage1)
            
            let btnLabel1 = UILabel(frame: CGRect(x: 0, y: btnImage1.frame.maxY + 14, width: 140, height: 20))
            btnLabel1.text = "뇌졸중 관리"
            btnLabel1.textAlignment = .center
            btnLabel1.textColor = .white
            btnLabel1.center.x = button1.frame.width / 2
            btnLabel1.font = UIFont(name: "SUITE-Regular", size: 18)
            button1.addSubview(btnLabel1)
            
            
            let button2 = UIButton(frame: CGRect(x: button1.frame.maxX + 20, y: 20, width: 160, height: 160))
            button2.backgroundColor = #colorLiteral(red: 0.8247565627, green: 0.2676169872, blue: 0.3877614737, alpha: 1)
//            button2.layer.borderWidth = 0.3
            button2.layer.cornerRadius = 12
            button2.addTarget(self, action: #selector(go1(_ :)), for: .touchUpInside)
            mainButtonBackView2.addSubview(button2)
            
            let btnImg2 = UIImage(named: "menu2")
            let btnImage2 = UIImageView(frame: CGRect(x: 0, y: 33, width: 65, height: 60))
            
            btnImage2.center.x = button2.frame.width / 2
            btnImage2.image = btnImg2
            button2.addSubview(btnImage2)
            
            let btnLabel2 = UILabel(frame: CGRect(x: 0, y: btnImage2.frame.maxY + 14, width: 140, height: 20))
            btnLabel2.text = "혈압 관리"
            btnLabel2.textAlignment = .center
            btnLabel2.textColor = .white
            btnLabel2.center.x = button2.frame.width / 2
            btnLabel2.font = UIFont(name: "SUITE-Regular", size: 18)
            button2.addSubview(btnLabel2)
            
            
            
            
            let button3 = UIButton(frame: CGRect(x: 23, y: button1.frame.maxY + 20, width: 160, height: 160))
            button3.backgroundColor = #colorLiteral(red: 0.154723078, green: 0.7071833014, blue: 0.9409560561, alpha: 1)
//            button3.layer.borderWidth = 0.3
            button3.layer.cornerRadius = 12
            button3.addTarget(self, action: #selector(go2(_ :)), for: .touchUpInside)
            
            mainButtonBackView2.addSubview(button3)
            
            let btnImg3 = UIImage(named: "menu3")
            let btnImage3 = UIImageView(frame: CGRect(x: 0, y: 33, width: 65, height: 60))
            
            btnImage3.center.x = button3.frame.width / 2
            btnImage3.image = btnImg3
            button3.addSubview(btnImage3)
            
            let btnLabel3 = UILabel(frame: CGRect(x: 0, y: btnImage3.frame.maxY + 14, width: 140, height: 20))
            btnLabel3.text = "당뇨 관리"
            btnLabel3.textAlignment = .center
            btnLabel3.textColor = .white
            btnLabel3.center.x = button3.frame.width / 2
            btnLabel3.font = UIFont(name: "SUITE-Regular", size: 18)
            button3.addSubview(btnLabel3)
            
            
            
            
            let button4 = UIButton(frame: CGRect(x: button1.frame.maxX + 20, y: button1.frame.maxY + 20, width: 160, height: 160))
            button4.backgroundColor = #colorLiteral(red: 0.1993858814, green: 0.2966046333, blue: 0.6639896035, alpha: 1)
//            button4.layer.borderWidth = 0.3
            button4.layer.cornerRadius = 12
            button4.addTarget(self, action: #selector(go3(_ :)), for: .touchUpInside)
            mainButtonBackView2.addSubview(button4)
            
            let btnImg4 = UIImage(named: "menu4")
            let btnImage4 = UIImageView(frame: CGRect(x: 0, y: 33, width: 65, height: 60))
            
            btnImage4.center.x = button4.frame.width / 2
            btnImage4.image = btnImg4
            button4.addSubview(btnImage4)
            
            let btnLabel4 = UILabel(frame: CGRect(x: 0, y: btnImage4.frame.maxY + 14, width: 140, height: 20))
            btnLabel4.text = "이상지질혈증관리"
            btnLabel4.textAlignment = .center
            btnLabel4.textColor = .white
            btnLabel4.center.x = button4.frame.width / 2
            btnLabel4.font = UIFont(name: "SUITE-Regular", size: 18)
            button4.addSubview(btnLabel4)
            
            
            let button5 = UIButton(frame: CGRect(x: 23, y: button3.frame.maxY + 20, width: 160, height: 160))
            button5.backgroundColor = #colorLiteral(red: 0.1461726725, green: 0.2094348371, blue: 0.4075749516, alpha: 1)
//            button5.layer.borderWidth = 0.3
            button5.layer.cornerRadius = 12
            button5.addTarget(self, action: #selector(go4(_ :)), for: .touchUpInside)
            
            mainButtonBackView2.addSubview(button5)
            
            let btnImg5 = UIImage(named: "menu5")
            let btnImage5 = UIImageView(frame: CGRect(x: 0, y: 33, width: 65, height: 60))
            
            btnImage5.center.x = button5.frame.width / 2
            btnImage5.image = btnImg5
            button5.addSubview(btnImage5)
            
            let btnLabel5 = UILabel(frame: CGRect(x: 0, y: btnImage5.frame.maxY + 14, width: 140, height: 20))
            btnLabel5.text = "비만관리및운동"
            btnLabel5.textAlignment = .center
            btnLabel5.textColor = .white
            btnLabel5.center.x = button5.frame.width / 2
            btnLabel5.font = UIFont(name: "SUITE-Regular", size: 18)
            button5.addSubview(btnLabel5)
            
            
            let button6 = UIButton(frame: CGRect(x: button1.frame.maxX + 20, y: button3.frame.maxY + 20, width: 160, height: 160))
            button6.backgroundColor = #colorLiteral(red: 0.002265253104, green: 0.7014663815, blue: 0.6793519258, alpha: 1)
//            button6.layer.borderWidth = 0.3
            button6.layer.cornerRadius = 12
            button6.addTarget(self, action: #selector(go5(_ :)), for: .touchUpInside)
            mainButtonBackView2.addSubview(button6)
            
            let btnImg6 = UIImage(named: "menu6")
            let btnImage6 = UIImageView(frame: CGRect(x: 0, y: 33, width: 65, height: 60))
            
            btnImage6.center.x = button6.frame.width / 2
            btnImage6.image = btnImg6
            button6.addSubview(btnImage6)
            
            let btnLabel6 = UILabel(frame: CGRect(x: 0, y: btnImage6.frame.maxY + 14, width: 140, height: 20))
            btnLabel6.text = "약물복용관리"
            btnLabel6.textAlignment = .center
            btnLabel6.textColor = .white
            btnLabel6.center.x = button6.frame.width / 2
            btnLabel6.font = UIFont(name: "SUITE-Regular", size: 18)
            button6.addSubview(btnLabel6)
            
            
            
            mainButtonBackView2.frame.size.height = 710
            
            
            
//            for i in 0..<6{
//
//                let buttonX : CGFloat = (buttonWidth + buttonWidthGap) * CGFloat(i % 2)
//                print(">>>\(buttonX)")
//
//                let buttonY : CGFloat = (buttonHeight + buttonHeightGap) * CGFloat(i / 2)
//
//                //            let titleString = INFO.MAIN_INFO[i][INFO.KEY.TITLE] ?? ""
//
//                let button = MainButton(frame: CGRect(
//                    x: buttonX - 3,
//                    y: buttonY,
//                    width: buttonWidth,
//                    height: buttonHeight), imageName: "menu\(i+1)", name: "\(titleName)")
//                print("buttonHeight......\(buttonHeight)")
//
//                print("mainButtonBackView2.frame.size.height......\(mainButtonBackView2.frame.size.height)")
//
//                button.addTarget(event: .touchUpInside) { (button) in
//                    //                let infoDic = INFO.MAIN_INFO[i]
//
//                    //                contentShow(dataDic: infoDic as [String:Any])
//                }
//
//                mainButtonBackView2.addSubview(button)
//
//                if i == 0 {
//                    button.iconImageBackView.backgroundColor = #colorLiteral(red: 0.3217396438, green: 0.4377208352, blue: 0.9273169637, alpha: 1)
//                    button.nameLabel.text = "뇌졸중관리"
//                    button.nameLabel.font = UIFont(name: "SUITE-Regular", size: 22)
//                    button.addTarget(self, action: #selector(goBrain(_ :)), for: .touchUpInside)
//                } else if i == 1 {
//                    button.iconImageBackView.backgroundColor = #colorLiteral(red: 0.8247565627, green: 0.2676169872, blue: 0.3877614737, alpha: 1)
//                    button.nameLabel.text = "혈압관리"
//                    button.nameLabel.font = UIFont(name: "SUITE-Regular", size: 22)
//                    button.addTarget(self, action: #selector(goBloodPressure(_ :)), for: .touchUpInside)
//                } else if i == 2 {
//                    button.iconImageBackView.backgroundColor = #colorLiteral(red: 0.154723078, green: 0.7071833014, blue: 0.9409560561, alpha: 1)
//                    button.nameLabel.text = "당뇨관리"
//                    button.nameLabel.font = UIFont(name: "SUITE-Regular", size: 22)
//                    button.addTarget(self, action: #selector(goBloodSugar(_ :)), for: .touchUpInside)
//                } else if i == 3 {
//                    button.iconImageBackView.backgroundColor = #colorLiteral(red: 0.1993858814, green: 0.2966046333, blue: 0.6639896035, alpha: 1)
//                    button.nameLabel.text = "이상지질혈증관리"
//                    button.nameLabel.font = UIFont(name: "SUITE-Regular", size: 22)
//                    button.addTarget(self, action: #selector(goDyslipidemia(_ :)), for: .touchUpInside)
//                } else if i == 4 {
//                    button.iconImageBackView.backgroundColor = #colorLiteral(red: 0.1461726725, green: 0.2094348371, blue: 0.4075749516, alpha: 1)
//                    button.nameLabel.text = "비만관리및운동"
//                    button.nameLabel.font = UIFont(name: "SUITE-Regular", size: 22)
//                    button.addTarget(self, action: #selector(goObesity(_ :)), for: .touchUpInside)
//                } else if i == 5 {
//                    button.iconImageBackView.backgroundColor = #colorLiteral(red: 0.002265253104, green: 0.7014663815, blue: 0.6793519258, alpha: 1)
//                    button.nameLabel.text = "약물복용관리"
//                    button.nameLabel.font = UIFont(name: "SUITE-Regular", size: 22)
//                    button.addTarget(self, action: #selector(goMedicationManagement(_ :)), for: .touchUpInside)
//                }
//
//            }
        }
        
        if IS_IPHONE_12PRO_MAX {
            brainButtonBackView = UIView(frame: CGRect(x: 0, y: mainButtonBackView.frame.maxY - 310, width: SCREEN.WIDTH, height: self.view.frame.height))
            //        brainButtonBackView.backgroundColor = .white
            brainButtonBackView.backgroundColor = #colorLiteral(red: 0.9299879074, green: 0.9458257556, blue: 0.9833372235, alpha: 1)
            scrollView.addSubview(brainButtonBackView)
        }
        
        if IS_IPHONE_15PRO_MAX {
            brainButtonBackView = UIView(frame: CGRect(x: 0, y: mainButtonBackView.frame.maxY - 310, width: SCREEN.WIDTH, height: self.view.frame.height))
            //        brainButtonBackView.backgroundColor = .white
            brainButtonBackView.backgroundColor = #colorLiteral(red: 0.9299879074, green: 0.9458257556, blue: 0.9833372235, alpha: 1)
            scrollView.addSubview(brainButtonBackView)
        }
        
        if IS_IPHONE_N_PLUS {
            brainButtonBackView = UIView(frame: CGRect(x: 0, y: mainButtonBackView2.frame.maxY - 105, width: SCREEN.WIDTH, height: self.view.frame.height + 230))
            //        brainButtonBackView.backgroundColor = .white
            brainButtonBackView.backgroundColor = #colorLiteral(red: 0.9299879074, green: 0.9458257556, blue: 0.9833372235, alpha: 1)
            scrollView.addSubview(brainButtonBackView)
        }
        
//        if IS_IPHONE_X {
//            brainButtonBackView = UIView(frame: CGRect(x: 0, y: mainButtonBackView2.frame.maxY - 150, width: SCREEN.WIDTH, height: self.view.frame.height + 230))
//            //        brainButtonBackView.backgroundColor = .white
//            brainButtonBackView.backgroundColor = #colorLiteral(red: 0.9299879074, green: 0.9458257556, blue: 0.9833372235, alpha: 1)
//            scrollView.addSubview(brainButtonBackView)
//        }
        
        if IS_IPHONE_N {
            brainButtonBackView = UIView(frame: CGRect(x: 0, y: mainButtonBackView2.frame.maxY - 150, width: SCREEN.WIDTH, height: self.view.frame.height + 230))
            //        brainButtonBackView.backgroundColor = .white
            brainButtonBackView.backgroundColor = #colorLiteral(red: 0.9299879074, green: 0.9458257556, blue: 0.9833372235, alpha: 1)
            scrollView.addSubview(brainButtonBackView)
        }
        if IS_IPHONE_MINI {
            brainButtonBackView = UIView(frame: CGRect(x: 0, y: mainButtonBackView2.frame.maxY - 160, width: SCREEN.WIDTH, height: self.view.frame.height + 230))
            //        brainButtonBackView.backgroundColor = .white
            brainButtonBackView.backgroundColor = #colorLiteral(red: 0.9299879074, green: 0.9458257556, blue: 0.9833372235, alpha: 1)
            scrollView.addSubview(brainButtonBackView)
        }
        
        if IS_IPHONE_12PRO {
            brainButtonBackView = UIView(frame: CGRect(x: 0, y: mainButtonBackView2.frame.maxY - 170, width: SCREEN.WIDTH, height: self.view.frame.height + 230))
            //        brainButtonBackView.backgroundColor = .white
            brainButtonBackView.backgroundColor = #colorLiteral(red: 0.9299879074, green: 0.9458257556, blue: 0.9833372235, alpha: 1)
            scrollView.addSubview(brainButtonBackView)
        }
        if IS_IPHONE_15PRO {
            brainButtonBackView = UIView(frame: CGRect(x: 0, y: mainButtonBackView2.frame.maxY - 170, width: SCREEN.WIDTH, height: self.view.frame.height + 230))
            //        brainButtonBackView.backgroundColor = .white
            brainButtonBackView.backgroundColor = #colorLiteral(red: 0.9299879074, green: 0.9458257556, blue: 0.9833372235, alpha: 1)
            scrollView.addSubview(brainButtonBackView)
        }
        
        brainLabel1 = UILabel(frame: CGRect(x: SCREEN.WIDTH / 3.5, y: 40, width: 250, height: 30))
        
        if IS_IPHONE_N {
            brainLabel1 = UILabel(frame: CGRect(x: SCREEN.WIDTH / 3.5, y: 20, width: 250, height: 30))
        }
        
        brainLabel1.text = "뇌졸중 바로알기"
        brainButtonBackView.addSubview(brainLabel1)
        //        brainLabel1.font = UIFont.systemFont(ofSize: 30)
        brainLabel1.font = UIFont(name: "SUITE-Medium", size: 30)
        
        
        if IS_IPHONE_12PRO_MAX {
            
            brainView1 = UIView(frame: CGRect(x: 20, y: brainLabel1.frame.maxY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 5.5))
            brainView1.layer.borderWidth = 1
            brainView1.backgroundColor = #colorLiteral(red: 0.952888906, green: 0.9678936601, blue: 1, alpha: 1)
            brainView1.layer.borderColor = UIColor(red: 167.0/255.0, green: 186.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
            brainView1.roundCorners(topLeft: 8, topRight: 8, bottomLeft: 8, bottomRight: 24)
            
            //        let borderLayer1 = CAShapeLayer()
            //        borderLayer1.path = (brainView1.layer.mask! as! CAShapeLayer).path! // Reuse the Bezier path
            //        borderLayer1.strokeColor = UIColor.black.cgColor
            //        borderLayer1.fillColor = UIColor.clear.cgColor
            //        borderLayer1.lineWidth = 2
            //        borderLayer1.frame = brainView1.bounds
            //        brainView1.layer.addSublayer(borderLayer1)
            let borderLayer1 = CAShapeLayer()
            borderLayer1.path = (brainView1.layer.mask! as! CAShapeLayer).path! // Reuse the Bezier path
            //            borderLayer1.strokeColor = UIColor.black.cgColor
            borderLayer1.strokeColor = UIColor(red: 167.0/255.0, green: 186.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
            borderLayer1.fillColor = UIColor.clear.cgColor
            //            borderLayer1.fillColor = UIColor(red: 167.0/255.0, green: 186.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
            borderLayer1.lineWidth = 2
            borderLayer1.frame = brainView1.bounds
            brainView1.layer.addSublayer(borderLayer1)
            
            brainButtonBackView.addSubview(brainView1)
            
            brainLB1 = UILabel(frame: CGRect(x: 30, y: 25, width: self.view.frame.size.width - 60, height: 21))
            brainLB1.text = "급성기 뇌졸증"
            brainLB1.textColor = #colorLiteral(red: 0.1970121264, green: 0.3326128721, blue: 0.6067818403, alpha: 1)
            brainLB1.font = UIFont(name: "SUITE-Heavy", size: 22)
            
            brainLB1.font = UIFont(name: "SUITE-SemiBold", size: 22)
            
            //        brainLB1.font = UIFont.systemFont(ofSize: 22)
            brainView1.addSubview(brainLB1)
            
            brainSubLB1 = UILabel(frame: CGRect(x: 30, y: brainLB1.frame.maxY + 5, width: self.view.frame.size.width - 60, height: 54))
            brainSubLB1.text = "뇌졸중은 중풍이라고 불리는\n뇌혈관 질환입니다."
            brainSubLB1.numberOfLines = 0
            brainSubLB1.font = UIFont.systemFont(ofSize: 15)
            brainSubLB1.font = UIFont(name: "SUITE-Regular", size: 15)
            brainView1.addSubview(brainSubLB1)
            
            brainBTN1 = UIButton(frame: CGRect(x: 30, y: brainSubLB1.frame.maxY + 5, width: 130, height: 32))
            brainBTN1.setTitle("바로가기" , for: .normal)
            
            
            brainBTN1.setTitleColor(.white, for: .normal)
            
            brainBTN1.titleEdgeInsets = UIEdgeInsets(top: 0, left: -18, bottom: 0, right: 0)
            
            let envelopeView = UIImageView(frame: CGRect(x: 99, y: 8, width: 17, height: 17))
             let image = UIImage(named: "rightImage")
            
            envelopeView.image = image
            envelopeView.contentMode = .scaleAspectFit
//            var viewLeft: UIView = UIView(frame: CGRectMake(20, 0, 40, 30))// set per your requirement
            brainBTN1.addSubview(envelopeView)
            
        
            
            
            
            brainBTN1.backgroundColor = #colorLiteral(red: 0.1970121264, green: 0.3326128721, blue: 0.6067818403, alpha: 1)
            brainBTN1.layer.cornerRadius = 16
            
//            brainBTN1.layer.borderWidth = 1
            brainBTN1.addTarget(self, action: #selector(goStroke(_ :)), for: .touchUpInside)
            brainView1.addSubview(brainBTN1)
            
            brainImage = UIImageView(frame: CGRect(x: brainView1.frame.maxX - 110, y: brainView1.frame.size.height / 3.4, width: 65, height: 70))
            
            brainImage.image = UIImage(named: "go1")
            brainView1.addSubview(brainImage)
            
            
            brainView2 = UIView(frame: CGRect(x: 20, y: brainView1.frame.maxY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 5.5))
            brainView2.layer.borderWidth = 1
            brainView2.backgroundColor = #colorLiteral(red: 0.9770591855, green: 0.9520680308, blue: 0.9982358813, alpha: 1)
            brainView2.layer.borderColor = UIColor(red: 194.0/255.0, green: 164.0/255.0, blue: 224.0/255.0, alpha: 1.0).cgColor
            brainView2.roundCorners(topLeft: 8, topRight: 8, bottomLeft: 8, bottomRight: 24)
            
            let borderLayer2 = CAShapeLayer()
            borderLayer2.path = (brainView2.layer.mask! as! CAShapeLayer).path! // Reuse the Bezier path
            //            borderLayer2.strokeColor = UIColor.black.cgColor
            borderLayer2.fillColor = UIColor.clear.cgColor
            borderLayer2.strokeColor = UIColor(red: 194.0/255.0, green: 164.0/255.0, blue: 224.0/255.0, alpha: 1.0).cgColor
            //            borderLayer2.fillColor = UIColor(red: 194.0/255.0, green: 164.0/255.0, blue: 224.0/255.0, alpha: 1.0).cgColor
            borderLayer2.lineWidth = 2
            borderLayer2.frame = brainView2.bounds
            brainView2.layer.addSublayer(borderLayer2)
            
            brainButtonBackView.addSubview(brainView2)
            
            brainLB2 = UILabel(frame: CGRect(x: 30, y: 25, width: self.view.frame.size.width - 60, height: 21))
            brainLB2.text = "위험인자"
            brainLB2.textColor = #colorLiteral(red: 0.5486581326, green: 0.3868186474, blue: 0.7095668912, alpha: 1)
            //        brainLB2.font = UIFont.systemFont(ofSize: 22)
            brainLB2.font = UIFont(name: "SUITE-Heavy", size: 22)
            brainView2.addSubview(brainLB2)
            brainLB2.font = UIFont(name: "SUITE-SemiBold", size: 22)
            brainSubLB2 = UILabel(frame: CGRect(x: 30, y: brainLB2.frame.maxY + 5, width: self.view.frame.size.width - 60, height: 60))
            
            
            
            
            brainSubLB2.text = "뇌졸중 환자들은 다양한 뇌졸중\n위험인자를 갖게 됩니다. 위험인자에\n대해 자세히 알아볼까요?"
            
            brainSubLB2.numberOfLines = 0
            brainSubLB2.font = UIFont.systemFont(ofSize: 15)
            brainSubLB2.font = UIFont(name: "SUITE-Regular", size: 15)
            brainView2.addSubview(brainSubLB2)
            
            
            
            brainBTN2 = UIButton(frame: CGRect(x: 30, y: brainSubLB2.frame.maxY + 5, width: 130, height: 32))
            brainBTN2.setTitle("바로가기", for: .normal)
            brainBTN2.backgroundColor = #colorLiteral(red: 0.5486581326, green: 0.3868186474, blue: 0.7095668912, alpha: 1)
            
            
            brainBTN2.titleEdgeInsets = UIEdgeInsets(top: 0, left: -18, bottom: 0, right: 0)
            
            let envelopeView2 = UIImageView(frame: CGRect(x: 99, y: 8, width: 17, height: 17))
             let image2 = UIImage(named: "rightImage")
            
            envelopeView2.image = image2
            envelopeView2.contentMode = .scaleAspectFit
//            var viewLeft: UIView = UIView(frame: CGRectMake(20, 0, 40, 30))// set per your requirement
            brainBTN2.addSubview(envelopeView2)
            
            brainBTN2.setTitleColor(.white, for: .normal)
            brainBTN2.layer.cornerRadius = 16
//            brainBTN2.layer.borderWidth = 1
            brainBTN2.addTarget(self, action: #selector(goRiskFactors(_ :)), for: .touchUpInside)
            brainView2.addSubview(brainBTN2)
            
            brainImage2 = UIImageView(frame: CGRect(x: brainView2.frame.maxX - 110, y: brainView2.frame.size.height / 3.4, width: 65, height: 70))
            brainImage2.image = UIImage(named: "go2")
            brainView2.addSubview(brainImage2)
            
            
            
            brainView3 = UIView(frame: CGRect(x: 20, y: brainView2.frame.maxY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 5.5))
            brainView3.layer.borderWidth = 1
            brainView3.backgroundColor = #colorLiteral(red: 0.9521439672, green: 1, blue: 0.9879009128, alpha: 1)
            brainView3.layer.borderColor = UIColor(red: 140.0/255.0, green: 200.0/255.0, blue: 185.0/255.0, alpha: 1.0).cgColor
            brainView3.roundCorners(topLeft: 8, topRight: 8, bottomLeft: 8, bottomRight: 24)
            
            let borderLayer3 = CAShapeLayer()
            borderLayer3.path = (brainView3.layer.mask! as! CAShapeLayer).path! // Reuse the Bezier path
            borderLayer3.strokeColor = UIColor(red: 140.0/255.0, green: 200.0/255.0, blue: 185.0/255.0, alpha: 1.0).cgColor
            //            borderLayer3.fillColor = UIColor(red: 140.0/255.0, green: 200.0/255.0, blue: 185.0/255.0, alpha: 1.0).cgColor
            //            borderLayer3.strokeColor = UIColor.black.cgColor
            borderLayer3.fillColor = UIColor.clear.cgColor
            borderLayer3.lineWidth = 2
            borderLayer3.frame = brainView3.bounds
            brainView3.layer.addSublayer(borderLayer3)
            
            brainButtonBackView.addSubview(brainView3)
            
            brainLB3 = UILabel(frame: CGRect(x: 30, y: 25, width: self.view.frame.size.width - 60, height: 21))
            brainLB3.text = "응급처치"
            brainLB3.textColor = #colorLiteral(red: 0.3004111648, green: 0.6361213923, blue: 0.5539721847, alpha: 1)
            brainLB3.font = UIFont(name: "SUITE-Heavy", size: 22)
            //        brainLB3.font = UIFont.systemFont(ofSize: 22)
            brainLB3.font = UIFont(name: "SUITE-SemiBold", size: 22)
            brainView3.addSubview(brainLB3)
            
            brainSubLB3 = UILabel(frame: CGRect(x: 30, y: brainLB3.frame.maxY + 5, width: self.view.frame.size.width - 60, height: 54))
            brainSubLB3.text = "뇌졸중의 응급처치는 어떻게 할까요?"
            brainSubLB3.numberOfLines = 0
            brainSubLB3.font = UIFont.systemFont(ofSize: 15)
            brainSubLB3.font = UIFont(name: "SUITE-Regular", size: 15)
            brainView3.addSubview(brainSubLB3)
            
            brainBTN3 = UIButton(frame: CGRect(x: 30, y: brainSubLB3.frame.maxY + 5, width: 130, height: 32))
            brainBTN3.setTitle("바로가기", for: .normal)
            brainBTN3.backgroundColor = #colorLiteral(red: 0.3004111648, green: 0.6361213923, blue: 0.5539721847, alpha: 1)
            
            brainBTN3.setTitleColor(.white, for: .normal)
            
            
            brainBTN3.titleEdgeInsets = UIEdgeInsets(top: 0, left: -18, bottom: 0, right: 0)
            
            let envelopeView3 = UIImageView(frame: CGRect(x: 99, y: 8, width: 17, height: 17))
             let image3 = UIImage(named: "rightImage")
            
            envelopeView3.image = image3
            envelopeView3.contentMode = .scaleAspectFit
//            var viewLeft: UIView = UIView(frame: CGRectMake(20, 0, 40, 30))// set per your requirement
            brainBTN3.addSubview(envelopeView3)
            
            brainBTN3.layer.cornerRadius = 16
//            brainBTN3.layer.borderWidth = 1
            brainBTN3.addTarget(self, action: #selector(goFirstAid(_ :)), for: .touchUpInside)
            brainView3.addSubview(brainBTN3)
            
            brainImage3 = UIImageView(frame: CGRect(x: brainView3.frame.maxX - 110, y: brainView3.frame.size.height / 3.4, width: 65, height: 70))
            brainImage3.image = UIImage(named: "go3")
            brainView3.addSubview(brainImage3)
            
            brainView4 = UIView(frame: CGRect(x: 20, y: brainView3.frame.maxY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 5.5))
            brainView4.layer.borderWidth = 1
            brainView4.backgroundColor = #colorLiteral(red: 0.9999601245, green: 0.9854144454, blue: 0.93028754, alpha: 1)
            brainView4.layer.borderColor = UIColor(red: 218.0/255.0, green: 200.0/255.0, blue: 137.0/255.0, alpha: 1.0).cgColor
            brainView4.roundCorners(topLeft: 8, topRight: 8, bottomLeft: 8, bottomRight: 24)
            
            
            
            
            let borderLayer4 = CAShapeLayer()
            borderLayer4.path = (brainView4.layer.mask! as! CAShapeLayer).path! // Reuse the Bezier path
            borderLayer4.strokeColor = UIColor(red: 218.0/255.0, green: 200.0/255.0, blue: 137.0/255.0, alpha: 1.0).cgColor
            //            borderLayer4.fillColor = UIColor(red: 218.0/255.0, green: 200.0/255.0, blue: 137.0/255.0, alpha: 1.0).cgColor
            //            borderLayer4.strokeColor = UIColor.black.cgColor
            borderLayer4.fillColor = UIColor.clear.cgColor
            borderLayer4.lineWidth = 2
            borderLayer4.frame = brainView4.bounds
            brainView4.layer.addSublayer(borderLayer4)
            
            brainButtonBackView.addSubview(brainView4)
            
            brainLB4 = UILabel(frame: CGRect(x: 30, y: 25, width: self.view.frame.size.width - 60, height: 21))
            brainLB4.text = "뇌졸중의 치료"
            brainLB4.textColor = #colorLiteral(red: 0.8475571275, green: 0.3171732128, blue: 0.0007351766108, alpha: 1)
            brainLB4.font = UIFont.systemFont(ofSize: 22)
            brainLB4.font = UIFont(name: "SUITE-Regular", size: 22)
            brainLB4.font = UIFont(name: "SUITE-SemiBold", size: 22)
            
            
            
            
            brainView4.addSubview(brainLB4)
            
            brainSubLB4 = UILabel(frame: CGRect(x: 30, y: brainLB4.frame.maxY + 5, width: self.view.frame.size.width - 60, height: 54))
            brainSubLB4.text = "뇌졸중의 치료에 있어\n가장 중요한 것은 시간입니다."
            brainSubLB4.numberOfLines = 0
            brainSubLB4.font = UIFont.systemFont(ofSize: 15)
            brainSubLB4.font = UIFont(name: "SUITE-Regular", size: 15)
            brainView4.addSubview(brainSubLB4)
            
            brainBTN4 = UIButton(frame: CGRect(x: 30, y: brainSubLB4.frame.maxY + 5, width: 130, height: 32))
            brainBTN4.setTitle("바로가기", for: .normal)
            brainBTN4.backgroundColor = #colorLiteral(red: 0.9241898656, green: 0.6377926469, blue: 0.1878951788, alpha: 1)
            
            
            brainBTN4.titleEdgeInsets = UIEdgeInsets(top: 0, left: -18, bottom: 0, right: 0)
            
            let envelopeView4 = UIImageView(frame: CGRect(x: 99, y: 8, width: 17, height: 17))
             let image4 = UIImage(named: "rightImage")
            
            envelopeView4.image = image4
            envelopeView4.contentMode = .scaleAspectFit
//            var viewLeft: UIView = UIView(frame: CGRectMake(20, 0, 40, 30))// set per your requirement
            brainBTN4.addSubview(envelopeView4)
            
            brainBTN4.setTitleColor(.white, for: .normal)
            brainBTN4.layer.cornerRadius = 16
//            brainBTN4.layer.borderWidth = 1
            brainBTN4.addTarget(self, action: #selector(goTreatmentOfStroke(_ :)), for: .touchUpInside)
            brainView4.addSubview(brainBTN4)
            
            brainImage4 = UIImageView(frame: CGRect(x: brainView4.frame.maxX - 110, y: brainView4.frame.size.height / 3.4, width: 65, height: 70))
            brainImage4.image = UIImage(named: "go4")
            brainView4.addSubview(brainImage4)
        } else if IS_IPHONE_15PRO_MAX {
            
            brainView1 = UIView(frame: CGRect(x: 20, y: brainLabel1.frame.maxY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 5.5))
            brainView1.layer.borderWidth = 1
            brainView1.backgroundColor = #colorLiteral(red: 0.952888906, green: 0.9678936601, blue: 1, alpha: 1)
            brainView1.layer.borderColor = UIColor(red: 167.0/255.0, green: 186.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
            brainView1.roundCorners(topLeft: 8, topRight: 8, bottomLeft: 8, bottomRight: 24)
            
            //        let borderLayer1 = CAShapeLayer()
            //        borderLayer1.path = (brainView1.layer.mask! as! CAShapeLayer).path! // Reuse the Bezier path
            //        borderLayer1.strokeColor = UIColor.black.cgColor
            //        borderLayer1.fillColor = UIColor.clear.cgColor
            //        borderLayer1.lineWidth = 2
            //        borderLayer1.frame = brainView1.bounds
            //        brainView1.layer.addSublayer(borderLayer1)
            let borderLayer1 = CAShapeLayer()
            borderLayer1.path = (brainView1.layer.mask! as! CAShapeLayer).path! // Reuse the Bezier path
            //            borderLayer1.strokeColor = UIColor.black.cgColor
            borderLayer1.strokeColor = UIColor(red: 167.0/255.0, green: 186.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
            borderLayer1.fillColor = UIColor.clear.cgColor
            //            borderLayer1.fillColor = UIColor(red: 167.0/255.0, green: 186.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
            borderLayer1.lineWidth = 2
            borderLayer1.frame = brainView1.bounds
            brainView1.layer.addSublayer(borderLayer1)
            
            brainButtonBackView.addSubview(brainView1)
            
            brainLB1 = UILabel(frame: CGRect(x: 30, y: 25, width: self.view.frame.size.width - 60, height: 21))
            brainLB1.text = "급성기 뇌졸증"
            brainLB1.textColor = #colorLiteral(red: 0.1970121264, green: 0.3326128721, blue: 0.6067818403, alpha: 1)
            brainLB1.font = UIFont(name: "SUITE-Heavy", size: 22)
            //        brainLB1.font = UIFont.systemFont(ofSize: 22)
            brainLB1.font = UIFont(name: "SUITE-SemiBold", size: 22)
            brainView1.addSubview(brainLB1)
            
            brainSubLB1 = UILabel(frame: CGRect(x: 30, y: brainLB1.frame.maxY + 5, width: self.view.frame.size.width - 60, height: 54))
            brainSubLB1.text = "뇌졸중은 중풍이라고 불리는\n뇌혈관 질환입니다."
            brainSubLB1.numberOfLines = 0
            brainSubLB1.font = UIFont.systemFont(ofSize: 15)
            brainSubLB1.font = UIFont(name: "SUITE-Regular", size: 15)
            brainView1.addSubview(brainSubLB1)
            
            brainBTN1 = UIButton(frame: CGRect(x: 30, y: brainSubLB1.frame.maxY + 5, width: 130, height: 32))
            brainBTN1.setTitle("바로가기", for: .normal)
            brainBTN1.setTitleColor(.white, for: .normal)
            
            brainBTN1.titleEdgeInsets = UIEdgeInsets(top: 0, left: -18, bottom: 0, right: 0)
            
            let envelopeView = UIImageView(frame: CGRect(x: 99, y: 8, width: 17, height: 17))
             let image = UIImage(named: "rightImage")
            
            envelopeView.image = image
            envelopeView.contentMode = .scaleAspectFit
//            var viewLeft: UIView = UIView(frame: CGRectMake(20, 0, 40, 30))// set per your requirement
            brainBTN1.addSubview(envelopeView)
            
            brainBTN1.backgroundColor = #colorLiteral(red: 0.1970121264, green: 0.3326128721, blue: 0.6067818403, alpha: 1)
            brainBTN1.layer.cornerRadius = 16
            
//            brainBTN1.layer.borderWidth = 1
            brainBTN1.addTarget(self, action: #selector(goStroke(_ :)), for: .touchUpInside)
            brainView1.addSubview(brainBTN1)
            
            brainImage = UIImageView(frame: CGRect(x: brainView1.frame.maxX - 110, y: brainView1.frame.size.height / 3.4, width: 50, height: 53))
            
            brainImage.image = UIImage(named: "go1")
            brainView1.addSubview(brainImage)
            
            
            brainView2 = UIView(frame: CGRect(x: 20, y: brainView1.frame.maxY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 5.5))
            brainView2.layer.borderWidth = 1
            brainView2.backgroundColor = #colorLiteral(red: 0.9770591855, green: 0.9520680308, blue: 0.9982358813, alpha: 1)
            brainView2.layer.borderColor = UIColor(red: 194.0/255.0, green: 164.0/255.0, blue: 224.0/255.0, alpha: 1.0).cgColor
            brainView2.roundCorners(topLeft: 8, topRight: 8, bottomLeft: 8, bottomRight: 24)
            
            let borderLayer2 = CAShapeLayer()
            borderLayer2.path = (brainView2.layer.mask! as! CAShapeLayer).path! // Reuse the Bezier path
            //            borderLayer2.strokeColor = UIColor.black.cgColor
            borderLayer2.fillColor = UIColor.clear.cgColor
            borderLayer2.strokeColor = UIColor(red: 194.0/255.0, green: 164.0/255.0, blue: 224.0/255.0, alpha: 1.0).cgColor
            //            borderLayer2.fillColor = UIColor(red: 194.0/255.0, green: 164.0/255.0, blue: 224.0/255.0, alpha: 1.0).cgColor
            borderLayer2.lineWidth = 2
            borderLayer2.frame = brainView2.bounds
            brainView2.layer.addSublayer(borderLayer2)
            
            brainButtonBackView.addSubview(brainView2)
            
            brainLB2 = UILabel(frame: CGRect(x: 30, y: 25, width: self.view.frame.size.width - 60, height: 21))
            brainLB2.text = "위험인자"
            brainLB2.textColor = #colorLiteral(red: 0.5486581326, green: 0.3868186474, blue: 0.7095668912, alpha: 1)
            //        brainLB2.font = UIFont.systemFont(ofSize: 22)
            brainLB2.font = UIFont(name: "SUITE-Heavy", size: 22)
            brainLB2.font = UIFont(name: "SUITE-SemiBold", size: 22)
            brainView2.addSubview(brainLB2)
            
            brainSubLB2 = UILabel(frame: CGRect(x: 30, y: brainLB2.frame.maxY + 5, width: self.view.frame.size.width - 60, height: 60))
            
            
            
            
            brainSubLB2.text = "뇌졸중 환자들은 다양한 뇌졸중\n위험인자를 갖게 됩니다. 위험인자에\n대해 자세히 알아볼까요?"
            
            brainSubLB2.numberOfLines = 0
            brainSubLB2.font = UIFont.systemFont(ofSize: 15)
            brainSubLB2.font = UIFont(name: "SUITE-Regular", size: 15)
            brainView2.addSubview(brainSubLB2)
            
            
            
            brainBTN2 = UIButton(frame: CGRect(x: 30, y: brainSubLB2.frame.maxY + 5, width: 130, height: 32))
            brainBTN2.setTitle("바로가기", for: .normal)
            brainBTN2.backgroundColor = #colorLiteral(red: 0.5486581326, green: 0.3868186474, blue: 0.7095668912, alpha: 1)
            
            brainBTN2.titleEdgeInsets = UIEdgeInsets(top: 0, left: -18, bottom: 0, right: 0)
            
            let envelopeView2 = UIImageView(frame: CGRect(x: 99, y: 8, width: 17, height: 17))
             let image2 = UIImage(named: "rightImage")
            
            envelopeView2.image = image2
            envelopeView2.contentMode = .scaleAspectFit
//            var viewLeft: UIView = UIView(frame: CGRectMake(20, 0, 40, 30))// set per your requirement
            brainBTN2.addSubview(envelopeView2)
            
            
            brainBTN2.setTitleColor(.white, for: .normal)
            brainBTN2.layer.cornerRadius = 16
//            brainBTN2.layer.borderWidth = 1
            brainBTN2.addTarget(self, action: #selector(goRiskFactors(_ :)), for: .touchUpInside)
            brainView2.addSubview(brainBTN2)
            
            brainImage2 = UIImageView(frame: CGRect(x: brainView2.frame.maxX - 110, y: brainView2.frame.size.height / 3.4, width: 50, height: 53))
            brainImage2.image = UIImage(named: "go2")
            brainView2.addSubview(brainImage2)
            
            
            
            brainView3 = UIView(frame: CGRect(x: 20, y: brainView2.frame.maxY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 5.5))
            brainView3.layer.borderWidth = 1
            brainView3.backgroundColor = #colorLiteral(red: 0.9521439672, green: 1, blue: 0.9879009128, alpha: 1)
            brainView3.layer.borderColor = UIColor(red: 140.0/255.0, green: 200.0/255.0, blue: 185.0/255.0, alpha: 1.0).cgColor
            brainView3.roundCorners(topLeft: 8, topRight: 8, bottomLeft: 8, bottomRight: 24)
            
            let borderLayer3 = CAShapeLayer()
            borderLayer3.path = (brainView3.layer.mask! as! CAShapeLayer).path! // Reuse the Bezier path
            borderLayer3.strokeColor = UIColor(red: 140.0/255.0, green: 200.0/255.0, blue: 185.0/255.0, alpha: 1.0).cgColor
            //            borderLayer3.fillColor = UIColor(red: 140.0/255.0, green: 200.0/255.0, blue: 185.0/255.0, alpha: 1.0).cgColor
            //            borderLayer3.strokeColor = UIColor.black.cgColor
            borderLayer3.fillColor = UIColor.clear.cgColor
            borderLayer3.lineWidth = 2
            borderLayer3.frame = brainView3.bounds
            brainView3.layer.addSublayer(borderLayer3)
            
            brainButtonBackView.addSubview(brainView3)
            
            brainLB3 = UILabel(frame: CGRect(x: 30, y: 25, width: self.view.frame.size.width - 60, height: 21))
            brainLB3.text = "응급처치"
            brainLB3.textColor = #colorLiteral(red: 0.3004111648, green: 0.6361213923, blue: 0.5539721847, alpha: 1)
            brainLB3.font = UIFont(name: "SUITE-Heavy", size: 22)
            brainLB3.font = UIFont(name: "SUITE-SemiBold", size: 22)
            //        brainLB3.font = UIFont.systemFont(ofSize: 22)
            brainView3.addSubview(brainLB3)
            
            brainSubLB3 = UILabel(frame: CGRect(x: 30, y: brainLB3.frame.maxY + 5, width: self.view.frame.size.width - 60, height: 54))
            brainSubLB3.text = "뇌졸중의 응급처치는 어떻게 할까요?"
            brainSubLB3.numberOfLines = 0
            brainSubLB3.font = UIFont.systemFont(ofSize: 15)
            brainSubLB3.font = UIFont(name: "SUITE-Regular", size: 15)
            brainView3.addSubview(brainSubLB3)
            
            brainBTN3 = UIButton(frame: CGRect(x: 30, y: brainSubLB3.frame.maxY + 5, width: 130, height: 32))
            brainBTN3.setTitle("바로가기", for: .normal)
            brainBTN3.backgroundColor = #colorLiteral(red: 0.3004111648, green: 0.6361213923, blue: 0.5539721847, alpha: 1)
            
            brainBTN3.titleEdgeInsets = UIEdgeInsets(top: 0, left: -18, bottom: 0, right: 0)
            
            let envelopeView3 = UIImageView(frame: CGRect(x: 99, y: 8, width: 17, height: 17))
             let image3 = UIImage(named: "rightImage")
            
            envelopeView3.image = image3
            envelopeView3.contentMode = .scaleAspectFit
//            var viewLeft: UIView = UIView(frame: CGRectMake(20, 0, 40, 30))// set per your requirement
            brainBTN3.addSubview(envelopeView3)
            
            brainBTN3.setTitleColor(.white, for: .normal)
            brainBTN3.layer.cornerRadius = 16
//            brainBTN3.layer.borderWidth = 1
            brainBTN3.addTarget(self, action: #selector(goFirstAid(_ :)), for: .touchUpInside)
            brainView3.addSubview(brainBTN3)
            
            brainImage3 = UIImageView(frame: CGRect(x: brainView3.frame.maxX - 110, y: brainView3.frame.size.height / 3.4, width: 50, height: 53))
            brainImage3.image = UIImage(named: "go3")
            brainView3.addSubview(brainImage3)
            
            brainView4 = UIView(frame: CGRect(x: 20, y: brainView3.frame.maxY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 5.5))
            brainView4.layer.borderWidth = 1
            brainView4.backgroundColor = #colorLiteral(red: 0.9999601245, green: 0.9854144454, blue: 0.93028754, alpha: 1)
            brainView4.layer.borderColor = UIColor(red: 218.0/255.0, green: 200.0/255.0, blue: 137.0/255.0, alpha: 1.0).cgColor
            brainView4.roundCorners(topLeft: 8, topRight: 8, bottomLeft: 8, bottomRight: 24)
            
            
            
            
            let borderLayer4 = CAShapeLayer()
            borderLayer4.path = (brainView4.layer.mask! as! CAShapeLayer).path! // Reuse the Bezier path
            borderLayer4.strokeColor = UIColor(red: 218.0/255.0, green: 200.0/255.0, blue: 137.0/255.0, alpha: 1.0).cgColor
            //            borderLayer4.fillColor = UIColor(red: 218.0/255.0, green: 200.0/255.0, blue: 137.0/255.0, alpha: 1.0).cgColor
            //            borderLayer4.strokeColor = UIColor.black.cgColor
            borderLayer4.fillColor = UIColor.clear.cgColor
            borderLayer4.lineWidth = 2
            borderLayer4.frame = brainView4.bounds
            brainView4.layer.addSublayer(borderLayer4)
            
            brainButtonBackView.addSubview(brainView4)
            
            
            brainLB4 = UILabel(frame: CGRect(x: 30, y: 25, width: self.view.frame.size.width - 60, height: 21))
            brainLB4.text = "뇌졸중의 치료"
            brainLB4.textColor = #colorLiteral(red: 0.8475571275, green: 0.3171732128, blue: 0.0007351766108, alpha: 1)
            brainLB4.font = UIFont.systemFont(ofSize: 22)
            brainLB4.font = UIFont(name: "SUITE-Heavy", size: 22)
            brainLB4.font = UIFont(name: "SUITE-SemiBold", size: 22)
            brainView4.addSubview(brainLB4)
            
            brainSubLB4 = UILabel(frame: CGRect(x: 30, y: brainLB4.frame.maxY + 5, width: self.view.frame.size.width - 60, height: 54))
            brainSubLB4.text = "뇌졸중의 치료에 있어\n가장 중요한 것은 시간입니다."
            brainSubLB4.numberOfLines = 0
            brainSubLB4.font = UIFont.systemFont(ofSize: 15)
            brainSubLB4.font = UIFont(name: "SUITE-Regular", size: 15)
            brainView4.addSubview(brainSubLB4)
            
            brainBTN4 = UIButton(frame: CGRect(x: 30, y: brainSubLB4.frame.maxY + 5, width: 130, height: 32))
            brainBTN4.setTitle("바로가기", for: .normal)
            brainBTN4.backgroundColor = #colorLiteral(red: 0.9241898656, green: 0.6377926469, blue: 0.1878951788, alpha: 1)
            
            brainBTN4.titleEdgeInsets = UIEdgeInsets(top: 0, left: -18, bottom: 0, right: 0)
            
            let envelopeView4 = UIImageView(frame: CGRect(x: 99, y: 8, width: 17, height: 17))
             let image4 = UIImage(named: "rightImage")
            
            envelopeView4.image = image4
            envelopeView4.contentMode = .scaleAspectFit
//            var viewLeft: UIView = UIView(frame: CGRectMake(20, 0, 40, 30))// set per your requirement
            brainBTN4.addSubview(envelopeView4)
            
            brainBTN4.setTitleColor(.white, for: .normal)
            brainBTN4.layer.cornerRadius = 16
//            brainBTN4.layer.borderWidth = 1
            brainBTN4.addTarget(self, action: #selector(goTreatmentOfStroke(_ :)), for: .touchUpInside)
            brainView4.addSubview(brainBTN4)
            
            brainImage4 = UIImageView(frame: CGRect(x: brainView4.frame.maxX - 110, y: brainView4.frame.size.height / 3.4, width: 50, height: 53))
            brainImage4.image = UIImage(named: "go4")
            brainView4.addSubview(brainImage4)
        } else if IS_IPHONE_N_PLUS {
            
            
            brainView1 = UIView(frame: CGRect(x: 20, y: brainLabel1.frame.maxY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 4.5))
            brainView1.layer.borderWidth = 1
            brainView1.backgroundColor = #colorLiteral(red: 0.952888906, green: 0.9678936601, blue: 1, alpha: 1)
            brainView1.layer.borderColor = UIColor(red: 167.0/255.0, green: 186.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
            brainView1.roundCorners(topLeft: 8, topRight: 8, bottomLeft: 8, bottomRight: 24)
            
            let borderLayer1 = CAShapeLayer()
            borderLayer1.path = (brainView1.layer.mask! as! CAShapeLayer).path! // Reuse the Bezier path
            //            borderLayer1.strokeColor = UIColor.black.cgColor
            borderLayer1.strokeColor = UIColor(red: 167.0/255.0, green: 186.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
            borderLayer1.fillColor = UIColor.clear.cgColor
            //            borderLayer1.fillColor = UIColor(red: 167.0/255.0, green: 186.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
            borderLayer1.lineWidth = 2
            borderLayer1.frame = brainView1.bounds
            brainView1.layer.addSublayer(borderLayer1)
            
            brainButtonBackView.addSubview(brainView1)
            
            brainLB1 = UILabel(frame: CGRect(x: 20, y: 26, width: self.view.frame.size.width - 60, height: 22))
            brainLB1.text = "급성기 뇌졸증"
            //            brainLB1.font = UIFont.systemFont(ofSize: 22)
            brainLB1.font = UIFont(name: "SUITE-Heavy", size: 22)
            brainLB1.font = UIFont(name: "SUITE-SemiBold", size: 21)
            brainLB1.textColor = #colorLiteral(red: 0.1970121264, green: 0.3326128721, blue: 0.6067818403, alpha: 1)
            brainView1.addSubview(brainLB1)
            
            brainSubLB1 = UILabel(frame: CGRect(x: 20, y: brainLB1.frame.maxY + 5, width: self.view.frame.size.width - 60, height: 50))
            brainSubLB1.text = "뇌졸중은 중풍이라고 불리는\n뇌혈관 질환입니다."
            brainSubLB1.numberOfLines = 0
            brainSubLB1.font = UIFont.systemFont(ofSize: 12)
            brainSubLB1.font = UIFont(name: "SUITE-Regular", size: 12)
            brainView1.addSubview(brainSubLB1)
            
            brainBTN1 = UIButton(frame: CGRect(x: 20, y: brainSubLB1.frame.maxY + 5, width: 120, height: 28))
            brainBTN1.setTitle("바로가기", for: .normal)
            brainBTN1.setTitleColor(.white, for: .normal)
            brainBTN1.backgroundColor = #colorLiteral(red: 0.1970121264, green: 0.3326128721, blue: 0.6067818403, alpha: 1)
            
            brainBTN1.titleEdgeInsets = UIEdgeInsets(top: 0, left: -18, bottom: 0, right: 0)
            
            let envelopeView = UIImageView(frame: CGRect(x: 94, y: 6, width: 17, height: 17))
             let image = UIImage(named: "rightImage")
            
            envelopeView.image = image
            envelopeView.contentMode = .scaleAspectFit
//            var viewLeft: UIView = UIView(frame: CGRectMake(20, 0, 40, 30))// set per your requirement
            brainBTN1.addSubview(envelopeView)
            
            brainBTN1.layer.cornerRadius = 12
            //            brainBTN1.layer.borderWidth = 1
            brainBTN1.addTarget(self, action: #selector(goStroke(_ :)), for: .touchUpInside)
            brainView1.addSubview(brainBTN1)
            
            brainImage = UIImageView(frame: CGRect(x: brainView1.frame.maxX - 97, y: brainView1.frame.size.height / 3.2, width: 50, height: 55))
            brainImage.image = UIImage(named: "go1")
            brainView1.addSubview(brainImage)
            
            
            brainView2 = UIView(frame: CGRect(x: 20, y: brainView1.frame.maxY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 4.5))
            brainView2.layer.borderWidth = 1
            brainView2.backgroundColor = #colorLiteral(red: 0.9770591855, green: 0.9520680308, blue: 0.9982358813, alpha: 1)
            brainView2.layer.borderColor = UIColor(red: 194.0/255.0, green: 164.0/255.0, blue: 224.0/255.0, alpha: 1.0).cgColor
            
            brainView2.roundCorners(topLeft: 8, topRight: 8, bottomLeft: 8, bottomRight: 24)
            
            let borderLayer2 = CAShapeLayer()
            borderLayer2.path = (brainView2.layer.mask! as! CAShapeLayer).path! // Reuse the Bezier path
            //            borderLayer2.strokeColor = UIColor.black.cgColor
            borderLayer2.fillColor = UIColor.clear.cgColor
            borderLayer2.strokeColor = UIColor(red: 194.0/255.0, green: 164.0/255.0, blue: 224.0/255.0, alpha: 1.0).cgColor
            //            borderLayer2.fillColor = UIColor(red: 194.0/255.0, green: 164.0/255.0, blue: 224.0/255.0, alpha: 1.0).cgColor
            borderLayer2.lineWidth = 2
            borderLayer2.frame = brainView2.bounds
            brainView2.layer.addSublayer(borderLayer2)
            
            brainButtonBackView.addSubview(brainView2)
            
            brainLB2 = UILabel(frame: CGRect(x: 20, y: 26, width: self.view.frame.size.width - 60, height: 22))
            brainLB2.text = "위험인자"
            //            brainLB2.font = UIFont.systemFont(ofSize: 22)
            brainLB2.font = UIFont(name: "SUITE-Heavy", size: 22)
            brainLB2.font = UIFont(name: "SUITE-SemiBold", size: 21)
            brainLB2.textColor = #colorLiteral(red: 0.5486581326, green: 0.3868186474, blue: 0.7095668912, alpha: 1)
            brainView2.addSubview(brainLB2)
            
            brainSubLB2 = UILabel(frame: CGRect(x: 20, y: brainLB2.frame.maxY + 5, width: self.view.frame.size.width - 60, height: 50))
            brainSubLB2.text = "뇌졸중 환자들은 다양한 뇌졸중 위험인자를 갖게\n됩니다. 위험인자에대해 자세히 알아볼까요?"
            brainSubLB2.numberOfLines = 0
            brainSubLB2.font = UIFont.systemFont(ofSize: 12)
            brainSubLB2.font = UIFont(name: "SUITE-Regular", size: 12)
            brainView2.addSubview(brainSubLB2)
            
            brainBTN2 = UIButton(frame: CGRect(x: 25, y: brainSubLB2.frame.maxY + 5, width: 120, height: 28))
            brainBTN2.setTitle("바로가기", for: .normal)
            brainBTN2.backgroundColor = #colorLiteral(red: 0.5486581326, green: 0.3868186474, blue: 0.7095668912, alpha: 1)
            brainBTN2.setTitleColor(.white, for: .normal)
            
            brainBTN2.titleEdgeInsets = UIEdgeInsets(top: 0, left: -18, bottom: 0, right: 0)
            
            let envelopeView2 = UIImageView(frame: CGRect(x: 94, y: 6, width: 17, height: 17))
             let image2 = UIImage(named: "rightImage")
            
            envelopeView2.image = image2
            envelopeView2.contentMode = .scaleAspectFit
//            var viewLeft: UIView = UIView(frame: CGRectMake(20, 0, 40, 30))// set per your requirement
            brainBTN2.addSubview(envelopeView2)
            
            brainBTN2.layer.cornerRadius = 12
            //            brainBTN2.layer.borderWidth = 1
            brainBTN2.addTarget(self, action: #selector(goRiskFactors(_ :)), for: .touchUpInside)
            brainView2.addSubview(brainBTN2)
            
            brainImage2 = UIImageView(frame: CGRect(x: brainView2.frame.maxX - 97, y: brainView2.frame.size.height / 3.2, width: 50, height: 55))
            brainImage2.image = UIImage(named: "go2")
            brainView2.addSubview(brainImage2)
            
            
            
            brainView3 = UIView(frame: CGRect(x: 20, y: brainView2.frame.maxY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 4.5))
            brainView3.layer.borderWidth = 1
            brainView3.backgroundColor = #colorLiteral(red: 0.9521439672, green: 1, blue: 0.9879009128, alpha: 1)
            brainView3.layer.borderColor = UIColor(red: 140.0/255.0, green: 200.0/255.0, blue: 185.0/255.0, alpha: 1.0).cgColor
            brainView3.roundCorners(topLeft: 8, topRight: 8, bottomLeft: 8, bottomRight: 24)
            
            
            
            
            let borderLayer3 = CAShapeLayer()
            borderLayer3.path = (brainView3.layer.mask! as! CAShapeLayer).path! // Reuse the Bezier path
            borderLayer3.strokeColor = UIColor(red: 140.0/255.0, green: 200.0/255.0, blue: 185.0/255.0, alpha: 1.0).cgColor
            //            borderLayer3.fillColor = UIColor(red: 140.0/255.0, green: 200.0/255.0, blue: 185.0/255.0, alpha: 1.0).cgColor
            //            borderLayer3.strokeColor = UIColor.black.cgColor
            borderLayer3.fillColor = UIColor.clear.cgColor
            borderLayer3.lineWidth = 2
            borderLayer3.frame = brainView3.bounds
            brainView3.layer.addSublayer(borderLayer3)
            
            brainButtonBackView.addSubview(brainView3)
            
            brainLB3 = UILabel(frame: CGRect(x: 20, y: 26, width: self.view.frame.size.width - 60, height: 22))
            brainLB3.text = "응급처치"
            brainLB3.textColor = #colorLiteral(red: 0.3004111648, green: 0.6361213923, blue: 0.5539721847, alpha: 1)
            //            brainLB3.font = UIFont.systemFont(ofSize: 22)
            brainLB3.font = UIFont(name: "SUITE-Heavy", size: 22)
            brainLB3.font = UIFont(name: "SUITE-SemiBold", size: 21)
            brainView3.addSubview(brainLB3)
            
            brainSubLB3 = UILabel(frame: CGRect(x: 20, y: brainLB3.frame.maxY + 5, width: self.view.frame.size.width - 60, height: 50))
            brainSubLB3.text = "뇌졸중의 응급처치는 어떻게 할까요?"
            brainSubLB3.numberOfLines = 0
            brainSubLB3.font = UIFont.systemFont(ofSize: 12)
            brainSubLB3.font = UIFont(name: "SUITE-Regular", size: 12)
            brainView3.addSubview(brainSubLB3)
            
            brainBTN3 = UIButton(frame: CGRect(x: 25, y: brainSubLB3.frame.maxY + 5, width: 120, height: 28))
            brainBTN3.setTitle("바로가기", for: .normal)
            brainBTN3.backgroundColor = #colorLiteral(red: 0.3004111648, green: 0.6361213923, blue: 0.5539721847, alpha: 1)
            
            
            brainBTN3.titleEdgeInsets = UIEdgeInsets(top: 0, left: -18, bottom: 0, right: 0)
            
            let envelopeView3 = UIImageView(frame: CGRect(x: 94, y: 6, width: 17, height: 17))
             let image3 = UIImage(named: "rightImage")
            
            envelopeView3.image = image3
            envelopeView3.contentMode = .scaleAspectFit
//            var viewLeft: UIView = UIView(frame: CGRectMake(20, 0, 40, 30))// set per your requirement
            brainBTN3.addSubview(envelopeView3)
            
            brainBTN3.setTitleColor(.white, for: .normal)
            brainBTN3.layer.cornerRadius = 12
            //            brainBTN3.layer.borderWidth = 1
            brainBTN3.addTarget(self, action: #selector(goFirstAid(_ :)), for: .touchUpInside)
            brainView3.addSubview(brainBTN3)
            
            brainImage3 = UIImageView(frame: CGRect(x: brainView3.frame.maxX - 97, y: brainView3.frame.size.height / 3.2, width: 50, height: 55))
            brainImage3.image = UIImage(named: "go3")
            brainView3.addSubview(brainImage3)
            
            brainView4 = UIView(frame: CGRect(x: 20, y: brainView3.frame.maxY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 4.5))
            brainView4.layer.borderWidth = 1
            brainView4.backgroundColor = #colorLiteral(red: 0.9999601245, green: 0.9854144454, blue: 0.93028754, alpha: 1)
            brainView4.layer.borderColor = UIColor(red: 218.0/255.0, green: 200.0/255.0, blue: 137.0/255.0, alpha: 1.0).cgColor
            brainView4.roundCorners(topLeft: 8, topRight: 8, bottomLeft: 8, bottomRight: 24)
            
            let borderLayer4 = CAShapeLayer()
            borderLayer4.path = (brainView4.layer.mask! as! CAShapeLayer).path! // Reuse the Bezier path
            borderLayer4.strokeColor = UIColor(red: 218.0/255.0, green: 200.0/255.0, blue: 137.0/255.0, alpha: 1.0).cgColor
            //            borderLayer4.fillColor = UIColor(red: 218.0/255.0, green: 200.0/255.0, blue: 137.0/255.0, alpha: 1.0).cgColor
            //            borderLayer4.strokeColor = UIColor.black.cgColor
            borderLayer4.fillColor = UIColor.clear.cgColor
            borderLayer4.lineWidth = 2
            borderLayer4.frame = brainView4.bounds
            brainView4.layer.addSublayer(borderLayer4)
            
            brainButtonBackView.addSubview(brainView4)
            
            brainLB4 = UILabel(frame: CGRect(x: 20, y: 26, width: self.view.frame.size.width - 60, height: 22))
            brainLB4.text = "뇌졸중의 치료"
            brainLB4.textColor = #colorLiteral(red: 0.8475571275, green: 0.3171732128, blue: 0.0007351766108, alpha: 1)
            //            brainLB4.font = UIFont.systemFont(ofSize: 22)
            brainLB4.font = UIFont(name: "SUITE-Heavy", size: 22)
            brainLB4.font = UIFont(name: "SUITE-SemiBold", size: 21)
            brainView4.addSubview(brainLB4)
            
            brainSubLB4 = UILabel(frame: CGRect(x: 20, y: brainLB4.frame.maxY + 5, width: self.view.frame.size.width - 60, height: 50))
            brainSubLB4.text = "뇌졸중의 치료에 있어\n가장 중요한 것은 시간입니다."
            brainSubLB4.numberOfLines = 0
            brainSubLB4.font = UIFont.systemFont(ofSize: 12)
            brainSubLB4.font = UIFont(name: "SUITE-Regular", size: 12)
            brainView4.addSubview(brainSubLB4)
            
            brainBTN4 = UIButton(frame: CGRect(x: 25, y: brainSubLB4.frame.maxY + 5, width: 120, height: 28))
            brainBTN4.setTitle("바로가기", for: .normal)
            brainBTN4.backgroundColor = #colorLiteral(red: 0.9241898656, green: 0.6377926469, blue: 0.1878951788, alpha: 1)
            
            
            brainBTN4.titleEdgeInsets = UIEdgeInsets(top: 0, left: -18, bottom: 0, right: 0)
            
            let envelopeView4 = UIImageView(frame: CGRect(x: 94, y: 6, width: 17, height: 17))
             let image4 = UIImage(named: "rightImage")
            
            envelopeView4.image = image4
            envelopeView4.contentMode = .scaleAspectFit
//            var viewLeft: UIView = UIView(frame: CGRectMake(20, 0, 40, 30))// set per your requirement
            brainBTN4.addSubview(envelopeView4)
            
            brainBTN4.setTitleColor(.white, for: .normal)
            brainBTN4.layer.cornerRadius = 12
            //            brainBTN4.layer.borderWidth = 1
            brainBTN4.addTarget(self, action: #selector(goTreatmentOfStroke(_ :)), for: .touchUpInside)
            brainView4.addSubview(brainBTN4)
            
            brainImage4 = UIImageView(frame: CGRect(x: brainView4.frame.maxX - 97, y: brainView4.frame.size.height / 3.2, width: 50, height: 55))
            brainImage4.image = UIImage(named: "go4")
            brainView4.addSubview(brainImage4)
        } 
//        else if IS_IPHONE_X {
//            
//            
//            brainView1 = UIView(frame: CGRect(x: 20, y: brainLabel1.frame.maxY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 4.5))
//            brainView1.layer.borderWidth = 1
//            brainView1.backgroundColor = #colorLiteral(red: 0.952888906, green: 0.9678936601, blue: 1, alpha: 1)
//            brainView1.layer.borderColor = UIColor(red: 167.0/255.0, green: 186.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
//            brainView1.roundCorners(topLeft: 8, topRight: 8, bottomLeft: 8, bottomRight: 24)
//            
//            //            let borderLayer1 = CAShapeLayer()
//            //            borderLayer1.path = (brainView1.layer.mask! as! CAShapeLayer).path! // Reuse the Bezier path
//            //            borderLayer1.strokeColor = UIColor.black.cgColor
//            //            borderLayer1.fillColor = UIColor.clear.cgColor
//            //            borderLayer1.lineWidth = 2
//            //            borderLayer1.frame = brainView1.bounds
//            //            brainView1.layer.addSublayer(borderLayer1)
//            let borderLayer1 = CAShapeLayer()
//            borderLayer1.path = (brainView1.layer.mask! as! CAShapeLayer).path! // Reuse the Bezier path
//            //            borderLayer1.strokeColor = UIColor.black.cgColor
//            borderLayer1.strokeColor = UIColor(red: 167.0/255.0, green: 186.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
//            borderLayer1.fillColor = UIColor.clear.cgColor
//            //            borderLayer1.fillColor = UIColor(red: 167.0/255.0, green: 186.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
//            borderLayer1.lineWidth = 2
//            borderLayer1.frame = brainView1.bounds
//            brainView1.layer.addSublayer(borderLayer1)
//            
//            brainButtonBackView.addSubview(brainView1)
//            
//            brainLB1 = UILabel(frame: CGRect(x: 15, y: 26, width: self.view.frame.size.width - 60, height: 22))
//            brainLB1.text = "급성기 뇌졸증"
//            brainLB1.textColor = #colorLiteral(red: 0.1970121264, green: 0.3326128721, blue: 0.6067818403, alpha: 1)
//            //            brainLB1.font = UIFont.systemFont(ofSize: 22)
//            brainLB1.font = UIFont(name: "SUITE-Heavy", size: 22)
//            brainLB1.font = UIFont(name: "SUITE-SemiBold", size: 20)
//            brainView1.addSubview(brainLB1)
//            
//            brainSubLB1 = UILabel(frame: CGRect(x: 15, y: brainLB1.frame.maxY + 5, width: self.view.frame.size.width - 60, height: 50))
//            brainSubLB1.text = "뇌졸중은 중풍이라고 불리는\n뇌혈관 질환입니다."
//            brainSubLB1.numberOfLines = 0
//            brainSubLB1.font = UIFont.systemFont(ofSize: 13)
//            brainSubLB1.font = UIFont(name: "SUITE-Regular", size: 13)
//            brainView1.addSubview(brainSubLB1)
//            
//            brainBTN1 = UIButton(frame: CGRect(x: 20, y: brainSubLB1.frame.maxY + 20, width: 100, height: 25))
//            brainBTN1.setTitle("바로가기", for: .normal)
//            brainBTN1.setTitleColor(.white, for: .normal)
//            brainBTN1.backgroundColor = #colorLiteral(red: 0.1970121264, green: 0.3326128721, blue: 0.6067818403, alpha: 1)
//            
//            
//            
//            
//            //            #colorLiteral(red: 0.8586720824, green: 0.8926048875, blue: 0.9603921771, alpha: 1)
//            brainBTN1.layer.cornerRadius = 12
//            brainBTN1.layer.borderWidth = 1
//            brainBTN1.layer.borderColor = UIColor(red:167/255, green:186/255, blue:223/255, alpha: 1).cgColor
//            brainBTN1.addTarget(self, action: #selector(goStroke(_ :)), for: .touchUpInside)
//            brainView1.addSubview(brainBTN1)
//            
//            brainImage = UIImageView(frame: CGRect(x: brainView1.frame.maxX - 94, y: brainView1.frame.size.height / 3.2, width: 52, height: 63))
//            brainImage.image = UIImage(named: "go1")
//            brainView1.addSubview(brainImage)
//            
//            
//            brainView2 = UIView(frame: CGRect(x: 20, y: brainView1.frame.maxY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 4.5))
//            brainView2.layer.borderWidth = 1
//            brainView2.backgroundColor = #colorLiteral(red: 0.9770591855, green: 0.9520680308, blue: 0.9982358813, alpha: 1)
//            brainView2.layer.borderColor = UIColor(red: 194.0/255.0, green: 164.0/255.0, blue: 224.0/255.0, alpha: 1.0).cgColor
//            
//            brainView2.roundCorners(topLeft: 8, topRight: 8, bottomLeft: 8, bottomRight: 24)
//            
//            let borderLayer2 = CAShapeLayer()
//            borderLayer2.path = (brainView2.layer.mask! as! CAShapeLayer).path! // Reuse the Bezier path
//            //            borderLayer2.strokeColor = UIColor.black.cgColor
//            borderLayer2.fillColor = UIColor.clear.cgColor
//            borderLayer2.strokeColor = UIColor(red: 194.0/255.0, green: 164.0/255.0, blue: 224.0/255.0, alpha: 1.0).cgColor
//            //            borderLayer2.fillColor = UIColor(red: 194.0/255.0, green: 164.0/255.0, blue: 224.0/255.0, alpha: 1.0).cgColor
//            borderLayer2.lineWidth = 2
//            borderLayer2.frame = brainView2.bounds
//            brainView2.layer.addSublayer(borderLayer2)
//            brainButtonBackView.addSubview(brainView2)
//            
//            brainLB2 = UILabel(frame: CGRect(x: 15, y: 26, width: self.view.frame.size.width - 60, height: 22))
//            brainLB2.text = "위험인자"
//            brainLB2.textColor = #colorLiteral(red: 0.5486581326, green: 0.3868186474, blue: 0.7095668912, alpha: 1)
//            //            brainLB2.font = UIFont.systemFont(ofSize: 22)
//            brainLB2.font = UIFont(name: "SUITE-Heavy", size: 22)
//            brainLB2.font = UIFont(name: "SUITE-SemiBold", size: 20)
//            brainView2.addSubview(brainLB2)
//            
//            brainSubLB2 = UILabel(frame: CGRect(x: 15, y: brainLB2.frame.maxY + 5, width: self.view.frame.size.width - 60, height: 50))
//            brainSubLB2.text = "뇌졸중 환자들은 다양한 뇌졸중 위험인자를 갖게\n됩니다. 위험인자에대해 자세히 알아볼까요?"
//            brainSubLB2.numberOfLines = 0
//            brainSubLB2.font = UIFont.systemFont(ofSize: 13)
//            brainSubLB2.font = UIFont(name: "SUITE-Regular", size: 13)
//            brainView2.addSubview(brainSubLB2)
//            
//            brainBTN2 = UIButton(frame: CGRect(x: 25, y: brainSubLB2.frame.maxY + 20, width: 100, height: 25))
//            brainBTN2.setTitle("바로가기", for: .normal)
//            brainBTN2.backgroundColor = #colorLiteral(red: 0.5486581326, green: 0.3868186474, blue: 0.7095668912, alpha: 1)
//            
//            
//            
//            //
//            brainBTN2.setTitleColor(.white, for: .normal)
//            brainBTN2.layer.cornerRadius = 12
//            brainBTN2.layer.borderWidth = 1
//            brainBTN2.addTarget(self, action: #selector(goRiskFactors(_ :)), for: .touchUpInside)
//            brainView2.addSubview(brainBTN2)
//            
//            brainImage2 = UIImageView(frame: CGRect(x: brainView2.frame.maxX - 94, y: brainView2.frame.size.height / 3.2, width: 52, height: 63))
//            brainImage2.image = UIImage(named: "go2")
//            brainView2.addSubview(brainImage2)
//            
//            
//            
//            brainView3 = UIView(frame: CGRect(x: 20, y: brainView2.frame.maxY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 4.5))
//            brainView3.layer.borderWidth = 1
//            brainView3.backgroundColor = #colorLiteral(red: 0.9521439672, green: 1, blue: 0.9879009128, alpha: 1)
//            brainView3.layer.borderColor = UIColor(red: 140.0/255.0, green: 200.0/255.0, blue: 185.0/255.0, alpha: 1.0).cgColor
//            
//            brainView3.roundCorners(topLeft: 8, topRight: 8, bottomLeft: 8, bottomRight: 24)
//            
//            let borderLayer3 = CAShapeLayer()
//            borderLayer3.path = (brainView3.layer.mask! as! CAShapeLayer).path! // Reuse the Bezier path
//            borderLayer3.strokeColor = UIColor(red: 140.0/255.0, green: 200.0/255.0, blue: 185.0/255.0, alpha: 1.0).cgColor
//            //            borderLayer3.fillColor = UIColor(red: 140.0/255.0, green: 200.0/255.0, blue: 185.0/255.0, alpha: 1.0).cgColor
//            //            borderLayer3.strokeColor = UIColor.black.cgColor
//            borderLayer3.fillColor = UIColor.clear.cgColor
//            borderLayer3.lineWidth = 2
//            borderLayer3.frame = brainView3.bounds
//            brainView3.layer.addSublayer(borderLayer3)
//            
//            brainButtonBackView.addSubview(brainView3)
//            
//            brainLB3 = UILabel(frame: CGRect(x: 15, y: 26, width: self.view.frame.size.width - 60, height: 22))
//            brainLB3.text = "응급처치"
//            brainLB3.textColor = #colorLiteral(red: 0.3004111648, green: 0.6361213923, blue: 0.5539721847, alpha: 1)
//            //            brainLB3.font = UIFont.systemFont(ofSize: 22)
//            brainLB3.font = UIFont(name: "SUITE-Heavy", size: 22)
//            brainLB3.font = UIFont(name: "SUITE-SemiBold", size: 20)
//            brainView3.addSubview(brainLB3)
//            
//            brainSubLB3 = UILabel(frame: CGRect(x: 15, y: brainLB3.frame.maxY + 5, width: self.view.frame.size.width - 60, height: 50))
//            brainSubLB3.text = "뇌졸중의 응급처치는 어떻게 할까요?"
//            brainSubLB3.numberOfLines = 0
//            brainSubLB3.font = UIFont.systemFont(ofSize: 13)
//            brainSubLB3.font = UIFont(name: "SUITE-Regular", size: 13)
//            brainView3.addSubview(brainSubLB3)
//            
//            brainBTN3 = UIButton(frame: CGRect(x: 25, y: brainSubLB3.frame.maxY + 20, width: 100, height: 25))
//            brainBTN3.setTitle("바로가기", for: .normal)
//            brainBTN3.backgroundColor = #colorLiteral(red: 0.3004111648, green: 0.6361213923, blue: 0.5539721847, alpha: 1)
//            
//            
//            
//            brainBTN3.setTitleColor(.white, for: .normal)
//            brainBTN3.layer.cornerRadius = 12
//            brainBTN3.layer.borderWidth = 1
//            brainBTN3.addTarget(self, action: #selector(goFirstAid(_ :)), for: .touchUpInside)
//            brainView3.addSubview(brainBTN3)
//            
//            brainImage3 = UIImageView(frame: CGRect(x: brainView3.frame.maxX - 94, y: brainView3.frame.size.height / 3.2, width: 52, height: 63))
//            brainImage3.image = UIImage(named: "go3")
//            brainView3.addSubview(brainImage3)
//            
//            brainView4 = UIView(frame: CGRect(x: 20, y: brainView3.frame.maxY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 4.5))
//            brainView4.layer.borderWidth = 2
//            brainView4.backgroundColor = #colorLiteral(red: 0.9999601245, green: 0.9854144454, blue: 0.93028754, alpha: 1)
//            brainView4.layer.borderColor = UIColor(red: 218.0/255.0, green: 200.0/255.0, blue: 137.0/255.0, alpha: 1.0).cgColor
//            
//            
//            brainView4.roundCorners(topLeft: 8, topRight: 8, bottomLeft: 8, bottomRight: 24)
//            
//            let borderLayer4 = CAShapeLayer()
//            borderLayer4.path = (brainView4.layer.mask! as! CAShapeLayer).path! // Reuse the Bezier path
//            borderLayer4.strokeColor = UIColor(red: 218.0/255.0, green: 200.0/255.0, blue: 137.0/255.0, alpha: 1.0).cgColor
//            //            borderLayer4.fillColor = UIColor(red: 218.0/255.0, green: 200.0/255.0, blue: 137.0/255.0, alpha: 1.0).cgColor
//            //            borderLayer4.strokeColor = UIColor.black.cgColor
//            borderLayer4.fillColor = UIColor.clear.cgColor
//            borderLayer4.lineWidth = 2
//            borderLayer4.frame = brainView4.bounds
//            brainView4.layer.addSublayer(borderLayer4)
//            
//            brainButtonBackView.addSubview(brainView4)
//            
//            brainLB4 = UILabel(frame: CGRect(x: 15, y: 26, width: self.view.frame.size.width - 60, height: 22))
//            brainLB4.text = "뇌졸중의 치료"
//            brainLB4.textColor = #colorLiteral(red: 0.8475571275, green: 0.3171732128, blue: 0.0007351766108, alpha: 1)
//            //            brainLB4.font = UIFont.systemFont(ofSize: 22)
//            brainLB4.font = UIFont(name: "SUITE-Heavy", size: 22)
//            brainLB4.font = UIFont(name: "SUITE-SemiBold", size: 20)
//            brainView4.addSubview(brainLB4)
//            
//            brainSubLB4 = UILabel(frame: CGRect(x: 15, y: brainLB4.frame.maxY + 5, width: self.view.frame.size.width - 60, height: 50))
//            brainSubLB4.text = "뇌졸중의 치료에 있어\n가장 중요한 것은 시간입니다."
//            brainSubLB4.numberOfLines = 0
//            brainSubLB4.font = UIFont.systemFont(ofSize: 13)
//            brainSubLB4.font = UIFont(name: "SUITE-Regular", size: 13)
//            brainView4.addSubview(brainSubLB4)
//            
//            brainBTN4 = UIButton(frame: CGRect(x: 25, y: brainSubLB4.frame.maxY + 20, width: 100, height: 25))
//            brainBTN4.setTitle("바로가기", for: .normal)
//            brainBTN4.backgroundColor = #colorLiteral(red: 0.9241898656, green: 0.6377926469, blue: 0.1878951788, alpha: 1)
//            
//            
//            brainBTN4.setTitleColor(.white, for: .normal)
//            brainBTN4.layer.cornerRadius = 12
//            brainBTN4.layer.borderWidth = 1
//            brainBTN4.addTarget(self, action: #selector(goTreatmentOfStroke(_ :)), for: .touchUpInside)
//            brainView4.addSubview(brainBTN4)
//            
//            brainImage4 = UIImageView(frame: CGRect(x: brainView4.frame.maxX - 94, y: brainView4.frame.size.height / 3.2, width: 52, height: 63))
//            brainImage4.image = UIImage(named: "go4")
//            brainView4.addSubview(brainImage4)
//        }
        else if IS_IPHONE_12PRO {
            
            brainView1 = UIView(frame: CGRect(x: 20, y: brainLabel1.frame.maxY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 5.8))
            brainView1.layer.borderWidth = 1
            brainView1.backgroundColor = #colorLiteral(red: 0.952888906, green: 0.9678936601, blue: 1, alpha: 1)
            brainView1.layer.borderColor = UIColor(red: 167.0/255.0, green: 186.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
            brainView1.roundCorners(topLeft: 8, topRight: 8, bottomLeft: 8, bottomRight: 24)
            
            //            let borderLayer1 = CAShapeLayer()
            //            borderLayer1.path = (brainView1.layer.mask! as! CAShapeLayer).path! // Reuse the Bezier path
            //            borderLayer1.strokeColor = UIColor.black.cgColor
            //            borderLayer1.fillColor = UIColor.clear.cgColor
            //            borderLayer1.lineWidth = 2
            //            borderLayer1.frame = brainView1.bounds
            //            brainView1.layer.addSublayer(borderLayer1)
            let borderLayer1 = CAShapeLayer()
            borderLayer1.path = (brainView1.layer.mask! as! CAShapeLayer).path! // Reuse the Bezier path
            //            borderLayer1.strokeColor = UIColor.black.cgColor
            borderLayer1.strokeColor = UIColor(red: 167.0/255.0, green: 186.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
            borderLayer1.fillColor = UIColor.clear.cgColor
            //            borderLayer1.fillColor = UIColor(red: 167.0/255.0, green: 186.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
            borderLayer1.lineWidth = 2
            borderLayer1.frame = brainView1.bounds
            brainView1.layer.addSublayer(borderLayer1)
            
            brainButtonBackView.addSubview(brainView1)
            
            brainLB1 = UILabel(frame: CGRect(x: 30, y: 14, width: self.view.frame.size.width - 60, height: 20))
            brainLB1.text = "급성기 뇌졸증"
            brainLB1.textColor = #colorLiteral(red: 0.1970121264, green: 0.3326128721, blue: 0.6067818403, alpha: 1)
            brainLB1.font = UIFont(name: "SUITE-Heavy", size: 22)
            //        brainLB1.font = UIFont.systemFont(ofSize: 22)
            brainLB1.font = UIFont(name: "SUITE-SemiBold", size: 20)
            brainView1.addSubview(brainLB1)
            
            brainSubLB1 = UILabel(frame: CGRect(x: 30, y: brainLB1.frame.maxY + 5, width: self.view.frame.size.width - 60, height: 54))
            brainSubLB1.text = "뇌졸중은 중풍이라고 불리는\n뇌혈관 질환입니다."
            brainSubLB1.numberOfLines = 0
            brainSubLB1.font = UIFont.systemFont(ofSize: 12)
            brainSubLB1.font = UIFont(name: "SUITE-Regular", size: 13)
            brainView1.addSubview(brainSubLB1)
            
            brainBTN1 = UIButton(frame: CGRect(x: 30, y: brainSubLB1.frame.maxY + 10, width: 100, height: 25))
            brainBTN1.setTitle("바로가기", for: .normal)
            brainBTN1.setTitleColor(.white, for: .normal)
            
            brainBTN1.titleEdgeInsets = UIEdgeInsets(top: 0, left: -18, bottom: 0, right: 0)
            
            let envelopeView = UIImageView(frame: CGRect(x: 76, y: 4, width: 17, height: 17))
             let image = UIImage(named: "rightImage")
            
            envelopeView.image = image
            envelopeView.contentMode = .scaleAspectFit
//            var viewLeft: UIView = UIView(frame: CGRectMake(20, 0, 40, 30))// set per your requirement
            brainBTN1.addSubview(envelopeView)
            
            brainBTN1.backgroundColor = #colorLiteral(red: 0.1970121264, green: 0.3326128721, blue: 0.6067818403, alpha: 1)
            brainBTN1.layer.cornerRadius = 12
            
//            brainBTN1.layer.borderWidth = 1
            brainBTN1.addTarget(self, action: #selector(goStroke(_ :)), for: .touchUpInside)
            brainView1.addSubview(brainBTN1)
            
            brainImage = UIImageView(frame: CGRect(x: brainView1.frame.maxX - 115, y: brainView1.frame.size.height / 3.5, width: 60, height: 65))
            brainImage.image = UIImage(named: "go1")
            brainView1.addSubview(brainImage)
            
            
            brainView2 = UIView(frame: CGRect(x: 20, y: brainView1.frame.maxY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 5.8))
            brainView2.layer.borderWidth = 1
            brainView2.backgroundColor = #colorLiteral(red: 0.9770591855, green: 0.9520680308, blue: 0.9982358813, alpha: 1)
            brainView2.layer.borderColor = UIColor(red: 194.0/255.0, green: 164.0/255.0, blue: 224.0/255.0, alpha: 1.0).cgColor
            brainView2.roundCorners(topLeft: 8, topRight: 8, bottomLeft: 8, bottomRight: 24)
            
            let borderLayer2 = CAShapeLayer()
            borderLayer2.path = (brainView2.layer.mask! as! CAShapeLayer).path! // Reuse the Bezier path
            //            borderLayer2.strokeColor = UIColor.black.cgColor
            borderLayer2.fillColor = UIColor.clear.cgColor
            borderLayer2.strokeColor = UIColor(red: 194.0/255.0, green: 164.0/255.0, blue: 224.0/255.0, alpha: 1.0).cgColor
            //            borderLayer2.fillColor = UIColor(red: 194.0/255.0, green: 164.0/255.0, blue: 224.0/255.0, alpha: 1.0).cgColor
            borderLayer2.lineWidth = 2
            borderLayer2.frame = brainView2.bounds
            brainView2.layer.addSublayer(borderLayer2)
            
            brainButtonBackView.addSubview(brainView2)
            
            brainLB2 = UILabel(frame: CGRect(x: 30, y: 14, width: self.view.frame.size.width - 60, height: 20))
            brainLB2.text = "위험인자"
            brainLB2.textColor = #colorLiteral(red: 0.5486581326, green: 0.3868186474, blue: 0.7095668912, alpha: 1)
            //        brainLB2.font = UIFont.systemFont(ofSize: 22)
            brainLB2.font = UIFont(name: "SUITE-Heavy", size: 22)
            brainLB2.font = UIFont(name: "SUITE-SemiBold", size: 20)
            brainView2.addSubview(brainLB2)
            
            brainSubLB2 = UILabel(frame: CGRect(x: 30, y: brainLB2.frame.maxY + 5, width: self.view.frame.size.width - 60, height: 50))
            //            brainSubLB2.text = "뇌졸중 환자들은 다양한 뇌졸중\n위험인자를 갖게 됩니다. 위험인자에대해\n자세히 알아볼까요?"
            brainSubLB2.text = "뇌졸중 환자들은 다양한 뇌졸중\n위험인자를 갖게 됩니다. 위험인자에대해\n자세히 알아볼까요?"
            brainSubLB2.numberOfLines = 0
            brainSubLB2.font = UIFont.systemFont(ofSize: 12)
            brainSubLB2.font = UIFont(name: "SUITE-Regular", size: 13)
            brainView2.addSubview(brainSubLB2)
            
            brainBTN2 = UIButton(frame: CGRect(x: 30, y: brainSubLB2.frame.maxY + 10, width: 100, height: 25))
            brainBTN2.setTitle("바로가기", for: .normal)
            brainBTN2.backgroundColor = #colorLiteral(red: 0.5486581326, green: 0.3868186474, blue: 0.7095668912, alpha: 1)
            
            brainBTN2.titleEdgeInsets = UIEdgeInsets(top: 0, left: -18, bottom: 0, right: 0)
            
            let envelopeView2 = UIImageView(frame: CGRect(x: 76, y: 4, width: 17, height: 17))
             let image2 = UIImage(named: "rightImage")
            
            envelopeView2.image = image2
            envelopeView2.contentMode = .scaleAspectFit
//            var viewLeft: UIView = UIView(frame: CGRectMake(20, 0, 40, 30))// set per your requirement
            brainBTN2.addSubview(envelopeView2)
            
            
            brainBTN2.setTitleColor(.white, for: .normal)
            brainBTN2.layer.cornerRadius = 12
//            brainBTN2.layer.borderWidth = 1
            brainBTN2.addTarget(self, action: #selector(goRiskFactors(_ :)), for: .touchUpInside)
            brainView2.addSubview(brainBTN2)
            
            brainImage2 = UIImageView(frame: CGRect(x: brainView2.frame.maxX - 115, y: brainView2.frame.size.height / 3.5, width: 60, height: 65))
            brainImage2.image = UIImage(named: "go2")
            brainView2.addSubview(brainImage2)
            
            
            
            brainView3 = UIView(frame: CGRect(x: 20, y: brainView2.frame.maxY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 5.8))
            brainView3.layer.borderWidth = 1
            brainView3.backgroundColor = #colorLiteral(red: 0.9521439672, green: 1, blue: 0.9879009128, alpha: 1)
            brainView3.layer.borderColor = UIColor(red: 140.0/255.0, green: 200.0/255.0, blue: 185.0/255.0, alpha: 1.0).cgColor
            brainView3.roundCorners(topLeft: 8, topRight: 8, bottomLeft: 8, bottomRight: 24)
            
            let borderLayer3 = CAShapeLayer()
            borderLayer3.path = (brainView3.layer.mask! as! CAShapeLayer).path! // Reuse the Bezier path
            borderLayer3.strokeColor = UIColor(red: 140.0/255.0, green: 200.0/255.0, blue: 185.0/255.0, alpha: 1.0).cgColor
            //            borderLayer3.fillColor = UIColor(red: 140.0/255.0, green: 200.0/255.0, blue: 185.0/255.0, alpha: 1.0).cgColor
            //            borderLayer3.strokeColor = UIColor.black.cgColor
            borderLayer3.fillColor = UIColor.clear.cgColor
            borderLayer3.lineWidth = 2
            borderLayer3.frame = brainView3.bounds
            brainView3.layer.addSublayer(borderLayer3)
            
            brainButtonBackView.addSubview(brainView3)
            
            brainLB3 = UILabel(frame: CGRect(x: 30, y: 14, width: self.view.frame.size.width - 60, height: 20))
            brainLB3.text = "응급처치"
            brainLB3.textColor = #colorLiteral(red: 0.3004111648, green: 0.6361213923, blue: 0.5539721847, alpha: 1)
            brainLB3.font = UIFont(name: "SUITE-Heavy", size: 22)
            //        brainLB3.font = UIFont.systemFont(ofSize: 22)
            brainLB3.font = UIFont(name: "SUITE-SemiBold", size: 20)
            brainView3.addSubview(brainLB3)
            
            brainSubLB3 = UILabel(frame: CGRect(x: 30, y: brainLB3.frame.maxY + 5, width: self.view.frame.size.width - 60, height: 54))
            brainSubLB3.text = "뇌졸중의 응급처치는 어떻게 할까요?"
            brainSubLB3.numberOfLines = 0
            brainSubLB3.font = UIFont.systemFont(ofSize: 12)
            brainSubLB3.font = UIFont(name: "SUITE-Regular", size: 13)
            brainView3.addSubview(brainSubLB3)
            
            brainBTN3 = UIButton(frame: CGRect(x: 30, y: brainSubLB3.frame.maxY + 10, width: 100, height: 25))
            brainBTN3.setTitle("바로가기", for: .normal)
            brainBTN3.backgroundColor = #colorLiteral(red: 0.3004111648, green: 0.6361213923, blue: 0.5539721847, alpha: 1)
            
            brainBTN3.titleEdgeInsets = UIEdgeInsets(top: 0, left: -18, bottom: 0, right: 0)
            
            let envelopeView3 = UIImageView(frame: CGRect(x: 76, y: 4, width: 17, height: 17))
             let image3 = UIImage(named: "rightImage")
            
            envelopeView3.image = image3
            envelopeView3.contentMode = .scaleAspectFit
//            var viewLeft: UIView = UIView(frame: CGRectMake(20, 0, 40, 30))// set per your requirement
            brainBTN3.addSubview(envelopeView3)
            
            brainBTN3.setTitleColor(.white, for: .normal)
            brainBTN3.layer.cornerRadius = 12
//            brainBTN3.layer.borderWidth = 1
            brainBTN3.addTarget(self, action: #selector(goFirstAid(_ :)), for: .touchUpInside)
            brainView3.addSubview(brainBTN3)
            
            brainImage3 = UIImageView(frame: CGRect(x: brainView3.frame.maxX - 115, y: brainView3.frame.size.height / 3.5, width: 60, height: 65))
            brainImage3.image = UIImage(named: "go3")
            brainView3.addSubview(brainImage3)
            
            brainView4 = UIView(frame: CGRect(x: 20, y: brainView3.frame.maxY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 5.8))
            brainView4.layer.borderWidth = 1
            brainView4.backgroundColor = #colorLiteral(red: 0.9999601245, green: 0.9854144454, blue: 0.93028754, alpha: 1)
            brainView4.layer.borderColor = UIColor(red: 218.0/255.0, green: 200.0/255.0, blue: 137.0/255.0, alpha: 1.0).cgColor
            brainView4.roundCorners(topLeft: 8, topRight: 8, bottomLeft: 8, bottomRight: 24)
            
            
            
            
            let borderLayer4 = CAShapeLayer()
            borderLayer4.path = (brainView4.layer.mask! as! CAShapeLayer).path! // Reuse the Bezier path
            borderLayer4.strokeColor = UIColor(red: 218.0/255.0, green: 200.0/255.0, blue: 137.0/255.0, alpha: 1.0).cgColor
            //            borderLayer4.fillColor = UIColor(red: 218.0/255.0, green: 200.0/255.0, blue: 137.0/255.0, alpha: 1.0).cgColor
            //            borderLayer4.strokeColor = UIColor.black.cgColor
            borderLayer4.fillColor = UIColor.clear.cgColor
            borderLayer4.lineWidth = 2
            borderLayer4.frame = brainView4.bounds
            brainView4.layer.addSublayer(borderLayer4)
            
            brainButtonBackView.addSubview(brainView4)
            
            brainLB4 = UILabel(frame: CGRect(x: 30, y: 14, width: self.view.frame.size.width - 60, height: 20))
            brainLB4.text = "뇌졸중의 치료"
            brainLB4.textColor = #colorLiteral(red: 0.8475571275, green: 0.3171732128, blue: 0.0007351766108, alpha: 1)
            brainLB4.font = UIFont.systemFont(ofSize: 22)
            brainLB4.font = UIFont(name: "SUITE-Heavy", size: 22)
            brainLB4.font = UIFont(name: "SUITE-SemiBold", size: 20)
            brainView4.addSubview(brainLB4)
            
            brainSubLB4 = UILabel(frame: CGRect(x: 30, y: brainLB4.frame.maxY + 5, width: self.view.frame.size.width - 60, height: 54))
            brainSubLB4.text = "뇌졸중의 치료에 있어\n가장 중요한 것은 시간입니다."
            brainSubLB4.numberOfLines = 0
            brainSubLB4.font = UIFont.systemFont(ofSize: 12)
            brainSubLB4.font = UIFont(name: "SUITE-Regular", size: 13)
            brainView4.addSubview(brainSubLB4)
            
            brainBTN4 = UIButton(frame: CGRect(x: 30, y: brainSubLB4.frame.maxY + 10, width: 100, height: 25))
            brainBTN4.setTitle("바로가기", for: .normal)
            brainBTN4.backgroundColor = #colorLiteral(red: 0.9241898656, green: 0.6377926469, blue: 0.1878951788, alpha: 1)
            
            
            brainBTN4.titleEdgeInsets = UIEdgeInsets(top: 0, left: -18, bottom: 0, right: 0)
            
            let envelopeView4 = UIImageView(frame: CGRect(x: 76, y: 4, width: 17, height: 17))
             let image4 = UIImage(named: "rightImage")
            
            envelopeView4.image = image4
            envelopeView4.contentMode = .scaleAspectFit
//            var viewLeft: UIView = UIView(frame: CGRectMake(20, 0, 40, 30))// set per your requirement
            brainBTN4.addSubview(envelopeView4)
            
            brainBTN4.setTitleColor(.white, for: .normal)
            brainBTN4.layer.cornerRadius = 12
//            brainBTN4.layer.borderWidth = 1
            brainBTN4.addTarget(self, action: #selector(goTreatmentOfStroke(_ :)), for: .touchUpInside)
            brainView4.addSubview(brainBTN4)
            
            brainImage4 = UIImageView(frame: CGRect(x: brainView4.frame.maxX - 115, y: brainView4.frame.size.height / 3.5, width: 60, height: 65))
            brainImage4.image = UIImage(named: "go4")
            brainView4.addSubview(brainImage4)
            
            
        } else if IS_IPHONE_15PRO {
            
            brainView1 = UIView(frame: CGRect(x: 20, y: brainLabel1.frame.maxY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 5.8))
            brainView1.layer.borderWidth = 1
            brainView1.backgroundColor = #colorLiteral(red: 0.952888906, green: 0.9678936601, blue: 1, alpha: 1)
            brainView1.layer.borderColor = UIColor(red: 167.0/255.0, green: 186.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
            brainView1.roundCorners(topLeft: 8, topRight: 8, bottomLeft: 8, bottomRight: 24)
            
            //            let borderLayer1 = CAShapeLayer()
            //            borderLayer1.path = (brainView1.layer.mask! as! CAShapeLayer).path! // Reuse the Bezier path
            //            borderLayer1.strokeColor = UIColor.black.cgColor
            //            borderLayer1.fillColor = UIColor.clear.cgColor
            //            borderLayer1.lineWidth = 2
            //            borderLayer1.frame = brainView1.bounds
            //            brainView1.layer.addSublayer(borderLayer1)
            let borderLayer1 = CAShapeLayer()
            borderLayer1.path = (brainView1.layer.mask! as! CAShapeLayer).path! // Reuse the Bezier path
            //            borderLayer1.strokeColor = UIColor.black.cgColor
            borderLayer1.strokeColor = UIColor(red: 167.0/255.0, green: 186.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
            borderLayer1.fillColor = UIColor.clear.cgColor
            //            borderLayer1.fillColor = UIColor(red: 167.0/255.0, green: 186.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
            borderLayer1.lineWidth = 2
            borderLayer1.frame = brainView1.bounds
            brainView1.layer.addSublayer(borderLayer1)
            
            brainButtonBackView.addSubview(brainView1)
            
            brainLB1 = UILabel(frame: CGRect(x: 30, y: 14, width: self.view.frame.size.width - 60, height: 22))
            brainLB1.text = "급성기 뇌졸증"
            brainLB1.textColor = #colorLiteral(red: 0.1970121264, green: 0.3326128721, blue: 0.6067818403, alpha: 1)
            brainLB1.font = UIFont(name: "SUITE-Heavy", size: 22)
            brainLB1.font = UIFont(name: "SUITE-SemiBold", size: 22)
            //        brainLB1.font = UIFont.systemFont(ofSize: 22)
            brainView1.addSubview(brainLB1)
            
            brainSubLB1 = UILabel(frame: CGRect(x: 30, y: brainLB1.frame.maxY + 5, width: self.view.frame.size.width - 60, height: 50))
            brainSubLB1.text = "뇌졸중은 중풍이라고 불리는\n뇌혈관 질환입니다."
            brainSubLB1.numberOfLines = 0
            brainSubLB1.font = UIFont.systemFont(ofSize: 12)
            brainSubLB1.font = UIFont(name: "SUITE-Regular", size: 12)
            brainView1.addSubview(brainSubLB1)
            
            brainBTN1 = UIButton(frame: CGRect(x: 30, y: brainSubLB1.frame.maxY + 10, width: 100, height: 25))
            brainBTN1.setTitle("바로가기", for: .normal)
            brainBTN1.setTitleColor(.white, for: .normal)
            
            brainBTN1.titleEdgeInsets = UIEdgeInsets(top: 0, left: -18, bottom: 0, right: 0)
            
            let envelopeView = UIImageView(frame: CGRect(x: 99, y: 9, width: 17, height: 17))
             let image = UIImage(named: "rightImage")
            
            envelopeView.image = image
            envelopeView.contentMode = .scaleAspectFit
//            var viewLeft: UIView = UIView(frame: CGRectMake(20, 0, 40, 30))// set per your requirement
            brainBTN1.addSubview(envelopeView)
            
            brainBTN1.backgroundColor = #colorLiteral(red: 0.1970121264, green: 0.3326128721, blue: 0.6067818403, alpha: 1)
            brainBTN1.layer.cornerRadius = 12
            
//            brainBTN1.layer.borderWidth = 1
            brainBTN1.addTarget(self, action: #selector(goStroke(_ :)), for: .touchUpInside)
            brainView1.addSubview(brainBTN1)
            
            brainImage = UIImageView(frame: CGRect(x: brainView1.frame.maxX - 115, y: brainView1.frame.size.height / 3.5, width: 60, height: 65))
            brainImage.image = UIImage(named: "go1")
            brainView1.addSubview(brainImage)
            
            
            brainView2 = UIView(frame: CGRect(x: 20, y: brainView1.frame.maxY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 5.8))
            brainView2.layer.borderWidth = 1
            brainView2.backgroundColor = #colorLiteral(red: 0.9770591855, green: 0.9520680308, blue: 0.9982358813, alpha: 1)
            brainView2.layer.borderColor = UIColor(red: 194.0/255.0, green: 164.0/255.0, blue: 224.0/255.0, alpha: 1.0).cgColor
            brainView2.roundCorners(topLeft: 8, topRight: 8, bottomLeft: 8, bottomRight: 24)
            
            let borderLayer2 = CAShapeLayer()
            borderLayer2.path = (brainView2.layer.mask! as! CAShapeLayer).path! // Reuse the Bezier path
            //            borderLayer2.strokeColor = UIColor.black.cgColor
            borderLayer2.fillColor = UIColor.clear.cgColor
            borderLayer2.strokeColor = UIColor(red: 194.0/255.0, green: 164.0/255.0, blue: 224.0/255.0, alpha: 1.0).cgColor
            //            borderLayer2.fillColor = UIColor(red: 194.0/255.0, green: 164.0/255.0, blue: 224.0/255.0, alpha: 1.0).cgColor
            borderLayer2.lineWidth = 2
            borderLayer2.frame = brainView2.bounds
            brainView2.layer.addSublayer(borderLayer2)
            
            brainButtonBackView.addSubview(brainView2)
            
            brainLB2 = UILabel(frame: CGRect(x: 30, y: 14, width: self.view.frame.size.width - 60, height: 22))
            brainLB2.text = "위험인자"
            brainLB2.textColor = #colorLiteral(red: 0.5486581326, green: 0.3868186474, blue: 0.7095668912, alpha: 1)
            //        brainLB2.font = UIFont.systemFont(ofSize: 22)
            brainLB2.font = UIFont(name: "SUITE-Heavy", size: 22)
            brainLB2.font = UIFont(name: "SUITE-SemiBold", size: 22)
            brainView2.addSubview(brainLB2)
            
            brainSubLB2 = UILabel(frame: CGRect(x: 30, y: brainLB2.frame.maxY + 5, width: self.view.frame.size.width - 60, height: 50))
            //            brainSubLB2.text = "뇌졸중 환자들은 다양한 뇌졸중\n위험인자를 갖게 됩니다. 위험인자에대해\n자세히 알아볼까요?"
            brainSubLB2.text = "뇌졸중 환자들은 다양한 뇌졸중\n위험인자를 갖게 됩니다. 위험인자에대해\n자세히 알아볼까요?"
            brainSubLB2.numberOfLines = 0
            brainSubLB2.font = UIFont.systemFont(ofSize: 12)
            brainSubLB2.font = UIFont(name: "SUITE-Regular", size: 12)
            brainView2.addSubview(brainSubLB2)
            
            brainBTN2 = UIButton(frame: CGRect(x: 30, y: brainSubLB2.frame.maxY + 10, width: 100, height: 25))
            brainBTN2.setTitle("바로가기", for: .normal)
            brainBTN2.backgroundColor = #colorLiteral(red: 0.5486581326, green: 0.3868186474, blue: 0.7095668912, alpha: 1)
            
            brainBTN2.titleEdgeInsets = UIEdgeInsets(top: 0, left: -18, bottom: 0, right: 0)
            
            let envelopeView2 = UIImageView(frame: CGRect(x: 76, y: 4, width: 17, height: 17))
             let image2 = UIImage(named: "rightImage")
            
            envelopeView2.image = image
            envelopeView2.contentMode = .scaleAspectFit
//            var viewLeft: UIView = UIView(frame: CGRectMake(20, 0, 40, 30))// set per your requirement
            brainBTN2.addSubview(envelopeView2)
            
            brainBTN2.setTitleColor(.white, for: .normal)
            brainBTN2.layer.cornerRadius = 12
//            brainBTN2.layer.borderWidth = 1
            brainBTN2.addTarget(self, action: #selector(goRiskFactors(_ :)), for: .touchUpInside)
            brainView2.addSubview(brainBTN2)
            
            brainImage2 = UIImageView(frame: CGRect(x: brainView2.frame.maxX - 115, y: brainView2.frame.size.height / 3.5, width: 60, height: 65))
            brainImage2.image = UIImage(named: "go2")
            brainView2.addSubview(brainImage2)
            
            
            
            brainView3 = UIView(frame: CGRect(x: 20, y: brainView2.frame.maxY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 5.8))
            brainView3.layer.borderWidth = 1
            brainView3.backgroundColor = #colorLiteral(red: 0.9521439672, green: 1, blue: 0.9879009128, alpha: 1)
            brainView3.layer.borderColor = UIColor(red: 140.0/255.0, green: 200.0/255.0, blue: 185.0/255.0, alpha: 1.0).cgColor
            brainView3.roundCorners(topLeft: 8, topRight: 8, bottomLeft: 8, bottomRight: 24)
            
            let borderLayer3 = CAShapeLayer()
            borderLayer3.path = (brainView3.layer.mask! as! CAShapeLayer).path! // Reuse the Bezier path
            borderLayer3.strokeColor = UIColor(red: 140.0/255.0, green: 200.0/255.0, blue: 185.0/255.0, alpha: 1.0).cgColor
            //            borderLayer3.fillColor = UIColor(red: 140.0/255.0, green: 200.0/255.0, blue: 185.0/255.0, alpha: 1.0).cgColor
            //            borderLayer3.strokeColor = UIColor.black.cgColor
            borderLayer3.fillColor = UIColor.clear.cgColor
            borderLayer3.lineWidth = 2
            borderLayer3.frame = brainView3.bounds
            brainView3.layer.addSublayer(borderLayer3)
            
            brainButtonBackView.addSubview(brainView3)
            
            brainLB3 = UILabel(frame: CGRect(x: 30, y: 14, width: self.view.frame.size.width - 60, height: 22))
            brainLB3.text = "응급처치"
            brainLB3.textColor = #colorLiteral(red: 0.3004111648, green: 0.6361213923, blue: 0.5539721847, alpha: 1)
            brainLB3.font = UIFont(name: "SUITE-Heavy", size: 22)
            brainLB3.font = UIFont(name: "SUITE-SemiBold", size: 22)
            //        brainLB3.font = UIFont.systemFont(ofSize: 22)
            brainView3.addSubview(brainLB3)
            
            brainSubLB3 = UILabel(frame: CGRect(x: 30, y: brainLB3.frame.maxY + 5, width: self.view.frame.size.width - 60, height: 50))
            brainSubLB3.text = "뇌졸중의 응급처치는 어떻게 할까요?"
            brainSubLB3.numberOfLines = 0
            brainSubLB3.font = UIFont.systemFont(ofSize: 12)
            brainSubLB3.font = UIFont(name: "SUITE-Regular", size: 12)
            brainView3.addSubview(brainSubLB3)
            
            brainBTN3 = UIButton(frame: CGRect(x: 30, y: brainSubLB3.frame.maxY + 10, width: 100, height: 25))
            brainBTN3.setTitle("바로가기", for: .normal)
            brainBTN3.backgroundColor = #colorLiteral(red: 0.3004111648, green: 0.6361213923, blue: 0.5539721847, alpha: 1)
            
            
            brainBTN3.titleEdgeInsets = UIEdgeInsets(top: 0, left: -18, bottom: 0, right: 0)
            
            let envelopeView3 = UIImageView(frame: CGRect(x: 76, y: 4, width: 17, height: 17))
             let image3 = UIImage(named: "rightImage")
            
            envelopeView3.image = image3
            envelopeView3.contentMode = .scaleAspectFit
//            var viewLeft: UIView = UIView(frame: CGRectMake(20, 0, 40, 30))// set per your requirement
            brainBTN3.addSubview(envelopeView3)
            
            brainBTN3.setTitleColor(.white, for: .normal)
            brainBTN3.layer.cornerRadius = 12
//            brainBTN3.layer.borderWidth = 1
            brainBTN3.addTarget(self, action: #selector(goFirstAid(_ :)), for: .touchUpInside)
            brainView3.addSubview(brainBTN3)
            
            brainImage3 = UIImageView(frame: CGRect(x: brainView3.frame.maxX - 115, y: brainView3.frame.size.height / 3.5, width: 60, height: 65))
            brainImage3.image = UIImage(named: "go3")
            brainView3.addSubview(brainImage3)
            
            brainView4 = UIView(frame: CGRect(x: 20, y: brainView3.frame.maxY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 5.8))
            brainView4.layer.borderWidth = 1
            brainView4.backgroundColor = #colorLiteral(red: 0.9999601245, green: 0.9854144454, blue: 0.93028754, alpha: 1)
            brainView4.layer.borderColor = UIColor(red: 218.0/255.0, green: 200.0/255.0, blue: 137.0/255.0, alpha: 1.0).cgColor
            brainView4.roundCorners(topLeft: 8, topRight: 8, bottomLeft: 8, bottomRight: 24)
            
            
            
            
            let borderLayer4 = CAShapeLayer()
            borderLayer4.path = (brainView4.layer.mask! as! CAShapeLayer).path! // Reuse the Bezier path
            borderLayer4.strokeColor = UIColor(red: 218.0/255.0, green: 200.0/255.0, blue: 137.0/255.0, alpha: 1.0).cgColor
            //            borderLayer4.fillColor = UIColor(red: 218.0/255.0, green: 200.0/255.0, blue: 137.0/255.0, alpha: 1.0).cgColor
            //            borderLayer4.strokeColor = UIColor.black.cgColor
            borderLayer4.fillColor = UIColor.clear.cgColor
            borderLayer4.lineWidth = 2
            borderLayer4.frame = brainView4.bounds
            brainView4.layer.addSublayer(borderLayer4)
            
            brainButtonBackView.addSubview(brainView4)
            
            brainLB4 = UILabel(frame: CGRect(x: 30, y: 14, width: self.view.frame.size.width - 60, height: 22))
            brainLB4.text = "뇌졸중의 치료"
            brainLB4.textColor = #colorLiteral(red: 0.8475571275, green: 0.3171732128, blue: 0.0007351766108, alpha: 1)
            brainLB4.font = UIFont.systemFont(ofSize: 22)
            brainLB4.font = UIFont(name: "SUITE-Heavy", size: 22)
            brainLB4.font = UIFont(name: "SUITE-SemiBold", size: 22)
            brainView4.addSubview(brainLB4)
            
            brainSubLB4 = UILabel(frame: CGRect(x: 30, y: brainLB4.frame.maxY + 5, width: self.view.frame.size.width - 60, height: 50))
            brainSubLB4.text = "뇌졸중의 치료에 있어\n가장 중요한 것은 시간입니다."
            brainSubLB4.numberOfLines = 0
            brainSubLB4.font = UIFont.systemFont(ofSize: 12)
            brainSubLB4.font = UIFont(name: "SUITE-Regular", size: 12)
            brainView4.addSubview(brainSubLB4)
            
            brainBTN4 = UIButton(frame: CGRect(x: 30, y: brainSubLB4.frame.maxY + 10, width: 100, height: 25))
            brainBTN4.setTitle("바로가기", for: .normal)
            brainBTN4.backgroundColor = #colorLiteral(red: 0.9241898656, green: 0.6377926469, blue: 0.1878951788, alpha: 1)
            
            
            
            brainBTN4.titleEdgeInsets = UIEdgeInsets(top: 0, left: -18, bottom: 0, right: 0)
            
            let envelopeView4 = UIImageView(frame: CGRect(x: 76, y: 4, width: 17, height: 17))
             let image4 = UIImage(named: "rightImage")
            
            envelopeView4.image = image4
            envelopeView4.contentMode = .scaleAspectFit
//            var viewLeft: UIView = UIView(frame: CGRectMake(20, 0, 40, 30))// set per your requirement
            brainBTN4.addSubview(envelopeView4)
            
            brainBTN4.setTitleColor(.white, for: .normal)
            brainBTN4.layer.cornerRadius = 12
//            brainBTN4.layer.borderWidth = 1
            brainBTN4.addTarget(self, action: #selector(goTreatmentOfStroke(_ :)), for: .touchUpInside)
            brainView4.addSubview(brainBTN4)
            
            brainImage4 = UIImageView(frame: CGRect(x: brainView4.frame.maxX - 115, y: brainView4.frame.size.height / 3.5, width: 60, height: 65))
            brainImage4.image = UIImage(named: "go4")
            brainView4.addSubview(brainImage4)
            
            
        } else if IS_IPHONE_N {
            brainView1 = UIView(frame: CGRect(x: 20, y: brainLabel1.frame.maxY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 4.5))
            brainView1.layer.borderWidth = 1
            brainView1.backgroundColor = #colorLiteral(red: 0.952888906, green: 0.9678936601, blue: 1, alpha: 1)
            brainView1.layer.borderColor = UIColor(red: 167.0/255.0, green: 186.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
            brainView1.roundCorners(topLeft: 8, topRight: 8, bottomLeft: 8, bottomRight: 24)
            
            //            let borderLayer1 = CAShapeLayer()
            //            borderLayer1.path = (brainView1.layer.mask! as! CAShapeLayer).path! // Reuse the Bezier path
            //            borderLayer1.strokeColor = UIColor.black.cgColor
            //            borderLayer1.fillColor = UIColor.clear.cgColor
            //            borderLayer1.lineWidth = 2
            //            borderLayer1.frame = brainView1.bounds
            //            brainView1.layer.addSublayer(borderLayer1)
            let borderLayer1 = CAShapeLayer()
            borderLayer1.path = (brainView1.layer.mask! as! CAShapeLayer).path! // Reuse the Bezier path
            //            borderLayer1.strokeColor = UIColor.black.cgColor
            borderLayer1.strokeColor = UIColor(red: 167.0/255.0, green: 186.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
            borderLayer1.fillColor = UIColor.clear.cgColor
            //            borderLayer1.fillColor = UIColor(red: 167.0/255.0, green: 186.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
            borderLayer1.lineWidth = 2
            borderLayer1.frame = brainView1.bounds
            brainView1.layer.addSublayer(borderLayer1)
            
            brainButtonBackView.addSubview(brainView1)
            
            brainLB1 = UILabel(frame: CGRect(x: 30, y: 14, width: self.view.frame.size.width - 60, height: 22))
            brainLB1.text = "급성기 뇌졸증"
            brainLB1.textColor = #colorLiteral(red: 0.1970121264, green: 0.3326128721, blue: 0.6067818403, alpha: 1)
            brainLB1.font = UIFont(name: "SUITE-Heavy", size: 21)
            
            brainLB1.font = UIFont(name: "SUITE-SemiBold", size: 21)
            //        brainLB1.font = UIFont.systemFont(ofSize: 22)
            brainView1.addSubview(brainLB1)
            
            brainSubLB1 = UILabel(frame: CGRect(x: 30, y: brainLB1.frame.maxY + 5, width: self.view.frame.size.width - 60, height: 50))
            brainSubLB1.text = "뇌졸중은 중풍이라고 불리는\n뇌혈관 질환입니다."
            brainSubLB1.numberOfLines = 0
            brainSubLB1.font = UIFont.systemFont(ofSize: 13)
            brainSubLB1.font = UIFont(name: "SUITE-Regular", size: 13)
            brainView1.addSubview(brainSubLB1)
            
            brainBTN1 = UIButton(frame: CGRect(x: 30, y: brainSubLB1.frame.maxY + 10, width: 110, height: 25))
            brainBTN1.setTitle("바로가기   ", for: .normal)
            brainBTN1.setTitleColor(.white, for: .normal)
            
            brainBTN1.backgroundColor = #colorLiteral(red: 0.1970121264, green: 0.3326128721, blue: 0.6067818403, alpha: 1)
            brainBTN1.layer.cornerRadius = 12
            
//            brainBTN1.layer.borderWidth = 1
            brainBTN1.addTarget(self, action: #selector(goStroke(_ :)), for: .touchUpInside)
            brainView1.addSubview(brainBTN1)
            brainBTN1.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            let envelopeView1 = UIImageView(frame: CGRect(x: 84, y: 4, width: 17, height: 17))
             let image1 = UIImage(named: "rightImage")
            
            envelopeView1.image = image1
            envelopeView1.contentMode = .scaleAspectFit
//            var viewLeft: UIView = UIView(frame: CGRectMake(20, 0, 40, 30))// set per your requirement
            brainBTN1.addSubview(envelopeView1)
            
            
            
            brainImage = UIImageView(frame: CGRect(x: brainView1.frame.maxX - 95, y: brainView1.frame.size.height / 2.9, width: 50, height: 50))
            brainImage.image = UIImage(named: "go1")
            brainView1.addSubview(brainImage)
            
            
            brainView2 = UIView(frame: CGRect(x: 20, y: brainView1.frame.maxY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 4.5))
            brainView2.layer.borderWidth = 1
            brainView2.backgroundColor = #colorLiteral(red: 0.9770591855, green: 0.9520680308, blue: 0.9982358813, alpha: 1)
            brainView2.layer.borderColor = UIColor(red: 194.0/255.0, green: 164.0/255.0, blue: 224.0/255.0, alpha: 1.0).cgColor
            brainView2.roundCorners(topLeft: 8, topRight: 8, bottomLeft: 8, bottomRight: 24)
            
            let borderLayer2 = CAShapeLayer()
            borderLayer2.path = (brainView2.layer.mask! as! CAShapeLayer).path! // Reuse the Bezier path
            //            borderLayer2.strokeColor = UIColor.black.cgColor
            borderLayer2.fillColor = UIColor.clear.cgColor
            borderLayer2.strokeColor = UIColor(red: 194.0/255.0, green: 164.0/255.0, blue: 224.0/255.0, alpha: 1.0).cgColor
            //            borderLayer2.fillColor = UIColor(red: 194.0/255.0, green: 164.0/255.0, blue: 224.0/255.0, alpha: 1.0).cgColor
            borderLayer2.lineWidth = 2
            borderLayer2.frame = brainView2.bounds
            brainView2.layer.addSublayer(borderLayer2)
            
            brainButtonBackView.addSubview(brainView2)
            
            brainLB2 = UILabel(frame: CGRect(x: 30, y: 14, width: self.view.frame.size.width - 60, height: 22))
            brainLB2.text = "위험인자"
            brainLB2.textColor = #colorLiteral(red: 0.5486581326, green: 0.3868186474, blue: 0.7095668912, alpha: 1)
            //        brainLB2.font = UIFont.systemFont(ofSize: 22)
            brainLB2.font = UIFont(name: "SUITE-Heavy", size: 21)
            brainLB2.font = UIFont(name: "SUITE-SemiBold", size: 21)
            brainView2.addSubview(brainLB2)
            
            brainSubLB2 = UILabel(frame: CGRect(x: 30, y: brainLB2.frame.maxY + 5, width: self.view.frame.size.width - 60, height: 50))
            //            brainSubLB2.text = "뇌졸중 환자들은 다양한 뇌졸중\n위험인자를 갖게 됩니다. 위험인자에대해\n자세히 알아볼까요?"
            brainSubLB2.text = "뇌졸중 환자들은 다양한 뇌졸중\n위험인자를 갖게 됩니다. 위험인자에대해\n자세히 알아볼까요?"
            brainSubLB2.numberOfLines = 0
            brainSubLB2.font = UIFont.systemFont(ofSize: 13)
            brainSubLB2.font = UIFont(name: "SUITE-Regular", size: 13)
            brainView2.addSubview(brainSubLB2)
            
            brainBTN2 = UIButton(frame: CGRect(x: 30, y: brainSubLB2.frame.maxY + 10, width: 110, height: 25))
            brainBTN2.setTitle("바로가기   ", for: .normal)
            brainBTN2.backgroundColor = #colorLiteral(red: 0.5486581326, green: 0.3868186474, blue: 0.7095668912, alpha: 1)
            
            
            brainBTN2.setTitleColor(.white, for: .normal)
            brainBTN2.layer.cornerRadius = 12
//            brainBTN2.layer.borderWidth = 1
            brainBTN2.addTarget(self, action: #selector(goRiskFactors(_ :)), for: .touchUpInside)
            brainView2.addSubview(brainBTN2)
            
            
            
            brainBTN2.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            let envelopeView2 = UIImageView(frame: CGRect(x: 84, y: 4, width: 17, height: 17))
             let image2 = UIImage(named: "rightImage")
            
            envelopeView2.image = image2
            envelopeView2.contentMode = .scaleAspectFit
//            var viewLeft: UIView = UIView(frame: CGRectMake(20, 0, 40, 30))// set per your requirement
            brainBTN2.addSubview(envelopeView2)
            
            
            brainImage2 = UIImageView(frame: CGRect(x: brainView2.frame.maxX - 95, y: brainView2.frame.size.height / 2.9, width: 50, height: 50))
            brainImage2.image = UIImage(named: "go2")
            brainView2.addSubview(brainImage2)
            
            
            
            brainView3 = UIView(frame: CGRect(x: 20, y: brainView2.frame.maxY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 4.5))
            brainView3.layer.borderWidth = 1
            brainView3.backgroundColor = #colorLiteral(red: 0.9521439672, green: 1, blue: 0.9879009128, alpha: 1)
            brainView3.layer.borderColor = UIColor(red: 140.0/255.0, green: 200.0/255.0, blue: 185.0/255.0, alpha: 1.0).cgColor
            brainView3.roundCorners(topLeft: 8, topRight: 8, bottomLeft: 8, bottomRight: 24)
            
            let borderLayer3 = CAShapeLayer()
            borderLayer3.path = (brainView3.layer.mask! as! CAShapeLayer).path! // Reuse the Bezier path
            borderLayer3.strokeColor = UIColor(red: 140.0/255.0, green: 200.0/255.0, blue: 185.0/255.0, alpha: 1.0).cgColor
            //            borderLayer3.fillColor = UIColor(red: 140.0/255.0, green: 200.0/255.0, blue: 185.0/255.0, alpha: 1.0).cgColor
            //            borderLayer3.strokeColor = UIColor.black.cgColor
            borderLayer3.fillColor = UIColor.clear.cgColor
            borderLayer3.lineWidth = 2
            borderLayer3.frame = brainView3.bounds
            brainView3.layer.addSublayer(borderLayer3)
            
            brainButtonBackView.addSubview(brainView3)
            
            brainLB3 = UILabel(frame: CGRect(x: 30, y: 14, width: self.view.frame.size.width - 60, height: 22))
            brainLB3.text = "응급처치"
            brainLB3.textColor = #colorLiteral(red: 0.3004111648, green: 0.6361213923, blue: 0.5539721847, alpha: 1)
            brainLB3.font = UIFont(name: "SUITE-Heavy", size: 21)
            brainLB3.font = UIFont(name: "SUITE-SemiBold", size: 21)
            //        brainLB3.font = UIFont.systemFont(ofSize: 22)
            brainView3.addSubview(brainLB3)
            
            brainSubLB3 = UILabel(frame: CGRect(x: 30, y: brainLB3.frame.maxY + 5, width: self.view.frame.size.width - 60, height: 50))
            brainSubLB3.text = "뇌졸중의 응급처치는 어떻게 할까요?"
            brainSubLB3.numberOfLines = 0
            brainSubLB3.font = UIFont.systemFont(ofSize: 13)
            brainSubLB3.font = UIFont(name: "SUITE-Regular", size: 13)
            brainView3.addSubview(brainSubLB3)
            
            brainBTN3 = UIButton(frame: CGRect(x: 30, y: brainSubLB3.frame.maxY + 10, width: 110, height: 25))
            brainBTN3.setTitle("바로가기   ", for: .normal)
            brainBTN3.backgroundColor = #colorLiteral(red: 0.3004111648, green: 0.6361213923, blue: 0.5539721847, alpha: 1)
            
            brainBTN3.setTitleColor(.white, for: .normal)
            brainBTN3.layer.cornerRadius = 12
//            brainBTN3.layer.borderWidth = 1
            brainBTN3.addTarget(self, action: #selector(goFirstAid(_ :)), for: .touchUpInside)
            brainView3.addSubview(brainBTN3)
            
            brainBTN3.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            let envelopeView3 = UIImageView(frame: CGRect(x: 84, y: 4, width: 17, height: 17))
             let image3 = UIImage(named: "rightImage")
            
            envelopeView3.image = image3
            envelopeView3.contentMode = .scaleAspectFit
//            var viewLeft: UIView = UIView(frame: CGRectMake(20, 0, 40, 30))// set per your requirement
            brainBTN3.addSubview(envelopeView3)
            
            
            brainImage3 = UIImageView(frame: CGRect(x: brainView3.frame.maxX - 95, y: brainView3.frame.size.height / 2.9, width: 50, height: 50))
            brainImage3.image = UIImage(named: "go3")
            brainView3.addSubview(brainImage3)
            
            brainView4 = UIView(frame: CGRect(x: 20, y: brainView3.frame.maxY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 4.5))
            brainView4.layer.borderWidth = 1
            brainView4.backgroundColor = #colorLiteral(red: 0.9999601245, green: 0.9854144454, blue: 0.93028754, alpha: 1)
            brainView4.layer.borderColor = UIColor(red: 218.0/255.0, green: 200.0/255.0, blue: 137.0/255.0, alpha: 1.0).cgColor
            brainView4.roundCorners(topLeft: 8, topRight: 8, bottomLeft: 8, bottomRight: 24)
            
            
            
            
            let borderLayer4 = CAShapeLayer()
            borderLayer4.path = (brainView4.layer.mask! as! CAShapeLayer).path! // Reuse the Bezier path
            borderLayer4.strokeColor = UIColor(red: 218.0/255.0, green: 200.0/255.0, blue: 137.0/255.0, alpha: 1.0).cgColor
            //            borderLayer4.fillColor = UIColor(red: 218.0/255.0, green: 200.0/255.0, blue: 137.0/255.0, alpha: 1.0).cgColor
            //            borderLayer4.strokeColor = UIColor.black.cgColor
            borderLayer4.fillColor = UIColor.clear.cgColor
            borderLayer4.lineWidth = 2
            borderLayer4.frame = brainView4.bounds
            brainView4.layer.addSublayer(borderLayer4)
            
            brainButtonBackView.addSubview(brainView4)
            
            brainLB4 = UILabel(frame: CGRect(x: 30, y: 14, width: self.view.frame.size.width - 60, height: 22))
            brainLB4.text = "뇌졸중의 치료"
            brainLB4.textColor = #colorLiteral(red: 0.8475571275, green: 0.3171732128, blue: 0.0007351766108, alpha: 1)
            brainLB4.font = UIFont.systemFont(ofSize: 22)
            brainLB4.font = UIFont(name: "SUITE-Heavy", size: 21)
            brainLB4.font = UIFont(name: "SUITE-SemiBold", size: 21)
            brainView4.addSubview(brainLB4)
            
            brainSubLB4 = UILabel(frame: CGRect(x: 30, y: brainLB4.frame.maxY + 5, width: self.view.frame.size.width - 60, height: 50))
            brainSubLB4.text = "뇌졸중의 치료에 있어\n가장 중요한 것은 시간입니다."
            brainSubLB4.numberOfLines = 0
            brainSubLB4.font = UIFont.systemFont(ofSize: 13)
            brainSubLB4.font = UIFont(name: "SUITE-Regular", size: 13)
            brainView4.addSubview(brainSubLB4)
            
            brainBTN4 = UIButton(frame: CGRect(x: 30, y: brainSubLB4.frame.maxY + 10, width: 110, height: 25))
            brainBTN4.setTitle("바로가기   ", for: .normal)
            brainBTN4.backgroundColor = #colorLiteral(red: 0.9241898656, green: 0.6377926469, blue: 0.1878951788, alpha: 1)
            
            brainBTN4.setTitleColor(.white, for: .normal)
            brainBTN4.layer.cornerRadius = 12
//            brainBTN4.layer.borderWidth = 1
            brainBTN4.addTarget(self, action: #selector(goTreatmentOfStroke(_ :)), for: .touchUpInside)
            brainView4.addSubview(brainBTN4)
            
            brainBTN4.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            let envelopeView4 = UIImageView(frame: CGRect(x: 84, y: 4, width: 17, height: 17))
             let image4 = UIImage(named: "rightImage")
            
            envelopeView4.image = image4
            envelopeView4.contentMode = .scaleAspectFit
//            var viewLeft: UIView = UIView(frame: CGRectMake(20, 0, 40, 30))// set per your requirement
            brainBTN4.addSubview(envelopeView4)
            
            brainImage4 = UIImageView(frame: CGRect(x: brainView4.frame.maxX - 95, y: brainView4.frame.size.height / 2.9, width: 50, height: 50))
            brainImage4.image = UIImage(named: "go4")
            brainView4.addSubview(brainImage4)
            
        } else if IS_IPHONE_MINI {
            brainView1 = UIView(frame: CGRect(x: 20, y: brainLabel1.frame.maxY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 5.5))
            brainView1.layer.borderWidth = 1
            brainView1.backgroundColor = #colorLiteral(red: 0.952888906, green: 0.9678936601, blue: 1, alpha: 1)
            brainView1.layer.borderColor = UIColor(red: 167.0/255.0, green: 186.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
            brainView1.roundCorners(topLeft: 8, topRight: 8, bottomLeft: 8, bottomRight: 24)
            
            //            let borderLayer1 = CAShapeLayer()
            //            borderLayer1.path = (brainView1.layer.mask! as! CAShapeLayer).path! // Reuse the Bezier path
            //            borderLayer1.strokeColor = UIColor.black.cgColor
            //            borderLayer1.fillColor = UIColor.clear.cgColor
            //            borderLayer1.lineWidth = 2
            //            borderLayer1.frame = brainView1.bounds
            //            brainView1.layer.addSublayer(borderLayer1)
            let borderLayer1 = CAShapeLayer()
            borderLayer1.path = (brainView1.layer.mask! as! CAShapeLayer).path! // Reuse the Bezier path
            //            borderLayer1.strokeColor = UIColor.black.cgColor
            borderLayer1.strokeColor = UIColor(red: 167.0/255.0, green: 186.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
            borderLayer1.fillColor = UIColor.clear.cgColor
            //            borderLayer1.fillColor = UIColor(red: 167.0/255.0, green: 186.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
            borderLayer1.lineWidth = 2
            borderLayer1.frame = brainView1.bounds
            brainView1.layer.addSublayer(borderLayer1)
            
            brainButtonBackView.addSubview(brainView1)
            
            brainLB1 = UILabel(frame: CGRect(x: 30, y: 14, width: self.view.frame.size.width - 60, height: 22))
            brainLB1.text = "급성기 뇌졸증"
            brainLB1.textColor = #colorLiteral(red: 0.1970121264, green: 0.3326128721, blue: 0.6067818403, alpha: 1)
            brainLB1.font = UIFont(name: "SUITE-Heavy", size: 21)
            brainLB1.font = UIFont(name: "SUITE-SemiBold", size: 21)
            //        brainLB1.font = UIFont.systemFont(ofSize: 22)
            brainView1.addSubview(brainLB1)
            
            brainSubLB1 = UILabel(frame: CGRect(x: 30, y: brainLB1.frame.maxY + 5, width: self.view.frame.size.width - 60, height: 50))
            brainSubLB1.text = "뇌졸중은 중풍이라고 불리는\n뇌혈관 질환입니다."
            brainSubLB1.numberOfLines = 0
            brainSubLB1.font = UIFont.systemFont(ofSize: 13)
            brainSubLB1.font = UIFont(name: "SUITE-Regular", size: 13)
            brainView1.addSubview(brainSubLB1)
            
            brainBTN1 = UIButton(frame: CGRect(x: 30, y: brainSubLB1.frame.maxY + 10, width: 110, height: 25))
            brainBTN1.setTitle("바로가기   ", for: .normal)
            brainBTN1.setTitleColor(.white, for: .normal)
            
            brainBTN1.backgroundColor = #colorLiteral(red: 0.1970121264, green: 0.3326128721, blue: 0.6067818403, alpha: 1)
            brainBTN1.layer.cornerRadius = 12
            
//            brainBTN1.layer.borderWidth = 1
            brainBTN1.addTarget(self, action: #selector(goStroke(_ :)), for: .touchUpInside)
            brainView1.addSubview(brainBTN1)
            brainBTN1.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            let envelopeView1 = UIImageView(frame: CGRect(x: 84, y: 4, width: 17, height: 17))
             let image1 = UIImage(named: "rightImage")
            
            envelopeView1.image = image1
            envelopeView1.contentMode = .scaleAspectFit
//            var viewLeft: UIView = UIView(frame: CGRectMake(20, 0, 40, 30))// set per your requirement
            brainBTN1.addSubview(envelopeView1)
            
            
            
            brainImage = UIImageView(frame: CGRect(x: brainView1.frame.maxX - 95, y: brainView1.frame.size.height / 2.9, width: 50, height: 50))
            brainImage.image = UIImage(named: "go1")
            brainView1.addSubview(brainImage)
            
            
            brainView2 = UIView(frame: CGRect(x: 20, y: brainView1.frame.maxY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 5.5))
            brainView2.layer.borderWidth = 1
            brainView2.backgroundColor = #colorLiteral(red: 0.9770591855, green: 0.9520680308, blue: 0.9982358813, alpha: 1)
            brainView2.layer.borderColor = UIColor(red: 194.0/255.0, green: 164.0/255.0, blue: 224.0/255.0, alpha: 1.0).cgColor
            brainView2.roundCorners(topLeft: 8, topRight: 8, bottomLeft: 8, bottomRight: 24)
            
            let borderLayer2 = CAShapeLayer()
            borderLayer2.path = (brainView2.layer.mask! as! CAShapeLayer).path! // Reuse the Bezier path
            //            borderLayer2.strokeColor = UIColor.black.cgColor
            borderLayer2.fillColor = UIColor.clear.cgColor
            borderLayer2.strokeColor = UIColor(red: 194.0/255.0, green: 164.0/255.0, blue: 224.0/255.0, alpha: 1.0).cgColor
            //            borderLayer2.fillColor = UIColor(red: 194.0/255.0, green: 164.0/255.0, blue: 224.0/255.0, alpha: 1.0).cgColor
            borderLayer2.lineWidth = 2
            borderLayer2.frame = brainView2.bounds
            brainView2.layer.addSublayer(borderLayer2)
            
            brainButtonBackView.addSubview(brainView2)
            
            brainLB2 = UILabel(frame: CGRect(x: 30, y: 14, width: self.view.frame.size.width - 60, height: 22))
            brainLB2.text = "위험인자"
            brainLB2.textColor = #colorLiteral(red: 0.5486581326, green: 0.3868186474, blue: 0.7095668912, alpha: 1)
            //        brainLB2.font = UIFont.systemFont(ofSize: 22)
            brainLB2.font = UIFont(name: "SUITE-Heavy", size: 21)
            brainLB2.font = UIFont(name: "SUITE-SemiBold", size: 21)
            brainView2.addSubview(brainLB2)
            
            brainSubLB2 = UILabel(frame: CGRect(x: 30, y: brainLB2.frame.maxY + 5, width: self.view.frame.size.width - 60, height: 50))
            //            brainSubLB2.text = "뇌졸중 환자들은 다양한 뇌졸중\n위험인자를 갖게 됩니다. 위험인자에대해\n자세히 알아볼까요?"
            brainSubLB2.text = "뇌졸중 환자들은 다양한 뇌졸중\n위험인자를 갖게 됩니다. 위험인자에대해\n자세히 알아볼까요?"
            brainSubLB2.numberOfLines = 0
            brainSubLB2.font = UIFont.systemFont(ofSize: 13)
            brainSubLB2.font = UIFont(name: "SUITE-Regular", size: 13)
            brainView2.addSubview(brainSubLB2)
            
            brainBTN2 = UIButton(frame: CGRect(x: 30, y: brainSubLB2.frame.maxY + 10, width: 110, height: 25))
            brainBTN2.setTitle("바로가기   ", for: .normal)
            brainBTN2.backgroundColor = #colorLiteral(red: 0.5486581326, green: 0.3868186474, blue: 0.7095668912, alpha: 1)
            
            
            brainBTN2.setTitleColor(.white, for: .normal)
            brainBTN2.layer.cornerRadius = 12
//            brainBTN2.layer.borderWidth = 1
            brainBTN2.addTarget(self, action: #selector(goRiskFactors(_ :)), for: .touchUpInside)
            brainView2.addSubview(brainBTN2)
            
            
            
            brainBTN2.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            let envelopeView2 = UIImageView(frame: CGRect(x: 84, y: 4, width: 17, height: 17))
             let image2 = UIImage(named: "rightImage")
            
            envelopeView2.image = image2
            envelopeView2.contentMode = .scaleAspectFit
//            var viewLeft: UIView = UIView(frame: CGRectMake(20, 0, 40, 30))// set per your requirement
            brainBTN2.addSubview(envelopeView2)
            
            
            brainImage2 = UIImageView(frame: CGRect(x: brainView2.frame.maxX - 95, y: brainView2.frame.size.height / 2.9, width: 50, height: 50))
            brainImage2.image = UIImage(named: "go2")
            brainView2.addSubview(brainImage2)
            
            
            
            brainView3 = UIView(frame: CGRect(x: 20, y: brainView2.frame.maxY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 5.5))
            brainView3.layer.borderWidth = 1
            brainView3.backgroundColor = #colorLiteral(red: 0.9521439672, green: 1, blue: 0.9879009128, alpha: 1)
            brainView3.layer.borderColor = UIColor(red: 140.0/255.0, green: 200.0/255.0, blue: 185.0/255.0, alpha: 1.0).cgColor
            brainView3.roundCorners(topLeft: 8, topRight: 8, bottomLeft: 8, bottomRight: 24)
            
            let borderLayer3 = CAShapeLayer()
            borderLayer3.path = (brainView3.layer.mask! as! CAShapeLayer).path! // Reuse the Bezier path
            borderLayer3.strokeColor = UIColor(red: 140.0/255.0, green: 200.0/255.0, blue: 185.0/255.0, alpha: 1.0).cgColor
            //            borderLayer3.fillColor = UIColor(red: 140.0/255.0, green: 200.0/255.0, blue: 185.0/255.0, alpha: 1.0).cgColor
            //            borderLayer3.strokeColor = UIColor.black.cgColor
            borderLayer3.fillColor = UIColor.clear.cgColor
            borderLayer3.lineWidth = 2
            borderLayer3.frame = brainView3.bounds
            brainView3.layer.addSublayer(borderLayer3)
            
            brainButtonBackView.addSubview(brainView3)
            
            brainLB3 = UILabel(frame: CGRect(x: 30, y: 14, width: self.view.frame.size.width - 60, height: 22))
            brainLB3.text = "응급처치"
            brainLB3.textColor = #colorLiteral(red: 0.3004111648, green: 0.6361213923, blue: 0.5539721847, alpha: 1)
            brainLB3.font = UIFont(name: "SUITE-Heavy", size: 21)
            brainLB3.font = UIFont(name: "SUITE-SemiBold", size: 21)
            //        brainLB3.font = UIFont.systemFont(ofSize: 22)
            brainView3.addSubview(brainLB3)
            
            brainSubLB3 = UILabel(frame: CGRect(x: 30, y: brainLB3.frame.maxY + 5, width: self.view.frame.size.width - 60, height: 50))
            brainSubLB3.text = "뇌졸중의 응급처치는 어떻게 할까요?"
            brainSubLB3.numberOfLines = 0
            brainSubLB3.font = UIFont.systemFont(ofSize: 13)
            brainSubLB3.font = UIFont(name: "SUITE-Regular", size: 13)
            brainView3.addSubview(brainSubLB3)
            
            brainBTN3 = UIButton(frame: CGRect(x: 30, y: brainSubLB3.frame.maxY + 10, width: 110, height: 25))
            brainBTN3.setTitle("바로가기   ", for: .normal)
            brainBTN3.backgroundColor = #colorLiteral(red: 0.3004111648, green: 0.6361213923, blue: 0.5539721847, alpha: 1)
            
            brainBTN3.setTitleColor(.white, for: .normal)
            brainBTN3.layer.cornerRadius = 12
//            brainBTN3.layer.borderWidth = 1
            brainBTN3.addTarget(self, action: #selector(goFirstAid(_ :)), for: .touchUpInside)
            brainView3.addSubview(brainBTN3)
            
            brainBTN3.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            let envelopeView3 = UIImageView(frame: CGRect(x: 84, y: 4, width: 17, height: 17))
             let image3 = UIImage(named: "rightImage")
            
            envelopeView3.image = image3
            envelopeView3.contentMode = .scaleAspectFit
//            var viewLeft: UIView = UIView(frame: CGRectMake(20, 0, 40, 30))// set per your requirement
            brainBTN3.addSubview(envelopeView3)
            
            
            brainImage3 = UIImageView(frame: CGRect(x: brainView3.frame.maxX - 95, y: brainView3.frame.size.height / 2.9, width: 50, height: 50))
            brainImage3.image = UIImage(named: "go3")
            brainView3.addSubview(brainImage3)
            
            brainView4 = UIView(frame: CGRect(x: 20, y: brainView3.frame.maxY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 5.5))
            brainView4.layer.borderWidth = 1
            brainView4.backgroundColor = #colorLiteral(red: 0.9999601245, green: 0.9854144454, blue: 0.93028754, alpha: 1)
            brainView4.layer.borderColor = UIColor(red: 218.0/255.0, green: 200.0/255.0, blue: 137.0/255.0, alpha: 1.0).cgColor
            brainView4.roundCorners(topLeft: 8, topRight: 8, bottomLeft: 8, bottomRight: 24)
            
            
            
            
            let borderLayer4 = CAShapeLayer()
            borderLayer4.path = (brainView4.layer.mask! as! CAShapeLayer).path! // Reuse the Bezier path
            borderLayer4.strokeColor = UIColor(red: 218.0/255.0, green: 200.0/255.0, blue: 137.0/255.0, alpha: 1.0).cgColor
            //            borderLayer4.fillColor = UIColor(red: 218.0/255.0, green: 200.0/255.0, blue: 137.0/255.0, alpha: 1.0).cgColor
            //            borderLayer4.strokeColor = UIColor.black.cgColor
            borderLayer4.fillColor = UIColor.clear.cgColor
            borderLayer4.lineWidth = 2
            borderLayer4.frame = brainView4.bounds
            brainView4.layer.addSublayer(borderLayer4)
            
            brainButtonBackView.addSubview(brainView4)
            
            brainLB4 = UILabel(frame: CGRect(x: 30, y: 14, width: self.view.frame.size.width - 60, height: 22))
            brainLB4.text = "뇌졸중의 치료"
            brainLB4.textColor = #colorLiteral(red: 0.8475571275, green: 0.3171732128, blue: 0.0007351766108, alpha: 1)
            brainLB4.font = UIFont.systemFont(ofSize: 22)
            brainLB4.font = UIFont(name: "SUITE-Heavy", size: 21)
            brainLB4.font = UIFont(name: "SUITE-SemiBold", size: 21)
            brainView4.addSubview(brainLB4)
            
            brainSubLB4 = UILabel(frame: CGRect(x: 30, y: brainLB4.frame.maxY + 5, width: self.view.frame.size.width - 60, height: 50))
            brainSubLB4.text = "뇌졸중의 치료에 있어\n가장 중요한 것은 시간입니다."
            brainSubLB4.numberOfLines = 0
            brainSubLB4.font = UIFont.systemFont(ofSize: 13)
            brainSubLB4.font = UIFont(name: "SUITE-Regular", size: 13)
            brainView4.addSubview(brainSubLB4)
            
            brainBTN4 = UIButton(frame: CGRect(x: 30, y: brainSubLB4.frame.maxY + 10, width: 110, height: 25))
            brainBTN4.setTitle("바로가기   ", for: .normal)
            brainBTN4.backgroundColor = #colorLiteral(red: 0.9241898656, green: 0.6377926469, blue: 0.1878951788, alpha: 1)
            
            brainBTN4.setTitleColor(.white, for: .normal)
            brainBTN4.layer.cornerRadius = 12
//            brainBTN4.layer.borderWidth = 1
            brainBTN4.addTarget(self, action: #selector(goTreatmentOfStroke(_ :)), for: .touchUpInside)
            brainView4.addSubview(brainBTN4)
            
            brainBTN4.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            let envelopeView4 = UIImageView(frame: CGRect(x: 84, y: 4, width: 17, height: 17))
             let image4 = UIImage(named: "rightImage")
            
            envelopeView4.image = image4
            envelopeView4.contentMode = .scaleAspectFit
//            var viewLeft: UIView = UIView(frame: CGRectMake(20, 0, 40, 30))// set per your requirement
            brainBTN4.addSubview(envelopeView4)
            
            brainImage4 = UIImageView(frame: CGRect(x: brainView4.frame.maxX - 95, y: brainView4.frame.size.height / 2.9, width: 50, height: 50))
            brainImage4.image = UIImage(named: "go4")
            brainView4.addSubview(brainImage4)
            
        }else {
//            brainView1 = UIView(frame: CGRect(x: 20, y: brainLabel1.frame.maxY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 4.5))
//            brainView1.layer.borderWidth = 1
//            brainView1.backgroundColor = #colorLiteral(red: 0.952888906, green: 0.9678936601, blue: 1, alpha: 1)
//            brainView1.layer.borderColor = UIColor(red: 167.0/255.0, green: 186.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
//            brainView1.roundCorners(topLeft: 8, topRight: 8, bottomLeft: 8, bottomRight: 24)
//            
//            //            let borderLayer1 = CAShapeLayer()
//            //            borderLayer1.path = (brainView1.layer.mask! as! CAShapeLayer).path! // Reuse the Bezier path
//            //            borderLayer1.strokeColor = UIColor.black.cgColor
//            //            borderLayer1.fillColor = UIColor.clear.cgColor
//            //            borderLayer1.lineWidth = 2
//            //            borderLayer1.frame = brainView1.bounds
//            //            brainView1.layer.addSublayer(borderLayer1)
//            let borderLayer1 = CAShapeLayer()
//            borderLayer1.path = (brainView1.layer.mask! as! CAShapeLayer).path! // Reuse the Bezier path
//            //            borderLayer1.strokeColor = UIColor.black.cgColor
//            borderLayer1.strokeColor = UIColor(red: 167.0/255.0, green: 186.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
//            borderLayer1.fillColor = UIColor.clear.cgColor
//            //            borderLayer1.fillColor = UIColor(red: 167.0/255.0, green: 186.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
//            borderLayer1.lineWidth = 2
//            borderLayer1.frame = brainView1.bounds
//            brainView1.layer.addSublayer(borderLayer1)
//            
//            brainButtonBackView.addSubview(brainView1)
//            
//            brainLB1 = UILabel(frame: CGRect(x: 30, y: 14, width: self.view.frame.size.width - 60, height: 22))
//            brainLB1.text = "급성기 뇌졸증"
//            brainLB1.textColor = #colorLiteral(red: 0.1970121264, green: 0.3326128721, blue: 0.6067818403, alpha: 1)
//            brainLB1.font = UIFont(name: "SUITE-Heavy", size: 21)
//            //        brainLB1.font = UIFont.systemFont(ofSize: 22)
//            brainView1.addSubview(brainLB1)
//            
//            brainSubLB1 = UILabel(frame: CGRect(x: 30, y: brainLB1.frame.maxY + 5, width: self.view.frame.size.width - 60, height: 50))
//            brainSubLB1.text = "뇌졸중은 중풍이라고 불리는\n뇌혈관 질환입니다."
//            brainSubLB1.numberOfLines = 0
//            brainSubLB1.font = UIFont.systemFont(ofSize: 13)
//            brainSubLB1.font = UIFont(name: "SUITE-Regular", size: 13)
//            brainView1.addSubview(brainSubLB1)
//            
//            brainBTN1 = UIButton(frame: CGRect(x: 30, y: brainSubLB1.frame.maxY + 10, width: 130, height: 25))
//            brainBTN1.setTitle("바로가기", for: .normal)
//            brainBTN1.setTitleColor(.white, for: .normal)
//            
//            brainBTN1.backgroundColor = #colorLiteral(red: 0.1970121264, green: 0.3326128721, blue: 0.6067818403, alpha: 1)
//            brainBTN1.layer.cornerRadius = 12
//            
//            brainBTN1.layer.borderWidth = 1
//            brainBTN1.addTarget(self, action: #selector(goStroke(_ :)), for: .touchUpInside)
//            brainView1.addSubview(brainBTN1)
//            
//            brainImage = UIImageView(frame: CGRect(x: brainView1.frame.maxX - 95, y: brainView1.frame.size.height / 2.7, width: 35, height: 40))
//            brainImage.image = UIImage(named: "go1")
//            brainView1.addSubview(brainImage)
//            
//            
//            brainView2 = UIView(frame: CGRect(x: 20, y: brainView1.frame.maxY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 4.5))
//            brainView2.layer.borderWidth = 1
//            brainView2.backgroundColor = #colorLiteral(red: 0.9770591855, green: 0.9520680308, blue: 0.9982358813, alpha: 1)
//            brainView2.layer.borderColor = UIColor(red: 194.0/255.0, green: 164.0/255.0, blue: 224.0/255.0, alpha: 1.0).cgColor
//            brainView2.roundCorners(topLeft: 8, topRight: 8, bottomLeft: 8, bottomRight: 24)
//            
//            let borderLayer2 = CAShapeLayer()
//            borderLayer2.path = (brainView2.layer.mask! as! CAShapeLayer).path! // Reuse the Bezier path
//            //            borderLayer2.strokeColor = UIColor.black.cgColor
//            borderLayer2.fillColor = UIColor.clear.cgColor
//            borderLayer2.strokeColor = UIColor(red: 194.0/255.0, green: 164.0/255.0, blue: 224.0/255.0, alpha: 1.0).cgColor
//            //            borderLayer2.fillColor = UIColor(red: 194.0/255.0, green: 164.0/255.0, blue: 224.0/255.0, alpha: 1.0).cgColor
//            borderLayer2.lineWidth = 2
//            borderLayer2.frame = brainView2.bounds
//            brainView2.layer.addSublayer(borderLayer2)
//            
//            brainButtonBackView.addSubview(brainView2)
//            
//            brainLB2 = UILabel(frame: CGRect(x: 30, y: 14, width: self.view.frame.size.width - 60, height: 22))
//            brainLB2.text = "위험인자"
//            brainLB2.textColor = #colorLiteral(red: 0.5486581326, green: 0.3868186474, blue: 0.7095668912, alpha: 1)
//            //        brainLB2.font = UIFont.systemFont(ofSize: 22)
//            brainLB2.font = UIFont(name: "SUITE-Heavy", size: 21)
//            brainView2.addSubview(brainLB2)
//            
//            brainSubLB2 = UILabel(frame: CGRect(x: 30, y: brainLB2.frame.maxY + 5, width: self.view.frame.size.width - 60, height: 50))
//            //            brainSubLB2.text = "뇌졸중 환자들은 다양한 뇌졸중\n위험인자를 갖게 됩니다. 위험인자에대해\n자세히 알아볼까요?"
//            brainSubLB2.text = "뇌졸중 환자들은 다양한 뇌졸중\n위험인자를 갖게 됩니다. 위험인자에대해\n자세히 알아볼까요?"
//            brainSubLB2.numberOfLines = 0
//            brainSubLB2.font = UIFont.systemFont(ofSize: 13)
//            brainSubLB2.font = UIFont(name: "SUITE-Regular", size: 13)
//            brainView2.addSubview(brainSubLB2)
//            
//            brainBTN2 = UIButton(frame: CGRect(x: 30, y: brainSubLB2.frame.maxY + 10, width: 130, height: 25))
//            brainBTN2.setTitle("바로가기", for: .normal)
//            brainBTN2.backgroundColor = #colorLiteral(red: 0.5486581326, green: 0.3868186474, blue: 0.7095668912, alpha: 1)
//            
//            
//            brainBTN2.setTitleColor(.white, for: .normal)
//            brainBTN2.layer.cornerRadius = 12
//            brainBTN2.layer.borderWidth = 1
//            brainBTN2.addTarget(self, action: #selector(goRiskFactors(_ :)), for: .touchUpInside)
//            brainView2.addSubview(brainBTN2)
//            
//            brainImage2 = UIImageView(frame: CGRect(x: brainView2.frame.maxX - 95, y: brainView2.frame.size.height / 2.7, width: 35, height: 40))
//            brainImage2.image = UIImage(named: "go2")
//            brainView2.addSubview(brainImage2)
//            
//            
//            
//            brainView3 = UIView(frame: CGRect(x: 20, y: brainView2.frame.maxY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 4.5))
//            brainView3.layer.borderWidth = 1
//            brainView3.backgroundColor = #colorLiteral(red: 0.9521439672, green: 1, blue: 0.9879009128, alpha: 1)
//            brainView3.layer.borderColor = UIColor(red: 140.0/255.0, green: 200.0/255.0, blue: 185.0/255.0, alpha: 1.0).cgColor
//            brainView3.roundCorners(topLeft: 8, topRight: 8, bottomLeft: 8, bottomRight: 24)
//            
//            let borderLayer3 = CAShapeLayer()
//            borderLayer3.path = (brainView3.layer.mask! as! CAShapeLayer).path! // Reuse the Bezier path
//            borderLayer3.strokeColor = UIColor(red: 140.0/255.0, green: 200.0/255.0, blue: 185.0/255.0, alpha: 1.0).cgColor
//            //            borderLayer3.fillColor = UIColor(red: 140.0/255.0, green: 200.0/255.0, blue: 185.0/255.0, alpha: 1.0).cgColor
//            //            borderLayer3.strokeColor = UIColor.black.cgColor
//            borderLayer3.fillColor = UIColor.clear.cgColor
//            borderLayer3.lineWidth = 2
//            borderLayer3.frame = brainView3.bounds
//            brainView3.layer.addSublayer(borderLayer3)
//            
//            brainButtonBackView.addSubview(brainView3)
//            
//            brainLB3 = UILabel(frame: CGRect(x: 30, y: 14, width: self.view.frame.size.width - 60, height: 22))
//            brainLB3.text = "응급처치"
//            brainLB3.textColor = #colorLiteral(red: 0.3004111648, green: 0.6361213923, blue: 0.5539721847, alpha: 1)
//            brainLB3.font = UIFont(name: "SUITE-Heavy", size: 21)
//            //        brainLB3.font = UIFont.systemFont(ofSize: 22)
//            brainView3.addSubview(brainLB3)
//            
//            brainSubLB3 = UILabel(frame: CGRect(x: 30, y: brainLB3.frame.maxY + 5, width: self.view.frame.size.width - 60, height: 50))
//            brainSubLB3.text = "뇌졸중의 응급처치는 어떻게 할까요?"
//            brainSubLB3.numberOfLines = 0
//            brainSubLB3.font = UIFont.systemFont(ofSize: 13)
//            brainSubLB3.font = UIFont(name: "SUITE-Regular", size: 13)
//            brainView3.addSubview(brainSubLB3)
//            
//            brainBTN3 = UIButton(frame: CGRect(x: 30, y: brainSubLB3.frame.maxY + 10, width: 130, height: 25))
//            brainBTN3.setTitle("바로가기", for: .normal)
//            brainBTN3.backgroundColor = #colorLiteral(red: 0.3004111648, green: 0.6361213923, blue: 0.5539721847, alpha: 1)
//            
//            brainBTN3.setTitleColor(.white, for: .normal)
//            brainBTN3.layer.cornerRadius = 12
//            brainBTN3.layer.borderWidth = 1
//            brainBTN3.addTarget(self, action: #selector(goFirstAid(_ :)), for: .touchUpInside)
//            brainView3.addSubview(brainBTN3)
//            
//            brainImage3 = UIImageView(frame: CGRect(x: brainView3.frame.maxX - 95, y: brainView3.frame.size.height / 2.7, width: 35, height: 40))
//            brainImage3.image = UIImage(named: "go3")
//            brainView3.addSubview(brainImage3)
//            
//            brainView4 = UIView(frame: CGRect(x: 20, y: brainView3.frame.maxY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 4.5))
//            brainView4.layer.borderWidth = 1
//            brainView4.backgroundColor = #colorLiteral(red: 0.9999601245, green: 0.9854144454, blue: 0.93028754, alpha: 1)
//            brainView4.layer.borderColor = UIColor(red: 218.0/255.0, green: 200.0/255.0, blue: 137.0/255.0, alpha: 1.0).cgColor
//            brainView4.roundCorners(topLeft: 8, topRight: 8, bottomLeft: 8, bottomRight: 24)
//            
//            
//            
//            
//            let borderLayer4 = CAShapeLayer()
//            borderLayer4.path = (brainView4.layer.mask! as! CAShapeLayer).path! // Reuse the Bezier path
//            borderLayer4.strokeColor = UIColor(red: 218.0/255.0, green: 200.0/255.0, blue: 137.0/255.0, alpha: 1.0).cgColor
//            //            borderLayer4.fillColor = UIColor(red: 218.0/255.0, green: 200.0/255.0, blue: 137.0/255.0, alpha: 1.0).cgColor
//            //            borderLayer4.strokeColor = UIColor.black.cgColor
//            borderLayer4.fillColor = UIColor.clear.cgColor
//            borderLayer4.lineWidth = 2
//            borderLayer4.frame = brainView4.bounds
//            brainView4.layer.addSublayer(borderLayer4)
//            
//            brainButtonBackView.addSubview(brainView4)
//            
//            brainLB4 = UILabel(frame: CGRect(x: 30, y: 14, width: self.view.frame.size.width - 60, height: 22))
//            brainLB4.text = "뇌졸중의 치료"
//            brainLB4.textColor = #colorLiteral(red: 0.8475571275, green: 0.3171732128, blue: 0.0007351766108, alpha: 1)
//            brainLB4.font = UIFont.systemFont(ofSize: 22)
//            brainLB4.font = UIFont(name: "SUITE-Heavy", size: 21)
//            brainView4.addSubview(brainLB4)
//            
//            brainSubLB4 = UILabel(frame: CGRect(x: 30, y: brainLB4.frame.maxY + 5, width: self.view.frame.size.width - 60, height: 50))
//            brainSubLB4.text = "뇌졸중의 치료에 있어\n가장 중요한 것은 시간입니다."
//            brainSubLB4.numberOfLines = 0
//            brainSubLB4.font = UIFont.systemFont(ofSize: 13)
//            brainSubLB4.font = UIFont(name: "SUITE-Regular", size: 13)
//            brainView4.addSubview(brainSubLB4)
//            
//            brainBTN4 = UIButton(frame: CGRect(x: 30, y: brainSubLB4.frame.maxY + 10, width: 130, height: 25))
//            brainBTN4.setTitle("바로가기", for: .normal)
//            brainBTN4.backgroundColor = #colorLiteral(red: 0.9241898656, green: 0.6377926469, blue: 0.1878951788, alpha: 1)
//            
//            brainBTN4.setTitleColor(.white, for: .normal)
//            brainBTN4.layer.cornerRadius = 12
//            brainBTN4.layer.borderWidth = 1
//            brainBTN4.addTarget(self, action: #selector(goTreatmentOfStroke(_ :)), for: .touchUpInside)
//            brainView4.addSubview(brainBTN4)
//            
//            brainImage4 = UIImageView(frame: CGRect(x: brainView4.frame.maxX - 95, y: brainView4.frame.size.height / 2.7, width: 35, height: 40))
//            brainImage4.image = UIImage(named: "go4")
//            brainView4.addSubview(brainImage4)
            brainView1 = UIView(frame: CGRect(x: 20, y: brainLabel1.frame.maxY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 4.5))
            brainView1.layer.borderWidth = 1
            brainView1.backgroundColor = #colorLiteral(red: 0.952888906, green: 0.9678936601, blue: 1, alpha: 1)
            brainView1.layer.borderColor = UIColor(red: 167.0/255.0, green: 186.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
            brainView1.roundCorners(topLeft: 8, topRight: 8, bottomLeft: 8, bottomRight: 24)
            
            //            let borderLayer1 = CAShapeLayer()
            //            borderLayer1.path = (brainView1.layer.mask! as! CAShapeLayer).path! // Reuse the Bezier path
            //            borderLayer1.strokeColor = UIColor.black.cgColor
            //            borderLayer1.fillColor = UIColor.clear.cgColor
            //            borderLayer1.lineWidth = 2
            //            borderLayer1.frame = brainView1.bounds
            //            brainView1.layer.addSublayer(borderLayer1)
            let borderLayer1 = CAShapeLayer()
            borderLayer1.path = (brainView1.layer.mask! as! CAShapeLayer).path! // Reuse the Bezier path
            //            borderLayer1.strokeColor = UIColor.black.cgColor
            borderLayer1.strokeColor = UIColor(red: 167.0/255.0, green: 186.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
            borderLayer1.fillColor = UIColor.clear.cgColor
            //            borderLayer1.fillColor = UIColor(red: 167.0/255.0, green: 186.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
            borderLayer1.lineWidth = 2
            borderLayer1.frame = brainView1.bounds
            brainView1.layer.addSublayer(borderLayer1)
            
            brainButtonBackView.addSubview(brainView1)
            
            brainLB1 = UILabel(frame: CGRect(x: 30, y: 14, width: self.view.frame.size.width - 60, height: 22))
            brainLB1.text = "급성기 뇌졸증"
            brainLB1.textColor = #colorLiteral(red: 0.1970121264, green: 0.3326128721, blue: 0.6067818403, alpha: 1)
            brainLB1.font = UIFont(name: "SUITE-Heavy", size: 21)
            brainLB1.font = UIFont(name: "SUITE-SemiBold", size: 21)
            //        brainLB1.font = UIFont.systemFont(ofSize: 22)
            brainView1.addSubview(brainLB1)
            
            brainSubLB1 = UILabel(frame: CGRect(x: 30, y: brainLB1.frame.maxY + 5, width: self.view.frame.size.width - 60, height: 50))
            brainSubLB1.text = "뇌졸중은 중풍이라고 불리는\n뇌혈관 질환입니다."
            brainSubLB1.numberOfLines = 0
            brainSubLB1.font = UIFont.systemFont(ofSize: 13)
            brainSubLB1.font = UIFont(name: "SUITE-Regular", size: 13)
            brainView1.addSubview(brainSubLB1)
            
            brainBTN1 = UIButton(frame: CGRect(x: 30, y: brainSubLB1.frame.maxY + 10, width: 110, height: 25))
            brainBTN1.setTitle("바로가기   ", for: .normal)
            brainBTN1.setTitleColor(.white, for: .normal)
            
            brainBTN1.backgroundColor = #colorLiteral(red: 0.1970121264, green: 0.3326128721, blue: 0.6067818403, alpha: 1)
            brainBTN1.layer.cornerRadius = 12
            
//            brainBTN1.layer.borderWidth = 1
            brainBTN1.addTarget(self, action: #selector(goStroke(_ :)), for: .touchUpInside)
            brainView1.addSubview(brainBTN1)
            brainBTN1.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            let envelopeView1 = UIImageView(frame: CGRect(x: 84, y: 4, width: 17, height: 17))
             let image1 = UIImage(named: "rightImage")
            
            envelopeView1.image = image1
            envelopeView1.contentMode = .scaleAspectFit
//            var viewLeft: UIView = UIView(frame: CGRectMake(20, 0, 40, 30))// set per your requirement
            brainBTN1.addSubview(envelopeView1)
            
            
            
            brainImage = UIImageView(frame: CGRect(x: brainView1.frame.maxX - 95, y: brainView1.frame.size.height / 2.7, width: 35, height: 40))
            brainImage.image = UIImage(named: "go1")
            brainView1.addSubview(brainImage)
            
            
            brainView2 = UIView(frame: CGRect(x: 20, y: brainView1.frame.maxY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 4.5))
            brainView2.layer.borderWidth = 1
            brainView2.backgroundColor = #colorLiteral(red: 0.9770591855, green: 0.9520680308, blue: 0.9982358813, alpha: 1)
            brainView2.layer.borderColor = UIColor(red: 194.0/255.0, green: 164.0/255.0, blue: 224.0/255.0, alpha: 1.0).cgColor
            brainView2.roundCorners(topLeft: 8, topRight: 8, bottomLeft: 8, bottomRight: 24)
            
            let borderLayer2 = CAShapeLayer()
            borderLayer2.path = (brainView2.layer.mask! as! CAShapeLayer).path! // Reuse the Bezier path
            //            borderLayer2.strokeColor = UIColor.black.cgColor
            borderLayer2.fillColor = UIColor.clear.cgColor
            borderLayer2.strokeColor = UIColor(red: 194.0/255.0, green: 164.0/255.0, blue: 224.0/255.0, alpha: 1.0).cgColor
            //            borderLayer2.fillColor = UIColor(red: 194.0/255.0, green: 164.0/255.0, blue: 224.0/255.0, alpha: 1.0).cgColor
            borderLayer2.lineWidth = 2
            borderLayer2.frame = brainView2.bounds
            brainView2.layer.addSublayer(borderLayer2)
            
            brainButtonBackView.addSubview(brainView2)
            
            brainLB2 = UILabel(frame: CGRect(x: 30, y: 14, width: self.view.frame.size.width - 60, height: 22))
            brainLB2.text = "위험인자"
            brainLB2.textColor = #colorLiteral(red: 0.5486581326, green: 0.3868186474, blue: 0.7095668912, alpha: 1)
            //        brainLB2.font = UIFont.systemFont(ofSize: 22)
            brainLB2.font = UIFont(name: "SUITE-Heavy", size: 21)
            brainLB2.font = UIFont(name: "SUITE-SemiBold", size: 21)
            brainView2.addSubview(brainLB2)
            
            brainSubLB2 = UILabel(frame: CGRect(x: 30, y: brainLB2.frame.maxY + 5, width: self.view.frame.size.width - 60, height: 50))
            //            brainSubLB2.text = "뇌졸중 환자들은 다양한 뇌졸중\n위험인자를 갖게 됩니다. 위험인자에대해\n자세히 알아볼까요?"
            brainSubLB2.text = "뇌졸중 환자들은 다양한 뇌졸중\n위험인자를 갖게 됩니다. 위험인자에대해\n자세히 알아볼까요?"
            brainSubLB2.numberOfLines = 0
            brainSubLB2.font = UIFont.systemFont(ofSize: 13)
            brainSubLB2.font = UIFont(name: "SUITE-Regular", size: 13)
            brainView2.addSubview(brainSubLB2)
            
            brainBTN2 = UIButton(frame: CGRect(x: 30, y: brainSubLB2.frame.maxY + 10, width: 110, height: 25))
            brainBTN2.setTitle("바로가기   ", for: .normal)
            brainBTN2.backgroundColor = #colorLiteral(red: 0.5486581326, green: 0.3868186474, blue: 0.7095668912, alpha: 1)
            
            
            brainBTN2.setTitleColor(.white, for: .normal)
            brainBTN2.layer.cornerRadius = 12
//            brainBTN2.layer.borderWidth = 1
            brainBTN2.addTarget(self, action: #selector(goRiskFactors(_ :)), for: .touchUpInside)
            brainView2.addSubview(brainBTN2)
            
            
            
            brainBTN2.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            let envelopeView2 = UIImageView(frame: CGRect(x: 84, y: 4, width: 17, height: 17))
             let image2 = UIImage(named: "rightImage")
            
            envelopeView2.image = image2
            envelopeView2.contentMode = .scaleAspectFit
//            var viewLeft: UIView = UIView(frame: CGRectMake(20, 0, 40, 30))// set per your requirement
            brainBTN2.addSubview(envelopeView2)
            
            
            brainImage2 = UIImageView(frame: CGRect(x: brainView2.frame.maxX - 95, y: brainView2.frame.size.height / 2.7, width: 35, height: 40))
            brainImage2.image = UIImage(named: "go2")
            brainView2.addSubview(brainImage2)
            
            
            
            brainView3 = UIView(frame: CGRect(x: 20, y: brainView2.frame.maxY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 4.5))
            brainView3.layer.borderWidth = 1
            brainView3.backgroundColor = #colorLiteral(red: 0.9521439672, green: 1, blue: 0.9879009128, alpha: 1)
            brainView3.layer.borderColor = UIColor(red: 140.0/255.0, green: 200.0/255.0, blue: 185.0/255.0, alpha: 1.0).cgColor
            brainView3.roundCorners(topLeft: 8, topRight: 8, bottomLeft: 8, bottomRight: 24)
            
            let borderLayer3 = CAShapeLayer()
            borderLayer3.path = (brainView3.layer.mask! as! CAShapeLayer).path! // Reuse the Bezier path
            borderLayer3.strokeColor = UIColor(red: 140.0/255.0, green: 200.0/255.0, blue: 185.0/255.0, alpha: 1.0).cgColor
            //            borderLayer3.fillColor = UIColor(red: 140.0/255.0, green: 200.0/255.0, blue: 185.0/255.0, alpha: 1.0).cgColor
            //            borderLayer3.strokeColor = UIColor.black.cgColor
            borderLayer3.fillColor = UIColor.clear.cgColor
            borderLayer3.lineWidth = 2
            borderLayer3.frame = brainView3.bounds
            brainView3.layer.addSublayer(borderLayer3)
            
            brainButtonBackView.addSubview(brainView3)
            
            brainLB3 = UILabel(frame: CGRect(x: 30, y: 14, width: self.view.frame.size.width - 60, height: 22))
            brainLB3.text = "응급처치"
            brainLB3.textColor = #colorLiteral(red: 0.3004111648, green: 0.6361213923, blue: 0.5539721847, alpha: 1)
            brainLB3.font = UIFont(name: "SUITE-Heavy", size: 21)
            brainLB3.font = UIFont(name: "SUITE-SemiBold", size: 21)
            //        brainLB3.font = UIFont.systemFont(ofSize: 22)
            brainView3.addSubview(brainLB3)
            
            brainSubLB3 = UILabel(frame: CGRect(x: 30, y: brainLB3.frame.maxY + 5, width: self.view.frame.size.width - 60, height: 50))
            brainSubLB3.text = "뇌졸중의 응급처치는 어떻게 할까요?"
            brainSubLB3.numberOfLines = 0
            brainSubLB3.font = UIFont.systemFont(ofSize: 13)
            brainSubLB3.font = UIFont(name: "SUITE-Regular", size: 13)
            brainView3.addSubview(brainSubLB3)
            
            brainBTN3 = UIButton(frame: CGRect(x: 30, y: brainSubLB3.frame.maxY + 10, width: 110, height: 25))
            brainBTN3.setTitle("바로가기   ", for: .normal)
            brainBTN3.backgroundColor = #colorLiteral(red: 0.3004111648, green: 0.6361213923, blue: 0.5539721847, alpha: 1)
            
            brainBTN3.setTitleColor(.white, for: .normal)
            brainBTN3.layer.cornerRadius = 12
//            brainBTN3.layer.borderWidth = 1
            brainBTN3.addTarget(self, action: #selector(goFirstAid(_ :)), for: .touchUpInside)
            brainView3.addSubview(brainBTN3)
            
            brainBTN3.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            let envelopeView3 = UIImageView(frame: CGRect(x: 84, y: 4, width: 17, height: 17))
             let image3 = UIImage(named: "rightImage")
            
            envelopeView3.image = image3
            envelopeView3.contentMode = .scaleAspectFit
//            var viewLeft: UIView = UIView(frame: CGRectMake(20, 0, 40, 30))// set per your requirement
            brainBTN3.addSubview(envelopeView3)
            
            
            brainImage3 = UIImageView(frame: CGRect(x: brainView3.frame.maxX - 95, y: brainView3.frame.size.height / 2.7, width: 35, height: 40))
            brainImage3.image = UIImage(named: "go3")
            brainView3.addSubview(brainImage3)
            
            brainView4 = UIView(frame: CGRect(x: 20, y: brainView3.frame.maxY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 4.5))
            brainView4.layer.borderWidth = 1
            brainView4.backgroundColor = #colorLiteral(red: 0.9999601245, green: 0.9854144454, blue: 0.93028754, alpha: 1)
            brainView4.layer.borderColor = UIColor(red: 218.0/255.0, green: 200.0/255.0, blue: 137.0/255.0, alpha: 1.0).cgColor
            brainView4.roundCorners(topLeft: 8, topRight: 8, bottomLeft: 8, bottomRight: 24)
            
            
            
            
            let borderLayer4 = CAShapeLayer()
            borderLayer4.path = (brainView4.layer.mask! as! CAShapeLayer).path! // Reuse the Bezier path
            borderLayer4.strokeColor = UIColor(red: 218.0/255.0, green: 200.0/255.0, blue: 137.0/255.0, alpha: 1.0).cgColor
            //            borderLayer4.fillColor = UIColor(red: 218.0/255.0, green: 200.0/255.0, blue: 137.0/255.0, alpha: 1.0).cgColor
            //            borderLayer4.strokeColor = UIColor.black.cgColor
            borderLayer4.fillColor = UIColor.clear.cgColor
            borderLayer4.lineWidth = 2
            borderLayer4.frame = brainView4.bounds
            brainView4.layer.addSublayer(borderLayer4)
            
            brainButtonBackView.addSubview(brainView4)
            
            brainLB4 = UILabel(frame: CGRect(x: 30, y: 14, width: self.view.frame.size.width - 60, height: 22))
            brainLB4.text = "뇌졸중의 치료"
            brainLB4.textColor = #colorLiteral(red: 0.8475571275, green: 0.3171732128, blue: 0.0007351766108, alpha: 1)
            brainLB4.font = UIFont.systemFont(ofSize: 22)
            brainLB4.font = UIFont(name: "SUITE-Heavy", size: 21)
            brainLB4.font = UIFont(name: "SUITE-SemiBold", size: 21)
            brainView4.addSubview(brainLB4)
            
            brainSubLB4 = UILabel(frame: CGRect(x: 30, y: brainLB4.frame.maxY + 5, width: self.view.frame.size.width - 60, height: 50))
            brainSubLB4.text = "뇌졸중의 치료에 있어\n가장 중요한 것은 시간입니다."
            brainSubLB4.numberOfLines = 0
            brainSubLB4.font = UIFont.systemFont(ofSize: 13)
            brainSubLB4.font = UIFont(name: "SUITE-Regular", size: 13)
            brainView4.addSubview(brainSubLB4)
            
            brainBTN4 = UIButton(frame: CGRect(x: 30, y: brainSubLB4.frame.maxY + 10, width: 110, height: 25))
            brainBTN4.setTitle("바로가기   ", for: .normal)
            brainBTN4.backgroundColor = #colorLiteral(red: 0.9241898656, green: 0.6377926469, blue: 0.1878951788, alpha: 1)
            
            brainBTN4.setTitleColor(.white, for: .normal)
            brainBTN4.layer.cornerRadius = 12
//            brainBTN4.layer.borderWidth = 1
            brainBTN4.addTarget(self, action: #selector(goTreatmentOfStroke(_ :)), for: .touchUpInside)
            brainView4.addSubview(brainBTN4)
            
            brainBTN4.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            let envelopeView4 = UIImageView(frame: CGRect(x: 84, y: 4, width: 17, height: 17))
             let image4 = UIImage(named: "rightImage")
            
            envelopeView4.image = image4
            envelopeView4.contentMode = .scaleAspectFit
//            var viewLeft: UIView = UIView(frame: CGRectMake(20, 0, 40, 30))// set per your requirement
            brainBTN4.addSubview(envelopeView4)
            
            brainImage4 = UIImageView(frame: CGRect(x: brainView4.frame.maxX - 95, y: brainView4.frame.size.height / 2.7, width: 35, height: 40))
            brainImage4.image = UIImage(named: "go4")
            brainView4.addSubview(brainImage4)
            
        }
        
        
        
        
        
        if IS_IPHONE_12PRO_MAX {
            patientView = UIView(frame: CGRect(x: 0, y: brainButtonBackView.frame.maxY - 80, width: SCREEN.WIDTH, height: 360))
            patientView.backgroundColor = #colorLiteral(red: 0.9299879074, green: 0.9458257556, blue: 0.9833372235, alpha: 1)
            scrollView.addSubview(patientView)
        }
        
        if IS_IPHONE_15PRO_MAX {
            patientView = UIView(frame: CGRect(x: 0, y: brainButtonBackView.frame.maxY - 80, width: SCREEN.WIDTH, height: 360))
            patientView.backgroundColor = #colorLiteral(red: 0.9299879074, green: 0.9458257556, blue: 0.9833372235, alpha: 1)
            scrollView.addSubview(patientView)
        }
        if IS_IPHONE_N_PLUS {
            patientView = UIView(frame: CGRect(x: 0, y: brainButtonBackView.frame.maxY - 140, width: SCREEN.WIDTH, height: 380))
            patientView.backgroundColor = #colorLiteral(red: 0.9299879074, green: 0.9458257556, blue: 0.9833372235, alpha: 1)
            scrollView.addSubview(patientView)
        }
        
        if IS_IPHONE_X {
            patientView = UIView(frame: CGRect(x: 0, y: brainButtonBackView.frame.maxY - 140, width: SCREEN.WIDTH, height: 350))
            patientView.backgroundColor = #colorLiteral(red: 0.9299879074, green: 0.9458257556, blue: 0.9833372235, alpha: 1)
            scrollView.addSubview(patientView)
        }
        
        if IS_IPHONE_N {
            patientView = UIView(frame: CGRect(x: 0, y: brainButtonBackView.frame.maxY - 140, width: SCREEN.WIDTH, height: 350))
            patientView.backgroundColor = #colorLiteral(red: 0.9299879074, green: 0.9458257556, blue: 0.9833372235, alpha: 1)
            scrollView.addSubview(patientView)
        }
        
        if IS_IPHONE_MINI {
            patientView = UIView(frame: CGRect(x: 0, y: brainButtonBackView.frame.maxY - 290, width: SCREEN.WIDTH, height: 350))
            patientView.backgroundColor = #colorLiteral(red: 0.9299879074, green: 0.9458257556, blue: 0.9833372235, alpha: 1)
            scrollView.addSubview(patientView)
        }
        if IS_IPHONE_12PRO {
            patientView = UIView(frame: CGRect(x: 0, y: brainButtonBackView.frame.maxY - 340, width: SCREEN.WIDTH, height: 365))
            patientView.backgroundColor = .white
            patientView.backgroundColor = #colorLiteral(red: 0.9299879074, green: 0.9458257556, blue: 0.9833372235, alpha: 1)
            scrollView.addSubview(patientView)
        }
        if IS_IPHONE_15PRO {
            patientView = UIView(frame: CGRect(x: 0, y: brainButtonBackView.frame.maxY - 340, width: SCREEN.WIDTH, height: 365))
            patientView.backgroundColor = .white
            patientView.backgroundColor = #colorLiteral(red: 0.9299879074, green: 0.9458257556, blue: 0.9833372235, alpha: 1)
            scrollView.addSubview(patientView)
        }
        
//        patientView.setGradient(color1: .white, color2: UIColor(red: 234.0 / 255.0, green: 246.0 / 255.0, blue: 1.0, alpha: 1))
        
        patientLB = UILabel(frame: CGRect(x: SCREEN.WIDTH / 2.6, y: 40, width: 250, height: 30))
        if IS_IPHONE_N {
            patientLB = UILabel(frame: CGRect(x: SCREEN.WIDTH / 2.6, y: 10, width: 250, height: 30))
        }
        if IS_IPHONE_MINI {
            patientLB = UILabel(frame: CGRect(x: SCREEN.WIDTH / 2.6, y: 10, width: 250, height: 30))
        }
        patientLB.text = "환자관리"
        //        patientLB.font = UIFont.systemFont(ofSize: 30)
        patientLB.font = UIFont(name: "SUITE-Medium", size: 30)
        patientLB.textColor = #colorLiteral(red: 0.08110309392, green: 0.2216313183, blue: 0.4961963296, alpha: 1)
        patientView.addSubview(patientLB)
        
        let button = UIButton()
        button.setTitle("", for: .normal)
        button.backgroundColor = UIColor.white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(goUnderDiet(_ :)), for: .touchUpInside)
        //        button.layer.borderWidth = 1
        button.layer.cornerRadius = 8
        
        let button2 = UIButton()
        button2.setTitle("", for: .normal)
        button2.backgroundColor = UIColor.white
        button2.translatesAutoresizingMaskIntoConstraints = false
        button2.addTarget(self, action: #selector(goUnderObesity(_ :)), for: .touchUpInside)
        //        button2.layer.borderWidth = 1
        button2.layer.cornerRadius = 8
        
        let button3 = UIButton()
        button3.setTitle("", for: .normal)
        button3.backgroundColor = UIColor.white
        button3.translatesAutoresizingMaskIntoConstraints = false
        button3.addTarget(self, action: #selector(goUnderDementia(_ :)), for: .touchUpInside)
        //        button3.layer.borderWidth = 1
        button3.layer.cornerRadius = 8
        
        let button4 = UIButton()
        button4.setTitle("", for: .normal)
        button4.backgroundColor = UIColor.white
        button4.translatesAutoresizingMaskIntoConstraints = false
        button4.addTarget(self, action: #selector(goUnderDepression(_ :)), for: .touchUpInside)
        //        button4.layer.borderWidth = 1
        button4.layer.cornerRadius = 8
        
        let button5 = UIButton()
        button5.setTitle("", for: .normal)
        button5.backgroundColor = UIColor.white
        button5.translatesAutoresizingMaskIntoConstraints = false
        button5.addTarget(self, action: #selector(goUnderLevel(_ :)), for: .touchUpInside)
        //        button5.layer.borderWidth = 1
        button5.layer.cornerRadius = 8
        
        let button6 = UIButton()
        button6.setTitle("", for: .normal)
        button6.backgroundColor = UIColor(red: 234.0 / 255.0, green: 246.0 / 255.0, blue: 1.0, alpha: 0.5)
        button6.translatesAutoresizingMaskIntoConstraints = false
        //        button5.layer.borderWidth = 1
        button6.layer.cornerRadius = 8
        button6.backgroundColor = .clear
        
        
        let label = UILabel()
        //        label.setTitle("btn 1", for: .normal)
        label.text = "식이요법"
        //        label.font = UIFont.systemFont(ofSize: 12)
        //        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.font = UIFont(name: "SUITE-Regular", size: 17)
        label.textAlignment = .center
        
        //        label.backgroundColor = UIColor.white
        //        label.translatesAutoresizingMaskIntoConstraints = false
        let label2 = UILabel()
        //        label.setTitle("btn 1", for: .normal)
        label2.text = "비만관리"
        //        label2.font = UIFont.systemFont(ofSize: 12)
        //        label2.font = UIFont.boldSystemFont(ofSize: 14)
        label2.font = UIFont(name: "SUITE-Regular", size: 17)
        label2.textAlignment = .center
        //        label.backgroundColor = UIColor.white
        //        label.translatesAutoresizingMaskIntoConstraints = false
        let label3 = UILabel()
        //        label.setTitle("btn 1", for: .normal)
        label3.text = "치매"
        //        label3.font = UIFont.systemFont(ofSize: 12)
        //        label3.font = UIFont.boldSystemFont(ofSize: 14)
        label3.font = UIFont(name: "SUITE-Regular", size: 17)
        label3.textAlignment = .center
        //        label.backgroundColor = UIColor.white
        //        label.translatesAutoresizingMaskIntoConstraints = false
        let label4 = UILabel()
        //        label.setTitle("btn 1", for: .normal)
        label4.text = "우울증"
        //        label4.font = UIFont.systemFont(ofSize: 12)
        //        label4.font = UIFont.boldSystemFont(ofSize: 14)
        label4.font = UIFont(name: "SUITE-Regular", size: 17)
        label4.textAlignment = .center
        //        label.backgroundColor = UIColor.white
        //        label.translatesAutoresizingMaskIntoConstraints = false
        let label5 = UILabel()
        //        label.setTitle("btn 1", for: .normal)
        label5.numberOfLines = 0
        label5.text = "요양보험 및\n장애등급"
        //        label5.font = UIFont.systemFont(ofSize: 12)
        //        label5.font = UIFont.boldSystemFont(ofSize: 14)
        label5.font = UIFont(name: "SUITE-Regular", size: 14)
        label5.textAlignment = .center
        //        label.backgroundColor = UIColor.white
        //        label.translatesAutoresizingMaskIntoConstraints = false
        let label6 = UILabel()
        //        label.setTitle("btn 1", for: .normal)
        label6.numberOfLines = 0
        label6.text = ""
        label6.font = UIFont.systemFont(ofSize: 12)
        label6.textAlignment = .center
        //        label.backgroundColor = UIColor.white
        //        label.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        let buttonStackView = UIStackView(frame: CGRect(x: 20, y: patientLB.frame.maxY + 20, width: SCREEN.WIDTH - 40, height:100))
        buttonStackView.alignment = .fill
        buttonStackView.distribution = .fillEqually
        buttonStackView.spacing = 8.0
        
        buttonStackView.addArrangedSubview(button)
        buttonStackView.addArrangedSubview(button2)
        buttonStackView.addArrangedSubview(button3)
        //        buttonStackView.addArrangedSubview(button4)
        //        buttonStackView.addArrangedSubview(button5)
        
        patientView.addSubview(buttonStackView)
        
        let buttonStackView2 = UIStackView(frame: CGRect(x: 20, y: buttonStackView.frame.maxY + 50, width: SCREEN.WIDTH - 40, height:100))
        buttonStackView2.alignment = .fill
        buttonStackView2.distribution = .fillEqually
        buttonStackView2.spacing = 8.0
        
        buttonStackView2.addArrangedSubview(button4)
        buttonStackView2.addArrangedSubview(button5)
        buttonStackView2.addArrangedSubview(button6)
        
        patientView.addSubview(buttonStackView2)
        
        //        button.setImage(UIImage(named: "patientMenu1"), for: .normal)
        //
        //        button2.setImage(UIImage(named: "patientMenu2"), for: .normal)
        //        button3.setImage(UIImage(named: "patientMenu3"), for: .normal)
        //        button4.setImage(UIImage(named: "patientMenu4"), for: .normal)
        //        button5.setImage(UIImage(named: "patientMenu5"), for: .normal)
        if IS_IPHONE_X {
            BTNImage1 = UIImageView(frame: .zero)
            button.addSubview(BTNImage1)
            BTNImage1.translatesAutoresizingMaskIntoConstraints = false
            
            BTNImage1.topAnchor.constraint(equalTo: button.topAnchor, constant: 20).isActive = true
            BTNImage1.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: 35).isActive = true
            BTNImage1.trailingAnchor.constraint(equalTo: button.trailingAnchor, constant: -35).isActive = true
            BTNImage1.bottomAnchor.constraint(equalTo: button.bottomAnchor, constant: -20).isActive = true
            BTNImage1.image = UIImage(named: "patientMenu1")
            
            BTNImage2 = UIImageView(frame: .zero)
            button2.addSubview(BTNImage2)
            BTNImage2.translatesAutoresizingMaskIntoConstraints = false
            
            BTNImage2.topAnchor.constraint(equalTo: button2.topAnchor, constant: 20).isActive = true
            BTNImage2.leadingAnchor.constraint(equalTo: button2.leadingAnchor, constant: 35).isActive = true
            BTNImage2.trailingAnchor.constraint(equalTo: button2.trailingAnchor, constant: -35).isActive = true
            BTNImage2.bottomAnchor.constraint(equalTo: button2.bottomAnchor, constant: -20).isActive = true
            BTNImage2.image = UIImage(named: "patientMenu2")
            
            BTNImage3 = UIImageView(frame: .zero)
            button3.addSubview(BTNImage3)
            BTNImage3.translatesAutoresizingMaskIntoConstraints = false
            
            BTNImage3.topAnchor.constraint(equalTo: button3.topAnchor, constant: 20).isActive = true
            BTNImage3.leadingAnchor.constraint(equalTo: button3.leadingAnchor, constant: 35).isActive = true
            BTNImage3.trailingAnchor.constraint(equalTo: button3.trailingAnchor, constant: -35).isActive = true
            BTNImage3.bottomAnchor.constraint(equalTo: button3.bottomAnchor, constant: -20).isActive = true
            BTNImage3.image = UIImage(named: "patientMenu3")
            
            BTNImage4 = UIImageView(frame: .zero)
            button4.addSubview(BTNImage4)
            BTNImage4.translatesAutoresizingMaskIntoConstraints = false
            
            BTNImage4.topAnchor.constraint(equalTo: button4.topAnchor, constant: 20).isActive = true
            BTNImage4.leadingAnchor.constraint(equalTo: button4.leadingAnchor, constant: 35).isActive = true
            BTNImage4.trailingAnchor.constraint(equalTo: button4.trailingAnchor, constant: -35).isActive = true
            BTNImage4.bottomAnchor.constraint(equalTo: button4.bottomAnchor, constant: -20).isActive = true
            BTNImage4.image = UIImage(named: "patientMenu4")
            
            BTNImage5 = UIImageView(frame: .zero)
            button5.addSubview(BTNImage5)
            BTNImage5.translatesAutoresizingMaskIntoConstraints = false
            
            BTNImage5.topAnchor.constraint(equalTo: button5.topAnchor, constant: 20).isActive = true
            BTNImage5.leadingAnchor.constraint(equalTo: button5.leadingAnchor, constant: 35).isActive = true
            BTNImage5.trailingAnchor.constraint(equalTo: button5.trailingAnchor, constant: -35).isActive = true
            BTNImage5.bottomAnchor.constraint(equalTo: button5.bottomAnchor, constant: -20).isActive = true
            BTNImage5.image = UIImage(named: "patientMenu5")
        } else if IS_IPHONE_N_PLUS {
            BTNImage1 = UIImageView(frame: .zero)
            button.addSubview(BTNImage1)
            BTNImage1.translatesAutoresizingMaskIntoConstraints = false
            
            BTNImage1.topAnchor.constraint(equalTo: button.topAnchor, constant: 15).isActive = true
            BTNImage1.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: 30).isActive = true
            BTNImage1.trailingAnchor.constraint(equalTo: button.trailingAnchor, constant: -30).isActive = true
            BTNImage1.bottomAnchor.constraint(equalTo: button.bottomAnchor, constant: -15).isActive = true
            BTNImage1.image = UIImage(named: "patientMenu1")
            
            BTNImage2 = UIImageView(frame: .zero)
            button2.addSubview(BTNImage2)
            BTNImage2.translatesAutoresizingMaskIntoConstraints = false
            
            BTNImage2.topAnchor.constraint(equalTo: button2.topAnchor, constant: 15).isActive = true
            BTNImage2.leadingAnchor.constraint(equalTo: button2.leadingAnchor, constant: 30).isActive = true
            BTNImage2.trailingAnchor.constraint(equalTo: button2.trailingAnchor, constant: -30).isActive = true
            BTNImage2.bottomAnchor.constraint(equalTo: button2.bottomAnchor, constant: -15).isActive = true
            BTNImage2.image = UIImage(named: "patientMenu2")
            
            BTNImage3 = UIImageView(frame: .zero)
            button3.addSubview(BTNImage3)
            BTNImage3.translatesAutoresizingMaskIntoConstraints = false
            
            BTNImage3.topAnchor.constraint(equalTo: button3.topAnchor, constant: 15).isActive = true
            BTNImage3.leadingAnchor.constraint(equalTo: button3.leadingAnchor, constant: 30).isActive = true
            BTNImage3.trailingAnchor.constraint(equalTo: button3.trailingAnchor, constant: -30).isActive = true
            BTNImage3.bottomAnchor.constraint(equalTo: button3.bottomAnchor, constant: -15).isActive = true
            BTNImage3.image = UIImage(named: "patientMenu3")
            
            BTNImage4 = UIImageView(frame: .zero)
            button4.addSubview(BTNImage4)
            BTNImage4.translatesAutoresizingMaskIntoConstraints = false
            
            BTNImage4.topAnchor.constraint(equalTo: button4.topAnchor, constant: 15).isActive = true
            BTNImage4.leadingAnchor.constraint(equalTo: button4.leadingAnchor, constant: 30).isActive = true
            BTNImage4.trailingAnchor.constraint(equalTo: button4.trailingAnchor, constant: -30).isActive = true
            BTNImage4.bottomAnchor.constraint(equalTo: button4.bottomAnchor, constant: -15).isActive = true
            BTNImage4.image = UIImage(named: "patientMenu4")
            
            BTNImage5 = UIImageView(frame: .zero)
            button5.addSubview(BTNImage5)
            BTNImage5.translatesAutoresizingMaskIntoConstraints = false
            
            BTNImage5.topAnchor.constraint(equalTo: button5.topAnchor, constant: 15).isActive = true
            BTNImage5.leadingAnchor.constraint(equalTo: button5.leadingAnchor, constant: 30).isActive = true
            BTNImage5.trailingAnchor.constraint(equalTo: button5.trailingAnchor, constant: -30).isActive = true
            BTNImage5.bottomAnchor.constraint(equalTo: button5.bottomAnchor, constant: -15).isActive = true
            BTNImage5.image = UIImage(named: "patientMenu5")
            
        } else if IS_IPHONE_N {
            BTNImage1 = UIImageView(frame: .zero)
            button.addSubview(BTNImage1)
            BTNImage1.translatesAutoresizingMaskIntoConstraints = false
            
            BTNImage1.topAnchor.constraint(equalTo: button.topAnchor, constant: 13).isActive = true
            BTNImage1.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: 25).isActive = true
            BTNImage1.trailingAnchor.constraint(equalTo: button.trailingAnchor, constant: -25).isActive = true
            BTNImage1.bottomAnchor.constraint(equalTo: button.bottomAnchor, constant: -13).isActive = true
            BTNImage1.image = UIImage(named: "patientMenu1")
            
            BTNImage2 = UIImageView(frame: .zero)
            button2.addSubview(BTNImage2)
            BTNImage2.translatesAutoresizingMaskIntoConstraints = false
            
            BTNImage2.topAnchor.constraint(equalTo: button2.topAnchor, constant: 13).isActive = true
            BTNImage2.leadingAnchor.constraint(equalTo: button2.leadingAnchor, constant: 25).isActive = true
            BTNImage2.trailingAnchor.constraint(equalTo: button2.trailingAnchor, constant: -25).isActive = true
            BTNImage2.bottomAnchor.constraint(equalTo: button2.bottomAnchor, constant: -13).isActive = true
            BTNImage2.image = UIImage(named: "patientMenu2")
            
            BTNImage3 = UIImageView(frame: .zero)
            button3.addSubview(BTNImage3)
            BTNImage3.translatesAutoresizingMaskIntoConstraints = false
            
            BTNImage3.topAnchor.constraint(equalTo: button3.topAnchor, constant: 13).isActive = true
            BTNImage3.leadingAnchor.constraint(equalTo: button3.leadingAnchor, constant: 25).isActive = true
            BTNImage3.trailingAnchor.constraint(equalTo: button3.trailingAnchor, constant: -25).isActive = true
            BTNImage3.bottomAnchor.constraint(equalTo: button3.bottomAnchor, constant: -13).isActive = true
            BTNImage3.image = UIImage(named: "patientMenu3")
            
            BTNImage4 = UIImageView(frame: .zero)
            button4.addSubview(BTNImage4)
            BTNImage4.translatesAutoresizingMaskIntoConstraints = false
            
            BTNImage4.topAnchor.constraint(equalTo: button4.topAnchor, constant: 13).isActive = true
            BTNImage4.leadingAnchor.constraint(equalTo: button4.leadingAnchor, constant: 25).isActive = true
            BTNImage4.trailingAnchor.constraint(equalTo: button4.trailingAnchor, constant: -25).isActive = true
            BTNImage4.bottomAnchor.constraint(equalTo: button4.bottomAnchor, constant: -13).isActive = true
            BTNImage4.image = UIImage(named: "patientMenu4")
            
            BTNImage5 = UIImageView(frame: .zero)
            button5.addSubview(BTNImage5)
            BTNImage5.translatesAutoresizingMaskIntoConstraints = false
            
            BTNImage5.topAnchor.constraint(equalTo: button5.topAnchor, constant: 13).isActive = true
            BTNImage5.leadingAnchor.constraint(equalTo: button5.leadingAnchor, constant: 25).isActive = true
            BTNImage5.trailingAnchor.constraint(equalTo: button5.trailingAnchor, constant: -25).isActive = true
            BTNImage5.bottomAnchor.constraint(equalTo: button5.bottomAnchor, constant: -13).isActive = true
            BTNImage5.image = UIImage(named: "patientMenu5")
            
            
        } else if IS_IPHONE_12PRO_MAX {
            BTNImage1 = UIImageView(frame: .zero)
            button.addSubview(BTNImage1)
            BTNImage1.translatesAutoresizingMaskIntoConstraints = false
            
            BTNImage1.topAnchor.constraint(equalTo: button.topAnchor, constant: 14).isActive = true
            BTNImage1.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: 30).isActive = true
            BTNImage1.trailingAnchor.constraint(equalTo: button.trailingAnchor, constant: -30).isActive = true
            BTNImage1.bottomAnchor.constraint(equalTo: button.bottomAnchor, constant: -14).isActive = true
            BTNImage1.image = UIImage(named: "patientMenu1")
            
            BTNImage2 = UIImageView(frame: .zero)
            button2.addSubview(BTNImage2)
            BTNImage2.translatesAutoresizingMaskIntoConstraints = false
            
            BTNImage2.topAnchor.constraint(equalTo: button2.topAnchor, constant: 14).isActive = true
            BTNImage2.leadingAnchor.constraint(equalTo: button2.leadingAnchor, constant: 30).isActive = true
            BTNImage2.trailingAnchor.constraint(equalTo: button2.trailingAnchor, constant: -30).isActive = true
            BTNImage2.bottomAnchor.constraint(equalTo: button2.bottomAnchor, constant: -14).isActive = true
            BTNImage2.image = UIImage(named: "patientMenu2")
            
            BTNImage3 = UIImageView(frame: .zero)
            button3.addSubview(BTNImage3)
            BTNImage3.translatesAutoresizingMaskIntoConstraints = false
            
            BTNImage3.topAnchor.constraint(equalTo: button3.topAnchor, constant: 14).isActive = true
            BTNImage3.leadingAnchor.constraint(equalTo: button3.leadingAnchor, constant: 30).isActive = true
            BTNImage3.trailingAnchor.constraint(equalTo: button3.trailingAnchor, constant: -30).isActive = true
            BTNImage3.bottomAnchor.constraint(equalTo: button3.bottomAnchor, constant: -14).isActive = true
            BTNImage3.image = UIImage(named: "patientMenu3")
            
            BTNImage4 = UIImageView(frame: .zero)
            button4.addSubview(BTNImage4)
            BTNImage4.translatesAutoresizingMaskIntoConstraints = false
            
            BTNImage4.topAnchor.constraint(equalTo: button4.topAnchor, constant: 14).isActive = true
            BTNImage4.leadingAnchor.constraint(equalTo: button4.leadingAnchor, constant: 30).isActive = true
            BTNImage4.trailingAnchor.constraint(equalTo: button4.trailingAnchor, constant: -30).isActive = true
            BTNImage4.bottomAnchor.constraint(equalTo: button4.bottomAnchor, constant: -14).isActive = true
            BTNImage4.image = UIImage(named: "patientMenu4")
            
            BTNImage5 = UIImageView(frame: .zero)
            button5.addSubview(BTNImage5)
            BTNImage5.translatesAutoresizingMaskIntoConstraints = false
            
            BTNImage5.topAnchor.constraint(equalTo: button5.topAnchor, constant: 14).isActive = true
            BTNImage5.leadingAnchor.constraint(equalTo: button5.leadingAnchor, constant: 30).isActive = true
            BTNImage5.trailingAnchor.constraint(equalTo: button5.trailingAnchor, constant: -30).isActive = true
            BTNImage5.bottomAnchor.constraint(equalTo: button5.bottomAnchor, constant: -14).isActive = true
            BTNImage5.image = UIImage(named: "patientMenu5")
        
        
        
        }  else if IS_IPHONE_12PRO {
            BTNImage1 = UIImageView(frame: .zero)
            button.addSubview(BTNImage1)
            BTNImage1.translatesAutoresizingMaskIntoConstraints = false
            
            BTNImage1.topAnchor.constraint(equalTo: button.topAnchor, constant: 18).isActive = true
            BTNImage1.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: 26).isActive = true
            BTNImage1.trailingAnchor.constraint(equalTo: button.trailingAnchor, constant: -26).isActive = true
            BTNImage1.bottomAnchor.constraint(equalTo: button.bottomAnchor, constant: -18).isActive = true
            BTNImage1.image = UIImage(named: "patientMenu1")
            
            BTNImage2 = UIImageView(frame: .zero)
            button2.addSubview(BTNImage2)
            BTNImage2.translatesAutoresizingMaskIntoConstraints = false
            
            BTNImage2.topAnchor.constraint(equalTo: button2.topAnchor, constant: 18).isActive = true
            BTNImage2.leadingAnchor.constraint(equalTo: button2.leadingAnchor, constant: 26).isActive = true
            BTNImage2.trailingAnchor.constraint(equalTo: button2.trailingAnchor, constant: -26).isActive = true
            BTNImage2.bottomAnchor.constraint(equalTo: button2.bottomAnchor, constant: -18).isActive = true
            BTNImage2.image = UIImage(named: "patientMenu2")
            
            BTNImage3 = UIImageView(frame: .zero)
            button3.addSubview(BTNImage3)
            BTNImage3.translatesAutoresizingMaskIntoConstraints = false
            
            BTNImage3.topAnchor.constraint(equalTo: button3.topAnchor, constant: 18).isActive = true
            BTNImage3.leadingAnchor.constraint(equalTo: button3.leadingAnchor, constant: 26).isActive = true
            BTNImage3.trailingAnchor.constraint(equalTo: button3.trailingAnchor, constant: -26).isActive = true
            BTNImage3.bottomAnchor.constraint(equalTo: button3.bottomAnchor, constant: -18).isActive = true
            BTNImage3.image = UIImage(named: "patientMenu3")
            
            BTNImage4 = UIImageView(frame: .zero)
            button4.addSubview(BTNImage4)
            BTNImage4.translatesAutoresizingMaskIntoConstraints = false
            
            BTNImage4.topAnchor.constraint(equalTo: button4.topAnchor, constant: 18).isActive = true
            BTNImage4.leadingAnchor.constraint(equalTo: button4.leadingAnchor, constant: 26).isActive = true
            BTNImage4.trailingAnchor.constraint(equalTo: button4.trailingAnchor, constant: -26).isActive = true
            BTNImage4.bottomAnchor.constraint(equalTo: button4.bottomAnchor, constant: -18).isActive = true
            BTNImage4.image = UIImage(named: "patientMenu4")
            
            BTNImage5 = UIImageView(frame: .zero)
            button5.addSubview(BTNImage5)
            BTNImage5.translatesAutoresizingMaskIntoConstraints = false
            
            BTNImage5.topAnchor.constraint(equalTo: button5.topAnchor, constant: 18).isActive = true
            BTNImage5.leadingAnchor.constraint(equalTo: button5.leadingAnchor, constant: 26).isActive = true
            BTNImage5.trailingAnchor.constraint(equalTo: button5.trailingAnchor, constant: -26).isActive = true
            BTNImage5.bottomAnchor.constraint(equalTo: button5.bottomAnchor, constant: -18).isActive = true
            BTNImage5.image = UIImage(named: "patientMenu5")
            
            
            
        } else if IS_IPHONE_15PRO {
            BTNImage1 = UIImageView(frame: .zero)
            button.addSubview(BTNImage1)
            BTNImage1.translatesAutoresizingMaskIntoConstraints = false
            
            BTNImage1.topAnchor.constraint(equalTo: button.topAnchor, constant: 18).isActive = true
            BTNImage1.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: 26).isActive = true
            BTNImage1.trailingAnchor.constraint(equalTo: button.trailingAnchor, constant: -26).isActive = true
            BTNImage1.bottomAnchor.constraint(equalTo: button.bottomAnchor, constant: -18).isActive = true
            BTNImage1.image = UIImage(named: "patientMenu1")
            
            BTNImage2 = UIImageView(frame: .zero)
            button2.addSubview(BTNImage2)
            BTNImage2.translatesAutoresizingMaskIntoConstraints = false
            
            BTNImage2.topAnchor.constraint(equalTo: button2.topAnchor, constant: 18).isActive = true
            BTNImage2.leadingAnchor.constraint(equalTo: button2.leadingAnchor, constant: 26).isActive = true
            BTNImage2.trailingAnchor.constraint(equalTo: button2.trailingAnchor, constant: -26).isActive = true
            BTNImage2.bottomAnchor.constraint(equalTo: button2.bottomAnchor, constant: -18).isActive = true
            BTNImage2.image = UIImage(named: "patientMenu2")
            
            BTNImage3 = UIImageView(frame: .zero)
            button3.addSubview(BTNImage3)
            BTNImage3.translatesAutoresizingMaskIntoConstraints = false
            
            BTNImage3.topAnchor.constraint(equalTo: button3.topAnchor, constant: 18).isActive = true
            BTNImage3.leadingAnchor.constraint(equalTo: button3.leadingAnchor, constant: 26).isActive = true
            BTNImage3.trailingAnchor.constraint(equalTo: button3.trailingAnchor, constant: -26).isActive = true
            BTNImage3.bottomAnchor.constraint(equalTo: button3.bottomAnchor, constant: -18).isActive = true
            BTNImage3.image = UIImage(named: "patientMenu3")
            
            BTNImage4 = UIImageView(frame: .zero)
            button4.addSubview(BTNImage4)
            BTNImage4.translatesAutoresizingMaskIntoConstraints = false
            
            BTNImage4.topAnchor.constraint(equalTo: button4.topAnchor, constant: 18).isActive = true
            BTNImage4.leadingAnchor.constraint(equalTo: button4.leadingAnchor, constant: 26).isActive = true
            BTNImage4.trailingAnchor.constraint(equalTo: button4.trailingAnchor, constant: -26).isActive = true
            BTNImage4.bottomAnchor.constraint(equalTo: button4.bottomAnchor, constant: -18).isActive = true
            BTNImage4.image = UIImage(named: "patientMenu4")
            
            BTNImage5 = UIImageView(frame: .zero)
            button5.addSubview(BTNImage5)
            BTNImage5.translatesAutoresizingMaskIntoConstraints = false
            
            BTNImage5.topAnchor.constraint(equalTo: button5.topAnchor, constant: 18).isActive = true
            BTNImage5.leadingAnchor.constraint(equalTo: button5.leadingAnchor, constant: 26).isActive = true
            BTNImage5.trailingAnchor.constraint(equalTo: button5.trailingAnchor, constant: -26).isActive = true
            BTNImage5.bottomAnchor.constraint(equalTo: button5.bottomAnchor, constant: -18).isActive = true
            BTNImage5.image = UIImage(named: "patientMenu5")
            
            
            
        } else {
            BTNImage1 = UIImageView(frame: .zero)
            button.addSubview(BTNImage1)
            BTNImage1.translatesAutoresizingMaskIntoConstraints = false
            
            BTNImage1.topAnchor.constraint(equalTo: button.topAnchor, constant: 18).isActive = true
            BTNImage1.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: 35).isActive = true
            BTNImage1.trailingAnchor.constraint(equalTo: button.trailingAnchor, constant: -35).isActive = true
            BTNImage1.bottomAnchor.constraint(equalTo: button.bottomAnchor, constant: -18).isActive = true
            BTNImage1.image = UIImage(named: "patientMenu1")
            
            BTNImage2 = UIImageView(frame: .zero)
            button2.addSubview(BTNImage2)
            BTNImage2.translatesAutoresizingMaskIntoConstraints = false
            
            BTNImage2.topAnchor.constraint(equalTo: button2.topAnchor, constant: 18).isActive = true
            BTNImage2.leadingAnchor.constraint(equalTo: button2.leadingAnchor, constant: 35).isActive = true
            BTNImage2.trailingAnchor.constraint(equalTo: button2.trailingAnchor, constant: -35).isActive = true
            BTNImage2.bottomAnchor.constraint(equalTo: button2.bottomAnchor, constant: -18).isActive = true
            BTNImage2.image = UIImage(named: "patientMenu2")
            
            BTNImage3 = UIImageView(frame: .zero)
            button3.addSubview(BTNImage3)
            BTNImage3.translatesAutoresizingMaskIntoConstraints = false
            
            BTNImage3.topAnchor.constraint(equalTo: button3.topAnchor, constant: 18).isActive = true
            BTNImage3.leadingAnchor.constraint(equalTo: button3.leadingAnchor, constant: 35).isActive = true
            BTNImage3.trailingAnchor.constraint(equalTo: button3.trailingAnchor, constant: -35).isActive = true
            BTNImage3.bottomAnchor.constraint(equalTo: button3.bottomAnchor, constant: -18).isActive = true
            BTNImage3.image = UIImage(named: "patientMenu3")
            
            BTNImage4 = UIImageView(frame: .zero)
            button4.addSubview(BTNImage4)
            BTNImage4.translatesAutoresizingMaskIntoConstraints = false
            
            BTNImage4.topAnchor.constraint(equalTo: button4.topAnchor, constant: 18).isActive = true
            BTNImage4.leadingAnchor.constraint(equalTo: button4.leadingAnchor, constant: 35).isActive = true
            BTNImage4.trailingAnchor.constraint(equalTo: button4.trailingAnchor, constant: -35).isActive = true
            BTNImage4.bottomAnchor.constraint(equalTo: button4.bottomAnchor, constant: -18).isActive = true
            BTNImage4.image = UIImage(named: "patientMenu4")
            
            BTNImage5 = UIImageView(frame: .zero)
            button5.addSubview(BTNImage5)
            BTNImage5.translatesAutoresizingMaskIntoConstraints = false
            
            BTNImage5.topAnchor.constraint(equalTo: button5.topAnchor, constant: 18).isActive = true
            BTNImage5.leadingAnchor.constraint(equalTo: button5.leadingAnchor, constant: 35).isActive = true
            BTNImage5.trailingAnchor.constraint(equalTo: button5.trailingAnchor, constant: -35).isActive = true
            BTNImage5.bottomAnchor.constraint(equalTo: button5.bottomAnchor, constant: -18).isActive = true
            BTNImage5.image = UIImage(named: "patientMenu5")
        }
        
        
        
        
        
        let buttonStackViewLabel = UIStackView(frame: CGRect(x: 20, y: buttonStackView.frame.maxY, width: SCREEN.WIDTH - 40, height: 40))
        buttonStackViewLabel.alignment = .fill
        buttonStackViewLabel.distribution = .fillEqually
        buttonStackViewLabel.spacing = 0.8
        
        
        
        
        buttonStackViewLabel.addArrangedSubview(label)
        buttonStackViewLabel.addArrangedSubview(label2)
        buttonStackViewLabel.addArrangedSubview(label3)
//        buttonStackViewLabel.addArrangedSubview(label4)
//        buttonStackViewLabel.addArrangedSubview(label5)
        
        patientView.addSubview(buttonStackViewLabel)
        
        
        let buttonStackViewLabel2 = UIStackView(frame: CGRect(x: 20, y: buttonStackView2.frame.maxY, width: SCREEN.WIDTH - 40, height: 40))
        buttonStackViewLabel2.alignment = .fill
        buttonStackViewLabel2.distribution = .fillEqually
        buttonStackViewLabel2.spacing = 0.8
        
        buttonStackViewLabel2.addArrangedSubview(label4)
        buttonStackViewLabel2.addArrangedSubview(label5)
        buttonStackViewLabel2.addArrangedSubview(label6)

        
        
        patientView.addSubview(buttonStackViewLabel2)
        
        // only native view backbtn( pag View, photo view ...)
        //rgb 22 18 63
//        subTitleView = UIView(frame: CGRect(x: 0, y: naviBar.frame.maxY, width: SCREEN.WIDTH, height: 40))
//        subTitleView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
//        self.view.addSubview(subTitleView)
        
        footer = UIView(frame: CGRect(x: 0, y: self.view.frame.maxY - 65, width: self.view.frame.width, height: 65))
        footer.backgroundColor = .black
        self.view.addSubview(footer)
        
        testButton = UIButton(frame: CGRect(x: 20, y: 0, width: 80, height: footer.frame.height))
        

        
        
        
        testButton.setTitle("NOTICE  | ", for: .normal)
        testButton.titleLabel?.font = UIFont(name: "SUITE-Regular", size: 14)
        testButton.setTitleColor(.white, for: .normal)
//        testButton.addTarget(self, action: #selector(go(_ :)), for: .touchUpInside)
        testButton.contentHorizontalAlignment = .left
        footer.addSubview(testButton)
        
        testButton.addTarget(self, action: #selector(goNotice(_ :)), for: .touchUpInside)
        
        
        noticeValueLabel = UILabel(frame: CGRect(x: testButton.frame.maxX + 3, y: 0, width: SCREEN.WIDTH - 100, height: footer.frame.height))
//        noticeValueLabel.text = "뇌졸중 예후 예측 관리시스템이 오픈했습니다."
        noticeValueLabel.textColor = UIColor.white
        noticeValueLabel.font = UIFont(name: "SUITE-Regular", size: 14)
        noticeValueLabel.font = UIFont(name: Nanum_Barun_Gothic_OTF_Light, size: 13)
        footer.addSubview(noticeValueLabel)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(goNotice(_:))) // UIImageView 클릭 제스쳐
        footer.addGestureRecognizer(tapGesture)
        footer.isUserInteractionEnabled = true
        
        self.noticeUpdate()
        
        
        
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: naviBar.frame.maxY).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: patientView.bottomAnchor, constant: 65).isActive = true
        
        if IS_IPHONE_N {
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: naviBar.frame.maxY).isActive = true
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            scrollView.bottomAnchor.constraint(equalTo: patientView.bottomAnchor, constant: 80).isActive = true
        }
        
        
      
    }
    
    @objc func partnerProfileTap(_ gesture: UITapGestureRecognizer) {
           print("partnerProfileTap")
       }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        get()
        dataUpdateBl()
        dataUpdateD()
        dataUpdateB()
        dataUpdateSu()
    }
    
    
    
    func noticeUpdate(){
        Server.getData(type: .GET_NOTICE, otherInfo: nil) { (kData : Data?) in
            if let data = kData {
                if let noticeString = data.toString() {
                    self.noticeValueLabel.text = noticeString
                }
            }
        }
    }
        
        
        
        
    
    
//    @objc func test(_ sender: UIButton) {
//        myTableView.isHidden = false
//        managementTableView.isHidden = true
//        
//        goBrain.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
//        managementbrain.backgroundColor = #colorLiteral(red: 0.0745619908, green: 0.1568424106, blue: 0.2876431346, alpha: 1)
//        
//        
//        dataArray = dataList
//        myTableView.reloadData()
//        
//    }
//    
//    @objc func test2(_ sender: UIButton) {
//        managementTableView.isHidden = false
//        myTableView.isHidden = true
//        
//        goBrain.backgroundColor = #colorLiteral(red: 0.0745619908, green: 0.1568424106, blue: 0.2876431346, alpha: 1)
//        managementbrain.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
//        
//        dataArray = dataList2
//        managementTableView.reloadData()
//        
//    }
    
    
    class MainButton: UIButton {

        var innerView : UIView!
        var iconImageBackView : UIView!
        var iconImageView : UIImageView!
        var nameLabel : UILabel!

        init(frame: CGRect, imageName : String, name : String) {
            super.init(frame: frame)

            self.backgroundColor = UIColor.clear

            innerView = UIView(frame: self.bounds)
            innerView.isUserInteractionEnabled = false
            self.addSubview(innerView)

    //        var iconImageBackViewRatio : CGFloat = 0.75
            var iconImageBackViewRatio : CGFloat = 1
            if !IS_NORCH {
                iconImageBackViewRatio = 0.8
            }
            if IS_IPHONE_N {
                iconImageBackViewRatio = 0.8
            }
            if IS_IPHONE_N_PLUS {
                iconImageBackViewRatio = 0.8
            }
            if IS_IPHONE_SE {
                iconImageBackViewRatio = 0.8
            }
            if IS_IPHONE_X {
                iconImageBackViewRatio = 0.8
            }
            if IS_IPHONE_12PRO {
                iconImageBackViewRatio = 0.8
            }
            
            iconImageBackView = UIView(frame: CGRect(x: 15, y: 0, width: self.frame.size.width * iconImageBackViewRatio, height: (self.frame.size.width * iconImageBackViewRatio) + 20 ))
    //        iconImageBackView.backgroundColor = #colorLiteral(red: 0.2833741903, green: 0.777308166, blue: 0.9628484845, alpha: 1)
            iconImageBackView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            

//            if name == "뇌졸중관리" {
//                iconImageBackView.backgroundColor = #colorLiteral(red: 0.3217396438, green: 0.4377208352, blue: 0.9273169637, alpha: 1)
//            } else if name == "혈압관리" {
//                iconImageBackView.backgroundColor = #colorLiteral(red: 0.8247565627, green: 0.2676169872, blue: 0.3877614737, alpha: 1)
//            } else if name == "당뇨관리" {
//                iconImageBackView.backgroundColor = #colorLiteral(red: 0.154723078, green: 0.7071833014, blue: 0.9409560561, alpha: 1)
//            } else if name == "이상지혈증관리" {
//                iconImageBackView.backgroundColor = #colorLiteral(red: 0.1993858814, green: 0.2966046333, blue: 0.6639896035, alpha: 1)
//            } else if name == "비만관리및운동" {
//                iconImageBackView.backgroundColor = #colorLiteral(red: 0.1461726725, green: 0.2094348371, blue: 0.4075749516, alpha: 1)
//            } else if name == "약물복용관리" {
//                iconImageBackView.backgroundColor = #colorLiteral(red: 0.002265253104, green: 0.7014663815, blue: 0.6793519258, alpha: 1)
//            }
            
     

            
            
//            iconImageBackView.center.x = innerView.frame.size.width / 2
//            iconImageBackView.layer.cornerRadius = iconImageBackView.frame.size.width / 2
            iconImageBackView.layer.cornerRadius = 12
//            iconImageBackView.layer.borderWidth = 1
            innerView.addSubview(iconImageBackView)
            
            let iconImageViewRatio : CGFloat = 0.65
//            iconImageView  = UIImageView(frame: iconImageBackView.bounds)
//            iconImageView.frame.size.width *= iconImageViewRatio
//            iconImageView.frame.size.height *= iconImageViewRatio
            iconImageView = UIImageView(frame: CGRect(x: 45, y: 40, width: 100, height: 100))
            iconImageBackView.addSubview(iconImageView)
//            if IS_IPHONE_N {
//                iconImageView = UIImageView(frame: CGRect(x: 30, y: 20, width: 70, height: 70))
//                iconImageBackView.addSubview(iconImageView)
//            }
//            if IS_IPHONE_N_PLUS {
//                iconImageView = UIImageView(frame: CGRect(x: 46, y: 37, width: 85, height: 70))
//                iconImageBackView.addSubview(iconImageView)
//            }
//            if IS_IPHONE_X {
//                iconImageView = UIImageView(frame: CGRect(x: 42, y: 28, width: 70, height: 70))
//                iconImageBackView.addSubview(iconImageView)
//            }
            
            iconImageView.translatesAutoresizingMaskIntoConstraints = false
            iconImageBackView.addSubview(iconImageView)
            
            iconImageView.centerXAnchor.constraint(equalTo: iconImageBackView.centerXAnchor).isActive = true
            iconImageView.centerYAnchor.constraint(equalTo: iconImageBackView.centerYAnchor, constant:  -20).isActive = true
            iconImageView.widthAnchor.constraint(equalToConstant: iconImageBackView.frame.size.width * 0.35).isActive = true
            iconImageView.heightAnchor.constraint(equalToConstant: iconImageBackView.frame.size.height * 0.35).isActive = true
            
            
            
            
            

            if let iconImage = UIImage(named: imageName) {
                if iconImage.size.width > iconImage.size.height {
                    iconImageView.setImageWithFrameHeight(image: iconImage)
                }else{
                    iconImageView.setImageWithFrameWidth(image: iconImage)
                }
            }
//            iconImageView.center = iconImageBackView.frame.center
//            iconImageView.center = iconImageBackView.center
            if IS_IPHONE_12PRO_MAX {
                nameLabel = UILabel(frame: CGRect(x: 0, y: iconImageView.frame.maxY, width: 500, height: 50))
                nameLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                nameLabel.textAlignment = .center
                nameLabel.font = UIFont(name: "SUITE-Heavy", size: 16)
//                nameLabel.font = UIFont(name: Nanum_Barun_Gothic_OTF_Bold, size: 16)
//                nameLabel.font = UIFont(name: "SUITE-Regular", size: 16)
                
                nameLabel.numberOfLines = 0
                nameLabel.sizeToFit()
    nameLabel.center.y = self.frame.size.height / 1.5
                nameLabel.isUserInteractionEnabled = false
                iconImageBackView.addSubview(nameLabel)
        
//            nameLabel.frame.origin.y = iconImageView.frame.maxY + 5
    nameLabel.center.x = innerView.frame.size.width / 2
    nameLabel.text = name
    nameLabel.sizeToFit()
    nameLabel.center.x = self.frame.size.width / 2

    innerView.frame.size.height = nameLabel.frame.maxY
    innerView.center.y = self.frame.size.height * 0.5
            }
            
            if IS_IPHONE_N_PLUS {
                nameLabel = UILabel(frame: CGRect(x: 0, y: iconImageView.frame.maxY, width: 500, height: 50))
                nameLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                nameLabel.textAlignment = .center
//                nameLabel.font = UIFont(name: Nanum_Barun_Gothic_OTF_Bold, size: 1)
//                nameLabel.font = UIFont(name: "SUITE-Regular", size: 16)
                nameLabel.font = UIFont(name: "SUITE-Heavy", size: 16)
                
                nameLabel.numberOfLines = 0
                nameLabel.sizeToFit()
    nameLabel.center.y = self.frame.size.height / 1.5 + 20
                nameLabel.isUserInteractionEnabled = false
                iconImageBackView.addSubview(nameLabel)
        
//            nameLabel.frame.origin.y = iconImageView.frame.maxY + 5
                nameLabel.center.x = innerView.frame.size.width / 2.5
    nameLabel.text = name
    nameLabel.sizeToFit()
                nameLabel.center.x = self.frame.size.width / 2.5

    innerView.frame.size.height = nameLabel.frame.maxY
    innerView.center.y = self.frame.size.height * 0.5
            }
            
            
            if IS_IPHONE_12PRO {
                nameLabel = UILabel(frame: CGRect(x: 0, y: iconImageView.frame.maxY, width: 500, height: 50))
                nameLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                nameLabel.textAlignment = .center
//                nameLabel.font = UIFont(name: Nanum_Barun_Gothic_OTF_Bold, size: 1)
//                nameLabel.font = UIFont(name: "SUITE-Regular", size: 16)
                nameLabel.font = UIFont(name: "SUITE-Heavy", size: 16)
                
                nameLabel.numberOfLines = 0
                nameLabel.sizeToFit()
    nameLabel.center.y = self.frame.size.height / 1.5 + 20
                nameLabel.isUserInteractionEnabled = false
                iconImageBackView.addSubview(nameLabel)
        
//            nameLabel.frame.origin.y = iconImageView.frame.maxY + 5
                nameLabel.center.x = innerView.frame.size.width / 2.5
    nameLabel.text = name
    nameLabel.sizeToFit()
                nameLabel.center.x = self.frame.size.width / 2.5

    innerView.frame.size.height = nameLabel.frame.maxY
    innerView.center.y = self.frame.size.height * 0.5
            }
            
            
            
            if IS_IPHONE_X {
                nameLabel = UILabel(frame: CGRect(x: 0, y: iconImageView.frame.maxY, width: 500, height: 50))
                nameLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                nameLabel.textAlignment = .center
//                nameLabel.font = UIFont(name: Nanum_Barun_Gothic_OTF_Bold, size: 16)
                nameLabel.font = UIFont(name: "SUITE-Regular", size: 18)
                
                nameLabel.numberOfLines = 0
                nameLabel.sizeToFit()
                nameLabel.center.y = self.frame.size.height / 1.8
                nameLabel.isUserInteractionEnabled = false
                iconImageBackView.addSubview(nameLabel)
        
//            nameLabel.frame.origin.y = iconImageView.frame.maxY + 5
                nameLabel.center.x = innerView.frame.size.width / 2.6
    nameLabel.text = name
    nameLabel.sizeToFit()
                nameLabel.center.x = self.frame.size.width / 2.6 + 3

    innerView.frame.size.height = nameLabel.frame.maxY
    innerView.center.y = self.frame.size.height * 0.5
            }
            
            if IS_IPHONE_N {
                nameLabel = UILabel(frame: CGRect(x: 0, y: iconImageView.frame.maxY - 40, width: 500, height: 50))
                nameLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                nameLabel.textAlignment = .center
//                nameLabel.font = UIFont(name: Nanum_Barun_Gothic_OTF_Bold, size: 1)
//                nameLabel.font = UIFont(name: "SUITE-Regular", size: 16)
                nameLabel.font = UIFont(name: "SUITE-Heavy", size: 10)
                
                nameLabel.numberOfLines = 0
                nameLabel.sizeToFit()
                
    nameLabel.center.y = self.frame.size.height / 1.5 - 25
                nameLabel.isUserInteractionEnabled = false
                iconImageBackView.addSubview(nameLabel)
        
                
//            nameLabel.frame.origin.y = iconImageView.frame.maxY + 5
                nameLabel.center.x = innerView.frame.size.width / 2.5
    nameLabel.text = name
    nameLabel.sizeToFit()
                nameLabel.frame.size.height = 30
                nameLabel.center.x = self.frame.size.width / 2.5

    innerView.frame.size.height = nameLabel.frame.maxY
    innerView.center.y = self.frame.size.height * 0.5
            }
            
      
                        if IS_IPHONE_12PRO_MAX {
//                            nameLabel.font = UIFont(name: Nanum_Barun_Gothic_OTF_Bold, size: 14)
                            nameLabel.font = UIFont(name: "SUITE-Regular", size: 16)
                            
                        }
                        if IS_IPHONE_X {
                            
//                            nameLabel.font = UIFont(name: Nanum_Barun_Gothic_OTF_Bold, size: 14)
                            nameLabel.font = UIFont(name: "SUITE-Regular", size: 18)
                        }
                        if IS_IPHONE_N {
//                            nameLabel = UILabel(frame: CGRect(x: iconImageBackView.frame.minX, y: iconImageView.frame.maxY, width: 500, height: 50))
//                            nameLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
//                            nameLabel.textAlignment = .center
////                            nameLabel.font = UIFont(name: Nanum_Barun_Gothic_OTF_Bold, size: 12)
                            nameLabel.font = UIFont(name: "SUITE-Regular", size: 11)
                            
                        }
                        if IS_IPHONE_SE {
//                            nameLabel.font = UIFont(name: Nanum_Barun_Gothic_OTF_Bold, size: 10)
                            nameLabel.font = UIFont(name: "SUITE-Regular", size: 14)
                        }
        
            if IS_IPHONE_N_PLUS {
//                nameLabel.font = UIFont(name: Nanum_Barun_Gothic_OTF_Bold, size: 1)
                nameLabel.font = UIFont(name: "SUITE-Regular", size: 16)
            }
                        
            
            
            
            
//            nameLabel = UILabel(frame: CGRect(x: 0, y: iconImageView.frame.maxY, width: 500, height: 50))
//            nameLabel.textColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
//            nameLabel.textAlignment = .center
//            nameLabel.font = UIFont(name: Nanum_Barun_Gothic_OTF_Bold, size: 16)
//                        if IS_IPHONE_12PRO {
//                            nameLabel.font = UIFont(name: Nanum_Barun_Gothic_OTF_Bold, size: 14)
//                        }
//                        if IS_IPHONE_X {
//                            
//                            nameLabel.font = UIFont(name: Nanum_Barun_Gothic_OTF_Bold, size: 14)
//                        }
//                        if IS_IPHONE_N {
//                            nameLabel = UILabel(frame: CGRect(x: iconImageBackView.frame.minX, y: iconImageView.frame.maxY, width: 500, height: 50))
//                            nameLabel.textColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
//                            nameLabel.textAlignment = .center
//                            nameLabel.font = UIFont(name: Nanum_Barun_Gothic_OTF_Bold, size: 12)
//                            
//                        }
//                        if IS_IPHONE_SE {
//                            nameLabel.font = UIFont(name: Nanum_Barun_Gothic_OTF_Bold, size: 10)
//                        }
//                        nameLabel.numberOfLines = 0
//                        nameLabel.sizeToFit()
//            nameLabel.center.y = self.frame.size.height / 1.5
//                        nameLabel.isUserInteractionEnabled = false
//                        iconImageBackView.addSubview(nameLabel)
//                
////            nameLabel.frame.origin.y = iconImageView.frame.maxY + 5
//            nameLabel.center.x = innerView.frame.size.width / 2
//            nameLabel.text = name
//            nameLabel.sizeToFit()
//            nameLabel.center.x = self.frame.size.width / 2
//
//            innerView.frame.size.height = nameLabel.frame.maxY
//            innerView.center.y = self.frame.size.height * 0.5
        }

        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    
    func goURL(urlString : String, popAnimation : Bool = false, pushAnimation : Bool = true ){
        print("goURL urlstring:\(urlString)")

        
        //....
        let webVC = GoWebViewController()
        webVC.urlString = urlString
        
        
        webVC.modalPresentationStyle = .fullScreen
//        self.navigationController?.pushViewController(webVC, animated: true)
        self.present(webVC, animated: true)
        
        
        
        
        // ....
        
//
        
//        let webVC = GoWebViewController()
//        webVC.urlString = urlString
//        
//        sceneDel?.naviCon?.popToRootViewController(animated: popAnimation)
//        sceneDel?.naviCon?.pushViewController(webVC, animated: pushAnimation)
//        sceneDel?.leftView?.close()
        
       //.....
        
        
//        webVC.hideSubTitleView = true

//        appDel.naviCon?.popToRootViewController(animated: popAnimation)
//        appDel.naviCon?.pushViewController(webVC, animated: pushAnimation)
//        appDel.leftView?.close()
        
        
        
        
        
//        self.goURL(urlString: webVC.urlString, pushAnimation: true)
        
        
//        webVC.urlString = urlString
//        webVC.hideSubTitleView = true

//        appDel.naviCon?.popToRootViewController(animated: popAnimation)
//        appDel.naviCon?.pushViewController(webVC, animated: pushAnimation)
//        appDel.leftView?.close()

        
        
        
    }
    
    @objc func go(_ sender: UIButton) {
        
        
        
        if UserDefaults.standard.string(forKey: "numtf") ?? "" != "" {
            print("use")
            
            //post data
            let url = "http://strokedb.or.kr/app_new/get_user.asp"
    //        let regNumString = "SB-12500-1"
            
            let para = ["reg_num" : UserDefaults.standard.string(forKey: "numtf")! ?? ""
    //                    "user_id" : idTF.text!,
    //                    "passwd" : pwTF.text!,
    //                    "re_passwd" : rePWTF.text!,
    //                    "email1" : answermail1.text!,
    //                    "email2" : answermail2.text!,
    //                    "hospital" : answerHospital.text!,
    //                    "birth" : answerBitrh.text!,
    //                    "sex" : "F"
    //                                                   "img" : self.photoImage.image?.jpegData(compressionQuality: 1)!,
    ]
     
            
            
            
            
            
            
            AF.request(url, method: .post, parameters: para, encoding: URLEncoding.default)
                .responseJSON { [self] response in
                    
                    print("success??")
                    print("result\(response)")
                    
                    
                  
                    switch response.result {
                    case .success(let suc):
                        print("su")
                       
                        
                        guard let result = response.data else {return}
                        
                        do {
                            let decoder = JSONDecoder()
                            let json = try decoder.decode(KsrNum.self, from: result)
                            
                            
                            print(json)
                            
                            
                            if json.app_reg_num == UserDefaults.standard.string(forKey: "numtf") ?? "" {
                                let vc = StrokeManagementHandbookViewController()
                              //        //
                                                                                                  vc.modalPresentationStyle = .fullScreen
                                                                                                  self.present(vc, animated: false)
                            } else {
                                let vc = StrokeManagementDetailViewController()
                                        //
                                                                                                    vc.modalPresentationStyle = .fullScreen
                                                                                                    self.present(vc, animated: false)
                            }
                            
                            
//                            print("????\(json.message)")
                            
                            
//                            if json.message == "수정되었습니다." {
//                                //
//                                
////                                showToast(message: json.message, font: UIFont.systemFont(ofSize: 15))
//                                //
//                                
//                            } else {
////                                showToast(message: json.message, font: UIFont.systemFont(ofSize: 15))
//                            }
    //
    //                        } else {
    ////                            showToast(message: json.message, font: UIFont.systemFont(ofSize: 15))
    //                        }
    //
    ////                        showToast(message: json.message, font: UIFont.systemFont(ofSize: 15))
    //
    //
    ////                        toastShow(message: json.message)
                            
                            
                            
                            
                            }
                        catch {
                            print("err \(error)")
                        }
                    default:
                        return
                       
                        
                  
                    }
                    
                    
            }
            
            
            
            
            
        } else {
            print("no reg")
            
            let vc = StrokeManagementDetailViewController()
                    //
                                                                                vc.modalPresentationStyle = .fullScreen
                                                                                self.present(vc, animated: false)
        }
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
//        let vc = StrokeManagementDetailViewController()
//        //
//                                                                    vc.modalPresentationStyle = .fullScreen
//                                                                    self.present(vc, animated: false)
    }
    
    @objc func go1(_ sender: UIButton) {
        let vc = BloodPressureViewController2()
        //
                                                                    vc.modalPresentationStyle = .fullScreen
                                                                    self.present(vc, animated: false)
    }
    
    @objc func go2(_ sender: UIButton) {
        let vc = BloodSugarViewController2()
        //
                                                                    vc.modalPresentationStyle = .fullScreen
                                                                    self.present(vc, animated: false)
    }
    @objc func go3(_ sender: UIButton) {
        let vc = DyslipidemiaViewController2()
        //
                                                                    vc.modalPresentationStyle = .fullScreen
                                                                    self.present(vc, animated: false)
    }
    @objc func go4(_ sender: UIButton) {
        let vc = ObesityViewController2()
        //
                                                                    vc.modalPresentationStyle = .fullScreen
                                                                    self.present(vc, animated: false)
    }
    @objc func go5(_ sender: UIButton) {
        let vc =  MedicationManagementViewController2()
        //
                                                                    vc.modalPresentationStyle = .fullScreen
                                                                    self.present(vc, animated: false)
    }
   
    
    
    @objc func goNotice(_ sender: UIButton) {
        let vc = AnnouncementViewController()

        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false)
    }
    
    
    @objc func goBrain(_ sender: UIButton) {
        
        
        let vc = StrokeManagementDetailViewController()

        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false)
        
    }
    
    @objc func goBloodPressure(_ sender: UIButton) {
        
        UserDefaults.standard.set("혈압관리", forKey: "gufdkqrhksfl")
        titleLabel = UserDefaults.standard.string(forKey: "gufdkqrhksfl")!
        
        let vc = BloodPressureViewController2()

        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false)
        
    }
    
    
    @objc func goBloodSugar(_ sender: UIButton) {
        
        
        let vc = BloodSugarViewController2()

        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false)
        
        
    }
    
    @objc func goDyslipidemia(_ sender: UIButton) {
        
        
        let vc = DyslipidemiaViewController2()

        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false)
        
        
    }
    
    @objc func goObesity(_ sender: UIButton) {
        
        
        let vc = ObesityViewController2()

        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false)
        
        
    }
    
    @objc func goMedicationManagement(_ sender: UIButton) {
        
        
        let vc =  MedicationManagementViewController2()

        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false)
        
        
    }
    ////
    @objc func goStroke(_ sender: UIButton) {
        /////////여기여기여기
        UserDefaults.standard.set("급성기 뇌졸중", forKey: "stroke")
        titleLabel = UserDefaults.standard.string(forKey: "stroke")!

        goURL(urlString: URL_Addres.whatAboutStroke)
    }
    
    @objc func goRiskFactors(_ sender: UIButton) {
        UserDefaults.standard.set("위험인자", forKey: "risk")
        titleLabel = UserDefaults.standard.string(forKey: "risk")!
        
        
        goURL(urlString: URL_Addres.stroke_risk_factors)
    }
    
    @objc func goFirstAid(_ sender: UIButton) {
        UserDefaults.standard.set("응급처치", forKey: "first")
        titleLabel = UserDefaults.standard.string(forKey: "first")!
        goURL(urlString: URL_Addres.what_is_first_aid_for_stroke)
    }
    
    @objc func goTreatmentOfStroke(_ sender: UIButton) {
        UserDefaults.standard.set("뇌졸중의 치료", forKey: "tos")
        titleLabel = UserDefaults.standard.string(forKey: "tos")!
        goURL(urlString: URL_Addres.treatment_of_stroke)
    }
    
    
    
    @objc func goUnderDiet(_ sender: UIButton) {
        print("1")
        UserDefaults.standard.set("식이요법", forKey: "eatt")
        titleLabel = UserDefaults.standard.string(forKey: "eatt")!
        goURL(urlString: "http://ksrapp.m2comm.co.kr/php/info/info05_1a.php")
    }
    @objc func goUnderObesity(_ sender: UIButton) {
        print("2")
        UserDefaults.standard.set("비만관리", forKey: "fat")
        titleLabel = UserDefaults.standard.string(forKey: "fat")!
        goURL(urlString: "http://ksrapp.m2comm.co.kr/php/info/info05_2a.php")
    }
    @objc func goUnderDementia(_ sender: UIButton) {
        print("3")
        UserDefaults.standard.set("치매", forKey: "del")
        titleLabel = UserDefaults.standard.string(forKey: "del")!
        goURL(urlString: "http://ksrapp.m2comm.co.kr/php/info/info05_3.php")
    }
    @objc func goUnderDepression(_ sender: UIButton) {
        print("4")
        UserDefaults.standard.set("우울증", forKey: "sad")
        titleLabel = UserDefaults.standard.string(forKey: "sad")!
        goURL(urlString: "http://ksrapp.m2comm.co.kr/php/info/info05_4a.php")
    }
    @objc func goUnderLevel(_ sender: UIButton) {
        print("5")
        UserDefaults.standard.set("요양보험 및 장애등급", forKey: "nursing")
        titleLabel = UserDefaults.standard.string(forKey: "nursing")!
        goURL(urlString: "http://ksrapp.m2comm.co.kr/php/info/info05_5a.php")
    }
    
    
//    private func addDimmingView() {
//          dimmingView = UIView(frame: self.view.bounds)
//          dimmingView?.backgroundColor = UIColor.black.withAlphaComponent(0.8)
//          dimmingView?.isHidden = true
//          view.addSubview(dimmingView!)
//          
//          let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleDimmingViewTap))
//          dimmingView?.addGestureRecognizer(tapGesture)
//      }
    @objc private func handleDimmingViewTap() {
            let sideMenuVC = self.sideMenuViewController
        
        sideMenuVC.modalPresentationStyle = .fullScreen
            
            UIView.animate(withDuration: 0.3, animations: {
                // 사이드 메뉴를 원래 위치로 되돌림.
                sideMenuVC.view.frame = CGRect(x: self.view.frame.width, y: 0, width: self.view.frame.width, height: self.view.frame.height)
                // 어두운 배경 뷰를 숨김.
//                self.dimmingView?.alpha = 0
            }) { (finished) in
                
                
                
                // 애니메이션이 완료된 후 사이드 메뉴를 뷰 계층 구조에서 제거.
                sideMenuVC.view.removeFromSuperview()
                sideMenuVC.removeFromParent()
//                self.dimmingView?.isHidden = true
                
                
                
                
            }
        }
    
    @objc private func presentSideMenu(_ sender: UIButton!) {
            let sideMenuVC = self.sideMenuViewController
            
            // 사이드 메뉴 뷰 컨트롤러를 자식으로 추가하고 뷰 계층 구조에 추가.
            self.addChild(sideMenuVC)
            self.view.addSubview(sideMenuVC.view)
            
            // 사이드 메뉴의 너비를 화면 너비의 80%로 설정.
        // sideview 크기 설정
            let menuWidth = self.view.frame.width
        let menuHeight = self.view.frame.height - naviBar.frame.height
//            let yPos = (self.view.frame.height / 2) - (menuHeight / 2) // 중앙에 위치하도록 yPos 계산

            
            // 사이드 메뉴의 시작 위치를 화면 오른쪽 바깥으로 설정.
//        sideMenuVC.view.frame = CGRect(x: menuWidth, y: naviBar.frame.maxY, width: menuWidth, height: menuHeight)
        sideMenuVC.view.frame = CGRect(x: menuWidth, y: 0, width: menuWidth, height: menuHeight)
            
            // 어두운 배경 뷰를 보이게 합니다.
//            self.dimmingView?.isHidden = false
//            self.dimmingView?.alpha = 0
            
        UIView.animate(withDuration: 0.3, animations: { [self] in
                // 사이드 메뉴를 화면에 표시.
//                sideMenuVC.view.frame = CGRect(x: 0, y: naviBar.frame.maxY, width: menuWidth, height: menuHeight)
            sideMenuVC.view.frame = CGRect(x: 0, y: 0, width: menuWidth, height: menuHeight + 50)
                // 어두운 배경 뷰의 투명도를 조절.
//                self.dimmingView?.alpha = 0
            })
        }
    func get() {
        print("내 정보 가져오기")
        //    //        mutipartRequest()
        //
        //            let urlString = "http://strokedb.or.kr/app_new/get_regist_user.asp"
        //
        //
        //        print("sid-->\(UserDefaults.standard.object(forKey: "sid") ?? "")")
        //        let para = ["user_sid" : "\(UserDefaults.standard.object(forKey: "sid") ?? "")",
        //                        ]
        //
        //
        //
        //
        //
        //
        //
        //
        //            Server.postData(urlString: urlString, otherInfo: para) { [weak self] (kData : Data?) in
        //                guard let self = self else { return }
        //                if let data = kData {
        //                    let dataString = data.toString() ?? ""
        //                    print("sighUp resultDataString : \(dataString)")
        //                    let dataArray = dataString.components(separatedBy: ":")
        //
        //                    appDel.showAlert(title: "Notice", message: dataString)
        //                    return
        //                }
        //                appDel.showAlert(title: "Notice", message: "네트워크 에러가 발생했습니다. 다시한번 시도해주세요.")
        //                return
        //            }
        //
        //
        //
        //            print("success")
        
        
        
        //        AF.request("http://strokedb.or.kr/app_new/get_regist_user.asp",method: .post, parameters: ["user_sid": "\(UserDefaults.standard.object(forKey: "sid") ?? "")"])
        //                .validate(contentType: ["application/x-www-form-urlencoded"])
        //                .responseJSON { (response) in
        //
        //                    print(response.data?.toJson())
        ////여기
        //
        //            }
        
        
        //        let headers : HTTPHeaders = [
        //            "Authorization": "Basic MY-API-KEY",
        //            "Content-Type" : "application/x-www-form-urlencoded"
        //        ]
        //        let parameters = ["user_sid" : "\(UserDefaults.standard.object(forKey: "sid") ?? "")"]
        //
        //        AF.request("http://strokedb.or.kr/app_new/get_regist_user.asp", method: .post, parameters: parameters, encoding:  URLEncoding.httpBody, headers: headers).responseJSON { (response:DataResponse) in
        //
        //            switch(response.result) {
        //            case.success(let data):
        //                print("success",data)
        //
        //
        //
        //
        //
        //
        //
        //            case.failure(let error):
        //                print("Not Success",error)
        ////                self.view.makeToast(message: "Server Error!!")
        //
        //            default:
        //                return
        //
        //            }
        //
        //        }
        
        
        
        // 1. 전송할 값 준비
        
        
        
        let sid = (UserDefaults.standard.object(forKey: "userSid") ?? "")
        
        let param = "user_sid=\(sid)"  // key1=value&key2=value...
        
        let paramData = param.data(using: .utf8)
        
        
        
        // 2. URL 객체 정의
        
        let url = URL(string: "http://strokedb.or.kr/app_new/get_regist_user.asp")
        
        
        
        // 3. URLRequest 객체를 정의하고, 요청 내용을 담는다.
        
        var request = URLRequest(url: url!)
        
        request.httpMethod = "POST"
        
        request.httpBody = paramData
        
        
        
        // 4. HTTP 메세지 헤더 설정
        
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        
        request.setValue(String(paramData!.count), forHTTPHeaderField: "Content-Length")
        
        
        
        // 5. URLSession 객체를 통해 전송 및 응답값 처리 로직 작성
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            // 5-1. 서버가 응답이 없거나 통신이 실패했을 때
            
            if let e = error {
                
                NSLog("An error has occurred : \(e.localizedDescription)")
                
                return
                
            }
            
            
            
            
            
            print("Response Data=\(String(data: data!, encoding: .utf8)!)")
            
            // 5-2. 응답 처리 로직이 여기에 들어갑니다.
            
            // 1) 메인 스레드에서 비동기로 처리되도록 한다.
            
            DispatchQueue.main.async(){ [self] in
                
                do {
                    
                    let object = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary
                    //
                    guard let jsonObject = object else { return }
                    //
                    //
                    //                            let decoder = JSONDecoder()
                    //                            decoder.dateDecodingStrategy = .iso8601
                    //
                    ////                            let decoder = JSONDecoder()
                    ////                                let dateFormatter = DateFormatter().then {
                    ////                                  $0.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.sssZ"
                    ////                                }
                    ////                                decoder.dateDecodingStrategy = .formatted(dateFormatter)
                    //
                    //                            let jsonData = try decoder.decode(MyInfoDetail.self, from: data!)
                    //                            print("jsonData: \(jsonData)")
                    
                    
                    
                    // 2) JSON 결과값을 추출한다.
                    
                    let result = jsonObject["result"] as? Int
                    
                    let message = jsonObject["message"] as? String
                    
                    //                            self.myId = (jsonObject["user_id"] as? String)!
                    let data = jsonObject["data"]
                    
                    
                    if let email1 = (data as AnyObject)["email1"] as? String
                    {
                        print("-->\(email1)")
                        UserDefaults.standard.set(email1, forKey: "mail1")
                        
                    }
                    if let email2 = (data as AnyObject)["email2"] as? String
                    {
                        print("-->\(email2)")
                        UserDefaults.standard.set(email2, forKey: "mail2")
                        
                    }
                    if let id = (data as AnyObject)["user_id"] as? String
                    {
                        print("-->\(id)")
                        UserDefaults.standard.set(id, forKey: "id")
                        
                    }
                    if let birth = (data as AnyObject)["birth"] as? String
                    {
                        print("-->\(birth)")
                        UserDefaults.standard.set(birth, forKey: "birth")
                        
                    }
                    if let hos = (data as AnyObject)["hospital"] as? String
                    {
                        print("-->\(hos)")
                        UserDefaults.standard.set(hos, forKey: "hos")
                        
                    }
                    if let sex = (data as AnyObject)["sex"] as? String
                    {
                        print("-->\(sex)")
                        UserDefaults.standard.set(sex, forKey: "sex")
                    }
                    
                    
                    
                    
                    
                    
                    //                            let userid = jsonObject["user_id"] as? String
                    
                    //                            let name = jsonObject["name"] as? String
                    
                    
                    print("message: \(message)" ?? "")
                    print("result: \(result)" ?? "")
                    
                    print("data: \(data ?? "")")
                    
                    
                    
                    
                    
                    
                    //                            print(data["bitrh"] as? [String : String])
                    
                    
                    
                    
                    
                    
                    // 3) 결과가 성공일 때에만 텍스트 뷰에 출력한다.
                    
                    if message == "성공" {
                        
                        
                        print("data->\(data)")
                        
                        //                                myId = data["user_id"] as String
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        //                                print("userid: \(data["userid"])")
                        //                                self.responseView.text = "아이디 : \(userId!)" + "\n"
                        //
                        //                                                        + "이름 : \(name!)" + "\n"
                        //
                        //                                    + "응답결과 : \(result!)" + "\n"
                        //
                        //                                    + "응답방식 : \(timestamp!)" + "\n"
                        //
                        //                                    + "요청방식 : x-www-form-urlencoded"
                        
                    }
                    
                }  catch let DecodingError.dataCorrupted(context) {
                    print(context)
                } catch let DecodingError.keyNotFound(key, context) {
                    print("Key '\(key)' not found:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch let DecodingError.valueNotFound(value, context) {
                    print("Value '\(value)' not found:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch let DecodingError.typeMismatch(type, context)  {
                    print("Type '\(type)' mismatch:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch {
                    print("error: ", error)
                }
                
            }
            
            
            
        }
        
        // 6. POST 전송
        
        task.resume()
        
        
        
        
        
        
        
        //        //post data
        //        let url = "http://strokedb.or.kr/app_new/get_regist_user.asp"
        //
        ////        let parameter:Parameters = ["uid" : "235"]
        //
        //
        //        let para = ["user_sid" : "\(UserDefaults.standard.object(forKey: "sid") ?? "")"
        //                        ]
        //
        //
        //        AF.request(url, method: .post, parameters: para, encoding: URLEncoding.default)
        //            .responseJSON { [self] response in
        //                print("result: \(response)")
        //
        //
        //
        //                switch response.result {
        //                case .success(let suc):
        //                    print("su")
        //
        //
        //
        //                    guard let result = response.data else {return}
        //                    print("일루와")
        //                    do {
        //                        let decoder = JSONDecoder()
        //                        let json = try decoder.decode(MyInfoDetail.self, from: result)
        //
        //                     print("정보\(json)")
        //
        //
        //
        //
        //
        //
        ////                        UserDefaults.standard.set(sid, forKey: "sid")
        //
        //                        let vc = MainViewController()
        //
        //                                                            vc.modalPresentationStyle = .fullScreen
        //                                                            self.present(vc, animated: false)
        //
        //                        }
        //                    catch {
        //                        print("err \(error)")
        //                    }
        //                default:
        //                    return
        //
        //
        //
        //                }
        //
        //
        //        }
        
        
    }
   
    
    
    func dataUpdateBl(){
        print("dmdkdkkdk")
//        guard let regNumString = userD.object(forKey: USER_KEY.KSR_REGISTRATION_NUMBER) as? String else {
//            toastShow(message: "reg_num is nil error")
//            return
//        }
        
        let sid = "\((UserDefaults.standard.object(forKey: "userSid")) ?? 0)"
        
        Server.getData(type: Server.InfoType.BLOOD_USER, otherInfo: ["user_sid":sid]) { (kData : Data?) in
            if let data = kData {
                print("1")
                do {
                    print("2")
                    if let jsonDic = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String:String] {
                        print("json:\n\(jsonDic)")
                        
                        
                        
                        
                        let max = jsonDic["max"] ?? ""
                        let min = jsonDic["min"] ?? ""
                        let seccess = jsonDic["success"] ?? ""
                        let cnt = jsonDic["cnt"] ?? ""
                        let seccess2 = jsonDic["seccess2"] ?? ""
                        let cnt2 = jsonDic["cnt2"] ?? ""
                        
                        let successValue = Int(seccess, radix: 10)
                        let cntValue = Int(cnt, radix: 10)
                        
                        let successValue2 = Int(seccess2, radix: 10)
                        let cntValue2 = Int(cnt2, radix: 10)
                        
                        
                        
                        
                        
                        
                        if let integerJson = jsonDic["success"]!.toCGFloat(){
                            print("Integer conversion successful : \(integerJson)")
                            
                            
                            let z = integerJson
                            UserDefaults.standard.setValue(z, forKey: "s")
                            bp1 = (UserDefaults.standard.object(forKey: "s") as! CGFloat)
                            
                        }
                        else{
                            print("Integer conversion failed")
                        }
                        
                        
                        if let integerJson = jsonDic["cnt"]!.toCGFloat(){
                            print("Integer conversion successful : \(integerJson)")
                            
                            
                            let y = integerJson
                            UserDefaults.standard.setValue(y, forKey: "c")
                            bp2 = (UserDefaults.standard.object(forKey: "c") as! CGFloat)
                        }
                        else{
                            print("Integer conversion failed")
                        }
                        
                        
                        print(bp1)
                        print(bp2)
                        
                        
//                        self.bloodPressureNoteView.bloodPressureGoalAndRateView.goalView.valueLabelUpdate(labelIndex: 0, valueLabelString: "수축기", valueString: " \(max) ", unitString: "mmHg")
//                        self.bloodPressureListView.dataScrollView.goalView.valueLabelUpdate(labelIndex: 0, valueLabelString: "수축기", valueString: " \(max) ", unitString: "mmHg")
//                        self.bloodPressureListView.graphScrollView.goalView.valueLabelUpdate(labelIndex: 0, valueLabelString: "수축기", valueString: " \(max) ", unitString: "mmHg")
                        
//                        self.bloodPressureNoteView.bloodPressureGoalAndRateView.goalView.valueLabelUpdate(labelIndex: 1, valueLabelString: "이완기", valueString: " \(min) ", unitString: "mmHg")
//                        self.bloodPressureListView.dataScrollView.goalView.valueLabelUpdate(labelIndex: 1, valueLabelString: "이완기", valueString: " \(min) ", unitString: "mmHg")
//                        self.bloodPressureListView.graphScrollView.goalView.valueLabelUpdate(labelIndex: 1, valueLabelString: "이완기", valueString: " \(min) ", unitString: "mmHg")
                        
                        print("여기로 와주세요1")
                        
                        if let success = successValue , let cnt = cntValue {
                            print("여기로 와주세요2")
                            let persent : Int
                            let perGraph: CGFloat
                            if cnt != 0 {
                                
                                persent = Int(round((Double(success) / Double(cnt)) * 100))
                                perGraph = CGFloat(round((Double(success) / Double(cnt)) * 100))
                                
                                print("---------------1")
                                UserDefaults.standard.setValue(persent, forKey: "persent")
                                print(persent)
                                UserDefaults.standard.setValue(perGraph, forKey: "perGraph")
                                
                                print(perGraph)
                                print("---------------1")
                                
                                
                                
                                var changeShowLabel = UserDefaults.standard.object(forKey: "persent")
                                print(changeShowLabel, "여기의 값은?")
                                
                                
                            }else{
                                persent = 0
                            }
//                            self.bloodPressureNoteView.bloodPressureGoalAndRateView.rateView.valueLabelUpdate(labelIndex: 0, valueLabelString: "수축기", valueString: " \(persent) ", unitString: "%")
//                            self.bloodPressureListView.dataScrollView.rateView.valueLabelUpdate(labelIndex: 0, valueLabelString: "수축기", valueString: " \(persent) ", unitString: "%")
//                            self.bloodPressureListView.graphScrollView.rateView.valueLabelUpdate(labelIndex: 0, valueLabelString: "수축기", valueString: " \(persent) ", unitString: "%")
                        }
                        
                        if let success = successValue2 , let cnt = cntValue2 {
                            let persent : Int
                            if cnt != 0 {
                                persent = Int(round((Double(success) / Double(cnt)) * 100))
                            }else{
                                persent = 0
                            }
//                            self.bloodPressureNoteView.bloodPressureGoalAndRateView.rateView.valueLabelUpdate(labelIndex: 1, valueLabelString: "이완기", valueString: " \(persent) ", unitString: "%")
//                            self.bloodPressureListView.dataScrollView.rateView.valueLabelUpdate(labelIndex: 1, valueLabelString: "이완기", valueString: " \(persent) ", unitString: "%")
//                            self.bloodPressureListView.graphScrollView.rateView.valueLabelUpdate(labelIndex: 1, valueLabelString: "이완기", valueString: " \(persent) ", unitString: "%")
                        }
                        
                    }
                    
                }catch {
                    print("error:\(error.localizedDescription)")
                }
            }
        }
    }
    
    
    
    
    
    func dataUpdateD() {
//            guard let regNumString = userD.object(forKey: USER_KEY.KSR_REGISTRATION_NUMBER) as? String else {
//                toastShow(message: "reg_num is nil error")
//                return
//            }
    
            Server.getData(type: Server.InfoType.CHOLESTEROL_USER, otherInfo: ["user_sid":"\(UserDefaults.standard.object(forKey: "userSid") ?? 0)"]) { (kData : Data?) in
                if let data = kData {
                    do {
                        
                        if let jsonDic = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String:String] {
                            print("CHOLESTEROL_USER:\n\(jsonDic)")
    
                            let LDL = jsonDic["LDL"] ?? ""
//                            self.dyslipidemiaNoteView.goalAndRateView.goalView.valueLabelUpdate(valueString: " \(LDL) ", unitString: "mg/dL")
//                            self.DyslipidemiaManagementTest.dataScrollView.goalView.valueLabelUpdate(valueString: " \(LDL) ", unitString: "mg/dL")
//                            self.DyslipidemiaManagementTest.graphScrollView.goalView.valueLabelUpdate(valueString: " \(LDL) ", unitString: "mg/dL")
    
                            
//                            persent = Int(round((Double(success) / Double(cnt)) * 100))
                            
                            
                            let seccess = jsonDic["success"] ?? ""
                            let successValue = Int(seccess, radix: 10)
                            let cnt = jsonDic["cnt"] ?? ""
                            let cntValue = Int(cnt, radix: 10)
                            
                            
                            if let integerJson = jsonDic["success"]!.toCGFloat(){
                                      print("Integer conversion successful : \(integerJson)")
                                      
                                      
                                      let z = integerJson
                                      UserDefaults.standard.setValue(z, forKey: "s")
                                      d1 = (UserDefaults.standard.object(forKey: "s") as! CGFloat)
                                      
                                  }
                                  else{
                                      print("Integer conversion failed")
                                  }
                                  
                                  
                                  if let integerJson = jsonDic["cnt"]!.toCGFloat(){
                                      print("Integer conversion successful : \(integerJson)")
                                      
                                      
                                      let y = integerJson
                                      UserDefaults.standard.setValue(y, forKey: "c")
                                      d2 = (UserDefaults.standard.object(forKey: "c") as! CGFloat)
                                  }
                                  else{
                                      print("Integer conversion failed")
                                  }
                                  
                                  
                                  print(d1)
                                  print(d2)
                            
                            
                            
                            print("여기로 와주세요1")
                                                   
                            if let success = successValue , let cnt = cntValue {
                                print("여기로 와주세요2")
                                let persentD: Int
                                let perGraphD: CGFloat
                                if cnt != 0 {
                                    
                                    persentD = Int(round((Double(success) / Double(cnt)) * 100))
                                    perGraphD = CGFloat(round((Double(success) / Double(cnt)) * 100))
                                    
                                    print("---------------1")
                                    UserDefaults.standard.setValue(persentD, forKey: "persentD")
                                    print(persentD)
                                    UserDefaults.standard.setValue(perGraphD, forKey: "perGraphD")
                                    
                                    print(perGraphD)
                                    print("---------------1")
                                }  else {
                                    persentD = 0
                                }
    //                            self.bloodPressureNoteView.bloodPressureGoalAndRateView.rateView.valueLabelUpdate(labelIndex: 0, valueLabelString: "수축기", valueString: " \(persent) ", unitString: "%")
    //                            self.bloodPressureListView.dataScrollView.rateView.valueLabelUpdate(labelIndex: 0, valueLabelString: "수축기", valueString: " \(persent) ", unitString: "%")
    //                            self.bloodPressureListView.graphScrollView.rateView.valueLabelUpdate(labelIndex: 0, valueLabelString: "수축기", valueString: " \(persent) ", unitString: "%")
                            }
                            

                            
//                            if let success = successValue , let cnt = cntValue {
//                                let persent : Int
//                                if cnt != 0 {
//                                    persent = Int(round((Double(success) / Double(cnt)) * 100))
//                                }else{
//                                    persent = 0
//                                }
////                                self.DyslipidemiaManagementTest.goalAndRateView.rateView.valueLabelUpdate(valueString: " \(persent) ", unitString: "%")
////                                self.DyslipidemiaManagementTest.dataScrollView.rateView.valueLabelUpdate(valueString: " \(persent) ", unitString: "%")
////                                self.DyslipidemiaManagementTest.graphScrollView.rateView.valueLabelUpdate(valueString: " \(persent) ", unitString: "%")
//                            }
                        }
                    }catch {
                        print("error:\(error.localizedDescription)")
                    }
                }
            }
    
        }
    
    
    func dataUpdateB(){
//           guard let regNumString = userD.object(forKey: USER_KEY.KSR_REGISTRATION_NUMBER) as? String else {
//               toastShow(message: "reg_num is nil error")
//               return
//           }
        let regNumString = "SB-12500-1"
        let sid = "\((UserDefaults.standard.object(forKey: "userSid")) ?? 0)"
   
           Server.getData(type: Server.InfoType.BMI_USER, otherInfo: ["user_sid":sid]) { (kData : Data?) in
               if let data = kData {
                   do {
                       if let jsonDic = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String:String] {
                           print("BMI_USER:\n\(jsonDic)")
   
                           let seccess = jsonDic["success"] ?? ""
                           let successValue = Int(seccess, radix: 10)
                           let cnt = jsonDic["cnt"] ?? ""
                           let cntValue = Int(cnt, radix: 10)
   
                           
                           
                           if let integerJson = jsonDic["success"]!.toCGFloat(){
                                                     print("Integer conversion successful : \(integerJson)")
                                                     
                                                     
                                                     let z = integerJson
                                                     UserDefaults.standard.setValue(z, forKey: "s")
                                                     bmi1 = (UserDefaults.standard.object(forKey: "s") as! CGFloat)
                                                     
                                                 }
                                                 else{
                                                     print("Integer conversion failed")
                                                 }
                                                 
                                                 
                                                 if let integerJson = jsonDic["cnt"]!.toCGFloat(){
                                                     print("Integer conversion successful : \(integerJson)")
                                                     
                                                     
                                                     let y = integerJson
                                                     UserDefaults.standard.setValue(y, forKey: "c")
                                                     bmi2 = (UserDefaults.standard.object(forKey: "c") as! CGFloat)
                                                 }
                                                 else{
                                                     print("Integer conversion failed")
                                                 }
                                                 
                                                 
                                                 print(bmi1)
                                                 print(bmi2)
                                                 
                                                 
                         //                        self.bloodPressureNoteView.bloodPressureGoalAndRateView.goalView.valueLabelUpdate(labelIndex: 0, valueLabelString: "수축기", valueString: " \(max) ", unitString: "mmHg")
                         //                        self.bloodPressureListView.dataScrollView.goalView.valueLabelUpdate(labelIndex: 0, valueLabelString: "수축기", valueString: " \(max) ", unitString: "mmHg")
                         //                        self.bloodPressureListView.graphScrollView.goalView.valueLabelUpdate(labelIndex: 0, valueLabelString: "수축기", valueString: " \(max) ", unitString: "mmHg")
                                                 
                         //                        self.bloodPressureNoteView.bloodPressureGoalAndRateView.goalView.valueLabelUpdate(labelIndex: 1, valueLabelString: "이완기", valueString: " \(min) ", unitString: "mmHg")
                         //                        self.bloodPressureListView.dataScrollView.goalView.valueLabelUpdate(labelIndex: 1, valueLabelString: "이완기", valueString: " \(min) ", unitString: "mmHg")
                         //                        self.bloodPressureListView.graphScrollView.goalView.valueLabelUpdate(labelIndex: 1, valueLabelString: "이완기", valueString: " \(min) ", unitString: "mmHg")
                                                 
                                                 print("여기로 와주세요1")
                                                 
                                                 if let success = successValue , let cnt = cntValue {
                                                     print("여기로 와주세요2")
                                                     let persent : Int
                                                     let perGraph: CGFloat
                                                     if cnt != 0 {
                                                         
                                                         persent = Int(round((Double(success) / Double(cnt)) * 100))
                                                         perGraph = CGFloat(round((Double(success) / Double(cnt)) * 100))
                                                         
                                                         print("---------------1")
                                                         UserDefaults.standard.setValue(persent, forKey: "persentB")
                                                         print(persent)
                                                         UserDefaults.standard.setValue(perGraph, forKey: "perGraphB")
                                                         
                                                         print(perGraph)
                                                         print("---------------1")
                                                         
                                                         
                                                         
                                                         
                                                         
                                                         
                                                     }else{
                                                         persent = 0
                                                     }
                         //
                                                 }

//                           if let success = successValue , let cnt = cntValue {
//                               let persent : Int
//                               if cnt != 0 {
//                                   //?/
//   //                                print("success : \(success)")
//   //                                print("cnt : \(cnt)")
//                                   persent = Int(round((Double(success) / Double(cnt)) * 100))
//                               }else{
//                                   persent = 0
//                               }
////                               self.obesityNoteView.goalAndRateView.rateView.valueLabelUpdate(valueString: " \(persent) ", unitString: "%")
////                               self.obesityListView.dataScrollView.rateView.valueLabelUpdate(valueString: " \(persent) ", unitString: "%")
////                               self.obesityListView.graphScrollView.rateView.valueLabelUpdate(valueString: " \(persent) ", unitString: "%")
//
//                           }
                       }
                   }catch {
                       print("error:\(error.localizedDescription)")
                   }
               }
           }
       }
    
    
    
    
    func dataUpdateSu(){
        print("hgdhgfhgfgh")
//            guard let regNumString = userD.object(forKey: USER_KEY.KSR_REGISTRATION_NUMBER) as? String else {
//                toastShow(message: "reg_num is nil error")
//                return
//            }
        let regNumString = "SB-12500-1"
        Server.getData(type: Server.InfoType.SUGAR_USER, otherInfo: ["user_sid":"\(UserDefaults.standard.object(forKey: "userSid") ?? 0)"]) { (kData : Data?) in
            if let data = kData {
                do {
                    if let jsonDic = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String:String] {
                        print("\(Server.InfoType.SUGAR_USER) : \n\(jsonDic)")

                        /*
                         ["cnt1": "7", "seccess2": "0", "cnt3": "7", "seccess3": "0", "cnt2": "1", "result": "7", "seccess1": "3"]
                         */

                        let seccess1 = jsonDic["success1"] ?? ""
                        let seccess2 = jsonDic["success2"] ?? ""
                        let seccess3 = jsonDic["success3"] ?? ""

                        let successValue1 = Int(seccess1, radix: 10)
                        let successValue2 = Int(seccess2, radix: 10)
                        let successValue3 = Int(seccess3, radix: 10)

                        let cnt1 = jsonDic["cnt1"] ?? ""
                        let cnt2 = jsonDic["cnt2"] ?? ""
                        let cnt3 = jsonDic["cnt3"] ?? ""

                        let cntValue1 = Int(cnt1, radix: 10)
                        let cntValue2 = Int(cnt2, radix: 10)
                        let cntValue3 = Int(cnt3, radix: 10)

                        
                        
                        if let integerJson = jsonDic["success1"]!.toCGFloat(){
                                                print("Integer conversion successful : \(integerJson)")
                                                
                                                
                                                let z = integerJson
                                                UserDefaults.standard.setValue(z, forKey: "s")
                                                bS1 = (UserDefaults.standard.object(forKey: "s") as! CGFloat)
                                                
                                            }
                                            else{
                                                print("Integer conversion failed")
                                            }
                                            
                                            
                                            if let integerJson = jsonDic["cnt1"]!.toCGFloat(){
                                                print("Integer conversion successful : \(integerJson)")
                                                
                                                
                                                let y = integerJson
                                                UserDefaults.standard.setValue(y, forKey: "c")
                                                bS2 = (UserDefaults.standard.object(forKey: "c") as! CGFloat)
                                            }
                                            else{
                                                print("Integer conversion failed")
                                            }
                                            
                                            
                                            print(bS1)
                                            print(bS2)
                                            
                                            
                    //                        self.bloodPressureNoteView.bloodPressureGoalAndRateView.goalView.valueLabelUpdate(labelIndex: 0, valueLabelString: "수축기", valueString: " \(max) ", unitString: "mmHg")
                    //                        self.bloodPressureListView.dataScrollView.goalView.valueLabelUpdate(labelIndex: 0, valueLabelString: "수축기", valueString: " \(max) ", unitString: "mmHg")
                    //                        self.bloodPressureListView.graphScrollView.goalView.valueLabelUpdate(labelIndex: 0, valueLabelString: "수축기", valueString: " \(max) ", unitString: "mmHg")
                                            
                    //                        self.bloodPressureNoteView.bloodPressureGoalAndRateView.goalView.valueLabelUpdate(labelIndex: 1, valueLabelString: "이완기", valueString: " \(min) ", unitString: "mmHg")
                    //                        self.bloodPressureListView.dataScrollView.goalView.valueLabelUpdate(labelIndex: 1, valueLabelString: "이완기", valueString: " \(min) ", unitString: "mmHg")
                    //                        self.bloodPressureListView.graphScrollView.goalView.valueLabelUpdate(labelIndex: 1, valueLabelString: "이완기", valueString: " \(min) ", unitString: "mmHg")
                                            
                                            print("여기로 와주세요1")
                                            
                        if let success = successValue1 , let cnt = cntValue1 {
                            print("여기로 와주세요2")
                            let persent : Int
                            let perGraph: CGFloat
                            if cnt != 0 {
                                
                                persent = Int(round((Double(success) / Double(cnt)) * 100))
                                perGraph = CGFloat(round((Double(success) / Double(cnt)) * 100))
                                
                                print("---------------1")
                                UserDefaults.standard.setValue(persent, forKey: "persenS1")
                                print(persent)
                                UserDefaults.standard.setValue(perGraph, forKey: "perGraphS1")
                                
                                print(perGraph)
                                print("---------------1")
                                
                                
                            }else{
                                persent = 0
                            }
                            
                        }
                                                ////////////////////////2
                                                ///
                                                ///
                        if let integerJson = jsonDic["success2"]!.toCGFloat(){
                                                print("Integer conversion successful : \(integerJson)")
                                                
                                                
                                                let z = integerJson
                                                UserDefaults.standard.setValue(z, forKey: "s2")
                                                bS3 = (UserDefaults.standard.object(forKey: "s2") as! CGFloat)
                                                
                                            }
                                            else{
                                                print("Integer conversion failed")
                                            }
                                            
                                            
                                            if let integerJson = jsonDic["cnt2"]!.toCGFloat(){
                                                print("Integer conversion successful : \(integerJson)")
                                                
                                                
                                                let y = integerJson
                                                UserDefaults.standard.setValue(y, forKey: "c2")
                                                bS4 = (UserDefaults.standard.object(forKey: "c2") as! CGFloat)
                                            }
                                            else{
                                                print("Integer conversion failed")
                                            }
                                            
                                            
                                            print(bS3)
                                            print(bS4)
                                            
                                            
                    //                        self.bloodPressureNoteView.bloodPressureGoalAndRateView.goalView.valueLabelUpdate(labelIndex: 0, valueLabelString: "수축기", valueString: " \(max) ", unitString: "mmHg")
                    //                        self.bloodPressureListView.dataScrollView.goalView.valueLabelUpdate(labelIndex: 0, valueLabelString: "수축기", valueString: " \(max) ", unitString: "mmHg")
                    //                        self.bloodPressureListView.graphScrollView.goalView.valueLabelUpdate(labelIndex: 0, valueLabelString: "수축기", valueString: " \(max) ", unitString: "mmHg")
                                            
                    //                        self.bloodPressureNoteView.bloodPressureGoalAndRateView.goalView.valueLabelUpdate(labelIndex: 1, valueLabelString: "이완기", valueString: " \(min) ", unitString: "mmHg")
                    //                        self.bloodPressureListView.dataScrollView.goalView.valueLabelUpdate(labelIndex: 1, valueLabelString: "이완기", valueString: " \(min) ", unitString: "mmHg")
                    //                        self.bloodPressureListView.graphScrollView.goalView.valueLabelUpdate(labelIndex: 1, valueLabelString: "이완기", valueString: " \(min) ", unitString: "mmHg")
                                            
                                            print("여기로 와주세요1")
                                            
                        if let success2 = successValue2 , let cnt2 = cntValue2 {
                            print("여기로 와주세요2")
                            let persent2 : Int
                            let perGraph2: CGFloat
                            if cnt2 != 0 {
                                
                                persent2 = Int(round((Double(success2) / Double(cnt2)) * 100))
                                perGraph2 = CGFloat(round((Double(success2) / Double(cnt2)) * 100))
                                
                                print("---------------1")
                                UserDefaults.standard.setValue(persent2, forKey: "persenS2")
                                print(persent2)
                                UserDefaults.standard.setValue(perGraph2, forKey: "perGraphS2")
                                
                                print(perGraph2)
                                print("---------------1")
                                
                                
                            }else{
                                persent2 = 0
                            }
                            
                        }
                                                ///
                                
                                                
                                                ///////////////////////3
                        ///
                        ///
                        if let integerJson = jsonDic["success3"]!.toCGFloat(){
                                                print("Integer conversion successful : \(integerJson)")
                                                
                                                
                                                let z = integerJson
                                                UserDefaults.standard.setValue(z, forKey: "s3")
                                                bS5 = (UserDefaults.standard.object(forKey: "s3") as! CGFloat)
                                                
                                            }
                                            else{
                                                print("Integer conversion failed")
                                            }
                                            
                                            
                                            if let integerJson = jsonDic["cnt3"]!.toCGFloat(){
                                                print("Integer conversion successful : \(integerJson)")
                                                
                                                
                                                let y = integerJson
                                                UserDefaults.standard.setValue(y, forKey: "c3")
                                                bS5 = (UserDefaults.standard.object(forKey: "c3") as! CGFloat)
                                            }
                                            else{
                                                print("Integer conversion failed")
                                            }
                                            
                                            
                                            print(bS5)
                                            print(bS6)
                                            
                                            
                    //                        self.bloodPressureNoteView.bloodPressureGoalAndRateView.goalView.valueLabelUpdate(labelIndex: 0, valueLabelString: "수축기", valueString: " \(max) ", unitString: "mmHg")
                    //                        self.bloodPressureListView.dataScrollView.goalView.valueLabelUpdate(labelIndex: 0, valueLabelString: "수축기", valueString: " \(max) ", unitString: "mmHg")
                    //                        self.bloodPressureListView.graphScrollView.goalView.valueLabelUpdate(labelIndex: 0, valueLabelString: "수축기", valueString: " \(max) ", unitString: "mmHg")
                                            
                    //                        self.bloodPressureNoteView.bloodPressureGoalAndRateView.goalView.valueLabelUpdate(labelIndex: 1, valueLabelString: "이완기", valueString: " \(min) ", unitString: "mmHg")
                    //                        self.bloodPressureListView.dataScrollView.goalView.valueLabelUpdate(labelIndex: 1, valueLabelString: "이완기", valueString: " \(min) ", unitString: "mmHg")
                    //                        self.bloodPressureListView.graphScrollView.goalView.valueLabelUpdate(labelIndex: 1, valueLabelString: "이완기", valueString: " \(min) ", unitString: "mmHg")
                                            
                                            print("여기로 와주세요1")
                                            
                        if let success = successValue3 , let cnt = cntValue3 {
                            print("여기로 와주세요2")
                            let persent : Int
                            let perGraph: CGFloat
                            if cnt != 0 {
                                
                                persent = Int(round((Double(success) / Double(cnt)) * 100))
                                perGraph = CGFloat(round((Double(success) / Double(cnt)) * 100))
                                
                                print("---------------1")
                                UserDefaults.standard.setValue(persent, forKey: "persenS3")
                                print(persent)
                                UserDefaults.standard.setValue(perGraph, forKey: "perGraphS3")
                                
                                print(perGraph)
                                print("---------------1")
                                
                                
                            }else{
                                persent = 0
                            }
                            
                        }
                        ///
                        ///
                        ///
                        ///
                        
                    //                            self.bloodPressureNoteView.bloodPressureGoalAndRateView.rateView.valueLabelUpdate(labelIndex: 0, valueLabelString: "수축기", valueString: " \(persent) ", unitString: "%")
//                                                    self.bloodPressureListView.dataScrollView.rateView.valueLabelUpdate(labelIndex: 0, valueLabelString: "수축기", valueString: " \(persent) ", unitString: "%")
//                                                    self.bloodPressureListView.graphScrollView.rateView.valueLabelUpdate(labelIndex: 0, valueLabelString: "수축기", valueString: " \(persent) ", unitString: "%")
                                        

                        
//                            if let success = successValue1 , let cnt = cntValue1 {
//                                let persent : Int
//                                if cnt != 0 {
//                                    persent = Int(round((Double(success) / Double(cnt)) * 100))
//                                }else{
//                                    persent = 0
//                                }
////                                self.bloodSugarNoteView.bloodSugarGoalAndRateView.rateView.valueLabelUpdate(labelIndex: 0, valueString: " \(persent) ", unitString: "%")
//                                self.bloodSugarListView.dataScrollView.rateView.valueLabelUpdate(labelIndex: 0, valueString: " \(persent) ", unitString: "%")
//                                self.bloodSugarListView.graphScrollView.rateView.valueLabelUpdate(labelIndex: 0, valueString: " \(persent) ", unitString: "%")
//                            }
//
//                            if let success = successValue2 , let cnt = cntValue2 {
//                                let persent : Int
//                                if cnt != 0 {
//                                    //?/
//                                    print("success : \(success)")
//                                    print("cnt : \(cnt)")
//                                    persent = Int(round((Double(success) / Double(cnt)) * 100))
//                                }else{
//                                    persent = 0
//                                }
////                                self.bloodSugarNoteView.bloodSugarGoalAndRateView.rateView.valueLabelUpdate(labelIndex: 1, valueString: " \(persent) ", unitString: "%")
//                                self.bloodSugarListView.dataScrollView.rateView.valueLabelUpdate(labelIndex: 1, valueString: " \(persent) ", unitString: "%")
//                                self.bloodSugarListView.graphScrollView.rateView.valueLabelUpdate(labelIndex: 1, valueString: " \(persent) ", unitString: "%")
//                            }



//                            if let success = successValue3 , let cnt = cntValue3 {
//                                let persent : Int
//                                if cnt != 0 {
//                                    persent = Int(round((Double(success) / Double(cnt)) * 100))
//                                }else{
//                                    persent = 0
//                                }
////                                self.bloodSugarNoteView.bloodSugarGoalAndRateView.rateView.valueLabelUpdate(labelIndex: 2, valueString: " \(persent) ", unitString: "%")
//                                self.bloodSugarListView.dataScrollView.rateView.valueLabelUpdate(labelIndex: 2, valueString: " \(persent) ", unitString: "%")
//                                self.bloodSugarListView.graphScrollView.rateView.valueLabelUpdate(labelIndex: 2, valueString: " \(persent) ", unitString: "%")
//                            }







//                        self.bloodSugarNoteView.//?/

                    }
                }catch {
                    print("error:\(error.localizedDescription)")
                }
            }
        }



    }

    
}


    


//public extension UIView {
//    func edgeTo(_ view: UIView) {
//        view.addSubview(self)
//        translatesAutoresizingMaskIntoConstraints = false
//        topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//        leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//        bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//    }
//    
//    func pinMenuTo(_ view: UIView, with constant: CGFloat) {
//        view.addSubview(self)
//        translatesAutoresizingMaskIntoConstraints = false
//        topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//        leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -constant).isActive = true
//        bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//    }
//    
//}
//
//extension MainViewController: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return dataArray.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        
//        
//        switch tableView {
//        case myTableView:
//            print("!")
//            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? GoBrainCell
//
//            cell?.titleLabel.text = dataArray[indexPath.row]
//            
//            return cell!
//        case managementTableView:
//            print("2")
//            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ManagementbrainCell
//
//            cell?.titleLabel.text = dataArray[indexPath.row]
//            
//            return cell!
//        default:
//            break
//        }
//        
//        
//        
//        
//    
//        return UITableViewCell()
//    }
//    
//    
//    
//    
//}
