//
//  Extension.swift
//  KSR_2024
//
//  Created by m2comm on 2024/01/02.
//

import Foundation
import UIKit

class NotRotatableNavigationController : UINavigationController {
    override open var shouldAutorotate: Bool {
        return true
    }
    override open var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return [.portrait]
    }
}


extension AppDelegate {
    //MARK:about AlertCon
    
    struct UIAlertController_AssociatedKeys {
        static var UIAlertController: UInt8 = 0
    }
    
    var alertCon : UIAlertController? {
        get {
            guard let value = objc_getAssociatedObject(self, &UIAlertController_AssociatedKeys.UIAlertController) as? UIAlertController else { return nil }
            return value
        }
        set(newValue) {
            objc_setAssociatedObject(self, &UIAlertController_AssociatedKeys.UIAlertController, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    func showAlert(title : String?, message : String?, actions:[UIAlertAction] = [UIAlertAction(title: "확인", style: .cancel, handler: nil)], complete:(()->Void)? = nil){
        self.alertCon?.dismiss(animated: false, completion: {})
        self.alertCon = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for action in actions {
            self.alertCon?.addAction(action)
        }
        
        DispatchQueue.main.async {
            appDel.topVC?.present(self.alertCon!, animated: true, completion: {
                complete?() //?/
            })
        }
        
    }
}


extension UIImageView {
    //이미지를 세팅함과 동시에 비율 맞춰 높이 또는 너비 맞추기
    func setImageWithFrameHeight( image kImage : UIImage?){
        if let image = kImage {
            
            let maxSize = max(self.frame.size.width, self.frame.size.height)
            let maxImageSize = max(image.size.width, image.size.height)
            let ratio = maxSize / maxImageSize
            
            if ratio < 1 {
                let newWidth = image.size.width * ratio
                let newHeight = image.size.height * ratio
                if let newImage = image.resize(size: CGSize(width: newWidth, height: newHeight)) {
                    self.image = newImage.withRenderingMode(image.renderingMode)
                    let frameHeight = self.frame.size.width * (newImage.size.height / newImage.size.width)
                    self.frame.size.height = frameHeight
                    return
                }
            }
            
            self.image = image
            let frameHeight = self.frame.size.width * (image.size.height / image.size.width)
            self.frame.size.height = frameHeight
            
        }
    }
    func setImageWithFrameWidth( image kImage : UIImage?){
        if let image = kImage {
            
            let maxSize = max(self.frame.size.width, self.frame.size.height)
            let maxImageSize = max(image.size.width, image.size.height)
            let ratio = maxSize / maxImageSize
            
            if ratio < 1 {
                let newWidth = image.size.width * ratio
                let newHeight = image.size.height * ratio
                if let newImage = image.resize(size: CGSize(width: newWidth, height: newHeight)) {
                    self.image = newImage.withRenderingMode(image.renderingMode)
                    let frameWidth = self.frame.size.height * (newImage.size.width / newImage.size.height)
                    self.frame.size.width = frameWidth
                    return
                }
            }
            
            self.image = image
            let frameWidth = self.frame.size.height * (image.size.width / image.size.height)
            self.frame.size.width = frameWidth
        }
    }
}
extension UIImage {
    
    //조금 더 두고봐야할듯..
    func resize(size: CGSize) -> UIImage? {
//        print("UIImage Resize")
        return self
        
        let target = CGRect(x: 0, y: 0, width: size.width, height: size.height)

        UIGraphicsBeginImageContextWithOptions(target.size, false, UIScreen.main.scale)
        draw(in: target, blendMode: .normal, alpha: 1)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage
        
    }
}


extension UIBezierPath {
    convenience init(shouldRoundRect rect: CGRect, topLeftRadius: CGSize = .zero, topRightRadius: CGSize = .zero, bottomLeftRadius: CGSize = .zero, bottomRightRadius: CGSize = .zero){

        self.init()

        let path = CGMutablePath()

        let topLeft = rect.origin
        let topRight = CGPoint(x: rect.maxX, y: rect.minY)
        let bottomRight = CGPoint(x: rect.maxX, y: rect.maxY)
        let bottomLeft = CGPoint(x: rect.minX, y: rect.maxY)

        if topLeftRadius != .zero{
            path.move(to: CGPoint(x: topLeft.x+topLeftRadius.width, y: topLeft.y))
        } else {
            path.move(to: CGPoint(x: topLeft.x, y: topLeft.y))
        }

        if topRightRadius != .zero{
            path.addLine(to: CGPoint(x: topRight.x-topRightRadius.width, y: topRight.y))
            path.addCurve(to:  CGPoint(x: topRight.x, y: topRight.y+topRightRadius.height), control1: CGPoint(x: topRight.x, y: topRight.y), control2:CGPoint(x: topRight.x, y: topRight.y+topRightRadius.height))
        } else {
             path.addLine(to: CGPoint(x: topRight.x, y: topRight.y))
        }

        if bottomRightRadius != .zero{
            path.addLine(to: CGPoint(x: bottomRight.x, y: bottomRight.y-bottomRightRadius.height))
            path.addCurve(to: CGPoint(x: bottomRight.x-bottomRightRadius.width, y: bottomRight.y), control1: CGPoint(x: bottomRight.x, y: bottomRight.y), control2: CGPoint(x: bottomRight.x-bottomRightRadius.width, y: bottomRight.y))
        } else {
            path.addLine(to: CGPoint(x: bottomRight.x, y: bottomRight.y))
        }

        if bottomLeftRadius != .zero{
            path.addLine(to: CGPoint(x: bottomLeft.x+bottomLeftRadius.width, y: bottomLeft.y))
            path.addCurve(to: CGPoint(x: bottomLeft.x, y: bottomLeft.y-bottomLeftRadius.height), control1: CGPoint(x: bottomLeft.x, y: bottomLeft.y), control2: CGPoint(x: bottomLeft.x, y: bottomLeft.y-bottomLeftRadius.height))
        } else {
            path.addLine(to: CGPoint(x: bottomLeft.x, y: bottomLeft.y))
        }

        if topLeftRadius != .zero{
            path.addLine(to: CGPoint(x: topLeft.x, y: topLeft.y+topLeftRadius.height))
            path.addCurve(to: CGPoint(x: topLeft.x+topLeftRadius.width, y: topLeft.y) , control1: CGPoint(x: topLeft.x, y: topLeft.y) , control2: CGPoint(x: topLeft.x+topLeftRadius.width, y: topLeft.y))
        } else {
            path.addLine(to: CGPoint(x: topLeft.x, y: topLeft.y))
        }

        path.closeSubpath()
        cgPath = path
    }
}


extension UIView{
    func roundCorners(topLeft: CGFloat = 0, topRight: CGFloat = 0, bottomLeft: CGFloat = 0, bottomRight: CGFloat = 0) {//(topLeft: CGFloat, topRight: CGFloat, bottomLeft: CGFloat, bottomRight: CGFloat) {
        let topLeftRadius = CGSize(width: topLeft, height: topLeft)
        let topRightRadius = CGSize(width: topRight, height: topRight)
        let bottomLeftRadius = CGSize(width: bottomLeft, height: bottomLeft)
        let bottomRightRadius = CGSize(width: bottomRight, height: bottomRight)
        let maskPath = UIBezierPath(shouldRoundRect: bounds, topLeftRadius: topLeftRadius, topRightRadius: topRightRadius, bottomLeftRadius: bottomLeftRadius, bottomRightRadius: bottomRightRadius)
        let shape = CAShapeLayer()
        shape.path = maskPath.cgPath
        layer.mask = shape
    }
    
    func setGradient(color1:UIColor,color2:UIColor){
          let gradient: CAGradientLayer = CAGradientLayer()
          gradient.colors = [color1.cgColor,color2.cgColor]
          gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 0.5, y: 0.2)
        gradient.endPoint = CGPoint(x: 0.5, y: 1.0)
          gradient.frame = bounds
          layer.addSublayer(gradient)
      }
}


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
    
    convenience init(stringsInfos : [(String,[NSAttributedString.Key:NSObject])]) {
        
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
 
    public func addTarget ( event : UIControl.Event, buttonAction kButtonAction:@escaping (_ button : UIButton) -> Void) {
        self.buttonAction = kButtonAction
        self.addTarget(self, action: #selector(buttonPressed(button:)), for: event)
    }

    
    @objc private func buttonPressed(button : UIButton){
        self.buttonAction?(self)
    }
    //======================================================================================================== addTarget Clsure//
    
    func setUnderline() {
        guard let title = title(for: .normal) else { return }
        let attributedString = NSMutableAttributedString(string: title)
        attributedString.addAttribute(.underlineStyle,
                                      value: NSUnderlineStyle.single.rawValue,
                                      range: NSRange(location: 0, length: title.count)
        )
        setAttributedTitle(attributedString, for: .normal)
    }
}

//func addRightIcon(image: UIImage) {
//       let imageView = UIImageView(image: image)
//       imageView.translatesAutoresizingMaskIntoConstraints = false
//
//       addSubview(imageView)
//
//       let length = CGFloat(15)
//       titleEdgeInsets.right += length
//
//       NSLayoutConstraint.activate([
//           imageView.leadingAnchor.constraint(equalTo: self.titleLabel!.trailingAnchor, constant: 10),
//           imageView.centerYAnchor.constraint(equalTo: self.titleLabel!.centerYAnchor, constant: 0),
//           imageView.widthAnchor.constraint(equalToConstant: length),
//           imageView.heightAnchor.constraint(equalToConstant: length)
//       ])
//   }

extension UIImageView {
    

}

extension UIViewController : UIGestureRecognizerDelegate {
    public func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    func hideKeyboardWhenTappedAround() {
          let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
          tap.cancelsTouchesInView = false
          view.addGestureRecognizer(tap)
      }
      
      @objc func dismissKeyboard() {
          view.endEditing(true)
      }
    
    
}


extension UIColor {
    

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
    
    
    
    
    
    func setIcon(_ image: UIImage) {
       let iconView = UIImageView(frame:
                      CGRect(x: 10, y: 5, width: 20, height: 20))
       iconView.image = image
       let iconContainerView: UIView = UIView(frame:
                      CGRect(x: 30, y: 0, width: 30, height: 30))
       iconContainerView.addSubview(iconView)
       leftView = iconContainerView
       leftViewMode = .always
    }
    
}

extension AppDelegate {
    //MARK:about topVC, allDismiss
    
    var topVC : UIViewController? {
        get{
            if var kTopVC = self.window?.rootViewController {
                while let presentedViewController = kTopVC.presentedViewController {
                    kTopVC = presentedViewController
                }
                return kTopVC
            }
            return nil
        }
    }
    func allDismiss(complete:@escaping ()->Void) {
        var topVCs = [UIViewController]()
        if let rootVC = appDel.window?.rootViewController {
            var topVC = rootVC
            while let presentedViewController = topVC.presentedViewController {
                topVC = presentedViewController
                topVCs.append(topVC)
            }
            if topVCs.count == 0{
                complete()
                return
            }
            for _ in 0..<topVCs.count {
                topVCs.popLast()?.dismiss(animated: true, completion: {
                    if topVCs.count == 0 {
                        complete()
                    }
                })
            }
        }
    }
}

extension UIResponder {
    
    private struct Static {
        static weak var responder: UIResponder?
    }
    
    static var currentResponder: UIResponder? {
        Static.responder = nil
        UIApplication.shared.sendAction(#selector(UIResponder._trap), to: nil, from: nil, for: nil)
        return Static.responder
    }
    
    @objc private func _trap() {
        Static.responder = self
    }
}


extension UINavigationController {
    
    func popToViewController(ofClass: AnyClass, animated: Bool = true) {
        if let vc = viewControllers.filter({$0.isKind(of: ofClass)}).last {
            popToViewController(vc, animated: animated)
        }
    }
    
    func popViewControllers(viewsToPop: Int, animated: Bool = true) {
        if viewControllers.count > viewsToPop {
            let vc = viewControllers[viewControllers.count - viewsToPop - 1]
            popToViewController(vc, animated: animated)
        }
    }
}

extension UIColor {
    func rgb() -> (red:Int, green:Int, blue:Int, alpha:Int)? {
    var fRed : CGFloat = 0
    var fGreen : CGFloat = 0
    var fBlue : CGFloat = 0
    var fAlpha: CGFloat = 0
    if self.getRed(&fRed, green: &fGreen, blue: &fBlue, alpha: &fAlpha) {
        let iRed = Int(fRed * 255.0)
        let iGreen = Int(fGreen * 255.0)
        let iBlue = Int(fBlue * 255.0)
        let iAlpha = Int(fAlpha)

        _ = (iAlpha << 24) + (iRed << 16) + (iGreen << 8) + iBlue
        return (red:iRed, green:iGreen, blue:iBlue, alpha:iAlpha)
    } else {
        // Could not extract RGBA components:
        return nil
    }
}
}


extension CALayer {
    func addBorder(_ arr_edge: [UIRectEdge], color: UIColor, width: CGFloat) {
        for edge in arr_edge {
            let border = CALayer()
            switch edge {
            case UIRectEdge.top:
                border.frame = CGRect.init(x: 0, y: 0, width: frame.width, height: width)
                break
            case UIRectEdge.bottom:
                border.frame = CGRect.init(x: 0, y: frame.height - width, width: frame.width, height: width)
                break
            case UIRectEdge.left:
                border.frame = CGRect.init(x: 0, y: 0, width: width, height: frame.height)
                break
            case UIRectEdge.right:
                border.frame = CGRect.init(x: frame.width - width, y: 0, width: width, height: frame.height)
                break
            default:
                break
            }
            border.backgroundColor = color.cgColor;
            self.addSublayer(border)
        }
    }
}
