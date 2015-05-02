//
//  IncreaseButton.swift
//  HomeControl
//
//  Created by Jun Chen on 02/05/15.
//  Copyright (c) 2015 EPFL. All rights reserved.
//

import UIKit

@IBDesignable
class AdjustButton: UIButton {

    @IBInspectable var fillColor: UIColor = UIColor.greenColor()
    @IBInspectable var isIncreaseButton: Bool = true
    
    override func drawRect(rect: CGRect) {
        
        var path = UIBezierPath(ovalInRect: rect)
        fillColor.setFill()
        path.fill()
        
        // Set up the width and height variables
        // For the horizontal stroke
        let plusHeight: CGFloat = 3.0
        let plusWidth: CGFloat = min(bounds.width, bounds.height) * 0.6
        
        // Create the path
        var plusPath = UIBezierPath()
        
        // Set the path's line width to the height of the stroke
        plusPath.lineWidth = plusHeight
        
        // Move the initial point of the path
        // To the start of the horizontal stroke
        plusPath.moveToPoint(CGPoint(
            x:bounds.width/2 - plusWidth/2 + 0.5,
            y:bounds.height/2 + 0.5))
        
        // Add a point to the path at the end of the stroke
        plusPath.addLineToPoint(CGPoint(
            x:bounds.width/2 + plusWidth/2 + 0.5,
            y:bounds.height/2 + 0.5))
        
        // Vertical line
        if isIncreaseButton {
            // Move to the start of the vertical stroke
            plusPath.moveToPoint(CGPoint(
                x:bounds.width/2 + 0.5,
                y:bounds.height/2 - plusWidth/2 + 0.5))
            
            // Add the end point to the vertical stroke
            plusPath.addLineToPoint(CGPoint(
                x:bounds.width/2 + 0.5,
                y:bounds.height/2 + plusWidth/2 + 0.5))
        }
        
        // Set the stroke color
        UIColor.whiteColor().setStroke()
        
        // Draw the stroke
        plusPath.stroke()
        
    }

}
