//
//  AnotherViewCell.swift
//  SideMenuViewController
//
//  Created by m2comm on 2024/01/09.
//

//import Foundation
//import UIKit
//
//protocol ButtonTappedDelegate {
//    func cellButtonTapped()
//    func cellButtonTapped2()
//    func cellButtonTapped3()
//    func cellButtonTapped4()
//    func cellButtonTapped5()
//}
//
//protocol ButtonTappedDelegate2 {
//    func cellButtonTapped11()
//    func cellButtonTapped21()
//    func cellButtonTapped31()
//    func cellButtonTapped41()
//    func cellButtonTapped51()
//}
//
//protocol ButtonTappedDelegate3 {
//    func cellButtonTapped12()
//    func cellButtonTapped22()
//    func cellButtonTapped32()
//    func cellButtonTapped42()
//    func cellButtonTapped52()
//}
//
//
//
//
//class ManagementbrainCell: UITableViewCell {
//    
//    var delegate: ButtonTappedDelegate?
//    var delegate2: ButtonTappedDelegate2?
//    var delegate3: ButtonTappedDelegate3?
//    
//    static var height : CGFloat = {
//      
//        
//        
//        
//        return 40
//    }()
//    
//    static let cellId = "cell"
//    
//    var titleLabel : UILabel!
//    var cellView: UIView!
//    var imageButton: UIButton!
//    var view: UIView!
//    
//    
//    
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        
//        self.backgroundView = UIView()
//        self.backgroundView?.backgroundColor = UIColor.clear
//        self.backgroundColor = UIColor.clear
//        self.selectionStyle = .none
//        
//        
//        
//        setUp()
//        print("test")
//              
//        
//        
//    }
//    
////    override func layoutSubviews() {
////        super.layoutSubviews()
////              let bottomSpace: CGFloat = 10 // Let's assume the space you want is 10
////              self.contentView.frame = self.contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: bottomSpace, right: 0))
////    }
//    
//    func setUp() {
//        
//        
//        if IS_IPHONE_X {
//            cellView = UIView(frame: CGRect(x: 20, y: 20, width: 332, height: 180))
//        } else if IS_IPHONE_N_PLUS {
//            cellView = UIView(frame: CGRect(x: 20, y: 20, width: 375, height: 170))
//        } else if IS_IPHONE_12PRO_MAX {
//            cellView = UIView(frame: CGRect(x: 20, y: 20, width: 385, height: 160))
//        } else if IS_IPHONE_15PRO_MAX {
//            cellView = UIView(frame: CGRect(x: 20, y: 20, width: 390, height: 160))
//        } else if IS_IPHONE_12PRO {
//            cellView = UIView(frame: CGRect(x: 20, y: 20, width: 350, height: 170))
//        } else if IS_IPHONE_15PRO {
//            cellView = UIView(frame: CGRect(x: 20, y: 20, width: 355, height: 170))
//        } else {
//            cellView = UIView(frame: CGRect(x: 20, y: 20, width: 335, height: 170))
//        }
//        cellView.layer.cornerRadius = 8
//        
//        view = UIView(frame: CGRect(x: 0, y: cellView.frame.maxY, width: 0, height: 30))
//        view.backgroundColor = .yellow
//        self.addSubview(view)
//        
//        
//        
//        titleLabel = UILabel(frame: CGRect(x: 15, y: 13, width: 200, height: 20))
//        titleLabel.text = ""
//        titleLabel.textColor = .black
//        titleLabel.font = UIFont(name: "SUITE-Regular", size: 17)
////        titleLabel.center.x = cellView.center.x
////        titleLabel.center.y = cellView.center.y
//        
//        
//        imageButton = UIButton(frame: CGRect(x: 40, y: 40, width: 50, height: 50))
//        
//        
//        self.addSubview(cellView)
//        
//        cellView.addSubview(titleLabel)
//        
//    
//        cellView.addSubview(imageButton)
//        
//        
//        let button = UIButton()
////          button.setTitle("1", for: .normal)
//        
//        button.setImage(UIImage(named: "goMenu1"), for: .normal)
////        button.setImage(UIImage(named: "sideMenu1"), for: .normal)
//        button.setTitleColor(.blue, for: .normal)
//          button.backgroundColor = UIColor.white
//          button.translatesAutoresizingMaskIntoConstraints = false
////        button.layer.borderWidth = 1
//        button.layer.cornerRadius = 8
//        button.imageView?.contentMode = .scaleAspectFit
//        button.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
//        
//        button.addTarget(self, action: #selector(buttonAction(_ :)), for: .touchUpInside)
//        
//
//          let button2 = UIButton()
////          button2.setTitle("2", for: .normal)
//        button2.setImage(UIImage(named: "goMenu2"), for: .normal)
//        
//          button2.backgroundColor = UIColor.white
//          button2.translatesAutoresizingMaskIntoConstraints = false
////        button2.layer.borderWidth = 1
//        button2.layer.cornerRadius = 8
//        button2.imageView?.contentMode = .scaleAspectFit
//        button2.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
//        button2.addTarget(self, action: #selector(buttonAction2(_ :)), for: .touchUpInside)
//
//          let button3 = UIButton()
////          button3.setTitle("3", for: .normal)
//        button3.setImage(UIImage(named: "goMenu3"), for: .normal)
//          button3.backgroundColor = UIColor.white
//          button3.translatesAutoresizingMaskIntoConstraints = false
////        button3.layer.borderWidth = 1
//        button3.layer.cornerRadius = 8
//        button3.imageView?.contentMode = .scaleAspectFit
//        button3.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
//        button3.addTarget(self, action: #selector(buttonAction3(_ :)), for: .touchUpInside)
//        
//        let buttonStackView = UIStackView(frame: CGRect(x: 20, y: 45, width: cellView.frame.size.width - 40, height: 70))
//          buttonStackView.alignment = .fill
//          buttonStackView.distribution = .fillEqually
//          buttonStackView.spacing = 50.0
//
//          buttonStackView.addArrangedSubview(button)
//          buttonStackView.addArrangedSubview(button2)
//          buttonStackView.addArrangedSubview(button3)
//      
////        contentView.backgroundColor = .yellow
//        
//        
//        
//        
//        cellView.addSubview(buttonStackView)
//        contentView.addSubview(cellView)
//        
//        
//        let label = UILabel()
////        label.setTitle("btn 1", for: .normal)
//        label.text = "도움말"
//                label.font = UIFont(name: "SUITE-Regular", size: 14)
////        label.font = UIFont.systemFont(ofSize: 12)
//        label.textAlignment = .center
//
////        label.backgroundColor = UIColor.white
////        label.translatesAutoresizingMaskIntoConstraints = false
//        let label2 = UILabel()
////        label.setTitle("btn 1", for: .normal)
//        label2.text = "관리수첩"
//        label2.font = UIFont(name: "SUITE-Regular", size: 14)
////        label2.font = UIFont.systemFont(ofSize: 12)
//        label2.textAlignment = .center
////        label.backgroundColor = UIColor.white
////        label.translatesAutoresizingMaskIntoConstraints = false
//        let label3 = UILabel()
////        label.setTitle("btn 1", for: .normal)
//        label3.text = "기록보기"
//        label3.font = UIFont(name: "SUITE-Regular", size: 14)
////        label3.font = UIFont.systemFont(ofSize: 12)
//        label3.textAlignment = .center
////        label.backgroundColor = UIColor.white
////        label.translatesAutoresizingMaskIntoConstraints = false
//        
//        let buttonStackViewLabel = UIStackView(frame: CGRect(x: 20, y: buttonStackView.frame.maxY + 5, width: cellView.frame.size.width - 40, height: 30))
//        buttonStackViewLabel.alignment = .fill
//        buttonStackViewLabel.distribution = .fillEqually
//        buttonStackViewLabel.spacing = 50
//        
//        buttonStackViewLabel.addArrangedSubview(label)
//        buttonStackViewLabel.addArrangedSubview(label2)
//        buttonStackViewLabel.addArrangedSubview(label3)
//
//        
//        
//        cellView.addSubview(buttonStackViewLabel)
//        
//      
//        
////        self.addSubview(titleLabel)
////
////        titleLabel.translatesAutoresizingMaskIntoConstraints = false
////        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant:  10).isActive = true
////        titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
////        titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
////        titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -10).isActive = true
//    
//        
//    }
//    
//    
//    @objc func buttonAction(_ sender: UIButton) {
//        
//        print("cell: \(titleLabel.text)")
//        
//        if titleLabel.text == "뇌졸중 관리" {
//            
//            print("뇌졸중")
//            
//            
//        } else if titleLabel.text == "혈압" {
//            print("혈압")
//            
//            
//            
//            delegate?.cellButtonTapped()
//        } else if titleLabel.text == "당뇨" {
//            print("당뇨")
//            
//            delegate?.cellButtonTapped2()
//            
//        } else if titleLabel.text == "이상지질혈증" {
//            print("이상지질혈증")
//            
//            
//            delegate?.cellButtonTapped3()
//        } else if titleLabel.text == "비만관리 및 운동" {
//            print("비만관리 및 운동")
//            
//            delegate?.cellButtonTapped4()
//        } else if titleLabel.text == "약물복용 관리" {
//            print("약물복용 관리")
//            
//            delegate?.cellButtonTapped5()
//        }
//
//        
//        
//        
//        
//    }
//    
//    
//    @objc func buttonAction2(_ sender: UIButton) {
//        
//        
//        print("cell: \(titleLabel.text)")
//        
//        if titleLabel.text == "뇌졸중 관리" {
//            print("뇌졸중")
//            
//        } else if titleLabel.text == "혈압" {
//            print("혈압관리수첩")
//            
//            delegate2?.cellButtonTapped11()
//        } else if titleLabel.text == "당뇨" {
//            print("당뇨")
//            
//            delegate2?.cellButtonTapped21()
//            
//        } else if titleLabel.text == "이상지질혈증" {
//            print("이상지질혈증")
//            
//            
//            delegate2?.cellButtonTapped31()
//        } else if titleLabel.text == "비만관리 및 운동" {
//            print("비만관리 및 운동")
//            
//            delegate2?.cellButtonTapped41()
//        } else if titleLabel.text == "약물복용 관리" {
//            print("약물복용 관리")
//            
//            delegate2?.cellButtonTapped51()
//        }
//
//        
//    }
//    
//    @objc func buttonAction3(_ sender: UIButton) {
//        
//        
//        print("cell: \(titleLabel.text)")
//        
//        if titleLabel.text == "뇌졸중 관리" {
//            print("뇌졸중")
//            
//        } else if titleLabel.text == "혈압" {
//            print("기록보기")
//            
//            delegate3?.cellButtonTapped12()
//        } else if titleLabel.text == "당뇨" {
//            print("당뇨")
//            
//            delegate3?.cellButtonTapped22()
//            
//        } else if titleLabel.text == "이상지질혈증" {
//            print("이상지질혈증")
//            
//            
//            delegate3?.cellButtonTapped32()
//        } else if titleLabel.text == "비만관리 및 운동" {
//            print("비만관리 및 운동")
//            
//            delegate3?.cellButtonTapped42()
//        } else if titleLabel.text == "약물복용 관리" {
//            print("약물복용 관리")
//            
//            delegate3?.cellButtonTapped52()
//        }
//
//    }
//
//    
//    override func prepareForReuse() {
//        
//    }
//
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//}

