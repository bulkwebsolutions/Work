//
//  PinLoginCreate.swift
//  Task Control
//
//  Created by John Blaine on 1/12/16.
//  Copyright © 2016 Trax USA Corporation. All rights reserved.
//

import UIKit

class PinLoginCreate: UIView {
    typealias sentType = ( user: String, password: String,  pin: String ) -> Void
    typealias cancelType = (status: String) -> Void
    private var sentCB: sentType?
    private var cancelCB: cancelType?
    enum PinState { case user; case password; case pin; case pinConfirm }

    var title : UILabel!
    var message : UILabel!
    var inputEntry : UITextField!
    
    var cancel : UIButton!
    var previous : UIButton!
    var next : UIButton!
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

    var keyPad : UIView!
    var currentState : PinState!
    
    var currentLoginUser: String! = ""
    var currentUser: String! = ""
    var currentPassword: String! = ""
    var currentPin: String! = ""
    var currentPinConfirm: String! = ""
    
    var pinView : UIView!
    var tm : NSTimer!

    init(frm: CGRect, name : String) {
        
        super.init(frame: frm)
        self.accessibilityIdentifier = name

        currentState = PinState.user
        
        let colorIndex :CGFloat = 220
        
//        title = UILabel(frame: CGRectZero, text : "Create Pin", adjustFont: 4.0 )
        title = UILabel(frame: CGRectZero )
        title.text = "Create Pin"
        title.textColor = UIColor.redColor()
        title.textAlignment = NSTextAlignment.Center
        
//        message = UILabel(frame: CGRectZero, text : "Please enter your full name", adjustFont: -4.0 )
        message = UILabel(frame: CGRectZero )
        message.text = "Please enter your full name"
        message.textColor = UIColor.redColor()
        message.textAlignment = NSTextAlignment.Center
        
//        inputEntry = UITextField(frame: CGRectZero, placeHolder: "Full Name" )
        inputEntry = UITextField(frame: CGRectZero  )
        inputEntry.placeholder = "Full Name"
        inputEntry.backgroundColor = UIColor(red: colorIndex/255.0, green: colorIndex/255.0, blue: colorIndex/255.0, alpha: 1.0)
        inputEntry.layer.borderColor = UIColor(red: colorIndex/255.0, green: colorIndex/255.0, blue: colorIndex/255.0, alpha: 1.0).CGColor
        inputEntry.autocorrectionType = UITextAutocorrectionType.No
    
        previous = UIButton(frame: CGRectZero )
        //previous.setTitle("<<Previous", forState: UIControlState.Normal)
        //let imgPrev = UIImage(named: "backward")!
        previous.accessibilityIdentifier = "<<Previous"
        previous.setImage( UIImage(named: "backward")!, forState: UIControlState.Normal)
        previous.addTarget(self, action: #selector(PinLoginCreate.btnAction(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        previous.backgroundColor = UIColor.redColor()
        
        next = UIButton(frame: CGRectZero )
        //next.setTitle("Next>>", forState: UIControlState.Normal)
        next.accessibilityIdentifier = "Next>>"
        next.setImage(UIImage(named: "forward")!, forState: UIControlState.Normal)
        next.addTarget(self, action: #selector(PinLoginCreate.btnAction(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        next.backgroundColor = UIColor.redColor()
        next.imageView!.tintColor = UIColor.whiteColor()

        cancel = UIButton(frame: CGRectZero )
        cancel.setTitle("☒", forState: UIControlState.Normal)
        cancel.addTarget(self, action: #selector(PinLoginCreate.btnAction(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        cancel.backgroundColor = UIColor.redColor()
      
        pinView = self.createPinView(CGRectZero)
        keyPad = self.createKeyPadView(CGRectZero)

        /**
        btn1 = UIButton(frame: CGRectZero )
        btn1.setTitle("1", forState: UIControlState.Normal)
        btn1.addTarget(self, action: "keyPadAction:", forControlEvents: UIControlEvents.TouchUpInside)
        btn1.backgroundColor = UIColor.redColor()
        btn1.layer.borderColor = UIColor.blackColor().CGColor
        btn1.layer.borderWidth = 1
        
        btn2 = UIButton(frame: CGRectZero )
        btn2.setTitle("2", forState: UIControlState.Normal)
        btn2.addTarget(self, action: "keyPadAction:", forControlEvents: UIControlEvents.TouchUpInside)
        btn2.backgroundColor = UIColor.redColor()
        btn2.layer.borderColor = UIColor.blackColor().CGColor
        btn2.layer.borderWidth = 1
        
        btn3 = UIButton(frame: CGRectZero )
        btn3.setTitle("3", forState: UIControlState.Normal)
        btn3.addTarget(self, action: "keyPadAction:", forControlEvents: UIControlEvents.TouchUpInside)
        btn3.backgroundColor = UIColor.redColor()
        btn3.layer.borderColor = UIColor.blackColor().CGColor
        btn3.layer.borderWidth = 1
        **/
        
        self.addSubview(title)
        self.addSubview(message)
        self.addSubview(inputEntry)
        self.addSubview(previous)
        self.addSubview(next)
        self.addSubview(pinView)
        self.addSubview(cancel)
        
        self.addSubview(keyPad)

        //self.addSubview(btn1)
        //self.addSubview(btn2)
        //self.addSubview(btn3)

        self.clipsToBounds = true
        self.layer.borderWidth = 1
        self.layer.cornerRadius = self.frame.height * 0.08
        self.layer.borderColor = UIColor.clearColor().CGColor
        
        self.layer.borderColor = UIColor(red: 0.180, green: 0.635, blue: 0.863, alpha: 1.0).CGColor
        self.layer.backgroundColor = UIColor(red: 0.180, green: 0.635, blue: 0.863, alpha: 1.0).CGColor

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func btnAction(sender: UIButton!) {
        //username.text = "John Blaine"
        //print(sender.titleLabel?.text)
        //next.accessibilityIdentifier
        print(sender.accessibilityIdentifier)

        if ( sender.accessibilityIdentifier == "Next>>" ){

                if ( currentState == PinState.user ){
                    
                    if ( self.checkForEmptyString( inputEntry.text! ) == false ){
                        currentLoginUser = inputEntry.text
                        currentUser = inputEntry.text
                        currentState = PinState.password
                        inputEntry.resignFirstResponder()
                        self.layoutSubviews()
                   }
                    
                } else if ( currentState == PinState.password ){
                    if ( self.checkForEmptyString( inputEntry.text! ) == false ){
                        currentPassword = inputEntry.text
                        self.showPins( self.pinView, numOfPins : 0 )
                        currentState = PinState.pin
                        inputEntry.resignFirstResponder()
                        self.layoutSubviews()
                  }
                    
                } else if ( currentState == PinState.pin ){
                    //let pin = self.getPinValues(self.pinView)
                    //"PinState.pin".printIt(__FILE__, line: __LINE__ )
                    self.showPins( self.pinView, numOfPins : 0 )
                   
                        //if ( self.checkPin( pin ) == false ){
                            //currentPin = pin
                            currentState = PinState.pinConfirm
                            //self.clearPinValues(self.pinView)
                            self.layoutSubviews()
                        //}
                } else if ( currentState == PinState.pinConfirm ){
                    
                    //"PinState.pinConfirm".printIt(__FILE__, line: __LINE__ )
                    
                    self.showPins( self.pinView, numOfPins : 0 )
                    self.layoutSubviews()

                }
                            
        } else if ( sender.accessibilityIdentifier == "<<Previous" ){
            
            if ( currentState == PinState.pinConfirm ){
                //currentPinConfirm = inputEntry.text
                currentState = PinState.pin
                self.layoutSubviews()
            } else if ( currentState == PinState.pin ){
                currentPassword = inputEntry.text
                currentState = PinState.password
                self.clearPinValues(self.pinView)
                self.layoutSubviews()
            } else if ( currentState == PinState.password ){
                //currentPin = self.getPinValues(self.pinView)
                currentState = PinState.user
                self.layoutSubviews()
            }
            
        } else if ( sender.accessibilityIdentifier == "Done" ){ // Done is press
            //currentPinConfirm = self.getPinValues(self.pinView) // last field


            //currentUser.printIt(__FILE__, line: __LINE__)
            //currentPassword.printIt(__FILE__, line: __LINE__)
            //currentPin.printIt(__FILE__, line: __LINE__)
            //currentPinConfirm.printIt(__FILE__, line: __LINE__)
            
            if ( currentPin == currentPinConfirm ){
                self.sentCB!( user: self.currentUser.lowercaseString, password: self.currentPassword,  pin: currentPin )
            
            } else if ( currentPin != currentPinConfirm ){
                currentPin = ""
                currentPinConfirm = ""
                self.showPins( self.pinView, numOfPins : 0 )

                //self.next.sendActionsForControlEvents(UIControlEvents.TouchUpInside)
                self.previous.sendActionsForControlEvents(UIControlEvents.TouchUpInside)
//                let alert = UIAlertView(title: "Task List",
//                    message: "The 'password' and 'confirmation password' do not match! \nPlease try again.",
//                    delegate: nil,
//                    cancelButtonTitle: "OK")
//                alert.show()
                
                let title = "Task List"
                let message = "The 'password' and 'confirmation password' do not match! \nPlease try again."
                let alertView = UIAlertController(title: title, message: message, preferredStyle: .Alert)
                alertView.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
                UIApplication.sharedApplication().keyWindow?.rootViewController?.presentViewController(alertView, animated: true, completion: nil)

    
            } else {
                currentPin = ""
                currentPinConfirm = ""
                self.showPins( self.pinView, numOfPins : 0 )

//                let alert = UIAlertView(title: "Task List",
//                    message: "The password and confirmation password do not match! \nPlease try again.",
//                    delegate: nil,
//                    cancelButtonTitle: "OK")
//                alert.show()
                
                let title = "Task List"
                let message = "The 'password' and 'confirmation password' do not match! \nPlease try again."
                let alertView = UIAlertController(title: title, message: message, preferredStyle: .Alert)
                alertView.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
                UIApplication.sharedApplication().keyWindow?.rootViewController?.presentViewController(alertView, animated: true, completion: nil)
               
            }
        } else {
            //self.sentCB!( user: self.currentUser.lowercaseString, password: self.currentPassword,  pin: currentPin )
            self.cancelCB!( status: "canceled")
        }
        
        
        
        
    }
    
    func checkPin( s: String) -> Bool {
        if( s.contains("A") == true ){
//            let alert = UIAlertView(title: "Pin Login",
//                message: "Missing pin entry.\nPlease try again.",
//                delegate: nil,
//                cancelButtonTitle: "OK")
//            alert.show()
            
            let title = "Pin Login"
            let message = "Missing pin entry.\nPlease try again."
            let alertView = UIAlertController(title: title, message: message, preferredStyle: .Alert)
            alertView.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            UIApplication.sharedApplication().keyWindow?.rootViewController?.presentViewController(alertView, animated: true, completion: nil)

            
            return( true )
        } else {
            return( false )
        }
    }
    
    func checkForEmptyString( s: String) -> Bool {
        if( s == "" ){
//            let alert = UIAlertView(title: "Pin Login",
//                message: "Blank entry.\nPlease try again.",
//                delegate: nil,
//                cancelButtonTitle: "OK")
//            alert.show()
            
            let title = "Pin Login"
            let message = "Blank entry.\nPlease try again."
            let alertView = UIAlertController(title: title, message: message, preferredStyle: .Alert)
            alertView.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            UIApplication.sharedApplication().keyWindow?.rootViewController?.presentViewController(alertView, animated: true, completion: nil)

            return( true )
        } else {
            return( false )
        }
    }

    /***
     func sentAction(sender: UIButton!) {
     
     let usr = username.text!
     self.sentCB!(emailAdr: usr)
     }
     ****/
    func cancelAction(sender: UIButton!) {
        self.cancelCB!(status: "cancel" )
    }

    func keyPadAction(sender: UIButton!) {
        //sender.accessibilityIdentifier!.printIt(__FILE__, line: __LINE__ )
        

        if ( currentState == PinState.pin ) {

            if ( sender.accessibilityIdentifier == "del" ){
                currentPin = currentPin.substring(0, end: currentPin.len() - 1)
                self.showPins( self.pinView, numOfPins : currentPin.len() )
            } else if ( sender.accessibilityIdentifier == "#" ){

            } else {
                currentPin = String( format : "%@%@", currentPin, (sender.titleLabel?.text)! )
                //sender.titleLabel?.text?.printIt(__FILE__, line: __LINE__ )
                //currentPin.printIt(__FILE__, line: __LINE__ )
                
                self.showPins( self.pinView, numOfPins : currentPin.len() )
                
                if ( currentPin.len() == 4){
                    //"next event".printIt(__FILE__, line: __LINE__ )
                    tm = NSTimer.scheduledTimerWithTimeInterval( 0.5, target: self, selector: #selector(PinLoginCreate.inactivityExpires), userInfo: nil, repeats: true)
                }
            }
            
        } else if ( currentState == PinState.pinConfirm ){
            if ( sender.accessibilityIdentifier == "del" ){
                currentPinConfirm = currentPinConfirm.substring(0, end: currentPinConfirm.len() - 1)
                self.showPins( self.pinView, numOfPins : currentPinConfirm.len() )
                
            } else if ( sender.accessibilityIdentifier == "#" ){

            } else {
                    currentPinConfirm = String( format : "%@%@", currentPinConfirm, (sender.titleLabel?.text)! )
                    //sender.titleLabel?.text?.printIt(__FILE__, line: __LINE__ )
                    //currentPinConfirm.printIt(__FILE__, line: __LINE__ )
                    
                    self.showPins( self.pinView, numOfPins : currentPinConfirm.len() )
                    
                    if ( currentPinConfirm.len() == 4){
                        //"next event".printIt(__FILE__, line: __LINE__ )
                        tm = NSTimer.scheduledTimerWithTimeInterval(  0.5, target: self, selector: #selector(PinLoginCreate.inactivityExpires), userInfo: nil, repeats: true)
                    }
            }
        }

    }
    
    func inactivityExpires() {
        if ( tm != nil ){
            tm.invalidate()
        }
        //"inactivityExpires".printIt(__FILE__, line: __LINE__ )
        //self.next.sendActionsForControlEvents(UIControlEvents.TouchUpInside)
        
        if ( currentState == PinState.pin ) {
            //"PinState.pin".printIt(__FILE__, line: __LINE__ )
            currentState = PinState.pinConfirm
            self.next.sendActionsForControlEvents(UIControlEvents.TouchUpInside)
            
        } else if ( currentState == PinState.pinConfirm ){
            //"PinState.pinConfirm".printIt(__FILE__, line: __LINE__ )
            cancel.accessibilityIdentifier = "Done"
            cancel.sendActionsForControlEvents(UIControlEvents.TouchUpInside)
        }
        
       // NSNotificationCenter.defaultCenter().postNotificationName("InactivityIdentifier", object: nil)
    }


    override func drawRect( rect : CGRect ){
        let  w : CGFloat = self.bounds.size.width
        let  h : CGFloat = self.bounds.size.height
        
        let ctx : CGContextRef = UIGraphicsGetCurrentContext()!
        
        let colorIndex : CGFloat = 240
        let colorBack = UIColor(red: colorIndex/255.0, green: colorIndex/255.0, blue: colorIndex/255.0, alpha: 1.0).CGColor
        
        
       if ( ( currentState == PinState.pin ) || ( currentState == PinState.pinConfirm ) ) {
            CGContextSetFillColorWithColor(ctx, colorBack );
            CGContextFillRect(ctx, CGRect(x: 0, y: 0, width: w, height: h * 0.25) )
            
            CGContextSetFillColorWithColor(ctx, UIColor.redColor().CGColor );
            CGContextFillRect(ctx, CGRect(x: 0, y: h * 0.25, width: w, height: h * 0.75) )
     
       } else {

            CGContextSetFillColorWithColor(ctx, colorBack );
            CGContextFillRect(ctx, CGRect(x: 0, y: 0, width: w, height: h * 0.75) )
            
            CGContextSetFillColorWithColor(ctx, UIColor.redColor().CGColor );
            CGContextFillRect(ctx, CGRect(x: 0, y: h * 0.75, width: w, height: h * 0.25) )
        }
        
    }
    
    override func layoutSubviews(){
        super.layoutSubviews()
        
        let  w : CGFloat = self.bounds.size.width
        let  h : CGFloat = self.bounds.size.height
        
        //title.frame = CGRect( w * 0.1, h * 0.01, w * 0.8, h * 0.12)
        //message.frame = CGRect( w * 0.1, h * 0.13, w * 0.8, h * 0.12)
        title.frame = CGRect( x: w * 0.1, y: h * 0.01, width: w * 0.8, height: h * 0.06)
        message.frame = CGRect( x: w * 0.1, y: h * 0.07, width: w * 0.8, height: h * 0.06)
        
        //inputEntry.frame = CGRect( w * 0.1, h * 0.25, w * 0.8, h * 0.15)
        inputEntry.frame = CGRect( x: w * 0.1, y: h * 0.13, width: w * 0.8, height: h * 0.08)
        inputEntry.layer.sublayerTransform = CATransform3DMakeTranslation( w * 0.1, 0, 0);
        inputEntry.layer.borderWidth = 1
        inputEntry.layer.cornerRadius = h * 0.04
        inputEntry.layer.borderColor = UIColor.clearColor().CGColor
        
        //pinView.frame = CGRect( w * 0.1, h * 0.24, w * 0.8, h * 0.14)
        pinView.frame = CGRect( x: w * 0.1, y: h * 0.12, width: w * 0.8, height: h * 0.06)
        cancel.frame = CGRect( x: w * 0.93, y: h * 0.01, width: w * 0.05, height: h * 0.05)

        //keyPad.frame = CGRect( w * 0.2, h * 0.45, w * 0.6, h * 0.5)
        keyPad.frame = CGRect( x: w * 0.2, y: h * 0.3, width: w * 0.6, height: h * 0.6)
        
        self.adjustPins( pinView )

        self.adjustKeyPad(keyPad.frame)

        if ( currentState == PinState.user ){
            inputEntry.text = self.currentUser
            inputEntry.placeholder = "email@host.com"
            inputEntry.secureTextEntry = false
            
            message.text = "Please enter your username (email)"
            inputEntry.hidden = false
            pinView.hidden = true
            keyPad.hidden = true
        } else if ( currentState == PinState.password ){
            inputEntry.text = self.currentPassword
            inputEntry.placeholder = "password"
            inputEntry.secureTextEntry = true
            
            message.text = "Please enter your password"
            inputEntry.hidden = false
            pinView.hidden = true
            keyPad.hidden = true
        } else if ( currentState == PinState.pin ){
            inputEntry.placeholder = "pin"
          
            //self.showPins( self.pinView, numOfPins :  0 )

            message.text = "Please enter your pin"
            inputEntry.hidden = true
            pinView.hidden = false
            keyPad.hidden = false
            
            self.bringSubviewToFront(keyPad)
            self.clearPinValues(self.pinView)
            self.setFocus( self.pinView, idx : -1 )

        } else if ( currentState == PinState.pinConfirm ){
            inputEntry.placeholder = "confirm pin"
            message.text = "Please confirm your pin"
            inputEntry.hidden = true
            pinView.hidden = false
            keyPad.hidden = false
            
            //self.showPins( self.pinView, numOfPins :  0 )
         
            self.clearPinValues(self.pinView)
            self.setFocus( self.pinView, idx : -1 )
        }
        
        if ( currentState == PinState.user ){
            previous.hidden = true
            next.hidden = false
            
            previous.frame = CGRect( x: w * 0.05, y: h * 0.8, width: w * 0.05, height: h * 0.15)
            previous.layer.cornerRadius = h * 0.04
            
            next.frame = CGRect( x: w * 0.9, y: h * 0.8, width: w * 0.05, height: h * 0.15)
            next.layer.cornerRadius = h * 0.04
            
        } else {
            previous.hidden = false
            next.hidden = false

            previous.frame = CGRect( x: w * 0.05, y: h * 0.8, width: w * 0.05, height: h * 0.15)
            previous.layer.cornerRadius = h * 0.04
            
            next.frame = CGRect( x: w * 0.9, y: h * 0.8, width: w * 0.05, height: h * 0.15)
            next.layer.cornerRadius = h * 0.04
        }
        
        self.setNeedsDisplay()
    }
    
    func adjustPins( pinVw : UIView ) {
        let  w : CGFloat = pinVw.bounds.size.width
        let  h : CGFloat = pinVw.bounds.size.height
        let cellWidth = w / CGFloat(pinVw.subviews.count)
        
        //for ( var i = 0; i < pinVw.subviews.count; i++ ){
        for i in 0 ..< pinVw.subviews.count{
            
            if ( pinVw.subviews[i] is UIButton ){
                //print( "\(i) " )
                
                let pinFld = pinVw.subviews[i] as! UIButton
                pinFld.frame = CGRect( x: (cellWidth * CGFloat(i)) + (cellWidth * 0.25), y: h * 0.1, width: cellWidth * 0.2, height: cellWidth * 0.2 )
                pinFld.layer.cornerRadius = cellWidth * 0.1

            }
            
        }
    }
    
    func showPins( pinVw : UIView, numOfPins : Int ) {
        var j : Int = 0
        
        //for ( var i = 0; i < pinVw.subviews.count; i++ ){
        for i in 0 ..< pinVw.subviews.count{
            
            if ( pinVw.subviews[i] is UIButton ){
                let pinFld = pinVw.subviews[i] as! UIButton
                if ( j < numOfPins ){
                    pinFld.hidden = false
                } else {
                    pinFld.hidden = true
                }

                j = j + 1
            }
            
        }
        
        //"\(j)".printIt(__FILE__, line: __LINE__ )

        //if ( j == 3 ){
        //    "delay".printIt(__FILE__, line: __LINE__ )
        //}
    }
   
    func clearPinValues( pinVw : UIView ) {
        //for ( var i = 0; i < pinVw.subviews.count; i++ ){
        for i in  0 ..< pinVw.subviews.count{
            if ( pinVw.subviews[i] is UITextField ){
                let pinFld = pinVw.subviews[i] as! UITextField
                 pinFld.text = ""
            }
        }
    }
    
    
    func setFocus( pinVw : UIView, idx : Int ) {
        //for ( var i = 0; i < pinVw.subviews.count; i++ ){
        for i in 0 ..< pinVw.subviews.count{
            
            if ( pinVw.subviews[i] is UITextField ){
                if( i > idx ){
                    let pinFld = pinVw.subviews[i] as! UITextField
                   pinFld.becomeFirstResponder()
                    break
                }
            }
            
        }
    }

    
    func createPinView(frm: CGRect) -> UIView {
        let rView = UIView(frame: frm)
        //let colorIndex :CGFloat = 220.0

        let pin1 = UIButton(frame: CGRectZero )
        //pin1.setTitle("1", forState: UIControlState.Normal)
        //pin1.addTarget(self, action: "keyPadAction:", forControlEvents: UIControlEvents.TouchUpInside)
        pin1.backgroundColor = UIColor.redColor()
        pin1.layer.borderColor = UIColor.whiteColor().CGColor
        pin1.layer.borderWidth = 0
        rView.addSubview(pin1)
        
        let pin2 = UIButton(frame: CGRectZero )
        //pin2.setTitle("1", forState: UIControlState.Normal)
        //pin1.addTarget(self, action: "keyPadAction:", forControlEvents: UIControlEvents.TouchUpInside)
        pin2.backgroundColor = UIColor.redColor()
        pin2.layer.borderColor = UIColor.whiteColor().CGColor
        pin2.layer.borderWidth = 0
        rView.addSubview(pin2)
        
        let pin3 = UIButton(frame: CGRectZero )
        //pin3.setTitle("1", forState: UIControlState.Normal)
        //pin1.addTarget(self, action: "keyPadAction:", forControlEvents: UIControlEvents.TouchUpInside)
        pin3.backgroundColor = UIColor.redColor()
        pin3.layer.borderColor = UIColor.whiteColor().CGColor
        pin3.layer.borderWidth = 0
        rView.addSubview(pin3)
        
        let pin4 = UIButton(frame: CGRectZero )
        //pin4.setTitle("1", forState: UIControlState.Normal)
        //pin1.addTarget(self, action: "keyPadAction:", forControlEvents: UIControlEvents.TouchUpInside)
        pin4.backgroundColor = UIColor.redColor()
        pin4.layer.borderColor = UIColor.whiteColor().CGColor
        pin4.layer.borderWidth = 0
        rView.addSubview(pin4)

        
        rView.backgroundColor = UIColor.whiteColor()
        rView.layer.borderWidth =  1
        rView.layer.cornerRadius = 8
        rView.layer.borderColor = UIColor.whiteColor().CGColor
        return(rView)
    }
    
    func createKeyPadView(frm: CGRect) -> UIView {
        let rView = UIView(frame: frm)
//        let colorIndex :CGFloat = 220.0
        btn1 = UIButton(frame: CGRectZero )
        btn1.setTitle("1", forState: UIControlState.Normal)
        btn1.accessibilityIdentifier = "1"
        btn1.addTarget(self, action: #selector(PinLoginCreate.keyPadAction(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        btn1.backgroundColor = UIColor.redColor()
        btn1.layer.borderColor = UIColor.whiteColor().CGColor
        btn1.layer.borderWidth = 0
        
        btn2 = UIButton(frame: CGRectZero )
        btn2.setTitle("2", forState: UIControlState.Normal)
        btn2.accessibilityIdentifier = "2"
        btn2.addTarget(self, action: #selector(PinLoginCreate.keyPadAction(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        btn2.backgroundColor = UIColor.redColor()
        btn2.layer.borderColor = UIColor.whiteColor().CGColor
        btn2.layer.borderWidth = 0
        
        btn3 = UIButton(frame: CGRectZero )
        btn3.setTitle("3", forState: UIControlState.Normal)
        btn3.accessibilityIdentifier = "3"
        btn3.addTarget(self, action: #selector(PinLoginCreate.keyPadAction(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        btn3.backgroundColor = UIColor.redColor()
        btn3.layer.borderColor = UIColor.whiteColor().CGColor
        btn3.layer.borderWidth = 0
        
        btn4 = UIButton(frame: CGRectZero )
        btn4.setTitle("4", forState: UIControlState.Normal)
        btn4.accessibilityIdentifier = "4"
        btn4.addTarget(self, action: #selector(PinLoginCreate.keyPadAction(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        btn4.backgroundColor = UIColor.redColor()
        btn4.layer.borderColor = UIColor.whiteColor().CGColor
        btn4.layer.borderWidth = 0
        
        btn5 = UIButton(frame: CGRectZero )
        btn5.setTitle("5", forState: UIControlState.Normal)
        btn5.accessibilityIdentifier = "5"
        btn5.addTarget(self, action: #selector(PinLoginCreate.keyPadAction(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        btn5.backgroundColor = UIColor.redColor()
        btn5.layer.borderColor = UIColor.whiteColor().CGColor
        btn5.layer.borderWidth = 0
        
        btn6 = UIButton(frame: CGRectZero )
        btn6.setTitle("6", forState: UIControlState.Normal)
        btn6.accessibilityIdentifier = "6"
        btn6.addTarget(self, action: #selector(PinLoginCreate.keyPadAction(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        btn6.backgroundColor = UIColor.redColor()
        btn6.layer.borderColor = UIColor.whiteColor().CGColor
        btn6.layer.borderWidth = 0
        
        btn7 = UIButton(frame: CGRectZero )
        btn7.setTitle("7", forState: UIControlState.Normal)
        btn7.accessibilityIdentifier = "7"
        btn7.addTarget(self, action: #selector(PinLoginCreate.keyPadAction(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        btn7.backgroundColor = UIColor.redColor()
        btn7.layer.borderColor = UIColor.whiteColor().CGColor
        btn7.layer.borderWidth = 0
        
        btn8 = UIButton(frame: CGRectZero )
        btn8.setTitle("8", forState: UIControlState.Normal)
        btn8.accessibilityIdentifier = "8"
        btn8.addTarget(self, action: #selector(PinLoginCreate.keyPadAction(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        btn8.backgroundColor = UIColor.redColor()
        btn8.layer.borderColor = UIColor.whiteColor().CGColor
        btn8.layer.borderWidth = 0
        
        btn9 = UIButton(frame: CGRectZero )
        btn9.setTitle("9", forState: UIControlState.Normal)
        btn9.accessibilityIdentifier = "9"
        btn9.addTarget(self, action: #selector(PinLoginCreate.keyPadAction(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        btn9.backgroundColor = UIColor.redColor()
        btn9.layer.borderColor = UIColor.whiteColor().CGColor
        btn9.layer.borderWidth = 0
        
        btnPound = UIButton(frame: CGRectZero )
        //btnPound.setTitle("#", forState: UIControlState.Normal)
        btnPound.accessibilityIdentifier = "#"
        btnPound.addTarget(self, action: #selector(PinLoginCreate.keyPadAction(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        btnPound.backgroundColor = UIColor.redColor()
        btnPound.layer.borderColor = UIColor.whiteColor().CGColor
        btnPound.layer.borderWidth = 0
        
        btn0 = UIButton(frame: CGRectZero )
        btn0.setTitle("0", forState: UIControlState.Normal)
        btn0.accessibilityIdentifier = "0"
        btn0.addTarget(self, action: #selector(PinLoginCreate.keyPadAction(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        btn0.backgroundColor = UIColor.redColor()
        btn0.layer.borderColor = UIColor.whiteColor().CGColor
        btn0.layer.borderWidth = 0
        
        btnDel = UIButton(frame: CGRectZero )
        
        btnDel.setImage( UIImage(named: "backspace_white")!, forState: UIControlState.Normal)
 //       btnDel.setTitle("del", forState: UIControlState.Normal)
        btnDel.accessibilityIdentifier = "del"

        btnDel.addTarget(self, action: #selector(PinLoginCreate.keyPadAction(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        btnDel.backgroundColor = UIColor.redColor()
        btnDel.layer.borderColor = UIColor.whiteColor().CGColor
        btnDel.layer.borderWidth = 0
        
        rView.addSubview(btn1)
        rView.addSubview(btn2)
        rView.addSubview(btn3)
        rView.addSubview(btn4)
        rView.addSubview(btn5)
        rView.addSubview(btn6)
        rView.addSubview(btn7)
        rView.addSubview(btn8)
        rView.addSubview(btn9)
        rView.addSubview(btnPound)
        rView.addSubview(btn0)
        rView.addSubview(btnDel)

        
        rView.clipsToBounds = true
        //rView.backgroundColor = UIColor.whiteColor()
        rView.layer.borderWidth =  2
        rView.layer.cornerRadius = 8
        rView.layer.borderColor = UIColor.whiteColor().CGColor
        return(rView)
    }
    
    func adjustKeyPad(frm: CGRect)  {
        let  w : CGFloat = frm.size.width
        let  h : CGFloat = frm.size.height

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

    
    func run( usr: String, pwd: String, sent : (user: String, password: String,  pin: String) -> Void, cancel : (status: String) -> Void  ) {
        self.sentCB = sent
        self.cancelCB = cancel
        
        self.currentUser = usr
        self.currentPassword = pwd
        
        currentPin = ""
        currentPinConfirm = ""
        self.showPins( self.pinView, numOfPins : 0 )

        currentState = PinState.user
        self.layoutSubviews()
    }
    
    
    func registerAction(sender: UIButton!) {
        print("registerAction")
    }
    
    
}
