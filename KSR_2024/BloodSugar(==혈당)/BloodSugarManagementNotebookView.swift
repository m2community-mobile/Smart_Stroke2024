//
//  Test.swift
//  KSR_2024
//
//  Created by m2comm on 2024/01/17.
//

import Foundation
import UIKit

class BloodSugarManagementNotebookView: UIView {
    

    var FastingBloodSugar: UIView!
    var FastingBloodSugarLabel: UILabel!
    var FastingBloodSugarShowLabel: UILabel!
    var FastingBloodSugarShowNumLabelNumber: UILabel!
    var FastingBloodSugarShowNumLabel: UILabel!
    var FastingBloodSugarPercent: UILabel!
    var FastingBloodSugarGraph: UIView!
    
    var PostprandialBloodSugar: UIView!
    var PostprandialBloodSugarLabel: UILabel!
    var PostprandialBloodSugarShowLabel: UILabel!
    var PostprandialBloodSugarShowNumLabelNumber: UILabel!
    var PostprandialBloodSugarShowNumLabel: UILabel!
    var PostprandialBloodSugarPercent: UILabel!
    var PostprandialBloodSugarGraph: UIView!
    
    var GlycatedHemoglobin: UIView!
    var GlycatedHemoglobinLabel: UILabel!
    var GlycatedHemoglobinShowLabel: UILabel!
    var GlycatedHemoglobinShowNumLabelNumber: UILabel!
    var GlycatedHemoglobinShowNumLabel: UILabel!
    var GlycatedHemoglobinPercent: UILabel!
    var GlycatedHemoglobinGraph: UIView!
    
    var saveView: UIView!
    var dateLable: UILabel!
    var afterBTN: UIButton!
    var beforeBTN: UIButton!
    var bloodTF: UITextField!
    var glycated: UITextField!
    
    
    
    
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        FastingBloodSugar = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
//        self.addSubview(FastingBloodSugar)
        FastingBloodSugarLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        FastingBloodSugarShowLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        FastingBloodSugarShowNumLabelNumber = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        FastingBloodSugarShowNumLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        FastingBloodSugarPercent = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        FastingBloodSugarGraph = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        
        PostprandialBloodSugar = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
//        self.addSubview(FastingBloodSugar)
        PostprandialBloodSugarLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        PostprandialBloodSugarShowLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        PostprandialBloodSugarShowNumLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        PostprandialBloodSugarPercent = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        PostprandialBloodSugarGraph = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
 
        saveView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        dateLable = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        afterBTN = UIButton(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        beforeBTN = UIButton(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        bloodTF = UITextField(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        glycated = UITextField(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
