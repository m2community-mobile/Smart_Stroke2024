//약물등록리스트 약 종류 이름
//  DrugComponnentView2.swift
//  KSR
//
//  Created by m2comm on 2018. 7. 30..
//  Copyright © 2018년 m2community. All rights reserved.
//

import UIKit

class DrugComponnentView2: DrugComponnentView {

    //let drugComponnentView = DrugComponnentView(frame: CGRect(x: 0, y: CGFloat(i) * (17 + 13), width: self.frame.size.width, height: 17), drug: drugNotiInfo.drugs[i])
    
    /*
     superClasse
     var isCheck : Bool = false
     var checkButton : UIButton!
     var checkButtonImageView : UIImageView!
     var contentLabel : UILabel!
     
     var drug = Drug()
    */
    
    
    override init(frame : CGRect, drug kDrug : KindOfDrug_R) {
        super.init(frame: frame, drug: kDrug)
        
        self.checkButton.isHidden = true
        
            //받아와지는 contentLabel 라벨
        
        self.contentLabel.frame.origin.x = self.checkButton.frame.origin.x + 10
        self.contentLabel.frame.origin.y += 50
        self.contentLabel.frame.size.width = self.frame.size.width - self.contentLabel.frame.origin.x
//        self.contentLabel.text = "-"
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
