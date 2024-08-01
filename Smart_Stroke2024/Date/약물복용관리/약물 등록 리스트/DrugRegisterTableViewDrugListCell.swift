//수정버튼
//  DrugRegisterTableViewDrugListCell.swift
//  KSR
//
//  Created by m2comm on 2018. 7. 30..
//  Copyright © 2018년 m2community. All rights reserved.
//

import UIKit

@objc protocol DrugRegisterTableViewCellDelegate {
    
    @objc optional func deleteButtonPressed(button:UIButton)
    @objc optional func editButtonPressed(button:UIButton)
    
    @objc optional func switchButtonValueChanged(switchButton:UISwitch)
    
}




// kindofMed view
class DrugRegisterTableViewDrugListCell: UITableViewCell {

    var delegate : DrugRegisterTableViewCellDelegate?
    
    
    static let height : CGFloat = 47.5
    
    var amPmLabel : UILabel!
    var timeLabel : UILabel!
    
    var labelBackView : UIView!
    var timeBackView : UIView!
    
    var deleteButton : UIButton!
    var editButton : UIButton!
    
    var switchButton : UISwitch!
    
    var underBar : UIView!
    
    var height : CGFloat = 100
    var myView: UIView!
    
    var hiddenIdxLabel: UILabel!
    
    var getIdx = Alram_R()
    
    var drugComponnentView2s = [DrugComponnentView2]()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.layer.cornerRadius = 8
        
        
        
        
        
        self.hiddenIdxLabel = UILabel(frame: CGRect(x: 50, y: 50, width: 30, height: 20))
        self.hiddenIdxLabel.text = "\(getIdx.idx)"
        
        
        
        self.contentView.addSubview(hiddenIdxLabel)
        
        
        self.contentView.frame.size.height = DrugRegisterTableViewCell.height
        self.selectionStyle = .none

        labelBackView = UIView(frame: CGRect(x: 0, y: 0, width: 120, height: DrugRegisterTableViewCell.height))
        labelBackView.backgroundColor = UIColor(red: 59/255, green: 72/255, blue: 105/255, alpha: 1)
        labelBackView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMinYCorner)
        labelBackView.layer.cornerRadius = 8
        labelBackView.layer.addBorder([.right], color: .lightGray, width: 1)
        labelBackView.backgroundColor = #colorLiteral(red: 0.9251995683, green: 0.9560804963, blue: 0.9901352525, alpha: 1)
        
        self.contentView.addSubview(labelBackView)
        
        
        underBar = UIView(frame: CGRect(x: labelBackView.frame.minX, y: labelBackView.frame.maxY, width: SCREEN.WIDTH - 40 + 10, height: 1))
        underBar.backgroundColor = .lightGray
        
        self.contentView.addSubview(underBar)
        
        timeBackView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: DrugRegisterTableViewCell.height))
