//
//  LogInViewController.swift
//  Pdf-Example
//
//  Created by jblaine on 6/22/16.
//  Copyright © 2016 Trax. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController, MainTraxDelegate {
    var mTrax : MainTrax?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        mTrax = MainTrax(frm: CGRectZero)
        mTrax?.delegate = self
        self.view.addSubview(mTrax!)
                
    }
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        let w = size.width
        let h = size.height
        
        if ( w > h ){
            let wd = h * 0.5
            let ht = w  * 0.5
            mTrax?.frame = CGRect( x: (w - wd) * 0.5, y: (h - ht)  * 0.5, width: wd, height: ht)
        } else {
            mTrax?.frame = CGRect( x: w * 0.25, y: h  * 0.25, width: w * 0.5, height: h  * 0.5)
        }
        
        mTrax!.hidden = false
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        let w = self.view.frame.width
        let h = self.view.frame.height
        
        if ( w > h ){
            let wd = h * 0.5
            let ht = w  * 0.5
            mTrax?.frame = CGRect( x: (w - wd) * 0.5, y: (h - ht)  * 0.5, width: wd, height: ht)
        } else {
            mTrax?.frame = CGRect( x: w * 0.25, y: h  * 0.25, width: w * 0.5, height: h  * 0.5)
        }
        
        mTrax?.accessibilityIdentifier = MainTrax.Operation.Login.rawValue
        mTrax!.hidden = false
        //dc self.touchIDLoginAction()
    }
    
    func loginCB(controller: MainTrax, successLogin usr : String, pwd : String, token : String, uid : String, uName : String, uTitle : String, uPin : String){
        //print("successLogin")
        
        self.performSegueWithIdentifier("GoToMainTableView", sender: nil)

    }
    
    
    func loginCB(controller: MainTrax, TouchIDLogin status : String ){
    }
    
    func loginCB(controller: MainTrax, CreatedPin usr : String, pwd : String ){
    }
    
    func loginCB(controller: MainTrax, Register status : String ){
    }

}
