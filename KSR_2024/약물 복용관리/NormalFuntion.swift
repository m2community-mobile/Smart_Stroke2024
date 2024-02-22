//
//  NormalFuntion.swift
//  KSR
//
//  Created by m2comm on 2018. 6. 21..
//  Copyright © 2018년 m2community. All rights reserved.
//

import Foundation
import UIKit

//MARK: MATH
func randomInt(min : Int, max : Int) -> Int {
    return min + Int(arc4random_uniform(UInt32(max - min + 1)))
}

func randomInt(min : CGFloat, max : CGFloat, underPoint : Int) -> CGFloat {
    
    let multiple = pow(10, CGFloat(underPoint))
    let rand = randomInt(min: Int(min * multiple), max: Int(max * multiple))
    return CGFloat(rand) / multiple
    
}

func random(min : CGFloat, max : CGFloat, underPoint : Int) -> CGFloat {
    
    let multiple = pow(10, CGFloat(underPoint))
    let rand = randomInt(min: Int(min * multiple), max: Int(max * multiple))
    return CGFloat(rand) / multiple
    
}

func range(n : Int, A:Int, B:Int) -> Bool {
    return (A <= n && n < B)
}

let randomValue : CGFloat = {
    return random(min: 0, max: 1, underPoint: 2)
}()

let randomColor : UIColor = {
    return UIColor(red: randomValue, green: randomValue, blue: randomValue, alpha: 1)
}()


func getAttributedString( stringsInfos : [(String,[NSAttributedStringKey:NSObject])]) -> NSAttributedString {
    
    var targetString = ""
    for i in 0..<stringsInfos.count {
        targetString = "\(targetString)\(stringsInfos[i].0)"
    }
    
    let attributedString = NSMutableAttributedString(string: targetString)
    for i in 0..<stringsInfos.count {
        var startIndex = 0
        if (i) > 0 {
            for j in 0..<i {
                startIndex += stringsInfos[j].0.count
            }
            
        }
        attributedString.setAttributes(stringsInfos[i].1, range: NSMakeRange(startIndex, stringsInfos[i].0.count))
    }
    return attributedString
}