import Foundation
import UIKit

protocol ButtonTappedDelegate {
    func cellButtonTapped()
    func cellButtonTapped2()
    func cellButtonTapped3()
    func cellButtonTapped4()
    func cellButtonTapped5()
}

protocol ButtonTappedDelegate2 {
    func cellButtonTapped11()
    func cellButtonTapped21()
    func cellButtonTapped31()
    func cellButtonTapped41()
    func cellButtonTapped51()
}

protocol ButtonTappedDelegate3 {
    func cellButtonTapped12()
    func cellButtonTapped22()
    func cellButtonTapped32()
    func cellButtonTapped42()
    func cellButtonTapped52()
}




class ManagementbrainCell: UITableViewCell {
    
    var delegate: ButtonTappedDelegate?
    var delegate2: ButtonTappedDelegate2?
    var delegate3: ButtonTappedDelegate3?
    
    static var height : CGFloat = {
      
        
        
        
        return 40
    }()
    
    static let cellId = "cell"
    
    var titleLabel : UILabel!
    var cellView: UIView!
    var imageButton: UIButton!
    var view: UIView!
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundView = UIView()
        self.backgroundView?.backgroundColor = UIColor.clear
        self.backgroundColor = UIColor.clear
        self.selectionStyle = .none
        
        
        
