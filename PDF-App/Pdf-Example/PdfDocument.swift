//
//  PdfDocument.swift
//  SwiftyPDF
//
//  Created by prcela on 20/01/16.
//  Copyright © 2016 100kas. All rights reserved.
//

import UIKit

class PdfDocument: NSObject
{
    static var doc: CGPDFDocument?
    static var pagesDesc = [PdfPageDesc]()
    
    class func open(url url: NSURL) -> CGPDFDocument?
    {
        ImageCreator.clearCachedFiles()
        pagesDesc.removeAll()

        doc = CGPDFDocumentCreateWithURL(url)
        

        let ctPages = CGPDFDocumentGetNumberOfPages(doc)
        for idx in 1...ctPages
        {
            let pageDesc = PdfPageDesc(pageIdx: idx)
            pagesDesc.append(pageDesc)
        }

        return doc
    }
    
    class func close()
    {
        doc = nil
        ImageCreator.clearCachedFiles()
        pagesDesc.removeAll()

    }
    
    class func getPage(idx: Int) -> CGPDFPage?
    {
        return CGPDFDocumentGetPage(doc, idx)
    }
    
    class func getPageSize(idx: Int) -> CGSize
    {
        // getting document page is expensive operation, so we are caching the page size
        if let pageDesc = getPageDesc(idx)
        {
            if let pageSize = pageDesc.size
            {
                return pageSize
            }
            else
            {
                pageDesc.size = CGPDFPageGetBoxRect(getPage(idx), Config.pdfBox).size
                return pageDesc.size!
            }
        }
        
        return CGSizeZero
    }
    
    class func getPageDesc(idx: Int) -> PdfPageDesc?
    {
        return pagesDesc[idx-1]
    }

}
