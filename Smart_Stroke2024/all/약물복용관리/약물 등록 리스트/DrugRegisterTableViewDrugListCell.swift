//
//  DrugRegisterTableViewDrugListCell.swift
//  KSR
//
//  Created by m2comm on 2018. 7. 30..
//  Copyright © 2018년 m2community. All rights reserved.
//

import UIKit

class DrugRegisterTableViewDrugListCell: UITableViewCell {

    var height : CGFloat = 100
    
    var drugComponnentView2s = [DrugComponnentView2]()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        //let drugComponnentView = DrugComponnentView(frame: CGRect(x: 0, y: CGFloat(i) * (17 + 13), width: self.frame.size.width, height: 17), drug: drugNotiInfo.drugs[i])

    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
