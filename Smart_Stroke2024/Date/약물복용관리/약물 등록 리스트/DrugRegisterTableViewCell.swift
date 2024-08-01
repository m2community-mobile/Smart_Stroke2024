//
//  DrugRegisterTableViewCell.swift
//  KSR
//
//  Created by m2comm on 2018. 6. 26..
//  Copyright © 2018년 m2community. All rights reserved.
//

import UIKit

//@objc protocol DrugRegisterTableViewCellDelegate {
//    
//    @objc optional func deleteButtonPressed(button:UIButton)
//    @objc optional func editButtonPressed(button:UIButton)
//    
//    @objc optional func switchButtonValueChanged(switchButton:UISwitch)
//    
//}

//timeview ok
class DrugRegisterTableViewCell: UITableViewCell {

//    var delegate : DrugRegisterTableViewCellDelegate?
    
    
    static let height : CGFloat = 47.5
    
    
    
//
//    var amPmLabel : UILabel!
//    var timeLabel : UILabel!
//    
//    var labelBackView : UIView!
//    var timeBackView : UIView!
//    
//    var deleteButton : UIButton!
//    var editButton : UIButton!
//    
//    var switchButton : UISwitch!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        
        
        
        
        
//        self.contentView.frame.size.height = DrugRegisterTableViewCell.height
//        self.selectionStyle = .none
//
//        labelBackView = UIView(frame: CGRect(x: 0, y: 0, width: 120, height: DrugRegisterTableViewCell.height))
//        labelBackView.backgroundColor = UIColor(red: 59/255, green: 72/255, blue: 105/255, alpha: 1)
//        
//        self.contentView.addSubview(labelBackView)
//        
//        timeBackView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: DrugRegisterTableViewCell.height))
//        labelBackView.addSubview(timeBackView)
//        
//        self.amPmLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 30, height: DrugRegisterTableViewCell.height))
//        self.amPmLabel.font = UIFont(name: Nanum_Barun_Gothic_OTF, size: 14)
//        self.amPmLabel.textColor = UIColor.white
//        timeBackView.addSubview(self.amPmLabel)
//        
//        self.timeLabel = UILabel(frame: CGRect(x: self.amPmLabel.frame.maxX + 6.5, y: 0, width: 45, height: DrugRegisterTableViewCell.height))
//        self.timeLabel.font = UIFont(name: Nanum_Barun_Gothic_OTF, size: 20)
//        self.timeLabel.textColor = UIColor.white
//        timeBackView.addSubview(self.timeLabel)
//        
//        timeBackView.frame.size.width = self.timeLabel.frame.maxX
//        timeBackView.center.x = labelBackView.frame.size.width / 2
//        
//        self.deleteButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 25))
//        self.deleteButton.frame.origin.x = SCREEN.WIDTH - self.deleteButton.frame.size.width - 14 - 25
//        self.deleteButton.center.y = DrugRegisterTableViewCell.height / 2
//        self.deleteButton.setTitle("삭제", for: .normal)
//        self.deleteButton.titleLabel?.font = UIFont(name: Nanum_Barun_Gothic_OTF, size: 12)
//        self.deleteButton.setTitleColor(UIColor(red: 221/255, green: 15/255, blue: 15/255, alpha: 1), for: .normal)
//        self.deleteButton.layer.borderWidth = 0.5
//        self.deleteButton.layer.borderColor = UIColor(red: 221/255, green: 15/255, blue: 15/255, alpha: 1).cgColor
//        self.deleteButton.addTarget(self, action: #selector(deleteButtonPressed(button:)), for: .touchUpInside)
//        self.addSubview(self.deleteButton)
//        
//        self.editButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 25))
//        self.editButton.frame.origin.x = self.deleteButton.frame.origin.x - self.editButton.frame.size.width - 7 - 15
//        self.editButton.center.y = DrugRegisterTableViewCell.height / 2
//        self.editButton.setTitle("수정", for: .normal)
//        self.editButton.titleLabel?.font = UIFont(name: Nanum_Barun_Gothic_OTF, size: 12)
//        self.editButton.setTitleColor(UIColor(red: 60/255, green: 125/255, blue: 211/255, alpha: 1), for: .normal)
//        self.editButton.layer.borderWidth = 0.5
//        self.editButton.layer.borderColor = UIColor(red: 60/255, green: 125/255, blue: 211/255, alpha: 1).cgColor
//        self.editButton.addTarget(self, action: #selector(editButtonPressed(button:)), for: .touchUpInside)
//        self.addSubview(self.editButton)
//        
//        self.switchButton = UISwitch(frame: CGRect(x: 0, y: 0, width: 42, height: 21))
//        self.switchButton.frame.origin.x = self.editButton.frame.origin.x - self.switchButton.frame.size.width - 18 - 25
//        self.switchButton.center.y =  DrugRegisterTableViewCell.height / 2
//        self.switchButton.isOn = false
//        self.switchButton.addTarget(self, action: #selector(switchButtonValueChanged(switchButton:)), for: .valueChanged)
//        self.addSubview(switchButton)
//        
//        self.labelUpdate(ampmString: "오전", timeString: "17:00")
//        
        

        
    }
    
//        override func layoutSubviews() {
//            super.layoutSubviews()
//    
//            contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 50, right: 10))
//        }
//    override func layoutSubviews() {
//            super.layoutSubviews()
//        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 200, right: 0))
//        }
    
    
//    var topInset: CGFloat = 0
//    var leftInset: CGFloat = 0
//    var bottomInset: CGFloat = 0
//    var rightInset: CGFloat = 0
//
//    override func layoutMarginsDidChange() {
//        super.layoutMarginsDidChange()
//        self.layoutMargins = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
//    }
//    override func layoutSubviews() {
//        super.layoutSubviews()
//            
//        self.frame = self.frame.inset(by: UIEdgeInsets(top: 6, left: 6, bottom: 100, right: 6))
//      }
    
//    @objc func deleteButtonPressed(button : UIButton ){
//        self.delegate?.deleteButtonPressed?(button: button)
//    }
//    
//    @objc func editButtonPressed(button:UIButton){
//        self.delegate?.editButtonPressed?(button: button)
//    }
//    @objc func switchButtonValueChanged(switchButton:UISwitch){
//        self.delegate?.switchButtonValueChanged?(switchButton: switchButton)
//    }
    
//    func labelUpdate( ampmString : String, timeString : String ){
//        self.amPmLabel.text = ampmString
//        self.timeLabel.text = timeString
//        
//        var ampmLabelSize = self.amPmLabel.sizeThatFits(CGSize(width: 100, height: 100))
//        ampmLabelSize.height = DrugRegisterTableViewCell.height
//        self.amPmLabel.frame.size = ampmLabelSize
//        
//        var timeLabelSize = self.timeLabel.sizeThatFits(CGSize(width: 100, height: 100))
//        timeLabelSize.height = DrugRegisterTableViewCell.height
//        self.timeLabel.frame.size = timeLabelSize
//        
//        self.timeLabel.frame.origin.x = amPmLabel.frame.maxX + 6.5
//        self.timeBackView.frame.size.width = self.timeLabel.frame.maxX
//        self.timeBackView.center.x = self.labelBackView.frame.size.width / 2
//    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
