//
//  InnerViewWith3SubTitle.swift
//  KSR
//
//  Created by m2comm on 2018. 6. 21..
//  Copyright © 2018년 m2community. All rights reserved.
//

import UIKit


class InnerViewWith3SubTitle: UIView {
    
    var notiBackView : UIView!
    var notiLabel : UILabel!
    var iconImageBackView : UIView!
    var iconImageView : UIImageView!
    
    var subTitleLabels = [UILabel]()
    var valueLabels = [UILabel]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.notiBackView = UIView(frame: CGRect(x: 0, y: 15, width: self.frame.size.width, height: 28))
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
        self.notiLabel.font = UIFont.systemFont(ofSize: 16)
//        self.notiLabel.font = UIFont.systemFont(ofSize: 18)
        if IS_IPHONE_SE {
//            self.notiLabel.font = UIFont(name: Nanum_Barun_Gothic_OTF, size: 12)
            self.notiLabel.font = UIFont(name: Nanum_Barun_Gothic_OTF, size: 15)
        }
        notiBackView.addSubview(self.notiLabel)
        
        ////////
        
        let subTitleLabelHeight : CGFloat = ((IS_IPHONE_SE || IS_IPHONE_N) ? 35 : 25)
        let valueLabelHeight : CGFloat = ((IS_IPHONE_SE || IS_IPHONE_N) ? 25 : 30)
        
        var maxY : CGFloat = 0
        for i in 0..<3 {
            let subTitleLabel = UILabel(frame: CGRect(
                x: 0,
                y: (notiBackView.frame.maxY + 3) + (CGFloat(i) * (subTitleLabelHeight + valueLabelHeight + 3)),
                width: self.frame.size.width,
                height: subTitleLabelHeight))
            subTitleLabel.textColor = UIColor.white
//            subTitleLabel.font = UIFont.systemFont(ofSize: 13)
            subTitleLabel.font = UIFont.systemFont(ofSize: 16)
            if (IS_IPHONE_SE || IS_IPHONE_N) {
//                subTitleLabel.font = UIFont.systemFont(ofSize: 12)
                subTitleLabel.font = UIFont.systemFont(ofSize: 15)
                subTitleLabel.numberOfLines = 0
                subTitleLabel.lineBreakMode = .byWordWrapping
            }
            subTitleLabel.textAlignment = .center
        
            self.addSubview(subTitleLabel)
            self.subTitleLabels.append(subTitleLabel)
            
            let valueLabel = UILabel(frame: CGRect(
                x: 0,
                y: subTitleLabel.frame.maxY,
                width: self.frame.size.width, height: valueLabelHeight))
//            valueLabel.backgroundColor = UIColor.randomColor().withAlphaComponent(0.5)
            self.addSubview(valueLabel)
            self.valueLabels.append(valueLabel)
            
            maxY = valueLabel.frame.maxY + (IS_IPHONE_SE ? 10 : 15)
//            20
        }
        self.frame.size.height = maxY
        print("maxY:\(maxY)")
    }
    
    func notiLabelUpdate(text : String?, image : UIImage?) {
        
        self.iconImageView.image = image
        
        self.notiLabel.text = text ?? self.notiLabel.text
        self.notiLabel.sizeToFit()
        self.notiLabel.frame.size.height = self.notiBackView.frame.size.height
        self.notiBackView.frame.size.width = self.iconImageView.frame.size.width + self.notiLabel.frame.size.width
        self.notiBackView.center.x = self.frame.size.width / 2
    }
    
    func subTitleLabelUpdate( subTitleLabelindex : Int, titleString : String ){
        if subTitleLabelindex >= self.subTitleLabels.count {
            return
        }
        
        self.subTitleLabels[subTitleLabelindex].text = titleString
    }
    func valueLabelUpdate( labelIndex : Int, valueString : String, unitString : String){
        
        if labelIndex >= self.valueLabels.count {
            return
        }
        
        let rateStringInfos = [
            (valueString,[NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: IS_IPHONE_SE ? 15 : 25),
                    NSAttributedStringKey.foregroundColor : UIColor.white,
                    NSAttributedStringKey.paragraphStyle : centerParagraphStyle]),
            (unitString,[NSAttributedStringKey.font : UIFont.systemFont(ofSize: IS_IPHONE_SE ? 12 : 15),
                             NSAttributedStringKey.foregroundColor : UIColor.white,
                             NSAttributedStringKey.paragraphStyle : centerParagraphStyle])
            ]
            as [(String,[NSAttributedStringKey:NSObject])]
        self.valueLabels[labelIndex].attributedText = getAttributedString(stringsInfos: rateStringInfos)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


