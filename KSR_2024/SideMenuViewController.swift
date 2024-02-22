//
//  SideMenuViewController.swift
//  
//
//  Created by m2comm on 2024/01/10.
//




import Foundation
import UIKit
import SnapKit


struct cellData {
    var opened = Bool()
    var title = String()
    var sectionData = [String]()
}

struct cellImage {
    var opende = Bool()
    var title = String()
    var image = [Data]()
}


class SideMenuViewController: UIViewController {
 
   

    // MARK: - Data
       
       var tableViewData = [cellData]()
    var manaTableViewData = [cellData]()
    var viewColor = [#colorLiteral(red: 0.9334588647, green: 0.9439326525, blue: 0.9988724589, alpha: 1), #colorLiteral(red: 1, green: 0.9568354487, blue: 0.9648322463, alpha: 1), #colorLiteral(red: 0.9485726953, green: 0.9838657975, blue: 1, alpha: 1), #colorLiteral(red: 0.9647474885, green: 0.9719269872, blue: 1, alpha: 1), #colorLiteral(red: 0.952888906, green: 0.9678936601, blue: 1, alpha: 1), #colorLiteral(red: 0.9483161569, green: 0.9958497882, blue: 1, alpha: 1)]
       
    
    var tableImage = [cellImage]()
    
       
       // MARK: - Property

       var tableView = UITableView()
       
       
       // MARK: - Lifecycle
    
    
    
    var cancleBTN: UIButton!
    
//    var dataList = ["1", "2", "3", "4", "1", "2", "3", "4"]
//    var dataList2 = ["4", "5", "6"]
//    
//    var dataArray = [String]()
    
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
    
    var sideButtonStackView: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewData = [cellData(opened: false, title: "급성기 뇌졸중", sectionData: ["뇌졸중은요?", "뇌졸중은 어떤 종류가 있나요?", "뇌졸중의 경고 증상을 알아볼까요?"]),
                         cellData(opened: false, title: "위험인자", sectionData: ["뇌졸중 위험인자"]),
                         cellData(opened: false, title: "고혈압", sectionData: [" -고혈압이란?", " -소금과 혈압", " -소금을 적게 먹는 실천방법", " -한국인 외식의 주요 나트륨 섭취식품", " -고혈압 약물치료"]),
                         cellData(opened: false, title: "당뇨병", sectionData: ["", ""]),
                         cellData(opened: false, title: "고지혈증", sectionData: ["", ""]),
                         cellData(opened: false, title: "심방세동", sectionData: ["", ""]),
                         
                         cellData(opened: false, title: "흡연", sectionData: ["", ""]),
                         cellData(opened: false, title: "음주", sectionData: ["", ""]),
                         cellData(opened: false, title: "비만", sectionData: ["", ""]),
                         cellData(opened: false, title: "응급처치", sectionData: ["", ""]),
                         cellData(opened: false, title: "뇌졸중의 치료", sectionData: ["", ""]),
                         cellData(opened: false, title: "환자 관리", sectionData: ["", ""])]
        
        manaTableViewData = [cellData(opened: false, title: "뇌졸중 관리", sectionData: []),
                             cellData(opened: false, title: "혈압", sectionData: []),
                             cellData(opened: false, title: "당뇨", sectionData: []),
                             cellData(opened: false, title: "이상지질혈증", sectionData: []),
                             cellData(opened: false, title: "비만관리 및 운동", sectionData: []),
                             cellData(opened: false, title: "약물복용 관리", sectionData: [])]
        
        
        
        
        self.view.layer.cornerRadius = 8
        self.view.clipsToBounds = true
                           
//        self.view.backgroundColor = .lightGray.withAlphaComponent(0.9)
        self.view.backgroundColor = #colorLiteral(red: 0.03898835182, green: 0.2098707557, blue: 0.4803187847, alpha: 1).withAlphaComponent(1)
        
        cancleBTN = UIButton(frame: CGRect(x: 20, y: 20, width: 40, height: 40))
//        cancleBTN.backgroundColor = .yellow
        cancleBTN.setImage(UIImage(systemName: "xmark"), for: .normal)
//        cancleBTN.setTitleColor(.white, for: .normal)
        cancleBTN.tintColor = .white
        cancleBTN.addTarget(self, action: #selector(cancle(_ :)), for: .touchUpInside)
        self.view.addSubview(cancleBTN)
        
        
        //SIDE MENU
     

        buttonView = UIView(frame: CGRect(x: 30, y: cancleBTN.frame.maxY + 25, width: self.view.frame.width - 60, height: 100))
        buttonView.backgroundColor = #colorLiteral(red: 0.05414709449, green: 0.2448198497, blue: 0.5320709944, alpha: 1)
        buttonView.layer.borderWidth = 1
        buttonView.layer.cornerRadius = 8
        self.view.addSubview(buttonView)
        
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
        
        let sideButtonStackView = UIStackView(frame: CGRect(x: 10, y: 20, width: buttonView.frame.width - 20, height: 40))
        sideButtonStackView.alignment = .fill
        sideButtonStackView.distribution = .fillEqually
        sideButtonStackView.spacing = 8.0
        
        sideButtonStackView.addArrangedSubview(button)
        sideButtonStackView.addArrangedSubview(button2)
        sideButtonStackView.addArrangedSubview(button3)
        
        buttonView.addSubview(sideButtonStackView)
        
        
        let label = UILabel()
//        label.setTitle("btn 1", for: .normal)
        label.text = "공지사항"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .white
        label.textAlignment = .center

//        label.backgroundColor = UIColor.white
//        label.translatesAutoresizingMaskIntoConstraints = false
        let label2 = UILabel()
//        label.setTitle("btn 1", for: .normal)
        label2.text = "회원정보"
        label2.font = UIFont.systemFont(ofSize: 14)
        label2.textColor = .white
        label2.textAlignment = .center
//        label.backgroundColor = UIColor.white
//        label.translatesAutoresizingMaskIntoConstraints = false
        let label3 = UILabel()
//        label.setTitle("btn 1", for: .normal)
        label3.text = "설정"
        label3.font = UIFont.systemFont(ofSize: 14)
        label3.textColor = .white
        label3.textAlignment = .center
//        label.backgroundColor = UIColor.white
//        label.translatesAutoresizingMaskIntoConstraints = false
        
        let sideButtonStackViewLabel = UIStackView(frame: CGRect(x: 10, y: sideButtonStackView.frame.maxY + 5, width: buttonView.frame.width - 20, height: 20))
        sideButtonStackViewLabel.alignment = .fill
        sideButtonStackViewLabel.distribution = .fillEqually
        sideButtonStackViewLabel.spacing = 0.8
        
        sideButtonStackViewLabel.addArrangedSubview(label)
        sideButtonStackViewLabel.addArrangedSubview(label2)
        sideButtonStackViewLabel.addArrangedSubview(label3)
        buttonView.addSubview(sideButtonStackViewLabel)
        

        goBrain = UIButton(frame: CGRect(x: 0, y: buttonView.frame.maxY + 30, width: buttonView.frame.size.width / 1.7, height: 70))
//        ksbmrButton.frame.size.width *= 0.5
        goBrain.backgroundColor = UIColor.clear
        goBrain.setTitle("뇌졸중 바로알기", for: .normal)
        goBrain.setTitleColor(.black, for: .normal)
        goBrain.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        goBrain.layer.borderWidth = 1
        goBrain.tag = 0
        self.view.addSubview(goBrain)
        goBrain.addTarget(self, action: #selector(test(_ :)), for: .touchUpInside)

        managementbrain = UIButton(frame: CGRect(x: goBrain.frame.maxX, y: buttonView.frame.maxY + 30, width: buttonView.frame.size.width / 1.7, height: 70))
//        nonMemberButton.frame.size.width *= 0.5
//        nonMemberButton.frame.origin.x = menuView.frame.width - nonMemberButton.frame.width
        managementbrain.setTitle("뇌졸중 관리수첩", for: .normal)
        managementbrain.setTitleColor(.black, for: .normal)
        managementbrain.backgroundColor = #colorLiteral(red: 0.0745619908, green: 0.1568424106, blue: 0.2876431346, alpha: 1)
        managementbrain.layer.borderWidth = 1
        managementbrain.tag = 1
        self.view.addSubview(managementbrain)
        managementbrain.addTarget(self, action: #selector(test2(_ :)), for: .touchUpInside)




        myTableView = UITableView(frame: CGRect(x: 0, y: goBrain.frame.maxY, width: self.view.frame.width, height: self.view.frame.size.height), style: .grouped)
        myTableView.register(GoBrainCell.self, forCellReuseIdentifier: "cell")

//        myTableView.register(SideTableViewHeaderView.self, forHeaderFooterViewReuseIdentifier: "SideTableViewHeaderView")
//        self.myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.showsVerticalScrollIndicator = false
        myTableView.separatorStyle = .none
//        myTableView.bounces = false
        myTableView.backgroundColor = .white
        myTableView.backgroundView?.backgroundColor = UIColor.clear
        myTableView.bounces = true
        myTableView.isUserInteractionEnabled = true
//        myTableView.rowHeight = UITableView.automaticDimension
        self.myTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 400, right: 0)
        
        
        self.view.addSubview(myTableView)

        myTableView.reloadData()

        managementTableView = UITableView(frame: CGRect(x: 0, y: goBrain.frame.maxY, width: self.view.frame.width, height: self.view.frame.height - (menuView.frame.maxY)), style: .grouped)

        managementTableView.register(ManagementbrainCell.self, forCellReuseIdentifier: "cell")
//        myTableView.register(SideTableViewHeaderView.self, forHeaderFooterViewReuseIdentifier: "SideTableViewHeaderView")
//        self.myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        managementTableView.delegate = self
        managementTableView.dataSource = self
        managementTableView.showsVerticalScrollIndicator = false
        managementTableView.separatorStyle = .none
        managementTableView.bounces = true
        managementTableView.backgroundColor = .white
        managementTableView.backgroundView?.backgroundColor = UIColor.clear
        self.managementTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 400, right: 0)
        managementTableView.rowHeight = UITableView.automaticDimension
        
        self.view.addSubview(managementTableView)

//        managementTableView.reloadData()
        // SIDE MENU
        
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        myTableView.reloadData()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
//        containerView.frame = containerView.frame.inset(by: UIEdgeInsets(top: 50, left: 50, bottom: 50, right: 50))
//        managementTableView.frame = containerView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
//        let layout = UICollectionViewFlowLayout()
//        layout.minimumLineSpacing = 100.0 // <- 셀 간격 설정
        
    }
    

    
   
    
    @objc func test(_ sender: UIButton) {
        myTableView.isHidden = false
        managementTableView.isHidden = true
        
        goBrain.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        managementbrain.backgroundColor = #colorLiteral(red: 0.0745619908, green: 0.1568424106, blue: 0.2876431346, alpha: 1)
        
        
//        dataArray = dataList
        myTableView.reloadData()
        
    }
    
    @objc func test2(_ sender: UIButton) {
        managementTableView.isHidden = false
        myTableView.isHidden = true
        
        goBrain.backgroundColor = #colorLiteral(red: 0.0745619908, green: 0.1568424106, blue: 0.2876431346, alpha: 1)
        managementbrain.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
//        dataArray = dataList2
        managementTableView.reloadData()
        
    }
    
    @objc func cancle(_ sender: UIButton) {
        let vc = MainViewController()

        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false)
    }
}

