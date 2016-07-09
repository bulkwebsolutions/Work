//
//  UIButtonPin.swift
//  Task Control
//
//  Created by John Blaine on 3/25/16.
//  Copyright © 2016 Trax USA Corporation. All rights reserved.
//

import UIKit


class UIButtonPin: UIButton {
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        self.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        self.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Highlighted)
    }
    
    override var highlighted: Bool {
        didSet {
            
            if (highlighted) {
                self.backgroundColor = UIColor.whiteColor()
                self.alpha = 0.0
                
                UIView.animateWithDuration(0.3, delay: 0.0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
                    self.alpha = 1.0
                    }, completion: nil)
            }
            else {
                self.backgroundColor = UIColor.clearColor()
            }
            
        }
    }
    
}