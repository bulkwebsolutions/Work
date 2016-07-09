//
//  PdfPageToImageOperation.swift
//  SwiftyPDF
//
//  Created by prcela on 15/01/16.
//  Copyright © 2016 100kas. All rights reserved.
//

import UIKit

class PdfPageToImageOperation: NSOperation
{
    var imageSize: CGSize
    var pageIdx: Int
    var completion: ((success: Bool, image: UIImage)->Void)? = nil
    
    init(imageSize: CGSize, pageIdx: Int)
    {
        self.imageSize = imageSize
        self.pageIdx = pageIdx
        
        super.init()
    }
    
    override func main()
    {
        let width:CGFloat = imageSize.width
        let pdfPage = PdfDocument.getPage(pageIdx)!
        var pageRect:CGRect = CGPDFPageGetBoxRect(pdfPage, Config.pdfBox)
        let pdfScale:CGFloat = width/pageRect.size.width
        pageRect.size = CGSizeMake(pageRect.size.width*pdfScale, pageRect.size.height*pdfScale)
        pageRect.origin = CGPointZero
        
        UIGraphicsBeginImageContext(pageRect.size)
        
        let context:CGContextRef = UIGraphicsGetCurrentContext()!
        
        // White BG
        CGContextSetRGBFillColor(context, 1.0,1.0,1.0,1.0)
        CGContextFillRect(context,pageRect)
        
        
        
        // ***********
        // Next 3 lines makes the rotations so that the page look in the right direction
        // ***********
        CGContextTranslateCTM(context, 0.0, pageRect.size.height)
        CGContextScaleCTM(context, 1.0, -1.0)
        CGContextSaveGState(context)
        
//        CGContextConcatCTM(context, CGPDFPageGetDrawingTransform(pdfPage, CGPDFBox.CropBox, pageRect, 0, true))
        CGContextScaleCTM(context, pdfScale, pdfScale)
        
        CGContextSetInterpolationQuality(context, .High)
        CGContextSetRenderingIntent(context, .RenderingIntentDefault)
        
        CGContextDrawPDFPage(context, pdfPage)
        CGContextRestoreGState(context)
        
        let img:UIImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        dispatch_async(dispatch_get_main_queue()) {
            self.completion?(success: true, image: img)
        }


    }

}
