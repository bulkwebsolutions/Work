//
//  PdfViewController.swift
//  Pdf-Example
//
//  Created by Alexander Cruz on 6/21/16.
//  Copyright © 2016 Trax. All rights reserved.
//

import UIKit

class PdfViewController: UIViewController {

   
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var pdfView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let name = "sample1"
        let extension1 = "pdf"
        
        if let pdf = NSBundle.mainBundle().URLForResource(name, withExtension: extension1, subdirectory: nil, localization: nil)  {
            let req = NSURLRequest(URL: pdf)
            webView.loadRequest(req)
            self.pdfView.addSubview(webView)
       
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
