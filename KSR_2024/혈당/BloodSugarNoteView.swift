//
//  BloodSugarNoteView.swift
//  KSR
//
//  Created by m2comm on 2018. 6. 27..
//  Copyright © 2018년 m2community. All rights reserved.
//

import UIKit

class BloodSugarNoteView: UIScrollView
,UITextFieldDelegate, CancelAndSaveButtonViewDelegate
{
    var superCon : BloodSugarViewController?

    var bloodSugarGoalAndRateView : BloodSugarGoalAndRateView!
    let buttonColor = UIColor(red: 0.18, green: 0.4, blue: 0.79, alpha: 1)
    
    enum BeforeOrAfter {
        case before
        case after
    }
    
    var beforeOfAfter : BeforeOrAfter?
    
    var afterButton : UIButton!
    var beforeButton : UIButton!
    
    var bloodSugarInputView : DataInputView!
    var hbA1cInputView : DataInputView!
    
    var today : Date!
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        self.backgroundColor = UIColor(red: 245/255, green: 246/255, blue: 249/255, alpha: 1)

        bloodSugarGoalAndRateView = BloodSugarGoalAndRateView()
        self.addSubview(bloodSugarGoalAndRateView)
        
        //goal
        bloodSugarGoalAndRateView.goalView.notiLabelUpdate(text: "나의 혈당 목표 수치는?", image: #imageLiteral(resourceName: "profile"))
        
        bloodSugarGoalAndRateView.goalView.subTitleLabelUpdate(subTitleLabelindex: 0, titleString: "금식혈당 :")
        bloodSugarGoalAndRateView.goalView.valueLabelUpdate(labelIndex: 0, valueString: "120", unitString: "mg/dL 이하")
        
        bloodSugarGoalAndRateView.goalView.subTitleLabelUpdate(subTitleLabelindex: 1, titleString: "식후혈당 :")
        bloodSugarGoalAndRateView.goalView.valueLabelUpdate(labelIndex: 1, valueString: "200", unitString: "mg/dL 이하")
        
        bloodSugarGoalAndRateView.goalView.subTitleLabelUpdate(subTitleLabelindex: 2, titleString: "당화혈색소 :")
        bloodSugarGoalAndRateView.goalView.valueLabelUpdate(labelIndex: 2, valueString: "7.0", unitString: "")
        
        //rate
        bloodSugarGoalAndRateView.rateView.notiLabelUpdate(text: "목표 수치 달성율은?", image: #imageLiteral(resourceName: "stats"))
        bloodSugarGoalAndRateView.rateView.subTitleLabelUpdate(subTitleLabelindex: 0, titleString: "금식혈당 :")
        bloodSugarGoalAndRateView.rateView.subTitleLabelUpdate(subTitleLabelindex: 1, titleString: "식후혈당 :")
        bloodSugarGoalAndRateView.rateView.subTitleLabelUpdate(subTitleLabelindex: 2, titleString: "당화혈색소 :")

        self.today = Date()
        let timeView = TimeView()
        timeView.frame.origin.y = bloodSugarGoalAndRateView.frame.maxY
        timeView.timeLabel.text = dateToStringWithFormat(formatString: "yyyy.MM.dd a h:mm", date: self.today)
//        "2018.02.02 PM 1:20"
        self.addSubview(timeView)
        
        let simpleNoticeView = SimpleNoticeView()
        simpleNoticeView.frame.origin.y = timeView.frame.maxY
        simpleNoticeView.noticeLabel.text = "측정하신 혈당을 입력해주세요."
        self.addSubview(simpleNoticeView)
        
        let mealStateInputView = DataInputView()
        mealStateInputView.frame.origin.y = simpleNoticeView.frame.maxY
        mealStateInputView.dataUpdate(noticeString: "식사 상태", placeholderString: "", unitString: "")
        mealStateInputView.valueTextField.isEnabled = false
        mealStateInputView.unitLabel.isEnabled = false
        mealStateInputView.valueTextField.delegate = self
        self.addSubview(mealStateInputView)
        
        let buttonSize = CGSize(width: 40, height: 37.5 - 15)
        afterButton = UIButton(frame: CGRect(x: 0, y: 0, width: buttonSize.width, height: buttonSize.height))
        afterButton.frame.origin.x = SCREEN.WIDTH - 15.5 - afterButton.frame.size.width
        afterButton.center.y = mealStateInputView.frame.size.height / 2
        afterButton.setTitle("식후", for: .normal)
        afterButton.setTitleColor(self.buttonColor, for: .normal)
        afterButton.layer.borderColor = self.buttonColor.cgColor
        afterButton.layer.borderWidth = 0.5
        afterButton.isSelected = false
        afterButton.titleLabel?.font = UIFont(name: Nanum_Barun_Gothic_OTF, size: 10)
        afterButton.addTarget(self, action: #selector(beforeOrAfterButtonPressed(button:)), for: .touchUpInside)
        mealStateInputView.addSubview(afterButton)
        
        beforeButton = UIButton(frame: CGRect(x: 0, y: 0, width: buttonSize.width, height: buttonSize.height))
        beforeButton.frame.origin.x = afterButton.frame.minX - 10 - beforeButton.frame.size.width
        beforeButton.center.y = mealStateInputView.frame.size.height / 2
        beforeButton.setTitle("공복", for: .normal)
        beforeButton.setTitleColor(self.buttonColor, for: .normal)
        beforeButton.layer.borderColor = self.buttonColor.cgColor
        beforeButton.layer.borderWidth = 0.5
        beforeButton.isSelected = false
        beforeButton.titleLabel?.font = UIFont(name: Nanum_Barun_Gothic_OTF, size: 10)
        beforeButton.addTarget(self, action: #selector(beforeOrAfterButtonPressed(button:)), for: .touchUpInside)
        mealStateInputView.addSubview(beforeButton)
        
        bloodSugarInputView = DataInputView()
        bloodSugarInputView.frame.origin.y = mealStateInputView.frame.maxY
        bloodSugarInputView.dataUpdate(noticeString: "혈당", placeholderString: "혈당을 입력해주세요.", unitString: "mg/dl")
        bloodSugarInputView.valueTextField.delegate = self
        bloodSugarInputView.valueTextField.keyboardType = .numberPad
        self.addSubview(bloodSugarInputView)
        
        hbA1cInputView = DataInputView()
        hbA1cInputView.frame.origin.y = bloodSugarInputView.frame.maxY
        hbA1cInputView.dataUpdate(noticeString: "당화혈색소", placeholderString: "당화혈색소를 입력해주세요.", unitString: "")
        hbA1cInputView.valueTextField.delegate = self
        hbA1cInputView.valueTextField.keyboardType = .decimalPad
        self.addSubview(hbA1cInputView)
        
        
        let cancelAndSaveBV = CancelAndSaveButtonView(type: .notFull)
        cancelAndSaveBV.frame.origin.y = hbA1cInputView.frame.maxY + 30
        cancelAndSaveBV.delegate = self
        self.addSubview(cancelAndSaveBV)
        
        self.contentSize = CGSize(width: SCREEN.WIDTH, height: cancelAndSaveBV.frame.maxY + 20)
    }
    
    func saveButtonPressed(button: UIButton) {
        
        if self.beforeOfAfter == nil {
            toastShow(message: "식사 상태를 선택하세요.")
            return
        }
        
        if self.bloodSugarInputView.valueTextField.text == "" {
            toastShow(message: "혈당을 입력해주세요.")
            return
        }
        
        if self.hbA1cInputView.valueTextField.text == "" {
            toastShow(message: "당화혈색소를 입력해주세요.")
        }
        
        guard let regNumString = userD.object(forKey: USER_KEY.KSR_REGISTRATION_NUMBER) as? String else {
            toastShow(message: "reg_num is nil error")
            return
        }
        
        let val = self.bloodSugarInputView.valueTextField.text!
        let hba1c = self.hbA1cInputView.valueTextField.text!
        
        let year = dateToStringWithFormat(formatString: "yyyy", date: self.today)
        let month = dateToStringWithFormat(formatString: "MM", date: self.today)
        let week = dateToStringWithFormat(formatString: "w", date: self.today)
        let dayweek = dateToStringWithFormat(formatString: "c", date: self.today)
        let day = dateToStringWithFormat(formatString: "dd", date: self.today)
        let dateTime = dateToStringWithFormat(formatString: "yyyy.MM.dd a h:mm", date: self.today)
        let gubun = (self.beforeOfAfter == .before) ? "1":"2"
        
        let sendDataDic = [
            "reg_num":regNumString,
            "val":val,
            "hba1c":hba1c,
            "gubun":gubun,
            "year":year,
            "month":month,
            "week":week,
            "dayweek":dayweek,
            "day":day,
            "datetime":dateTime,
            ]
        print("sendDataDic:\n\(sendDataDic)")
        Server.getData(type: Server.InfoType.SUGAR_ADD, otherInfo: sendDataDic) { (kData : Data?) in
            if let data = kData {
                if let dataString : String = String(data: data, encoding: String.Encoding.utf8) {
                    print("dataString:\(dataString)")
                    self.endEditing(true)
//                    self.superCon?.segView.itemButtonPressed(button: (self.superCon?.segView.itemButtons[2])!)
                }
            }
        }
    }
    func cancelButtonPressed(button: UIButton) {
        self.superCon?.navigationController?.popViewController(animated: true)
    }
    @objc func beforeOrAfterButtonPressed(button : UIButton ){
        if button == self.beforeButton {
            self.beforeOfAfter = .before
            
            self.beforeButton.isSelected = true
            self.afterButton.isSelected = false
            
            self.beforeButton.setTitleColor(UIColor.white, for: .normal)
            self.beforeButton.backgroundColor = self.buttonColor
            
            self.afterButton.setTitleColor(self.buttonColor, for: .normal)
            self.afterButton.backgroundColor = UIColor.white
            
            
        }else{
            self.beforeOfAfter = .after
            
            self.afterButton.isSelected = true
            self.beforeButton.isSelected = false
            
            self.afterButton.setTitleColor(UIColor.white, for: .normal)
            self.afterButton.backgroundColor = self.buttonColor
            
            self.beforeButton.setTitleColor(self.buttonColor, for: .normal)
            self.beforeButton.backgroundColor = UIColor.white
            
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            if !touch.view!.isKind(of: UITextField.self) {
                self.endEditing(true)
            }
        }
    }
    
    //MARK:UITextFieldDelegate
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        //핵심

        let textFieldMaxY = appDel.mainVC!.view.convert(textField.frame, from: textField.superview!).maxY
        let keyBoardHeight : CGFloat = (IS_IPHONE_X ? 377 : 216) + 44
        let targetHeight = (SCREEN.HEIGHT - textFieldMaxY) - keyBoardHeight - 10
        if targetHeight < 0 {
            UIView.animate(withDuration: 0.3, animations: {
                appDel.window?.frame.origin.y = targetHeight
            }) { (fi:Bool) in
                
            }
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.3, animations: {
            appDel.window?.frame.origin.y = 0
        }) { (fi:Bool) in
            
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if string == "." {
            if textField.text!.contains("."){
                return false
            }
        }
        
        return true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
