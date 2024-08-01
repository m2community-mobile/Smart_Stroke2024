//약물등록리스트약목명//
//  DrugComponnentView.swift
//  KSR
//
//  Created by m2comm on 2018. 7. 30..
//  Copyright © 2018년 m2community. All rights reserved.
//

import UIKit

class DrugComponnentView : UIButton {
// drug check
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
            width: self.frame.size.height * 3,
            height: self.frame.size.height + 10))
        checkButton.layer.borderColor = UIColor(white: 0.5, alpha: 1).cgColor
        checkButton.isSelected = true
        checkButton.titleLabel?.font = UIFont(name: "SUITE-Regular", size: 10)
        checkButton.addTarget(self, action: #selector(checkButtonPressed(button:)), for: .touchUpInside)
        self.addTarget(event: .touchUpInside) { (button : UIButton) in
            self.checkButtonPressed(button: self.checkButton)
        }
        self.addSubview(checkButton)
        
//        checkButtonImageView = UIImageView(frame: checkButton.bounds)
//        
//        checkButtonImageView.isUserInteractionEnabled = false
//        checkButtonImageView.image = #imageLiteral(resourceName: "check")
//        checkButton.addSubview(checkButtonImageView)
        
        
        let checkImage = #imageLiteral(resourceName: "check2")
        checkButtonImageView = UIImageView(image: checkImage)
        checkButtonImageView.frame = CGRect(x: 10, y: 0, width: 8, height: 8)
        checkButtonImageView.center.y = checkButton.frame.size.height / 2
        checkButtonImageView.isUserInteractionEnabled = false
        checkButton.addSubview(checkButtonImageView)

        let checkButtonTitleLabel = UILabel(frame: CGRect(x: checkButtonImageView.frame.maxX, y: 0, width: checkButton.frame.size.width - checkButtonImageView.frame.maxX, height: checkButton.frame.size.height))
        checkButtonTitleLabel.textAlignment = .center
        checkButtonTitleLabel.font = UIFont(name: "SUITE-Regular", size: 13)
//        checkButtonTitleLabel.font = UIFont(name: Nanum_Barun_Gothic_OTF, size: 13)
        checkButtonTitleLabel.textColor = UIColor.blue
        checkButtonTitleLabel.text = ""
        checkButton.addSubview(checkButtonTitleLabel)
        
        
        
        
        
        
        contentLabel = UILabel(frame: CGRect(x: checkButton.frame.maxX + 13, y: 5, width: self.frame.size.width - checkButton.frame.maxX, height: self.frame.size.height))
        //제발 여기
//        contentLabel.text = drug.name
        
        
        
        
        //약물등록리스트항목테스트변경
        contentLabel.text = drug.name
//        contentLabel.text = "999"
        
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
            checkButton.setTitle("    복용", for: .normal)
//            checkButton.backgroundColor = UIColor(red: 60/255, green: 125/255, blue: 211/255, alpha: 1)
//            checkButton.titleLabel?.font = UIFont(name: "SUITE-Regular", size: 10)
            checkButton.setTitleColor(#colorLiteral(red: 0.1000427678, green: 0.2869965434, blue: 0.7944904566, alpha: 1), for: .normal)
            checkButton.layer.borderColor = UIColor(red: 0.1000427678, green: 0.2869965434, blue: 0.7944904566, alpha: 1).cgColor
            
            checkButton.layer.borderWidth = 1
            checkButtonImageView.isHidden = false
            
            
            
        }else{
            checkButton.setTitle("복용전", for: .normal)
//            checkButton.titleLabel?.font = UIFont(name: "SUITE-Regular", size: 10)
            checkButton.setTitleColor(.lightGray, for: .normal)
            checkButton.backgroundColor = UIColor.white
            checkButton.layer.borderColor = UIColor.lightGray.cgColor
            checkButton.layer.borderWidth = 1
            checkButtonImageView.isHidden = true
            
        }
        self.isCheck = button.isSelected
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
