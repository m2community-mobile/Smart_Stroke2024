//
//  DyslipidemiaNoteView.swift
//  KSR
//
//  Created by m2comm on 2018. 6. 28..
//  Copyright © 2018년 m2community. All rights reserved.
//

//import UIKit
//
//class DyslipidemiaNoteView: UIScrollView
//,UITextFieldDelegate
//,CancelAndSaveButtonViewDelegate
//{
//
//    var DyslipidemiahVIew: UIView!
//        var DyslipidemiaVIewLabel: UILabel!
//        var DyslipidemiaVIewShowNumLabel: UILabel!
//        var DyslipidemiaVIewShowLabel: UILabel!
//        var DyslipidemiaVIewGraph: UIView!
//        var DyslipidemiaVIewBTN: UIButton!
//    
//        var dateLable: UILabel!
//    
//    
//    var superCon : DyslipidemiaViewController?
//    
//    var goalAndRateView : GoalAndRateView_1Value!
//    
//    var totalColesterolInputView : DataInputView!
//    var hdlColesterolInputView : DataInputView!
//    var ldlColesterolInputView : DataInputView!
//    var triglycerideInputView : DataInputView!
//    
//    var today : Date!
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        
//        self.backgroundColor = UIColor.white
//        
//        DyslipidemiahVIew = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
//        
//                DyslipidemiaVIewLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
////                self.addSubview(FastingBloodSugar)
//                DyslipidemiaVIewShowNumLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
//                DyslipidemiaVIewShowLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
//                DyslipidemiaVIewGraph = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
//                DyslipidemiaVIewBTN = UIButton(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
//        
//                dateLable = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
//        
//        self.contentSize.width = SCREEN.WIDTH
//        self.backgroundColor = UIColor(red: 245/255, green: 246/255, blue: 249/255, alpha: 1)
//        
//        goalAndRateView = GoalAndRateView_1Value()
//        self.addSubview(goalAndRateView)
//        
//        
//        
//        
//        
//        goalAndRateView.goalView.notiLabelUpdate(text: "나의 콜레스테롤 목표 수치는?", image: #imageLiteral(resourceName: "profile"))
//        goalAndRateView.goalView.valueLabelUpdate(valueString: "70", unitString: "mg/dL")
//        goalAndRateView.rateView.notiLabelUpdate(text: "목표 수치 달성율은?", image: #imageLiteral(resourceName: "stats"))
//        
//        goalAndRateView.frame.size.height = goalAndRateView.goalView.frame.size.height
//        
//        self.today = Date()
//        let timeView = TimeView()
//        timeView.frame.origin.y = goalAndRateView.frame.maxY
//        timeView.timeLabel.text = dateToStringWithFormat(formatString: "yyyy.MM.dd a h:mm", date: self.today)
//        self.addSubview(timeView)
//        
//        let simpleNoticeView = SimpleNoticeView()
//        simpleNoticeView.frame.origin.y = timeView.frame.maxY
//        simpleNoticeView.noticeLabel.text = "혈중 지질 수치를 입력해주세요."
//        self.addSubview(simpleNoticeView)
//        
//        totalColesterolInputView = DataInputView()
//        totalColesterolInputView.frame.origin.y = simpleNoticeView.frame.maxY
//        totalColesterolInputView.dataUpdate(noticeString: "총 콜레스테롤", placeholderString: "수치를 입력해주세요", unitString: "mg/dL")
//        totalColesterolInputView.valueTextField.keyboardType = .numberPad
//        totalColesterolInputView.valueTextField.delegate = self
//        self.addSubview(totalColesterolInputView)
//        
//        hdlColesterolInputView = DataInputView()
//        hdlColesterolInputView.frame.origin.y = totalColesterolInputView.frame.maxY
//        hdlColesterolInputView.dataUpdate(noticeString: "HDL 콜레스테롤", placeholderString: "수치를 입력해주세요", unitString: "mg/dL")
//        hdlColesterolInputView.valueTextField.keyboardType = .numberPad
//        hdlColesterolInputView.valueTextField.delegate = self
//        self.addSubview(hdlColesterolInputView)
//        
//        ldlColesterolInputView = DataInputView()
//        ldlColesterolInputView.frame.origin.y = hdlColesterolInputView.frame.maxY
//        ldlColesterolInputView.dataUpdate(noticeString: "LDL 콜레스테롤", placeholderString: "수치를 입력해주세요", unitString: "mg/dL")
//        ldlColesterolInputView.valueTextField.keyboardType = .numberPad
//        ldlColesterolInputView.valueTextField.delegate = self
//        self.addSubview(ldlColesterolInputView)
//        
//        triglycerideInputView = DataInputView()
//        triglycerideInputView.frame.origin.y = ldlColesterolInputView.frame.maxY
//        triglycerideInputView.dataUpdate(noticeString: "중성지방", placeholderString: "수치를 입력해주세요", unitString: "mg/dL")
//        triglycerideInputView.valueTextField.keyboardType = .numberPad
//        triglycerideInputView.valueTextField.delegate = self
//        self.addSubview(triglycerideInputView)
//        
//        let cancelAndSaveBV = CancelAndSaveButtonView(type: .notFull)
//        cancelAndSaveBV.frame.origin.y = triglycerideInputView.frame.maxY + 10
//        cancelAndSaveBV.delegate = self
//        self.addSubview(cancelAndSaveBV)
//        
//        self.contentSize.height = max(self.frame.size.height, cancelAndSaveBV.frame.maxY + 20)
//        
//    }
//    
//    func saveButtonPressed(button: UIButton) {
//
//       
//        
//        if self.totalColesterolInputView.valueTextField.text == "" {
//            toastShow(message: "총 콜레스테롤을 입력하세요.")
//            return
//        }
//        if self.hdlColesterolInputView.valueTextField.text == "" {
//            toastShow(message: "LDL 콜레스테롤을 입력하세요.")
//            return
//        }
//        
//        if self.ldlColesterolInputView.valueTextField.text == "" {
//            toastShow(message: "HDL 콜레스테롤을 입력하세요.")
//            return
//        }
//        if self.triglycerideInputView.valueTextField.text == "" {
//            toastShow(message: "중성지방을 입력하세요.")
//            return
//        }
//        
//        guard let regNumString = userD.object(forKey: USER_KEY.KSR_REGISTRATION_NUMBER) as? String else {
//            toastShow(message: "reg_num is nil error")
//            return
//        }
//        
//        let total = self.totalColesterolInputView.valueTextField.text!
//        let hdl = self.hdlColesterolInputView.valueTextField.text!
//        let ldl = self.ldlColesterolInputView.valueTextField.text!
//        let mid = self.triglycerideInputView.valueTextField.text!
//        
//        let year = dateToStringWithFormat(formatString: "yyyy", date: self.today)
//        let month = dateToStringWithFormat(formatString: "MM", date: self.today)
//        let week = dateToStringWithFormat(formatString: "w", date: self.today)
//        let dayweek = dateToStringWithFormat(formatString: "c", date: self.today)
//        let day = dateToStringWithFormat(formatString: "dd", date: self.today)
//        let dateTime = dateToStringWithFormat(formatString: "yyyy.MM.dd a h:mm", date: self.today)
//
//        
////        new HttpParam("reg_num", prefs.getString("reg_num",null)),
////        new HttpParam("total", total.getText().toString()),
////        new HttpParam("hdl", hdl.getText().toString()),
////        new HttpParam("ldl", ldl.getText().toString()),
////        new HttpParam("mid", mid.getText().toString()),
////        new HttpParam("year", ""+dateSelected.get(Calendar.YEAR)),
////        new HttpParam("month", ""+(dateSelected.get(Calendar.MONTH)+1)),
////        new HttpParam("week", ""+dateSelected.get(Calendar.WEEK_OF_YEAR)),
////        new HttpParam("dayweek", ""+dateSelected.get(Calendar.DAY_OF_WEEK)),
////        new HttpParam("day", ""+dateSelected.get(Calendar.DATE)),
////        new HttpParam("datetime", datetime.getText().toString()));
////        CHOLESTEROL_ADD
//        
//        let sendDataDic = [
//            "reg_num":regNumString,
//            "total":total,
//            "hdl":hdl,
//            "ldl":ldl,
//            "mid":mid,
//            "year":year,
//            "month":month,
//            "week":week,
//            "dayweek":dayweek,
//            "day":day,
//            "datetime":dateTime,
//            ]
//        print("sendDataDic:\n\(sendDataDic)")
//        Server.getData(type: Server.InfoType.CHOLESTEROL_ADD, otherInfo: sendDataDic) { (kData : Data?) in
//            if let data = kData {
//                if let dataString : String = String(data: data, encoding: String.Encoding.utf8) {
//                    print("CHOLESTEROL_ADD:\(dataString)")
//                    self.endEditing(true)
//                    self.superCon?.segView.itemButtonPressed(button: (self.superCon?.segView.itemButtons[2])!)
//                    
//                    self.superCon?.dyslipidemiaListView.isHidden = false
//               
//                    
//                }
//            }
//        }
//    }
//    
//    func cancelButtonPressed(button: UIButton) {
//        self.superCon?.navigationController?.popViewController(animated: true)
//    }
//    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for touch in touches {
//            if !touch.view!.isKind(of: UITextField.self) {
//                self.endEditing(true)
//            }
//        }
//    }
//    
//    //MARK:UITextFieldDelegate
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        print("textFieldDidBeginEditing")
//        //핵심
//        let textFieldMaxY = sceneDel!.mainVC!.view.convert(textField.frame, from: textField.superview!).maxY
//        
//        let keyBoardHeight : CGFloat = (IS_IPHONE_X ? 377 : 216) + 44
//        let targetHeight = (SCREEN.HEIGHT - textFieldMaxY) - keyBoardHeight - 10
//        if targetHeight < 0 {
//            UIView.animate(withDuration: 0.3, animations: {
//                appDel.window?.frame.origin.y = targetHeight
//            }) { (fi:Bool) in
//                
//            }
//        }
//    }
//    
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        UIView.animate(withDuration: 0.3, animations: {
//            appDel.window?.frame.origin.y = 0
//        }) { (fi:Bool) in
//            
//        }
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//}
