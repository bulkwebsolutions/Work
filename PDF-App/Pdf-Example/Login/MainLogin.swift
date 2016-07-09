 //
//  MainLogin.swift
//  Task Control
//
//  Created by John Blaine on 1/13/16.
//  Copyright © 2016 Trax USA Corporation. All rights reserved.
//

import UIKit

protocol AccountDelegate {
    func accountCB(mLogin: MainLogin, logIntoAccount usr : String, pwd : String  )
    func accountCB(mLogin: MainLogin, registerAccount usr : String, pwd : String, name : String, title : String  )
    func accountCB(mLogin: MainLogin, createPin usr : String, pwd : String, pin : String )
    func accountCB(mLogin: MainLogin, changePin usr : String, pwd : String, pin : String )
    func accountCB(mLogin: MainLogin, forgetPassword usr : String)
    func accountCB(mLogin: MainLogin, loginWithPin pin : String )
    func accountCB(mLogin: MainLogin, changeLogInProcedure status : String )
    func accountCB(mLogin: MainLogin, setupCompleted status : String )
    func accountCB(mLogin: MainLogin, LogOut status : String )
    func animateViewMoving (moveValuePortrait:CGFloat, moveValueLandscape:CGFloat)
    func accountCB(mLogin: MainLogin, TouchIDLogin status : String )

}

class MainLogin: UIView, LoginTraxDelegate, PinDelegate, pinGenerateDelegate {
    var delegate: AccountDelegate?
    
    enum Screen:String {
        case usrLogin = "login"
        case forgetPwd = "forgetPassword"
        //case regAccount = "regAccount"
        case regAccountAll = "regAccountAll"
        case pinGen = "pinGenerate"
        case pinLogin = "pinLogin"
    }
    
    enum loginMethodType { case conventional; case pin }
    let login : LoginTrax
    let forgetPassword : ForgetPassword
    //let regAccount : Register
    let regAccountAll : RegisterAll
    
    let pinGenerate : PinLoginGenerate
    let pinLogin : PinLogin
    
    var loginMethod : loginMethodType = loginMethodType.conventional
    
    
    init(frm: CGRect  ) {
        
        login = LoginTrax(frm: CGRectZero, name : Screen.usrLogin.rawValue )
        forgetPassword = ForgetPassword(frm: CGRectZero, name : Screen.forgetPwd.rawValue )
        regAccountAll = RegisterAll(frm: CGRectZero, name : Screen.regAccountAll.rawValue )
        pinGenerate = PinLoginGenerate(frm: CGRectZero, name : Screen.pinGen.rawValue )
        pinLogin = PinLogin(frm: CGRectZero, name : Screen.pinLogin.rawValue )
        
        
        super.init(frame: frm)
        login.delegate = self
        
        self.addSubview(login)
        self.addSubview(forgetPassword)
        self.addSubview(regAccountAll)
        self.addSubview(pinGenerate)
        self.addSubview(pinLogin)

        
        pinGenerate.delegate = self
        pinLogin.delegate = self
        
        let usr = "login-usr".getData()
        self.login.setInfo( usr, pwd : "" )
        
//        let usr = QuickTurnSingleton.sharedInstance.getData("login-usr")
//        self.login.setInfo( usr, pwd : "" )

//        var loggedUser = User()
//        do {
//            loggedUser = try UsersDataHelper.getCurrentUser()!
//            self.login.setInfo( loggedUser.username!, pwd : loggedUser.password!)
//
//        } catch {}
//        
//        
//        
//        let method = global.trax.getData("loginMethod")
        let method = ""
        
        if ( ( method == "" ) || ( method == "conventional" ) ){
            loginMethod = loginMethodType.conventional
            self.show(Screen.usrLogin)
        } else {
            loginMethod = loginMethodType.pin
            self.show(Screen.pinLogin)
        }
        
        
        self.layer.borderWidth = 0
        self.layer.borderColor = UIColor.grayColor().CGColor
        self.backgroundColor = UIColor.clearColor()
        self.layer.cornerRadius = 2

    }
    
