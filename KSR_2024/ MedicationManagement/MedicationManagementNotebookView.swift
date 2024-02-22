//
//  MedicationManagementNotebookView.swift
//  KSR_2024
//
//  Created by m2comm on 2024/01/19.
//

import Foundation
import UIKit

class MedicationManagementNotebookView: UIView {
    
    var MedicationManagementView: UIView!
    
    var MedicationManagementViewIcon: UIImageView!
    var MedicationManagementViewHowNum: UILabel!
    
    var MedicationManagementBTN : UIButton!
    
    
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        MedicationManagementView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        
        MedicationManagementViewIcon = UIImageView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        MedicationManagementViewHowNum = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        
        MedicationManagementBTN = UIButton(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
