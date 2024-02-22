//
//  Boon.swift
//  KSR_2024
//
//  Created by m2comm on 2024/01/18.
//

//import Foundation
//import UIKit
//
//@objc protocol WMY_ChangeViewDelegate {
//    @objc optional func selectButtonPressed(index : Int)
//}
//
//class Boon: UIView {
//
//    convenience init() {
//        self.init(frame: CGRect(x: 0, y: 0, width: 300, height: 42.5))
//    }
//    
//    var delegate : WMY_ChangeViewDelegate?
//    var buttons = [SelectButton]()
//    
//    private override init(frame: CGRect) {
//        super.init(frame: frame)
//        
//        self.backgroundColor = UIColor(red: 245/255, green: 246/255, blue: 249/255, alpha: 1)
//        
//        let titles = ["주간","월간","연간"]
//        for i in 0..<titles.count {
//            let button = SelectButton(frame: CGRect(x: CGFloat(i) * SCREEN.WIDTH / CGFloat(titles.count), y: 0, width: SCREEN.WIDTH / CGFloat(titles.count), height: self.frame.size.height))
//            button.label.text = titles[i]
//            button.tag = i
//            button.addTarget(self, action: #selector(selectButtonPressed(button:)), for: .touchUpInside)
//            buttons.append(button)
//            self.addSubview(button)
//        }
//        
//        selectButtonPressed(button: buttons[0])
//        
//    }
//    
//    @objc func selectButtonPressed(button:SelectButton){
//        
//        var seletedIndex = 0
//        for i in 0..<self.buttons.count {
//            let kButton = self.buttons[i]
//            if kButton == button {
//                seletedIndex = i
//                kButton.isSelected = true
//            }else{
//                kButton.isSelected = false
//            }
//        }
//        
//        self.delegate?.selectButtonPressed?(index: seletedIndex)
//        
//    }
//
//    class SelectButton: UIButton {
//        
//        var label : UILabel!
//        var underBar : UIView!
//        
//        
//        
//        override var isSelected: Bool {
//            willSet( newValue ){
//                self.label.textColor = newValue ? selectedLabelColor:nonSelectedLabelColor
//                self.underBar.isHidden = !newValue
//            }
//        }
//        
//        let nonSelectedLabelColor = UIColor(red: 147/255, green: 147/255, blue: 171/255, alpha: 1)
//        let selectedLabelColor = UIColor(red: 84/255, green: 153/255, blue: 244/255, alpha: 1)
//        
//        override init(frame: CGRect) {
//            super.init(frame: frame)
//            
//            self.label = UILabel(frame: self.bounds)
//            self.label.font = UIFont(name: Nanum_Barun_Gothic_OTF, size: 13)
//            self.label.textColor = nonSelectedLabelColor
//            self.label.textAlignment = .center
//            self.addSubview(self.label)
//            
//            let underBarWidth : CGFloat = SCREEN.WIDTH * 44/320
//            self.underBar = UIView(frame: CGRect(x: 0, y: 0, width: underBarWidth, height: 2))
//            self.underBar.frame.origin.y = self.frame.size.height - 3
//            self.underBar.center.x = self.frame.size.width / 2
//            self.underBar.backgroundColor = selectedLabelColor
//            self.addSubview(self.underBar)
//            
//        }
//        required init?(coder aDecoder: NSCoder) {
//            fatalError("init(coder:) has not been implemented")
//        }
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//}
