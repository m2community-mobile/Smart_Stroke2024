//
//  CancelAndSaveButtonView.swift
//  KSR
//
//  Created by m2comm on 2018. 6. 25..
//  Copyright © 2018년 m2community. All rights reserved.
//

import UIKit

@objc protocol CancelAndSaveButtonViewDelegate {
    @objc optional func cancelButtonPressed(button : UIButton)
    @objc optional func saveButtonPressed(button : UIButton)
}

class CancelAndSaveButtonView: UIView{
 
    var delegate : CancelAndSaveButtonViewDelegate?
    
    enum ButtonType {
        case full
        case notFull
    }
    
    convenience init(type :  ButtonType ) {
        self.init(frame: CGRect(x: 0, y: 0, width: SCREEN.WIDTH, height: 41), type : type)
    }
    
    var cancelButton : UIButton!
    var saveButton : UIButton!
    
    private init(frame: CGRect, type : ButtonType) {
        super.init(frame: frame)

        self.backgroundColor = UIColor.white
        
        
        if type == .notFull {
            let buttonWidth = (SCREEN.WIDTH - 15 - 9.5 - 15) / 2
            
            self.cancelButton = UIButton(frame: CGRect(x: 15, y: 0, width: buttonWidth, height: 41))
            self.cancelButton.center.y = self.frame.size.height / 2
            self.cancelButton.backgroundColor = UIColor(red: 59/255, green: 77/255, blue: 91/255, alpha: 1)
            self.cancelButton.titleLabel?.font = UIFont(name: Nanum_Barun_Gothic_OTF, size: 13)
            self.cancelButton.setTitle("취소", for: .normal)
            self.cancelButton.addTarget(self, action: #selector(cancelButtonPressed(button:)), for: .touchUpInside)
            self.addSubview(self.cancelButton)
            
            self.saveButton = UIButton(frame: CGRect(x: 0, y: 0, width: buttonWidth, height: 41))
            self.saveButton.center.y = self.frame.size.height / 2
            self.saveButton.frame.origin.x = SCREEN.WIDTH - 15 - self.saveButton.frame.size.width
            self.saveButton.backgroundColor = UIColor(red: 84/255, green: 153/255, blue: 244/255, alpha: 1)
            self.saveButton.titleLabel?.font = UIFont(name: Nanum_Barun_Gothic_OTF, size: 13)
            self.saveButton.setTitle("저장", for: .normal)
            self.saveButton.addTarget(self, action: #selector(saveButtonPressed(button:)), for: .touchUpInside)
            self.addSubview(self.saveButton)
        }else{
            self.cancelButton = UIButton(frame: CGRect(x: 0, y: 0, width: SCREEN.WIDTH / 2, height: 41))
            self.cancelButton.backgroundColor = UIColor(red: 59/255, green: 77/255, blue: 91/255, alpha: 1)
            self.cancelButton.titleLabel?.font = UIFont(name: Nanum_Barun_Gothic_OTF, size: 13)
            self.cancelButton.setTitle("취소", for: .normal)
            self.cancelButton.addTarget(self, action: #selector(cancelButtonPressed(button:)), for: .touchUpInside)
            self.addSubview(self.cancelButton)
            
            let leftImage = #imageLiteral(resourceName: "a")
            let leftImageView = UIImageView(image: leftImage)
            leftImageView.frame = CGRect(x: 26.5, y: 0, width: 10.5, height: 18)
            leftImageView.center.y = self.cancelButton.frame.size.height / 2
            leftImageView.isUserInteractionEnabled = false
            cancelButton.addSubview(leftImageView)
            
            self.saveButton = UIButton(frame: CGRect(x: SCREEN.WIDTH / 2, y: 0, width: SCREEN.WIDTH / 2, height: 41))
            self.saveButton.backgroundColor = UIColor(red: 84/255, green: 153/255, blue: 244/255, alpha: 1)
            self.saveButton.titleLabel?.font = UIFont(name: Nanum_Barun_Gothic_OTF, size: 13)
            self.saveButton.setTitle("저장", for: .normal)
            self.saveButton.addTarget(self, action: #selector(saveButtonPressed(button:)), for: .touchUpInside)
            self.addSubview(self.saveButton)
            
            let rightImage = #imageLiteral(resourceName: "a")
            let rightImageView = UIImageView(image: rightImage)
            rightImageView.frame = CGRect(x: saveButton.frame.size.width - 26.5 - 10.5, y: 0, width: 10.5, height: 18)
            rightImageView.center.y = self.cancelButton.frame.size.height / 2
            rightImageView.isUserInteractionEnabled = false
            saveButton.addSubview(rightImageView)
        }
        
    }
    
    @objc func cancelButtonPressed(button : UIButton){
        self.delegate?.cancelButtonPressed?(button: button)
    }
    
    @objc func saveButtonPressed(button : UIButton){
        self.delegate?.saveButtonPressed?(button: button)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
