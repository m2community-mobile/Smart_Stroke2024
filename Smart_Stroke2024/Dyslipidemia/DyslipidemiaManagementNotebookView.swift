//
//  DyslipidemiaManagementNotebookView.swift
//  KSR_2024
//
//  Created by m2comm on 2024/01/18.
//
//
import Foundation
import UIKit

class DyslipidemiaManagementNotebookView: UIView {
    
    var DyslipidemiahVIew: UIView!
    var DyslipidemiaVIewLabel: UILabel!
    var DyslipidemiaVIewShowNumLabelNumber: UILabel!
    var DyslipidemiaVIewShowNumLabel: UILabel!
    var DyslipidemiaVIewShowLabel: UILabel!
    var DyslipidemiaVIewGraph: UIView!
    var DyslipidemiaVIewBTN: UIButton!
    
    var dateLable: UILabel!
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        DyslipidemiahVIew = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        
        DyslipidemiaVIewLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
//        self.addSubview(FastingBloodSugar)
        DyslipidemiaVIewShowNumLabelNumber = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        DyslipidemiaVIewShowNumLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        DyslipidemiaVIewShowLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        DyslipidemiaVIewGraph = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        DyslipidemiaVIewBTN = UIButton(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        
        dateLable = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
