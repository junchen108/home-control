//
//  LatestStatusButton.swift
//  HomeControl
//
//  Created by Jun Chen on 30/04/15.
//  Copyright (c) 2015 EPFL. All rights reserved.
//

import UIKit

@IBDesignable
class LatestStatusButton: UIButton {
    
    @IBInspectable var fillColor: UIColor = UIColor.greenColor()
    
    override func drawRect(rect: CGRect) {
        var path = UIBezierPath(ovalInRect: rect)
        fillColor.setFill()
        path.fill()
    }

}