        setUp()
        print("test")
              
        
        
    }
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//              let bottomSpace: CGFloat = 10 // Let's assume the space you want is 10
//              self.contentView.frame = self.contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: bottomSpace, right: 0))
//    }
    
    func setUp() {
        
        
        if IS_IPHONE_X {
            cellView = UIView(frame: CGRect(x: 20, y: 20, width: 332, height: 180))
        } else if IS_IPHONE_N_PLUS {
            cellView = UIView(frame: CGRect(x: 20, y: 20, width: 375, height: 170))
        } else if IS_IPHONE_12PRO_MAX {
            cellView = UIView(frame: CGRect(x: 20, y: 20, width: 385, height: 160))
        } else if IS_IPHONE_15PRO_MAX {
            cellView = UIView(frame: CGRect(x: 20, y: 20, width: 390, height: 160))
        } else if IS_IPHONE_12PRO {
            cellView = UIView(frame: CGRect(x: 20, y: 20, width: 350, height: 170))
        } else if IS_IPHONE_15PRO {
            cellView = UIView(frame: CGRect(x: 20, y: 20, width: 355, height: 170))
        } else {
            cellView = UIView(frame: CGRect(x: 20, y: 20, width: 335, height: 170))
        }
        cellView.layer.cornerRadius = 8
        
        view = UIView(frame: CGRect(x: 0, y: cellView.frame.maxY, width: 0, height: 30))
        view.backgroundColor = .yellow
        self.addSubview(view)
        
        
        
        titleLabel = UILabel(frame: CGRect(x: 15, y: 13, width: 200, height: 20))
        titleLabel.text = ""
        titleLabel.textColor = .black
        titleLabel.font = UIFont(name: "SUITE-Regular", size: 17)
//        titleLabel.center.x = cellView.center.x
//        titleLabel.center.y = cellView.center.y
        
        
        imageButton = UIButton(frame: CGRect(x: 40, y: 40, width: 50, height: 50))
        
        
        self.addSubview(cellView)
        
        cellView.addSubview(titleLabel)
        
    
        cellView.addSubview(imageButton)
        
        
        let button = UIButton()
//          button.setTitle("1", for: .normal)
        
        button.setImage(UIImage(named: "goMenu1"), for: .normal)
//        button.setImage(UIImage(named: "sideMenu1"), for: .normal)
        button.setTitleColor(.blue, for: .normal)
          button.backgroundColor = UIColor.white
          button.translatesAutoresizingMaskIntoConstraints = false
//        button.layer.borderWidth = 1
        button.layer.cornerRadius = 8
        button.imageView?.contentMode = .scaleAspectFit
        button.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        button.addTarget(self, action: #selector(buttonAction(_ :)), for: .touchUpInside)
        

          let button2 = UIButton()
//          button2.setTitle("2", for: .normal)
        button2.setImage(UIImage(named: "goMenu2"), for: .normal)
        
          button2.backgroundColor = UIColor.white
          button2.translatesAutoresizingMaskIntoConstraints = false
//        button2.layer.borderWidth = 1
        button2.layer.cornerRadius = 8
        button2.imageView?.contentMode = .scaleAspectFit
        button2.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        button2.addTarget(self, action: #selector(buttonAction2(_ :)), for: .touchUpInside)

          let button3 = UIButton()
//          button3.setTitle("3", for: .normal)
        button3.setImage(UIImage(named: "goMenu3"), for: .normal)
          button3.backgroundColor = UIColor.white
          button3.translatesAutoresizingMaskIntoConstraints = false
//        button3.layer.borderWidth = 1
        button3.layer.cornerRadius = 8
        button3.imageView?.contentMode = .scaleAspectFit
        button3.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        button3.addTarget(self, action: #selector(buttonAction3(_ :)), for: .touchUpInside)
        
        let buttonStackView = UIStackView(frame: CGRect(x: 20, y: 45, width: cellView.frame.size.width - 40, height: 70))
          buttonStackView.alignment = .fill
          buttonStackView.distribution = .fillEqually
          buttonStackView.spacing = 50.0

          buttonStackView.addArrangedSubview(button)
          buttonStackView.addArrangedSubview(button2)
          buttonStackView.addArrangedSubview(button3)
      
//        contentView.backgroundColor = .yellow
        
        
        
        
        cellView.addSubview(buttonStackView)
        contentView.addSubview(cellView)
        
        
        let label = UILabel()
//        label.setTitle("btn 1", for: .normal)
        label.text = "도움말"
                label.font = UIFont(name: "SUITE-Regular", size: 14)
//        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .center

//        label.backgroundColor = UIColor.white
//        label.translatesAutoresizingMaskIntoConstraints = false
        let label2 = UILabel()
//        label.setTitle("btn 1", for: .normal)
        label2.text = "관리수첩"
        label2.font = UIFont(name: "SUITE-Regular", size: 14)
//        label2.font = UIFont.systemFont(ofSize: 12)
        label2.textAlignment = .center
//        label.backgroundColor = UIColor.white
//        label.translatesAutoresizingMaskIntoConstraints = false
        let label3 = UILabel()
//        label.setTitle("btn 1", for: .normal)
        label3.text = "기록보기"
        label3.font = UIFont(name: "SUITE-Regular", size: 14)
//        label3.font = UIFont.systemFont(ofSize: 12)
        label3.textAlignment = .center
//        label.backgroundColor = UIColor.white
//        label.translatesAutoresizingMaskIntoConstraints = false
        
        let buttonStackViewLabel = UIStackView(frame: CGRect(x: 20, y: buttonStackView.frame.maxY + 5, width: cellView.frame.size.width - 40, height: 30))
        buttonStackViewLabel.alignment = .fill
        buttonStackViewLabel.distribution = .fillEqually
        buttonStackViewLabel.spacing = 50
        
        buttonStackViewLabel.addArrangedSubview(label)
        buttonStackViewLabel.addArrangedSubview(label2)
        buttonStackViewLabel.addArrangedSubview(label3)

        
        
        cellView.addSubview(buttonStackViewLabel)
        
      
        
//        self.addSubview(titleLabel)
//
//        titleLabel.translatesAutoresizingMaskIntoConstraints = false
//        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant:  10).isActive = true
//        titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
//        titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
//        titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -10).isActive = true
    
        
    }
    
    
    @objc func buttonAction(_ sender: UIButton) {
        
        print("cell: \(titleLabel.text)")
        
        if titleLabel.text == "뇌졸중 관리" {
            
            print("뇌졸중")
            
            
        } else if titleLabel.text == "혈압" {
            print("혈압")
            
            
            
            delegate?.cellButtonTapped()
        } else if titleLabel.text == "당뇨" {
            print("당뇨")
            
            delegate?.cellButtonTapped2()
            
        } else if titleLabel.text == "이상지질혈증" {
            print("이상지질혈증")
            
            
            delegate?.cellButtonTapped3()
        } else if titleLabel.text == "비만관리 및 운동" {
            print("비만관리 및 운동")
            
            delegate?.cellButtonTapped4()
        } else if titleLabel.text == "약물복용 관리" {
            print("약물복용 관리")
            
            delegate?.cellButtonTapped5()
        }

        
        
        
        
    }
    
    
    @objc func buttonAction2(_ sender: UIButton) {
        
        
        print("cell: \(titleLabel.text)")
        
        if titleLabel.text == "뇌졸중 관리" {
            print("뇌졸중")
            
        } else if titleLabel.text == "혈압" {
            print("혈압관리수첩")
            
            delegate2?.cellButtonTapped11()
        } else if titleLabel.text == "당뇨" {
            print("당뇨")
            
            delegate2?.cellButtonTapped21()
            
        } else if titleLabel.text == "이상지질혈증" {
            print("이상지질혈증")
            
            
            delegate2?.cellButtonTapped31()
        } else if titleLabel.text == "비만관리 및 운동" {
            print("비만관리 및 운동")
            
            delegate2?.cellButtonTapped41()
        } else if titleLabel.text == "약물복용 관리" {
            print("약물복용 관리")
            
            delegate2?.cellButtonTapped51()
        }

        
    }
    
    @objc func buttonAction3(_ sender: UIButton) {
        
        
        print("cell: \(titleLabel.text)")
        
        if titleLabel.text == "뇌졸중 관리" {
            print("뇌졸중")
            
        } else if titleLabel.text == "혈압" {
            print("기록보기")
            
            delegate3?.cellButtonTapped12()
        } else if titleLabel.text == "당뇨" {
            print("당뇨")
            
            delegate3?.cellButtonTapped22()
            
        } else if titleLabel.text == "이상지질혈증" {
            print("이상지질혈증")
            
            
            delegate3?.cellButtonTapped32()
        } else if titleLabel.text == "비만관리 및 운동" {
            print("비만관리 및 운동")
            
            delegate3?.cellButtonTapped42()
        } else if titleLabel.text == "약물복용 관리" {
            print("약물복용 관리")
            
            delegate3?.cellButtonTapped52()
        }

    }

    
    override func prepareForReuse() {
        
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
