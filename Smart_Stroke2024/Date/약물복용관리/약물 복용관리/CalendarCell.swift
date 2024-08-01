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
//    var colorViewBack: UIView!
    
    var sunImageViews = [UIImageView]()
    var calendarXImageView : UIImageView!
    
    var firstCheckView : UIImageView!
    
    private var separatorView : UIView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backView = UIView(frame: CGRect(x: 0, y: 0, width: (SCREEN.WIDTH / 7) - 6, height: SCREEN.WIDTH / 7))
        backView.center = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height / 2)
        
//        backView.layer.addBorder([.left], color: .lightGray, width: 0.5)
        backView.layer.borderColor = UIColor.lightGray.cgColor
//        backView.layer.borderColor = #colorLiteral(red: 0.3016270101, green: 0.5582068563, blue: 0.8151627183, alpha: 1)
        
        backView.layer.borderWidth = 0.3
        self.addSubview(backView)
        
        self.colorView = UIView(frame: self.backView.bounds)
        self.colorView.frame.size.height = 35
        self.colorView.frame.size.width = self.colorView.frame.size.width + 2
        self.backView.addSubview(self.colorView)
        
        self.colorView.backgroundColor = #colorLiteral(red: 0.3016270101, green: 0.5582068563, blue: 0.8151627183, alpha: 1)
        
//        self.colorViewBack = UIView(frame: self.colorView.bounds)
//        self.colorViewBack.frame.size.height = 35
//        
//        self.colorView.addSubview(colorViewBack)
        
        
        self.dateLabel = UILabel(frame: CGRect(x: 0, y: 13, width: backView.frame.size.width, height: 15))
        self.dateLabel.center.x = backView.frame.size.width / 2
        self.dateLabel.center.y = self.backView.frame.size.height * 17/45
        self.dateLabel.textAlignment = .center
//        self.dateLabel.backgroundColor = #colorLiteral(red: 0.3016270101, green: 0.5582068563, blue: 0.8151627183, alpha: 1)
        self.dateLabel.font = UIFont(name: Nanum_Barun_Gothic_OTF, size: 14.8)
        self.dateLabel.textColor = UIColor(red: 110/255, green: 109/255, blue: 109/255, alpha: 1)
        self.backView.addSubview(self.dateLabel)
        
        let subBackView = UIView(frame: self.backView.bounds)
        subBackView.center.x = self.backView.frame.size.width / 2
        self.backView.addSubview(subBackView)
        
        self.calendarXImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.dateLabel.frame.size.height, height: self.dateLabel.frame.size.height))

        
        
//        if IS_IPHONE_12PRO_MAX {
//            self.calendarXImageView.center = CGPoint(x: self.dateLabel.frame.size.width / 2, y: self.dateLabel.frame.size.height / 2)
//        } else if IS_IPHONE_15PRO_MAX {
//            self.calendarXImageView.center = CGPoint(x: self.dateLabel.frame.size.width / 2, y: self.dateLabel.frame.size.height / 2)
//        } else {
            self.calendarXImageView.center = CGPoint(x: self.dateLabel.frame.size.width / 2, y: self.dateLabel.frame.size.height / 2)
//        }
        
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
                width: sunImageViewSizeWidth * 0.75,
                height: sunImageViewSizeHeight * 0.75)
//            sunImageView.center.y = subBackView.frame.size.height * 33/45
//            imageViewCenterY = sunImageView.center.y
            subBackView.addSubview(sunImageView)
