//
//  DyslipidemiaListView.swift
//  KSR
//
//  Created by m2comm on 2018. 6. 28..
//  Copyright © 2018년 m2community. All rights reserved.
//

//import UIKit
//
//class DyslipidemiaListView: UIScrollView {
//    
//    var graphScrollView : GraphScrollView!
//    var dataScrollView : DataView!
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        
//        
//        self.graphScrollView = GraphScrollView(frame: self.bounds)
//        self.graphScrollView.contentSize.width = SCREEN.WIDTH
//        self.addSubview(self.graphScrollView)
//        
//        self.dataScrollView = DataView(frame: self.bounds)
//        self.addSubview(self.dataScrollView)
//        
//        self.graphScrollView.isHidden = true
//        
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    class GraphScrollView: UIScrollView
//        ,WMY_ChangeViewDelegate
//    {
//        
//        var goalView : InnerViewWith1Value!
//        var rateView : InnerViewWith1Value!
//        
//        var graphView : KJG_GraphView!
//        
//        override init(frame: CGRect) {
//            super.init(frame: frame)
//            
//            ////그래프
//            graphView = KJG_GraphView(frame: CGRect(x: 0, y: 0, width: SCREEN.WIDTH - 10, height: 200),
//                                      type: .bar,
//                                      numberOfGraph: 1)
//            graphView.center.x = SCREEN.WIDTH / 2
//            
//            graphView.setYAxisStrings(yAxisStrings: ["110","90","70","50"])
//            
//            graphView.graphs[0].index = 0
//            graphView.graphs[0].numberOfGraphs = 1
//            graphView.graphs[0].setMax(maxValue: 50, minValue: 110)
//            
//            graphView.graphs[0].pointBorderColor = UIColor(red: 247/255, green: 128/255, blue: 0, alpha: 1)
//            graphView.graphs[0].pathStrokeColor = UIColor(red: 247/255, green: 128/255, blue: 0, alpha: 1)
//            
//            self.addSubview(graphView)
//            
//            self.graphView.setRedLineValues(values: [70])
//
//            //그래프
//            
//            //10
//            let valueInfoView = UIView(frame: CGRect(x: 0, y: graphView.frame.maxY + 20, width: SCREEN.WIDTH, height: 10))
//            valueInfoView.backgroundColor = UIColor.white
//            self.addSubview(valueInfoView)
//            
//            let valueInfos : [(title : String, color : UIColor)] = [
////                (title : "BMI", color : UIColor(red: 247/255, green: 128/255, blue: 0, alpha: 1)),
//                (title : "목표수치", color : UIColor(red: 211/255, green: 42/255, blue: 42/255, alpha: 1))
//            ]
//            
//            var lastX : CGFloat = 0
//            for i in 0..<valueInfos.count
//            {
//                let contentColor = valueInfos[i].color
//                let circleView = UIView(frame: CGRect(x: 24, y: 0, width: 10, height: 10))
//                if i != 0 { circleView.frame.origin.x = lastX + 15 }
//                if i == 0 {
//                    circleView.layer.cornerRadius = 5
//                }else{
//                    circleView.backgroundColor = contentColor
//                }
//                circleView.layer.borderColor = contentColor.cgColor
//                circleView.layer.borderWidth = 1
//                valueInfoView.addSubview(circleView)
//                
//                let infoLabel = UILabel(frame: CGRect(x: circleView.frame.maxX + 4.5, y: 0, width: 50, height: 10))
//                infoLabel.textColor = contentColor
//                infoLabel.font = UIFont(name: Nanum_Barun_Gothic_OTF, size: 10)
//                infoLabel.text = valueInfos[i].title
//                var newSize = infoLabel.sizeThatFits(CGSize(width: SCREEN.WIDTH, height: 10))
//                newSize.height = 10
//                infoLabel.frame.size = newSize
//                valueInfoView.addSubview(infoLabel)
//                lastX = infoLabel.frame.maxX
//            }
//            
//            let goalAndRateView = UIView(frame: CGRect(x: 0, y: valueInfoView.frame.maxY + 50, width: SCREEN.WIDTH, height: 87.5))
//            self.addSubview(goalAndRateView)
//            
//            goalView = InnerViewWith1Value(frame: CGRect(x: 0, y: 0, width: SCREEN.WIDTH * 0.53, height: goalAndRateView.frame.size.height))
//            goalView.backgroundColor = UIColor(red: 0.28, green: 0.67, blue: 0.94, alpha: 1)
//            goalAndRateView.addSubview(goalView)
//            
//            rateView = InnerViewWith1Value(frame: CGRect(x: SCREEN.WIDTH * 0.53, y: 0, width: SCREEN.WIDTH * 0.47, height: goalView.frame.size.height))
//            rateView.backgroundColor = UIColor(red: 0.28, green: 0.38, blue: 0.93, alpha: 1)
//            goalAndRateView.addSubview(rateView)
//
//            
//            goalView.notiLabelUpdate(text: "나의 콜레스테롤 목표 수치는?", image: #imageLiteral(resourceName: "profile"))
//            goalView.valueLabelUpdate(valueString: "70", unitString: "mg/dL")
//            rateView.notiLabelUpdate(text: "목표 수치 달성율은?", image: #imageLiteral(resourceName: "stats"))
//            
//            goalAndRateView.frame.size.height = goalView.frame.size.height
//            goalAndRateView.frame.origin.y = self.frame.size.height - goalAndRateView.frame.size.height
//            
//            self.dataUpdate(index: 1)
//        }
//        
//        func selectButtonPressed(index: Int) {
//            self.dataUpdate(index: index + 1)
//        }
//        
//        func dataUpdate( index : Int ){
//            
//            
//            if index > 3 || index <= 0{
//                toastShow(message: "error")
//                return
//            }
//            
//            //x축
////            var xValueStrings = [String]()
////            var standardIndexString = ""
////            if index == 1 {
////                xValueStrings = ["일","월","화","수","목","금","토"]
////                standardIndexString = "dayweek"
////            }else if index == 2{
////                for i in 0..<31 {
////                    xValueStrings.append("\(i + 1)")
////                }
////                standardIndexString = "day"
////            }else{
////                for i in 0..<12 {
////                    xValueStrings.append("\(i + 1)")
////                }
////                standardIndexString = "month"
////            }
//            
//            
//            
//            guard let regNumString = userD.object(forKey: USER_KEY.KSR_REGISTRATION_NUMBER) as? String else {
//                toastShow(message: "reg_num is nil error")
//                return
//            }
//            
//            let today = Date()
//            let year = dateToStringWithFormat(formatString: "yyyy", date: today)
//            let month = dateToStringWithFormat(formatString: "MM", date: today)
//            let week = dateToStringWithFormat(formatString: "w", date: today)
//            let day = dateToStringWithFormat(formatString: "dd", date: today)
//            
//            let sendDataDic = [
//                "tab":"\(index)",
//                "year":year,
//                "month":month,
//                "week":week,
//                "day":day,
//                "reg_num":regNumString
//            ]
//            
//            Server.getData(type: Server.InfoType.CHOLESTEROL_GRAPH, otherInfo: sendDataDic) { (kData : Data?) in
//                if let data = kData {
//                    do {
//                        if let jsonArray = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? [[String:String]] {
//                            print("CHOLESTEROL_GRAPH:\n\(jsonArray)")
////                            ["total": "50", "ldl": "50", "hdl": "50", "mid": "50", "datetime": "2018.06.28 오후 03:29"]
//                            
//                            var xValueStrings = [String]()
//                            for i in 0..<jsonArray.count {
//                                let jsonDic = jsonArray[i]
//                                if let dateTime = jsonDic["datetime"] {
//                                    if dateTime.count >= 7 {
//                                     let newDate = dateTime.subString(start: 0, end: 7)
//                                        xValueStrings.append(newDate)
//                                    }
//                                }
//                            }
//                            
//                            self.graphView.setXAxisStrings(xAxisStrings: xValueStrings)
//                            
//                            var graphValuesOfMin = [GraphData]()
//                            for i in 0..<jsonArray.count {
//                                if let minValueString = jsonArray[i]["total"] {
//                                    if let minValue = minValueString.toCGFloat() {
//                                        graphValuesOfMin.append(GraphData(value: minValue))
//                                    }
//                                }
//                            }
//                            print("graphValuesOfMin:\(graphValuesOfMin)")
//                            
//                            DispatchQueue.main.async {
//                                self.graphView.graphs[0].valueUpdate(graphValues: graphValuesOfMin)
//                                
//                            }
//                        }
//                        
//                    }catch {
//                        print("error:\(error.localizedDescription)")
//                    }
//                }
//            }
//            
//            
//            
//            
//            
//            //
//            //            var graphValues = [GraphData?]()
//            //            for _ in 0..<testValue {
//            //                let value = random(min: 80, max: 140, underPoint: 0)
//            //                graphValues.append(GraphData(value: value))
//            //            }
//        }
//        
//        required init?(coder aDecoder: NSCoder) {
//            fatalError("init(coder:) has not been implemented")
//        }
//    }
//    
//    class DataView: UIScrollView
//        ,UITableViewDataSource, UITableViewDelegate
//    {
//        
//        var goalView : InnerViewWith1Value!
//        var rateView : InnerViewWith1Value!
//        var tableView : UITableView!
//        var dataArray = [[String:String]]()
//        
//        override init(frame: CGRect) {
//            super.init(frame: frame)
//            
//            //                goal
//            let goalAndRateView = UIView(frame: CGRect(x: 0, y: 0, width: SCREEN.WIDTH, height: 87.5))
//            self.addSubview(goalAndRateView)
//            
//            goalView = InnerViewWith1Value(frame: CGRect(x: 0, y: 0, width: SCREEN.WIDTH * 0.53, height: goalAndRateView.frame.size.height))
//            goalView.backgroundColor = UIColor(red: 0.28, green: 0.67, blue: 0.94, alpha: 1)
//            goalAndRateView.addSubview(goalView)
//            
//            rateView = InnerViewWith1Value(frame: CGRect(x: SCREEN.WIDTH * 0.53, y: 0, width: SCREEN.WIDTH * 0.47, height: goalView.frame.size.height))
//            rateView.backgroundColor = UIColor(red: 0.28, green: 0.38, blue: 0.93, alpha: 1)
//            goalAndRateView.addSubview(rateView)
//            
//            
//            goalView.notiLabelUpdate(text: "나의 콜레스테롤 목표 수치는?", image: #imageLiteral(resourceName: "profile"))
//            goalView.valueLabelUpdate(valueString: "70", unitString: "mg/dL")
//            rateView.notiLabelUpdate(text: "목표 수치 달성율은?", image: #imageLiteral(resourceName: "stats"))
//            
//            goalView.frame.size.height = max(goalView.frame.size.height, rateView.frame.size.height)
//            rateView.frame.size.height = max(goalView.frame.size.height, rateView.frame.size.height)
//            goalAndRateView.frame.size.height = goalView.frame.size.height
//            
//            tableView = UITableView(frame: CGRect(x: 0, y: goalAndRateView.frame.maxY, width: SCREEN.WIDTH, height: self.frame.size.height - goalAndRateView.frame.maxY))
//            tableView.register(DateHeaderView.self, forHeaderFooterViewReuseIdentifier: "DateHeaderView")
//            tableView.register(Compnent4TableViewCell.self, forCellReuseIdentifier: "Compnent4TableViewCell")
//            tableView.delegate = self
//            tableView.dataSource = self
//            tableView.separatorStyle = .none
//            self.addSubview(tableView)
//            
//            self.dataUpdate()
//        }
//        
//        func dataUpdate() {
//            guard let regNumString = userD.object(forKey: USER_KEY.KSR_REGISTRATION_NUMBER) as? String else {
//                toastShow(message: "reg_num is nil error")
//                return
//            }
//            
//            Server.getData(type: Server.InfoType.CHOLESTEROL_DATA_ALL, otherInfo: ["reg_num":regNumString]) { (kData : Data?) in
//                if let data = kData {
//                    do {
//                        if let jsonArray = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? [[String:String]] {
//                            print("CHOLESTEROL_DATA_ALL:\n\(jsonArray)")
//                            self.dataArray = jsonArray
//                            DispatchQueue.main.async {
//                                self.tableView.reloadData()
//                            }
//                            
//                        }
//                    }catch {
//                        print("error:\(error.localizedDescription)")
//                    }
//                }
//            }
//            
//        }
//        
//        
//        //MARK:tableViewDelegate
//        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//            let cell = tableView.dequeueReusableCell(withIdentifier: "Compnent4TableViewCell", for: indexPath) as! Compnent4TableViewCell
//            
//            let dataDic = self.dataArray[indexPath.section]
//            
////            ["total": "50", "hdl": "50", "sid": "7", "ldl": "50", "mid": "50", "datetime": "2018.06.28 오후 03:29"],
//            cell.cellComponentViews[0].notiLabel.text = "총 콜레스테롤"
//            cell.cellComponentViews[0].valueLabel.text = "\(dataDic["total"] ?? "")mg/dL"
//            
//            cell.cellComponentViews[1].notiLabel.text = "HDL 콜레스테롤"
//            cell.cellComponentViews[1].valueLabel.text = "\(dataDic["hdl"] ?? "")mg/dL"
//            
//            cell.cellComponentViews[2].notiLabel.text = "LDL 콜레스테롤"
//            cell.cellComponentViews[2].valueLabel.text = "\(dataDic["ldl"] ?? "")mg/dL"
//            
//            cell.cellComponentViews[3].notiLabel.text = "중성지방"
//            cell.cellComponentViews[3].valueLabel.text = "\(dataDic["mid"] ?? "")mg/dL"
//
//            
//            return cell
//        }
//        
//        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//            return 1
//        }
//        
//        func numberOfSections(in tableView: UITableView) -> Int {
//            return self.dataArray.count
//        }
//        
//        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//            return Compnent4TableViewCell.cellHeight
//        }
//        
//        func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//            let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "DateHeaderView") as! DateHeaderView
//            
//            let dataDic = self.dataArray[section]
//            //            ["total": "50", "hdl": "50", "sid": "7", "ldl": "50", "mid": "50", "datetime": "2018.06.28 오후 03:29"],
//
//            headerView.dateLabel.text = dataDic["datetime"] ?? ""
//            
//            return headerView
//        }
//        
//        func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//            return DateHeaderView.height
//        }
//        
//        func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//            return true
//        }
//        
//        func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
//            
//            let delete = UITableViewRowAction(style: UITableViewRowAction.Style.default, title: "삭제") { (action ,indexPath) in
//                let dataDic = self.dataArray[indexPath.section]
//                print("delete DataDic : \(dataDic)")
//                if let sid = dataDic["sid"] {
//                    Server.getData(type: Server.InfoType.CHOLESTEROL_DEL, otherInfo: ["sid":sid], completion: { (kData : Data?) in
//                        if kData != nil {
//                            self.dataUpdate()
//                        }else{
//                            toastShow(message: "통신이 원활하지 않습니다.\n잠시 후 다시 시도해주세요.")
//                        }
//                    })
//                }
//            }
//            return [delete]
//        }
//        
//        required init?(coder aDecoder: NSCoder) {
//            fatalError("init(coder:) has not been implemented")
//        }
//    }
//}