//        timeBackView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMinYCorner)
//        timeBackView.layer.cornerRadius = 8
//        timeBackView.backgroundColor = #colorLiteral(red: 0.9251995683, green: 0.9560804963, blue: 0.9901352525, alpha: 1)
        
        labelBackView.addSubview(timeBackView)
        
        self.amPmLabel = UILabel(frame: CGRect(x: 0, y: 4, width: 25, height: DrugRegisterTableViewCell.height))
        self.amPmLabel.font = UIFont(name: Nanum_Barun_Gothic_OTF, size: 14)
        self.amPmLabel.textColor = UIColor.black
        self.amPmLabel.font = UIFont(name: "SUITE-Bold", size: 13)
        
        if IS_IPHONE_12PRO_MAX {
            self.amPmLabel.font = UIFont(name: "SUITE-Bold", size: 14)
        }
        if IS_IPHONE_15PRO_MAX {
            self.amPmLabel.font = UIFont(name: "SUITE-Bold", size: 14)
        }
        
        timeBackView.addSubview(self.amPmLabel)
        
        
        
        self.timeLabel = UILabel(frame: CGRect(x: self.amPmLabel.frame.maxX + 2, y: 0, width: 45, height: DrugRegisterTableViewCell.height))
        self.timeLabel.font = UIFont(name: Nanum_Barun_Gothic_OTF, size: 20)
        self.timeLabel.textColor = UIColor.black
        self.timeLabel.font = UIFont(name: "SUITE-Bold", size: 21)
        
        if IS_IPHONE_12PRO_MAX {
            self.timeLabel.font = UIFont(name: "SUITE-Bold", size: 22)
        }
        if IS_IPHONE_15PRO_MAX {
            self.timeLabel.font = UIFont(name: "SUITE-Bold", size: 22)
        }
        
        
        timeBackView.addSubview(self.timeLabel)
        
        timeBackView.frame.size.width = self.timeLabel.frame.maxX
        timeBackView.center.x = labelBackView.frame.size.width / 2
        
        
        
        self.deleteButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 25))
        if IS_IPHONE_12PRO_MAX {
            self.deleteButton = UIButton(frame: CGRect(x: 0, y: 0, width: 70, height: 30))
        }
        if IS_IPHONE_15PRO_MAX {
            self.deleteButton = UIButton(frame: CGRect(x: 0, y: 0, width: 70, height: 30))
        }
        if IS_IPHONE_N {
            self.deleteButton = UIButton(frame: CGRect(x: 0, y: 0, width: 60, height: 30))
        }
        if IS_IPHONE_MINI {
            self.deleteButton = UIButton(frame: CGRect(x: 0, y: 0, width: 60, height: 30))
        }
        if IS_IPHONE_N_PLUS {
            self.deleteButton = UIButton(frame: CGRect(x: 0, y: 0, width: 70, height: 30))
        }
        if IS_IPHONE_12PRO {
            self.deleteButton = UIButton(frame: CGRect(x: 0, y: 0, width: 60, height: 30))
        }
        if IS_IPHONE_15PRO {
            self.deleteButton = UIButton(frame: CGRect(x: 0, y: 0, width: 60, height: 30))
        }
        self.deleteButton.frame.origin.x = SCREEN.WIDTH - self.deleteButton.frame.size.width - 14 - 25
        self.deleteButton.center.y = DrugRegisterTableViewCell.height / 2
        self.deleteButton.setTitle("삭제", for: .normal)
