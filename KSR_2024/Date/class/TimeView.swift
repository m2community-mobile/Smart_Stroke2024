//
//  TimeView.swift
//  KSR
//
//  Created by m2comm on 2018. 6. 22..
//  Copyright © 2018년 m2community. All rights reserved.
//

import UIKit

class TimeView: UIView {

    
    convenience init() {
        self.init(frame: CGRect(x: 0, y: 0, width: SCREEN.WIDTH, height: 40))
    }
    
    var timeLabel : UILabel!
    private override init(frame: CGRect) {
        super.init(frame: frame)
        
        let iconImage = #imageLiteral(resourceName: "icDate")
        let iconImageView = UIImageView(frame: CGRect(x: 15, y: 0, width: 14, height: 14))
        iconImageView.center.y = self.frame.size.height / 2
        iconImageView.image = iconImage
        self.addSubview(iconImageView)
        
        //7
        let noticeLabel = UILabel(frame: CGRect(x: 36, y: 0, width: 25, height: 40))
        noticeLabel.text = "일시"
        noticeLabel.font = UIFont(name: Nanum_Barun_Gothic_OTF, size: 13)
        noticeLabel.textColor = UIColor(red: 59/255, green: 77/255, blue: 91/255, alpha: 1)
        self.addSubview(noticeLabel)
        
        self.timeLabel = UILabel(frame: CGRect(x: 0, y: 0, width: SCREEN.WIDTH - noticeLabel.frame.maxX, height: 40))
        self.timeLabel.frame.origin.x = SCREEN.WIDTH - 14.5 - self.timeLabel.frame.size.width
        self.timeLabel.textAlignment = .right
        self.timeLabel.font = UIFont(name: Nanum_Barun_Gothic_OTF, size: 13)
        self.addSubview(timeLabel)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
