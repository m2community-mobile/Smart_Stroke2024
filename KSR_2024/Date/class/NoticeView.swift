//
//  NoticeView.swift
//  KSR
//
//  Created by m2comm on 2018. 7. 11..
//  Copyright © 2018년 m2community. All rights reserved.
//

import UIKit

class NoticeView: UIView {

    static let height : CGFloat = 70 + SAFE_AREA
    
    convenience init(origin : CGPoint) {
        self.init(frame: CGRect(origin: origin, size: CGSize(width: SCREEN.WIDTH, height: NoticeView.height)))
    }
    
    
    var noticeLabel : UILabel!
    var noticeValueLabel : UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor(red: 59/255, green: 77/255, blue: 91/255, alpha: 1)
        
        noticeLabel = UILabel(frame: CGRect(x: 20, y: 12, width: 49, height: 19))
        noticeLabel.text = "NOTICE"
        noticeLabel.textAlignment = .center
        noticeLabel.font = UIFont(name: ROBOTO_BOLD, size: 10)
        noticeLabel.textColor = UIColor.white
        noticeLabel.layer.borderWidth = 1
        noticeLabel.layer.borderColor = UIColor.white.withAlphaComponent(0.2).cgColor
        self.addSubview(noticeLabel)
        
        noticeValueLabel = UILabel(frame: CGRect(x: 20, y: noticeLabel.frame.maxY + 9, width: SCREEN.WIDTH - 40, height: 13))
//        noticeValueLabel.text = "뇌졸중 예후 예측 관리시스템이 오픈했습니다."
        noticeValueLabel.textColor = UIColor.white
        noticeValueLabel.font = UIFont(name: Nanum_Barun_Gothic_OTF_Light, size: 13)
        self.addSubview(noticeValueLabel)
        
        
        self.noticeUpdate()
    }
    
    func noticeUpdate(){
        Server.getData(type: .GET_NOTICE, otherInfo: nil) { (kData : Data?) in
            if let data = kData {
                if let noticeString = data.toString() {
                    self.noticeValueLabel.text = noticeString
                }
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
