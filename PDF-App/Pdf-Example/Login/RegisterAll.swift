//
//  RegisterAll.swift
//  Task Control
//
//  Created by John Blaine on 1/11/16.
//  Copyright © 2016 Trax USA Corporation. All rights reserved.
//

import UIKit

class RegisterAll: UIView, UITextFieldDelegate {
    typealias sentType = (name: String, title: String, user: String, password: String,  confirmPassword: String ) -> Void
    typealias cancelType = (status: String) -> Void
    private var sentCB: sentType?
    private var cancelCB: cancelType?
    enum RegisterState { case name; case title; case user; case password; case confirmPassword }
    
    var title : UILabel!
    
    var usernameTextFld : UITextField!
    var passwordTextFld : UITextField!
    var confirmPasswordTextFld : UITextField!
    var nameTextFld : UITextField!
    var titleTextFld : UITextField!

    var complete : UIButton!
    var cancel : UIButton!
    
    init(frm: CGRect, name : String) {
        
        super.init(frame: frm)
        self.accessibilityIdentifier = name

        let colorIndex :CGFloat = 220
        
//        title = UILabel(frame: CGRectZero, text : "Register", adjustFont: 4.0 )
        title = UILabel(frame: CGRectZero )
        title.text = "Register"
//        title.textColor = UIColor.redColor()
        title.backgroundColor = UIColor(red: 0.180, green: 0.635, blue: 0.863, alpha: 1.0)
        title.textAlignment = NSTextAlignment.Center
        
//        usernameTextFld = UITextField(frame: CGRectZero, placeHolder: "email@host.com" )
        usernameTextFld = UITextField(frame: CGRectZero )
        usernameTextFld.placeholder = "email@host.com"
        usernameTextFld.backgroundColor = UIColor(red: colorIndex/255.0, green: colorIndex/255.0, blue: colorIndex/255.0, alpha: 1.0)
        usernameTextFld.layer.borderColor = UIColor(red: colorIndex/255.0, green: colorIndex/255.0, blue: colorIndex/255.0, alpha: 1.0).CGColor
        usernameTextFld.delegate = self
        
//        passwordTextFld = UITextField(frame: CGRectZero, placeHolder: "Password" )
        passwordTextFld = UITextField(frame: CGRectZero  )
        passwordTextFld.placeholder = "Password"
        passwordTextFld.backgroundColor = UIColor(red: colorIndex/255.0, green: colorIndex/255.0, blue: colorIndex/255.0, alpha: 1.0)
        passwordTextFld.layer.borderColor = UIColor(red: colorIndex/255.0, green: colorIndex/255.0, blue: colorIndex/255.0, alpha: 1.0).CGColor
        passwordTextFld.delegate = self
        passwordTextFld.secureTextEntry = true
        passwordTextFld.autocorrectionType = UITextAutocorrectionType.No
    
        //confirmPasswordTextFld = UITextField(frame: CGRectZero, placeHolder: "Confirm Password" )
        confirmPasswordTextFld = UITextField(frame: CGRectZero )
        confirmPasswordTextFld.placeholder = "Confirm Password"
        confirmPasswordTextFld.backgroundColor = UIColor(red: colorIndex/255.0, green: colorIndex/255.0, blue: colorIndex/255.0, alpha: 1.0)
        confirmPasswordTextFld.layer.borderColor = UIColor(red: colorIndex/255.0, green: colorIndex/255.0, blue: colorIndex/255.0, alpha: 1.0).CGColor
        confirmPasswordTextFld.delegate = self
        confirmPasswordTextFld.secureTextEntry = true
        confirmPasswordTextFld.autocorrectionType = UITextAutocorrectionType.No
        
        //nameTextFld = UITextField(frame: CGRectZero, placeHolder: "Full Name" )
        nameTextFld = UITextField(frame: CGRectZero  )
        nameTextFld.placeholder = "Full Name"
        nameTextFld.backgroundColor = UIColor(red: colorIndex/255.0, green: colorIndex/255.0, blue: colorIndex/255.0, alpha: 1.0)
        nameTextFld.layer.borderColor = UIColor(red: colorIndex/255.0, green: colorIndex/255.0, blue: colorIndex/255.0, alpha: 1.0).CGColor
        nameTextFld.delegate = self
     
        //titleTextFld = UITextField(frame: CGRectZero, placeHolder: "Title" )
        titleTextFld = UITextField(frame: CGRectZero )
        titleTextFld.placeholder = "Title"
        titleTextFld.backgroundColor = UIColor(red: colorIndex/255.0, green: colorIndex/255.0, blue: colorIndex/255.0, alpha: 1.0)
        titleTextFld.layer.borderColor = UIColor(red: colorIndex/255.0, green: colorIndex/255.0, blue: colorIndex/255.0, alpha: 1.0).CGColor
        titleTextFld.delegate = self
        
        complete = UIButton(frame: CGRectZero )
        complete.setTitle("Complete", forState: UIControlState.Normal)
        complete.addTarget(self, action: #selector(RegisterAll.completeAction(_:)), forControlEvents: UIControlEvents.TouchUpInside)
//        complete.backgroundColor = UIColor.redColor()
        complete.backgroundColor = UIColor(red: 0.180, green: 0.635, blue: 0.863, alpha: 1.0)

        cancel = UIButton(frame: CGRectZero )
        cancel.setTitle("Cancel", forState: UIControlState.Normal)
        cancel.addTarget(self, action: #selector(RegisterAll.cancelAction(_:)), forControlEvents: UIControlEvents.TouchUpInside)
//        cancel.backgroundColor = UIColor.redColor()
        cancel.backgroundColor = UIColor(red: 0.180, green: 0.635, blue: 0.863, alpha: 1.0)

        self.addSubview(title)
        //self.addSubview(message)
        self.addSubview(usernameTextFld)
        self.addSubview(passwordTextFld)
        self.addSubview(confirmPasswordTextFld)
        self.addSubview(nameTextFld)
        self.addSubview(titleTextFld)
        
        
        self.addSubview(complete)
        self.addSubview(cancel)
        //self.addSubview(next)
        
        self.clipsToBounds = true
        self.layer.borderWidth = 1
        self.layer.cornerRadius = self.frame.height * 0.08
        self.layer.borderColor = UIColor.clearColor().CGColor
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func drawRect( rect : CGRect ){
        let  w : CGFloat = self.bounds.size.width
        let  h : CGFloat = self.bounds.size.height
        
        let ctx : CGContextRef = UIGraphicsGetCurrentContext()!
        
        let colorIndex : CGFloat = 240
        let colorBack = UIColor(red: colorIndex/255.0, green: colorIndex/255.0, blue: colorIndex/255.0, alpha: 1.0).CGColor
        
        CGContextSetFillColorWithColor(ctx, colorBack );
        CGContextFillRect(ctx, CGRect(x: 0, y: 0, width: w, height: h * 0.92) )
        
//        cancel.backgroundColor = UIColor(red: 0.180, green: 0.635, blue: 0.863, alpha: 1.0)
        CGContextSetFillColorWithColor(ctx, UIColor(red: 0.180, green: 0.635, blue: 0.863, alpha: 1.0).CGColor )
//        CGContextSetFillColorWithColor(ctx, UIColor.redColor().CGColor );
        CGContextFillRect(ctx, CGRect(x: 0, y: h * 0.92, width: w, height: h * 0.08) )
    }
    
    override func layoutSubviews(){
        super.layoutSubviews()
        
        let  w : CGFloat = self.bounds.size.width
        let  h : CGFloat = self.bounds.size.height
        
        title.frame = CGRect( x: w * 0.1, y: h * 0.01, width: w * 0.8, height: h * 0.12)
        
        nameTextFld.frame = CGRect( x: w * 0.1, y: h * 0.14, width: w * 0.8, height: h * 0.1)
        nameTextFld.layer.sublayerTransform = CATransform3DMakeTranslation( w * 0.1, 0, 0);
        nameTextFld.layer.borderWidth = 1
        nameTextFld.layer.cornerRadius = h * 0.02
        nameTextFld.layer.borderColor = UIColor.clearColor().CGColor
        
        titleTextFld.frame = CGRect( x: w * 0.1, y: h * 0.27, width: w * 0.8, height: h * 0.1)
        titleTextFld.layer.sublayerTransform = CATransform3DMakeTranslation( w * 0.1, 0, 0);
        titleTextFld.layer.borderWidth = 1
        titleTextFld.layer.cornerRadius = h * 0.02
        titleTextFld.layer.borderColor = UIColor.clearColor().CGColor
        
        usernameTextFld.frame = CGRect( x: w * 0.1, y: h * 0.4, width: w * 0.8, height: h * 0.1)
        usernameTextFld.layer.sublayerTransform = CATransform3DMakeTranslation( w * 0.1, 0, 0);
        usernameTextFld.layer.borderWidth = 1
        usernameTextFld.layer.cornerRadius = h * 0.02
        usernameTextFld.layer.borderColor = UIColor.clearColor().CGColor
        
        passwordTextFld.frame = CGRect( x: w * 0.1, y: h * 0.53, width: w * 0.8, height: h * 0.1)
        passwordTextFld.layer.sublayerTransform = CATransform3DMakeTranslation( w * 0.1, 0, 0);
        passwordTextFld.layer.borderWidth = 1
        passwordTextFld.layer.cornerRadius = h * 0.02
        passwordTextFld.layer.borderColor = UIColor.clearColor().CGColor
        
        confirmPasswordTextFld.frame = CGRect( x: w * 0.1, y: h * 0.66, width: w * 0.8, height: h * 0.1)
        confirmPasswordTextFld.layer.sublayerTransform = CATransform3DMakeTranslation( w * 0.1, 0, 0);
        confirmPasswordTextFld.layer.borderWidth = 1
        confirmPasswordTextFld.layer.cornerRadius = h * 0.02
        confirmPasswordTextFld.layer.borderColor = UIColor.clearColor().CGColor
        
        complete.frame = CGRect( x: w * 0.1, y: h * 0.79, width: w * 0.3, height: h * 0.11)
        complete.layer.cornerRadius = h * 0.02
       
        cancel.frame = CGRect( x: w * 0.6, y: h * 0.79, width: w * 0.3, height: h * 0.11)
        cancel.layer.cornerRadius = h * 0.02
    }
    
    func completeAction(sender: UIButton!) {
        
        let currentName: String! = nameTextFld.text
        let currentTitle: String! = titleTextFld.text
        let currentUser: String! = usernameTextFld.text?.lowercaseString
        let currentPassword: String! = passwordTextFld.text
        let currentConfirmPassword: String! = confirmPasswordTextFld.text

        if ( currentName == "" ){
            self.emptyFieldMessage( "name" )

        } else if ( currentTitle == "" ){
            self.emptyFieldMessage( "Title" )

        } else if ( currentUser == "" ){
            self.emptyFieldMessage( "username" )

        } else if ( currentPassword == "" ){
            self.emptyFieldMessage( "password" )

        } else if ( currentConfirmPassword == "" ){
            self.emptyFieldMessage( "confirm password" )

        } else {
            
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
    
    func emptyFieldMessage( field : String ) {
//        let alert = UIAlertView(title: "Task List",
//            message: "Your '\(field)' is empty!\nPlease try again.",
//            delegate: nil,
//            cancelButtonTitle: "OK")
//        alert.show()
        
        
        let title = "Task List"
        let message = "Your '\(field)' is empty!\nPlease try again."
        let alertView = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        alertView.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        UIApplication.sharedApplication().keyWindow?.rootViewController?.presentViewController(alertView, animated: true, completion: nil)

    }
    
    func cancelAction(sender: UIButton!) {
        self.cancelCB!(status: "cancel" )
    }

    
    func run( txt : String, sent : (name: String, title: String, user: String, password: String,  confirmPassword: String) -> Void, cancel : (status: String) -> Void  ) {
        self.sentCB = sent
        self.cancelCB = cancel
                
        passwordTextFld.text = ""
        confirmPasswordTextFld.text = ""

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
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        textField.autocorrectionType = UITextAutocorrectionType.No
        
            if (textField.respondsToSelector(Selector("inputAssistantItem"))) {
                textField.inputAssistantItem.leadingBarButtonGroups = []
                textField.inputAssistantItem.trailingBarButtonGroups = []
            }

        return true
    }
    
}