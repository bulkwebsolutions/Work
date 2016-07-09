//
//  MainTrax.swift
//
//  Created by John Blaine on 12/3/15.
//  Copyright © 2015 Trax. All rights reserved.
//

import UIKit
import CoreData

protocol MainTraxDelegate {
    //func setAnimateViewMoving (moveValuePortrait :CGFloat,moveValueLandscape :CGFloat)
    
    func loginCB(controller: MainTrax, TouchIDLogin status : String )
    func loginCB(controller: MainTrax, CreatedPin usr : String, pwd : String )
    func loginCB(controller: MainTrax, Register status : String )
    func loginCB(controller: MainTrax, successLogin usr : String, pwd : String, token : String, uid : String, uName : String, uTitle : String, uPin : String)
}

/**
 
 Overall Design
 
 |---------------|
 |               |     |---------------|
 |               |---> |               |
 |               |     |     Login     |
 |               | <---|               |
 |               |     |---------------|
 |               |
 |               |     |---------------|
 |               |---> |               |
 |   MainTrax    |     |    Register   |
 |               | <---|               |
 |               |     |---------------|
 |               |
 |               |     |---------------|
 |               |---> |               |
 |               |     |     Forget    |
 |               | <---|               |
 |               |     |---------------|
 |---------------|
 
 **/

class MainTrax: UIView, AccountDelegate {
    var delegate: MainTraxDelegate?
    let login : MainLogin
    var mObjContext: NSManagedObjectContext!

    var surveyAnswer : String!
    var progressView : UIActivityIndicatorView!
    enum Operation:String {
        case Login = "Login"
        case ReadSign = "ReadSign"
     }

    init(frm: CGRect ) {
        
        
        login = MainLogin( frm: CGRectZero )
        
        super.init(frame: frm)
        self.accessibilityIdentifier = "LogIn"
        self.surveyAnswer = ""
        
        login.delegate = self
        
        self.addSubview(login)
        
        progressView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.WhiteLarge)
        progressView.hidesWhenStopped = true
        self.addSubview(progressView)

        self.layer.borderWidth = 0
        self.layer.borderColor = UIColor.clearColor().CGColor
        self.clipsToBounds = true
        
        self.backgroundColor = UIColor.clearColor()


    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews(){
        super.layoutSubviews()
        
        let  w : CGFloat = self.bounds.size.width
        let  h : CGFloat = self.bounds.size.height
        
        login.frame = CGRect(x: 0, y: 0, width: w, height: h)
        self.layer.cornerRadius = h * 0.02
        
//        progressView.center = self.center
        progressView.frame = CGRect(x: 0, y: 0, width: w, height: h)
        
    }
    
    
    
    func Logoff(){
        /*
        NetLogin().LogOff( global.trax.hostIP, devID: global.trax.uuid, token : global.trax.token,
            success: {( status : String, data : TraxDict) -> Void in
                //status.printIt(__FILE__, line: __LINE__)
            },
            
            failed: { (status : String) -> Void in // Remove this for the SHIP product, testing only - bypass failed login
                //status.printIt(__FILE__, line: __LINE__)
        })
        */
    }
    
    
    
    func accountCB(mLogin: MainLogin, logIntoAccount usr : String, pwd : String  ){
        
        self.delegate?.loginCB(self, successLogin: usr, pwd: pwd, token: "uToken", uid: "uid", uName: "uName", uTitle: "uTitle", uPin: "uPin" )

//        self.progressView.startAnimating()
//        
//        NetLogin().LogIn(QuickTurnSingleton.sharedInstance.hostIP, user: usr, password: pwd,
//                         success: {( status : String, data : TraxDict) -> Void in
//
//                            let uid = data.gElm("employeeId") as! String
//                            let uName = data.gElm("employeeName") as! String
//                            let uTitle = data.gElm("employeeTitle") as! String
//                            let uToken = data.gElm("token") as! String
//                            let uPin = data.gElm("pin") as! String
//                            
//                            self.progressView.stopAnimating()
//                            dispatch_async(dispatch_get_main_queue()) {
//                                self.delegate?.loginCB(self, successLogin: usr, pwd: pwd, token: uToken, uid: uid, uName: uName, uTitle: uTitle, uPin: uPin)
//                            }
//            },
//                         
//                         failed: { (status : String) -> Void in 
//                            self.progressView.stopAnimating()
//                            print( "failed" )
//                            let uid = "722977"
//                            let uName = "Miguel Sosa"
//                            let uTitle = "Software Developer"
//                            let uToken = "4p1IeIwmY40cRG4eM8MTB36X066n318575547a0p848c781372"
//                            let uPin = "1456"
//                            
//                            dispatch_async(dispatch_get_main_queue()) {
//                                self.delegate?.loginCB(self, successLogin: usr, pwd: pwd, token: uToken, uid: uid, uName: uName, uTitle: uTitle, uPin: uPin)
//                            }
//        })

        
    }
    
