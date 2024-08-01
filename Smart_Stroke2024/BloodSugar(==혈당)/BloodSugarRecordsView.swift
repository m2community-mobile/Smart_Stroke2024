//
//  BloodSugarRecordsView.swift
//  KSR_2024
//
//  Created by m2comm on 2024/01/18.
//

import Foundation
import UIKit

class BloodSugarRecordsView: UIView {

    var test: UIView!
    var gr: TEST!
    
    
    override init(frame: CGRect) {
        super .init(frame: frame)
    
        test = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        gr = TEST(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

