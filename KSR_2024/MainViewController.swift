//
//  MainViewController.swift
//  KSR_2024
//
//  Created by m2comm on 2024/01/02.
//

import Foundation
import UIKit
import Then



class MainViewController: UIViewController{
    
//    var dataList = ["1", "2", "3"]
//    var dataList2 = ["4", "5", "6"]
//    
//    var dataArray = [String]()
    
    
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
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        var mySid = UserDefaults.standard.object(forKey: "sid")
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
        //        smart.font = UIFont(name: NotoSansCJKkr_Medium, size: 2)
//        smart.font = UIFont.systemFont(ofSize: 40)
        if IS_IPHONE_12PRO_MAX {
            smart.font = UIFont(name: "Pretendard-Bold", size: 36)
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
        
        
        
        
        
        
        
        
        
        
        let hellow = UILabel(frame: CGRect(x: 20, y: 20, width: self.view.frame.width - 20, height: 20))
        scrollView.addSubview(hellow)
        
        hellow.text = " 님! 반갑습니다."
        //        smart.font = UIFont(name: NotoSansCJKkr_Medium, size: 2)
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
            
            for i in 0..<6{
                
                let buttonX : CGFloat = (buttonWidth + buttonWidthGap) * CGFloat(i % 2)
                print(">>>\(buttonX)")
                
                let buttonY : CGFloat = (buttonHeight + buttonHeightGap) * CGFloat(i / 2)
                
                //            let titleString = INFO.MAIN_INFO[i][INFO.KEY.TITLE] ?? ""
                
                let button = MainButton(frame: CGRect(
                    x: buttonX,
                    y: buttonY,
                    width: buttonWidth,
                    height: buttonHeight), imageName: "menu\(i+1)", name: "\(titleName)")
                
                button.addTarget(event: .touchUpInside) { (button) in
                    //                let infoDic = INFO.MAIN_INFO[i]
                    
                    //                contentShow(dataDic: infoDic as [String:Any])
                }
                
                mainButtonBackView2.addSubview(button)
                
                if i == 0 {
                    button.iconImageBackView.backgroundColor = #colorLiteral(red: 0.3217396438, green: 0.4377208352, blue: 0.9273169637, alpha: 1)
                    button.nameLabel.text = "뇌졸중관리"
                    button.nameLabel.font = UIFont.systemFont(ofSize: 23)
                    button.addTarget(self, action: #selector(goBrain(_ :)), for: .touchUpInside)
                    
                    
                } else if i == 1 {
                    button.iconImageBackView.backgroundColor = #colorLiteral(red: 0.8247565627, green: 0.2676169872, blue: 0.3877614737, alpha: 1)
                    button.nameLabel.text = "혈압관리"
                    button.nameLabel.font = UIFont.systemFont(ofSize: 23)
                    button.addTarget(self, action: #selector(goBloodPressure(_ :)), for: .touchUpInside)
                } else if i == 2 {
                    button.iconImageBackView.backgroundColor = #colorLiteral(red: 0.154723078, green: 0.7071833014, blue: 0.9409560561, alpha: 1)
                    button.nameLabel.text = "당뇨관리"
                    button.nameLabel.font = UIFont.systemFont(ofSize: 23)
                    button.addTarget(self, action: #selector(goBloodSugar(_ :)), for: .touchUpInside)
                } else if i == 3 {
                    button.iconImageBackView.backgroundColor = #colorLiteral(red: 0.1993858814, green: 0.2966046333, blue: 0.6639896035, alpha: 1)
                    button.nameLabel.text = "이상지질혈증관리"
                    button.nameLabel.font = UIFont.systemFont(ofSize: 23)
                    button.addTarget(self, action: #selector(goDyslipidemia(_ :)), for: .touchUpInside)
                } else if i == 4 {
                    button.iconImageBackView.backgroundColor = #colorLiteral(red: 0.1461726725, green: 0.2094348371, blue: 0.4075749516, alpha: 1)
                    button.nameLabel.text = "비만관리및운동"
                    button.nameLabel.font = UIFont.systemFont(ofSize: 23)
                    button.addTarget(self, action: #selector(goObesity(_ :)), for: .touchUpInside)
                } else if i == 5 {
                    button.iconImageBackView.backgroundColor = #colorLiteral(red: 0.002265253104, green: 0.7014663815, blue: 0.6793519258, alpha: 1)
                    button.nameLabel.text = "약물복용관리"
                    button.nameLabel.font = UIFont.systemFont(ofSize: 23)
                    button.addTarget(self, action: #selector(goMedicationManagement(_ :)), for: .touchUpInside)
                }
                
            }
        }
        
        
        
        if IS_IPHONE_N {
            
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
            
            for i in 0..<6{
                
                let buttonX : CGFloat = (buttonWidth + buttonWidthGap) * CGFloat(i % 2)
                print(">>>\(buttonX)")
                
                let buttonY : CGFloat = (buttonHeight + buttonHeightGap) * CGFloat(i / 2)
                
                //            let titleString = INFO.MAIN_INFO[i][INFO.KEY.TITLE] ?? ""
                
                let button = MainButton(frame: CGRect(
                    x: buttonX + 15,
                    y: buttonY,
                    width: buttonWidth,
                    height: buttonHeight), imageName: "menu\(i+1)", name: "\(titleName)")
                
                //            button.addTarget(event: .touchUpInside) { (button) in
                ////                let infoDic = INFO.MAIN_INFO[i]
                //
                ////                contentShow(dataDic: infoDic as [String:Any])
                //            }
                
                mainButtonBackView2.addSubview(button)
                
                if i == 0 {
                    button.iconImageBackView.backgroundColor = #colorLiteral(red: 0.3217396438, green: 0.4377208352, blue: 0.9273169637, alpha: 1)
                    button.nameLabel.text = "뇌졸중관리"
                    button.addTarget(self, action: #selector(goBrain(_ :)), for: .touchUpInside)
                } else if i == 1 {
                    button.iconImageBackView.backgroundColor = #colorLiteral(red: 0.8247565627, green: 0.2676169872, blue: 0.3877614737, alpha: 1)
                    button.nameLabel.text = "혈압관리"
                    button.addTarget(self, action: #selector(goBloodPressure(_ :)), for: .touchUpInside)
                } else if i == 2 {
                    button.iconImageBackView.backgroundColor = #colorLiteral(red: 0.154723078, green: 0.7071833014, blue: 0.9409560561, alpha: 1)
                    button.nameLabel.text = "당뇨관리"
                    button.addTarget(self, action: #selector(goBloodSugar(_ :)), for: .touchUpInside)
                } else if i == 3 {
                    button.iconImageBackView.backgroundColor = #colorLiteral(red: 0.1993858814, green: 0.2966046333, blue: 0.6639896035, alpha: 1)
                    button.nameLabel.text = "이상지질혈증관리"
                    button.addTarget(self, action: #selector(goDyslipidemia(_ :)), for: .touchUpInside)
                } else if i == 4 {
                    button.iconImageBackView.backgroundColor = #colorLiteral(red: 0.1461726725, green: 0.2094348371, blue: 0.4075749516, alpha: 1)
                    button.nameLabel.text = "비만관리및운동"
                    button.addTarget(self, action: #selector(goObesity(_ :)), for: .touchUpInside)
                } else if i == 5 {
                    button.iconImageBackView.backgroundColor = #colorLiteral(red: 0.002265253104, green: 0.7014663815, blue: 0.6793519258, alpha: 1)
                    button.nameLabel.text = "약물복용관리"
                    button.addTarget(self, action: #selector(goMedicationManagement(_ :)), for: .touchUpInside)
                }
                
            }
            
        }
        
        if IS_IPHONE_N_PLUS {
            
            mainButtonBackView = UIView(frame: CGRect(x: 0, y: hellow.frame.maxY, width: SCREEN.WIDTH, height: self.view.frame.height))
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
            
            let buttonWidthGap : CGFloat = 15
            let buttonHeightGap : CGFloat = 0
            let buttonWidth : CGFloat = (mainButtonBackView2.frame.size.width - (buttonWidthGap * 2)) / 2
            let buttonHeight : CGFloat = (mainButtonBackView2.frame.size.height - (buttonHeightGap * 2)) / 3.6
            
            for i in 0..<6{
                
                let buttonX : CGFloat = (buttonWidth + buttonWidthGap) * CGFloat(i % 2)
                print(">>>\(buttonX)")
                
                let buttonY : CGFloat = (buttonHeight + buttonHeightGap) * CGFloat(i / 2)
                
                //            let titleString = INFO.MAIN_INFO[i][INFO.KEY.TITLE] ?? ""
                
                let button = MainButton(frame: CGRect(
                    x: buttonX + 4,
                    y: buttonY,
                    width: buttonWidth * 1.1,
                    height: buttonHeight), imageName: "menu\(i+1)", name: "\(titleName)")
                
                //            button.addTarget(event: .touchUpInside) { (button) in
                ////                let infoDic = INFO.MAIN_INFO[i]
                //
                ////                contentShow(dataDic: infoDic as [String:Any])
                //            }
                
                mainButtonBackView2.addSubview(button)
                
                if i == 0 {
                    button.iconImageBackView.backgroundColor = #colorLiteral(red: 0.3217396438, green: 0.4377208352, blue: 0.9273169637, alpha: 1)
                    button.nameLabel.text = "뇌졸중관리"
                    button.nameLabel.font = UIFont.systemFont(ofSize: 22)
                    button.addTarget(self, action: #selector(goBrain(_ :)), for: .touchUpInside)
                } else if i == 1 {
                    button.iconImageBackView.backgroundColor = #colorLiteral(red: 0.8247565627, green: 0.2676169872, blue: 0.3877614737, alpha: 1)
                    button.nameLabel.font = UIFont.systemFont(ofSize: 22)
                    button.addTarget(self, action: #selector(goBloodPressure(_ :)), for: .touchUpInside)
                    button.nameLabel.text = "혈압관리"
                } else if i == 2 {
                    button.iconImageBackView.backgroundColor = #colorLiteral(red: 0.154723078, green: 0.7071833014, blue: 0.9409560561, alpha: 1)
                    button.nameLabel.font = UIFont.systemFont(ofSize: 22)
                    button.nameLabel.text = "당뇨관리"
                    button.addTarget(self, action: #selector(goBloodSugar(_ :)), for: .touchUpInside)
                } else if i == 3 {
                    button.iconImageBackView.backgroundColor = #colorLiteral(red: 0.1993858814, green: 0.2966046333, blue: 0.6639896035, alpha: 1)
                    button.nameLabel.font = UIFont.systemFont(ofSize: 22)
                    button.nameLabel.text = "이상지질혈증관리"
                    button.addTarget(self, action: #selector(goDyslipidemia(_ :)), for: .touchUpInside)
                } else if i == 4 {
                    button.iconImageBackView.backgroundColor = #colorLiteral(red: 0.1461726725, green: 0.2094348371, blue: 0.4075749516, alpha: 1)
                    button.nameLabel.font = UIFont.systemFont(ofSize: 22)
                    button.nameLabel.text = "비만관리및운동"
                    button.addTarget(self, action: #selector(goObesity(_ :)), for: .touchUpInside)
                } else if i == 5 {
                    button.iconImageBackView.backgroundColor = #colorLiteral(red: 0.002265253104, green: 0.7014663815, blue: 0.6793519258, alpha: 1)
                    button.nameLabel.font = UIFont.systemFont(ofSize: 22)
                    button.nameLabel.text = "약물복용관리"
                    button.addTarget(self, action: #selector(goMedicationManagement(_ :)), for: .touchUpInside)
                }
                
            }
            
        }
        
        if IS_IPHONE_X {
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
            
            for i in 0..<6{
                
                let buttonX : CGFloat = (buttonWidth + buttonWidthGap) * CGFloat(i % 2)
                print(">>>\(buttonX)")
                
                let buttonY : CGFloat = (buttonHeight + buttonHeightGap) * CGFloat(i / 2)
                
                //            let titleString = INFO.MAIN_INFO[i][INFO.KEY.TITLE] ?? ""
                
                let button = MainButton(frame: CGRect(
                    x: buttonX + 5,
                    y: buttonY,
                    width: buttonWidth * 1.2,
                    height: buttonHeight), imageName: "menu\(i+1)", name: "\(titleName)")
                
                button.addTarget(event: .touchUpInside) { (button) in
                    //                let infoDic = INFO.MAIN_INFO[i]
                    
                    //                contentShow(dataDic: infoDic as [String:Any])
                }
                
                mainButtonBackView2.addSubview(button)
                
                if i == 0 {
                    button.iconImageBackView.backgroundColor = #colorLiteral(red: 0.3217396438, green: 0.4377208352, blue: 0.9273169637, alpha: 1)
                    button.nameLabel.text = "뇌졸중관리"
                    button.addTarget(self, action: #selector(goBrain(_ :)), for: .touchUpInside)
                } else if i == 1 {
                    button.iconImageBackView.backgroundColor = #colorLiteral(red: 0.8247565627, green: 0.2676169872, blue: 0.3877614737, alpha: 1)
                    button.nameLabel.text = "혈압관리"
                    button.addTarget(self, action: #selector(goBloodPressure(_ :)), for: .touchUpInside)
                } else if i == 2 {
                    button.iconImageBackView.backgroundColor = #colorLiteral(red: 0.154723078, green: 0.7071833014, blue: 0.9409560561, alpha: 1)
                    button.nameLabel.text = "당뇨관리"
                    button.addTarget(self, action: #selector(goBloodSugar(_ :)), for: .touchUpInside)
                } else if i == 3 {
                    button.iconImageBackView.backgroundColor = #colorLiteral(red: 0.1993858814, green: 0.2966046333, blue: 0.6639896035, alpha: 1)
                    button.nameLabel.text = "이상지질혈증관리"
                    button.addTarget(self, action: #selector(goDyslipidemia(_ :)), for: .touchUpInside)
                } else if i == 4 {
                    button.iconImageBackView.backgroundColor = #colorLiteral(red: 0.1461726725, green: 0.2094348371, blue: 0.4075749516, alpha: 1)
                    button.nameLabel.text = "비만관리및운동"
                    button.addTarget(self, action: #selector(goObesity(_ :)), for: .touchUpInside)
                } else if i == 5 {
                    button.iconImageBackView.backgroundColor = #colorLiteral(red: 0.002265253104, green: 0.7014663815, blue: 0.6793519258, alpha: 1)
                    button.nameLabel.text = "약물복용관리"
                    button.addTarget(self, action: #selector(goMedicationManagement(_ :)), for: .touchUpInside)
                }
                
            }
        }
        
        if IS_IPHONE_12PRO_MAX {
            brainButtonBackView = UIView(frame: CGRect(x: 0, y: mainButtonBackView.frame.maxY - 200, width: SCREEN.WIDTH, height: self.view.frame.height))
            //        brainButtonBackView.backgroundColor = .white
            brainButtonBackView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            scrollView.addSubview(brainButtonBackView)
        }
        
        if IS_IPHONE_N_PLUS {
            brainButtonBackView = UIView(frame: CGRect(x: 0, y: mainButtonBackView2.frame.maxY - 100, width: SCREEN.WIDTH, height: self.view.frame.height + 230))
            //        brainButtonBackView.backgroundColor = .white
            brainButtonBackView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            scrollView.addSubview(brainButtonBackView)
        }
        
        if IS_IPHONE_X {
            brainButtonBackView = UIView(frame: CGRect(x: 0, y: mainButtonBackView2.frame.maxY - 150, width: SCREEN.WIDTH, height: self.view.frame.height + 230))
            //        brainButtonBackView.backgroundColor = .white
            brainButtonBackView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            scrollView.addSubview(brainButtonBackView)
        }
        
        brainLabel1 = UILabel(frame: CGRect(x: SCREEN.WIDTH / 3.35, y: 40, width: 250, height: 30))
        brainLabel1.text = "뇌졸중 바로알기"
        brainButtonBackView.addSubview(brainLabel1)
        brainLabel1.font = UIFont.systemFont(ofSize: 30)
        
        
        if IS_IPHONE_12PRO_MAX {
        
        brainView1 = UIView(frame: CGRect(x: 20, y: brainLabel1.frame.maxY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 5.5))
        brainView1.layer.borderWidth = 1
        brainView1.backgroundColor = #colorLiteral(red: 0.952888906, green: 0.9678936601, blue: 1, alpha: 1)
        brainView1.roundCorners(topLeft: 8, topRight: 8, bottomLeft: 8, bottomRight: 24)
        
        let borderLayer1 = CAShapeLayer()
        borderLayer1.path = (brainView1.layer.mask! as! CAShapeLayer).path! // Reuse the Bezier path
        borderLayer1.strokeColor = UIColor.black.cgColor
        borderLayer1.fillColor = UIColor.clear.cgColor
        borderLayer1.lineWidth = 2
        borderLayer1.frame = brainView1.bounds
        brainView1.layer.addSublayer(borderLayer1)
        
        brainButtonBackView.addSubview(brainView1)
        
        brainLB1 = UILabel(frame: CGRect(x: 30, y: 30, width: self.view.frame.size.width - 60, height: 22))
        brainLB1.text = "급성기 뇌졸증"
        brainLB1.font = UIFont.systemFont(ofSize: 22)
        brainView1.addSubview(brainLB1)
        
        brainSubLB1 = UILabel(frame: CGRect(x: 30, y: brainLB1.frame.maxY + 5, width: self.view.frame.size.width - 60, height: 50))
        brainSubLB1.text = "뇌졸중은 중풍이라고 불리는\n뇌혈관 질환입니다."
        brainSubLB1.numberOfLines = 0
        brainSubLB1.font = UIFont.systemFont(ofSize: 14)
        brainView1.addSubview(brainSubLB1)
        
        brainBTN1 = UIButton(frame: CGRect(x: 30, y: brainSubLB1.frame.maxY + 5, width: 130, height: 35))
        brainBTN1.setTitle("바로가기 >", for: .normal)
        brainBTN1.setTitleColor(.white, for: .normal)
        brainBTN1.backgroundColor = #colorLiteral(red: 0.1970121264, green: 0.3326128721, blue: 0.6067818403, alpha: 1)
        brainBTN1.layer.cornerRadius = 18
           
        brainBTN1.layer.borderWidth = 1
        brainBTN1.addTarget(self, action: #selector(goStroke(_ :)), for: .touchUpInside)
        brainView1.addSubview(brainBTN1)
        
        brainImage = UIImageView(frame: CGRect(x: brainView1.frame.maxX - 110, y: brainView1.frame.size.height / 3.4, width: 55, height: 75))
        brainImage.image = UIImage(named: "go1")
        brainView1.addSubview(brainImage)
        
        
        brainView2 = UIView(frame: CGRect(x: 20, y: brainView1.frame.maxY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 5.5))
        brainView2.layer.borderWidth = 1
        brainView2.backgroundColor = #colorLiteral(red: 0.9770591855, green: 0.9520680308, blue: 0.9982358813, alpha: 1)
        
        brainView2.roundCorners(topLeft: 8, topRight: 8, bottomLeft: 8, bottomRight: 24)
        
        let borderLayer2 = CAShapeLayer()
        borderLayer2.path = (brainView2.layer.mask! as! CAShapeLayer).path! // Reuse the Bezier path
        borderLayer2.strokeColor = UIColor.black.cgColor
        borderLayer2.fillColor = UIColor.clear.cgColor
        borderLayer2.lineWidth = 2
        borderLayer2.frame = brainView2.bounds
        brainView2.layer.addSublayer(borderLayer2)
        
        brainButtonBackView.addSubview(brainView2)
        
        brainLB2 = UILabel(frame: CGRect(x: 30, y: 30, width: self.view.frame.size.width - 60, height: 22))
        brainLB2.text = "위험인자"
        brainLB2.font = UIFont.systemFont(ofSize: 22)
        brainView2.addSubview(brainLB2)
        
        brainSubLB2 = UILabel(frame: CGRect(x: 30, y: brainLB2.frame.maxY + 5, width: self.view.frame.size.width - 60, height: 50))
        brainSubLB2.text = "뇌졸중 환자들은 다양한 뇌졸중 위험인자를 갖게\n됩니다. 위험인자에대해 자세히 알아볼까요?"
        brainSubLB2.numberOfLines = 0
        brainSubLB2.font = UIFont.systemFont(ofSize: 14)
        brainView2.addSubview(brainSubLB2)
        
        brainBTN2 = UIButton(frame: CGRect(x: 30, y: brainSubLB2.frame.maxY + 5, width: 130, height: 35))
        brainBTN2.setTitle("바로가기 >", for: .normal)
        brainBTN2.backgroundColor = #colorLiteral(red: 0.5486581326, green: 0.3868186474, blue: 0.7095668912, alpha: 1)
            
        brainBTN2.setTitleColor(.white, for: .normal)
        brainBTN2.layer.cornerRadius = 18
        brainBTN2.layer.borderWidth = 1
        brainBTN2.addTarget(self, action: #selector(goRiskFactors(_ :)), for: .touchUpInside)
        brainView2.addSubview(brainBTN2)
        
        brainImage2 = UIImageView(frame: CGRect(x: brainView2.frame.maxX - 110, y: brainView2.frame.size.height / 3.4, width: 55, height: 75))
        brainImage2.image = UIImage(named: "go2")
        brainView2.addSubview(brainImage2)
        
        
        
        brainView3 = UIView(frame: CGRect(x: 20, y: brainView2.frame.maxY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 5.5))
        brainView3.layer.borderWidth = 1
        brainView3.backgroundColor = #colorLiteral(red: 0.9521439672, green: 1, blue: 0.9879009128, alpha: 1)
        
        brainView3.roundCorners(topLeft: 8, topRight: 8, bottomLeft: 8, bottomRight: 24)
        
        let borderLayer3 = CAShapeLayer()
        borderLayer3.path = (brainView3.layer.mask! as! CAShapeLayer).path! // Reuse the Bezier path
        borderLayer3.strokeColor = UIColor.black.cgColor
        borderLayer3.fillColor = UIColor.clear.cgColor
        borderLayer3.lineWidth = 2
        borderLayer3.frame = brainView3.bounds
        brainView3.layer.addSublayer(borderLayer3)
        
        brainButtonBackView.addSubview(brainView3)
        
        brainLB3 = UILabel(frame: CGRect(x: 30, y: 30, width: self.view.frame.size.width - 60, height: 22))
        brainLB3.text = "응급처치"
        brainLB3.font = UIFont.systemFont(ofSize: 22)
        brainView3.addSubview(brainLB3)
        
        brainSubLB3 = UILabel(frame: CGRect(x: 30, y: brainLB3.frame.maxY + 5, width: self.view.frame.size.width - 60, height: 50))
        brainSubLB3.text = "뇌졸중의 응급처치는 어떻게 할까요?"
        brainSubLB3.numberOfLines = 0
        brainSubLB3.font = UIFont.systemFont(ofSize: 14)
        brainView3.addSubview(brainSubLB3)
        
        brainBTN3 = UIButton(frame: CGRect(x: 30, y: brainSubLB3.frame.maxY + 5, width: 130, height: 35))
        brainBTN3.setTitle("바로가기 >", for: .normal)
        brainBTN3.backgroundColor = #colorLiteral(red: 0.3004111648, green: 0.6361213923, blue: 0.5539721847, alpha: 1)
        brainBTN3.setTitleColor(.white, for: .normal)
        brainBTN3.layer.cornerRadius = 18
        brainBTN3.layer.borderWidth = 1
        brainBTN3.addTarget(self, action: #selector(goFirstAid(_ :)), for: .touchUpInside)
        brainView3.addSubview(brainBTN3)
        
        brainImage3 = UIImageView(frame: CGRect(x: brainView3.frame.maxX - 110, y: brainView3.frame.size.height / 3.4, width: 55, height: 75))
        brainImage3.image = UIImage(named: "go3")
        brainView3.addSubview(brainImage3)
        
        brainView4 = UIView(frame: CGRect(x: 20, y: brainView3.frame.maxY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 5.5))
        brainView4.layer.borderWidth = 1
        brainView4.backgroundColor = #colorLiteral(red: 0.9999601245, green: 0.9854144454, blue: 0.93028754, alpha: 1)
        
        brainView4.roundCorners(topLeft: 8, topRight: 8, bottomLeft: 8, bottomRight: 24)
        
        let borderLayer4 = CAShapeLayer()
        borderLayer4.path = (brainView4.layer.mask! as! CAShapeLayer).path! // Reuse the Bezier path
        borderLayer4.strokeColor = UIColor.black.cgColor
        borderLayer4.fillColor = UIColor.clear.cgColor
        borderLayer4.lineWidth = 2
        borderLayer4.frame = brainView4.bounds
        brainView4.layer.addSublayer(borderLayer4)
        
        brainButtonBackView.addSubview(brainView4)
        
        brainLB4 = UILabel(frame: CGRect(x: 30, y: 30, width: self.view.frame.size.width - 60, height: 22))
        brainLB4.text = "뇌졸중의 치료"
        brainLB4.font = UIFont.systemFont(ofSize: 22)
        brainView4.addSubview(brainLB4)
        
        brainSubLB4 = UILabel(frame: CGRect(x: 30, y: brainLB4.frame.maxY + 5, width: self.view.frame.size.width - 60, height: 50))
        brainSubLB4.text = "뇌졸중의 치료에 있어\n가장 중요한 것은 시간입니다."
        brainSubLB4.numberOfLines = 0
        brainSubLB4.font = UIFont.systemFont(ofSize: 14)
        brainView4.addSubview(brainSubLB4)
        
        brainBTN4 = UIButton(frame: CGRect(x: 30, y: brainSubLB4.frame.maxY + 5, width: 130, height: 35))
        brainBTN4.setTitle("바로가기 >", for: .normal)
        brainBTN4.backgroundColor = #colorLiteral(red: 0.9241898656, green: 0.6377926469, blue: 0.1878951788, alpha: 1)
        brainBTN4.setTitleColor(.white, for: .normal)
        brainBTN4.layer.cornerRadius = 18
        brainBTN4.layer.borderWidth = 1
        brainBTN4.addTarget(self, action: #selector(goTreatmentOfStroke(_ :)), for: .touchUpInside)
        brainView4.addSubview(brainBTN4)
            
            brainImage4 = UIImageView(frame: CGRect(x: brainView4.frame.maxX - 110, y: brainView4.frame.size.height / 3.4, width: 55, height: 75))
            brainImage4.image = UIImage(named: "go4")
            brainView4.addSubview(brainImage4)
        } else if IS_IPHONE_N_PLUS {
            
            
            brainView1 = UIView(frame: CGRect(x: 20, y: brainLabel1.frame.maxY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 4.5))
            brainView1.layer.borderWidth = 1
            brainView1.backgroundColor = #colorLiteral(red: 0.952888906, green: 0.9678936601, blue: 1, alpha: 1)
            brainView1.roundCorners(topLeft: 8, topRight: 8, bottomLeft: 8, bottomRight: 24)
            
            let borderLayer1 = CAShapeLayer()
            borderLayer1.path = (brainView1.layer.mask! as! CAShapeLayer).path! // Reuse the Bezier path
            borderLayer1.strokeColor = UIColor.black.cgColor
            borderLayer1.fillColor = UIColor.clear.cgColor
            borderLayer1.lineWidth = 2
            borderLayer1.frame = brainView1.bounds
            brainView1.layer.addSublayer(borderLayer1)
            
            brainButtonBackView.addSubview(brainView1)
            
            brainLB1 = UILabel(frame: CGRect(x: 20, y: 26, width: self.view.frame.size.width - 60, height: 22))
            brainLB1.text = "급성기 뇌졸증"
            brainLB1.font = UIFont.systemFont(ofSize: 22)
            brainView1.addSubview(brainLB1)
            
            brainSubLB1 = UILabel(frame: CGRect(x: 20, y: brainLB1.frame.maxY + 5, width: self.view.frame.size.width - 60, height: 50))
            brainSubLB1.text = "뇌졸중은 중풍이라고 불리는\n뇌혈관 질환입니다."
            brainSubLB1.numberOfLines = 0
            brainSubLB1.font = UIFont.systemFont(ofSize: 15)
            brainView1.addSubview(brainSubLB1)
            
            brainBTN1 = UIButton(frame: CGRect(x: 20, y: brainSubLB1.frame.maxY + 5, width: 120, height: 35))
            brainBTN1.setTitle("바로가기 >", for: .normal)
            brainBTN1.setTitleColor(.white, for: .normal)
            brainBTN1.backgroundColor = #colorLiteral(red: 0.1970121264, green: 0.3326128721, blue: 0.6067818403, alpha: 1)
            brainBTN1.layer.cornerRadius = 18
            brainBTN1.layer.borderWidth = 1
            brainBTN1.addTarget(self, action: #selector(goStroke(_ :)), for: .touchUpInside)
            brainView1.addSubview(brainBTN1)
            
            brainImage = UIImageView(frame: CGRect(x: brainView1.frame.maxX - 97, y: brainView1.frame.size.height / 3.2, width: 55, height: 65))
            brainImage.image = UIImage(named: "go1")
            brainView1.addSubview(brainImage)
            
            
            brainView2 = UIView(frame: CGRect(x: 20, y: brainView1.frame.maxY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 4.5))
            brainView2.layer.borderWidth = 1
            brainView2.backgroundColor = #colorLiteral(red: 0.9770591855, green: 0.9520680308, blue: 0.9982358813, alpha: 1)
            
            brainView2.roundCorners(topLeft: 8, topRight: 8, bottomLeft: 8, bottomRight: 24)
            
            let borderLayer2 = CAShapeLayer()
            borderLayer2.path = (brainView2.layer.mask! as! CAShapeLayer).path! // Reuse the Bezier path
            borderLayer2.strokeColor = UIColor.black.cgColor
            borderLayer2.fillColor = UIColor.clear.cgColor
            borderLayer2.lineWidth = 2
            borderLayer2.frame = brainView2.bounds
            brainView2.layer.addSublayer(borderLayer2)
            
            brainButtonBackView.addSubview(brainView2)
            
            brainLB2 = UILabel(frame: CGRect(x: 20, y: 26, width: self.view.frame.size.width - 60, height: 22))
            brainLB2.text = "위험인자"
            brainLB2.font = UIFont.systemFont(ofSize: 22)
            brainView2.addSubview(brainLB2)
            
            brainSubLB2 = UILabel(frame: CGRect(x: 20, y: brainLB2.frame.maxY + 5, width: self.view.frame.size.width - 60, height: 50))
            brainSubLB2.text = "뇌졸중 환자들은 다양한 뇌졸중 위험인자를 갖게\n됩니다. 위험인자에대해 자세히 알아볼까요?"
            brainSubLB2.numberOfLines = 0
            brainSubLB2.font = UIFont.systemFont(ofSize: 15)
            brainView2.addSubview(brainSubLB2)
            
            brainBTN2 = UIButton(frame: CGRect(x: 25, y: brainSubLB2.frame.maxY + 5, width: 120, height: 35))
            brainBTN2.setTitle("바로가기 >", for: .normal)
            brainBTN2.backgroundColor = #colorLiteral(red: 0.5486581326, green: 0.3868186474, blue: 0.7095668912, alpha: 1)
            brainBTN2.setTitleColor(.white, for: .normal)
            brainBTN2.layer.cornerRadius = 18
            brainBTN2.layer.borderWidth = 1
            brainBTN2.addTarget(self, action: #selector(goRiskFactors(_ :)), for: .touchUpInside)
            brainView2.addSubview(brainBTN2)
            
            brainImage2 = UIImageView(frame: CGRect(x: brainView2.frame.maxX - 97, y: brainView2.frame.size.height / 3.2, width: 55, height: 65))
            brainImage2.image = UIImage(named: "go2")
            brainView2.addSubview(brainImage2)
            
            
            
            brainView3 = UIView(frame: CGRect(x: 20, y: brainView2.frame.maxY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 4.5))
            brainView3.layer.borderWidth = 1
            brainView3.backgroundColor = #colorLiteral(red: 0.9521439672, green: 1, blue: 0.9879009128, alpha: 1)
            
            brainView3.roundCorners(topLeft: 8, topRight: 8, bottomLeft: 8, bottomRight: 24)
            
            let borderLayer3 = CAShapeLayer()
            borderLayer3.path = (brainView3.layer.mask! as! CAShapeLayer).path! // Reuse the Bezier path
            borderLayer3.strokeColor = UIColor.black.cgColor
            borderLayer3.fillColor = UIColor.clear.cgColor
            borderLayer3.lineWidth = 2
            borderLayer3.frame = brainView3.bounds
            brainView3.layer.addSublayer(borderLayer3)
            
            brainButtonBackView.addSubview(brainView3)
            
            brainLB3 = UILabel(frame: CGRect(x: 20, y: 26, width: self.view.frame.size.width - 60, height: 22))
            brainLB3.text = "응급처치"
            brainLB3.font = UIFont.systemFont(ofSize: 22)
            brainView3.addSubview(brainLB3)
            
            brainSubLB3 = UILabel(frame: CGRect(x: 20, y: brainLB3.frame.maxY + 5, width: self.view.frame.size.width - 60, height: 50))
            brainSubLB3.text = "뇌졸중의 응급처치는 어떻게 할까요?"
            brainSubLB3.numberOfLines = 0
            brainSubLB3.font = UIFont.systemFont(ofSize: 15)
            brainView3.addSubview(brainSubLB3)
            
            brainBTN3 = UIButton(frame: CGRect(x: 25, y: brainSubLB3.frame.maxY + 5, width: 120, height: 35))
            brainBTN3.setTitle("바로가기 >", for: .normal)
            brainBTN3.backgroundColor = #colorLiteral(red: 0.3004111648, green: 0.6361213923, blue: 0.5539721847, alpha: 1)
            brainBTN3.setTitleColor(.white, for: .normal)
            brainBTN3.layer.cornerRadius = 18
            brainBTN3.layer.borderWidth = 1
            brainBTN3.addTarget(self, action: #selector(goFirstAid(_ :)), for: .touchUpInside)
            brainView3.addSubview(brainBTN3)
            
            brainImage3 = UIImageView(frame: CGRect(x: brainView3.frame.maxX - 97, y: brainView3.frame.size.height / 3.2, width: 55, height: 65))
            brainImage3.image = UIImage(named: "go3")
            brainView3.addSubview(brainImage3)
            
            brainView4 = UIView(frame: CGRect(x: 20, y: brainView3.frame.maxY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 4.5))
            brainView4.layer.borderWidth = 1
            brainView4.backgroundColor = #colorLiteral(red: 0.9999601245, green: 0.9854144454, blue: 0.93028754, alpha: 1)
            
            brainView4.roundCorners(topLeft: 8, topRight: 8, bottomLeft: 8, bottomRight: 24)
            
            let borderLayer4 = CAShapeLayer()
            borderLayer4.path = (brainView4.layer.mask! as! CAShapeLayer).path! // Reuse the Bezier path
            borderLayer4.strokeColor = UIColor.black.cgColor
            borderLayer4.fillColor = UIColor.clear.cgColor
            borderLayer4.lineWidth = 2
            borderLayer4.frame = brainView4.bounds
            brainView4.layer.addSublayer(borderLayer4)
            
            brainButtonBackView.addSubview(brainView4)
            
            brainLB4 = UILabel(frame: CGRect(x: 20, y: 26, width: self.view.frame.size.width - 60, height: 22))
            brainLB4.text = "뇌졸중의 치료"
            brainLB4.font = UIFont.systemFont(ofSize: 22)
            brainView4.addSubview(brainLB4)
            
            brainSubLB4 = UILabel(frame: CGRect(x: 20, y: brainLB4.frame.maxY + 5, width: self.view.frame.size.width - 60, height: 50))
            brainSubLB4.text = "뇌졸중의 치료에 있어\n가장 중요한 것은 시간입니다."
            brainSubLB4.numberOfLines = 0
            brainSubLB4.font = UIFont.systemFont(ofSize: 15)
            brainView4.addSubview(brainSubLB4)
            
            brainBTN4 = UIButton(frame: CGRect(x: 25, y: brainSubLB4.frame.maxY + 5, width: 120, height: 35))
            brainBTN4.setTitle("바로가기 >", for: .normal)
            brainBTN4.backgroundColor = #colorLiteral(red: 0.9241898656, green: 0.6377926469, blue: 0.1878951788, alpha: 1)
            brainBTN4.setTitleColor(.white, for: .normal)
            brainBTN4.layer.cornerRadius = 18
            brainBTN4.layer.borderWidth = 1
            brainBTN4.addTarget(self, action: #selector(goTreatmentOfStroke(_ :)), for: .touchUpInside)
            brainView4.addSubview(brainBTN4)
            
            brainImage4 = UIImageView(frame: CGRect(x: brainView4.frame.maxX - 97, y: brainView4.frame.size.height / 3.2, width: 55, height: 65))
            brainImage4.image = UIImage(named: "go4")
            brainView4.addSubview(brainImage4)
        } else if IS_IPHONE_X {
            
            
            brainView1 = UIView(frame: CGRect(x: 20, y: brainLabel1.frame.maxY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 4.5))
            brainView1.layer.borderWidth = 1
            brainView1.backgroundColor = #colorLiteral(red: 0.952888906, green: 0.9678936601, blue: 1, alpha: 1)
            brainView1.roundCorners(topLeft: 8, topRight: 8, bottomLeft: 8, bottomRight: 24)
            
            let borderLayer1 = CAShapeLayer()
            borderLayer1.path = (brainView1.layer.mask! as! CAShapeLayer).path! // Reuse the Bezier path
            borderLayer1.strokeColor = UIColor.black.cgColor
            borderLayer1.fillColor = UIColor.clear.cgColor
            borderLayer1.lineWidth = 2
            borderLayer1.frame = brainView1.bounds
            brainView1.layer.addSublayer(borderLayer1)
            
            brainButtonBackView.addSubview(brainView1)
            
            brainLB1 = UILabel(frame: CGRect(x: 15, y: 26, width: self.view.frame.size.width - 60, height: 22))
            brainLB1.text = "급성기 뇌졸증"
            brainLB1.font = UIFont.systemFont(ofSize: 22)
            brainView1.addSubview(brainLB1)
            
            brainSubLB1 = UILabel(frame: CGRect(x: 15, y: brainLB1.frame.maxY + 5, width: self.view.frame.size.width - 60, height: 50))
            brainSubLB1.text = "뇌졸중은 중풍이라고 불리는\n뇌혈관 질환입니다."
            brainSubLB1.numberOfLines = 0
            brainSubLB1.font = UIFont.systemFont(ofSize: 15)
            brainView1.addSubview(brainSubLB1)
            
            brainBTN1 = UIButton(frame: CGRect(x: 20, y: brainSubLB1.frame.maxY + 5, width: 120, height: 35))
            brainBTN1.setTitle("바로가기 >", for: .normal)
            brainBTN1.setTitleColor(.white, for: .normal)
            brainBTN1.backgroundColor = #colorLiteral(red: 0.1970121264, green: 0.3326128721, blue: 0.6067818403, alpha: 1)
            
            
            
            
//            #colorLiteral(red: 0.8586720824, green: 0.8926048875, blue: 0.9603921771, alpha: 1)
            brainBTN1.layer.cornerRadius = 18
            brainBTN1.layer.borderWidth = 1
            brainBTN1.layer.borderColor = UIColor(red:167/255, green:186/255, blue:223/255, alpha: 1).cgColor
            brainBTN1.addTarget(self, action: #selector(goStroke(_ :)), for: .touchUpInside)
            brainView1.addSubview(brainBTN1)
            
            brainImage = UIImageView(frame: CGRect(x: brainView1.frame.maxX - 94, y: brainView1.frame.size.height / 3.2, width: 52, height: 63))
            brainImage.image = UIImage(named: "go1")
            brainView1.addSubview(brainImage)
            
            
            brainView2 = UIView(frame: CGRect(x: 20, y: brainView1.frame.maxY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 4.5))
            brainView2.layer.borderWidth = 1
            brainView2.backgroundColor = #colorLiteral(red: 0.9770591855, green: 0.9520680308, blue: 0.9982358813, alpha: 1)
            
            brainView2.roundCorners(topLeft: 8, topRight: 8, bottomLeft: 8, bottomRight: 24)
            
            let borderLayer2 = CAShapeLayer()
            borderLayer2.path = (brainView2.layer.mask! as! CAShapeLayer).path! // Reuse the Bezier path
            borderLayer2.strokeColor = UIColor.black.cgColor
            borderLayer2.fillColor = UIColor.clear.cgColor
            borderLayer2.lineWidth = 2
            borderLayer2.frame = brainView2.bounds
            brainView2.layer.addSublayer(borderLayer2)
            
            brainButtonBackView.addSubview(brainView2)
            
            brainLB2 = UILabel(frame: CGRect(x: 15, y: 26, width: self.view.frame.size.width - 60, height: 22))
            brainLB2.text = "위험인자"
            brainLB2.font = UIFont.systemFont(ofSize: 22)
            brainView2.addSubview(brainLB2)
            
            brainSubLB2 = UILabel(frame: CGRect(x: 15, y: brainLB2.frame.maxY + 5, width: self.view.frame.size.width - 60, height: 50))
            brainSubLB2.text = "뇌졸중 환자들은 다양한 뇌졸중 위험인자를 갖게\n됩니다. 위험인자에대해 자세히 알아볼까요?"
            brainSubLB2.numberOfLines = 0
            brainSubLB2.font = UIFont.systemFont(ofSize: 15)
            brainView2.addSubview(brainSubLB2)
            
            brainBTN2 = UIButton(frame: CGRect(x: 25, y: brainSubLB2.frame.maxY + 5, width: 120, height: 35))
            brainBTN2.setTitle("바로가기 >", for: .normal)
            brainBTN2.backgroundColor = #colorLiteral(red: 0.5486581326, green: 0.3868186474, blue: 0.7095668912, alpha: 1)
            
            brainBTN2.layer.borderColor = UIColor(red:194/255, green:164/255, blue:224/255, alpha: 1).cgColor
            
//
            brainBTN2.setTitleColor(.white, for: .normal)
            brainBTN2.layer.cornerRadius = 18
            brainBTN2.layer.borderWidth = 1
            brainBTN2.addTarget(self, action: #selector(goRiskFactors(_ :)), for: .touchUpInside)
            brainView2.addSubview(brainBTN2)
            
            brainImage2 = UIImageView(frame: CGRect(x: brainView2.frame.maxX - 94, y: brainView2.frame.size.height / 3.2, width: 52, height: 63))
            brainImage2.image = UIImage(named: "go2")
            brainView2.addSubview(brainImage2)
            
            
            
            brainView3 = UIView(frame: CGRect(x: 20, y: brainView2.frame.maxY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 4.5))
            brainView3.layer.borderWidth = 1
            brainView3.backgroundColor = #colorLiteral(red: 0.9521439672, green: 1, blue: 0.9879009128, alpha: 1)
            
            brainView3.roundCorners(topLeft: 8, topRight: 8, bottomLeft: 8, bottomRight: 24)
            
            let borderLayer3 = CAShapeLayer()
            borderLayer3.path = (brainView3.layer.mask! as! CAShapeLayer).path! // Reuse the Bezier path
            borderLayer3.strokeColor = UIColor.black.cgColor
            borderLayer3.fillColor = UIColor.clear.cgColor
            borderLayer3.lineWidth = 2
            borderLayer3.frame = brainView3.bounds
            brainView3.layer.addSublayer(borderLayer3)
            
            brainButtonBackView.addSubview(brainView3)
            
            brainLB3 = UILabel(frame: CGRect(x: 15, y: 26, width: self.view.frame.size.width - 60, height: 22))
            brainLB3.text = "응급처치"
            brainLB3.font = UIFont.systemFont(ofSize: 22)
            brainView3.addSubview(brainLB3)
            
            brainSubLB3 = UILabel(frame: CGRect(x: 15, y: brainLB3.frame.maxY + 5, width: self.view.frame.size.width - 60, height: 50))
            brainSubLB3.text = "뇌졸중의 응급처치는 어떻게 할까요?"
            brainSubLB3.numberOfLines = 0
            brainSubLB3.font = UIFont.systemFont(ofSize: 15)
            brainView3.addSubview(brainSubLB3)
            
            brainBTN3 = UIButton(frame: CGRect(x: 25, y: brainSubLB3.frame.maxY + 5, width: 120, height: 35))
            brainBTN3.setTitle("바로가기 >", for: .normal)
            brainBTN3.backgroundColor = #colorLiteral(red: 0.3004111648, green: 0.6361213923, blue: 0.5539721847, alpha: 1)
            
            brainBTN3.layer.borderColor = UIColor(red:140/255, green:200/255, blue:185/255, alpha: 1).cgColor
            brainBTN3.setTitleColor(.white, for: .normal)
            brainBTN3.layer.cornerRadius = 18
            brainBTN3.layer.borderWidth = 1
            brainBTN3.addTarget(self, action: #selector(goFirstAid(_ :)), for: .touchUpInside)
            brainView3.addSubview(brainBTN3)
            
            brainImage3 = UIImageView(frame: CGRect(x: brainView3.frame.maxX - 94, y: brainView3.frame.size.height / 3.2, width: 52, height: 63))
            brainImage3.image = UIImage(named: "go3")
            brainView3.addSubview(brainImage3)
            
            brainView4 = UIView(frame: CGRect(x: 20, y: brainView3.frame.maxY + 20, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 4.5))
            brainView4.layer.borderWidth = 1
            brainView4.backgroundColor = #colorLiteral(red: 0.9999601245, green: 0.9854144454, blue: 0.93028754, alpha: 1)
            
            brainView4.roundCorners(topLeft: 8, topRight: 8, bottomLeft: 8, bottomRight: 24)
            
            let borderLayer4 = CAShapeLayer()
            borderLayer4.path = (brainView4.layer.mask! as! CAShapeLayer).path! // Reuse the Bezier path
            borderLayer4.strokeColor = UIColor.black.cgColor
            borderLayer4.fillColor = UIColor.clear.cgColor
            borderLayer4.lineWidth = 2
            borderLayer4.frame = brainView4.bounds
            brainView4.layer.addSublayer(borderLayer4)
            
            brainButtonBackView.addSubview(brainView4)
            
            brainLB4 = UILabel(frame: CGRect(x: 15, y: 26, width: self.view.frame.size.width - 60, height: 22))
            brainLB4.text = "뇌졸중의 치료"
            brainLB4.font = UIFont.systemFont(ofSize: 22)
            brainView4.addSubview(brainLB4)
            
            brainSubLB4 = UILabel(frame: CGRect(x: 15, y: brainLB4.frame.maxY + 5, width: self.view.frame.size.width - 60, height: 50))
            brainSubLB4.text = "뇌졸중의 치료에 있어\n가장 중요한 것은 시간입니다."
            brainSubLB4.numberOfLines = 0
            brainSubLB4.font = UIFont.systemFont(ofSize: 15)
            brainView4.addSubview(brainSubLB4)
            
            brainBTN4 = UIButton(frame: CGRect(x: 25, y: brainSubLB4.frame.maxY + 5, width: 120, height: 35))
            brainBTN4.setTitle("바로가기 >", for: .normal)
            brainBTN4.backgroundColor = #colorLiteral(red: 0.9241898656, green: 0.6377926469, blue: 0.1878951788, alpha: 1)
            brainBTN4.layer.borderColor = UIColor(red:218/255, green:200/255, blue:137/255, alpha: 1).cgColor
            brainBTN4.setTitleColor(.white, for: .normal)
            brainBTN4.layer.cornerRadius = 18
            brainBTN4.layer.borderWidth = 1
            brainBTN4.addTarget(self, action: #selector(goTreatmentOfStroke(_ :)), for: .touchUpInside)
            brainView4.addSubview(brainBTN4)
            
            brainImage4 = UIImageView(frame: CGRect(x: brainView4.frame.maxX - 94, y: brainView4.frame.size.height / 3.2, width: 52, height: 63))
            brainImage4.image = UIImage(named: "go4")
            brainView4.addSubview(brainImage4)
        }
        
        
        
        
       
        if IS_IPHONE_12PRO_MAX {
            patientView = UIView(frame: CGRect(x: 0, y: brainButtonBackView.frame.maxY - 80, width: SCREEN.WIDTH, height: 300))
            patientView.backgroundColor = .white
            scrollView.addSubview(patientView)
        }
        if IS_IPHONE_N_PLUS {
            patientView = UIView(frame: CGRect(x: 0, y: brainButtonBackView.frame.maxY - 120, width: SCREEN.WIDTH, height: 330))
            patientView.backgroundColor = .white
            scrollView.addSubview(patientView)
        }
        
        if IS_IPHONE_X {
            patientView = UIView(frame: CGRect(x: 0, y: brainButtonBackView.frame.maxY - 140, width: SCREEN.WIDTH, height: 300))
            patientView.backgroundColor = .white
            scrollView.addSubview(patientView)
        }
        
        patientView.setGradient(color1: .white, color2: UIColor(red: 234.0 / 255.0, green: 246.0 / 255.0, blue: 1.0, alpha: 1))
        patientLB = UILabel(frame: CGRect(x: SCREEN.WIDTH / 2.8, y: 40, width: 250, height: 30))
        patientLB.text = "환자관리"
        patientLB.font = UIFont.systemFont(ofSize: 30)
        patientView.addSubview(patientLB)
        
        let button = UIButton()
          button.setTitle("", for: .normal)
          button.backgroundColor = UIColor.white
          button.translatesAutoresizingMaskIntoConstraints = false
//        button.layer.borderWidth = 1
        button.layer.cornerRadius = 8

          let button2 = UIButton()
          button2.setTitle("", for: .normal)
          button2.backgroundColor = UIColor.white
          button2.translatesAutoresizingMaskIntoConstraints = false
//        button2.layer.borderWidth = 1
        button2.layer.cornerRadius = 8

          let button3 = UIButton()
          button3.setTitle("", for: .normal)
          button3.backgroundColor = UIColor.white
          button3.translatesAutoresizingMaskIntoConstraints = false
//        button3.layer.borderWidth = 1
        button3.layer.cornerRadius = 8
        
        let button4 = UIButton()
        button4.setTitle("", for: .normal)
        button4.backgroundColor = UIColor.white
        button4.translatesAutoresizingMaskIntoConstraints = false
//        button4.layer.borderWidth = 1
        button4.layer.cornerRadius = 8

          let button5 = UIButton()
        button5.setTitle("", for: .normal)
        button5.backgroundColor = UIColor.white
        button5.translatesAutoresizingMaskIntoConstraints = false
//        button5.layer.borderWidth = 1
        button5.layer.cornerRadius = 8
        
        let button6 = UIButton()
        button6.setTitle("", for: .normal)
        button6.backgroundColor = UIColor.white
        button6.translatesAutoresizingMaskIntoConstraints = false
//        button5.layer.borderWidth = 1
        button6.layer.cornerRadius = 8

        
        let label = UILabel()
//        label.setTitle("btn 1", for: .normal)
        label.text = "식이요법"
//        label.font = UIFont.systemFont(ofSize: 12)
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .center

//        label.backgroundColor = UIColor.white
//        label.translatesAutoresizingMaskIntoConstraints = false
        let label2 = UILabel()
//        label.setTitle("btn 1", for: .normal)
        label2.text = "비만관리"
//        label2.font = UIFont.systemFont(ofSize: 12)
        label2.font = UIFont.boldSystemFont(ofSize: 14)
        label2.textAlignment = .center
//        label.backgroundColor = UIColor.white
//        label.translatesAutoresizingMaskIntoConstraints = false
        let label3 = UILabel()
//        label.setTitle("btn 1", for: .normal)
        label3.text = "치매"
//        label3.font = UIFont.systemFont(ofSize: 12)
        label3.font = UIFont.boldSystemFont(ofSize: 14)
        label3.textAlignment = .center
//        label.backgroundColor = UIColor.white
//        label.translatesAutoresizingMaskIntoConstraints = false
        let label4 = UILabel()
//        label.setTitle("btn 1", for: .normal)
        label4.text = "우울증"
//        label4.font = UIFont.systemFont(ofSize: 12)
        label4.font = UIFont.boldSystemFont(ofSize: 14)
        label4.textAlignment = .center
//        label.backgroundColor = UIColor.white
//        label.translatesAutoresizingMaskIntoConstraints = false
        let label5 = UILabel()
//        label.setTitle("btn 1", for: .normal)
        label5.numberOfLines = 0
        label5.text = "요양보험 및\n장애등급"
//        label5.font = UIFont.systemFont(ofSize: 12)
        label5.font = UIFont.boldSystemFont(ofSize: 14)
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
        
        let buttonStackView2 = UIStackView(frame: CGRect(x: 20, y: buttonStackView.frame.maxY + 35, width: SCREEN.WIDTH - 40, height:100))
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
            
            BTNImage1.topAnchor.constraint(equalTo: button.topAnchor, constant: 15).isActive = true
            BTNImage1.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: 35).isActive = true
            BTNImage1.trailingAnchor.constraint(equalTo: button.trailingAnchor, constant: -35).isActive = true
            BTNImage1.bottomAnchor.constraint(equalTo: button.bottomAnchor, constant: -15).isActive = true
            BTNImage1.image = UIImage(named: "patientMenu1")
            
            BTNImage2 = UIImageView(frame: .zero)
            button2.addSubview(BTNImage2)
            BTNImage2.translatesAutoresizingMaskIntoConstraints = false
            
            BTNImage2.topAnchor.constraint(equalTo: button2.topAnchor, constant: 15).isActive = true
            BTNImage2.leadingAnchor.constraint(equalTo: button2.leadingAnchor, constant: 35).isActive = true
            BTNImage2.trailingAnchor.constraint(equalTo: button2.trailingAnchor, constant: -35).isActive = true
            BTNImage2.bottomAnchor.constraint(equalTo: button2.bottomAnchor, constant: -15).isActive = true
            BTNImage2.image = UIImage(named: "patientMenu2")
            
            BTNImage3 = UIImageView(frame: .zero)
            button3.addSubview(BTNImage3)
            BTNImage3.translatesAutoresizingMaskIntoConstraints = false
            
            BTNImage3.topAnchor.constraint(equalTo: button3.topAnchor, constant: 15).isActive = true
            BTNImage3.leadingAnchor.constraint(equalTo: button3.leadingAnchor, constant: 35).isActive = true
            BTNImage3.trailingAnchor.constraint(equalTo: button3.trailingAnchor, constant: -35).isActive = true
            BTNImage3.bottomAnchor.constraint(equalTo: button3.bottomAnchor, constant: -15).isActive = true
            BTNImage3.image = UIImage(named: "patientMenu3")
            
            BTNImage4 = UIImageView(frame: .zero)
            button4.addSubview(BTNImage4)
            BTNImage4.translatesAutoresizingMaskIntoConstraints = false
            
            BTNImage4.topAnchor.constraint(equalTo: button4.topAnchor, constant: 15).isActive = true
            BTNImage4.leadingAnchor.constraint(equalTo: button4.leadingAnchor, constant: 35).isActive = true
            BTNImage4.trailingAnchor.constraint(equalTo: button4.trailingAnchor, constant: -35).isActive = true
            BTNImage4.bottomAnchor.constraint(equalTo: button4.bottomAnchor, constant: -15).isActive = true
            BTNImage4.image = UIImage(named: "patientMenu4")
            
            BTNImage5 = UIImageView(frame: .zero)
            button5.addSubview(BTNImage5)
            BTNImage5.translatesAutoresizingMaskIntoConstraints = false
            
            BTNImage5.topAnchor.constraint(equalTo: button5.topAnchor, constant: 15).isActive = true
            BTNImage5.leadingAnchor.constraint(equalTo: button5.leadingAnchor, constant: 35).isActive = true
            BTNImage5.trailingAnchor.constraint(equalTo: button5.trailingAnchor, constant: -35).isActive = true
            BTNImage5.bottomAnchor.constraint(equalTo: button5.bottomAnchor, constant: -15).isActive = true
            BTNImage5.image = UIImage(named: "patientMenu5")
        } else {
            BTNImage1 = UIImageView(frame: .zero)
            button.addSubview(BTNImage1)
            BTNImage1.translatesAutoresizingMaskIntoConstraints = false
            
            BTNImage1.topAnchor.constraint(equalTo: button.topAnchor, constant: 20).isActive = true
            BTNImage1.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: 40).isActive = true
            BTNImage1.trailingAnchor.constraint(equalTo: button.trailingAnchor, constant: -40).isActive = true
            BTNImage1.bottomAnchor.constraint(equalTo: button.bottomAnchor, constant: -20).isActive = true
            BTNImage1.image = UIImage(named: "patientMenu1")
            
            BTNImage2 = UIImageView(frame: .zero)
            button2.addSubview(BTNImage2)
            BTNImage2.translatesAutoresizingMaskIntoConstraints = false
            
            BTNImage2.topAnchor.constraint(equalTo: button2.topAnchor, constant: 20).isActive = true
            BTNImage2.leadingAnchor.constraint(equalTo: button2.leadingAnchor, constant: 40).isActive = true
            BTNImage2.trailingAnchor.constraint(equalTo: button2.trailingAnchor, constant: -40).isActive = true
            BTNImage2.bottomAnchor.constraint(equalTo: button2.bottomAnchor, constant: -20).isActive = true
            BTNImage2.image = UIImage(named: "patientMenu2")
            
            BTNImage3 = UIImageView(frame: .zero)
            button3.addSubview(BTNImage3)
            BTNImage3.translatesAutoresizingMaskIntoConstraints = false
            
            BTNImage3.topAnchor.constraint(equalTo: button3.topAnchor, constant: 20).isActive = true
            BTNImage3.leadingAnchor.constraint(equalTo: button3.leadingAnchor, constant: 40).isActive = true
            BTNImage3.trailingAnchor.constraint(equalTo: button3.trailingAnchor, constant: -40).isActive = true
            BTNImage3.bottomAnchor.constraint(equalTo: button3.bottomAnchor, constant: -20).isActive = true
            BTNImage3.image = UIImage(named: "patientMenu3")
            
            BTNImage4 = UIImageView(frame: .zero)
            button4.addSubview(BTNImage4)
            BTNImage4.translatesAutoresizingMaskIntoConstraints = false
            
            BTNImage4.topAnchor.constraint(equalTo: button4.topAnchor, constant: 20).isActive = true
            BTNImage4.leadingAnchor.constraint(equalTo: button4.leadingAnchor, constant: 40).isActive = true
            BTNImage4.trailingAnchor.constraint(equalTo: button4.trailingAnchor, constant: -40).isActive = true
            BTNImage4.bottomAnchor.constraint(equalTo: button4.bottomAnchor, constant: -20).isActive = true
            BTNImage4.image = UIImage(named: "patientMenu4")
            
            BTNImage5 = UIImageView(frame: .zero)
            button5.addSubview(BTNImage5)
            BTNImage5.translatesAutoresizingMaskIntoConstraints = false
            
            BTNImage5.topAnchor.constraint(equalTo: button5.topAnchor, constant: 20).isActive = true
            BTNImage5.leadingAnchor.constraint(equalTo: button5.leadingAnchor, constant: 40).isActive = true
            BTNImage5.trailingAnchor.constraint(equalTo: button5.trailingAnchor, constant: -40).isActive = true
            BTNImage5.bottomAnchor.constraint(equalTo: button5.bottomAnchor, constant: -20).isActive = true
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
        
        testButton = UIButton(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: footer.frame.height))
        

        
        
        
        testButton.setTitle("NOTICE  |  Smart Stroke앱이 오픈했습니다.", for: .normal)
        testButton.setTitleColor(.white, for: .normal)
//        testButton.addTarget(self, action: #selector(go(_ :)), for: .touchUpInside)
        footer.addSubview(testButton)
        
        testButton.addTarget(self, action: #selector(goNotice(_ :)), for: .touchUpInside)
        
        
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: naviBar.frame.maxY).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: patientView.bottomAnchor, constant: 140).isActive = true
        
        
   
        
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
            iconImageBackView.layer.cornerRadius = 8
//            iconImageBackView.layer.borderWidth = 1
            innerView.addSubview(iconImageBackView)
            
            let iconImageViewRatio : CGFloat = 0.65
//            iconImageView  = UIImageView(frame: iconImageBackView.bounds)
//            iconImageView.frame.size.width *= iconImageViewRatio
//            iconImageView.frame.size.height *= iconImageViewRatio
            iconImageView = UIImageView(frame: CGRect(x: 45, y: 40, width: 100, height: 100))
            iconImageBackView.addSubview(iconImageView)
            if IS_IPHONE_N {
                iconImageView = UIImageView(frame: CGRect(x: 30, y: 20, width: 70, height: 70))
                iconImageBackView.addSubview(iconImageView)
            }
            if IS_IPHONE_N_PLUS {
                iconImageView = UIImageView(frame: CGRect(x: 46, y: 37, width: 85, height: 70))
                iconImageBackView.addSubview(iconImageView)
            }
            if IS_IPHONE_X {
                iconImageView = UIImageView(frame: CGRect(x: 42, y: 28, width: 70, height: 70))
                iconImageBackView.addSubview(iconImageView)
            }

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
//                nameLabel.font = UIFont(name: Nanum_Barun_Gothic_OTF_Bold, size: 16)
                nameLabel.font = UIFont(name: "SUITE-Regular", size: 16)
                
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
                nameLabel.font = UIFont(name: "SUITE-Regular", size: 16)
                
                nameLabel.numberOfLines = 0
                nameLabel.sizeToFit()
    nameLabel.center.y = self.frame.size.height / 1.5
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
                nameLabel.center.x = innerView.frame.size.width / 2.4
    nameLabel.text = name
    nameLabel.sizeToFit()
                nameLabel.center.x = self.frame.size.width / 2.4

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
                            nameLabel = UILabel(frame: CGRect(x: iconImageBackView.frame.minX, y: iconImageView.frame.maxY, width: 500, height: 50))
                            nameLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                            nameLabel.textAlignment = .center
//                            nameLabel.font = UIFont(name: Nanum_Barun_Gothic_OTF_Bold, size: 12)
                            nameLabel.font = UIFont(name: "SUITE-Regular", size: 16)
                            
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

        let webVC = GoWebViewController()
        webVC.urlString = urlString
        
        
        webVC.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(webVC, animated: true)
        self.present(webVC, animated: true)
//        self.goURL(urlString: webVC.urlString, pushAnimation: true)
        
        
//        webVC.urlString = urlString
//        webVC.hideSubTitleView = true

//        appDel.naviCon?.popToRootViewController(animated: popAnimation)
//        appDel.naviCon?.pushViewController(webVC, animated: pushAnimation)
//        appDel.leftView?.close()

        
        
        
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
        goURL(urlString: URL_Addres.whatAboutStroke)
    }
    
    @objc func goRiskFactors(_ sender: UIButton) {
        goURL(urlString: URL_Addres.stroke_risk_factors)
    }
    
    @objc func goFirstAid(_ sender: UIButton) {
        goURL(urlString: URL_Addres.what_is_first_aid_for_stroke)
    }
    
    @objc func goTreatmentOfStroke(_ sender: UIButton) {
        goURL(urlString: URL_Addres.treatment_of_stroke)
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
