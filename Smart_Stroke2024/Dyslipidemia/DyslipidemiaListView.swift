//
//  DyslipidemiaListView.swift
//  KSR
//
//  Created by m2comm on 2018. 6. 28..
//  Copyright © 2018년 m2community. All rights reserved.
//

import UIKit

class DyslipidemiaListView: UIScrollView {
    
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
            
            ////그래프
            ///
            graphView = KJG_GraphView(frame: CGRect(x: 15, y: 100, width: SCREEN.WIDTH - 30, height: 350),
                                      type: .bar,
                                      numberOfGraph: 1)
            graphView.center.x = SCREEN.WIDTH / 2
            graphView.layer.addBorder([.bottom, .left, .right, .top], color: #colorLiteral(red: 0.4871953726, green: 0.7789307833, blue: 0.8985077143, alpha: 1), width: 1)
            graphView.setYAxisStrings(yAxisStrings: ["140","120","100","80"])
            
            graphView.graphs[0].index = 0
            graphView.graphs[0].numberOfGraphs = 1
            graphView.graphs[0].setMax(maxValue: 50, minValue: 110)
            
            graphView.graphs[0].pointBorderColor = UIColor(red: 247/255, green: 128/255, blue: 0, alpha: 1)
            graphView.graphs[0].pathStrokeColor = UIColor(red: 247/255, green: 128/255, blue: 0, alpha: 1)
            
            self.addSubview(graphView)
            
            
            var myValue = UserDefaults.standard.string(forKey: "ch") ?? ""
                
                var floatValue = CGFloat((myValue as NSString).floatValue - 30)
            
            self.graphView.setRedLineValues(values: [floatValue])

            //그래프
            
            //10
            let valueInfoView = UIView(frame: CGRect(x: 15, y: graphView.frame.maxY - 20, width: SCREEN.WIDTH - 30, height: 20))
            valueInfoView.backgroundColor = UIColor.white
            self.addSubview(valueInfoView)
            valueInfoView.layer.addBorder([.bottom, .left, .right], color: #colorLiteral(red: 0.4871953726, green: 0.7789307833, blue: 0.8985077143, alpha: 1), width: 1)
            let valueInfos : [(title : String, color : UIColor)] = [
                (title : "콜레스테롤", color : UIColor(red: 247/255, green: 128/255, blue: 0, alpha: 1)),
                (title : "목표수치", color : UIColor(red: 211/255, green: 42/255, blue: 42/255, alpha: 1))
            ]
            
            var lastX : CGFloat = 0
            for i in 0..<valueInfos.count
            {
                let contentColor = valueInfos[i].color
                let circleView = UIView(frame: CGRect(x: 24, y: -10, width: 10, height: 10))
                if i != 0 { circleView.frame.origin.x = lastX + 15 }
                if i == 0 {
                    circleView.layer.cornerRadius = 5
                }else{
                    circleView.backgroundColor = contentColor
                }
                circleView.layer.borderColor = contentColor.cgColor
                circleView.layer.borderWidth = 1
                valueInfoView.addSubview(circleView)
                
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
//            self.addSubview(goalAndRateView)
            
            goalView = InnerViewWith1Value(frame: CGRect(x: 0, y: 0, width: SCREEN.WIDTH * 0.53, height: goalAndRateView.frame.size.height))
            goalView.backgroundColor = UIColor(red: 0.28, green: 0.67, blue: 0.94, alpha: 1)
//            goalAndRateView.addSubview(goalView)
            
            rateView = InnerViewWith1Value(frame: CGRect(x: SCREEN.WIDTH * 0.53, y: 0, width: SCREEN.WIDTH * 0.47, height: goalView.frame.size.height))
            rateView.backgroundColor = UIColor(red: 0.28, green: 0.38, blue: 0.93, alpha: 1)
//            goalAndRateView.addSubview(rateView)

            
            goalView.notiLabelUpdate(text: "나의 콜레스테롤 목표 수치는?", image: #imageLiteral(resourceName: "profile"))
            goalView.valueLabelUpdate(valueString: "70", unitString: "mg/dL")
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
                xValueStrings = ["2023.1","2023.6","2023.12","2024.1","2024.6","2024.12"]
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
            
            
            //x축
//            var xValueStrings = [String]()
//            var standardIndexString = ""
//            if index == 1 {
//                xValueStrings = ["일","월","화","수","목","금","토"]
//                standardIndexString = "dayweek"
//            }else if index == 2{
//                for i in 0..<31 {
//                    xValueStrings.append("\(i + 1)")
//                }
//                standardIndexString = "day"
//            }else{
//                for i in 0..<12 {
//                    xValueStrings.append("\(i + 1)")
//                }
//                standardIndexString = "month"
//            }
            
            
            let regNumString = "SB-12500-1"
//            guard let regNumString = userD.object(forKey: USER_KEY.KSR_REGISTRATION_NUMBER) as? String else {
//                toastShow(message: "reg_num is nil error")
//                return
//            }
            
            let today = Date()
            let year = dateToStringWithFormat(formatString: "yyyy", date: today)
            let month = dateToStringWithFormat(formatString: "MM", date: today)
            let week = dateToStringWithFormat(formatString: "w", date: today)
            let day = dateToStringWithFormat(formatString: "dd", date: today)
            let sid = "\(UserDefaults.standard.object(forKey: "userSid") ?? 0)"
            
            let sendDataDic = [
                "tab":"\(index)",
                "year":year,
                "month":month,
                "week":week,
                "day":day,
                "reg_num":regNumString,
                "user_sid":sid
            ]
            
            Server.getData(type: Server.InfoType.CHOLESTEROL_GRAPH, otherInfo: sendDataDic) { (kData : Data?) in
                if let data = kData {
                    
                    do {
                        
                        
                        if let jsonArray = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? [[String:String]] {
                            print("CHOLESTEROL_GRAPH:\n\(jsonArray)")
//                            ["total": "50", "ldl": "50", "hdl": "50", "mid": "50", "datetime": "2018.06.28 오후 03:29"]
                            
                            var xValueStrings = [String]()
                            for i in 0..<jsonArray.count {
                                let jsonDic = jsonArray[i]
                                if let dateTime = jsonDic["datetime"] {
                                    if dateTime.count >= 7 {
                                     let newDate = dateTime.subString(start: 0, end: 7)
                                        xValueStrings.append(newDate)
                                    }
                                }
                            }
                            
                            self.graphView.setXAxisStrings(xAxisStrings: xValueStrings)
                            
                            
                            var graphValuesOfMin = [GraphData]()
                            for i in 0..<jsonArray.count {
                                if let minValueString = jsonArray[i]["total"] {
                                    print("이거는 안나오니?\(minValueString)")
                                    
                                    if let minValue = minValueString.toCGFloat() {
                                        graphValuesOfMin.append(GraphData(value: minValue - 30))
                                    }
                                }
                            }
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
//            self.addSubview(goalAndRateView)
            
            goalView = InnerViewWith1Value(frame: CGRect(x: 0, y: 0, width: SCREEN.WIDTH * 0.53, height: goalAndRateView.frame.size.height))
            goalView.backgroundColor = UIColor(red: 0.28, green: 0.67, blue: 0.94, alpha: 1)
//            goalAndRateView.addSubview(goalView)
            
            rateView = InnerViewWith1Value(frame: CGRect(x: SCREEN.WIDTH * 0.53, y: 0, width: SCREEN.WIDTH * 0.47, height: goalView.frame.size.height))
            rateView.backgroundColor = UIColor(red: 0.28, green: 0.38, blue: 0.93, alpha: 1)
//            goalAndRateView.addSubview(rateView)
            
            
            goalView.notiLabelUpdate(text: "나의 콜레스테롤 목표 수치는?", image: #imageLiteral(resourceName: "profile"))
            goalView.valueLabelUpdate(valueString: "70", unitString: "mg/dL")
            rateView.notiLabelUpdate(text: "목표 수치 달성율은?", image: #imageLiteral(resourceName: "stats"))
            
            goalView.frame.size.height = max(goalView.frame.size.height, rateView.frame.size.height)
            rateView.frame.size.height = max(goalView.frame.size.height, rateView.frame.size.height)
            goalAndRateView.frame.size.height = goalView.frame.size.height
            
            tableView = UITableView(frame: CGRect(x: 0, y: goalAndRateView.frame.maxY, width: SCREEN.WIDTH, height: self.frame.size.height - goalAndRateView.frame.maxY))
            tableView.register(DateHeaderView.self, forHeaderFooterViewReuseIdentifier: "DateHeaderView")
            tableView.register(Compnent4TableViewCell.self, forCellReuseIdentifier: "Compnent4TableViewCell")
            tableView.backgroundColor = #colorLiteral(red: 0.9450935721, green: 0.9524920583, blue: 0.9736705422, alpha: 1)
            tableView.delegate = self
            tableView.dataSource = self
            tableView.separatorStyle = .none
            self.addSubview(tableView)
            
            self.tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 44, right: 0);
            
            self.dataUpdate()
        }
        
        func dataUpdate() {
//            guard let regNumString = userD.object(forKey: USER_KEY.KSR_REGISTRATION_NUMBER) as? String else {
//                toastShow(message: "reg_num is nil error")
//                return
//            }
            let sid = "\(UserDefaults.standard.object(forKey: "userSid") ?? 0)"
            
            Server.getData(type: Server.InfoType.CHOLESTEROL_DATA_ALL, otherInfo: ["user_sid":sid]) { (kData : Data?) in
                if let data = kData {
                    do {
                        if let jsonArray = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? [[String:String]] {
                            print("CHOLESTEROL_DATA_ALL:\n\(jsonArray)")
                            self.dataArray = jsonArray
                            DispatchQueue.main.async {
                                print("업로드")
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
            let cell = tableView.dequeueReusableCell(withIdentifier: "Compnent4TableViewCell", for: indexPath) as! Compnent4TableViewCell
            
            let dataDic = self.dataArray[indexPath.section]
            
//            ["total": "50", "hdl": "50", "sid": "7", "ldl": "50", "mid": "50", "datetime": "2018.06.28 오후 03:29"],
            cell.cellComponentViews[0].notiLabel.text = "총 콜레스테롤"
            cell.cellComponentViews[0].notiLabel.font = UIFont(name: "SUITE-Bold", size: 14)
            if IS_IPHONE_N {
                cell.cellComponentViews[0].notiLabel.font = UIFont(name: "SUITE-Bold", size: 10)
            }
            
            if IS_IPHONE_X {
                cell.cellComponentViews[0].notiLabel.font = UIFont(name: "SUITE-Bold", size: 10)
            }
            
            
            cell.cellComponentViews[0].valueLabel.text = "\(dataDic["total"] ?? "")mg/dL"
            cell.cellComponentViews[0].valueLabel.font = UIFont(name: "SUITE-Bold", size: 19)
            if IS_IPHONE_N {
                cell.cellComponentViews[0].valueLabel.font = UIFont(name: "SUITE-Bold", size: 15)
            }
            
            if IS_IPHONE_X {
                cell.cellComponentViews[0].valueLabel.font = UIFont(name: "SUITE-Bold", size: 15)
            }
            
            
            
            cell.cellComponentViews[1].notiLabel.text = "HDL 콜레스테롤"
            cell.cellComponentViews[1].notiLabel.font = UIFont(name: "SUITE-Bold", size: 14)
            if IS_IPHONE_N {
                cell.cellComponentViews[1].notiLabel.font = UIFont(name: "SUITE-Bold", size: 10)
            }
            
            if IS_IPHONE_X {
                cell.cellComponentViews[1].notiLabel.font = UIFont(name: "SUITE-Bold", size: 10)
            }
            cell.cellComponentViews[1].valueLabel.text = "\(dataDic["hdl"] ?? "")mg/dL"
            cell.cellComponentViews[1].valueLabel.font = UIFont(name: "SUITE-Bold", size: 19)
            if IS_IPHONE_N {
                cell.cellComponentViews[1].valueLabel.font = UIFont(name: "SUITE-Bold", size: 15)
            }
            
            if IS_IPHONE_X {
                cell.cellComponentViews[1].valueLabel.font = UIFont(name: "SUITE-Bold", size: 15)
            }
            
            cell.cellComponentViews[2].notiLabel.text = "LDL 콜레스테롤"
            cell.cellComponentViews[2].notiLabel.font = UIFont(name: "SUITE-Bold", size: 14)
            if IS_IPHONE_N {
                cell.cellComponentViews[2].notiLabel.font = UIFont(name: "SUITE-Bold", size: 10)
            }
            
            if IS_IPHONE_X {
                cell.cellComponentViews[2].notiLabel.font = UIFont(name: "SUITE-Bold", size: 10)
            }
            cell.cellComponentViews[2].valueLabel.text = "\(dataDic["ldl"] ?? "")mg/dL"
            cell.cellComponentViews[2].valueLabel.font = UIFont(name: "SUITE-Bold", size: 19)
            if IS_IPHONE_N {
                cell.cellComponentViews[2].valueLabel.font = UIFont(name: "SUITE-Bold", size: 15)
            }
            
            if IS_IPHONE_X {
                cell.cellComponentViews[2].valueLabel.font = UIFont(name: "SUITE-Bold", size: 15)
            }
            
            cell.cellComponentViews[3].notiLabel.text = "중성지방"
            cell.cellComponentViews[3].notiLabel.font = UIFont(name: "SUITE-Bold", size: 14)
            if IS_IPHONE_N {
                cell.cellComponentViews[3].notiLabel.font = UIFont(name: "SUITE-Bold", size: 10)
            }
            
            if IS_IPHONE_X {
                cell.cellComponentViews[3].notiLabel.font = UIFont(name: "SUITE-Bold", size: 10)
            }
            cell.cellComponentViews[3].valueLabel.text = "\(dataDic["mid"] ?? "")mg/dL"
            cell.cellComponentViews[3].valueLabel.font = UIFont(name: "SUITE-Bold", size: 19)
            if IS_IPHONE_N {
                cell.cellComponentViews[3].valueLabel.font = UIFont(name: "SUITE-Bold", size: 15)
            }
            
            if IS_IPHONE_X {
                cell.cellComponentViews[3].valueLabel.font = UIFont(name: "SUITE-Bold", size: 15)
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
            return Compnent4TableViewCell.cellHeight
        }
        
        func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "DateHeaderView") as! DateHeaderView
            
            let dataDic = self.dataArray[section]
            //            ["total": "50", "hdl": "50", "sid": "7", "ldl": "50", "mid": "50", "datetime": "2018.06.28 오후 03:29"],

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
                    Server.getData(type: Server.InfoType.CHOLESTEROL_DEL, otherInfo: ["sid":sid], completion: { (kData : Data?) in
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
        
        
//        func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//                
//                
//                let deleted = UIContextualAction(style: .normal, title: "삭제") { (UIContextualAction, UIView, success: @escaping (Bool) -> Void) in
//                    
//                    
//                    let dataDic = self.dataArray[indexPath.section]
//                    if let sid = dataDic["sid"] {
//                        Server.getData(type: Server.InfoType.CHOLESTEROL_DEL, otherInfo: ["sid":sid], completion: { (kData : Data?) in
//                            if kData != nil {
//                                self.dataUpdate()
//                            }else{
//                                toastShow(message: "통신이 원활하지 않습니다.\n잠시 후 다시 시도해주세요.")
//                            }
//                        })
//                    }
//                    
//                    success(true)
//                }
//            deleted.backgroundColor = .systemPink
//            deleted.image = UIImage(systemName: "trash")
//            
//                
////                let share = UIContextualAction(style: .normal, title: "Share") { (UIContextualAction, UIView, success: @escaping (Bool) -> Void) in
////
////                    success(true)
////                }
////                share.backgroundColor = .systemTeal
//                
//                //actions배열 인덱스 0이 왼쪽에 붙어서 나옴
//                return UISwipeActionsConfiguration(actions:[deleted])
//                
//            }
//        
        
        func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
                
                
                let deleted = UIContextualAction(style: .normal, title: "삭제") { (UIContextualAction, UIView, success: @escaping (Bool) -> Void) in
                    
                    
                    let dataDic = self.dataArray[indexPath.section]
                    if let sid = dataDic["sid"] {
                        Server.getData(type: Server.InfoType.CHOLESTEROL_DEL, otherInfo: ["sid":sid], completion: { (kData : Data?) in
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
                    Server.getData(type: Server.InfoType.SUGAR_DEL, otherInfo: ["sid":sid], completion: { (kData : Data?) in
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
                
            }
        
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
}
