//
//  compnent4TableViewCell.swift
//  KSR
//
//  Created by m2comm on 2018. 6. 21..
//  Copyright © 2018년 m2community. All rights reserved.
//

import UIKit

class Compnent4TableViewCell: UITableViewCell {

    var cellComponentViews = [CellComponentView]()
    
    static let cellHeight : CGFloat = 130
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
        let leftMargin : CGFloat = 15
        let topMargin : CGFloat = 10
        
        self.frame = CGRect(x: 0, y: 0, width: SCREEN.WIDTH, height: Compnent4TableViewCell.cellHeight)
        
        let innerView = UIView(frame: CGRect(x: leftMargin, y: topMargin, width: SCREEN.WIDTH - (leftMargin * 2), height: Compnent4TableViewCell.cellHeight - (topMargin)))
        self.contentView.addSubview(innerView)
        
        for i in 0..<4 {
            let cellComponentViewX = (innerView.frame.size.width / 2) * CGFloat(i % 2)
            let cellComponentViewY = (((innerView.frame.size.height) / 2)) * CGFloat(i / 2)
            let cellComponentView = CellComponentView(origin: CGPoint(x: cellComponentViewX, y: cellComponentViewY ))
            cellComponentView.frame.size.width = innerView.frame.size.width * 0.5
            innerView.addSubview(cellComponentView)
            self.cellComponentViews.append(cellComponentView)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
}


class Compnent5TableViewCell: UITableViewCell {
    
    var cellComponentViews = [CellComponentView]()
    
    static let cellHeight : CGFloat = 130
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = UIColor.white
        
        let leftMargin : CGFloat = 15
        let topMargin : CGFloat = 10
        
        self.frame = CGRect(x: 0, y: 0, width: SCREEN.WIDTH, height: Compnent5TableViewCell.cellHeight)
        
        let innerView = UIView(frame: CGRect(x: leftMargin, y: topMargin, width: SCREEN.WIDTH - (leftMargin * 2), height: Compnent5TableViewCell.cellHeight - (topMargin)))
        self.contentView.addSubview(innerView)
        
        for i in 0..<5 {
            let cellComponentViewX = (innerView.frame.size.width / 3) * CGFloat(i % 3)
            let cellComponentViewY = (((innerView.frame.size.height) / 2)) * CGFloat(i / 3)
            let cellComponentView = CellComponentView(origin: CGPoint(x: cellComponentViewX, y: cellComponentViewY ))
            innerView.addSubview(cellComponentView)
            self.cellComponentViews.append(cellComponentView)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class Compnent3TableViewCell: UITableViewCell {
    
    var cellComponentViews = [CellComponentView]()
    
    static let cellHeight : CGFloat = 70
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = UIColor.white
        
        let leftMargin : CGFloat = 15
        let topMargin : CGFloat = 10
        
        self.frame = CGRect(x: 0, y: 0, width: SCREEN.WIDTH, height: Compnent3TableViewCell.cellHeight)
        
        let innerView = UIView(frame: CGRect(x: leftMargin, y: topMargin, width: SCREEN.WIDTH - (leftMargin * 2), height: Compnent3TableViewCell.cellHeight - (topMargin)))
        self.contentView.addSubview(innerView)
        
        for i in 0..<3 {
            let cellComponentViewX = (innerView.frame.size.width / 3) * CGFloat(i % 3)
            let cellComponentViewY = (((innerView.frame.size.height))) * CGFloat(i / 3)
            let cellComponentView = CellComponentView(origin: CGPoint(x: cellComponentViewX, y: cellComponentViewY ))
            cellComponentView.valueLabel.font = UIFont.boldSystemFont(ofSize: 15)
            innerView.addSubview(cellComponentView)
            self.cellComponentViews.append(cellComponentView)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class Compnent2TableViewCell: UITableViewCell {
    
    var cellComponentViews = [CellComponentView]()
    
    static let cellHeight : CGFloat = 70
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = UIColor.white
        
        let leftMargin : CGFloat = 15
        let topMargin : CGFloat = 10
        
        self.frame = CGRect(x: 0, y: 0, width: SCREEN.WIDTH, height: Compnent3TableViewCell.cellHeight)
        
        let innerView = UIView(frame: CGRect(x: leftMargin, y: topMargin, width: SCREEN.WIDTH - (leftMargin * 2), height: Compnent2TableViewCell.cellHeight - (topMargin)))
        self.contentView.addSubview(innerView)
        
        for i in 0..<2 {
            let cellComponentViewX = (innerView.frame.size.width / 2) * CGFloat(i % 2)
            let cellComponentViewY = (((innerView.frame.size.height))) * CGFloat(i / 2)
            
            let cellComponentView = CellComponentView(frame: CGRect(x: cellComponentViewX, y: cellComponentViewY, width: innerView.frame.size.width / 2, height: CellComponentView.height))
//                CellComponentView(origin: CGPoint(x: cellComponentViewX, y: cellComponentViewY ))
            innerView.addSubview(cellComponentView)
            self.cellComponentViews.append(cellComponentView)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
