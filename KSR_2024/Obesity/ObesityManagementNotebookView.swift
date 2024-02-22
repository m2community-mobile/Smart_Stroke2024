//
//  ObesityManagementNotebookView.swift
//  KSR_2024
//
//  Created by m2comm on 2024/01/18.
//

import Foundation
import UIKit

class ObesityManagementNotebookView: UIView {
    
 
    var bmiGraphVIew: UIView!
    var bmiGraphVIewLabel: UILabel!
    var bmiGraphVIewShowLabel: UILabel!
    var bmiGraphVIewShowNumLabel: UILabel!
    var bmiGraphVIewGraph: UIView!
    
    var saveView: UIView!
    var dateLable: UILabel!
 
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        bmiGraphVIew = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        
        bmiGraphVIewLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
//        self.addSubview(FastingBloodSugar)
        bmiGraphVIewShowLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        bmiGraphVIewShowNumLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        bmiGraphVIewGraph = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        
        saveView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        dateLable = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
