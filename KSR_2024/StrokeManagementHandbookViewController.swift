//
//  StrokeManagementHandbookViewController.swift
//  KSR_2024
//
//  Created by m2comm on 2024/01/15.
//

import Foundation
import UIKit

class StrokeManagementHandbookViewController: UIViewController {
    
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
    
    
    private var sideMenuViewController = SideMenuViewController()
       private var dimmingView: UIView?
       
       private lazy var sideMenuButton = UIImageView().then {
           $0.image = UIImage(systemName: "text.justify")
           $0.tintColor = .black
           
           let tap = UITapGestureRecognizer(target: self, action: #selector(presentSideMenu))
           $0.addGestureRecognizer(tap)
           $0.isUserInteractionEnabled = true
       }
    
    var naviBarButton: UIButton!
    var naviBarButtonImage: UIImageView!
    var sideBTN: UIButton!
    
    var myValue: UIView!
    var myStack: UIStackView!
    var stackLabel1: UILabel!
    var stackLabel2: UILabel!
    var stackLabel3: UILabel!
    
    var startDay: UIView!
    var startDayAnswer: UIView!
    
    var what: UIView!
    var whatAnswer: UIView!
    
    var myHeight: UIView!
    var myHeightAnswer: UIView!
    
    var myWeight: UIView!
    var myWeightAnswer: UIView!
    
    var myBmi: UIView!
    var myBmiAnswer: UIView!
    
    var myDangerous: UIView!
    var myDangerousAnswer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = #colorLiteral(red: 0.8545145392, green: 0.8932231069, blue: 0.9315623641, alpha: 1)
        
        self.view.addSubview(scrollView)
        
        
        self.view.addSubview(sideMenuButton)
                
        sideBTN = UIButton(frame: CGRect(x: self.view.frame.maxX - 75, y: 50, width: 100, height: 100))
        
        sideBTN.setImage(UIImage(systemName: "line.3.horizontal"), for: .normal)
        sideBTN.addTarget(self, action: #selector(presentSideMenu(_ :)), for: .touchUpInside)
//        self.view.addSubview(sideBTN)
        
        
       
        addDimmingView()
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
        
        
        scrollView.backgroundColor = #colorLiteral(red: 0.8545145392, green: 0.8932231069, blue: 0.9315623641, alpha: 1)
        self.view.backgroundColor = UIColor.white

        let statusBar = UIView(frame: CGRect(x: 0, y: 0, width: SCREEN.WIDTH, height: STATUS_BAR_HEIGHT))
        statusBar.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        self.view.addSubview(statusBar)
        
        naviBar = UIView(frame: CGRect(x: 0, y: statusBar.frame.maxY, width: SCREEN.WIDTH, height: 50))
        naviBar.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.view.addSubview(naviBar)
        
//        lazy var menuBarButton = UIBarButtonItem(image: UIImage(systemName: "sidebar.leading")?.withRenderingMode(.alwaysOriginal), style: .done, target: self, action: #selector(menuBarButtonItemTapped))
//        naviBarButton = UIButton(frame: CGRect(x: naviBar.frame.maxX - 55, y: naviBar.frame.size.height / 5, width: 25, height: 25))
//        naviBarButton.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
//        naviBarButtonImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
//        naviBarButtonImage.image = UIImage(named: "sideMenu")
//        naviBarButton.addTarget(self, action: #selector(presentSideMenu), for: .touchUpInside)
        
        naviBarButton = UIButton(frame: CGRect(x: naviBar.frame.maxX - 55, y: naviBar.frame.size.height / 5, width: 25, height: 25))
        naviBarButton.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        naviBarButtonImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
        naviBarButtonImage.image = UIImage(systemName: "line.3.horizontal")
        naviBarButton.addTarget(self, action: #selector(presentSideMenu), for: .touchUpInside)
        naviBarButton.tintColor = .black
        
        naviBar.addSubview(naviBarButton)
        naviBarButton.addSubview(naviBarButtonImage)
        
        let button = UIButton(type: .custom)
        //Set the image
        button.setImage(UIImage(named: "back"), for: .normal)
        //Set the title
        button.setTitle("", for: .normal)
        button.tintColor = .black
        button.setTitleColor(.black, for: .normal)
        //Add target
        button.addTarget(self, action: #selector(callMethod), for: .touchUpInside)
        button.frame = CGRect(x: 20, y: 10, width: 10, height: 50)
        button.imageEdgeInsets = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        
        button.sizeToFit()
        
        naviBar.addSubview(button)
        
        let smart = UILabel(frame: CGRect(x: self.view.frame.size.width / 2.8, y: 0, width: self.view.frame.width - 20, height: naviBar.frame.height))
        
        naviBar.addSubview(smart)
       
        smart.text = "뇌졸중 관리수첩"
//        smart.font = UIFont(name: NotoSansCJKkr_Medium, size: 2)
        
//        smart.font = UIFont.systemFont(ofSize: 28)
        smart.font = UIFont(name: "SUITE-Regular", size: 20)
        
        
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
        labelTwo.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 800).isActive = true
        labelTwo.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -40).isActive = true
        
        
        myValue = UIView(frame: CGRect(x: 0, y: scrollView.frame.minY, width: self.view.frame.width, height: self.view.frame.size.height / 6))
        myValue.backgroundColor = #colorLiteral(red: 0.1247015819, green: 0.231878221, blue: 0.3544261158, alpha: 1)
        scrollView.addSubview(myValue)
        
        myStack = UIStackView(frame: CGRect(x: 20, y: 20, width: myValue.frame.size.width - 40, height: myValue.frame.size.height - 40))
        myStack.backgroundColor = .white
        myValue.addSubview(myStack)
        
        let view1 = UIView(frame: CGRect(x: 0, y: 0, width: myStack.frame.size.width, height: myStack.frame.size.height))
//        label.setTitle("btn 1", for: .normal)
        view1.layer.cornerRadius = 8
        view1.backgroundColor = #colorLiteral(red: 0.1597481668, green: 0.2901253998, blue: 0.433832258, alpha: 1)
        

        let view2 = UIView(frame: CGRect(x: 0, y: 0, width: myStack.frame.size.width, height: myStack.frame.size.height))
//        label.setTitle("btn 1", for: .normal)
        view2.layer.cornerRadius = 8
        view2.backgroundColor = #colorLiteral(red: 0.1597481668, green: 0.2901253998, blue: 0.433832258, alpha: 1)
        
        let view3 = UIView(frame: CGRect(x: 0, y: 0, width: myStack.frame.size.width, height: myStack.frame.size.height))
//        label.setTitle("btn 1", for: .normal)
        view3.layer.cornerRadius = 8
        view3.backgroundColor = #colorLiteral(red: 0.1597481668, green: 0.2901253998, blue: 0.433832258, alpha: 1)
        
        
        
        myStack.alignment = .fill
        myStack.distribution = .fillEqually
        myStack.spacing = 8.0

        myStack.addArrangedSubview(view1)
        myStack.addArrangedSubview(view2)
        myStack.addArrangedSubview(view3)
    
        myStack.backgroundColor = #colorLiteral(red: 0.1247015819, green: 0.231878221, blue: 0.3544261158, alpha: 1)
        myValue.addSubview(myStack)
    
//        stackLabel1 = UILabel(frame: CGRect(x: view1.frame.size.width / 10.2, y: 30, width: 80, height: 20))
        stackLabel1 = UILabel()
        stackLabel1.text = "등록번호"
        stackLabel1.font = UIFont(name: "SUITE-Regular", size: 14)
        stackLabel1.textColor = #colorLiteral(red: 0.190182209, green: 0.7660156488, blue: 1, alpha: 1)
        
        view1.addSubview(stackLabel1)
        stackLabel1.translatesAutoresizingMaskIntoConstraints = false
        
        stackLabel1.topAnchor.constraint(equalTo: view1.topAnchor ,constant: 20).isActive = true
        stackLabel1.leadingAnchor.constraint(equalTo: view1.leadingAnchor ,constant: 20).isActive = true
        stackLabel1.trailingAnchor.constraint(equalTo: view1.trailingAnchor ,constant: -20).isActive = true
//        stackLabel1.bottomAnchor.constraint(equalTo: view1.bottomAnchor ,constant: -20).isActive = true
        stackLabel1.textAlignment = .center
        
//        stackLabel2 = UILabel(frame: CGRect(x: view2.frame.size.width / 9.2, y: 30, width: 80, height: 20))
        stackLabel2 = UILabel()
        stackLabel2.text = "성별"
        stackLabel2.font = UIFont(name: "SUITE-Regular", size: 14)
        stackLabel2.textColor = #colorLiteral(red: 0.190182209, green: 0.7660156488, blue: 1, alpha: 1)
        
        view2.addSubview(stackLabel2)
        
        stackLabel2.translatesAutoresizingMaskIntoConstraints = false
        
        stackLabel2.topAnchor.constraint(equalTo: view2.topAnchor ,constant: 20).isActive = true
        stackLabel2.leadingAnchor.constraint(equalTo: view2.leadingAnchor ,constant: 20).isActive = true
        stackLabel2.trailingAnchor.constraint(equalTo: view2.trailingAnchor ,constant: -20).isActive = true
//        stackLabel1.bottomAnchor.constraint(equalTo: view1.bottomAnchor ,constant: -20).isActive = true
        stackLabel2.textAlignment = .center
        
//        stackLabel3 = UILabel(frame: CGRect(x: view3.frame.size.width / 10.2, y: 30, width: 80, height: 20))
        stackLabel3 = UILabel()
        stackLabel3.text = "발병나이"
        stackLabel3.font = UIFont(name: "SUITE-Regular", size: 14)
        stackLabel3.textColor = #colorLiteral(red: 0.190182209, green: 0.7660156488, blue: 1, alpha: 1)
        
        view3.addSubview(stackLabel3)
        
        stackLabel3.translatesAutoresizingMaskIntoConstraints = false
        
        stackLabel3.topAnchor.constraint(equalTo: view3.topAnchor ,constant: 20).isActive = true
        stackLabel3.leadingAnchor.constraint(equalTo: view3.leadingAnchor ,constant: 20).isActive = true
        stackLabel3.trailingAnchor.constraint(equalTo: view3.trailingAnchor ,constant: -20).isActive = true
//        stackLabel1.bottomAnchor.constraint(equalTo: view1.bottomAnchor ,constant: -20).isActive = true
        stackLabel3.textAlignment = .center
        
        
        startDay = UIView(frame: CGRect(x: 20, y: myValue.frame.maxY + 20, width: self.view.frame.size.width / 2.8, height: self.view.frame.size.height / 16))
        startDay.backgroundColor = #colorLiteral(red: 0, green: 0.593129456, blue: 0.8349065185, alpha: 1)
        
        startDayAnswer = UIView(frame: CGRect(x: startDay.frame.maxX, y: myValue.frame.maxY + 20, width: self.view.frame.size.width / 1.8, height: self.view.frame.size.height / 16))
        startDayAnswer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        var startDataLabel = UILabel(frame: CGRect(x: 0, y: 0, width: startDay.frame.width, height: startDay.frame.height))
        startDataLabel.text = "뇌졸중 발생일"
        startDataLabel.font = UIFont(name: "SUITE-Regular", size: 14)
        startDataLabel.textColor = .white
        startDataLabel.textAlignment = .center
        
//        startDay.layer.borderWidth = 1
//        startDayAnswer.layer.borderWidth = 1
//        startDay.layer.borderColor = UIColor.lightGray.cgColor
//        startDayAnswer.layer.borderColor = UIColor.lightGray.cgColor
        
        startDataLabel.layer.addBorder([.top], color: .black, width: 1)
        startDayAnswer.layer.addBorder([.top], color: .black, width: 1)
        
        
        
        scrollView.addSubview(startDay)
        scrollView.addSubview(startDayAnswer)
        startDay.addSubview(startDataLabel)
        
        
        what = UIView(frame: CGRect(x: 20, y: startDay.frame.maxY, width: self.view.frame.size.width / 2.8, height: self.view.frame.size.height / 16))
        what.backgroundColor = #colorLiteral(red: 0, green: 0.593129456, blue: 0.8349065185, alpha: 1)
        
        whatAnswer = UIView(frame: CGRect(x: startDay.frame.maxX, y: startDay.frame.maxY, width: self.view.frame.size.width / 1.8, height: self.view.frame.size.height / 16))
        whatAnswer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        var whatDataLabel = UILabel(frame: CGRect(x: 0, y: 0, width: startDay.frame.width, height: startDay.frame.height))
        whatDataLabel.text = "뇌졸중 유형"
        whatDataLabel.font = UIFont(name: "SUITE-Regular", size: 14)
        whatDataLabel.textColor = .white
        whatDataLabel.textAlignment = .center
        
//        what.layer.borderWidth = 1
//        whatAnswer.layer.borderWidth = 1
//        what.layer.borderColor = UIColor.lightGray.cgColor
//        whatAnswer.layer.borderColor = UIColor.lightGray.cgColor
        whatDataLabel.layer.addBorder([.top], color: .lightGray, width: 0.3)
        whatAnswer.layer.addBorder([.top], color: .lightGray, width: 0.3)
        
        scrollView.addSubview(what)
        scrollView.addSubview(whatAnswer)
        what.addSubview(whatDataLabel)
        
        
        myHeight = UIView(frame: CGRect(x: 20, y: what.frame.maxY, width: self.view.frame.size.width / 2.8, height: self.view.frame.size.height / 16))
        myHeight.backgroundColor = #colorLiteral(red: 0, green: 0.593129456, blue: 0.8349065185, alpha: 1)
        
        myHeightAnswer = UIView(frame: CGRect(x: startDay.frame.maxX, y: what.frame.maxY, width: self.view.frame.size.width / 1.8, height: self.view.frame.size.height / 16))
        myHeightAnswer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        var myHeightDataLabel = UILabel(frame: CGRect(x: 0, y: 0, width: startDay.frame.width, height: startDay.frame.height))
        myHeightDataLabel.text = "현재 나의 키"
        myHeightDataLabel.font = UIFont(name: "SUITE-Regular", size: 14)
        myHeightDataLabel.textColor = .white
        myHeightDataLabel.textAlignment = .center
        
//        myHeight.layer.borderWidth = 1
//        myHeightAnswer.layer.borderWidth = 1
//        myHeight.layer.borderColor = UIColor.lightGray.cgColor
//        myHeightAnswer.layer.borderColor = UIColor.lightGray.cgColor
        myHeightDataLabel.layer.addBorder([.top], color: .lightGray, width: 0.3)
        myHeightAnswer.layer.addBorder([.top], color: .lightGray, width: 0.3)
        
        
        scrollView.addSubview(myHeight)
        scrollView.addSubview(myHeightAnswer)
        myHeight.addSubview(myHeightDataLabel)
        
        
        myWeight = UIView(frame: CGRect(x: 20, y: myHeight.frame.maxY, width: self.view.frame.size.width / 2.8, height: self.view.frame.size.height / 16))
        myWeight.backgroundColor = #colorLiteral(red: 0, green: 0.593129456, blue: 0.8349065185, alpha: 1)
        
        myWeightAnswer = UIView(frame: CGRect(x: startDay.frame.maxX, y: myHeight.frame.maxY, width: self.view.frame.size.width / 1.8, height: self.view.frame.size.height / 16))
        myWeightAnswer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        var myWeightDataLabel = UILabel(frame: CGRect(x: 0, y: 0, width: startDay.frame.width, height: startDay.frame.height))
        myWeightDataLabel.text = "현재 나의 몸무게"
        myWeightDataLabel.font = UIFont(name: "SUITE-Regular", size: 14)
        myWeightDataLabel.textColor = .white
        myWeightDataLabel.textAlignment = .center
        
//        myWeight.layer.borderWidth = 1
//        myWeightAnswer.layer.borderWidth = 1
//        myWeight.layer.borderColor = UIColor.lightGray.cgColor
//        myWeightAnswer.layer.borderColor = UIColor.lightGray.cgColor
        myWeightDataLabel.layer.addBorder([.top], color: .lightGray, width: 0.3)
        myWeightAnswer.layer.addBorder([.top], color: .lightGray, width: 0.3)
        
        scrollView.addSubview(myWeight)
        scrollView.addSubview(myWeightAnswer)
        myWeight.addSubview(myWeightDataLabel)
        
        
        myBmi = UIView(frame: CGRect(x: 20, y: myWeight.frame.maxY, width: self.view.frame.size.width / 2.8, height: self.view.frame.size.height / 16))
        myBmi.backgroundColor = #colorLiteral(red: 0, green: 0.593129456, blue: 0.8349065185, alpha: 1)
        
        myBmiAnswer = UIView(frame: CGRect(x: startDay.frame.maxX, y: myWeight.frame.maxY, width: self.view.frame.size.width / 1.8, height: self.view.frame.size.height / 16))
        myBmiAnswer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        var myBmiDataLabel = UILabel(frame: CGRect(x: 0, y: 0, width: startDay.frame.width, height: startDay.frame.height))
        myBmiDataLabel.text = "BMI"
        myBmiDataLabel.font = UIFont(name: "SUITE-Regular", size: 14)
        myBmiDataLabel.textColor = .white
        myBmiDataLabel.textAlignment = .center
        
//        myBmi.layer.borderWidth = 1
//        myBmiAnswer.layer.borderWidth = 1
//        myBmi.layer.borderColor = UIColor.lightGray.cgColor
//        myBmiAnswer.layer.borderColor = UIColor.lightGray.cgColor
        myBmiDataLabel.layer.addBorder([.top], color: .lightGray, width: 0.3)
        myBmiAnswer.layer.addBorder([.top], color: .lightGray, width: 0.3)
        
        scrollView.addSubview(myBmi)
        scrollView.addSubview(myBmiAnswer)
        myBmi.addSubview(myBmiDataLabel)
        
        
        myDangerous = UIView(frame: CGRect(x: 20, y: myBmi.frame.maxY, width: self.view.frame.size.width / 2.8, height: self.view.frame.size.height / 6))
        myDangerous.backgroundColor = #colorLiteral(red: 0, green: 0.593129456, blue: 0.8349065185, alpha: 1)
        
        myDangerousAnswer = UIView(frame: CGRect(x: startDay.frame.maxX, y: myBmi.frame.maxY, width: self.view.frame.size.width / 1.8, height: self.view.frame.size.height / 6))
        myDangerousAnswer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        var myDangerousDataLabel = UILabel(frame: CGRect(x: 0, y: 0, width: myDangerous.frame.width, height: myDangerous.frame.height))
        myDangerousDataLabel.text = "나의 뇌졸중 위험인자"
        myDangerousDataLabel.font = UIFont(name: "SUITE-Regular", size: 14)
        myDangerousDataLabel.textColor = .white
        myDangerousDataLabel.textAlignment = .center
        if IS_IPHONE_X {
            myDangerousDataLabel.text = "나의 뇌졸중 \n위험인자"
            myDangerousDataLabel.font = UIFont(name: "SUITE-Regular", size: 14)
            myDangerousDataLabel.numberOfLines = 0
            
        }
        
//        myDangerous.layer.borderWidth = 1
//        myDangerousAnswer.layer.borderWidth = 1
//        myDangerous.layer.borderColor = UIColor.lightGray.cgColor
//        myDangerousAnswer.layer.borderColor = UIColor.lightGray.cgColor
        myDangerousDataLabel.layer.addBorder([.top], color: .lightGray, width: 0.3)
        myDangerousAnswer.layer.addBorder([.top], color: .lightGray, width: 0.3)
        
        scrollView.addSubview(myDangerous)
        scrollView.addSubview(myDangerousAnswer)
        myDangerous.addSubview(myDangerousDataLabel)
        
//        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//        scrollView.bottomAnchor.constraint(equalTo: myDangerous.bottomAnchor, constant: 700).isActive = true
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
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
    
    
    private func addDimmingView() {
          dimmingView = UIView(frame: self.view.bounds)
          dimmingView?.backgroundColor = UIColor.black.withAlphaComponent(0.8)
          dimmingView?.isHidden = true
          view.addSubview(dimmingView!)
          
          let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleDimmingViewTap))
          dimmingView?.addGestureRecognizer(tapGesture)
      }
  
    @objc func callMethod(){
        let vc = MainViewController()

        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false)
    }
    
    
    
    
}
