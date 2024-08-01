//
//  NoticeView.swift
//  KSR
//
//  Created by m2comm on 2018. 6. 22..
//  Copyright © 2018년 m2community. All rights reserved.
//

import UIKit

class SimpleNoticeView: UIView {
    convenience init() {
//        self.init(frame: CGRect(x: 0, y: 0, width: SCREEN.WIDTH, height: 30))
        self.init(frame: CGRect(x: 0, y: 0, width: SCREEN.WIDTH, height: 37.5))
        
    }
    
    var noticeLabel : UILabel!
    private override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor(red: 245/255, green: 246/255, blue: 249/255, alpha: 1)
        
//        self.noticeLabel = UILabel(frame: CGRect(x: 14, y: 0, width: SCREEN.WIDTH - (14 * 2), height: 30))
        self.noticeLabel = UILabel(frame: CGRect(x: 14, y: 0, width: SCREEN.WIDTH - (14 * 2), height: 37.5))
//        self.noticeLabel.font = UIFont(name: Nanum_Barun_Gothic_OTF, size: 10)
        self.noticeLabel.font = UIFont(name: Nanum_Barun_Gothic_OTF, size: 13)

//        self.noticeLabel.textColor = UIColor(red: 147/255, green: 147/255, blue: 171/255, alpha: 1)
        self.noticeLabel.textColor = UIColor.black
        self.addSubview(self.noticeLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
