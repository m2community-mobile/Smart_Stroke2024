//
//  ShowViewController.swift
//  KSR_2024
//
//  Created by m2comm on 2024/03/18.
//

import Foundation
import UIKit

class ShowViewController: UIViewController {
    
    var closeButton: UIButton!
    var okButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        closeButton = UIButton(frame: CGRect(x: self.view.frame.size.width / 1.15, y: 70, width: 20, height: 20))
        closeButton.setImage(UIImage(named: "imgX"), for: .normal)
        
        closeButton.addTarget(self, action: #selector(callMethod(_ :)), for: .touchUpInside)
        let origImage = UIImage(named: "imgX")
        let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
        closeButton.setImage(tintedImage, for: .normal)
        closeButton.tintColor = .black
        
        view.addSubview(closeButton)
        
        okButton = UIButton(frame: CGRect(x: 0, y: self.view.frame.maxY - 100, width: self.view.frame.width, height: 100))
        okButton.setTitle("확인", for: .normal)
                okButton.titleLabel?.font = UIFont(name: "SUITE-Regular", size: 22)
        okButton.backgroundColor = #colorLiteral(red: 0.2551261485, green: 0.3031908274, blue: 0.3545370698, alpha: 1)
        okButton.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMinYCorner, .layerMaxXMinYCorner)
        okButton.layer.cornerRadius = 12
        view.addSubview(okButton)
        
    }
    
    @objc func callMethod(_ sender: UIButton) {
        self.dismiss(animated: false)
    }
    
    
}
