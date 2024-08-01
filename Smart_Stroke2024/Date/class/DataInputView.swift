//
//  DataInputView.swift
//  KSR
//
//  Created by m2comm on 2018. 6. 22..
//  Copyright © 2018년 m2community. All rights reserved.
//

import UIKit

class DataInputView: UIView
,UITextFieldDelegate
{

    convenience init() {
        self.init(frame: CGRect(x: 0, y: 0, width: SCREEN.WIDTH, height: 37.5))
    }
    
    var noticeLabel : UILabel!
    var valueTextField : UITextField!
    var unitLabel : UILabel!
    
    var unitText = ""
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.white
     
        self.noticeLabel = UILabel(frame: CGRect(x: 15, y: 0, width: 60, height: 37.5))
        self.noticeLabel.font = UIFont(name: Nanum_Barun_Gothic_OTF, size: 13)
        self.noticeLabel.textColor = UIColor(red: 59/255, green: 77/255, blue: 91/255, alpha: 1)
        self.addSubview(self.noticeLabel)
        
        self.valueTextField = UITextField(frame: CGRect(x: 0, y: 0, width: 150, height: 37.5))
        self.valueTextField.frame.origin.x = SCREEN.WIDTH - 14.5 - self.valueTextField.frame.size.width
        self.valueTextField.font = UIFont(name: Nanum_Barun_Gothic_OTF, size: 13)
        self.valueTextField.textAlignment = .right
        self.valueTextField.delegate = self
        self.valueTextField.addDoneCancelToolbar()
        self.addSubview(self.valueTextField)
        
        self.unitLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 150, height: 37.5))
        self.unitLabel.font = UIFont(name: Nanum_Barun_Gothic_OTF, size: 13)
        self.unitLabel.textAlignment = .right
        self.addSubview(self.unitLabel)
       
    }
    
    func dataUpdate( noticeString : String, placeholderString : String, unitString : String ){
        
        self.unitLabel.text = unitString
        let newUnitSize = self.unitLabel.sizeThatFits(self.unitLabel.frame.size)
        self.unitLabel.frame.size = CGSize(width: newUnitSize.width, height: 37.5)
        self.unitLabel.frame.origin.x = SCREEN.WIDTH - 15.5 - self.unitLabel.frame.size.width
        
        self.noticeLabel.text = noticeString
        let newNoticeLabelSize = self.noticeLabel.sizeThatFits(self.noticeLabel.frame.size)
        self.noticeLabel.frame.size = CGSize(width: newNoticeLabelSize.width, height: 37.5)
        
        self.valueTextField.placeholder = placeholderString
        self.valueTextField.frame.size.width = (self.unitLabel.frame.minX - 10) - (self.noticeLabel.frame.maxX + 10)
        self.valueTextField.frame.origin.x = self.noticeLabel.frame.maxX + 10
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}
