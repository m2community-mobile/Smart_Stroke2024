//
//  BloodSugarGoalAndRateView.swift
//  KSR
//
//  Created by m2comm on 2018. 6. 27..
//  Copyright © 2018년 m2community. All rights reserved.
//

import UIKit

class BloodSugarGoalAndRateView: UIView {

    var goalView : InnerViewWith3SubTitle!
    var rateView : InnerViewWith3SubTitle!
    
    convenience init() {
        self.init(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: SCREEN.WIDTH, height: 0)))
    }
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.white
        
        self.goalView = InnerViewWith3SubTitle(frame:CGRect(
            x: 0,
            y: 0,
            width: SCREEN.WIDTH * 0.53,
            height: self.frame.size.height))
        self.goalView.backgroundColor = UIColor(red: 0.28, green: 0.67, blue: 0.94, alpha: 1)
        self.addSubview(self.goalView)
        
        self.rateView = InnerViewWith3SubTitle(frame: CGRect(
            x: SCREEN.WIDTH * 0.53,
            y: 0,
            width: SCREEN.WIDTH * 0.47,
            height: self.goalView.frame.size.height))
        self.rateView.backgroundColor = UIColor(red: 0.28, green: 0.38, blue: 0.93, alpha: 1)
        self.addSubview(self.rateView)
        
        self.frame.size.height = self.goalView.frame.size.height
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
