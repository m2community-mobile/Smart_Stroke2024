//
//  BloodPressureListView.swift
//  KSR
//
//  Created by m2comm on 2018. 6. 26..
//  Copyright © 2018년 m2community. All rights reserved.
//

import UIKit

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
            graphView = KJG_GraphView(frame: CGRect(x: 0, y: wmy_ChangeView.frame.maxY, width: SCREEN.WIDTH - 10, height: 200),
                                          type: .line,
                                          numberOfGraph: 2)
            graphView.center.x = SCREEN.WIDTH / 2
            
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
            
            self.graphView.setRedLineValues(values: [120,80])
            //그래프
            
            //10
            let valueInfoView = UIView(frame: CGRect(x: 0, y: graphView.frame.maxY + 20, width: SCREEN.WIDTH, height: 10))
            valueInfoView.backgroundColor = UIColor.white
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
                let circleView = UIView(frame: CGRect(x: 24, y: 0, width: 10, height: 10))
                if i != 0 { circleView.frame.origin.x = lastX + 15 }
                circleView.layer.cornerRadius = 5
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
            self.addSubview(goalAndRateView)
            
            goalView = InnerViewWith2Value(frame: CGRect(x: 0, y: 0, width: SCREEN.WIDTH * 0.53, height: goalAndRateView.frame.size.height))
            goalView.backgroundColor = UIColor(red: 0.28, green: 0.67, blue: 0.94, alpha: 1)
            goalAndRateView.addSubview(goalView)
            goalView.notiLabelUpdate(text: "나의 혈압 목표 수치는?", image: #imageLiteral(resourceName: "profile"))
            
            rateView = InnerViewWith2Value(frame: CGRect(x: SCREEN.WIDTH * 0.53, y: 0, width: SCREEN.WIDTH * 0.47, height: goalView.frame.size.height))
            rateView.backgroundColor = UIColor(red: 0.28, green: 0.38, blue: 0.93, alpha: 1)
            goalAndRateView.addSubview(rateView)
            rateView.notiLabelUpdate(text: "목표 수치 달성율은?", image: #imageLiteral(resourceName: "stats"))
            
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
            
            guard let regNumString = userD.object(forKey: USER_KEY.KSR_REGISTRATION_NUMBER) as? String else {
                toastShow(message: "reg_num is nil error")
                return
            }
            
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
                            
                            //?/
                            DispatchQueue.main.async {
                                self.graphView.graphs[0].valueUpdate(graphValues: graphValuesOfMin)
                                self.graphView.graphs[1].valueUpdate(graphValues: graphValuesOfMax)
                                
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
    
    class DataView: UIView
        ,UITableViewDataSource, UITableViewDelegate
    {
        
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
            goalAndRateView.addSubview(goalView)
            goalView.notiLabelUpdate(text: "나의 혈압 목표 수치는?", image: #imageLiteral(resourceName: "profile"))
            
            rateView = InnerViewWith2Value(frame: CGRect(x: SCREEN.WIDTH * 0.53, y: 0, width: SCREEN.WIDTH * 0.47, height: goalView.frame.size.height))
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
            tableView.register(Compnent3TableViewCell.self, forCellReuseIdentifier: "Compnent3TableViewCell")
            tableView.delegate = self
            tableView.dataSource = self
            tableView.separatorStyle = .none
            self.addSubview(tableView)
         
            self.dataUpdate()
        }
        
        func dataUpdate() {
            guard let regNumString = userD.object(forKey: USER_KEY.KSR_REGISTRATION_NUMBER) as? String else {
                toastShow(message: "reg_num is nil error")
                return
            }
            
            Server.getData(type: Server.InfoType.BLOOD_DATA_ALL, otherInfo: ["reg_num":regNumString]) { (kData : Data?) in
                if let data = kData {
                    do {
                        if let jsonArray = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? [[String:String]] {
                            print("jsonArray:\n\(jsonArray)")
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
            let cell = tableView.dequeueReusableCell(withIdentifier: "Compnent3TableViewCell", for: indexPath) as! Compnent3TableViewCell
            
            let dataDic = self.dataArray[indexPath.section]
            
            cell.cellComponentViews[0].notiLabel.text = "수축기압"
            cell.cellComponentViews[0].valueLabel.text = "\(dataDic["max"] ?? "")mmHg"
            
            cell.cellComponentViews[1].notiLabel.text = "이완기압"
            cell.cellComponentViews[1].valueLabel.text = "\(dataDic["min"] ?? "")mmHg"
            
            cell.cellComponentViews[2].notiLabel.text = "맥박"
            cell.cellComponentViews[2].valueLabel.text = "\(dataDic["pulse"] ?? "")회/분"
            
            return cell
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }
        
        func numberOfSections(in tableView: UITableView) -> Int {
            return self.dataArray.count
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return Compnent3TableViewCell.cellHeight
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
        
        func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
            
            let delete = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "삭제") { (action ,indexPath) in
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
            return [delete]
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
}
