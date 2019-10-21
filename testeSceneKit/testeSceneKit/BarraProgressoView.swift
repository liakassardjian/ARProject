//
//  BarraProgressoView.swift
//  testeSceneKit
//
//  Created by Lia Kassardjian on 20/10/19.
//  Copyright © 2019 Lia Kassardjian. All rights reserved.
//

import UIKit

@IBDesignable
class BarraProgressoView: UIView {
    
    @IBInspectable
    var lineWidth:CGFloat = 10.0 {
        didSet{
            setNeedsDisplay()
        }
    }
    
    @IBInspectable
    var targetValue:CGFloat = 0.25 {
        didSet{
            setNeedsDisplay()
        }
    }
    
    @IBInspectable
    var progressValue:CGFloat = 0.0 {
        didSet{
            setNeedsDisplay()
        }
    }
    
    @IBInspectable
    var lineColor:UIColor = UIColor.black
    @IBInspectable
    var targetColor:UIColor = UIColor.blue
    
    @IBInspectable
    var progressColor:UIColor = UIColor.yellow {
        didSet {
            setNeedsDisplay()
        }
    }
    
    
    override func draw(_ rect: CGRect) {
        
        //Important constants for circle
        let start:CGPoint   = CGPoint(x: rect.minX + lineWidth, y: rect.midY)
        let end:CGPoint     = CGPoint(x: rect.maxX - lineWidth, y: rect.midY)
        
        //Calculating end point of progress bar
        let space:CGFloat       = end.x - start.x
        let endTarget   = CGPoint(x: start.x + space * targetValue, y: end.y)
        let endProgress = CGPoint(x: start.x + space * progressValue, y: end.y)
        
        //starting point for all drawing code is getting the context.
        let context = UIGraphicsGetCurrentContext()
        
        //set line attributes
        context?.setLineWidth(lineWidth)
        context?.setLineCap(CGLineCap.round)
        
        // Draw the MAIN line
        context?.setStrokeColor(lineColor.cgColor)
        context?.move(to: CGPoint(x: start.x, y: start.y))
        context?.addLine(to: CGPoint(x: end.x, y: end.y))
        context?.strokePath()
        
        // Draw the TARGET line
        context?.setStrokeColor(targetColor.cgColor)
        context?.move(to: CGPoint(x: start.x, y: start.y))
        context?.addLine(to: CGPoint(x: endTarget.x, y: endTarget.y))
        context?.strokePath()
        
        // Draw the PROGRESS line
        context?.setStrokeColor(progressColor.cgColor)
        context?.move(to: CGPoint(x: start.x, y: start.y))
        context?.addLine(to: CGPoint(x: endProgress.x, y: endProgress.y))
        context?.strokePath()
    }

}
