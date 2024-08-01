//
//  BloodPressureListView.swift
//  KSR
//
//  Created by m2comm on 2018. 6. 26..
//  Copyright © 2018년 m2community. All rights reserved.
//

import UIKit


struct Test : Codable {
    var max : String
    var pulse : String
    var datetime : String
    var min : String
    var sid : String
}


class BloodPressureListView: UIView {
    
    var graphScrollView : GraphScrollView!
    var dataScrollView : DataView!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.graphScrollView = GraphScrollView(frame: self.bounds)
        self.graphScrollView.contentSize.width = SCREEN.WIDTH
        self.addSubview(self.graphScrollView)
        
        self.dataScrollView = DataView(frame: self.bounds)
        self.addSubview(self.dataScrollView)
        
        self.graphScrollView.isHidden = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    class GraphScrollView: UIScrollView
    ,WMY_ChangeViewDelegate
    {
        
        var goalView : InnerViewWith2Value!
        var rateView : InnerViewWith2Value!
        
        var graphView : KJG_GraphView!
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            let wmy_ChangeView = WMY_ChangeView()
            wmy_ChangeView.delegate = self
            self.addSubview(wmy_ChangeView)
            
            
            
            ////그래프
            graphView = KJG_GraphView(frame: CGRect(x: 15, y: wmy_ChangeView.frame.maxY, width: SCREEN.WIDTH - 30, height: 300),
                                          type: .line,
                                          numberOfGraph: 2)
            graphView.center.x = SCREEN.WIDTH / 2
            
//            self.graphView.layer.borderWidth = 1
//            graphView.layer.addBorder([.bottom, .left, .right, .top], color: #colorLiteral(red: 0.4871953726, green: 0.7789307833, blue: 0.8985077143, alpha: 1), width: 1)
            graphView.layer.addBorder([.bottom, .left, .right], color: #colorLiteral(red: 0.4871953726, green: 0.7789307833, blue: 0.8985077143, alpha: 1), width: 1)
            
            graphView.setYAxisStrings(yAxisStrings: ["140","120","100","80"])
            
            graphView.graphs[0].index = 0
            graphView.graphs[0].numberOfGraphs = 2
            graphView.graphs[0].setMax(maxValue: 80, minValue: 140)
        
            graphView.graphs[1].index = 1
            graphView.graphs[1].numberOfGraphs = 2
            graphView.graphs[1].setMax(maxValue: 80, minValue: 140)
            
            graphView.graphs[0].pointBorderColor = UIColor(red: 50/255, green: 124/255, blue: 222/255, alpha: 1)
            graphView.graphs[0].pathStrokeColor = UIColor(red: 50/255, green: 124/255, blue: 222/255, alpha: 1)
            
            graphView.graphs[1].pointBorderColor = UIColor(red: 245/255, green: 145/255, blue: 65/255, alpha: 1)
            graphView.graphs[1].pathStrokeColor = UIColor(red: 245/255, green: 145/255, blue: 65/255, alpha: 1)
            
            self.addSubview(graphView)
            
            print(UserDefaults.standard.string(forKey: "sh") ?? 0, "sdasdasdasd")
            
        var myValue = UserDefaults.standard.string(forKey: "sh") ?? ""
            
            var floatValue = CGFloat((myValue as NSString).floatValue)
            
            var reMyValue = UserDefaults.standard.string(forKey: "re") ?? ""
            
            var reFloatValue = CGFloat((reMyValue as NSString).floatValue)
            
            // 이 부분 수정해
            //이게 목표 수치 바꾸는 코드
            
            
            
            self.graphView.setRedLineValues(values: [floatValue, reFloatValue])
            // 이거 목표 수치 수정
            //그래프
          
            
            //10
            let valueInfoView = UIView(frame: CGRect(x: 15, y: graphView.frame.maxY - 10, width: SCREEN.WIDTH - 30, height: 20))
            valueInfoView.backgroundColor = UIColor.white
            
            
//            valueInfoView.layer.borderWidth = 1
            valueInfoView.layer.addBorder([.bottom, .left, .right], color: #colorLiteral(red: 0.4871953726, green: 0.7789307833, blue: 0.8985077143, alpha: 1), width: 1)
            
            self.addSubview(valueInfoView)
            
            let valueInfos : [(title : String, color : UIColor)] = [
                (title : "수축기", color : UIColor(red: 247/255, green: 128/255, blue: 0, alpha: 1)),
                (title : "이완기", color : UIColor(red: 84/255, green: 153/255, blue: 244/255, alpha: 1)),
                (title : "목표수치", color : UIColor(red: 211/255, green: 42/255, blue: 42/255, alpha: 1))
            ]
            
            var lastX : CGFloat = 0
            for i in 0..<valueInfos.count
            {
                let contentColor = valueInfos[i].color
                let circleView = UIView(frame: CGRect(x: 24, y: -10, width: 10, height: 10))
                if i != 0 { circleView.frame.origin.x = lastX + 15 }
                circleView.layer.cornerRadius = 5
                circleView.layer.borderColor = contentColor.cgColor
                circleView.layer.borderWidth = 1
                valueInfoView.addSubview(circleView)
                //수축기이완기목표수지
                let infoLabel = UILabel(frame: CGRect(x: circleView.frame.maxX + 4.5, y: -15, width: 50, height: 20))
            
                
                infoLabel.textColor = contentColor
                infoLabel.font = UIFont(name: Nanum_Barun_Gothic_OTF, size: 10)
                infoLabel.text = valueInfos[i].title
                var newSize = infoLabel.sizeThatFits(CGSize(width: SCREEN.WIDTH, height: 20))
                newSize.height = 20
                infoLabel.frame.size = newSize
                valueInfoView.addSubview(infoLabel)
                lastX = infoLabel.frame.maxX
            }
            
            let goalAndRateView = UIView(frame: CGRect(x: 0, y: valueInfoView.frame.maxY + 50, width: SCREEN.WIDTH, height: 87.5))
            self.addSubview(goalAndRateView)
            
            goalView = InnerViewWith2Value(frame: CGRect(x: 0, y: 0, width: SCREEN.WIDTH * 0.53, height: goalAndRateView.frame.size.height))
            goalView.backgroundColor = UIColor(red: 0.28, green: 0.67, blue: 0.94, alpha: 1)
//            goalAndRateView.addSubview(goalView)
//            goalView.notiLabelUpdate(text: "나의 혈압 목표 수치는?", image: #imageLiteral(resourceName: "profile"))
            
            rateView = InnerViewWith2Value(frame: CGRect(x: SCREEN.WIDTH * 0.53, y: 0, width: SCREEN.WIDTH * 0.47, height: goalView.frame.size.height))
            rateView.backgroundColor = UIColor(red: 0.28, green: 0.38, blue: 0.93, alpha: 1)
//            goalAndRateView.addSubview(rateView)
//            rateView.notiLabelUpdate(text: "목표 수치 달성율은?", image: #imageLiteral(resourceName: "stats"))
            
            goalAndRateView.frame.size.height = goalView.frame.size.height
            goalAndRateView.frame.origin.y = self.frame.size.height - goalAndRateView.frame.size.height
            
            self.dataUpdate(index: 1)
            
            
        }
        
        func selectButtonPressed(index: Int) {
            
            self.dataUpdate(index: index + 1)
        }
        
        func dataUpdate( index : Int ){
            
            
            if index > 3 || index <= 0{
                toastShow(message: "error")
                return
            }
            
            //x축
            var xValueStrings = [String]()
            var standardIndexString = ""
            if index == 1 {
                xValueStrings = ["일","월","화","수","목","금","토"]
                standardIndexString = "dayweek"
            }else if index == 2{
                for i in 0..<31 {
                    xValueStrings.append("\(i + 1)")
                }
                standardIndexString = "day"
            }else{
                for i in 0..<12 {
                    xValueStrings.append("\(i + 1)")
                }
                standardIndexString = "month"
            }
            
            graphView.setXAxisStrings(xAxisStrings: xValueStrings)
            
//            guard let regNumString = userD.object(forKey: USER_KEY.KSR_REGISTRATION_NUMBER) as? String else {
//                toastShow(message: "reg_num is nil error")
//                return
//            }
            
            
//            var formatter = DateFormatter()
//            formatter.dateFormat = "yyyy-MM-dd a HH:mm"
//            var current_date_string = formatter.string(from: Date())
//            print(current_date_string)
//            
//            var formatter_year = DateFormatter()
//            formatter_year.dateFormat = "yyyy"
//            var current_year_string = formatter_year.string(from: Date())
//            print(current_year_string)
//            
//            var formatter_month = DateFormatter()
//            formatter_month.dateFormat = "MM"
//            var formatter_month_string = formatter_month.string(from: Date())
//            print(formatter_month_string)
//            
//            var formatter_day = DateFormatter()
//            formatter_day.dateFormat = "dd"
//            var formatter_day_string = formatter_day.string(from: Date())
//            print(formatter_day_string)
//            
//            var formatter_dayWeek = DateFormatter()
//            formatter_dayWeek.dateFormat = "c"
//            var formatter_dayWeek_string = formatter_dayWeek.string(from: Date())
//            print(formatter_dayWeek_string)
//            
//            var formatter_week = DateFormatter()
//            formatter_week.dateFormat = "w"
//            var formatter_week_string = formatter_week.string(from: Date())
//            print(formatter_week_string)
//            
       
            
            
            let regNumString = "SB-12500-1"
            let sid = "\(UserDefaults.standard.object(forKey: "userSid") ?? 0)"
    
          
             
            
            let today = Date()
            let year = dateToStringWithFormat(formatString: "yyyy", date: today)
            let month = dateToStringWithFormat(formatString: "MM", date: today)
            let week = dateToStringWithFormat(formatString: "w", date: today)
            let day = dateToStringWithFormat(formatString: "dd", date: today)
            
            
//            let today = Date()
//            let year = current_year_string
//            let month = formatter_month_string
//            let week = formatter_week_string
//            let day = formatter_day_string
            
//            let sendDataDic = [
//                "tab":"\(index)",
//                "year":year,
//                "month":month,
//                "week":week,
//                "day":day,
////                "reg_num":regNumString
//                "user_sid":sid,
//                "reg_num":regNumString
//                ]
            
            let sendDataDic = [
                "tab":"\(index)",
                "year":year,
                "month":month,
                "week":week,
                "day":day,
                "user_sid":sid,
                "reg_num":regNumString
                ]
            
            Server.getData(type: Server.InfoType.BLOOD_GRAPH, otherInfo: sendDataDic) { (kData : Data?) in
                if let data = kData {
                    do {
                        if let jsonArray = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? [[String:String]] {
                            print("Server.InfoType.BLOOD_GRAPH:\n\(jsonArray)")
                        
                            
                            var graphValuesOfMin = [GraphData?]()
                            var graphValuesOfMax = [GraphData?]()
                            for _ in 0..<xValueStrings.count{
                                graphValuesOfMin.append(nil)
                                graphValuesOfMax.append(nil)
                            }
                            
                            
                            for i in 0..<jsonArray.count {
                                if let valueIndexString = jsonArray[i][standardIndexString]{
                                    if let valueIndex = Int(valueIndexString, radix: 10) {
                                        if let minValueString = jsonArray[i]["min"] {
                                            
                                            print("이거는 안나오니?\(minValueString)")
                                            if let minValueOfInt = Int(minValueString, radix: 10) {
                                                graphValuesOfMin[valueIndex - 1] = GraphData(value: CGFloat(minValueOfInt))
                                            }
                                        }
                                        if let maxValueString = jsonArray[i]["max"] {
                                            if let maxValueOfInt = Int(maxValueString, radix: 10) {
                                                graphValuesOfMax[valueIndex - 1] = GraphData(value: CGFloat(maxValueOfInt))
                                            }
                                        }
                                    }
                                }
                                
                            }
                            
                            
//                            [["day": "28", "month": "6", "val": "18.9", "dayweek": "5"]]
                            //
                            
                    
                            
//                            for _ in 0..<xValueStrings.count{
//                                graphValuesOfMin.append(nil)
//                            }
//                            //
//                            //
//                            var isAllNil = true
//                            for i in 0..<jsonArray.count {
//                                if let valueIndexString = jsonArray[i][standardIndexString]{
//                                    if let valueIndex = Int(valueIndexString, radix: 10) {
//                                        if let minValueString = jsonArray[i]["min"] {
//                                            if let minValue = minValueString.toCGFloat() {
//                                                print("minValue : \(minValue)")
//                                                isAllNil = false
//                                                graphValuesOfMin[valueIndex - 1] = GraphData(value: minValue)
//                                            }
//                                                                                   }
//                                                                                  
//                                        if let maxValueString = jsonArray[i]["max"] {
//                                            if let maxValue = maxValueString.toCGFloat() {
//                                                print("maxValue : \(maxValue)")
//                                                isAllNil = false
//                                                graphValuesOfMin[valueIndex - 1] = GraphData(value: maxValue)
//                                                
//                                            }
//                                        }
//                                    }
//                                }
//                            }
                            
//                            if isAllNil { return }
                            
                            print("graphValuesOfMin:\(graphValuesOfMin)")
                            
                            DispatchQueue.main.async {
                                self.graphView.graphs[0].valueUpdate(graphValues: graphValuesOfMin)
                                self.graphView.graphs[1].valueUpdate(graphValues: graphValuesOfMax)
                                self.graphView.layoutIfNeeded()
                                self.graphView.setNeedsLayout()
                                self.graphView.setNeedsLayout()
                            }
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            //?/
                            DispatchQueue.main.async {
                                self.graphView.graphs[0].valueUpdate(graphValues: graphValuesOfMin)
                                self.graphView.graphs[1].valueUpdate(graphValues: graphValuesOfMax)
                                self.graphView.layoutIfNeeded()
                                self.graphView.setNeedsLayout()
                                self.graphView.setNeedsLayout()
                                
                            }
                        }
                        
                    }catch {
                        print("error:\(error.localizedDescription)")
                    }
                }
            }
            
            
            
            self.graphView.setNeedsLayout()
            self.graphView.layoutIfNeeded()
            self.graphView.setNeedsDisplay()
            
            
            
            
//
//            var graphValues = [GraphData?]()
//            for _ in 0..<testValue {
//                let value = random(min: 80, max: 140, underPoint: 0)
//                graphValues.append(GraphData(value: value))
//            }
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    
    class DataView: UIView
    ,UITableViewDataSource, UITableViewDelegate, ContentsMainTextDelegate
    {
        func editButtonTapper(_ button: UIButton) {
            print("edit")
            
            NotificationCenter.default.addObserver(self, selector: #selector(testtesttest(notification:)), name: Notification.Name("editTest"), object: nil)
            
            NotificationCenter.default.post(name: NSNotification.Name("edit"), object: nil, userInfo: nil)
            
            let point = button.convert(CGPoint.zero, to: tableView)
            print("pointpoint:\(point)")
            guard let indexPath = tableView.indexPathForRow(at: point) else {return}
            print("-------------")
            
            
            print("indexPathindexPath1:\(indexPath)")
            print("\(dataArray[indexPath.section])")
            print("dataArraydataArray:\(dataArray)")
            print("-------------")
            
            
            
            
            
            print("indexPathindexPath2:\(indexPath)")
            tableView.reloadRows(at: [indexPath], with: .automatic)
            
            let dataDic = self.dataArray[indexPath.section]
            
            print("dataDicdataDic:\(dataDic)")
            
            
            var dataSid = dataDic["sid"]
            print("dataDicdataDic:\(dataSid)")
            let cell = tableView.dequeueReusableCell(withIdentifier: "Compnent3TableViewCell", for: indexPath) as! Compnent3TableViewCell
            
            
            
            
            
            
//            let dataDic = self.dataArray[indexPath.section]
//            print("dataArraydataArray:\(dataDic)")
//            
//            
//            UserDefaults.standard.setValue(dataDic["sid"], forKey: "dataDic")
//            
//            print("::::::\(UserDefaults.standard.object(forKey: "dataDic") ?? "")")
//            
//            if let array = dataDic["sid"] {
//                
//                
//                print("arrayarray:\(array)")
//                
//                UserDefaults.standard.setValue(array, forKey: "array")
//                
//                
//              
//                
////                let cell = tableView.dequeueReusableCell(withIdentifier: "Compnent3TableViewCell", for: indexPath) as! Compnent3TableViewCell
//             
//              
//                
//                
//                
////
//                
//            }
            
            
            
            
            
            
            
            
            
            
            
//            
//            print("dataArraydataArray:\(dataArray)")
//            print("dataArraydataArray:\(dataArray.count)")
//            print("dataArraydataArray:\(dataArray[0].keys)")
//            print("dataArraydataArray:\(dataArray[0].values)")
//            print("dataArraydataArray:\(dataArray[0].count)")
//            
            
            
//            let cell = tableView.dequeueReusableCell(withIdentifier: "Compnent3TableViewCell", for: indexPath) as! Compnent3TableViewCell
            
        }
        
        
        
        
        @objc func testtesttest(notification: Notification) {
            // notification.userInfo 값을 받아온다.
            
            
            
        }
        
        
        func categoryButtonTapped(_ button: UIButton) {
            
            //테이블뷰 특정 셀 좌표값
//            let rectOfCellInTableView = self.tableView.rectForRow(at: IndexPath(row: 5, section: 0)) //5번째 셀의 좌표 값
//            let rectOfCellInSuperview = self.tableView.convert(rectOfCellInTableView, to: self)
//
//
//            let viewPosition = CGPoint(x: rectOfCellInSuperview.origin.x, y: rectOfCellInSuperview.origin.y)
            
            
            
            // --ToDo--
            print("pointpoint:-----------")
            print("pointpoint:\(dataArray)")
            print("pointpoint:-----------")
            print("사용하고 싶은 기능들 추가1")
            
            
            let point = button.convert(CGPoint.zero, to: tableView)
            print("pointpoint:\(point)")
            guard let indexPath = tableView.indexPathForRow(at: point) else {return}
            print("pointpoint:\(indexPath)")
            print("pointpoint:\(indexPath.row)")
            print("pointpoint:\(indexPath.section)")
            print("pointpoint:\(dataArray[indexPath.row])")
            print("pointpoint:\(dataArray[indexPath.section])")
            
            
            
            
            
            
//            dataArray.remove(at: indexPath.section)
            
            
            let dataDic = self.dataArray[indexPath.section]
        print("dataDic:\(dataDic)")
            
            if let sid = dataDic["sid"] {
                Server.getData(type: Server.InfoType.BLOOD_DEL, otherInfo: ["sid":sid], completion: { (kData : Data?) in
                    if kData != nil {
                        self.dataUpdate()
                    }else{
                        toastShow(message: "통신이 원활하지 않습니다.\n잠시 후 다시 시도해주세요.")
                        
                        
                        
                    }
                })
            }
            
            
            
            
            
            
            tableView.reloadData()
            
            print("pointpoint:-----------")
            print("pointpoint:\(dataArray)")
            print("pointpoint:-----------")
            tableView.beginUpdates()
//            tableView.deleteRows(at: [indexPath], with: .automatic)
            
            
            tableView.endUpdates()
            
        }
        
//         func categoryButtonTapped(_ button: UIButton) {
//          let point = button.convert(CGPoint.zero, to: tableView) // 1
//          guard let indexPath = tableView.indexPathForRow(at: point) else { return } // 2
//             dataArray.remove(at: indexPath.row) // 3
//          tableView.deleteRows(at: [indexPath], with: .automatic) //4
//        }
        
        
        var goalView : InnerViewWith2Value!
        var rateView : InnerViewWith2Value!
        var tableView : UITableView!
        var dataArray = [[String:String]]()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            //                goal
            let goalAndRateView = UIView(frame: CGRect(x: 0, y: 0, width: SCREEN.WIDTH, height: 87.5))
            self.addSubview(goalAndRateView)
            
            goalView = InnerViewWith2Value(frame: CGRect(x: 0, y: 0, width: SCREEN.WIDTH * 0.53, height: goalAndRateView.frame.size.height))
            goalView.backgroundColor = UIColor(red: 0.28, green: 0.67, blue: 0.94, alpha: 1)
//            goalAndRateView.addSubview(goalView)
            goalView.notiLabelUpdate(text: "나의 혈압 목표 수치는?", image: #imageLiteral(resourceName: "profile"))
            
            rateView = InnerViewWith2Value(frame: CGRect(x: SCREEN.WIDTH * 0.53, y: 0, width: SCREEN.WIDTH * 0.47, height: goalView.frame.size.height))
            rateView.backgroundColor = UIColor(red: 0.28, green: 0.38, blue: 0.93, alpha: 1)
//            goalAndRateView.addSubview(rateView)
            rateView.notiLabelUpdate(text: "목표 수치 달성율은?", image: #imageLiteral(resourceName: "stats"))
            
            goalAndRateView.frame.size.height = goalView.frame.size.height
            
            //
//            let monthSeletView = UIView(frame: CGRect(x: 0, y: goalAndRateView.frame.maxY, width: SCREEN.WIDTH, height: 51))
//            self.addSubview(monthSeletView)
//
//            let leftButton = UIButton(frame: CGRect(x: 20, y: 0, width: 8, height: 14.5))
//            leftButton.setImage(#imageLiteral(resourceName: "icMonthLeft"), for: .normal)
//            leftButton.center.y = monthSeletView.frame.size.height / 2
//            monthSeletView.addSubview(leftButton)
//
//            let rightButton = UIButton(frame: CGRect(x: 0, y: 0, width: 8, height: 14.5))
//            rightButton.frame.origin.x = SCREEN.WIDTH - 14.5 - 20
//            rightButton.center.y = monthSeletView.frame.size.height / 2
//            rightButton.setImage(#imageLiteral(resourceName: "icMonthRight"), for: .normal)
//            monthSeletView.addSubview(rightButton)
//
//            let monthSeletTitleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: monthSeletView.frame.size.height))
//            monthSeletTitleLabel.font = UIFont(name: Nanum_Barun_Gothic_OTF, size: 18)
//            monthSeletTitleLabel.textColor = UIColor(red: 59/255, green: 77/255, blue: 91/255, alpha: 1)
//            monthSeletTitleLabel.center = CGPoint(x: monthSeletView.frame.size.width / 2, y: monthSeletView.frame.size.height / 2)
//            monthSeletTitleLabel.text = dateToStringWithFormat(formatString: "yyyy년 MM월", date: Date())
////            "2018년 5월"
//
//            monthSeletView.addSubview(monthSeletTitleLabel)
            
            //self.frame.size.height - goalAndRateView.frame.maxY
            tableView = UITableView(frame: CGRect(x: 0, y: goalAndRateView.frame.maxY - 30, width: SCREEN.WIDTH, height: self.frame.size.height - goalAndRateView.frame.maxY))
            tableView.register(DateHeaderView.self, forHeaderFooterViewReuseIdentifier: "DateHeaderView")
            tableView.register(Compnent3TableViewCell.self, forCellReuseIdentifier: "Compnent3TableViewCell")
            tableView.backgroundColor = #colorLiteral(red: 0.9450935721, green: 0.9524920583, blue: 0.9736705422, alpha: 1)
            tableView.delegate = self
            tableView.dataSource = self
            tableView.separatorStyle = .none
//            tableView.backgroundColor = .white
            self.addSubview(tableView)
         
            self.tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 44, right: 0);
            
            self.dataUpdate()
            
        }
        
        func dataUpdate() {
//            guard let regNumString = userD.object(forKey: USER_KEY.KSR_REGISTRATION_NUMBER) as? String else {
//                toastShow(message: "reg_num is nil error")
//                return
//                
//                
//            }
            let regNumString = "SB-12500-1"
            let sid = "\(UserDefaults.standard.object(forKey: "userSid") ?? 0)"
            Server.getData(type: Server.InfoType.BLOOD_DATA_ALL, otherInfo: ["user_sid":sid]) { (kData : Data?) in
                if let data = kData {
                    do {
                        if let jsonArray = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? [[String:String]] {
                            print("jsonArray:\n\(jsonArray)")
                            self.dataArray = jsonArray
                            print("업로드 해주세요")
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                            }
                            
                        }
                    }catch {
                        print("error:\(error.localizedDescription)")
                        
                    }
                }
            }
            
        }
        
        
        //MARK:tableViewDelegate
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Compnent3TableViewCell", for: indexPath) as! Compnent3TableViewCell
            
            let dataDic = self.dataArray[indexPath.section]
            cell.redButton.isHidden = true
            cell.editButton.isHidden = true
            
            cell.cellDelegate = self
            
            cell.cellComponentViews[0].notiLabel.text = "수축기압"
            cell.cellComponentViews[0].valueLabel.text = "\(dataDic["max"] ?? "")mmHg"
            cell.cellComponentViews[0].valueLabel.font = UIFont(name: "SUITE-Bold", size: 21)
            
            if IS_IPHONE_N {
                cell.cellComponentViews[0].valueLabel.font = UIFont(name: "SUITE-Bold", size: 18)
            }
            
            if IS_IPHONE_X {
                cell.cellComponentViews[0].valueLabel.font = UIFont(name: "SUITE-Bold", size: 18)
            }
            
            cell.cellComponentViews[1].notiLabel.text = "이완기압"
            cell.cellComponentViews[1].valueLabel.text = "\(dataDic["min"] ?? "")mmHg"
            cell.cellComponentViews[1].valueLabel.font = UIFont(name: "SUITE-Bold", size: 21)
            
            if IS_IPHONE_N {
                cell.cellComponentViews[1].valueLabel.font = UIFont(name: "SUITE-Bold", size: 18)
            }
            
            if IS_IPHONE_X {
                cell.cellComponentViews[1].valueLabel.font = UIFont(name: "SUITE-Bold", size: 18)
            }
            
            cell.cellComponentViews[2].notiLabel.text = "맥박"
            cell.cellComponentViews[2].valueLabel.text = "\(dataDic["pulse"] ?? "")회/분"
            cell.cellComponentViews[2].valueLabel.font = UIFont(name: "SUITE-Bold", size: 21)
            
            if IS_IPHONE_N {
                cell.cellComponentViews[2].valueLabel.font = UIFont(name: "SUITE-Bold", size: 18)
            }
            
            if IS_IPHONE_X {
                cell.cellComponentViews[2].valueLabel.font = UIFont(name: "SUITE-Bold", size: 18)
            }
            
            return cell
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }
        
        func numberOfSections(in tableView: UITableView) -> Int {
            return self.dataArray.count
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//            return Compnent3TableViewCell.cellHeight
            return 90
        }
        
        func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "DateHeaderView") as! DateHeaderView
            
            let dataDic = self.dataArray[section]
            
            headerView.dateLabel.text = dataDic["datetime"] ?? ""
            
            return headerView
        }
        
        func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return DateHeaderView.height
        }
        
