//
//  ManualCollectionVC.swift
//  Pdf-Example
//
//  Created by Alexander Cruz on 7/7/16.
//  Copyright © 2016 Trax. All rights reserved.
//

import Foundation
import UIKit

class ManualCollectionVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    //QuickType Collection view
    
    @IBOutlet weak var manualCollection: UICollectionView!
    let reuseIdentifier = "CollectionQuickTypecell"
   // var manuals = ["Manual 1", "Manual 2", "Manual 3", "Manual 4", "Manual 5", "Manual 6", "Manual 7", "Manual 8", "Manual 9"]
  
    
    
    //forces the system to do one layout pass
    var isHeightCalculated: Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Master\(globalManuals)")
        
        // Do any additional setup after loading the view.
        
        manualCollection.delegate = self
        manualCollection.dataSource = self
        
        [self.manualCollection.collectionViewLayout.invalidateLayout()];
    }
    
    
    // MARK: - UICollectionViewDataSource protocol
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return globalManuals.count
    }
    
    
    // make a cell for each cell index path
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! manualOptionCell
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        cell.manualReload.tag = indexPath.row
        cell.manualReload.addTarget(self, action: #selector(self.addText(_:)), forControlEvents: .TouchUpInside)
        cell.manualReload.setTitle(globalManuals[indexPath.item] as? String, forState: UIControlState.Normal)
        
        
        cell.deleteButton?.layer.setValue(indexPath.row, forKey: "index")
        cell.deleteButton?.addTarget(self, action: #selector(ManualCollectionVC.deleteCell), forControlEvents: UIControlEvents.TouchUpInside)
        
        cell.manualReload.backgroundColor = UIColor.clearColor()
        cell.manualReload.layer.cornerRadius = 10
        cell.manualReload.layer.borderWidth = 1
        cell.manualReload.layer.borderColor = UIColor.whiteColor().CGColor
        
        
        // Set cell width to 100%
        let collectionViewWidth = self.manualCollection.bounds.size.width
        cell.manualReload.frame.size.width = collectionViewWidth
        
        return cell
    }
    
    
    
    @IBAction func addText(sender: UIButton!) {
        
        var button = UIButton()
        
        button = sender
        
        print(globalManuals[button.tag])
            NSNotificationCenter.defaultCenter().postNotificationName("addQuickText", object:nil , userInfo:["message":globalManuals[button.tag]])
        
      }
    
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
    }
    
    
    func deleteCell(sender:UIButton) {
        let i = (sender.layer.valueForKey("index")) as! Int
        globalManuals.removeAtIndex(i)
        print("Collection view \(globalManuals)")
        manualCollection.reloadData()
    
    }
    
   
}
