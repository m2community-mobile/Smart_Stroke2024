//
//  SegmentedView.swift
//  KSR
//
//  Created by m2comm on 2018. 6. 21..
//  Copyright © 2018년 m2community. All rights reserved.
//

import UIKit

@objc protocol SegmentedViewDelegate {
    @objc optional func segButtonPressed(index : Int)
}

class SegmentedView: UIView {

    var delegate : SegmentedViewDelegate?

    var itemButtons = [UIButton]()
    
    var buttonsBackView : UIView!
    
    var buttonRatios : [CGFloat] = [1/3, 1/3, 1/3]
    
    convenience init(ratios : [CGFloat] = [1/3, 1/3, 1/3]) {
        self.init(frame: CGRect(x: 0, y: 0, width: SCREEN.WIDTH, height: 50), ratios: ratios)
    }
    
    init(frame: CGRect, ratios : [CGFloat]) {
        super.init(frame: frame)
     
        self.buttonRatios = ratios
        
        self.backgroundColor = UIColor.white
        
        let leftMargin : CGFloat = 10
        let topMargin : CGFloat = 10
        self.buttonsBackView = UIView(frame: CGRect(x: leftMargin, y: topMargin, width: SCREEN.WIDTH - (leftMargin * 2), height: self.frame.size.height - (topMargin * 2)))
        self.addSubview(self.buttonsBackView)
        
    }
    
    let buttonFontSize : CGFloat = 15
    func addItems( titles : [String]){
        
        var lastX : CGFloat = 0
        for i in 0..<titles.count {
            let buttonWidth = self.buttonsBackView.frame.size.width * self.buttonRatios[i]
            let button = UIButton(frame: CGRect(x: lastX, y: 0, width: buttonWidth, height: self.buttonsBackView.frame.size.height))
            button.setTitle(titles[i], for: .normal)
            button.tag = i
            button.setTitleColor(UIColor.black, for: .normal)
            button.titleLabel?.font = UIFont(name: Nanum_Barun_Gothic_OTF_Ultra_Light, size: IS_IPHONE_SE ? 13 : 15)
            button.addTarget(self, action: #selector(itemButtonPressed(button:)), for: .touchUpInside)
            self.itemButtons.append(button)
            self.buttonsBackView.addSubview(button)
            
            
            
            if i != 0 {
                let separatorView = UIView(frame: CGRect(x: lastX, y: 0, width: 0.5, height: self.buttonsBackView.frame.size.height * 0.5))
                if self.buttonRatios[0] == 0.3 {
                    if i == 1 {
                        separatorView.center.x = self.frame.size.width * 0.26
                    }else{
                        separatorView.center.x = self.frame.size.width * 0.7
                    }
                }
                
                separatorView.backgroundColor = UIColor(white: 0.69, alpha: 1)
                separatorView.center.y = self.buttonsBackView.frame.size.height / 2
                self.buttonsBackView.addSubview(separatorView)
            }
            lastX = button.frame.maxX
            
            if i == 0 {
                button.titleLabel?.font = UIFont(name: Nanum_Barun_Gothic_OTF_Bold, size: IS_IPHONE_SE ? 13 : 15)
            }
        }
        
    }
    
    @objc func itemButtonPressed( button : UIButton ){
        
        for itemButton in self.itemButtons {
            if button == itemButton {
                itemButton.titleLabel?.font = UIFont(name: Nanum_Barun_Gothic_OTF_Bold, size: IS_IPHONE_SE ? 13 : 15)
            }else{
                itemButton.titleLabel?.font = UIFont(name: Nanum_Barun_Gothic_OTF_Ultra_Light, size: IS_IPHONE_SE ? 13 : 15)
            }
        }
        
        self.delegate?.segButtonPressed?(index: button.tag)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
