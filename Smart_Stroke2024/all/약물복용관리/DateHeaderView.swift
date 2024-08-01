//
//  DateHeaderView.swift
//  KSR
//
//  Created by m2comm on 2018. 6. 25..
//  Copyright © 2018년 m2community. All rights reserved.
//

import UIKit

class DateHeaderView: UITableViewHeaderFooterView {

    static let height : CGFloat = 32
    
    var dateLabel : UILabel!
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
//        self.backgroundColor =
        self.backgroundView?.backgroundColor = UIColor(red: 245/255, green: 246/255, blue: 249/255, alpha: 1)
        self.frame.size.height = DateHeaderView.height
        
        self.dateLabel = UILabel(frame: CGRect(x: 15, y: 0, width: SCREEN.WIDTH - (15 * 2), height: DateHeaderView.height))
        self.dateLabel.font = UIFont(name: Nanum_Barun_Gothic_OTF, size: 12)
//        self.dateLabel.textColor = UIColor(red: 147/255, green: 147/255, blue: 171/255, alpha: 1)
        self.dateLabel.textColor = UIColor.black
        self.addSubview(self.dateLabel)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
