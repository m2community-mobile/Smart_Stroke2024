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
    
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            self.view.backgroundColor = .white
            
            let statusBar = UIView(frame: CGRect(x: 0, y: 0, width: SCREEN.WIDTH, height: STATUS_BAR_HEIGHT))
            statusBar.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            
            
            self.view.addSubview(statusBar)
            
            naviBar = UIView(frame: CGRect(x: 0, y: statusBar.frame.maxY, width: SCREEN.WIDTH, height: 50))
            naviBar.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            self.view.addSubview(naviBar)
            
            titleName = UILabel(frame: CGRect(x: self.view.frame.size.width / 2.4, y: 0, width: 120, height: naviBar.frame.height))
    //        titleName.text = titleLabel
           
            
            
           
                titleName.text = "공지사항"
            titleName.font = UIFont(name: "SUITE-Regular", size: 20)
            
            naviBar.addSubview(titleName)
            
            let button = UIButton(type: .custom)
                //Set the image
            button.setImage(UIImage(named: "back"), for: .normal)
                //Set the title
                button.setTitle("", for: .normal)
            button.tintColor = .black
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
            view.addSubview(tableView)
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
        
        
    
    
}
