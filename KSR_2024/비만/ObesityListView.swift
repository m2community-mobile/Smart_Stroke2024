//
//  ObesityListView.swift
//  KSR_2024
//
//  Created by m2comm on 2024/01/29.
//

import UIKit

class ObesityListView: UIView {
        
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
            
            var goalView : InnerViewWith1Value!
            var rateView : InnerViewWith1Value!
            
            var graphView : KJG_GraphView!
            
            override init(frame: CGRect) {
                super.init(frame: frame)
                
                let wmy_ChangeView = WMY_ChangeView()
                wmy_ChangeView.delegate = self
                self.addSubview(wmy_ChangeView)
                
                ////그래프
                graphView = KJG_GraphView(frame: CGRect(x: 0, y: wmy_ChangeView.frame.maxY, width: SCREEN.WIDTH - 10, height: 200),
                                          type: .line,
                                          numberOfGraph: 1)
                graphView.center.x = SCREEN.WIDTH / 2
                
                graphView.setYAxisStrings(yAxisStrings: ["45","36","27","18"])
                
                graphView.graphs[0].index = 0
                graphView.graphs[0].numberOfGraphs = 1
                graphView.graphs[0].setMax(maxValue: 18, minValue: 45)
                
                graphView.graphs[0].pointBorderColor = UIColor(red: 247/255, green: 128/255, blue: 0, alpha: 1)
                graphView.graphs[0].pathStrokeColor = UIColor(red: 247/255, green: 128/255, blue: 0, alpha: 1)
                
                self.addSubview(graphView)
                
                var redLineValues = [CGFloat]()
                for i in 185..<230{
                    redLineValues.append(CGFloat(i) / 10)
                }
//                self.graphView.setRedLineValues(values: [23,18.5])
                self.graphView.setRedLineValues(values: redLineValues)
                //그래프
                
                //10
                let valueInfoView = UIView(frame: CGRect(x: 0, y: graphView.frame.maxY + 20, width: SCREEN.WIDTH, height: 10))
                valueInfoView.backgroundColor = UIColor.white
                self.addSubview(valueInfoView)
                
                let valueInfos : [(title : String, color : UIColor)] = [
                    (title : "BMI", color : UIColor(red: 247/255, green: 128/255, blue: 0, alpha: 1)),
                    (title : "목표수치", color : UIColor(red: 211/255, green: 42/255, blue: 42/255, alpha: 1))
                ]
                
                var lastX : CGFloat = 0
                for i in 0..<valueInfos.count
                {
                    let contentColor = valueInfos[i].color
                    let circleView = UIView(frame: CGRect(x: 24, y: 0, width: 10, height: 10))
                    if i != 0 { circleView.frame.origin.x = lastX + 15 }
                    if i == 0 {
                    circleView.layer.cornerRadius = 5
                    }else{
                    circleView.backgroundColor = contentColor
                    }
                    circleView.layer.borderColor = contentColor.cgColor
                    circleView.layer.borderWidth = 1
                    valueInfoView.addSubview(circleView)
                    
                    let infoLabel = UILabel(frame: CGRect(x: circleView.frame.maxX + 4.5, y: 0, width: 50, height: 10))
                    infoLabel.textColor = contentColor
                    infoLabel.font = UIFont(name: Nanum_Barun_Gothic_OTF, size: 10)
                    infoLabel.text = valueInfos[i].title
                    var newSize = infoLabel.sizeThatFits(CGSize(width: SCREEN.WIDTH, height: 10))
                    newSize.height = 10
                    infoLabel.frame.size = newSize
                    valueInfoView.addSubview(infoLabel)
                    lastX = infoLabel.frame.maxX
                }
                
                let goalAndRateView = UIView(frame: CGRect(x: 0, y: valueInfoView.frame.maxY + 50, width: SCREEN.WIDTH, height: 87.5))
//                self.addSubview(goalAndRateView)
                
                goalView = InnerViewWith1Value(frame: CGRect(x: 0, y: 0, width: SCREEN.WIDTH * 0.53, height: goalAndRateView.frame.size.height))
                goalView.backgroundColor = UIColor(red: 0.28, green: 0.67, blue: 0.94, alpha: 1)
                goalAndRateView.addSubview(goalView)
                goalView.notiLabelUpdate(text: "나의 BMI 목표 수치는?", image: #imageLiteral(resourceName: "profile"))
                goalView.valueLabelUpdate(valueString: "18.5 ~ 23", unitString: "")
                
                rateView = InnerViewWith1Value(frame: CGRect(x: SCREEN.WIDTH * 0.53, y: 0, width: SCREEN.WIDTH * 0.47, height: goalView.frame.size.height))
                rateView.backgroundColor = UIColor(red: 0.28, green: 0.38, blue: 0.93, alpha: 1)
                goalAndRateView.addSubview(rateView)
                rateView.notiLabelUpdate(text: "목표 수치 달성율은?", image: #imageLiteral(resourceName: "stats"))
                
                goalAndRateView.frame.size.height = goalView.frame.size.height
                goalAndRateView.frame.origin.y = self.frame.size.height - goalAndRateView.frame.size.height
                
//                self.dataUpdate(index: 1)
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
                
//                guard let regNumString = userD.object(forKey: USER_KEY.KSR_REGISTRATION_NUMBER) as? String else {
//                    toastShow(message: "reg_num is nil error")
//                    return
//                }
                let regNumString = "SB-12500-1"
                
                let today = Date()
                let year = dateToStringWithFormat(formatString: "yyyy", date: today)
                let month = dateToStringWithFormat(formatString: "MM", date: today)
                let week = dateToStringWithFormat(formatString: "w", date: today)
                let day = dateToStringWithFormat(formatString: "dd", date: today)
                
                let sendDataDic = [
                    "tab":"\(index)",
                    "year":year,
                    "month":month,
                    "week":week,
                    "day":day,
                    "reg_num":regNumString
                ]
                
                Server.getData(type: Server.InfoType.BMI_GRAPH, otherInfo: sendDataDic) { (kData : Data?) in
                    if let data = kData {
                        do {
                            if let jsonArray = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? [[String:String]] {
                                print("BMI_GRAPH:\n\(jsonArray)")
//                                [["height": "151", "weight": "102", "month": "7", "bmi": "53.3265766261999", "day": "4", "dayweek": "4"]]

                                var graphValuesOfMin = [GraphData?]()
                                for _ in 0..<xValueStrings.count{
                                    graphValuesOfMin.append(nil)
                                }
//
//
                                var isAllNil = true
                                for i in 0..<jsonArray.count {
                                    if let valueIndexString = jsonArray[i][standardIndexString]{
                                        if let valueIndex = Int(valueIndexString, radix: 10) {
                                            if let minValueString = jsonArray[i]["bmi"] {
                                                if let minValue = minValueString.toCGFloat() {
                                                    print("minValue : \(minValue)")
                                                    isAllNil = false
                                                    graphValuesOfMin[valueIndex - 1] = GraphData(value: minValue)
                                                }
                                            }
                                        }
                                    }
                                }
                                
                                if isAllNil { return }
                                print("graphValuesOfMin:\(graphValuesOfMin)")

                                DispatchQueue.main.async {
                                    self.graphView.graphs[0].valueUpdate(graphValues: graphValuesOfMin)

                                }
                            }
                            
                        }catch {
                            print("error:\(error.localizedDescription)")
                        }
                    }
                }
                
                
                
                
                
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
        
        class DataView: UIScrollView
            ,UITableViewDataSource, UITableViewDelegate
        {
            
            var goalView : InnerViewWith1Value!
            var rateView : InnerViewWith1Value!
            var tableView : UITableView!
            var dataArray = [[String:String]]()
            
            override init(frame: CGRect) {
                super.init(frame: frame)
                
                //                goal
                let goalAndRateView = UIView(frame: CGRect(x: 0, y: 0, width: SCREEN.WIDTH, height: 87.5))
//                self.addSubview(goalAndRateView)
                
                goalView = InnerViewWith1Value(frame: CGRect(x: 0, y: 0, width: SCREEN.WIDTH * 0.53, height: goalAndRateView.frame.size.height))
                goalView.backgroundColor = UIColor(red: 0.28, green: 0.67, blue: 0.94, alpha: 1)
                goalAndRateView.addSubview(goalView)
                goalView.notiLabelUpdate(text: "나의 BMI 목표 수치는?", image: #imageLiteral(resourceName: "profile"))
                goalView.valueLabelUpdate(valueString: "18.5 ~ 23", unitString: "")
                
                
                rateView = InnerViewWith1Value(frame: CGRect(x: SCREEN.WIDTH * 0.53, y: 0, width: SCREEN.WIDTH * 0.47, height: goalView.frame.size.height))
                rateView.backgroundColor = UIColor(red: 0.28, green: 0.38, blue: 0.93, alpha: 1)
                goalAndRateView.addSubview(rateView)
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
                
                //
                tableView = UITableView(frame: CGRect(x: 0, y: goalAndRateView.frame.maxY, width: SCREEN.WIDTH, height: self.frame.size.height - goalAndRateView.frame.maxY))
                tableView.register(DateHeaderView.self, forHeaderFooterViewReuseIdentifier: "DateHeaderView")
                tableView.register(Compnent5TableViewCell.self, forCellReuseIdentifier: "Compnent5TableViewCell")
                tableView.delegate = self
                tableView.dataSource = self
                tableView.separatorStyle = .none
                self.addSubview(tableView)
                
                self.dataUpdate()
            }
            
            func dataUpdate() {
//                guard let regNumString = userD.object(forKey: USER_KEY.KSR_REGISTRATION_NUMBER) as? String else {
//                    toastShow(message: "reg_num is nil error")
//                    return
//                }
                
                let regNumString = "SB-12500-1"
                let sid = "\(UserDefaults.standard.object(forKey: "sid") ?? 0)"
                Server.getData(type: Server.InfoType.BMI_DATA_ALL, otherInfo: ["user_sid":sid]) { (kData : Data?) in
                    if let data = kData {
                        do {
                            if let jsonArray = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? [[String:String]] {
                                print("BMI_DATA_ALL:\n\(jsonArray)")
                                self.dataArray = jsonArray
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
                let cell = tableView.dequeueReusableCell(withIdentifier: "Compnent5TableViewCell", for: indexPath) as! Compnent5TableViewCell
                
                let dataDic = self.dataArray[indexPath.section]
                //["gubun": "huff", "height": "123", "bmi": "81.9617952277084", "min": "123", "weight": "124", "sid": "7", "datetime": "2018.07.04 오후 4:11"]
                cell.cellComponentViews[0].notiLabel.text = "키"
                cell.cellComponentViews[0].valueLabel.text = "\(dataDic["height"] ?? "")cm"
                
                cell.cellComponentViews[1].notiLabel.text = "체중"
                cell.cellComponentViews[1].valueLabel.text = "\(dataDic["weight"] ?? "")kg"
                
                cell.cellComponentViews[2].notiLabel.text = "BMI"
                cell.cellComponentViews[2].valueLabel.text = "\(dataDic["bmi"] ?? "")"
                
                cell.cellComponentViews[3].notiLabel.text = "운동종목"
                cell.cellComponentViews[3].valueLabel.text = "\(dataDic["gubun"] ?? "")"
                
                cell.cellComponentViews[4].notiLabel.text = "운동 시간"
                cell.cellComponentViews[4].valueLabel.text = "\(dataDic["min"] ?? "")분"
                
                return cell
            }
            
            func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                return 1
            }
            
            func numberOfSections(in tableView: UITableView) -> Int {
                return self.dataArray.count
            }
            
            func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
                return Compnent5TableViewCell.cellHeight
            }
            
            func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
                let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "DateHeaderView") as! DateHeaderView
                
                let dataDic = self.dataArray[section]
                //["gubun": "huff", "height": "123", "bmi": "81.9617952277084", "min": "123", "weight": "124", "sid": "7", "datetime": "2018.07.04 오후 4:11"]

                headerView.dateLabel.text = dataDic["datetime"] ?? ""
                
                return headerView
            }
            
            func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
                return DateHeaderView.height
            }
            
            func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
                return true
            }
            
            func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
                
                let delete = UITableViewRowAction(style: UITableViewRowAction.Style.default, title: "삭제") { (action ,indexPath) in
                    let dataDic = self.dataArray[indexPath.section]
                    print("delete DataDic : \(dataDic)")
                    if let sid = dataDic["sid"] {
                        Server.getData(type: Server.InfoType.BMI_DEL, otherInfo: ["sid":sid], completion: { (kData : Data?) in
                            if kData != nil {
                                self.dataUpdate()
                            }else{
                                toastShow(message: "통신이 원활하지 않습니다.\n잠시 후 다시 시도해주세요.")
                            }
                        })
                    }
                }
                return [delete]
            }
            
            required init?(coder aDecoder: NSCoder) {
                fatalError("init(coder:) has not been implemented")
            }
        }
}
