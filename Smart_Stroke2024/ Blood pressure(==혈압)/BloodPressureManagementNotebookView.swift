//
//  BloodPressureManagementNotebookView.swift
//  KSR_2024
//
//  Created by m2comm on 2024/01/19.
//

import Foundation
import UIKit

class BloodPressureManagementNotebookView: UIView {
    
    var superCon : BloodPressureViewController?
    
    var BloodPressureView: UIView!
    var BloodPressureVewLabel: UILabel!
    var BloodPressureViewShowNumLabel1name: UILabel!
    var BloodPressureViewShowNumLabel1Number: UILabel!
    var BloodPressureViewShowNumLabel1: UILabel!
    var BloodPressureViewShowNumLabel2name: UILabel!
    var BloodPressureViewShowNumLabel2Number: UILabel!
    var BloodPressureViewShowNumLabel2: UILabel!
    var BloodPressureViewShowLabel: UILabel!
    var BloodPressureVewGraph: UIView!
    var BloodPressureViewBTN: UIButton!
    
    var dateLable: UILabel!
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        
        BloodPressureView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        BloodPressureVewLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        BloodPressureViewShowNumLabel1name = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        BloodPressureViewShowNumLabel1Number = UILabel(frame:CGRect(x: 0, y: 0, width: 0, height: 0))
        BloodPressureViewShowNumLabel1 = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        BloodPressureViewShowNumLabel2name = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        BloodPressureViewShowNumLabel2Number = UILabel(frame:CGRect(x: 0, y: 0, width: 0, height: 0))
        BloodPressureViewShowNumLabel2 = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        BloodPressureViewShowLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        BloodPressureViewShowLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        BloodPressureVewGraph = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        BloodPressureViewBTN = UIButton(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        
        dateLable = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
