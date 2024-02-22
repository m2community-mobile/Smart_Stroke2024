//
//  CalendarCell.swift
//  KSR
//
//  Created by m2comm on 2018. 6. 27..
//  Copyright © 2018년 m2community. All rights reserved.
//

import UIKit
import JTAppleCalendar

class CalendarCell: JTAppleCell {
    
    var dateLabel: UILabel!
    var backView : UIView!
    var colorView : UIView!
    
    var sunImageViews = [UIImageView]()
    var calendarXImageView : UIImageView!
    
    var firstCheckView : UIImageView!
    
    private var separatorView : UIView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backView = UIView(frame: CGRect(x: 0, y: 0, width: SCREEN.WIDTH / 7, height: SCREEN.WIDTH / 7))
        backView.center = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height / 2)
        self.addSubview(backView)
        
        self.colorView = UIView(frame: self.backView.bounds)
        self.backView.addSubview(self.colorView)
        
        
        
        self.dateLabel = UILabel(frame: CGRect(x: 0, y: 13, width: backView.frame.size.width, height: 15))
        self.dateLabel.center.x = backView.frame.size.width / 2
        self.dateLabel.center.y = self.backView.frame.size.height * 17/45
        self.dateLabel.textAlignment = .center
        self.dateLabel.font = UIFont(name: Nanum_Barun_Gothic_OTF, size: 14.8)
        self.dateLabel.textColor = UIColor(red: 110/255, green: 109/255, blue: 109/255, alpha: 1)
        self.backView.addSubview(self.dateLabel)
        
        let subBackView = UIView(frame: self.backView.bounds)
        subBackView.center.x = self.backView.frame.size.width / 2
        self.backView.addSubview(subBackView)
        
        self.calendarXImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.dateLabel.frame.size.height, height: self.dateLabel.frame.size.height))
        self.calendarXImageView.center = CGPoint(x: self.dateLabel.frame.size.width / 2, y: self.dateLabel.frame.size.height / 2)
        self.calendarXImageView.image = #imageLiteral(resourceName: "calendarX")
        self.calendarXImageView.isHidden = true
        self.dateLabel.addSubview(self.calendarXImageView)
        
        var minX : CGFloat = 0
        var maxX : CGFloat = 0
//        var imageViewHeight : CGFloat = 0
//        var imageViewCenterY : CGFloat = 0
        for i in 0..<3{
            let sunImage = UIImage(named: "sun\(i+1)")!
            
            let sunImageView = UIImageView(image: sunImage)
            let sunImageViewSizeWidth = subBackView.frame.size.width / 3
            let sunImageViewSizeHeight = sunImageViewSizeWidth * (sunImage.size.height / sunImage.size.width)
//            imageViewHeight = sunImageViewSizeHeight
            sunImageView.frame = CGRect(
                x: sunImageViewSizeWidth * CGFloat(i),
                y: subBackView.frame.size.height - sunImageViewSizeHeight,
                width: sunImageViewSizeWidth,
                height: sunImageViewSizeHeight)
//            sunImageView.center.y = subBackView.frame.size.height * 33/45
//            imageViewCenterY = sunImageView.center.y
            subBackView.addSubview(sunImageView)
            
            self.sunImageViews.append(sunImageView)
            
            minX = min(minX, sunImageView.frame.origin.x)
            maxX = max(maxX, sunImageView.frame.maxX)
        }
        
        self.firstCheckView = UIImageView(frame: CGRect(x: 0, y: 0, width: 10.5, height: 13.5))
        self.firstCheckView.image = #imageLiteral(resourceName: "vectorSmartObject")
        self.firstCheckView.center = CGPoint(x: subBackView.frame.size.width / 4, y: dateLabel.center.y)
        subBackView.addSubview(self.firstCheckView)
        
        self.firstCheckView.isHidden = true
        
        self.separatorView = UIView(frame: CGRect(x: 0, y: self.backView.frame.size.height - 1, width: self.backView.frame.size.width, height: 1))
        self.separatorView.backgroundColor = #colorLiteral(red: 0.8862745098, green: 0.8862745098, blue: 0.8862745098, alpha: 1)
        self.backView.addSubview(self.separatorView)
        
        let separatorView2 = UIView(frame: CGRect(x: self.backView.frame.size.width - 1, y: 0, width: 1, height: self.backView.frame.height))
        separatorView2.backgroundColor = #colorLiteral(red: 0.8862745098, green: 0.8862745098, blue: 0.8862745098, alpha: 1)
        self.backView.addSubview(separatorView2)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
