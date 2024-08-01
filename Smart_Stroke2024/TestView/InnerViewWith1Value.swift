//
//  InnerView.swift
//  KSR
//
//  Created by m2comm on 2018. 6. 21..
//  Copyright © 2018년 m2community. All rights reserved.
//

import UIKit

class InnerViewWith1Value: UIView {
    
    var valueLabel : UILabel!
    var notiBackView : UIView!
    var notiLabel : UILabel!
    var iconImageBackView : UIView!
    var iconImageView : UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let notiBackViewHeightRatio : CGFloat = 0.25
        let notiBackViewCenterYRatio : CGFloat = 0.27
        
        self.notiBackView = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height * notiBackViewHeightRatio))
        self.notiBackView.center.y = self.frame.size.height * notiBackViewCenterYRatio
        self.addSubview(self.notiBackView)
        
        self.iconImageBackView = UIView(frame: CGRect(x: 0, y: 0, width: notiBackView.frame.size.height, height: notiBackView.frame.size.height))
        notiBackView.addSubview(self.iconImageBackView)
        
        //사이즈 확대
//        let imageViewEnlargementRatio : CGFloat = 1.5
        self.iconImageView = UIImageView(frame: self.iconImageBackView.bounds)
        self.iconImageView.frame.size = CGSize(
//            width: self.iconImageBackView.frame.size.width * imageViewEnlargementRatio,
//            height: self.iconImageBackView.frame.size.height * imageViewEnlargementRatio)
        width: 16,
        height: 16)
        self.iconImageView.center = CGPoint(x: self.iconImageBackView.frame.size.width / 2, y: self.iconImageBackView.frame.size.height / 2)
        self.iconImageView.contentMode = .scaleAspectFit
        self.iconImageBackView.addSubview(self.iconImageView)
        
        self.notiLabel = UILabel(frame: CGRect(x: self.iconImageBackView.frame.size.width, y: 0, width: notiBackView.frame.size.width - self.iconImageBackView.frame.size.width , height: notiBackView.frame.size.height))
        self.notiLabel.textColor = UIColor.white
        self.notiLabel.font = UIFont.systemFont(ofSize: 14)
        if IS_IPHONE_SE {
            self.notiLabel.font = UIFont.systemFont(ofSize: 12)
        }
        notiBackView.addSubview(self.notiLabel)
        
        
        let valueLabelHeightRatio : CGFloat = 0.3
        let valueLabelCenterYRatio : CGFloat = 0.65
        
        self.valueLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height * valueLabelHeightRatio))
        self.valueLabel.center.y = self.frame.size.height * valueLabelCenterYRatio
        self.addSubview(self.valueLabel)
        
        //test
        //            notiBackView.backgroundColor = randomColor().withAlphaComponent(0.2)
        //            valueLabel.backgroundColor = randomColor().withAlphaComponent(0.2)
        //            notiBackView.backgroundColor = randomColor().withAlphaComponent(0.2)
        //            valueLabel.backgroundColor = randomColor().withAlphaComponent(0.2)
        //            iconImageView.backgroundColor = randomColor().withAlphaComponent(0.3)
        //            notiLabel.backgroundColor = randomColor().withAlphaComponent(0.3)
    }
    
    func notiLabelUpdate(text : String?, image : UIImage?) {
        
        self.iconImageView.image = image
        
        self.notiLabel.text = text ?? self.notiLabel.text
        self.notiLabel.sizeToFit()
        self.notiLabel.frame.size.height = self.notiBackView.frame.size.height
        self.notiBackView.frame.size.width = self.iconImageView.frame.size.width + self.notiLabel.frame.size.width
        self.notiBackView.center.x = self.frame.size.width / 2
    }
    
//    func valueUpdate(attibutedString : NSAttributedString) {
//        self.valueLabel.attributedText = attibutedString
//    }
//
    
    func valueLabelUpdate(valueString : String, unitString : String){
        
        let rateStringInfos = [
            (valueString,[NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: IS_IPHONE_SE ? 20:30),
                          NSAttributedString.Key.foregroundColor : UIColor.white,
                          NSAttributedString.Key.paragraphStyle : centerParagraphStyle]),
            (unitString,[NSAttributedString.Key.font : UIFont.systemFont(ofSize: IS_IPHONE_SE ? 12 : 15),
                         NSAttributedString.Key.foregroundColor : UIColor.white,
                         NSAttributedString.Key.paragraphStyle : centerParagraphStyle])
            ]
        as [(String,[NSAttributedString.Key:NSObject])]
        self.valueLabel.attributedText = getAttributedString(stringsInfos: rateStringInfos)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}






