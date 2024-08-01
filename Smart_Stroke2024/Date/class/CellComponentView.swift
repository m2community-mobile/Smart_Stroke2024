//
//  CellComponentView.swift
//  KSR
//
//  Created by m2comm on 2018. 6. 21..
//  Copyright © 2018년 m2community. All rights reserved.
//

import UIKit

class CellComponentView: UIView {

    
    var notiLabel : UILabel!
    var valueLabel : UILabel!
    
    static let height : CGFloat = 50
    static let width : CGFloat  = 150
    
    convenience init(origin : CGPoint) {
        
        self.init(frame: CGRect(origin: origin, size: CGSize(width: CellComponentView.width, height: CellComponentView.height)))
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        let heightRatio : CGFloat = 0.48
        self.notiLabel = UILabel(frame: CGRect(
            x: 10,
            y: 4,
            width: self.frame.size.width,
            height: self.frame.size.height * heightRatio))
        self.notiLabel.textColor = UIColor(red: 0.58, green: 0.58, blue: 0.66, alpha: 1)
        self.notiLabel.font = UIFont.systemFont(ofSize: 15)
        
        
        self.notiLabel.font = UIFont(name: "SUITE-Regular", size: 16)
        self.addSubview(self.notiLabel)
        
        self.valueLabel = UILabel(frame: CGRect(
            x: 10,
            y: self.frame.size.height * heightRatio + 3,
            width: self.frame.size.width,
//            height: self.frame.size.height * (1 - heightRatio)) )
            height: 30) )
        self.valueLabel.font = UIFont.boldSystemFont(ofSize: 17)
        self.valueLabel.font = UIFont(name: "SUITE-Regular", size: 30)
        self.addSubview(self.valueLabel)
        
        //sampleValue
//        self.notiLabel.text = "총 콜레스테롤"
//        self.valueLabel.text = "80mg/dl"
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}



