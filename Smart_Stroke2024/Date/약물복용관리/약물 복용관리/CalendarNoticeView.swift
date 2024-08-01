//
//  CalendarNoticeView.swift
//  KSR
//
//  Created by m2comm on 2018. 8. 9..
//  Copyright © 2018년 m2community. All rights reserved.
//

import UIKit

class CalendarNoticeView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let view1 = UIView(frame: CGRect(x: 13, y: 13, width: SCREEN.WIDTH - 13 - 13, height: 13))
        
        self.addSubview(view1)

//        let view1Images = [#imageLiteral(resourceName: "icMorningBlack"),#imageLiteral(resourceName: "icAfternoonBlack"),#imageLiteral(resourceName: "icNightBlack")]
        
        let view1Images = [UIImage(named: "mo"),UIImage(named: "lu"),UIImage(named: "di")]
        let view1Strings = ["아침약 복용","점심약 복용","저녁약 복용"]
        for i in 0..<3 {
            let imageV1 = UIImageView(image: view1Images[i])
            imageV1.frame.origin.x = CGFloat(i) * 100
            imageV1.frame.size = CGSize(width: imageV1.frame.size.width * 0.8, height: imageV1.frame.size.height * 0.8)
            imageV1.center.y = view1.frame.size.height / 2
            view1.addSubview(imageV1)
            
            let label1 = UILabel()
//            label1.font = UIFont(name: Nanum_Barun_Gothic_OTF, size: 12)
            label1.text = view1Strings[i]
            label1.font = UIFont(name: "SUITE-Regular", size: 12)
            label1.sizeToFit()
            label1.frame.origin.x = imageV1.frame.maxX + 4
            view1.addSubview(label1)
        }
        
        let view2 = UIView(frame: CGRect(x: 13, y: view1.frame.maxY + 13, width: SCREEN.WIDTH - 13 - 13, height: 13))
        self.addSubview(view2)
        
        let view2Images = [UIImage(named: "start"), UIImage(named: "miss")]
        let view2Strings = ["약복용 시작일","약 안먹은날"]
        for i in 0..<2 {
            let imageV1 = UIImageView(image: view2Images[i])
            imageV1.frame.origin.x = CGFloat(i) * 100
            imageV1.frame.size = CGSize(width: imageV1.frame.size.width * 0.8, height: imageV1.frame.size.height * 0.8)
            imageV1.center.y = view1.frame.size.height / 2
            view2.addSubview(imageV1)
            
            let label1 = UILabel()
//            label1.font = UIFont(name: Nanum_Barun_Gothic_OTF, size: 12)
            label1.font = UIFont(name: "SUITE-Regular", size: 12)
            label1.text = view2Strings[i]
            label1.sizeToFit()
            label1.frame.origin.x = imageV1.frame.maxX + 4
            view2.addSubview(label1)
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
