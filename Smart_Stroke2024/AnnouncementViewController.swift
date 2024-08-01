//
//  AnnouncementViewController.swift
//  KSR_2024
//
//  Created by m2comm on 2024/02/20.
//

import Foundation
import UIKit

class AnnouncementViewController: UIViewController {
    
    
    var tableView: UITableView!
        var items = ["Smart Stroke 앱이 런칭 되었습니다.", "혈압 관리수첩 - 사용방법", "혈당 관리수첩 - 사용방법"]
    var sub = ["여러분의 많은 이용 부탁드립니다.", "목표설정을 하신 후 매일 혈압을 기입해주세요.", "목표설정을 하신 후 매일 혈당을 기입해주세요."]

//        override func loadView() {
//            super.loadView()
//            let view = UIView(frame: UIScreen.main.bounds)
//            view.backgroundColor = .systemGray6
//            self.view = view
//            setupTableView()  //4
//        }
//    
    var naviBar: UIView!
    var titleName: UILabel!
    
    var naviBarButton: UIButton!
    var naviBarButtonImage: UIImageView!
    var sideBTN: UIButton!
    private var sideMenuViewController = SideMenuViewController()
       private var dimmingView: UIView?
    
    
    var notice: WebView!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            self.view.backgroundColor = .white
            
            let statusBar = UIView(frame: CGRect(x: 0, y: 0, width: SCREEN.WIDTH, height: STATUS_BAR_HEIGHT))
            statusBar.backgroundColor = #colorLiteral(red: 0.1040975526, green: 0.1902649999, blue: 0.3965058923, alpha: 1)
            
            
            self.view.addSubview(statusBar)
            
            naviBar = UIView(frame: CGRect(x: 0, y: statusBar.frame.maxY, width: SCREEN.WIDTH, height: 50))
            naviBar.backgroundColor = #colorLiteral(red: 0.1040975526, green: 0.1902649999, blue: 0.3965058923, alpha: 1)
            self.view.addSubview(naviBar)
            
            titleName = UILabel(frame: CGRect(x: self.view.frame.size.width / 2.4, y: 0, width: 120, height: naviBar.frame.height))
    //        titleName.text = titleLabel
           
//            naviBarButton = UIButton(frame: CGRect(x: naviBar.frame.maxX - 55, y: naviBar.frame.size.height / 5, width: 25, height: 25))
//            naviBarButton.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
//            naviBarButtonImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
//            naviBarButtonImage.image = UIImage(systemName: "line.3.horizontal")
//            naviBarButton.addTarget(self, action: #selector(presentSideMenu), for: .touchUpInside)
//            naviBarButton.tintColor = .black
//            
//            naviBar.addSubview(naviBarButton)
//            naviBarButton.addSubview(naviBarButtonImage)
            naviBarButton = UIButton(frame: CGRect(x: naviBar.frame.maxX - 65, y: naviBar.frame.size.height / 5, width: 25, height: 25))
            naviBarButton.backgroundColor = #colorLiteral(red: 0.1032849923, green: 0.1911973059, blue: 0.397816658, alpha: 1)
            naviBarButtonImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
            naviBarButtonImage.image = UIImage(named: "menu_3")
            naviBarButton.addTarget(self, action: #selector(presentSideMenu), for: .touchUpInside)
            naviBarButton.tintColor = .black
            
            naviBar.addSubview(naviBarButton)
            naviBarButton.addSubview(naviBarButtonImage)
            
            naviBar.layer.addBorder([.bottom], color: .lightGray, width: 0.3)
                titleName.text = "공지사항"
            titleName.textColor = .white
            titleName.font = UIFont(name: "SUITE-Regular", size: 20)
            
            naviBar.addSubview(titleName)
            
            let button = UIButton(type: .custom)
                //Set the image
            button.setImage(UIImage(named: "back"), for: .normal)
                //Set the title
                button.setTitle("", for: .normal)
            button.tintColor = .black
            let origImage = UIImage(named: "back")
            let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
            button.setImage(tintedImage, for: .normal)
            button.tintColor = .white
            button.setTitleColor(.black, for: .normal)
                //Add target
                button.addTarget(self, action: #selector(callMethod), for: .touchUpInside)
                button.frame = CGRect(x: 20, y: 10, width: 60, height: 25)
            button.imageEdgeInsets = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
                button.sizeToFit()
            
            naviBar.addSubview(button)
            
//            tableView = UITableView(frame: CGRect(x: 0, y: naviBar.frame.maxY, width: self.view.frame.width, height: self.view.frame.size.height - naviBar.frame.height))
            tableView = UITableView(frame: CGRect(x: 0, y: self.naviBar.frame.maxY, width: self.view.frame.width, height: self.view.frame.size.height - naviBar.frame.height))
            tableView.backgroundColor = .white
            tableView.register(NoticeCell.self, forCellReuseIdentifier: "cell")
            tableView.dataSource = self
            tableView.delegate = self
            //2
//            view.addSubview(tableView)
            
            
            self.notice = WebView(frame: CGRect(
                x: 0,
                y: naviBar.frame.maxY,
                width: SCREEN.WIDTH,
                height: SCREEN.HEIGHT - naviBar.frame.maxY), urlString: URL_Addres.notice)
            
            
            notice.backgroundColor = .white
            self.view.addSubview(notice)
            
            
            
            
        }
        
    @objc func callMethod(){
        let vc = MainViewController()

        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false)
    }
    
//        func setupTableView() {
//            //6
//            tableView = UITableView(frame: CGRect(x: 0, y: self.naviBar.frame.maxY, width: self.view.frame.width, height: self.view.frame.size.height - naviBar.frame.height))
//            tableView.backgroundColor = .white
//            tableView.register(NoticeCell.self, forCellReuseIdentifier: "cell")
//            tableView.dataSource = self
//            tableView.delegate = self
//            //2
//            view.addSubview(tableView)
////            tableView.translatesAutoresizingMaskIntoConstraints = false
//            //3
////            tableView.topAnchor.constraint(equalTo: naviBar.bottomAnchor).isActive = true
////            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
////            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
////            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
////            tableView = UITableView(frame: CGRect(x: 0, y: naviBar.frame.maxY, width: self.view.frame.width, height: self.view.frame.size.height - naviBar.frame.height))
//        }
    }
    //5
    extension AnnouncementViewController: UITableViewDataSource, UITableViewDelegate {

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return items.count
        }
        //7
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? NoticeCell
            cell?.titleLabel?.text = items[indexPath.row]
            
            cell?.subTitleLabel.text = sub[indexPath.row]
            
            
            
            
            return cell!
        }
    
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 100
        }
        
        
        
        
//        func noticeUpdate(){
//            Server.getData(type: .GET_NOTICE, otherInfo: nil) { (kData : Data?) in
//                if let data = kData {
//                    if let noticeString = data.toString() {
//                        self.noticeValueLabel.text = noticeString
//                    }
//                }
//            }
//        }
    
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
        
}