        func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
            return true
        }
        
        
        
////         when click cell, show and hide deleted button
//        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//            if let cell = tableView.cellForRow(at: indexPath) as? Compnent3TableViewCell {
//                print("click cell")
//                cell.showButton(show: true)
//            }
//        }
//        
//        func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//            if let cell = tableView.cellForRow(at: indexPath) as? Compnent3TableViewCell {
//                
//                print("cancel click cell")
//                cell.showButton(show: false)
//            }
//        }
//        
        
        
        
        
        
        
        
        
        
        
        
        
        
//        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//             tableView.deselectRow(at: indexPath, animated: true)
//             print("Click Cell Number:" + String(indexPath.row))
//            print("Click Cell Number:" + String(indexPath.section))
//            
//            
//            
//            
//            
//            
//            
//            if let cell = tableView.cellForRow(at: indexPath) as? Compnent3TableViewCell {
////                       cell.showButton(show: true)
//                
////                cell.redButton.isHidden = false
////                tableView.deselectRow(at: indexPath, animated: true)
//                
//                
//                var isChecked = true
//                isChecked = !isChecked
//                if isChecked {
//                    cell.redButton.isHidden = true
//                                
//                            } else {
//                                cell.redButton.isHidden = false
//                                
//                            }
//                
//                   }
//            
//            
//            
//         }
        
        
        
        
//        func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//              if let cell = tableView.cellForRow(at: indexPath) as? Compnent3TableViewCell {
////                  cell.showButton(show: false)
//                  cell.redButton.isHidden = true
//                  cell.redButton.frame.size.height = 0
//                  cell.redButton.alpha = 0
//              }
//          }
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
//        func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//          let askAction = UIContextualAction(style: .normal, title: nil) { action, view, complete in
//            print("Ask!")
//            complete(true)
//          }
//
//          // here set your image and background color
//          askAction.image = UIImage(named: "trash")
//          askAction.backgroundColor = .red
//
//          let blockAction = UIContextualAction(style: .destructive, title: "삭제") { action, view, complete in
//            print("Block")
//            complete(true)
//          }
//
//          return UISwipeActionsConfiguration(actions: [blockAction, askAction])
//        }
//
//        func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//          cell.textLabel?.text = "row: \(indexPath.row)"
//        }
        
        
        func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
            
            print("\(UIImage(named: ""))")
            
            
            let delete = UITableViewRowAction(style: UITableViewRowAction.Style.default, title: "🗑️삭제") { (action ,indexPath) in
//            let delete = UITableViewRowAction(style: UITableViewRowAction.Style.default, title: "삭제") { (action ,indexPath) in
                
                
                
                
                
                let dataDic = self.dataArray[indexPath.section]
                if let sid = dataDic["sid"] {
                    Server.getData(type: Server.InfoType.BLOOD_DEL, otherInfo: ["sid":sid], completion: { (kData : Data?) in
                        if kData != nil {
                            self.dataUpdate()
                        }else{
                            toastShow(message: "통신이 원활하지 않습니다.\n잠시 후 다시 시도해주세요.")
                        }
                    })
                }
            }
            (UIButton.appearance(whenContainedInInstancesOf: [UIView.self])).setImage(UIImage(named: "trash"), for: .normal)
            
            
            
            let delete2 = UITableViewRowAction(style: UITableViewRowAction.Style.default, title: "") { (action ,indexPath) in
//                delete2.image = UIImage(named: "trash")
            }
            
            
            
