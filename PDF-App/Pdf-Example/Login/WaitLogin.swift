//
//  WaitLogin.swift
//  Task Control
//
//  Created by John Blaine on 1/11/16.
//  Copyright © 2016 Trax USA Corporation. All rights reserved.
//

import UIKit

class WaitLogin: UIView {
    //typealias sentType = (name: String, title: String, user: String, password: String,  confirmPassword: String ) -> Void
    //typealias cancelType = (status: String) -> Void
    //private var sentCB: sentType?
    //private var cancelCB: cancelType?
    //enum RegisterState { case name; case title; case user; case password; case confirmPassword }
    
    //var title : UILabel!
    //var message : UILabel!
    //var username : UITextField!
    
    //var previous : UIButton!
    //var next : UIButton!
    //var vw : UIView!
    //var currentState : RegisterState!
    
    //var bubbles : [UIButton]!

    init(frm: CGRect) {
        
  
        super.init(frame: frm)
        
        /***
        bubbles = UIButton[10]
        
        for( var i = 0; i < 10; i++ ){
            let btn = UIButton(frame: CGRectZero )
            //bubbles[i] = UIButton(frame: CGRectZero )
            bubbles.append(btn)
            self.addSubview( btn )
        }
        ****/
        
        self.clipsToBounds = true
        self.layer.borderWidth = 1
        self.layer.cornerRadius = self.frame.height * 0.08
        self.layer.borderColor = UIColor.clearColor().CGColor
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func btnAction(sender: UIButton!) {
        
        
        
    }
    
    /***
     func sentAction(sender: UIButton!) {
     
     let usr = username.text!
     self.sentCB!(emailAdr: usr)
     }
     ****/
    
    func cancelAction(sender: UIButton!) {
        //self.cancelCB!(status: "cancel" )
    }
    
    override func drawRect( rect : CGRect ){
        let  w : CGFloat = self.bounds.size.width
        let  h : CGFloat = self.bounds.size.height
        
        let ctx : CGContextRef = UIGraphicsGetCurrentContext()!
        
        let colorIndex : CGFloat = 240
        let colorBack = UIColor(red: colorIndex/255.0, green: colorIndex/255.0, blue: colorIndex/255.0, alpha: 1.0).CGColor
        
        CGContextSetFillColorWithColor(ctx, colorBack );
        CGContextFillRect(ctx, CGRect(x: 0, y: 0, width: w, height: h * 0.75) )
        
        CGContextSetFillColorWithColor(ctx, UIColor.redColor().CGColor );
        CGContextFillRect(ctx, CGRect(x: 0, y: h * 0.75, width: w, height: h * 0.25) )
    }
    
    override func layoutSubviews(){
        super.layoutSubviews()
        
        let  w : CGFloat = self.bounds.size.width
        let  h : CGFloat = self.bounds.size.height
        
        /***
        for( var i = 0; i < 10; i++ ){
            bubbles[i] = UIButton(frame: CGRectZero )
            bubbles[i].frame = CGRect( w * (0.1 * CGFloat(i)), h * 0.2, h * 0.1, h * 0.1)
        }
        ****/
        
        /***
        title.frame = CGRect( w * 0.1, h * 0.01, w * 0.8, h * 0.12)
        message.frame = CGRect( w * 0.1, h * 0.15, w * 0.8, h * 0.12)
        
        username.frame = CGRect( w * 0.1, h * 0.25, w * 0.8, h * 0.15)
        username.layer.sublayerTransform = CATransform3DMakeTranslation( w * 0.1, 0, 0);
        username.layer.borderWidth = 1
        username.layer.cornerRadius = h * 0.04
        username.layer.borderColor = UIColor.clearColor().CGColor
        ***/
        
    }
    
    /***
    func run( txt : String, sent : (name: String, title: String, user: String, password: String,  confirmPassword: String) -> Void, cancel : (status: String) -> Void  ) {
        self.sentCB = sent
        self.cancelCB = cancel
        
        self.layoutSubviews()
        
    }
    ***/
    
    
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