    func accountCBEx(mLogin: MainLogin, logIntoAccount usr : String, pwd : String  ){
       self.delegate?.loginCB(self, successLogin: usr, pwd: pwd, token: "uToken", uid: "uid", uName: "uName", uTitle: "uTitle", uPin: "uPin" )

//        let encryptPwd = pwd
//        
//        let ePWd = try! encryptPwd.EncryptAES("TraX01MoBile5102")
//        let url = "\(QuickTurnSingleton.sharedInstance.hostIP)/IConnectorServ/jaxrs/loginTrax/loginDetail?app=QuickTurn&user=\(usr)&passwd=\(ePWd)&deviceId=uuid&latitude=0.0&longitude=0.0&token=0"
//        print( url )
//        
//        let requestURL: NSURL = NSURL(string: url)!
//        let urlRequest: NSMutableURLRequest = NSMutableURLRequest(URL: requestURL)
//        let session = NSURLSession.sharedSession()
//        session.configuration.timeoutIntervalForRequest = 10
//        session.configuration.timeoutIntervalForResource = 10
//        urlRequest.HTTPMethod = "POST"
//        
//        session.dataTaskWithRequest(urlRequest, completionHandler: {(data, response, error) in
//            
//            if let httpResponse = response as? NSHTTPURLResponse {
//                let statusCode = httpResponse.statusCode
//                
//                if (statusCode == 204) {
//                    print( "204" )
//                } else if (statusCode == 200) {
//                    print( "200" )
//                    
//                    let mHash = TraxDict(order: .yes)
//                    
//                    do {
//                        if data != nil {
//                            try mHash.parseJSON(data!)
//                            mHash.showAll(#file, line: #line)
//                            
//                            let uid = mHash.gElm("employeeId") as! String
//                            let uName = mHash.gElm("employeeName") as! String
//                            let uTitle = mHash.gElm("employeeTitle") as! String
//                            let uToken = mHash.gElm("token") as! String
//                            let uPin = mHash.gElm("pin") as! String
//                            
//                            dispatch_async(dispatch_get_main_queue()) {
//                                self.delegate?.loginCB(self, successLogin: usr, pwd: pwd, token: uToken, uid: uid, uName: uName, uTitle: uTitle, uPin: uPin)
//                            }
//                           
//                        }
//                        
//                    } catch {
//                    }
//                }
//                
//            } else {
//            }
//            }
//            ).resume()

    }
    
    func accountCB(mLogin: MainLogin, registerAccount usr : String, pwd : String, name : String, title : String  ){
        
        
    }
    
    func registerUserWithPin( usr : String, pwd : String, pin : String ){
        
    }
    
    func accountCB(mLogin: MainLogin, createPin usr : String, pwd : String, pin : String ){
        //"createPin".printIt(__FILE__, line: __LINE__)
        //usr.printIt(__FILE__, line: __LINE__)
        //pwd.printIt(__FILE__, line: __LINE__)
        //pin.printIt(__FILE__, line: __LINE__)
        
        /** Only one user can create a PIN login
        1. Get user with pin - returns a user
        1A. if the user with a pin match with the current-user then
        1AA. change it
        2. Get user with pin - returns nothing
        2A. if the user exists
        2AA. create a new PIN login
        **/
        
        //let usrWithPin = self.employeesQuery.getUserWithPinAssignment()
        //usrWithPin.usr.printIt(__FILE__, line: __LINE__)
        
        //self.registerUSerWithPin( usr, pwd : pwd, pin : pin )
        //self.registerUSerWithPin( "ricardo.fong1@trax.aero", pwd : "trax", pin : "1234" )
        
        /***/
        

        self.registerUserWithPin( usr, pwd : pwd, pin : pin ) // move down - testing only
        
        
    }
    
    func accountCB(mLogin: MainLogin, changePin usr : String, pwd : String, pin : String ){

    }
    
    func accountCB(mLogin: MainLogin, forgetPassword usr : String){
    }
    
    
    func accountCB(mLogin: MainLogin, loginWithPin pin : String ){
        
//        let usrInfo = UserSQL.init(objContext: self.mObjContext).getUserWithPin(pin)
//        
//        
//        if( usrInfo.count > 0 ){
//                let usr = usrInfo[0]["username"]
//                let pwd = usrInfo[0]["password"]
//                let uToken = usrInfo[0]["token"]
//                let uid = usrInfo[0]["employeeId"]
//                let uName = usrInfo[0]["employeeName"]
//                let uTitle = usrInfo[0]["employeeTitle"]
//
//                self.delegate?.loginCB(self, successLogin: usr!, pwd: pwd!, token: uToken!, uid: uid!, uName: uName!, uTitle: uTitle!, uPin: pin)
//        } else {
//            
//            let title = "PIN"
//            let message = "Invalid PIN number!"
//            let alertView = UIAlertController(title: title, message: message, preferredStyle: .Alert)
//            alertView.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
//            UIApplication.sharedApplication().keyWindow?.rootViewController?.presentViewController(alertView, animated: true, completion: nil)
//            
//            
//        }
    }
    
    func accountCB(mLogin: MainLogin, changeLogInProcedure status : String ){
        
        if ( status == "login" ){
            //login.setLoginMethod(MainLogin.loginMethodType.conventional)
        } else {
            //login.setLoginMethod(MainLogin.loginMethodType.pin)
        }
    }
    
    func accountCB(mLogin: MainLogin, setupCompleted status : String ){
        self.login.hidden = true
    }
    
    func accountCB(mLogin: MainLogin, LogOut status : String ){
        
        
    }
    
    func animateViewMoving (moveValuePortrait:CGFloat, moveValueLandscape:CGFloat) {
        //self.delegate?.setAnimateViewMoving(moveValuePortrait, moveValueLandscape: moveValueLandscape)
    }
    
    
    func accountCB(mLogin: MainLogin, TouchIDLogin status : String ){
        self.delegate?.loginCB(self, TouchIDLogin: status )
    }
    
}