//            delete.backgroundColor = UIColor(patternImage: UIImage(named: "delete_background")!)
//
//            delete.backgroundColor = .red
//            delete.image = #imageLiteral(resourceName: "pwImage")
//            var img: UIImage = UIImage(named: "trash")!
//            var imgSize: CGSize = tableView.frame.size
//            UIGraphicsBeginImageContext(imgSize)
//            img.draw(in: CGRectMake(20, 20, 20, 20))
//            
//            var newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
//            UIGraphicsEndImageContext()
////            remove.backgroundColor = UIColor(patternImage: newImage)
//
//            delete.backgroundColor = UIColor(patternImage: newImage)
            return [delete, delete2]
            
        }
        
        
        
        
        
        
        
        
        
        
        
//        func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//
//            let hide = UIContextualAction(style: .normal, title: "숨김") { (action, view, completionHandler) in
//                completionHandler(true)
//            }
//
//            // weak self : 클로져 내부에서 self 를 사용할 때 strong reference cycle 예방
//            let delete = UIContextualAction(style: .normal, title: "차단") { [weak self] action, view, completionHandler in
//
//                
////                delete.image = UIImage(named: "trash")
//                
//                let dataDic = self!.dataArray[indexPath.section]
//                if let sid = dataDic["sid"] {
//                    Server.getData(type: Server.InfoType.BLOOD_DEL, otherInfo: ["sid":sid], completion: { (kData : Data?) in
//                        if kData != nil {
//                            self!.dataUpdate()
//                        }else{
//                            toastShow(message: "통신이 원활하지 않습니다.\n잠시 후 다시 시도해주세요.")
//                        }
//                    })
//                }
//                
//                
//            }
//
//            hide.backgroundColor = .gray
//            delete.backgroundColor = .orange
//
//            let config = UISwipeActionsConfiguration(actions: [delete, hide])
//            return config
//        }
        
        
        
        
        func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
                
                
                let deleted = UIContextualAction(style: .normal, title: "삭제") { (UIContextualAction, UIView, success: @escaping (Bool) -> Void) in
                    
                    
                    let dataDic = self.dataArray[indexPath.section]
                    if let sid = dataDic["sid"] {
                        Server.getData(type: Server.InfoType.BLOOD_DEL, otherInfo: ["sid":sid], completion: { (kData : Data?) in
                            if kData != nil {
                                self.dataUpdate()
                            }else{
                                toastShow(message: "통신이 원활하지 않습니다.\n잠시 후 다시 시도해주세요.")
                            }
                        })
                    }
                    
                    success(true)
                }
            
            
            
            deleted.backgroundColor = .systemPink
            deleted.backgroundColor = .red
            deleted.image = UIImage(systemName: "trash")
            
            
            
            
            let deleted2 = UIContextualAction(style: .normal, title: "") { (UIContextualAction, UIView, success: @escaping (Bool) -> Void) in
                
                
                let dataDic = self.dataArray[indexPath.section]
                if let sid = dataDic["sid"] {
                    Server.getData(type: Server.InfoType.BLOOD_DEL, otherInfo: ["sid":sid], completion: { (kData : Data?) in
                        if kData != nil {
                            self.dataUpdate()
                        }else{
                            toastShow(message: "통신이 원활하지 않습니다.\n잠시 후 다시 시도해주세요.")
                        }
                    })
                }
                
                success(true)
            }
            
            deleted2.backgroundColor = .red
