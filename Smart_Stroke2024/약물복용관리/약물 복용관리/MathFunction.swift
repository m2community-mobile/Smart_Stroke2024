//
//  MathFunction.swift
//  KSR
//
//  Created by m2comm on 2018. 7. 4..
//  Copyright © 2018년 m2community. All rights reserved.
//

import Foundation

func roundPlaces( value : CGFloat, under : CGFloat = 2 ) -> CGFloat{
    let numberOfPlaces : CGFloat = under
    let multiplier = pow(10.0, numberOfPlaces)
    return CGFloat(round(value * multiplier) / multiplier)
}

func getBMI( weight : CGFloat, height : CGFloat ) -> CGFloat {
    return roundPlaces(value: weight / pow(height * 0.01, 2))
}


