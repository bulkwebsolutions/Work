//
//  StringExtensions.swift
//  Task Control
//
//  Created by John Blaine on 12/8/15.
//  Copyright © 2015 Trax USA Corporation. All rights reserved.
//

import UIKit
//import CryptoSwift

extension String {
    
    func len() -> Int {
        return( self.lengthOfBytesUsingEncoding(NSUTF8StringEncoding) )
    }
    
    func contains( p : String ) -> Bool {
        if ( self.rangeOfString(p) != nil ){
            return( true )
        }
        return( false )
    }
    
    func split( s : String ) -> [String] {
        return self.componentsSeparatedByString(s)
    }
    
    func replace( val : String, with : String ) -> String {
        return ( self.stringByReplacingOccurrencesOfString( val, withString: with, options: NSStringCompareOptions.LiteralSearch, range: nil) )
    }
    
    func indexByInt(index: Int) -> Index {
        if index >= 0 {
            
            if ( index >= self.len()){
                return self.endIndex.advancedBy(0)
            } else {
                return self.startIndex.advancedBy(index)
            }
            
        } else {
            return self.endIndex.advancedBy(index)
        }
    }
    
    func substring( begin : Int, end : Int ) -> String {
        
        if( self.len() > 0 ){
            let startIndex = self.indexByInt(begin)
            let endIndex = self.indexByInt(end)
            
            if startIndex <= endIndex {
                return self.substringWithRange(startIndex..<endIndex)
            } else {
                return ""
            }
        } else {
            return ""
        }
    }
    
    func attach( br : String, s: String...  ) -> String {
        var rVal = self
        
        for i in 0 ..< s.count{
            
            if ( rVal.len() == 0 ){
                rVal = String( format: "%@", s[i] )
            } else {
                rVal = String( format: "%@%@%@", rVal, br, s[i] )
            }
        }
        
        return( rVal )
    }
    
    func setData( data : String ) {
        let key = String( format:"_%@", self )
        NSUserDefaults.standardUserDefaults().setObject( data, forKey: key )
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    func getData() -> String {
        let key = String( format:"_%@", self )
        if let m = NSUserDefaults.standardUserDefaults().stringForKey(key){
            return( m )
        }
        return( "" )
    }

    /*****
     let key = "bbC2H19lkVbQDfakxcrtNMQdd0FloLyw" // length == 3
     let iv = "gqLOHUioQ0QjhuvI" // lenght == 16
     let s = "string to encrypt"
     let enc = try! s.aesEncrypt(key, iv: iv)
     let dec = try! enc.aesDecrypt(key, iv: iv)
     print(s) //string to encrypt
     print("enc:\(enc)") //2r0+KirTTegQfF4wI8rws0LuV8h82rHyyYz7xBpXIpM=
     print("dec:\(dec)") //string to encrypt
     print("\(s == dec)") //true
    *****/
    
//    func aesEncrypt(key: String, iv: String) throws -> String{
//        let data = self.dataUsingEncoding(NSUTF8StringEncoding)
//        let enc = try AES(key: key, iv: iv, blockMode:.CBC).encrypt(data!.arrayOfBytes())
//
//        let encData = NSData(bytes: enc, length: Int(enc.count))
//        let base64String: String = encData.base64EncodedStringWithOptions(NSDataBase64EncodingOptions(rawValue: 0));
//        let result = String(base64String)
//        return result
//    }
//    func aesDecrypt(key: String, iv: String) throws -> String {
//        let data = NSData(base64EncodedString: self, options: NSDataBase64DecodingOptions(rawValue: 0))
//        let dec = try AES(key: key, iv: iv, blockMode:.CBC).decrypt(data!.arrayOfBytes())
//        let decData = NSData(bytes: dec, length: Int(dec.count))
//        let result = NSString(data: decData, encoding: NSUTF8StringEncoding)
//        return String(result!)
//    }
//    
//    func EncryptAES(key: String ) throws -> String{
//        let data = self.dataUsingEncoding(NSUTF8StringEncoding)
//        let defaultIV = [UInt8](count: AES.blockSize, repeatedValue: 0)
//        let str = UInt8ToStr(defaultIV )
//        let enc : [UInt8] = try AES(key: key, iv: str).encrypt(data!.arrayOfBytes())
//        
//        let encData = NSData(bytes: enc, length: Int(enc.count))
//        let base64String: String = encData.base64EncodedStringWithOptions(NSDataBase64EncodingOptions(rawValue: 0));
//        let result = String(base64String)
//        return result
//    }
    
    func UInt8ToStr(enc : [UInt8] ) -> String {
        var rVal = ""
        for _ in 0..<enc.count{
            rVal = rVal + "\u{0}"
        }
        return(rVal)
    }
    
}