//        self.deleteButton.titleLabel?.font = UIFont(name: Nanum_Barun_Gothic_OTF, size: 12)
        self.deleteButton.setTitleColor(UIColor(red: 221/255, green: 15/255, blue: 15/255, alpha: 1), for: .normal)
        self.deleteButton.layer.borderWidth = 0.5
        self.deleteButton.layer.cornerRadius = 6
        self.deleteButton.titleLabel?.font = UIFont(name: "SUITE-Regular", size: 14)
        self.deleteButton.layer.borderColor = UIColor(red: 221/255, green: 15/255, blue: 15/255, alpha: 1).cgColor
        self.deleteButton.addTarget(self, action: #selector(deleteButtonPressed(button:)), for: .touchUpInside)
        self.addSubview(self.deleteButton)
        
        self.editButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 25))
        if IS_IPHONE_12PRO_MAX {
            self.editButton = UIButton(frame: CGRect(x: 0, y: 0, width: 70, height: 30))
        }
        if IS_IPHONE_15PRO_MAX {
            self.editButton = UIButton(frame: CGRect(x: 0, y: 0, width: 70, height: 30))
        }
        
        if IS_IPHONE_N {
            self.editButton = UIButton(frame: CGRect(x: 0, y: 0, width: 60, height: 30))
        }
        
        if IS_IPHONE_MINI {
            self.editButton = UIButton(frame: CGRect(x: 0, y: 0, width: 60, height: 30))
        }
        
        if IS_IPHONE_N_PLUS {
            self.editButton = UIButton(frame: CGRect(x: 0, y: 0, width: 70, height: 30))
        }
        
        
        if IS_IPHONE_12PRO {
            self.editButton = UIButton(frame: CGRect(x: 0, y: 0, width: 60, height: 30))
        }
        if IS_IPHONE_15PRO {
            self.editButton = UIButton(frame: CGRect(x: 0, y: 0, width: 60, height: 30))
        }
        
        self.editButton.frame.origin.x = self.deleteButton.frame.origin.x - self.editButton.frame.size.width - 7 - 15
        if IS_IPHONE_N {
            self.editButton.frame.origin.x = self.deleteButton.frame.origin.x - self.editButton.frame.size.width - 7 - 5
        }
        
        if IS_IPHONE_MINI {
            self.editButton.frame.origin.x = self.deleteButton.frame.origin.x - self.editButton.frame.size.width - 7 - 5
        }
        
        if IS_IPHONE_N_PLUS {
            self.editButton.frame.origin.x = self.deleteButton.frame.origin.x - self.editButton.frame.size.width - 7 - 5
        }
        
        if IS_IPHONE_12PRO {
            self.editButton.frame.origin.x = self.deleteButton.frame.origin.x - self.editButton.frame.size.width - 7 - 5
        }
        if IS_IPHONE_15PRO {
            self.editButton.frame.origin.x = self.deleteButton.frame.origin.x - self.editButton.frame.size.width - 7 - 5
        }
        if IS_IPHONE_12PRO_MAX {
            self.editButton.frame.origin.x = self.deleteButton.frame.origin.x - self.editButton.frame.size.width - 7 - 5
        }
        if IS_IPHONE_15PRO_MAX {
            self.editButton.frame.origin.x = self.deleteButton.frame.origin.x - self.editButton.frame.size.width - 7 - 5
        }
        
        
        self.editButton.center.y = DrugRegisterTableViewCell.height / 2
        self.editButton.setTitle("수정", for: .normal)
        self.editButton.titleLabel?.font = UIFont(name: "SUITE-Regular", size: 14)
