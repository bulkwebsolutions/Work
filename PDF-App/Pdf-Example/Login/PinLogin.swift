//
//  PinLogin.swift
//  Task Control
//
//  Created by John Blaine on 1/13/16.
//  Copyright © 2016 Trax USA Corporation. All rights reserved.
//
import UIKit

protocol PinDelegate {
    func pinCB(mLogin: PinLogin, pinLogIntoAccount pin : String );
    func pinCB(mLogin: PinLogin, changeLogInProcedure status : String );
    func pinCB(mLogin: PinLogin, touchIDLogin status : String );
    func pinCB(mLogin: PinLogin, pinChange pin : String );

}

class PinLogin: UIView, PinKBDelegate {
    let pinKB : PinLoginKB!
    var title : UILabel!
    var pinDots : PinLoginDots!
    var loginWithUsrName : UIButton!
    var changePinBtn : UIButton!
    var delegate: PinDelegate?
    
    init(frm: CGRect, name : String) {
        pinKB = PinLoginKB(frm: CGRectZero )
        pinDots = PinLoginDots(frm: CGRectZero )
        
        super.init(frame: frm)
        self.accessibilityIdentifier = name

        pinKB.delegate = self
        
        //title = UILabel(frame: CGRectZero, text : "Enter Your Pin", adjustFont: 4.0 )
        title = UILabel(frame: CGRectZero )
        title.text = "Enter Your Pin"
        title.textColor = UIColor.whiteColor()
        title.textAlignment = NSTextAlignment.Center
        title.font = UIFont.boldSystemFontOfSize(30)
        
        loginWithUsrName = UIButton(frame: CGRectZero )
        loginWithUsrName.setTitle("Sign in with different username", forState: UIControlState.Normal)
        loginWithUsrName.addTarget(self, action: #selector(PinLogin.signInWithUsrName(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        loginWithUsrName.titleLabel?.font = UIFont(name: (loginWithUsrName.titleLabel!.font?.fontName)!, size: (loginWithUsrName.titleLabel!.font?.pointSize)!)
        loginWithUsrName.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        loginWithUsrName.backgroundColor = UIColor.clearColor()
        loginWithUsrName.sizeToFit()
        loginWithUsrName.titleLabel?.font = UIFont.boldSystemFontOfSize(20)

        changePinBtn = UIButton(frame: CGRectZero )
        changePinBtn.setImage(UIImage(named: "change")!, forState: UIControlState.Normal)
        changePinBtn.addTarget(self, action: #selector(PinLogin.changePin(_:)), forControlEvents: UIControlEvents.TouchUpInside)
//        changePinBtn.titleLabel?.font = UIFont.boldSystemFontOfSize(50)

        self.addSubview(title)
        self.addSubview(pinKB)
        self.addSubview(pinDots)
        self.addSubview(loginWithUsrName)
        self.addSubview(changePinBtn)

        self.clipsToBounds = true
        self.layer.borderWidth = 1
//        self.layer.cornerRadius = self.frame.height * 0.01
        self.layer.cornerRadius = 2
//        self.layer.borderColor = UIColor.redColor().CGColor
//        self.layer.backgroundColor = UIColor.redColor().CGColor
        
//        self.layer.borderColor = UIColor(red: 0.263, green: 0.663, blue: 0.863, alpha: 1.0).CGColor
//        self.layer.backgroundColor = UIColor(red: 0.263, green: 0.663, blue: 0.863, alpha: 1.0).CGColor
        self.layer.borderColor = UIColor(red: 0.180, green: 0.635, blue: 0.863, alpha: 1.0).CGColor
        self.layer.backgroundColor = UIColor(red: 0.180, green: 0.635, blue: 0.863, alpha: 1.0).CGColor
        
        self.clearPins()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews(){
        super.layoutSubviews()
        
        let  w : CGFloat = self.bounds.size.width
        let  h : CGFloat = self.bounds.size.height
        
        title.frame = CGRect( x: w * 0.1, y: h * 0.01, width: w * 0.8, height: h * 0.12)
        pinDots.frame = CGRect( x: w * 0.05, y: h * 0.15, width: w * 0.9, height: h * 0.12)
        pinKB.frame = CGRect( x: w * 0.1, y: h * 0.3, width: w * 0.8, height: h * 0.5)
        loginWithUsrName.frame = CGRect( x: w * 0.1, y: h * 0.85, width: w * 0.8, height: h * 0.1)
        changePinBtn.frame = CGRect( x: w * 0.9, y: h * 0.85, width: w * 0.08, height: h * 0.1)
    }
    
    func signInWithUsrName(sender: UIButton!) {
        self.delegate?.pinCB(self, changeLogInProcedure: "")
    }
    
    func changePin(sender: UIButton!) {
        //"changePin".printIt(__FILE__, line: __LINE__ )
        
        self.delegate?.pinCB( self, pinChange : "change pin" );

    }
    
    func clearPins(){
        pinDots.showPins(0, animate : false )
    }
    
    func pinKBCB( controller: PinLoginKB, pinNum pin : String, delKey : Bool  ){
        //pin.printIt(__FILE__, line: __LINE__ )
        
        if ( pin == "#"){
            //"touch id".printIt(__FILE__, line: __LINE__ )
            self.delegate?.pinCB(self, touchIDLogin: pin)

        } else {
            
            if ( delKey == false ){
                pinDots.showPins(pin.len(), animate : true)
            } else {
                pinDots.showPins(pin.len(), animate : false)
            }
            
            if ( pin.len() == 4){
                pinDots.showPins(0, animate : false)
                pinKB.clear()
                self.delegate?.pinCB(self, pinLogIntoAccount: pin)
            }
        }
    }
    
}