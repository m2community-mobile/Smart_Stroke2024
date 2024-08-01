//
//  Extension.swift
//  KSR
//
//  Created by m2comm on 2018. 6. 21..
//  Copyright © 2018년 m2community. All rights reserved.
//

import Foundation
import UIKit

extension NSMutableAttributedString {
    
    /* sample
     
     let string1 = "KSR 등록 "
     let string2 = "뇌졸중 등록 환자"
     
     let AppleSDGothicNeo                   = "AppleSDGothicNeo-Thin"
     let AppleSDGothicNeoBold               = "AppleSDGothicNeo-Bold"
     
     let attribute1 = [
     NSAttributedStringKey.font : UIFont(name: AppleSDGothicNeo, size: 20)!,
     NSAttributedStringKey.foregroundColor: UIColor.blue,
     NSAttributedStringKey.kern: -0.26
     ] as! [NSAttributedStringKey : NSObject]
     let attribute2 = [
     NSAttributedStringKey.font: UIFont(name: AppleSDGothicNeoBold, size: 20)!,
     NSAttributedStringKey.foregroundColor: UIColor.red,
     NSAttributedStringKey.kern: -0.36
     ] as! [NSAttributedStringKey : NSObject]
     
     let stringInfos = [
     (string1,attribute1),
     (string2,attribute2)
     ] as [(String,[NSAttributedStringKey:NSObject])]
     
     */
    
    convenience init(stringsInfos : [(String,[NSAttributedStringKey:NSObject])]) {
        
        var targetString = ""
        for i in 0..<stringsInfos.count {
            targetString = "\(targetString)\(stringsInfos[i].0)"
        }
        
        self.init(string: targetString)
        
        for i in 0..<stringsInfos.count {
            var startIndex = 0
            if (i) > 0 {
                for j in 0..<i {
                    startIndex += stringsInfos[j].0.count
                }
                
            }
            self.setAttributes(stringsInfos[i].1, range: NSMakeRange(startIndex, stringsInfos[i].0.count))
        }
    }
}

extension UIButton {
    
    //addTarget Clsure ========================================================================================================//
    struct AssociatedKeys {
        static var buttonAction: UInt8 = 0
    }
    
    var buttonAction : ((_ button : UIButton) -> Void)? {
        get {
            guard let value = objc_getAssociatedObject(self, &AssociatedKeys.buttonAction) as? ((_ button : UIButton) -> Void)? else { return nil }
            return value
        }
        set(newValue) {
            objc_setAssociatedObject(self, &AssociatedKeys.buttonAction, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    public func addTarget ( event : UIControlEvents, buttonAction kButtonAction:@escaping (_ button : UIButton) -> Void) {
        self.buttonAction = kButtonAction
        self.addTarget(self, action: #selector(buttonPressed(button:)), for: event)
    }
    
    @objc private func buttonPressed(button : UIButton){
        self.buttonAction?(self)
    }
    //======================================================================================================== addTarget Clsure//
    
    
}

extension UIImageView {
    
    //이미지를 세팅함과 동시에 비율 맞춰 높이 늘리기
    func setImageWithFrameHeight( image kImage : UIImage?){
        if let image = kImage {
            self.image = image
            let frameHeight = self.frame.size.width * (image.size.height / image.size.width)
            self.frame.size.height = frameHeight
        }
    }
}

extension UIViewController : UIGestureRecognizerDelegate {
    public func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}


extension UIColor {
    
    class func randomColor() -> UIColor {
        
        func random(min : CGFloat, max : CGFloat, underPoint : Int) -> CGFloat {
            let multiple = pow(10, CGFloat(underPoint))
            let rand = randomInt(min: Int(min * multiple), max: Int(max * multiple))
            return CGFloat(rand) / multiple
        }
        
        func randomValue() -> CGFloat {
            return random(min: 0, max: 1, underPoint: 2)
        }
        
        return UIColor(red: randomValue(), green: randomValue(), blue: randomValue(), alpha: 1)
    }
}
extension String {
    
    func subString(start startIndex : Int , numberOf endIndex : Int ) -> String {
        let start  = self.index(self.startIndex, offsetBy: startIndex)
        let end  = self.index(start, offsetBy: endIndex)
        let subString = self[start..<end]
        return String(subString)
    }
    
    func subString(start startIndex : Int , end endIndex : Int ) -> String {
        let start  = self.index(self.startIndex, offsetBy: startIndex)
        let end  = self.index(self.startIndex, offsetBy: endIndex)
        let subString = self[start...end]
        return String(subString)
    }
    
    func subString(to endIndex : Int) -> String{
        let end  = self.index(self.startIndex, offsetBy: endIndex)
        let subString = self[self.startIndex...end]
        return String(subString)
    }
    
    func subString(from startIndex : Int) -> String{
        let start  = self.index(self.startIndex, offsetBy: startIndex)
        let subString = self[start..<self.endIndex]
        return String(subString)
    }
    
    
    func toCGFloat() -> CGFloat? {
        if let number = NumberFormatter().number(from: self) {
            return CGFloat(truncating: number)
        }
        return nil
        
    }
    
    func toInt() -> Int? {
        return Int(self, radix: 10)
    }
}


extension UITextField {
    func addDoneCancelToolbar(onDone: (target: Any, action: Selector)? = nil, onCancel: (target: Any, action: Selector)? = nil) {
        let onDone = onDone ?? (target: self, action: #selector(doneButtonTapped))
        
        let toolbar: UIToolbar = UIToolbar()
        toolbar.barStyle = .default
        toolbar.items = [
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil),
            UIBarButtonItem(title: "완료", style: .done, target: onDone.target, action: onDone.action)
        ]
        toolbar.sizeToFit()
        
        self.inputAccessoryView = toolbar
        
    }
    
    @objc func doneButtonTapped() { self.resignFirstResponder() }
}
