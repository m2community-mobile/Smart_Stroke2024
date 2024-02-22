//
//  GoalAndRateView.swift
//  KSR
//
//  Created by m2comm on 2018. 6. 21..
//  Copyright © 2018년 m2community. All rights reserved.
//

import UIKit

class GoalAndRateView_1Value: UIView {

    
//    var goalValueLabel : UILabel!
//    var rateValueLabel : UILabel!
    
    var goalView : InnerViewWith1Value!
    var rateView : InnerViewWith1Value!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.white
        self.frame = CGRect(x: 0, y: 0, width: SCREEN.WIDTH, height: 90)
        
        self.goalView = InnerViewWith1Value(frame: CGRect(x: 0, y: 0, width: SCREEN.WIDTH * 0.53, height: self.frame.size.height))
        self.goalView.backgroundColor = UIColor(red: 0.28, green: 0.67, blue: 0.94, alpha: 1)
        self.addSubview(self.goalView)
        
        self.rateView = InnerViewWith1Value(frame: CGRect(x: SCREEN.WIDTH * 0.53, y: 0, width: SCREEN.WIDTH * 0.47, height: self.frame.size.height))
        self.rateView.backgroundColor = UIColor(red: 0.28, green: 0.38, blue: 0.93, alpha: 1)
        self.addSubview(self.rateView)
        
        self.rateView.frame.size.height = max(self.goalView.frame.size.height,self.rateView.frame.size.height)
        self.goalView.frame.size.height = max(self.goalView.frame.size.height,self.rateView.frame.size.height)
        
    }
    
   
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}
