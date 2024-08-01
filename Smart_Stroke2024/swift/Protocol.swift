//
//  Protocol.swift
//  KSR
//
//  Created by m2comm on 2018. 7. 19..
//  Copyright © 2018년 m2community. All rights reserved.
//

import Foundation


@objc protocol DrugTimeViewDelegate {
    @objc optional func checkButtonPressed(drugTimeView : DrugTimeView)
}
