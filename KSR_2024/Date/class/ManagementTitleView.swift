//
//  ManagementTitleView.swift
//  KSR
//
//  Created by m2comm on 2018. 6. 22..
//  Copyright © 2018년 m2community. All rights reserved.
//

import UIKit

@objc protocol ManagementTitleViewDelegate {
    @objc optional func expendButtonPressed( button : UIButton )
}

class ManagementTitleView: UIView {
    
    var numberView : ManagementTitleSubView!
    
    var genderView : ManagementTitleSubView!
    
    var ageView : ManagementTitleSubView!
    
    var expendButton : UIButton!
    
    var expendButtonImageView : UIImageView!
    
    var delegate : ManagementTitleViewDelegate?
    
    convenience init() {
        self.init(frame: CGRect(x: 0, y: 0, width: SCREEN.WIDTH, height: 70))
    }
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
        
//        245 246 249
        self.backgroundColor = UIColor(red: 245/255, green: 246/255, blue: 249/255, alpha: 1)
        
//        let ratios : [CGFloat] = [0.35,0.25,0.25,0.15]
        let ratios : [CGFloat] = [0.4,0.3,0.3,0]
        
        self.numberView = ManagementTitleSubView(frame: CGRect(
            x: 0,
            y: 0,
            width: (SCREEN.WIDTH * ratios[0]),
            height: self.frame.size.height))
        self.addSubview(self.numberView)
        
        self.genderView = ManagementTitleSubView(frame: CGRect(
            x: (SCREEN.WIDTH * (ratios[0])),
            y: 0,
            width: (SCREEN.WIDTH * ratios[1]),
            height: self.frame.size.height))
        self.addSubview(self.genderView)
        
        self.ageView = ManagementTitleSubView(frame: CGRect(
            x: (SCREEN.WIDTH * (ratios[0] + ratios[1])),
            y: 0,
            width: (SCREEN.WIDTH * ratios[2]),
            height: self.frame.size.height))
        self.addSubview(self.ageView)
        
        let buttonView = UIView(frame: CGRect(
            x: (SCREEN.WIDTH * (ratios[0] + ratios[1] + ratios[2])),
            y: 0,
            width: (SCREEN.WIDTH * ratios[3]),
            height: self.frame.size.height))
        self.addSubview(buttonView)
        
        for i in 0..<ratios.count - 1{
            let separatorView = UIView(frame: CGRect(x: 0, y: 0, width: 0.5, height: 50))
            separatorView.center.y = self.frame.size.height / 2
            separatorView.backgroundColor = UIColor(white: 220/255, alpha: 1)
            var ratio : CGFloat = 0
            for j in 0..<i {
                ratio += ratios[j]
            }
            separatorView.center.x = SCREEN.WIDTH * ratio
            self.addSubview(separatorView)
        }
        
        
//        self.expendButton = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
//        self.expendButton.layer.cornerRadius = self.expendButton.frame.size.height / 2
//        self.expendButton.backgroundColor = UIColor(red: 86/255, green: 141/255, blue: 212/255, alpha: 1)
//        self.expendButton.center = CGPoint(x: buttonView.frame.size.width / 2, y: buttonView.frame.size.height / 2)
//        self.expendButton.isSelected = false
//        self.expendButton.addTarget(self, action: #selector(expendButtonPressed(button:)), for: .touchUpInside)
//        buttonView.addSubview(self.expendButton)
//
//        let expendButtonImage = #imageLiteral(resourceName: "btn_d_down")
//        self.expendButtonImageView = UIImageView(image: expendButtonImage)
//        self.expendButtonImageView.frame = self.expendButton.bounds
//        self.expendButtonImageView.isUserInteractionEnabled = false
//        self.expendButton.addSubview(self.expendButtonImageView)
        
        //        self.numberView.backgroundColor = UIColor.randomColor().withAlphaComponent(0.1)
        //        self.genderView.backgroundColor = UIColor.randomColor().withAlphaComponent(0.1)
        //        self.ageView.backgroundColor = UIColor.randomColor().withAlphaComponent(0.1)
        
        
        
        //sampleData
        self.numberView.titleLabel.text = "등록번호"
        self.numberView.valueLabel.text = "HS-06475-1"
        
        self.genderView.titleLabel.text = "성별"
        self.genderView.valueLabel.text = "M"
        
        self.ageView.titleLabel.text = "발병나이"
        self.ageView.valueLabel.text = "만 69세"
        
    }
    
//    @objc func expendButtonPressed( button : UIButton ){
//        button.isSelected = !button.isSelected
//        if button.isSelected {
//            self.expendButtonImageView.image = #imageLiteral(resourceName: "btn_d_up")
//        }else{
//            self.expendButtonImageView.image = #imageLiteral(resourceName: "btn_d_down")
//        }
//
//        self.delegate?.expendButtonPressed?(button: button)
//    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class ManagementTitleSubView: UIView {
    
    fileprivate var titleLabel : UILabel!
    var valueLabel : UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let labelHeight : CGFloat = 20
        
        let titleLabelBackView = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height / 2))
        self.addSubview(titleLabelBackView)
        
        self.titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.size.width, height: labelHeight))
        self.titleLabel.frame.origin.y = titleLabelBackView.frame.size.height - self.titleLabel.frame.size.height
        self.titleLabel.textAlignment = .center
        self.titleLabel.font = UIFont(name: Nanum_Barun_Gothic_OTF_Ultra_Light, size: 12)
        titleLabelBackView.addSubview(self.titleLabel)
        
        let valueLabelBackView = UIView(frame: CGRect(x: 0, y: self.frame.size.height / 2, width: self.frame.size.width, height: self.frame.size.height / 2))
        self.addSubview(valueLabelBackView)
        
        self.valueLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.size.width, height: labelHeight))
        self.valueLabel.textAlignment = .center
        self.valueLabel.font = UIFont(name: Nanum_Barun_Gothic_OTF_Bold, size: 15)
        valueLabelBackView.addSubview(valueLabel)
        
        //        self.titleLabel.backgroundColor = UIColor.randomColor()
        //        self.valueLabel.backgroundColor = UIColor.randomColor()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



