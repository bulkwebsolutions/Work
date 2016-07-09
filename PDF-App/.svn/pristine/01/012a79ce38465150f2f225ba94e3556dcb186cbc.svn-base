//
//  Register.swift
//  Task Control
//
//  Created by John Blaine on 1/8/16.
//  Copyright © 2016 Trax USA Corporation. All rights reserved.
//

import UIKit

class Register: UIView {
    typealias sentType = (name: String, title: String, user: String, password: String,  confirmPassword: String ) -> Void
    typealias cancelType = (status: String) -> Void
    private var sentCB: sentType?
    private var cancelCB: cancelType?
    enum RegisterState { case name; case title; case user; case password; case confirmPassword }

    var title : UILabel!
    var message : UILabel!
    var username : UITextField!

    var previous : UIButton!
    var next : UIButton!
    var vw : UIView!
    var currentState : RegisterState!
    
    var currentName: String! = ""
    var currentTitle: String! = ""
    var currentUser: String! = ""
    var currentPassword: String! = ""
    var currentConfirmPassword: String! = ""

    init(frm: CGRect, name : String) {
        
        super.init(frame: frm)
        
        self.accessibilityIdentifier = name
        
        currentState = RegisterState.name
        
        let colorIndex :CGFloat = 220
        
        //title = UILabel(frame: CGRectZero, text : "Register", adjustFont: 4.0 )
        title = UILabel(frame: CGRectZero )
        title.text = "Register"
//        title.textColor = UIColor.redColor()
        title.textColor = UIColor(red: 0.180, green: 0.635, blue: 0.863, alpha: 1.0)

        title.textAlignment = NSTextAlignment.Center
        
        //message = UILabel(frame: CGRectZero, text : "Please enter your full name", adjustFont: -4.0 )
        message = UILabel(frame: CGRectZero )
        message.text = "Please enter your full name"
//        message.textColor = UIColor.redColor()
        message.textColor = UIColor(red: 0.180, green: 0.635, blue: 0.863, alpha: 1.0)
        message.textAlignment = NSTextAlignment.Center
        
        //username = UITextField(frame: CGRectZero, placeHolder: "Full Name" )
        username = UITextField(frame: CGRectZero )
        username.placeholder = "Full Name" 
        username.backgroundColor = UIColor(red: colorIndex/255.0, green: colorIndex/255.0, blue: colorIndex/255.0, alpha: 1.0)
        username.layer.borderColor = UIColor(red: colorIndex/255.0, green: colorIndex/255.0, blue: colorIndex/255.0, alpha: 1.0).CGColor
        
        previous = UIButton(frame: CGRectZero )
        previous.setTitle("<<Previous", forState: UIControlState.Normal)
        previous.addTarget(self, action: #selector(Register.btnAction(_:)), forControlEvents: UIControlEvents.TouchUpInside)
//        previous.backgroundColor = UIColor.redColor()
        previous.backgroundColor = UIColor(red: 0.180, green: 0.635, blue: 0.863, alpha: 1.0)

        next = UIButton(frame: CGRectZero )
        next.setTitle("Next>>", forState: UIControlState.Normal)
        next.addTarget(self, action: #selector(Register.btnAction(_:)), forControlEvents: UIControlEvents.TouchUpInside)
//        next.backgroundColor = UIColor.redColor()
        next.backgroundColor = UIColor(red: 0.180, green: 0.635, blue: 0.863, alpha: 1.0)

        self.addSubview(title)
        self.addSubview(message)
        self.addSubview(username)
        self.addSubview(previous)
        self.addSubview(next)
        
        self.clipsToBounds = true
        self.layer.borderWidth = 1
//        self.layer.cornerRadius = self.frame.height * 0.08
        self.layer.cornerRadius = 20
        self.layer.borderColor = UIColor.clearColor().CGColor
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func btnAction(sender: UIButton!) {
        //username.text = "John Blaine"
        
        if ( sender.titleLabel?.text == "Next>>" ){
            if ( username.text == "" ){
//                let alert = UIAlertView(title: "Task List",
//                    message: "Blank entry.\nPlease try again.",
//                    delegate: nil,
//                    cancelButtonTitle: "OK")
//                alert.show()
                
                let title = "Task List"
                let message = "Blank entry.\nPlease try again."
                let alertView = UIAlertController(title: title, message: message, preferredStyle: .Alert)
                alertView.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
                UIApplication.sharedApplication().keyWindow?.rootViewController?.presentViewController(alertView, animated: true, completion: nil)

            } else {
                
                if ( currentState == RegisterState.name ){
                    currentName = username.text
                    currentState = RegisterState.title
                } else if ( currentState == RegisterState.title ){
                    currentTitle = username.text
                    currentState = RegisterState.user
                } else if ( currentState == RegisterState.user ){
                    currentUser = username.text
                    currentState = RegisterState.password
                } else if ( currentState == RegisterState.password ){
                    currentPassword = username.text
                    currentState = RegisterState.confirmPassword
                }
                
                username.text  = ""
                self.layoutSubviews()
            }
            
        } else if ( sender.titleLabel?.text == "<<Previous" ){
            if ( currentState == RegisterState.confirmPassword ){
                currentConfirmPassword = username.text
                currentState = RegisterState.password
            } else if ( currentState == RegisterState.password ){
                currentPassword = username.text
                currentState = RegisterState.user
            } else if ( currentState == RegisterState.user ){
                currentUser = username.text
                currentState = RegisterState.title
            } else if ( currentState == RegisterState.title ){
                currentTitle = username.text
                currentState = RegisterState.name
            }
            
            username.text  = ""
            self.layoutSubviews()
            
        } else {
            //let usr = username.text

            currentConfirmPassword = username.text // last field
            print(currentUser)
                        
            if ( currentPassword == currentConfirmPassword ){
                self.sentCB!(name: currentName, title: currentTitle, user: currentUser, password: currentPassword,  confirmPassword: currentConfirmPassword )
            } else {
//                let alert = UIAlertView(title: "Task List",
//                    message: "The password and confirmation password do not match! \nPlease try again.",
//                    delegate: nil,
//                    cancelButtonTitle: "OK")
//                alert.show()
                
                let title = "Task List"
                let message = "The password and confirmation password do not match! \nPlease try again."
                let alertView = UIAlertController(title: title, message: message, preferredStyle: .Alert)
                alertView.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
                UIApplication.sharedApplication().keyWindow?.rootViewController?.presentViewController(alertView, animated: true, completion: nil)

            }
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

    override func drawRect( rect : CGRect ){
        let  w : CGFloat = self.bounds.size.width
        let  h : CGFloat = self.bounds.size.height
        
        let ctx : CGContextRef = UIGraphicsGetCurrentContext()!
        
        let colorIndex : CGFloat = 240
        let colorBack = UIColor(red: colorIndex/255.0, green: colorIndex/255.0, blue: colorIndex/255.0, alpha: 1.0).CGColor
        
        CGContextSetFillColorWithColor(ctx, colorBack );
        CGContextFillRect(ctx, CGRect(x: 0, y: 0, width: w, height: h * 0.75) )
        
//        CGContextSetFillColorWithColor(ctx, UIColor.redColor().CGColor );
        CGContextSetFillColorWithColor(ctx, UIColor(red: 0.180, green: 0.635, blue: 0.863, alpha: 1.0).CGColor );
        CGContextFillRect(ctx, CGRect(x: 0, y: h * 0.75, width: w, height: h * 0.25) )
    }
    
    override func layoutSubviews(){
        super.layoutSubviews()
        
        let  w : CGFloat = self.bounds.size.width
        let  h : CGFloat = self.bounds.size.height
        
        title.frame = CGRect( x: w * 0.1, y: h * 0.01, width: w * 0.8, height: h * 0.12)
        message.frame = CGRect( x: w * 0.1, y: h * 0.15, width: w * 0.8, height: h * 0.12)
        
        username.frame = CGRect( x: w * 0.1, y: h * 0.25, width: w * 0.8, height: h * 0.15)
        username.layer.sublayerTransform = CATransform3DMakeTranslation( w * 0.1, 0, 0);
        username.layer.borderWidth = 1
        username.layer.cornerRadius = h * 0.04
        username.layer.borderColor = UIColor.clearColor().CGColor
        
        if ( currentState == RegisterState.name ){
            username.placeholder = "Full Name"
            next.setTitle("Next>>", forState: UIControlState.Normal)
            message.text = "Please enter your full name"
        } else if ( currentState == RegisterState.title ){
            username.placeholder = "Title"
            message.text = "Please enter your title"
        } else if ( currentState == RegisterState.user ){
            username.placeholder = "email@host.com"
            message.text = "Please enter your username (email)"
        } else if ( currentState == RegisterState.password ){
            username.placeholder = "Password"
            next.setTitle("Next>>", forState: UIControlState.Normal)
            message.text = "Please enter your password"
        } else if ( currentState == RegisterState.confirmPassword ){
            username.placeholder = "Confirm Password"
            next.setTitle("Done", forState: UIControlState.Normal)
            message.text = "Please confirm your password"
        }
    
        if ( currentState == RegisterState.name ){
            previous.hidden = true
            next.hidden = false
            
            previous.frame = CGRect( x: w * 0.1, y: h * 0.5, width: w * 0.3, height: h * 0.15)
            previous.layer.cornerRadius = h * 0.04
            
            next.frame = CGRect( x: w * 0.4, y: h * 0.5, width: w * 0.3, height: h * 0.15)
            next.layer.cornerRadius = h * 0.04
            
        } else {
            previous.hidden = false
            next.hidden = false
            
            previous.frame = CGRect( x: w * 0.1, y: h * 0.5, width: w * 0.3, height: h * 0.15)
            previous.layer.cornerRadius = h * 0.04
            
            next.frame = CGRect( x: w * 0.6, y: h * 0.5, width: w * 0.3, height: h * 0.15)
            next.layer.cornerRadius = h * 0.04
        }
        
    }
    
    
    func run( txt : String, sent : (name: String, title: String, user: String, password: String,  confirmPassword: String) -> Void, cancel : (status: String) -> Void  ) {
        self.sentCB = sent
        self.cancelCB = cancel
        
        //message.text = "Please enter your full name"
        currentState = RegisterState.name
        self.layoutSubviews()

    }

        
    func registerAction(sender: UIButton!) {
        print("registerAction")
    }
    
    func setAttribText( sysFontName : String, sysFontSize : CGFloat, leftText : String, middleText : String, rightText : String ) -> NSMutableAttributedString {
        let myString = String( format:"%@%@%@", leftText, middleText, rightText)
        var myMutableString = NSMutableAttributedString()
        
        myMutableString = NSMutableAttributedString(string: myString, attributes: [NSFontAttributeName:UIFont( name: sysFontName, size: sysFontSize - 6)!])
        myMutableString.addAttribute(NSFontAttributeName,
            value: UIFont( name: sysFontName, size: sysFontSize + 4)!,
            range: NSRange( location: leftText.lengthOfBytesUsingEncoding(NSUTF8StringEncoding), length: middleText.lengthOfBytesUsingEncoding(NSUTF8StringEncoding))
        )
        
        myMutableString.addAttribute(NSForegroundColorAttributeName,
            value: UIColor.whiteColor(),
            range: NSRange( location:0, length:myString.lengthOfBytesUsingEncoding(NSUTF8StringEncoding)))
        
        return( myMutableString )
    }
    
}