//            deleted2.image = UIImage(systemName: "trash")
                
//                let share = UIContextualAction(style: .normal, title: "Share") { (UIContextualAction, UIView, success: @escaping (Bool) -> Void) in
//                    
//                    success(true)
//                }
//                share.backgroundColor = .systemTeal
                
                //actions배열 인덱스 0이 왼쪽에 붙어서 나옴
                return UISwipeActionsConfiguration(actions:[deleted, deleted2])
//            return UISwipeActionsConfiguration(actions:[deleted])
                
            }
        
 
        
        
        
        
        
        
        
        
//        func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//               let action = UIContextualAction(style: .normal, title: nil) { (action, view, completion) in
//                       tableView.deleteRows(at: [indexPath], with: .automatic)
//                    completion(true)
//                }
//                
//                action.backgroundColor = .red
//                action.image = #imageLiteral(resourceName: "pwImage")
//
//                let configuration = UISwipeActionsConfiguration(actions: [action])
//                configuration.performsFirstActionWithFullSwipe = false
//                return configuration
//           }
        
//        @available(iOS 11.0, *)
//        func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//            let deleteAction = UIContextualAction(style: .normal, title: "삭제", handler: {a,b,c in
//
//
//                let dataDic = self.dataArray[indexPath.section]
//                if let sid = dataDic["sid"] {
//                    Server.getData(type: Server.InfoType.BLOOD_DEL, otherInfo: ["sid":sid], completion: { (kData : Data?) in
//                        if kData != nil {
//                            self.dataUpdate()
//                        }else{
//                            toastShow(message: "통신이 원활하지 않습니다.\n잠시 후 다시 시도해주세요.")
//                        }
//                    })
//                }
//
//
//                // example of your delete function
////                self.YourArray.remove(at: indexPath.row)
//                tableView.deleteRows(at: [indexPath], with: .automatic)
//            })
//            let deleteAction2 = UIContextualAction(style: .normal, title: "", handler: {a,b,c in
//                
//                // example of your delete function
////                self.YourArray.remove(at: indexPath.row)
//                tableView.deleteRows(at: [indexPath], with: .automatic)
//            })
//            
////            deleteAction.image = UIImage(named: "trash")
//            deleteAction.backgroundColor = .red
//            
//            
//            deleteAction2.image = UIImage(named: "trash")
//            
//            
//            
//            
//            deleteAction2.backgroundColor = .red
//            return UISwipeActionsConfiguration(actions: [deleteAction, deleteAction2])
//        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
}


