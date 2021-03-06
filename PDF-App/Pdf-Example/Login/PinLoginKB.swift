//
//  PinLoginKB.swift
//  Task Control
//
//  Created by John Blaine on 3/11/16.
//  Copyright © 2016 Trax USA Corporation. All rights reserved.
//

import UIKit

protocol PinKBDelegate {
    func pinKBCB( controller: PinLoginKB, pinNum pin : String, delKey : Bool  );
    //func pinKBCB( controller: PinLoginKB, toucID pin : String  );
}

class PinLoginKB: UIView {

    var btn1 : UIButton!
    var btn2 : UIButton!
    var btn3 : UIButton!
    var btn4 : UIButton!
    var btn5 : UIButton!
    var btn6 : UIButton!
    var btn7 : UIButton!
    var btn8 : UIButton!
    var btn9 : UIButton!
    var btnPound : UIButton!
    var btn0 : UIButton!
    var btnDel : UIButton!
    var currentPin : String!
    
    var delegate: PinKBDelegate?

    init(frm: CGRect) {
        
        super.init(frame: frm)
        currentPin = ""
        
        //let colorIndex :CGFloat = 220.0
        btn1 = UIButtonPin(frame: CGRectZero )
        btn1.setTitle("1", forState: UIControlState.Normal)
        btn1.accessibilityIdentifier = "1"
        btn1.addTarget(self, action: #selector(PinLoginKB.keyPadAction(_:)), forControlEvents: UIControlEvents.TouchUpInside)
//        btn1.backgroundColor = UIColor.redColor()
        btn1.showsTouchWhenHighlighted = true
        btn1.layer.borderColor = UIColor.whiteColor().CGColor
        btn1.layer.borderWidth = 0
        btn1.titleLabel?.font = UIFont.boldSystemFontOfSize(30)

        
        btn2 = UIButtonPin(frame: CGRectZero )
        btn2.setTitle("2", forState: UIControlState.Normal)
        btn2.accessibilityIdentifier = "2"
        btn2.addTarget(self, action: #selector(PinLoginKB.keyPadAction(_:)), forControlEvents: UIControlEvents.TouchUpInside)
//        btn2.backgroundColor = UIColor.redColor()
        btn2.showsTouchWhenHighlighted = true
        btn2.layer.borderColor = UIColor.whiteColor().CGColor
        btn2.layer.borderWidth = 0
        btn2.titleLabel?.font = UIFont.boldSystemFontOfSize(30)

        btn3 = UIButtonPin(frame: CGRectZero )
        btn3.setTitle("3", forState: UIControlState.Normal)
        btn3.accessibilityIdentifier = "3"
        btn3.addTarget(self, action: #selector(PinLoginKB.keyPadAction(_:)), forControlEvents: UIControlEvents.TouchUpInside)
//        btn3.backgroundColor = UIColor.redColor()
        btn3.showsTouchWhenHighlighted = true
        btn3.layer.borderColor = UIColor.whiteColor().CGColor
        btn3.layer.borderWidth = 0
        btn3.titleLabel?.font = UIFont.boldSystemFontOfSize(30)

        btn4 = UIButtonPin(frame: CGRectZero )
        btn4.setTitle("4", forState: UIControlState.Normal)
        btn4.accessibilityIdentifier = "4"
        btn4.addTarget(self, action: #selector(PinLoginKB.keyPadAction(_:)), forControlEvents: UIControlEvents.TouchUpInside)
//        btn4.backgroundColor = UIColor.redColor()
        btn4.showsTouchWhenHighlighted = true
        btn4.layer.borderColor = UIColor.whiteColor().CGColor
        btn4.layer.borderWidth = 0
        btn4.titleLabel?.font = UIFont.boldSystemFontOfSize(30)

        btn5 = UIButtonPin(frame: CGRectZero )
        btn5.setTitle("5", forState: UIControlState.Normal)
        btn5.accessibilityIdentifier = "5"
        btn5.addTarget(self, action: #selector(PinLoginKB.keyPadAction(_:)), forControlEvents: UIControlEvents.TouchUpInside)
//        btn5.backgroundColor = UIColor.redColor()
        btn5.showsTouchWhenHighlighted = true
        btn5.layer.borderColor = UIColor.whiteColor().CGColor
        btn5.layer.borderWidth = 0
        btn5.titleLabel?.font = UIFont.boldSystemFontOfSize(30)

        btn6 = UIButtonPin(frame: CGRectZero )
        btn6.setTitle("6", forState: UIControlState.Normal)
        btn6.accessibilityIdentifier = "6"
        btn6.addTarget(self, action: #selector(PinLoginKB.keyPadAction(_:)), forControlEvents: UIControlEvents.TouchUpInside)
//        btn6.backgroundColor = UIColor.redColor()
        btn6.showsTouchWhenHighlighted = true
        btn6.layer.borderColor = UIColor.whiteColor().CGColor
        btn6.layer.borderWidth = 0
        btn6.titleLabel?.font = UIFont.boldSystemFontOfSize(30)

        btn7 = UIButtonPin(frame: CGRectZero )
        btn7.setTitle("7", forState: UIControlState.Normal)
        btn7.accessibilityIdentifier = "7"
        btn7.addTarget(self, action: #selector(PinLoginKB.keyPadAction(_:)), forControlEvents: UIControlEvents.TouchUpInside)
//        btn7.backgroundColor = UIColor.redColor()
        btn7.showsTouchWhenHighlighted = true
        btn7.layer.borderColor = UIColor.whiteColor().CGColor
        btn7.layer.borderWidth = 0
        btn7.titleLabel?.font = UIFont.boldSystemFontOfSize(30)

        btn8 = UIButtonPin(frame: CGRectZero )
        btn8.setTitle("8", forState: UIControlState.Normal)
        btn8.accessibilityIdentifier = "8"
        btn8.addTarget(self, action: #selector(PinLoginKB.keyPadAction(_:)), forControlEvents: UIControlEvents.TouchUpInside)
//        btn8.backgroundColor = UIColor.redColor()
        btn8.showsTouchWhenHighlighted = true
        btn8.layer.borderColor = UIColor.whiteColor().CGColor
        btn8.layer.borderWidth = 0
        btn8.titleLabel?.font = UIFont.boldSystemFontOfSize(30)

        btn9 = UIButtonPin(frame: CGRectZero )
        btn9.setTitle("9", forState: UIControlState.Normal)
        btn9.accessibilityIdentifier = "9"
        btn9.addTarget(self, action: #selector(PinLoginKB.keyPadAction(_:)), forControlEvents: UIControlEvents.TouchUpInside)
//        btn9.backgroundColor = UIColor.redColor()
        btn9.showsTouchWhenHighlighted = true
        btn9.layer.borderColor = UIColor.whiteColor().CGColor
        btn9.layer.borderWidth = 0
        btn9.titleLabel?.font = UIFont.boldSystemFontOfSize(30)

        btnPound = UIButtonPin(frame: CGRectZero )
        btnPound.accessibilityIdentifier = "#"
        btnPound.addTarget(self, action: #selector(PinLoginKB.keyPadAction(_:)), forControlEvents: UIControlEvents.TouchUpInside)
//        btnPound.backgroundColor = UIColor.redColor()
        btnPound.showsTouchWhenHighlighted = true
        btnPound.layer.borderColor = UIColor.whiteColor().CGColor
        btnPound.layer.borderWidth = 0
        btnPound.titleLabel?.font = UIFont.boldSystemFontOfSize(30)

        
        let imageView = UIImage(named: "touchid2")!
        btnPound.setImage(imageView, forState: UIControlState.Normal)
        
        
        btn0 = UIButtonPin(frame: CGRectZero )
        btn0.setTitle("0", forState: UIControlState.Normal)
        btn0.accessibilityIdentifier = "0"
        btn0.addTarget(self, action: #selector(PinLoginKB.keyPadAction(_:)), forControlEvents: UIControlEvents.TouchUpInside)
//        btn0.backgroundColor = UIColor.redColor()
        btn0.showsTouchWhenHighlighted = true
        btn0.layer.borderColor = UIColor.whiteColor().CGColor
        btn0.layer.borderWidth = 0
        btn0.titleLabel?.font = UIFont.boldSystemFontOfSize(30)

        btnDel = UIButtonPin(frame: CGRectZero )
        
        btnDel.setImage( UIImage(named: "backspace_white")!, forState: UIControlState.Normal)
        //       btnDel.setTitle("del", forState: UIControlState.Normal)
        btnDel.accessibilityIdentifier = "del"
        
        btnDel.addTarget(self, action: #selector(PinLoginKB.keyPadAction(_:)), forControlEvents: UIControlEvents.TouchUpInside)
//        btnDel.backgroundColor = UIColor.redColor()
        btnDel.showsTouchWhenHighlighted = true
        btnDel.layer.borderColor = UIColor.whiteColor().CGColor
        btnDel.layer.borderWidth = 0
        
        self.addSubview(btn1)
        self.addSubview(btn2)
        self.addSubview(btn3)
        self.addSubview(btn4)
        self.addSubview(btn5)
        self.addSubview(btn6)
        self.addSubview(btn7)
        self.addSubview(btn8)
        self.addSubview(btn9)
        self.addSubview(btnPound)
        self.addSubview(btn0)
        self.addSubview(btnDel)
        
        /**
        self.clipsToBounds = true
        self.layer.borderWidth =  2
        self.layer.cornerRadius = 8
        self.layer.borderColor = UIColor.whiteColor().CGColor
        ***/
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews(){
        super.layoutSubviews()
        
        let  w : CGFloat = self.bounds.size.width
        let  h : CGFloat = self.bounds.size.height
        
        btn1.frame = CGRect( x: w * 0.0, y: h * 0.0, width: w * 0.333333333, height: h * 0.25)
        btn2.frame = CGRect( x: w * 0.333333333, y: h * 0.0, width: w * 0.333333333, height: h * 0.25)
        btn3.frame = CGRect( x: w * 0.666666666, y: h * 0.0, width: w * 0.333333333, height: h * 0.25)
        
        btn4.frame = CGRect( x: w * 0.0, y: h * 0.25, width: w * 0.333333333, height: h * 0.25)
        btn5.frame = CGRect( x: w * 0.333333333, y: h * 0.25, width: w * 0.333333333, height: h * 0.25)
        btn6.frame = CGRect( x: w * 0.666666666, y: h * 0.25, width: w * 0.333333333, height: h * 0.25)
        
        btn7.frame = CGRect( x: w * 0.0, y: h * 0.5, width: w * 0.333333333, height: h * 0.25)
        btn8.frame = CGRect( x: w * 0.333333333, y: h * 0.5, width: w * 0.333333333, height: h * 0.25)
        btn9.frame = CGRect( x: w * 0.666666666, y: h * 0.5, width: w * 0.333333333, height: h * 0.25)
        
        btnPound.frame = CGRect( x: w * 0.0, y: h * 0.75, width: w * 0.333333333, height: h * 0.25)
        btn0.frame = CGRect( x: w * 0.333333333, y: h * 0.75, width: w * 0.333333333, height: h * 0.25)
        btnDel.frame = CGRect( x: w * 0.666666666, y: h * 0.75, width: w * 0.333333333, height: h * 0.25)

    }
    
    func keyPadAction(sender: UIButton!) {
        //sender.accessibilityIdentifier!.printIt(__FILE__, line: __LINE__ )
        
        if ( sender.accessibilityIdentifier == "del" ){
            currentPin = currentPin.substring(0, end: currentPin.len() - 1)
            delegate?.pinKBCB(self, pinNum: currentPin, delKey : true )
        } else if ( sender.accessibilityIdentifier == "?" ){
        } else if ( sender.accessibilityIdentifier == "#" ){
            
            delegate?.pinKBCB(self, pinNum: "#", delKey : false)

        } else {
            currentPin = String( format : "%@%@", currentPin, (sender.titleLabel?.text)! )
            delegate?.pinKBCB(self, pinNum: currentPin, delKey : false)
        }
        
    }
    
    func clear() {
        currentPin = ""
    }
    
}
