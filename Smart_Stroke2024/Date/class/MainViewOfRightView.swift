//
//  dd.swift
//  KSR
//
//  Created by m2comm on 2018. 7. 11..
//  Copyright © 2018년 m2community. All rights reserved.
//

import UIKit

@objc protocol MainViewOfRightViewDelegate {
    @objc optional func tableView(tableView: MainViewOfRightView, didCellSelectedIndexPath indexPath: IndexPath)
    @objc optional func tableView(tableView : MainViewOfRightView, didHeaderSelectedIndex index : Int)
}

class MainViewOfRightView: UIView, UITableViewDataSource, UITableViewDelegate
,HeaderOfRightViewDelegate
{
 
    var delegate : MainViewOfRightViewDelegate?
    var tableView : UITableView!
    var dataArray = [[String:Any?]]()
    
    /*
     title : 위험인자
     value : [String]?
     */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.tableView = UITableView(frame: self.bounds)
        self.tableView.register(MainViewTableCell.self, forCellReuseIdentifier: "MainViewTableCell")
        self.tableView.register(HeaderOfRightView.self, forHeaderFooterViewReuseIdentifier: "HeaderOfRightView")
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.addSubview(self.tableView)
        
        self.tableView.separatorStyle = .none
        
    }
    
    func dataUpdate(arrayIndex : Int){
        self.dataArray = MainViewOfRightViewData.MainViewOfRightViewDataArray[arrayIndex]
//        print("dataUpdate:\(self.dataArray)")
        self.tableView.reloadData()
    }
    
    var selectedIndex = -1
    
    //MARK: tableviewDelegate
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainViewTableCell", for: indexPath) as! MainViewTableCell
        
        let dataDic = self.dataArray[indexPath.section]
        if let array = dataDic[MainViewOfRightViewData.KEY_ARRAY] as? [String] {
            cell.label.text = array[indexPath.row]
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return MainViewTableCell.height
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderOfRightView") as! HeaderOfRightView
        
        headerView.delegate = self
        headerView.button.tag = section
        
        let dataDic = self.dataArray[section]
        
        if dataDic[MainViewOfRightViewData.KEY_ARRAY] == nil {
            headerView.imageView.image = nil
        }else{
            if self.selectedIndex == section {
                headerView.imageView.image = #imageLiteral(resourceName: "btn_unfold2").withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
            }else{
                headerView.imageView.image = #imageLiteral(resourceName: "btn_fold2").withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
            }
        }
        if let title = dataDic[MainViewOfRightViewData.KEY_TITLE] as? String {
            headerView.titleLabel.text = title
        }
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return HeaderOfRightView.height
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
//        return self.dataArray.count
        return self.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if selectedIndex >= 0 {
            if selectedIndex == section {
                if section < self.dataArray.count {
                    let dataDic = self.dataArray[section]
                    if let array = dataDic[MainViewOfRightViewData.KEY_ARRAY] as? [String] {
                        print("array.count:\(array.count)")
                        return array.count
                    }
                }
            }else{
                return 0
            }
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.tableView?(tableView: self, didCellSelectedIndexPath: indexPath)
    }
    
    //MARK:HeaderOfRightViewDelegate
    func headerViewPressed(index: Int) {
        
        let dataDic = self.dataArray[index]
        if (dataDic[MainViewOfRightViewData.KEY_ARRAY] as? [String]) == nil {
            self.delegate?.tableView?(tableView: self, didHeaderSelectedIndex: index)
            return
        }
        
        
        if self.selectedIndex == -1 {
//            print("펼치기")
            self.selectedIndex = index
            
            var indexPaths = [IndexPath]()
            let dataDic = self.dataArray[self.selectedIndex]
            if let array = dataDic[MainViewOfRightViewData.KEY_ARRAY] as? [String] {
                for i in 0..<array.count {
                    indexPaths.append(IndexPath(row: i, section: self.selectedIndex))
                }
            }
            
            if indexPaths.count >= 1{
                self.tableView.beginUpdates()
                self.tableView.insertRows(at: indexPaths, with: .fade)
                self.tableView.endUpdates()
                
                let headerView = self.tableView.headerView(forSection: self.selectedIndex) as! HeaderOfRightView
                headerView.imageView.image = #imageLiteral(resourceName: "btn_unfold2").withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
            }
            
        }else if self.selectedIndex == index {
//            print("접기")
            self.selectedIndex = -1
            var beforeIndexPaths = [IndexPath]()
            let beforeDataDic = self.dataArray[index]
            if let beforeArray = beforeDataDic[MainViewOfRightViewData.KEY_ARRAY] as? [String] {
                for i in 0..<beforeArray.count {
                    beforeIndexPaths.append(IndexPath(row: i, section: index))
                }
            }
            if beforeIndexPaths.count >= 1{
                self.tableView.beginUpdates()
                self.tableView.deleteRows(at: beforeIndexPaths, with: .fade)
                self.tableView.endUpdates()
                
                let headerView = self.tableView.headerView(forSection: index) as! HeaderOfRightView
                headerView.imageView.image = #imageLiteral(resourceName: "btn_fold2").withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
            }
        }else{
            //self.selectedIndex != index
//            print("기존 접기 & 새거 펼치기")
            var beforeIndexPaths = [IndexPath]()
            let beforeDataDic = self.dataArray[self.selectedIndex]
            if let beforeArray = beforeDataDic[MainViewOfRightViewData.KEY_ARRAY] as? [String] {
                for i in 0..<beforeArray.count {
                    beforeIndexPaths.append(IndexPath(row: i, section: self.selectedIndex))
                }
            }

            if beforeIndexPaths.count >= 1 {
                let headerView = self.tableView.headerView(forSection: self.selectedIndex) as! HeaderOfRightView
                headerView.imageView.image = #imageLiteral(resourceName: "btn_fold2").withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
            }
            
            self.selectedIndex = index
            var afterIndexPaths = [IndexPath]()
            let afterDataDic = self.dataArray[self.selectedIndex]
            if let afterArray = afterDataDic[MainViewOfRightViewData.KEY_ARRAY] as? [String] {
                for i in 0..<afterArray.count {
                    afterIndexPaths.append(IndexPath(row: i, section: self.selectedIndex))
                }
            }
            
            if afterIndexPaths.count >= 1 {
                let headerView2 = self.tableView.headerView(forSection: self.selectedIndex) as! HeaderOfRightView
                headerView2.imageView.image = #imageLiteral(resourceName: "btn_unfold2").withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
            }
            self.tableView.beginUpdates()
            self.tableView.insertRows(at: afterIndexPaths, with: .fade)
            self.tableView.deleteRows(at: beforeIndexPaths, with: .fade)
            self.tableView.endUpdates()
            
            
            
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

@objc protocol HeaderOfRightViewDelegate {
    @objc optional func headerViewPressed(index : Int)
}

class HeaderOfRightView: UITableViewHeaderFooterView {
    
    static let height : CGFloat = 55
    
    var delegate : HeaderOfRightViewDelegate?
    
    var button : UIButton!
    var titleLabel : UILabel!
    var imageView : UIImageView!
    
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        self.frame.size = CGSize(width: SCREEN.WIDTH - 70, height: HeaderOfRightView.height)
        self.contentView.backgroundColor = UIColor.white
        
        
        titleLabel = UILabel(frame: CGRect(x: 15, y: 0, width: self.frame.size.width - 15 - 40, height: HeaderOfRightView.height))
        titleLabel.font = UIFont(name: Nanum_Barun_Gothic_OTF, size: 14)
        self.addSubview(titleLabel)
        
        button = UIButton(frame: self.bounds)
        button.backgroundColor = UIColor.clear
        button.addTarget(self, action: #selector(buttonPressed(button:)), for: .touchUpInside)
        self.addSubview(button)
        
        self.imageView = UIImageView(frame: CGRect(x: self.frame.size.width - 40, y: 0, width: 40, height: 40))
        self.imageView.center.y = HeaderOfRightView.height / 2
        self.imageView.tintColor = UIColor(red: 147/255, green: 147/255, blue: 171/255, alpha: 1)
        self.addSubview(self.imageView)
        
        let underBar = UIView(frame: CGRect(x: 0, y: self.frame.size.height - 1, width: self.frame.size.width, height: 1))
        underBar.backgroundColor = UIColor(red: 147/255, green: 147/255, blue: 171/255, alpha: 1)
        self.addSubview(underBar)
        
    }
    
    @objc func buttonPressed(button : UIButton)  {
        self.delegate?.headerViewPressed?(index: button.tag)
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class MainViewTableCell: UITableViewCell {
    
    static let height : CGFloat = 35
    
    var label : UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.backgroundColor = UIColor(white: 0.95, alpha: 1)
        
        self.frame.size = CGSize(width: SCREEN.WIDTH - 70, height: MainViewTableCell.height)
        self.selectionStyle = .none
        
        self.label = UILabel(frame: CGRect(x: 30, y: 0, width: self.frame.size.width - 30, height: MainViewTableCell.height))
        //?/
        self.label.font = UIFont(name: Nanum_Barun_Gothic_OTF, size: 13)
        self.label.textColor = UIColor(red: 147/255, green: 147/255, blue: 171/255, alpha: 1)
        self.addSubview(label)
        
        
        
    }
    
//    override func layoutSubviews() {
//            super.layoutSubviews()
//        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 200, right: 0))
//        }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