    override func layoutSubviews(){
        super.layoutSubviews()
        
        let  w : CGFloat = self.bounds.size.width
        let  h : CGFloat = self.bounds.size.height

        login.frame = CGRect(x: 0, y: h * 0.25, width: w, height: h * 0.5 )
        forgetPassword.frame = CGRect(x: 0, y: h * 0.25, width: w, height: h * 0.5 )
        //regAccount.frame = CGRect(0, h * 0.25, w, h * 0.5)
        
        regAccountAll.frame = CGRect(x: 0, y: h * 0.1, width: w, height: h * 0.8 )
        
        pinGenerate.frame = CGRect(x: 0, y: 0, width: w, height: h)
        pinLogin.frame = CGRect(x: 0, y: 0, width: w, height: h)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func touchIDNotAvailable(){
        pinLogin.pinKB.btnPound.accessibilityIdentifier = "?"
        pinLogin.pinKB.btnPound.setImage(nil, forState: UIControlState.Normal)
        
    }
    
    
    func show( _screen : Screen ){
        
//        do {
//            let count = try UsersDataHelper.count()
//            if ( count > 0 ){
//                login.switchPinLabel.hidden = false
//                login.switchPin.hidden = false
//            } else {
//                login.switchPinLabel.hidden = true
//                login.switchPin.hidden = true
//            }
//            
//        } catch {
//        }

        let vName : String = _screen.rawValue
        
        for i in 0 ..< self.subviews.count{
             if ( self.subviews[i].isKindOfClass(UIView)  == true ){
                let vw = self.subviews[i] as UIView
                
                if ( vw.accessibilityIdentifier == vName ){
                     vw.hidden = false
                } else {
                    vw.hidden = true
                }
            }
        }
    }
    
    
    func runCreatePin( usr : String, pwd : String){
        //"runCreatePin".printIt(__FILE__ , line: __LINE__ )
        
       self.pinGenerate.setupBypassUsrAndPwd(usr, pwd: pwd )
        
    }
    
    func setLoginMethod( method : loginMethodType ){
        
        loginMethod = method
        
        if ( loginMethod == loginMethodType.pin ) {
//            global.trax.setData("loginMethod", val: "pin" )
            self.show(Screen.pinLogin)
        } else {
//            global.trax.setData("loginMethod", val: "conventional" )
            self.show(Screen.usrLogin)
        }
        
    }
    
    func LoginTraxCB( status: String, usr : String, pwd : String ){
        
//        let usr = "login-usr".getData()
//        self.login.setInfo( usr, pwd : "" )

        "login-usr".setData(usr)
        delegate?.accountCB( self, logIntoAccount: usr, pwd: pwd)
    }
    
    func ForgetPasswordCB( status: String ){
        
        self.show(Screen.forgetPwd)

        forgetPassword.run( "forget password",
            sent : { (emailAdr : String) -> Void in
                self.delegate?.accountCB(self, forgetPassword: emailAdr )
            },
            
            cancel : { (status: String) -> Void  in
                self.show(Screen.usrLogin)
        })
    }
    
    func PinCreateCB( status: String,  usr : String, pwd : String ){
        
//        do {
//            let count = try UsersDataHelper.count()
//            if ( count > 0 ){
//                self.setLoginMethod( loginMethodType.pin )
//            } else {
//                
//                let alert = UIAlertView(title: "PIN",
//                    message: "No PIN data on the device database.",
//                    delegate: nil,
//                    cancelButtonTitle: "OK")
//                alert.show()
//                
//                self.setLoginMethod( loginMethodType.conventional )
//            }
//            
//        } catch {
//        }
        
        
    }
    
    
    func RegisterCB( status: String ){
        
        if ( status == "Register Step" ){
            
            /***
            self.show(Screen.regAccount)

            regAccount.run( "register",
                sent : { (name: String, title: String, user: String, password: String,  confirmPassword: String ) -> Void in
                    self.delegate?.accountCB(self, registerAccount: user, pwd: password, name: name, title: title)
                },
                
                cancel : { (status: String) -> Void  in
                    self.show(Screen.usrLogin)

            })
            ***/
            
        } else {
            
            self.show(Screen.regAccountAll)

            regAccountAll.run( "register",
                sent : { (name: String, title: String, user: String, password: String,  confirmPassword: String ) -> Void in
                    self.delegate?.accountCB(self, registerAccount: user, pwd: password, name: name, title: title)
                },
                
                cancel : { (status: String) -> Void  in
                    self.show(Screen.usrLogin)
            })
        }
    }
    
    func registerSuccessful( user: String, password: String ){
        self.regAccountAll.hidden = true
        
        self.login.setInfo( user, pwd : password)
    }
    
    func pinCB(mLogin: PinLogin, pinLogIntoAccount pin : String ){
        self.delegate?.accountCB(self, loginWithPin: pin )
    }
    
    func pinCB(mLogin: PinLogin, changeLogInProcedure status : String ){
        self.setLoginMethod( loginMethodType.conventional )
        self.show(Screen.usrLogin)
        self.delegate?.accountCB( self, changeLogInProcedure: status )
    }
    
    
    func animateViewMoving (moveValuePortrait:CGFloat, moveValueLandscape:CGFloat){
        self.delegate?.animateViewMoving(moveValuePortrait, moveValueLandscape:moveValueLandscape)
        
    }
    
    func pinGenerate(controller: PinLoginGenerate, pinCreate pin : String, usr : String, pwd : String  ){

        self.show( Screen.usrLogin )

        
        if ( pinGenerate.currentAction == PinLoginGenerate.action.createPin ){
            self.delegate?.accountCB(self, createPin: usr, pwd: pwd, pin: pin )
        } else {
            self.delegate?.accountCB(self, changePin: usr, pwd: pwd, pin: pin )
        }

    }
    
    func pinGenerateCancel(controller: PinLoginGenerate ){
        
        //"pinGenerateCancel".printIt(__FILE__, line: __LINE__ )

        if ( loginMethod == loginMethodType.conventional ){
            self.show( Screen.usrLogin )
        } else {
            self.show( Screen.pinLogin )
        }
        
        
    }

    func pinCB(mLogin: PinLogin, touchIDLogin status : String ){
        //"touchIDLogin".printIt(__FILE__, line: __LINE__ )
        
        self.delegate?.accountCB(self, TouchIDLogin : status )
    }
    
    func pinCB(mLogin: PinLogin, pinChange pin : String ){
        
        pinGenerate.currentAction = PinLoginGenerate.action.changePin

//        pinGenerate.title.text = "Change PIN"
//        pinGenerate.currentLoginUser = global.trax.currentUser
//        pinGenerate.currentUser = global.trax.currentUser
//        pinGenerate.currentPassword = ""
//        pinGenerate.inputEntry.text = global.trax.currentUser
        self.show( Screen.pinGen )

    }

    
}
