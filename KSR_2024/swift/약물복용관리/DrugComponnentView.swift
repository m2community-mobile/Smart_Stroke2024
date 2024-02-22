//
//  DrugComponnentView.swift
//  KSR
//
//  Created by m2comm on 2018. 7. 30..
//  Copyright © 2018년 m2community. All rights reserved.
//

import UIKit

class DrugComponnentView : UIButton {
    
    var isCheck : Bool = false
    var checkButton : UIButton!
    var checkButtonImageView : UIImageView!
    var contentLabel : UILabel!

    var drug = KindOfDrug_R()
    
    init(frame : CGRect, drug kDrug : KindOfDrug_R) {
        super.init(frame: frame)
        
        self.drug = kDrug
        
        checkButton = UIButton(frame: CGRect(
            x: 14.5,
            y: 0,
            width: self.frame.size.height,
            height: self.frame.size.height))
        checkButton.layer.borderColor = UIColor(white: 0.5, alpha: 1).cgColor
        checkButton.isSelected = true
        checkButton.addTarget(self, action: #selector(checkButtonPressed(button:)), for: .touchUpInside)
        self.addTarget(event: .touchUpInside) { (button : UIButton) in
            self.checkButtonPressed(button: self.checkButton)
        }
        self.addSubview(checkButton)
        
        checkButtonImageView = UIImageView(frame: checkButton.bounds)
        checkButtonImageView.isUserInteractionEnabled = false
        checkButtonImageView.image = #imageLiteral(resourceName: "btn_d_check1")
        checkButton.addSubview(checkButtonImageView)
        
        contentLabel = UILabel(frame: CGRect(x: checkButton.frame.maxX + 13, y: 0, width: self.frame.size.width - checkButton.frame.maxX, height: self.frame.size.height))
        contentLabel.text = drug.name
//        if drug.name == "기타" {
//            if let etcDrug = drug.drugs.first {
//                 contentLabel.text = etcDrug.name
//            }
//        }
        contentLabel.font = UIFont(name: Nanum_Barun_Gothic_OTF, size: 14)
        self.addSubview(contentLabel)
        
        checkButtonPressed(button: checkButton)
    }
    
    @objc func checkButtonPressed(button : UIButton ){
        button.isSelected = !button.isSelected
        
        if button.isSelected {
            checkButton.backgroundColor = UIColor(red: 60/255, green: 125/255, blue: 211/255, alpha: 1)
            checkButton.layer.borderWidth = 0
            checkButtonImageView.isHidden = false
        }else{
            checkButton.backgroundColor = UIColor.white
            checkButton.layer.borderWidth = 1
            checkButtonImageView.isHidden = true
        }
        self.isCheck = button.isSelected
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
