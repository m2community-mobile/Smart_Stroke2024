//
//  ObesityNoteView.swift
//  KSR_2024
//
//  Created by m2comm on 2024/01/29.
//

import UIKit

class ObesityNoteView: UIScrollView
,UITextFieldDelegate
,CancelAndSaveButtonViewDelegate
{
    var superCon : ObesityViewController?

    var goalAndRateView : GoalAndRateView_1Value!
    
    var heightInputView : DataInputView!
    var weightInputView : DataInputView!
    var kindOfExerciseInputView : DataInputView!
    var exerciseTimeInputView : DataInputView!
    
    var bmiView : BMI_View!
    
    var today : Date!
    
    var simpleNoticeView2 : SimpleNoticeView!
    var cancelAndSaveBV : CancelAndSaveButtonView!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentSize.width = SCREEN.WIDTH
        self.backgroundColor = UIColor(red: 245/255, green: 246/255, blue: 249/255, alpha: 1)
        
        //
        goalAndRateView = GoalAndRateView_1Value()
        self.addSubview(goalAndRateView)
        
        goalAndRateView.goalView.notiLabelUpdate(text: "나의 BMI 목표 수치는?", image: #imageLiteral(resourceName: "profile"))
        goalAndRateView.goalView.valueLabelUpdate(valueString: "18.5 ~ 23", unitString: "")
        goalAndRateView.rateView.notiLabelUpdate(text: "목표 수치 달성율은?", image: #imageLiteral(resourceName: "stats"))
        
        self.today = Date()
        let timeView = TimeView()
        timeView.frame.origin.y = goalAndRateView.frame.maxY
        timeView.timeLabel.text = dateToStringWithFormat(formatString: "yyyy.MM.dd a h:mm", date: self.today)
        self.addSubview(timeView)
        
        let simpleNoticeView = SimpleNoticeView()
        simpleNoticeView.frame.origin.y = timeView.frame.maxY
        simpleNoticeView.noticeLabel.text = "키와 체중을 입력해주세요."
        self.addSubview(simpleNoticeView)
        
        heightInputView = DataInputView()
        heightInputView.frame.origin.y = simpleNoticeView.frame.maxY
        heightInputView.dataUpdate(noticeString: "키", placeholderString: "키를 입력해주세요", unitString: "cm")
        heightInputView.valueTextField.keyboardType = .numberPad
        heightInputView.valueTextField.delegate = self
        self.addSubview(heightInputView)
        
        weightInputView = DataInputView()
        weightInputView.frame.origin.y = heightInputView.frame.maxY
        weightInputView.dataUpdate(noticeString: "체중", placeholderString: "몸무게를 입력해주세요.", unitString: "kg")
        weightInputView.valueTextField.keyboardType = .numberPad
        weightInputView.valueTextField.delegate = self
        self.addSubview(weightInputView)
        
        //나의 BMI 확인하기
        let bmiCheckButtonBackView = UIView(frame: CGRect(x: 0, y: weightInputView.frame.maxY, width: SCREEN.WIDTH, height: 35 + 22 + 22))
        bmiCheckButtonBackView.backgroundColor = UIColor.white
        self.addSubview(bmiCheckButtonBackView)
        
        let bmiCheckButton = UIButton(frame: CGRect(x: 35, y: 22, width: SCREEN.WIDTH - (35 * 2), height: 35))
        bmiCheckButton.layer.borderColor = UIColor(red: 84/255, green: 153/255, blue: 244/255, alpha: 1).cgColor
        bmiCheckButton.layer.borderWidth = 0.5
        bmiCheckButton.setTitle("나의 BMI 확인하기", for: .normal)
        bmiCheckButton.setTitleColor(UIColor(red: 84/255, green: 153/255, blue: 244/255, alpha: 1), for: .normal)
        bmiCheckButton.titleLabel?.font = UIFont(name: Nanum_Barun_Gothic_OTF, size: 13)
        bmiCheckButtonBackView.addSubview(bmiCheckButton)
        
        //여기
        bmiView = BMI_View()
        bmiView.frame.origin.y = bmiCheckButtonBackView.frame.maxY
        bmiView.clipsToBounds = true
        let bmiViewHeight = bmiView.frame.size.height
        bmiView.frame.size.height = 0
        self.addSubview(bmiView)
        
        simpleNoticeView2 = SimpleNoticeView()
        simpleNoticeView2.frame.origin.y = bmiView.frame.maxY
        simpleNoticeView2.noticeLabel.text = "운동 시간을 입력해주세요."
        self.addSubview(simpleNoticeView2)
        
        kindOfExerciseInputView = DataInputView()
        kindOfExerciseInputView.frame.origin.y = simpleNoticeView2.frame.maxY
        kindOfExerciseInputView.dataUpdate(noticeString: "운동 종목", placeholderString: "운동종목을 선택해주세요", unitString: "")
        kindOfExerciseInputView.valueTextField.delegate = self
        self.addSubview(kindOfExerciseInputView)
        
        exerciseTimeInputView = DataInputView()
        exerciseTimeInputView.frame.origin.y = kindOfExerciseInputView.frame.maxY
        exerciseTimeInputView.dataUpdate(noticeString: "운동 시간", placeholderString: "운동 시간을 입력해주세요.", unitString: "분")
        exerciseTimeInputView.valueTextField.keyboardType = .numberPad
        exerciseTimeInputView.valueTextField.delegate = self
        self.addSubview(exerciseTimeInputView)
        
        cancelAndSaveBV = CancelAndSaveButtonView(type: .notFull)
        cancelAndSaveBV.frame.origin.y = exerciseTimeInputView.frame.maxY + 10
        cancelAndSaveBV.delegate = self
        self.addSubview(cancelAndSaveBV)
        
        self.contentSize.height = max(self.frame.size.height, cancelAndSaveBV.frame.maxY + 20)
        
        bmiCheckButton.addTarget(event: .touchUpInside) { (button) in
            
            self.endEditing(true)
            if let weightValue = self.weightInputView.valueTextField.text?.toCGFloat(), let heightValue = self.heightInputView.valueTextField.text?.toCGFloat()
            {
                if weightValue == 0 || heightValue == 0 {
                    toastShow(message: "키 혹은 몸무게를 확인해주세요.")
                    
                    
                    
                    return
                }
                
                UIView.animate(withDuration: 0.3, animations: {
                    self.bmiView.frame.size.height = bmiViewHeight
                    self.simpleNoticeView2.frame.origin.y = self.bmiView.frame.maxY
                    self.kindOfExerciseInputView.frame.origin.y = self.simpleNoticeView2.frame.maxY
                    self.exerciseTimeInputView.frame.origin.y = self.kindOfExerciseInputView.frame.maxY
                    self.cancelAndSaveBV.frame.origin.y = self.exerciseTimeInputView.frame.maxY + 10
                    self.contentSize.height = max(self.frame.size.height, self.cancelAndSaveBV.frame.maxY + 20)
                }, completion: { (fi) in
                    self.weightInputView.valueTextField.text = "\(Int(weightValue))"
                    self.heightInputView.valueTextField.text = "\(Int(heightValue))"
                    
                    let bmiValue = getBMI(weight: weightValue, height: heightValue)
                    self.bmiView.bmiValueUpdate(bmiValue: bmiValue)
                    
                })
            }else{
                toastShow(message: "키와 몸무게를 입력해주세요.")
                return
            }
        }
        
        defalueValueUpdate()
    }
    
    func defalueValueUpdate(){
        
        let weight = userD.string(forKey: "weight")
        let height = userD.string(forKey: "height")
        if weight == nil || height == nil {
//            guard let regNumString = userD.object(forKey: USER_KEY.KSR_REGISTRATION_NUMBER) as? String else {
//                toastShow(message: "reg_num is nil error")
//                return
//            }
            let regNumString = "SB-12500-1"
            
            Server.getData(type: Server.InfoType.USER_INFO, otherInfo: ["reg_num":regNumString]) { (kData : Data?) in
                if let data = kData {
                    print("skjalsdjksjdlsajdkl")
                    if let json = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) {
                        if let jsonDic = json as? [String:String]{
                            let heightString = jsonDic["ht"] ?? ""
                            userD.set(heightString, forKey: "height")
                            
                            let weightString = jsonDic["wt"] ?? ""
                            userD.set(weightString, forKey: "weight")
                            
                            userD.synchronize()
                            
                            DispatchQueue.main.async {
                                self.heightInputView.valueTextField.text = heightString
                                self.weightInputView.valueTextField.text = weightString
                            }

                        }
                    }
                }
            }
            
        }else{
            self.heightInputView.valueTextField.text = weight!
            self.weightInputView.valueTextField.text = height!
        }
        
//        self.heightInputView
//        self.weightInputView
    }
    
    func bmeViewinit(){
        self.bmiView.frame.size.height = 0
        self.simpleNoticeView2.frame.origin.y = self.bmiView.frame.maxY
        self.kindOfExerciseInputView.frame.origin.y = self.simpleNoticeView2.frame.maxY
        self.exerciseTimeInputView.frame.origin.y = self.kindOfExerciseInputView.frame.maxY
        self.cancelAndSaveBV.frame.origin.y = self.exerciseTimeInputView.frame.maxY + 10
        self.contentSize.height = max(self.frame.size.height, self.cancelAndSaveBV.frame.maxY + 20)
    }
    
    func saveButtonPressed(button: UIButton) {
        
//        var heightInputView : DataInputView!
//        var weightInputView : DataInputView!
//        var kindOfExerciseInputView : DataInputView!
//        var exerciseTimeInputView : DataInputView!
        
        if self.heightInputView.valueTextField.text == "" {
            toastShow(message: "키를 입력하세요.")
            return
        }
        if self.weightInputView.valueTextField.text == "" {
            toastShow(message: "체중를 입력하세요.")
            return
        }
        if self.kindOfExerciseInputView.valueTextField.text == "" {
            toastShow(message: "운동종목을 입력하세요.")
            return
        }
        if self.exerciseTimeInputView.valueTextField.text == "" {
            toastShow(message: "운동시간을 입력하세요.")
            return
        }
        
//        guard let regNumString = userD.object(forKey: USER_KEY.KSR_REGISTRATION_NUMBER) as? String else {
//            toastShow(message: "reg_num is nil error")
//            return
//        }
        let regNumString = "SB-12500-1"
        
        let height = self.heightInputView.valueTextField.text!
        let weight = self.weightInputView.valueTextField.text!
        
        let year = dateToStringWithFormat(formatString: "yyyy", date: self.today)
        let month = dateToStringWithFormat(formatString: "MM", date: self.today)
        let week = dateToStringWithFormat(formatString: "w", date: self.today)
        let dayweek = dateToStringWithFormat(formatString: "c", date: self.today)
        let day = dateToStringWithFormat(formatString: "dd", date: self.today)
        let dateTime = dateToStringWithFormat(formatString: "yyyy.MM.dd a h:mm", date: self.today)

        let heightValue = height.toCGFloat()!
        let weightValue = weight.toCGFloat()!
        
        let bmi = "\(getBMI(weight: weightValue, height: heightValue))"
        
        let gubun = self.kindOfExerciseInputView.valueTextField.text!
        let min = self.exerciseTimeInputView.valueTextField.text!
        
        
        //?/
//        new HttpParam("height", height.getText().toString()),
//        new HttpParam("weight", weight.getText().toString()),
//        new HttpParam("bmi", bmi),
//        new HttpParam("gubun", gubun.getText().toString()),
//        new HttpParam("min", min.getText().toString()),
//        new HttpParam("year", ""+dateSelected.get(Calendar.YEAR)),
//        new HttpParam("month", ""+(dateSelected.get(Calendar.MONTH)+1)),
//        new HttpParam("week", ""+dateSelected.get(Calendar.WEEK_OF_YEAR)),
//        new HttpParam("dayweek", ""+dateSelected.get(Calendar.DAY_OF_WEEK)),
//        new HttpParam("day", ""+dateSelected.get(Calendar.DATE)),
//        new HttpParam("datetime", datetime.getText().toString()));
        
        let sendDataDic = [
            "reg_num":regNumString,
            "height":height,
            "weight":weight,
            "bmi":bmi,
            "gubun":gubun,
            "min":min,
            "year":year,
            "month":month,
            "week":week,
            "dayweek":dayweek,
            "day":day,
            "datetime":dateTime,
            ]
        print("sendDataDic:\n\(sendDataDic)")
        Server.getData(type: Server.InfoType.BMI_ADD, otherInfo: sendDataDic) { (kData : Data?) in
            if let data = kData {
                if let dataString : String = String(data: data, encoding: String.Encoding.utf8) {
                    print("BMI_ADD:\(dataString)")
                    self.endEditing(true)
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
        print("textFieldDidBeginEditing")
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
    
    class BMI_View: UIView {
        
        convenience init() {
            self.init(frame: CGRect(x: 0, y: 0, width: SCREEN.WIDTH, height: 164))
        }
        
        var titleLabel : UILabel!
        var bmiMarkerView : UIView!
        var colorBackView : ColorBar!
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            self.backgroundColor = UIColor.white
            
            self.titleLabel = UILabel(frame: CGRect(x: 0, y: 12, width: SCREEN.WIDTH, height: 37))
            self.titleLabel.numberOfLines = 2
            self.addSubview(self.titleLabel)
            
            self.colorBackView = ColorBar(frame: CGRect(x: SCREEN.WIDTH * 25/320, y: self.titleLabel.frame.maxY + 56, width: SCREEN.WIDTH - (SCREEN.WIDTH * 50/320), height: 25))
            self.addSubview(self.colorBackView)
            
            self.bmiMarkerView = UIView(frame: CGRect(x: 0, y: 93.5, width: 16, height: 21.5))
            self.bmiMarkerView.backgroundColor = UIColor.clear
//                UIColor(red: 38/255, green: 56/255, blue: 88/255, alpha: 1)
            self.bmiMarkerView.center.x = 135
            self.addSubview(self.bmiMarkerView)
            
            let bmiMarkerImageView = UIImageView(image: #imageLiteral(resourceName: "bmi"))
            bmiMarkerImageView.frame = self.bmiMarkerView.bounds
            self.bmiMarkerView.addSubview(bmiMarkerImageView)
            
            self.frame.size.height = colorBackView.frame.maxY + 15
            
            //sample
//            Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { (timer) in
//                UIView.animate(withDuration: 0.3, animations: {
//                    self.bmiValueUpdate(bmiValue: random(min: 10, max: 24.9, underPoint: 1))
//                }, completion: { (fi ) in
//                })
//            }
            
            
        }
        
        func bmiValueUpdate( bmiValue : CGFloat) {
            let string1 = "BMI (체질량지수)는\n"
            let string2 = "\(bmiValue)"
            let string3 = "로 "
            let string4 : String
            
            let valueRatio : CGFloat
            let defaultX : CGFloat
            if bmiValue <= 18.5 {
                string4 = "저체중"
                valueRatio = (bmiValue / 18.5)
                defaultX = colorBackView.colorViews[0].frame.origin.x
            }else if bmiValue <= 22.9 {
                string4 = "정상"
                valueRatio = (bmiValue - 18.5) / (22.9 - 18.5)
                defaultX = colorBackView.colorViews[1].frame.origin.x
            }else if bmiValue <= 24.9 {
                string4 = "과체중"
                valueRatio = (bmiValue - 22.9) / (24.9 - 22.9)
                defaultX = colorBackView.colorViews[2].frame.origin.x
            }else{
                string4 = "비만"
                valueRatio = 0.5
                defaultX = colorBackView.colorViews[3].frame.origin.x
            }
            let string5 = "입니다."
            
            let markerX = self.colorBackView.frame.origin.x + defaultX + (colorBackView.colorViewWidth * valueRatio)
            self.bmiMarkerView.center.x = markerX
            
            
            
            
            
            
            let lightAttribute : [NSAttributedString.Key : NSObject] = [
                .font: UIFont(name: Nanum_Barun_Gothic_OTF, size: 13.0)!,
                .foregroundColor: UIColor(red: 59.0 / 255.0, green: 77.0 / 255.0, blue: 91.0 / 255.0, alpha: 1.0),
                .kern: -0.26 as NSObject,
                .paragraphStyle : centerParagraphStyle
            ]
            let redAttribute : [NSAttributedString.Key : NSObject] = [
                .font: UIFont(name: Nanum_Barun_Gothic_OTF_Bold, size: 19.0)!,
                .foregroundColor: UIColor(red: 211.0 / 255.0, green: 43.0 / 255.0, blue: 43.0 / 255.0, alpha: 1.0),
                .kern: -0.38 as NSObject,
                .paragraphStyle : centerParagraphStyle
            ]
            let blackBoldAttribute : [NSAttributedString.Key : NSObject] = [
                .font: UIFont(name: Nanum_Barun_Gothic_OTF_Bold, size: 19.0)!,
                .foregroundColor: UIColor(red: 59.0 / 255.0, green: 77.0 / 255.0, blue: 91.0 / 255.0, alpha: 1.0),
                .kern: -0.38 as NSObject,
                .paragraphStyle : centerParagraphStyle
            ]
            let stringInfos = [
                (string1,lightAttribute),
                (string2,redAttribute),
                (string3,blackBoldAttribute),
                (string4,redAttribute),
                (string5,blackBoldAttribute),
                ]
            as [(String,[NSAttributedString.Key:NSObject])]

            self.titleLabel.attributedText = getAttributedString(stringsInfos: stringInfos)
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        class ColorBar: UIView {
            
            var colorViews = [UIView]()
            var colorViewWidth : CGFloat = 0
            
            override init(frame: CGRect) {
                super.init(frame: frame)
                
                let colors = [
                    #colorLiteral(red: 0.4352941176, green: 1, blue: 0.8470588235, alpha: 1),#colorLiteral(red: 0.368627451, green: 0.6862745098, blue: 0.2705882353, alpha: 1),#colorLiteral(red: 0.8784313725, green: 0.5882352941, blue: 0.1294117647, alpha: 1),#colorLiteral(red: 0.8549019608, green: 0.1254901961, blue: 0.1529411765, alpha: 1),
                ]
                let titles = [
                "저체중","정상","과체중","비만"
                ]
                

                
                self.colorViewWidth = (self.frame.size.width - 30) / CGFloat(colors.count)
                for i in 0..<colors.count {
                    let colorView = UIView(frame: CGRect(x: CGFloat(i) * (self.colorViewWidth + 10), y: 3, width: self.colorViewWidth, height: 5))
                    colorView.backgroundColor = colors[i]
                    self.addSubview(colorView)
                    
                    self.colorViews.append(colorView)
                    
                    let titleView = UILabel(frame: CGRect(x: CGFloat(i) * (self.colorViewWidth + 10) , y: colorView.frame.maxY + 10, width: self.colorViewWidth, height: 10))
                    titleView.font = UIFont(name: Nanum_Barun_Gothic_OTF, size: 10)
                    titleView.textAlignment = .center
                    titleView.text = titles[i]
                    titleView.textColor = UIColor.black
                    self.addSubview(titleView)
                }
                
                
                
                let lineShapeLayer = CAShapeLayer()
                lineShapeLayer.lineCap = CAShapeLayerLineCap.butt
                lineShapeLayer.lineJoin = CAShapeLayerLineJoin.round
                lineShapeLayer.strokeColor = UIColor(white: 210/255, alpha: 1).cgColor
                lineShapeLayer.fillColor = UIColor.clear.cgColor
                lineShapeLayer.lineDashPattern = [1,1]
                self.layer.addSublayer(lineShapeLayer)
                
                let dotLinePath = UIBezierPath()
                for i in 0..<3{
                    dotLinePath.move(to: CGPoint(x: CGFloat(i + 1) * (self.colorViewWidth + 10) - 5, y: 0))
                    dotLinePath.addLine(to: CGPoint(x: CGFloat(i + 1) * (self.colorViewWidth + 10) - 5, y: 26.5))
                }
                lineShapeLayer.path = dotLinePath.cgPath
                
              
                
                let standardValues = [
                    "18.5","22.9","24.9"
                ]
                var lastY : CGFloat = 0
                for i in 0..<standardValues.count {
                    let standardValueLabel = UILabel(frame: CGRect(x: 0, y: 29.5, width: 30, height: 10))
                    standardValueLabel.center.x = CGFloat(i + 1) * (self.colorViewWidth + 10) - 5
                    standardValueLabel.text = standardValues[i]
                    standardValueLabel.textAlignment = .center
                    standardValueLabel.font = UIFont(name: Nanum_Barun_Gothic_OTF, size: 10)
                    standardValueLabel.textColor = UIColor(white: 85/255, alpha: 1)
                    lastY = standardValueLabel.frame.maxY
                    self.addSubview(standardValueLabel)
                }
                
                self.frame.size.height = lastY
                
                
                
            }
            
            required init?(coder aDecoder: NSCoder) {
                fatalError("init(coder:) has not been implemented")
            }
        }
    }
    
    

}
