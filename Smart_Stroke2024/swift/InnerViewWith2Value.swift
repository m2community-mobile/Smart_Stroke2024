//
//  InnerViewWith2Value.swift
//  KSR_2024
//
//  Created by m2comm on 2024/01/18.
//

import Foundation

import UIKit

class InnerViewWith2Value: UIView {

    var notiBackView : UIView!
    var notiLabel : UILabel!
    var iconImageBackView : UIView!
    var iconImageView : UIImageView!
    
    var valueLabels = [UILabel]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.notiBackView = UIView(frame: CGRect(x: 0, y: 15, width: 300, height: 28))
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
        self.notiLabel.font = UIFont(name: Nanum_Barun_Gothic_OTF, size: 15)
        if IS_IPHONE_SE {
            self.notiLabel.font = UIFont(name: Nanum_Barun_Gothic_OTF, size: 12)
        }
        notiBackView.addSubview(self.notiLabel)
        
        ////////
        
        let valueLabelHeight : CGFloat = (IS_IPHONE_SE ? 20 : 30)
        
        var maxY : CGFloat = 0
        for i in 0..<2 {

            let valueLabel = UILabel(frame: CGRect(
                x: 0,
                y: (notiBackView.frame.maxY + 3) + (CGFloat(i) * (valueLabelHeight + 3)),
                width: self.frame.size.width, height: valueLabelHeight))
            //            valueLabel.backgroundColor = UIColor.randomColor().withAlphaComponent(0.5)
            self.addSubview(valueLabel)
            self.valueLabels.append(valueLabel)
            
            maxY = valueLabel.frame.maxY + (IS_IPHONE_SE ? 10 : 15)
        }
        self.frame.size.height = maxY
    }
    
    func notiLabelUpdate(text : String?, image : UIImage?) {
        
        self.iconImageView.image = image
        
        self.notiLabel.text = text ?? self.notiLabel.text
        self.notiLabel.sizeToFit()
        self.notiLabel.frame.size.height = self.notiBackView.frame.size.height
        self.notiBackView.frame.size.width = self.iconImageView.frame.size.width + self.notiLabel.frame.size.width
        self.notiBackView.center.x = self.frame.size.width / 2
    }
    
    func valueLabelUpdate( labelIndex : Int, valueLabelString : String, valueString : String, unitString : String){
        
        if labelIndex >= self.valueLabels.count {
            return
        }
        

        
//         let rateStringInfos = [
//            (valueLabelString,[NSAttributedString.Key.font : UIFont(name: Nanum_Barun_Gothic_OTF, size: IS_IPHONE_12PRO_MAX ? 12 : 15)!,
//                               NSAttributedString.Key.foregroundColor : UIColor.white,
//                               NSAttributedString.Key.paragraphStyle : centerParagraphStyle]),
//            (valueString,[NSAttributedString.Key.font : UIFont(name: Nanum_Barun_Gothic_OTF, size: IS_IPHONE_SE ? 15 : 25)!,
//                          NSAttributedString.Key.foregroundColor : UIColor.white,
//                          NSAttributedString.Key.paragraphStyle : centerParagraphStyle]),
//            (unitString,[NSAttributedString.Key.font : UIFont(name: Nanum_Barun_Gothic_OTF, size: IS_IPHONE_SE ? 12 : 15)!,
//                         NSAttributedString.Key.foregroundColor : UIColor.white,
//                         NSAttributedString.Key.paragraphStyle : centerParagraphStyle])
//            ]
//            as [(String,[NSAttributedString.Key:NSObject])]
//        
//        self.valueLabels[labelIndex].attributedText = getAttributedString(stringsInfos: rateStringInfos)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
//    func getAttributedString( stringsInfos : [(String,[NSAttributedString.Key:NSObject])]) -> NSAttributedString {
//        
//        print("33")
//        
//        var targetString = ""
//        for i in 0..<stringsInfos.count {
//            targetString = "\(targetString)\(stringsInfos[i].0)"
//        }
//        
//        let attributedString = NSMutableAttributedString(string: targetString)
//        for i in 0..<stringsInfos.count {
//            var startIndex = 0
//            if (i) > 0 {
//                for j in 0..<i {
//                    startIndex += stringsInfos[j].0.count
//                }
//                
//            }
//            attributedString.setAttributes(stringsInfos[i].1, range: NSMakeRange(startIndex, stringsInfos[i].0.count))
//        }
//        return attributedString
//    }
}
