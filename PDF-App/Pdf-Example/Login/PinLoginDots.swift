//
//  PinLoginDots.swift
//  Task Control
//
//  Created by John Blaine on 3/11/16.
//  Copyright © 2016 Trax USA Corporation. All rights reserved.
//

import UIKit

class PinLoginDots: UIView {

    init(frm: CGRect) {
        
        super.init(frame: frm)
        
        let pin1 = UIButton(frame: CGRectZero )
        self.addSubview(pin1)
        
        let pin2 = UIButton(frame: CGRectZero )
        self.addSubview(pin2)
        
        let pin3 = UIButton(frame: CGRectZero )
        self.addSubview(pin3)
        
        let pin4 = UIButton(frame: CGRectZero )
        self.addSubview(pin4)
        
//        self.backgroundColor = UIColor.redColor()
        self.layer.borderWidth =  0
        self.layer.cornerRadius = 8

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews(){
        super.layoutSubviews()
        
        let  w : CGFloat = self.bounds.size.width
        let  h : CGFloat = self.bounds.size.height
        
        let cellWidth = w / CGFloat(self.subviews.count)
        
        for i in 0 ..< self.subviews.count{
            
            if ( self.subviews[i] is UIButton ){
                let pinFld = self.subviews[i] as! UIButton
                pinFld.frame = CGRect( x: (cellWidth * CGFloat(i)), y: 0.0, width: cellWidth, height: h )
                
            }
            
        }

    }
    
    func fadeIn( btn : UIButton) {
        
        // "fadeIn".printIt(__FILE__, line: __LINE__)
        btn.hidden = false
        btn.alpha = 0.0

        // Move our fade out code from earlier
        
        UIView.animateWithDuration(0.3, delay: 0.0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            btn.alpha = 1.0
            }, completion: nil)
    }
    
    func fadeOut(btn : UIButton ) {
        UIView.animateWithDuration(0.3, delay: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
            btn.alpha = 0.0
            }, completion: {
                (finished: Bool) -> Void in
                btn.hidden = true
                
                UIView.animateWithDuration(0.3, delay: 0.0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
                    }, completion: nil)
        })
        
    }

    
    
    func showPins( numOfPins : Int, animate : Bool ) {
        var j : Int = 0
        
        for i in 0 ..< self.subviews.count{
            
            if ( self.subviews[i] is UIButton ){
                let pinFld = self.subviews[i] as! UIButton
                
                if ( j < numOfPins ){
                    pinFld.setTitle("●", forState: UIControlState.Normal)
                    pinFld.titleLabel?.font = UIFont.systemFontOfSize(30)
                    
                    if ( animate == true ){
                        if ( (j + 1) == numOfPins ){
                            self.fadeIn( pinFld )
                        }
                    }
                    
                } else {
                    pinFld.setTitle("○", forState: UIControlState.Normal)
                    pinFld.titleLabel?.font = UIFont.systemFontOfSize(20)
                }
                
                j = j + 1
            }
            
        }
        
    }
    
    func clearPinValues( pinVw : UIView ) {
        for i in 0 ..< pinVw.subviews.count{
            if ( pinVw.subviews[i] is UITextField ){
                let pinFld = pinVw.subviews[i] as! UIButton
                pinFld.setTitle("○", forState: UIControlState.Normal)
            }
        }
    }

}
