//
//  TopBar.swift
//  KSR
//
//  Created by m2comm on 2018. 6. 21..
//  Copyright © 2018년 m2community. All rights reserved.
//

import UIKit

@objc protocol TopBarDelegate {
    @objc optional func leftButtonPressed( button : UIButton )
    @objc optional func rightButtonPressed( button : UIButton )
    @objc optional func rightButton2Pressed( button : UIButton )
}

class TopBar: UIView {
    
    var statusBar : UIView!
    var navigationBar : UIView!
    
    var leftBackView : UIView!
    var leftButton : UIButton!
    var leftImageView : UIImageView!
    
    var rightBackView : UIView!
    var rightButton : UIButton!
    var rightImageView : UIImageView!
    
    var titleLabel : UILabel!
    
    var delegate : TopBarDelegate?
    
    var rightBackView2 : UIView?
    var rightButton2 : UIButton?
    var rightImageView2 : UIImageView?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        let topBarColor = UIColor(red: 86/255, green: 141/255, blue: 212/255, alpha: 1)
        let topBarColor = #colorLiteral(red: 0.1579108536, green: 0.1717843711, blue: 0.3275443316, alpha: 1)
        
        self.frame = CGRect(x: 0, y: 0, width: SCREEN.WIDTH, height: STATUS_BAR_HEIGHT + NAVIGATION_BAR_HEIGHT)
        
        //Status Bar
        self.statusBar = UIView(frame: CGRect(x: 0, y: 0, width: SCREEN.WIDTH, height: STATUS_BAR_HEIGHT))
        self.statusBar.backgroundColor = topBarColor
        self.addSubview(self.statusBar)
        
        //Navigation Bar
        self.navigationBar = UIView(frame: CGRect(x: 0, y: self.statusBar.frame.maxY, width: SCREEN.WIDTH, height: 50))
        self.navigationBar.backgroundColor = topBarColor
        self.addSubview(self.navigationBar)
        
        //Left
        self.leftBackView = UIView(frame: CGRect(x: 7.5, y: 0, width: 40, height: 40))
        self.navigationBar.addSubview(self.leftBackView)
        
        self.leftButton = UIButton(frame: leftBackView.bounds)
        self.leftButton.setTitleColor(UIColor.white, for: .normal)
        self.leftButton.addTarget(self, action: #selector(self.leftButtonPressed(button:)), for: .touchUpInside)
        self.leftBackView.addSubview(self.leftButton)
        
        self.leftImageView = UIImageView(frame: leftButton.bounds)
//        self.leftImageView.center = CGPoint(x: self.leftBackView.frame.size.width / 2, y: self.leftBackView.frame.size.height / 2)
        self.leftImageView.isUserInteractionEnabled = false
        self.leftButton.addSubview(self.leftImageView)
        
        //Right
        self.rightBackView = UIView(frame: CGRect(x:SCREEN.WIDTH - NAVIGATION_BAR_HEIGHT - 10, y: 0, width: NAVIGATION_BAR_HEIGHT, height: NAVIGATION_BAR_HEIGHT))
        self.navigationBar.addSubview(self.rightBackView)
        
        self.rightButton = UIButton(frame: rightBackView.bounds)
        self.rightButton.addTarget(self, action: #selector(self.rightButtonPressed(button:)), for: .touchUpInside)
        self.rightButton.setTitleColor(UIColor.white, for: .normal)
        self.rightBackView.addSubview(self.rightButton)
        
        self.rightImageView = UIImageView(frame: self.rightBackView.bounds)
        self.rightImageView.isUserInteractionEnabled = false
        self.rightButton.addSubview(self.rightImageView)
        
        //TitleLabel
        self.titleLabel = UILabel(frame: CGRect(x: self.leftButton.frame.maxX, y: 0, width: SCREEN.WIDTH - (self.leftBackView.frame.size.width + self.rightBackView.frame.size.width) - 20, height: NAVIGATION_BAR_HEIGHT))
        self.titleLabel.center.x = SCREEN.WIDTH / 2
        self.titleLabel.textAlignment = .center
        self.titleLabel.textColor = UIColor.white
        self.titleLabel.font = UIFont(name: Nanum_Barun_Gothic_OTF, size: 14)
        self.navigationBar.addSubview(self.titleLabel)
        
    }
    
    func addRightButton2() {
        //Right2
        let buttonWidth : CGFloat = NAVIGATION_BAR_HEIGHT
        self.rightBackView2 = UIView(frame: CGRect(x:SCREEN.WIDTH - (NAVIGATION_BAR_HEIGHT + buttonWidth) - 10, y: 0, width: buttonWidth, height: NAVIGATION_BAR_HEIGHT))
        self.navigationBar.addSubview(self.rightBackView2!)
        
        self.rightButton2 = UIButton(frame: rightBackView2!.bounds)
        self.rightButton?.setTitleColor(UIColor.white, for: .normal)
        self.rightButton2?.addTarget(self, action: #selector(self.rightButton2Pressed(button:)), for: .touchUpInside)
        self.rightBackView2?.addSubview(self.rightButton2!)
        
        self.rightImageView2 = UIImageView(frame: self.rightBackView2!.bounds)
        self.rightImageView2?.isUserInteractionEnabled = false
        self.rightButton2?.addSubview(self.rightImageView2!)
    }
    
    @objc func leftButtonPressed( button : UIButton ){
        self.delegate?.leftButtonPressed?(button: button)
    }
    @objc func rightButtonPressed( button : UIButton ){
        self.delegate?.rightButtonPressed?(button: button)
    }
    @objc func rightButton2Pressed( button : UIButton ){
        self.delegate?.rightButton2Pressed?(button: button)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    


}