public extension UIView {
    func edgeTo(_ view: UIView) {
        view.addSubview(self)
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func pinMenuTo(_ view: UIView, with constant: CGFloat) {
        view.addSubview(self)
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -constant).isActive = true
        bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
}

extension SideMenuViewController: UITableViewDelegate, UITableViewDataSource {
    

    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if tableView == myTableView {
            return self.tableViewData.count
        } else {
            return self.manaTableViewData.count
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == myTableView {
            if tableViewData[section].opened == true {
                // tableView Section이 열려있으면 Section Cell 하나에 sectionData 개수만큼 추가해줘야 함
                return tableViewData[section].sectionData.count + 1
            } else {
                // tableView Section이 닫혀있을 경우에는 Section Cell 하나만 보여주면 됨
                return 1
            }
        } else if tableView == managementTableView {
            if manaTableViewData[section].opened == true {
                // tableView Section이 열려있으면 Section Cell 하나에 sectionData 개수만큼 추가해줘야 함
                return manaTableViewData[section].sectionData.count + 1
            } else {
                // tableView Section이 닫혀있을 경우에는 Section Cell 하나만 보여주면 됨
                return 1
            }
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        // section 부분 코드
        
        if tableView == myTableView {
            if indexPath.row == 0 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
                        as? GoBrainCell else { return UITableViewCell() }
                //                   cell.configureUI()
                cell.titleLabel.text = tableViewData[indexPath.section].title
                return cell
                
                // sectionData 부분 코드
            } else {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
                        as? GoBrainCell else { return UITableViewCell() }
                //                   cell.configureUI()
                cell.titleLabel.text = tableViewData[indexPath.section].sectionData[indexPath.row - 1]
                return cell
            }
        } else if tableView == managementTableView {
            if indexPath.row == 0 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
                        as? ManagementbrainCell else { return UITableViewCell() }
                //                   cell.configureUI()
                cell.titleLabel.text = manaTableViewData[indexPath.section].title
                cell.cellView.backgroundColor = viewColor[indexPath.section]
                
                cell.delegate = self
//                cell.backgroundColor = viewColor[indexPath.section]
                return cell
                
                // sectionData 부분 코드
            } else {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
                        as? ManagementbrainCell else { return UITableViewCell() }
                //                   cell.configureUI()
                
                cell.titleLabel.text = manaTableViewData[indexPath.section].sectionData[indexPath.row - 1]
                cell.titleLabel.sizeToFit()
                cell.cellView = cell.titleLabel
                
                cell.delegate = self
                
                return cell
            }
        }
        
        
        
//        switch tableView {
//        case myTableView:
//            print("!")
//            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? GoBrainCell
//
//
//
//
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
        
        
        
        
        
    
        return UITableViewCell()
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//
//            return 0
//
//        }
    
 
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        