//            subBackView.backgroundColor = .white
//            sunImageView.backgroundColor = .white
            
            self.sunImageViews.append(sunImageView)
            
            minX = min(minX, sunImageView.frame.origin.x)
            maxX = max(maxX, sunImageView.frame.maxX)
            if IS_IPHONE_12PRO_MAX {
                if i == 0 {
                    sunImageView.frame.origin.y = 43
                    sunImageView.frame.origin.x = 3
                    sunImageView.frame.size.width = sunImageView.frame.size.width * 1.2
                    sunImageView.frame.size.height = sunImageView.frame.size.height * 1.2
                }
                
                if i == 1 {
                    //                sunImageView.frame.origin.y =
                    sunImageView.frame.origin.x = (self.frame.size.width / 2) + 6
                    sunImageView.frame.size.width = sunImageView.frame.size.width * 0.7
                    sunImageView.frame.size.height = sunImageView.frame.size.height * 0.7
                }
                if i == 2 {
                    //                sunImageView.frame.origin.y =
                    sunImageView.frame.origin.x = 41
                    sunImageView.frame.size.width = sunImageView.frame.size.width * 0.7
                    sunImageView.frame.size.height = sunImageView.frame.size.height * 0.7
                }
            }
            if IS_IPHONE_15PRO_MAX {
                if i == 0 {
                    sunImageView.frame.origin.y = 43
                    sunImageView.frame.origin.x = 3
                    sunImageView.frame.size.width = sunImageView.frame.size.width * 1.2
                    sunImageView.frame.size.height = sunImageView.frame.size.height * 1.2
                }
                
                if i == 1 {
                    //                sunImageView.frame.origin.y =
                    sunImageView.frame.origin.x = (self.frame.size.width / 2) + 6
                    sunImageView.frame.size.width = sunImageView.frame.size.width * 0.7
                    sunImageView.frame.size.height = sunImageView.frame.size.height * 0.7
                }
                if i == 2 {
                    //                sunImageView.frame.origin.y =
                    sunImageView.frame.origin.x = 41
                    sunImageView.frame.size.width = sunImageView.frame.size.width * 0.7
                    sunImageView.frame.size.height = sunImageView.frame.size.height * 0.7
                }
            }
            
            if IS_IPHONE_N_PLUS {
                if i == 0 {
                    sunImageView.frame.origin.y = 40
                    sunImageView.frame.size.width = sunImageView.frame.size.width * 1.2
                    sunImageView.frame.size.height = sunImageView.frame.size.height * 1.2
                }
                
                if i == 1 {
                                    sunImageView.frame.origin.y = 40
                    sunImageView.frame.size.width = sunImageView.frame.size.width * 0.8
                    sunImageView.frame.size.height = sunImageView.frame.size.height * 0.8
                }
                if i == 2 {
                                    sunImageView.frame.origin.y = 40
                    sunImageView.frame.size.width = sunImageView.frame.size.width * 0.8
                    sunImageView.frame.size.height = sunImageView.frame.size.height * 0.8
                }
            }
            
            if IS_IPHONE_12PRO {
                if i == 0 {
                    sunImageView.frame.origin.y = 40
                    sunImageView.frame.origin.x = 1
                    sunImageView.frame.size.width = sunImageView.frame.size.width * 1.2
                    sunImageView.frame.size.height = sunImageView.frame.size.height * 1.2
                }
                
                if i == 1 {
                                    sunImageView.frame.origin.y = 40
                    sunImageView.frame.origin.x = (self.frame.size.width / 2) + 5
                    sunImageView.frame.size.width = sunImageView.frame.size.width * 0.8
                    sunImageView.frame.size.height = sunImageView.frame.size.height * 0.8
                }
                if i == 2 {
                                    sunImageView.frame.origin.y = 40
                    sunImageView.frame.origin.x = 38
                    sunImageView.frame.size.width = sunImageView.frame.size.width * 0.8
                    sunImageView.frame.size.height = sunImageView.frame.size.height * 0.75
                }
            }
            if IS_IPHONE_15PRO {
                if i == 0 {
                    sunImageView.frame.origin.y = 40
                    sunImageView.frame.origin.x = 1
                    sunImageView.frame.size.width = sunImageView.frame.size.width * 1.2
                    sunImageView.frame.size.height = sunImageView.frame.size.height * 1.2
                }
                
                if i == 1 {
                                    sunImageView.frame.origin.y = 40
                    sunImageView.frame.origin.x = (self.frame.size.width / 2) + 5
                    sunImageView.frame.size.width = sunImageView.frame.size.width * 0.8
                    sunImageView.frame.size.height = sunImageView.frame.size.height * 0.8
                }
                if i == 2 {
                                    sunImageView.frame.origin.y = 40
                    sunImageView.frame.origin.x = 38
                    sunImageView.frame.size.width = sunImageView.frame.size.width * 0.8
                    sunImageView.frame.size.height = sunImageView.frame.size.height * 0.75
                }
            }
            if IS_IPHONE_N_PLUS {
                if i == 0 {
                    sunImageView.frame.origin.y = 40
                    sunImageView.frame.origin.x = 2
                    sunImageView.frame.size.width = sunImageView.frame.size.width
                    sunImageView.frame.size.height = sunImageView.frame.size.height
                }
                
                if i == 1 {
                                    sunImageView.frame.origin.y = 40
                    sunImageView.frame.origin.x = (self.frame.size.width / 2) + 6
                    sunImageView.frame.size.width = sunImageView.frame.size.width * 0.8
                    sunImageView.frame.size.height = sunImageView.frame.size.height * 0.8
                }
                if i == 2 {
                                    sunImageView.frame.origin.y = 40
                    sunImageView.frame.origin.x = 40
                    sunImageView.frame.size.width = sunImageView.frame.size.width * 0.8
                    sunImageView.frame.size.height = sunImageView.frame.size.height * 0.8
                }
            }
            if IS_IPHONE_N {
                if i == 0 {
                    sunImageView.frame.origin.y = 40
                    sunImageView.frame.size.width = sunImageView.frame.size.width * 1.2
                    sunImageView.frame.size.height = sunImageView.frame.size.height * 1.2
                }
                
                if i == 1 {
                                    sunImageView.frame.origin.y = 40
                    sunImageView.frame.size.width = sunImageView.frame.size.width * 0.8
                    sunImageView.frame.size.height = sunImageView.frame.size.height * 0.8
                }
                if i == 2 {
                                    sunImageView.frame.origin.y = 40
                    sunImageView.frame.size.width = sunImageView.frame.size.width * 0.8
                    sunImageView.frame.size.height = sunImageView.frame.size.height * 0.8
                }
            }
            
            
            
            
        }
        
        self.firstCheckView = UIImageView(frame: CGRect(x: 0, y: 0, width: 10.5, height: 13.5))
//        self.firstCheckView.image = #imageLiteral(resourceName: "go1")
        self.firstCheckView.image = #imageLiteral(resourceName: "start")
        
        
        if self.firstCheckView.isHidden == false {
             sunImageViews[0].isHidden = true
                 sunImageViews[1].isHidden = true
                 sunImageViews[2].isHidden = true
        }
        
        
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
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        firstCheckView.isHidden = true
        calendarXImageView.isHidden = true
    }
    
}
