//
//  BloodSugarListView.swift
//  KSR
//
//  Created by m2comm on 2018. 6. 27..
//  Copyright © 2018년 m2community. All rights reserved.
//

import UIKit

class BloodSugarListView: UIView {

    var graphScrollView : GraphScrollView!
    var dataScrollView : DataView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.graphScrollView = GraphScrollView(frame: self.bounds)
        self.addSubview(self.graphScrollView)
        
        self.dataScrollView = DataView(frame: self.bounds)
        self.addSubview(self.dataScrollView)
        
        self.graphScrollView.isHidden = true

        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    class GraphScrollView: UIScrollView
    ,WMY_ChangeViewDelegate, SegmentedViewDelegate
    {
        
        var goalView : InnerViewWith3SubTitle!
        var rateView : InnerViewWith3SubTitle!
        var graphView : KJG_GraphView!
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            self.contentSize.width = SCREEN.WIDTH
            
            
            let wmy_ChangeView = WMY_ChangeView()
            wmy_ChangeView.delegate = self
            self.addSubview(wmy_ChangeView)
            
            let segView = SegmentedView()
            segView.frame.origin.y = wmy_ChangeView.frame.maxY
            segView.addItems(titles: ["금식혈당","식후혈당","당화혈색소"])
            segView.delegate = self
            self.addSubview(segView)
            
            
            
            
            var graphDatas = [GraphData]()
            for _ in 0..<12{ graphDatas.append(GraphData(value: random(min: 80, max: 140, underPoint: 0))) }
            
            ////그래프
            
            graphView = KJG_GraphView(frame: CGRect(x: 0, y: segView.frame.maxY, width: SCREEN.WIDTH - 20, height: 200),
                                          type: .line,
                                          numberOfGraph: 1)
            graphView.center.x = SCREEN.WIDTH / 2
            graphView.setYAxisStrings(yAxisStrings: ["250","205","160","115"])
            graphView.graphs[0].setMax(maxValue: 115, minValue: 250)
            graphView.graphs[0].index = 0
            graphView.graphs[0].numberOfGraphs = 1
            
//            graphView.graphs[0].valueUpdate(graphValues: graphValues)
            
            graphView.graphs[0].pointBorderColor = UIColor(red: 247/255, green: 128/255, blue: 0, alpha: 1)
            graphView.graphs[0].pathStrokeColor = UIColor(red: 247/255, green: 128/255, blue: 0, alpha: 1)
            self.addSubview(graphView)
            
            
            
            //그래프
            
            //10
            let valueInfoView = UIView(frame: CGRect(x: 0, y: graphView.frame.maxY + 20, width: SCREEN.WIDTH, height: 10))
            valueInfoView.backgroundColor = UIColor.white
            self.addSubview(valueInfoView)
            
            let valueInfos : [(title : String, color : UIColor)] = [
                (title : "혈당", color : UIColor(red: 247/255, green: 128/255, blue: 0, alpha: 1)),
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
            
            //goalAndRateView
            let goalAndRateView = UIView(frame: CGRect(x: 0, y: valueInfoView.frame.maxY + 50, width: SCREEN.WIDTH, height: 87.5))
            self.addSubview(goalAndRateView)
            
            goalView = InnerViewWith3SubTitle(frame: CGRect(x: 0, y: 0, width: SCREEN.WIDTH * 0.53, height: goalAndRateView.frame.size.height))
            goalView.backgroundColor = UIColor(red: 0.28, green: 0.67, blue: 0.94, alpha: 1)
            goalAndRateView.addSubview(goalView)
            
            //goal
            goalView.notiLabelUpdate(text: "나의 혈당 목표 수치는?", image: #imageLiteral(resourceName: "profile"))
            
            goalView.subTitleLabelUpdate(subTitleLabelindex: 0, titleString: "금식혈당 :")
            goalView.valueLabelUpdate(labelIndex: 0, valueString: "120", unitString: "mg/dL 이하")
            
            goalView.subTitleLabelUpdate(subTitleLabelindex: 1, titleString: "식후혈당 :")
            goalView.valueLabelUpdate(labelIndex: 1, valueString: "200", unitString: "mg/dL 이하")
            
            goalView.subTitleLabelUpdate(subTitleLabelindex: 2, titleString: "당화혈색소 :")
            goalView.valueLabelUpdate(labelIndex: 2, valueString: "7.0", unitString: "")
            
            rateView = InnerViewWith3SubTitle(frame: CGRect(x: SCREEN.WIDTH * 0.53, y: 0, width: SCREEN.WIDTH * 0.47, height: goalView.frame.size.height))
            rateView.backgroundColor = UIColor(red: 0.28, green: 0.38, blue: 0.93, alpha: 1)
            goalAndRateView.addSubview(rateView)
            
            goalAndRateView.frame.size.height = goalView.frame.size.height
            
            //rate
            rateView.notiLabelUpdate(text: "목표 수치 달성율은?", image: #imageLiteral(resourceName: "stats"))
            
            rateView.subTitleLabelUpdate(subTitleLabelindex: 0, titleString: "금식혈당 :")
            rateView.valueLabelUpdate(labelIndex: 0, valueString: "90", unitString: "%")
            
            rateView.subTitleLabelUpdate(subTitleLabelindex: 1, titleString: "식후혈당 :")
            rateView.valueLabelUpdate(labelIndex: 1, valueString: "80", unitString: "%")
            
            rateView.subTitleLabelUpdate(subTitleLabelindex: 2, titleString: "당화혈색소 :")
            rateView.valueLabelUpdate(labelIndex: 2, valueString: "60", unitString: "%")
            
            //
            self.contentSize.height = max(self.frame.size.height,goalAndRateView.frame.maxY)
            
            self.dataUpdate(index: self.yIndex, gubunIndex: self.gubun)
        }
        
        var gubun = 1
        func segButtonPressed(index: Int) {
            self.gubun = index + 1
            self.dataUpdate(index: self.yIndex, gubunIndex: self.gubun)
        }
        
        var yIndex = 1
        func selectButtonPressed(index: Int) {
            self.yIndex = index + 1
            self.dataUpdate(index: self.yIndex, gubunIndex: self.gubun)
        }
        
        func dataUpdate( index : Int, gubunIndex : Int ){

            if index > 3 || index <= 0{
                toastShow(message: "error")
                return
            }
            
            if gubunIndex == 1 {
                graphView.setYAxisStrings(yAxisStrings: ["250","205","160","115"])
                graphView.graphs[0].setMax(maxValue: 115, minValue: 250)
                self.graphView.graphs[0].drawFunc()
                self.graphView.setRedLineValues(values: [120])
            }else if gubunIndex == 2 {
                graphView.setYAxisStrings(yAxisStrings: ["305","270","235","200"])
                graphView.graphs[0].setMax(maxValue: 200, minValue: 305)
                self.graphView.graphs[0].drawFunc()
                self.graphView.setRedLineValues(values: [200])

            }else{
                graphView.setYAxisStrings(yAxisStrings: ["19","15","11","7"])
                graphView.graphs[0].setMax(maxValue: 7, minValue: 19)
                self.graphView.graphs[0].drawFunc()
                self.graphView.setRedLineValues(values: [7])

            }
            
            
            
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
                "gubun":"\(gubunIndex)",
                "tab":"\(index)",
                "year":year,
                "month":month,
                "week":week,
                "day":day,
                "reg_num":regNumString
            ]
            
            Server.getData(type: Server.InfoType.SUGAR_GRAPH, otherInfo: sendDataDic) { (kData : Data?) in
                if let data = kData {
                    do {
                        if let jsonArray = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? [[String:String]] {
                            print("SUGAR_GRAPH:\n\(jsonArray)")
//                            [["day": "28", "month": "6", "val": "18.9", "dayweek": "5"]]
                            //
                            
                    
                            
                            
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
                                        if let minValueString = jsonArray[i]["val"] {
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
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    
    class DataView: UIScrollView
        ,UITableViewDataSource, UITableViewDelegate
    {
        
        var goalView : InnerViewWith3SubTitle!
        var rateView : InnerViewWith3SubTitle!
        var tableView : UITableView!
        var dataArray = [[String:String]]()
        
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            //goalAndRateView
            let goalAndRateView = UIView(frame: CGRect(x: 0, y: 0, width: SCREEN.WIDTH, height: 87.5))
            self.addSubview(goalAndRateView)
            
            goalView = InnerViewWith3SubTitle(frame: CGRect(x: 0, y: 0, width: SCREEN.WIDTH * 0.53, height: goalAndRateView.frame.size.height))
            goalView.backgroundColor = UIColor(red: 0.28, green: 0.67, blue: 0.94, alpha: 1)
            goalAndRateView.addSubview(goalView)
            
            //goal
            goalView.notiLabelUpdate(text: "나의 혈당 목표 수치는?", image: #imageLiteral(resourceName: "profile"))
            
            goalView.subTitleLabelUpdate(subTitleLabelindex: 0, titleString: "금식혈당 :")
            goalView.valueLabelUpdate(labelIndex: 0, valueString: "120", unitString: "mg/dL 이하")
            
            goalView.subTitleLabelUpdate(subTitleLabelindex: 1, titleString: "식후혈당 :")
            goalView.valueLabelUpdate(labelIndex: 1, valueString: "200", unitString: "mg/dL 이하")
            
            goalView.subTitleLabelUpdate(subTitleLabelindex: 2, titleString: "당화혈색소 :")
            goalView.valueLabelUpdate(labelIndex: 2, valueString: "7.0", unitString: "")
            
            rateView = InnerViewWith3SubTitle(frame: CGRect(x: SCREEN.WIDTH * 0.53, y: 0, width: SCREEN.WIDTH * 0.47, height: goalView.frame.size.height))
            rateView.backgroundColor = UIColor(red: 0.28, green: 0.38, blue: 0.93, alpha: 1)
            goalAndRateView.addSubview(rateView)
            
            goalAndRateView.frame.size.height = goalView.frame.size.height
            
            //rate
            rateView.notiLabelUpdate(text: "목표 수치 달성율은?", image: #imageLiteral(resourceName: "stats"))
            
            rateView.subTitleLabelUpdate(subTitleLabelindex: 0, titleString: "금식혈당 :")
            rateView.subTitleLabelUpdate(subTitleLabelindex: 1, titleString: "식후혈당 :")
            rateView.subTitleLabelUpdate(subTitleLabelindex: 2, titleString: "당화혈색소 :")
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
            
            
//            let monthSeletTitleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: monthSeletView.frame.size.height))
//            monthSeletTitleLabel.font = UIFont(name: Nanum_Barun_Gothic_OTF, size: 18)
//            monthSeletTitleLabel.textColor = UIColor(red: 59/255, green: 77/255, blue: 91/255, alpha: 1)
//            monthSeletTitleLabel.center = CGPoint(x: monthSeletView.frame.size.width / 2, y: monthSeletView.frame.size.height / 2)
//            monthSeletTitleLabel.text = dateToStringWithFormat(formatString: "yyyy년 M월", date: self.today)
////            "2018년 5월"
//            monthSeletView.addSubview(monthSeletTitleLabel)
            
            
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
            
            Server.getData(type: Server.InfoType.SUGAR_DATA_ALL, otherInfo: ["reg_num":regNumString]) { (kData : Data?) in
                if let data = kData {
                    do {
                        if let jsonArray = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? [[String:String]] {
                            print("SUGAR_DATA_ALL:\n\(jsonArray)")
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
            
//            [["sid": "26", "gubun": "1", "val": "150", "datetime": "2018.06.29 오전 09:52", "hba1c": "7"],
            cell.cellComponentViews[0].notiLabel.text = "식사 상태"
            cell.cellComponentViews[1].notiLabel.text = "혈당"
            cell.cellComponentViews[2].notiLabel.text = "당화혈색소"
            
            let dataDic = self.dataArray[indexPath.section]

            let gubun = dataDic["gubun"] ?? ""
            if gubun == "1" {
                cell.cellComponentViews[0].valueLabel.text = "공복"
            }else{
                cell.cellComponentViews[0].valueLabel.text = "식후"
            }
            
            let val = dataDic["val"] ?? ""
            cell.cellComponentViews[1].valueLabel.text = "\(val) mg / dL"
            
            let hba1c = dataDic["hba1c"] ?? ""
            if let hba1cValue = hba1c.toCGFloat() {
                cell.cellComponentViews[2].valueLabel.text = "\(roundPlaces(value: hba1cValue, under: 1))"
            }else{
                cell.cellComponentViews[2].valueLabel.text = "\(hba1c)"
            }
            
            return cell
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
            return 1
        }
        
        func numberOfSections(in tableView: UITableView) -> Int {
            //?/
            tableView.frame.size.height = CGFloat(self.dataArray.count) * (Compnent3TableViewCell.cellHeight + DateHeaderView.height)
            self.contentSize = CGSize(width: SCREEN.WIDTH, height: tableView.frame.maxY)
            return self.dataArray.count
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return Compnent3TableViewCell.cellHeight
        }
        
        func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "DateHeaderView") as! DateHeaderView
            
            //            [["sid": "26", "gubun": "1", "val": "150", "datetime": "2018.06.29 오전 09:52", "hba1c": "7"],
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
                print("dataDic : \(dataDic)")
                if let sid = dataDic["sid"] {
                    Server.getData(type: Server.InfoType.SUGAR_DEL, otherInfo: ["sid":sid], completion: { (kData : Data?) in
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
