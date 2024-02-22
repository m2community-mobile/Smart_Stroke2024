//
//  BloodPressureNoteView.swift
//  KSR
//
//  Created by m2comm on 2018. 6. 26..
//  Copyright © 2018년 m2community. All rights reserved.
//

import UIKit


class BloodPressureNoteView: UIScrollView
,UITextFieldDelegate, CancelAndSaveButtonViewDelegate
{
    var superCon : BloodPressureViewController?

    var bloodPressureGoalAndRateView : BloodPressureGoalAndRateView!
    
    
    var contractionInputView : DataInputView!
    var relaxtionInputView : DataInputView!
    var heartRateInputView : DataInputView!

    var today : Date!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentSize.width = SCREEN.WIDTH
        self.backgroundColor = UIColor(red: 245/255, green: 246/255, blue: 249/255, alpha: 1)

        //
        bloodPressureGoalAndRateView = BloodPressureGoalAndRateView()
        bloodPressureGoalAndRateView.goalView.notiLabelUpdate(text: "나의 혈압 목표 수치는?", image: #imageLiteral(resourceName: "profile"))
        bloodPressureGoalAndRateView.rateView.notiLabelUpdate(text: "목표 수치 달성율은?", image: #imageLiteral(resourceName: "stats"))
        self.addSubview(bloodPressureGoalAndRateView)
        
        let timeView = TimeView()
        self.today = Date()
        timeView.frame.origin.y = 70
        timeView.timeLabel.text = dateToStringWithFormat(formatString: "yyyy.MM.dd a h:mm", date: self.today)
        self.addSubview(timeView)
        
        let simpleNoticeView = SimpleNoticeView()
        simpleNoticeView.frame.origin.y = timeView.frame.maxY
        simpleNoticeView.noticeLabel.text = "측정하신 혈압과 맥박을 입력해주세요."
        self.addSubview(simpleNoticeView)
        
        contractionInputView = DataInputView()
        contractionInputView.frame.origin.y = simpleNoticeView.frame.maxY
        contractionInputView.dataUpdate(noticeString: "수축기", placeholderString: "수축기를 입력해주세요.", unitString: "mmHg")
        contractionInputView.valueTextField.delegate = self
        contractionInputView.valueTextField.keyboardType = .numberPad
        self.addSubview(contractionInputView)
        
        relaxtionInputView = DataInputView()
        relaxtionInputView.frame.origin.y = contractionInputView.frame.maxY
        relaxtionInputView.dataUpdate(noticeString: "이완기", placeholderString: "이완기를 입력해주세요.", unitString: "mmHg")
        relaxtionInputView.valueTextField.delegate = self
        relaxtionInputView.valueTextField.keyboardType = .numberPad
        self.addSubview(relaxtionInputView)
        
        heartRateInputView = DataInputView()
        heartRateInputView.frame.origin.y = relaxtionInputView.frame.maxY
        heartRateInputView.dataUpdate(noticeString: "맥박", placeholderString: "맥박을 입력해주세요.", unitString: "회/분")
        heartRateInputView.valueTextField.delegate = self
        heartRateInputView.valueTextField.keyboardType = .numberPad
        self.addSubview(heartRateInputView)
        
        let cancelAndSaveBV = CancelAndSaveButtonView(type: .notFull)
        cancelAndSaveBV.frame.origin.y = heartRateInputView.frame.maxY + 10
        cancelAndSaveBV.delegate = self
        self.addSubview(cancelAndSaveBV)
        
        //주의사항
        let precautionsView = PrecautionsView()
        precautionsView.setContentLabelString(content: "자가혈압측정시 주의사항")
        precautionsView.frame.origin.y = cancelAndSaveBV.frame.maxY
//        precautionsView.addTarget(event: .touchUpInside) { (button) in
//            
//            let knowVC = KnowViewController()
//            
//            knowVC.titleString = "자가혈압측정시 주의사항"
//            knowVC.urlString = "http://ksrapp.m2comm.co.kr/html/popup.html"
//            
//            self.superCon?.navigationController?.pushViewController(knowVC, animated: true)
//            
//        }
        self.addSubview(precautionsView)
        
//        let addButtonSize : CGFloat = SCREEN.WIDTH * (50/320)
//        let addButton = UIButton(frame: CGRect(
//            x: SCREEN.WIDTH - 17.5 - addButtonSize,
//            y: precautionsView.frame.maxY,
//            width: addButtonSize,
//            height: addButtonSize))
//        addButton.layer.cornerRadius = addButtonSize / 2
//        addButton.backgroundColor = UIColor(red: 43/255, green: 49/255, blue: 86/255, alpha: 1)
//        self.addSubview(addButton)
//
//        let addButtonImageViewSize : CGFloat = addButtonSize
//        let addButtonImage = #imageLiteral(resourceName: "btn_d_more2")
//        let addButtonImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: addButtonImageViewSize, height: addButtonImageViewSize))
//        addButtonImageView.center = CGPoint(x: addButtonSize / 2, y: addButtonSize / 2)
//        addButtonImageView.image = addButtonImage
//        addButtonImageView.isUserInteractionEnabled = false
//        addButton.addSubview(addButtonImageView)
        
        self.contentSize.height = max(self.frame.size.height, precautionsView.frame.maxY + 17.5)
        
    }

    func saveButtonPressed(button: UIButton) {
        
        
        if self.contractionInputView.valueTextField.text == "" {
            toastShow(message: "수축기를 입력하세요.")
            return
        }
        
        if self.relaxtionInputView.valueTextField.text == "" {
            toastShow(message: "이완기를 입력하세요.")
            return
        }
        
        if self.heartRateInputView.valueTextField.text == "" {
            toastShow(message: "맥박을 입력하세요.")
            return
        }
        
        let max = self.contractionInputView.valueTextField.text!
        let min = self.relaxtionInputView.valueTextField.text!
        let pulse = self.heartRateInputView.valueTextField.text!
        
//        guard let regNumString = userD.object(forKey: USER_KEY.KSR_REGISTRATION_NUMBER) as? String else {
//            toastShow(message: "reg_num is nil error")
//            return
//        }
        let sid = "\(UserDefaults.standard.object(forKey: "sid") ?? 0)"
        let regNumString = "SB-12500-1"
        
        let year = dateToStringWithFormat(formatString: "yyyy", date: self.today)
        let month = dateToStringWithFormat(formatString: "MM", date: self.today)
        let week = dateToStringWithFormat(formatString: "3", date: self.today)
//        let week = "3"
        let dayweek = dateToStringWithFormat(formatString: "3", date: self.today)
//        let dayweek = "3"
        let day = dateToStringWithFormat(formatString: "dd", date: self.today)
        let dateTime = dateToStringWithFormat(formatString: "yyyy.MM.dd a h:mm", date: self.today)
        
        let sendDataDic = [
            "user_sid":sid,
//            "reg_num":regNumString,
            "max":max,
            "min":min,
            "pulse":pulse,
            "year":year,
            "month":month,
            "week":week,
            "dayweek":dayweek,
            "day":day,
            "datetime":dateTime,
        ]
        print("sendDataDic:\n\(sendDataDic)")
        Server.getData(type: Server.InfoType.BLOOD_ADD, otherInfo: sendDataDic) { (kData : Data?) in
            if let data = kData {
                if let dataString : String = String(data: data, encoding: String.Encoding.utf8) {
                    print("dataString:\(dataString)")
                    self.endEditing(true)
                    print("go")
//                    self.superCon?.segView.itemButtonPressed(button: (self.superCon?.segView.itemButtons[2])!)
                    
                }
            }
        }
        
    }
    func cancelButtonPressed(button: UIButton) {
        self.superCon?.navigationController?.popViewController(animated: true)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        let textFieldMaxY = sceneDel!.mainVC!.view.convert(textField.frame, from: textField.superview!).maxY
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
    
    
    
}