//        self.editButton.titleLabel?.font = UIFont(name: Nanum_Barun_Gothic_OTF, size: 12)
        self.editButton.setTitleColor(UIColor(red: 60/255, green: 125/255, blue: 211/255, alpha: 1), for: .normal)
        self.editButton.layer.borderWidth = 0.5
        self.editButton.layer.cornerRadius = 6
        self.editButton.layer.borderColor = UIColor(red: 60/255, green: 125/255, blue: 211/255, alpha: 1).cgColor
        self.editButton.addTarget(self, action: #selector(editButtonPressed(button:)), for: .touchUpInside)
        self.addSubview(self.editButton)
        
        self.switchButton = UISwitch(frame: CGRect(x: 0, y: 0, width: 42, height: 21))
        
        
        self.switchButton.frame.origin.x = self.editButton.frame.origin.x - self.switchButton.frame.size.width - 18 - 25
        
        
        if IS_IPHONE_12PRO_MAX {
            self.switchButton.frame.origin.x = self.editButton.frame.origin.x - self.switchButton.frame.size.width - 18 - 25
        }
        if IS_IPHONE_15PRO_MAX {
            self.switchButton.frame.origin.x = self.editButton.frame.origin.x - self.switchButton.frame.size.width - 18 - 25
        }
        if IS_IPHONE_N {
            self.switchButton.frame.origin.x = self.editButton.frame.origin.x - self.switchButton.frame.size.width - 18 - 8
        }
        if IS_IPHONE_X {
            self.switchButton.frame.origin.x = self.editButton.frame.origin.x - self.switchButton.frame.size.width - 18 - 8
        }
        
        self.switchButton.center.y =  DrugRegisterTableViewCell.height / 2
        self.switchButton.isOn = false
//        self.switchButton.layer.borderWidth = 1
        self.switchButton.onTintColor = #colorLiteral(red: 0.1120603457, green: 0.3473795056, blue: 0.8121653795, alpha: 1)
        self.switchButton.addTarget(self, action: #selector(switchButtonValueChanged(switchButton:)), for: .valueChanged)
        self.addSubview(switchButton)
        
//        self.labelUpdate(ampmString: "오전", timeString: "17:00"
//                         self.labelUpdate(ampmString: "오전", timeString: "17:00", hiddenLabel: "") !!!!!!!
        
        
        
//        self.layer.cornerRadius = 8
//        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0))
        
//        myView = UIView(frame: CGRect(x: 15, y: self.frame.maxY, width: SCREEN.WIDTH - 30, height: 20))
//        myView.backgroundColor = .clear
//        self.addSubview(myView)
        
//        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0))
//        let drugComponnentView = DrugComponnentView(frame: CGRect(x: 0, y: CGFloat(i) * (17 + 13), width: self.frame.size.width, height: 17), drug: drugNotiInfo.drugs[i])

    }
    
    
    
    @objc func deleteButtonPressed(button : UIButton ){
        print("starskdljasd--")
        self.delegate?.deleteButtonPressed?(button: button)
        print("starskdljasd")
    }
    
    @objc func editButtonPressed(button:UIButton){
        print("tab")
        
        
        
        
        
//        let idx = RealmCenter.shared.realm.objects(Alram_R.self).filter("idx")
//        button.tag = idx
        
        print("\(hiddenIdxLabel.text)")
        
        
        self.delegate?.editButtonPressed?(button: button)
    }
    @objc func switchButtonValueChanged(switchButton:UISwitch){
        self.delegate?.switchButtonValueChanged?(switchButton: switchButton)
    }
    
    func labelUpdate( ampmString : String, timeString : String, hiddenLabel: String ){
        
        /////약물등록리스트시간변경
        
        self.amPmLabel.text = ampmString
        self.timeLabel.text = timeString
        
        
//        self.amPmLabel.text = "999"
//        self.timeLabel.text = "999"
        
        self.hiddenIdxLabel.text = hiddenLabel
        self.hiddenIdxLabel.textColor = .white
        var ampmLabelSize = self.amPmLabel.sizeThatFits(CGSize(width: 100, height: 100))
        ampmLabelSize.height = DrugRegisterTableViewDrugListCell.height
        self.amPmLabel.frame.size = ampmLabelSize
//        amPmLabel.font = UIFont(name: "SUITE-Regular", size: 30)
        
        var timeLabelSize = self.timeLabel.sizeThatFits(CGSize(width: 100, height: 100))
        timeLabelSize.height = DrugRegisterTableViewDrugListCell.height
        self.timeLabel.frame.size = timeLabelSize
//        timeLabel.font = UIFont(name: "SUITE-Regular", size: 15)
        
        self.timeLabel.frame.origin.x = amPmLabel.frame.maxX + 6.5
        self.timeBackView.frame.size.width = self.timeLabel.frame.maxX
        self.timeBackView.center.x = self.labelBackView.frame.size.width / 2
        
        
    }
//    override func layoutSubviews() {
//        
//      super.layoutSubviews()
//      
//        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0))
//       
//      
//    }

//    override func layoutSubviews() {
//            super.layoutSubviews()
//        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: -200, right: 0))
//        }
    
    
    //        override func layoutSubviews() {
    //            super.layoutSubviews()
    //
    //            contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 50, right: 10))
    //        }
//        override func layoutSubviews() {
//                super.layoutSubviews()
//            contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 0))
//            }
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
//    override func layoutMarginsDidChange() {
//        super.layoutMarginsDidChange()
//        
//        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0))
//    }
    
//    override func layoutSublayers(of layer: CALayer) {
//        super.layoutSublayers(of: layer)
//        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0))
//    }
    
}
