//
//  Signature.swift
//  Task Control
//
//  Created by John Blaine on 2/11/16.
//  Copyright © 2016 Trax USA Corporation. All rights reserved.
//

import UIKit

class Signature: UIView {
    
   // var lastPoint = CGPoint.zeroPoint
    var red: CGFloat = 0.0
    var green: CGFloat = 0.0
    var blue: CGFloat = 0.0
    var brushWidth: CGFloat = 10.0
    var opacity: CGFloat = 1.0
    var swiped = false
    var lastPoint : CGPoint
    var tempImageView : UIImageView

    
    init(frm: CGRect) {
        
        lastPoint = CGPoint(x: 0.0, y: 0.0)
        tempImageView = UIImageView()
        //tempImageView.frame = frm

        super.init(frame: frm)
        
        self.addSubview(tempImageView)

        let colorIndex :CGFloat = 220
                
        self.clipsToBounds = true
//        self.layer.borderWidth = global.trax.borderWidth()
        self.layer.cornerRadius = self.frame.height * 0.08
        self.layer.borderColor = UIColor.grayColor().CGColor
        self.layer.backgroundColor = UIColor(red: colorIndex/255.0, green: colorIndex/255.0, blue: colorIndex/255.0, alpha: 1.0).CGColor
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews(){
        super.layoutSubviews()
        
        let  w : CGFloat = self.bounds.size.width
        let  h : CGFloat = self.bounds.size.height
        
        tempImageView.frame = CGRect( x: 0, y: 0, width: w, height: h)
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        swiped = false
        
        if let touch =  touches.first{
            let point : CGPoint = touch.locationInView(self)
            self.lastPoint.x = point.x
            self.lastPoint.y = point.y
        }
        
        super.touchesBegan(touches, withEvent: event)
    }
    
    func drawLineFrom(fromPoint: CGPoint, toPoint: CGPoint) {
        
        UIGraphicsBeginImageContext(self.frame.size)
        let context = UIGraphicsGetCurrentContext()
        tempImageView.image?.drawInRect(CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height))
        
        CGContextSetLineWidth(context, 5.0 );
        CGContextMoveToPoint(context, fromPoint.x, fromPoint.y);
        CGContextAddLineToPoint(context, toPoint.x , toPoint.y);
        CGContextStrokePath(context)

        tempImageView.image = UIGraphicsGetImageFromCurrentImageContext()
        //tempImageView.alpha = opacity
        UIGraphicsEndImageContext()

    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        // 6
        
        swiped = true
        
        if let touch =  touches.first{
            let point : CGPoint = touch.locationInView(self)
            drawLineFrom(lastPoint, toPoint: point)
            lastPoint = point
        }

        
        
    }
}
