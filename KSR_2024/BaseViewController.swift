//
//  BaseViewController.swift
//  KSR_2024
//
//  Created by m2comm on 2024/01/17.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    
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
    var menuView: UIView!
    var menuStack: UIStackView!
    
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
    
    var label1 = UILabel()
    var label2 = UILabel()
    var label3 = UILabel()
    
    var button1 = UIButton()
    var button2 = UIButton()
    var button3 = UIButton()
    
    
    var buttons: [UIButton]!
    
    
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
//        
//        naviBar.addSubview(naviBarButton)
//        naviBarButton.addSubview(naviBarButtonImage)
        
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
       
        smart.text = ""
        
//        smart.font = UIFont(name: NotoSansCJKkr_Medium, size: 2)
        
        smart.font = UIFont.systemFont(ofSize: 28)
        
        
        
       
        
        menuView = UIView(frame: CGRect(x: 0, y: naviBar.frame.maxY, width: self.view.frame.width, height: self.view.frame.height / 12))
        menuView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        menuView.layer.borderWidth = 0
        
        self.view.addSubview(menuView)
        
        button1 = UIButton(frame: CGRect(x: 0, y: 0, width: menuView.frame.size.width / 3, height: 100))
          button1.setTitle("", for: .normal)
          button1.backgroundColor = UIColor.white
          button1.translatesAutoresizingMaskIntoConstraints = false
//        button1.layer.borderWidth = 1
        button1.layer.cornerRadius = 8
        button1.tag = 0

        button2 = UIButton(frame: CGRect(x: 0, y: 0, width: menuView.frame.size.width / 3, height: 100))
          button2.setTitle("", for: .normal)
          button2.backgroundColor = UIColor.white
          button2.translatesAutoresizingMaskIntoConstraints = false
//        button2.layer.borderWidth = 1
        button2.layer.cornerRadius = 8
        button2.tag = 1

        button3 = UIButton(frame: CGRect(x: 0, y: 0, width: menuView.frame.size.width / 3, height: 100))
          button3.setTitle("", for: .normal)
          button3.backgroundColor = UIColor.white
          button3.translatesAutoresizingMaskIntoConstraints = false
//        button3.layer.borderWidth = 1
        button3.layer.cornerRadius = 8
        button3.tag = 2
        
        

        
        
        

        
        let buttonStackView = UIStackView(frame: CGRect(x: 0, y: 0, width: SCREEN.WIDTH, height: menuView.frame.height))
          buttonStackView.alignment = .fill
          buttonStackView.distribution = .fillEqually
          buttonStackView.spacing = 8.0
        buttonStackView.layer.borderColor = UIColor.lightGray.cgColor
//        buttonStackView.layer.borderWidth = 1

          buttonStackView.addArrangedSubview(button1)
          buttonStackView.addArrangedSubview(button2)
          buttonStackView.addArrangedSubview(button3)
  

        menuView.addSubview(buttonStackView)
        
        label1 = UILabel(frame: CGRect(x: 0, y: 0, width: button1.frame.width, height: buttonStackView.frame.height))
        label1.textColor = .black
//        label.setTitle("btn 1", for: .normal)
        label1.text = "타이틀\n도움말"
        label1.numberOfLines = 0
        label1.font = UIFont.systemFont(ofSize: 15)
        label1.textAlignment = .center
        
        button1.addSubview(label1)

//        label.backgroundColor = UIColor.white
//        label.translatesAutoresizingMaskIntoConstraints = false
        label2 = UILabel(frame: CGRect(x: 0, y: 0, width: button2.frame.width, height: buttonStackView.frame.height))
//        label.setTitle("btn 1", for: .normal)
        label2.text = "타이틀\n관리수첩"
        label2.textColor = .black
        label2.numberOfLines = 0
        label2.font = UIFont.systemFont(ofSize: 15)
        label2.textAlignment = .center
//        label.backgroundColor = UIColor.white
//        label.translatesAutoresizingMaskIntoConstraints = false
        button2.addSubview(label2)
        
        label3 = UILabel(frame: CGRect(x: 0, y: 0, width: button3.frame.width, height: buttonStackView.frame.height))
//        label.setTitle("btn 1", for: .normal)
        label3.text = "타이틀\n기록보기"
        label3.textColor = .black
        label3.numberOfLines = 0
        label3.font = UIFont.systemFont(ofSize: 15)
        label3.textAlignment = .center
//        label.backgroundColor = UIColor.white
//        label.translatesAutoresizingMaskIntoConstraints = false
        button3.addSubview(label3)
        
//        let buttonStackViewLabel = UIStackView(frame: CGRect(x: 20, y: 0, width: SCREEN.WIDTH - 40, height: menuView.frame.height))
//        buttonStackViewLabel.alignment = .fill
//        buttonStackViewLabel.distribution = .fillEqually
//        buttonStackViewLabel.spacing = 0.8
        
        
        
        
//        buttonStackViewLabel.addArrangedSubview(label)
//        buttonStackViewLabel.addArrangedSubview(label2)
//        buttonStackViewLabel.addArrangedSubview(label3)
//
//
//        buttonStackView.addSubview(buttonStackViewLabel)
        
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: menuView.frame.maxY).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

//          scrollView.addSubview(labelOne)
//
//          labelOne.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 40).isActive = true
//          labelOne.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 40).isActive = true

        scrollView.addSubview(labelTwo)
        labelTwo.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 40).isActive = true
        labelTwo.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 2000).isActive = true
        labelTwo.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -40).isActive = true
        
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
            self.dimmingView?.isHidden = true
            self.dimmingView?.alpha = 0
            
        UIView.animate(withDuration: 0.3, animations: { [self] in
                // 사이드 메뉴를 화면에 표시.
//                sideMenuVC.view.frame = CGRect(x: 0, y: naviBar.frame.maxY, width: menuWidth, height: menuHeight)
            sideMenuVC.view.frame = CGRect(x: 0, y: 0, width: menuWidth, height: menuHeight + 50)
                // 어두운 배경 뷰의 투명도를 조절.
//                self.dimmingView?.alpha = 0.5
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
    @objc private func handleDimmingViewTap() {
            let sideMenuVC = self.sideMenuViewController
            
            UIView.animate(withDuration: 0.3, animations: {
                // 사이드 메뉴를 원래 위치로 되돌림.
                sideMenuVC.view.frame = CGRect(x: self.view.frame.width, y: 0, width: self.view.frame.width, height: self.view.frame.height)
                // 어두운 배경 뷰를 숨김.
                self.dimmingView?.alpha = 0
            }) { (finished) in
                // 애니메이션이 완료된 후 사이드 메뉴를 뷰 계층 구조에서 제거.
                sideMenuVC.view.removeFromSuperview()
                sideMenuVC.removeFromParent()
                self.dimmingView?.isHidden = true
            }
        }
    @objc func callMethod(){
//        
        
        let vc = MainViewController()

        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false)
    }
    
}