        if tableView == managementTableView {







            return 150
//
        }
        return tableView.rowHeight
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
        if tableView == myTableView {
            // 셀 선택 시 회색에서 다시 변하게 해주는 것
            tableView.deselectRow(at: indexPath, animated: true)
            
            // section 부분 선택하면 열리게 설정
            if indexPath.row == 0 {
                // section이 열려있다면 다시 닫힐 수 있게 해주는 코드
                tableViewData[indexPath.section].opened = !tableViewData[indexPath.section].opened
                
                // 모든 데이터를 새로고침하는 것이 아닌 해당하는 섹션 부분만 새로고침
                tableView.reloadSections([indexPath.section], with: .none)
                
                // sectionData 부분을 선택하면 아무 작동하지 않게 설정
            } else {
                print("이건 sectionData 선택한 거야")
            }
            
            print([indexPath.section], [indexPath.row])
        } else {
            
            let vc = StrokeManagementHandbookViewController()

            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: false)
            // 셀 선택 시 회색에서 다시 변하게 해주는 것
            tableView.deselectRow(at: indexPath, animated: true)
            
            // section 부분 선택하면 열리게 설정
            if indexPath.row == 0 {
                
                // section이 열려있다면 다시 닫힐 수 있게 해주는 코드
                manaTableViewData[indexPath.section].opened = !manaTableViewData[indexPath.section].opened
                
                // 모든 데이터를 새로고침하는 것이 아닌 해당하는 섹션 부분만 새로고침
                tableView.reloadSections([indexPath.section], with: .none)
                
                // sectionData 부분을 선택하면 아무 작동하지 않게 설정
            } else {
                print("이건 sectionData 선택한 거야")
                
                
            }
            
            print([indexPath.section], [indexPath.row])
            
        }
            
        }
    
}

extension SideMenuViewController: ButtonTappedDelegate {
    func cellButtonTapped() {
        print("Button Tapped")
        
        let vc = BloodPressureViewController()

        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false)
    }
    
    func cellButtonTapped2() {
        print("tab")
        
        let vc = DiabetesViewController()

        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false)
    }
    
    func cellButtonTapped3() {
        print("tab")
        
        let vc = DyslipidemiaViewController()

        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false)
    }
    
    func cellButtonTapped4() {
        print("tab")
        
        let vc = ObesityViewController()

        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false)
    }
    
    func cellButtonTapped5() {
        print("tab")
        
        let vc =  MedicationManagementViewController()

        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false)
    }
   
}
