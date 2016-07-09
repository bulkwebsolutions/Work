//
//  ViewController.swift
//  Pdf-Example
//
//  Created by Alexander Cruz on 6/21/16.
//  Copyright © 2016 Trax. All rights reserved.
//

import UIKit

// 1. &nbsp;Globally define a "special notification key" constant that can be broadcast / tuned in to...
let mySpecialNotificationKey = "theKey"

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    var selectedManual = [String]()
    var items: [String] = ["Manual 100", "Manual 101", "Manual 102", "Manual 103", "Manual 104", "Manual 105", "Manual 106", "Manual 107"]
    
    @IBOutlet weak var fleetPopUp: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.allowsMultipleSelection = true
        
        tableView.backgroundColor = UIColor.clearColor()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "books.jpg")!)
        
        // Adding Notification Center
        // When user selects a row we will hide container
        // And reload main table with fleet selected
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.updateNotificationSentLabel), name: mySpecialNotificationKey, object: nil)
        
       
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        // Configure table cell design
        self.tableView.rowHeight = 84.0
        self.tableView.scrollEnabled = true
        self.tableView.bounces = true
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.SingleLine
        
        
    
        // Hide container
        fleetPopUp.hidden = true
        
        // Configure table cell design
        fleetPopUp.layer.shadowColor = UIColor.blackColor().CGColor
        fleetPopUp.layer.shadowOpacity = 1
        fleetPopUp.layer.shadowOffset = CGSizeZero
        fleetPopUp.layer.shadowRadius = 5
        
        fleetPopUp.bounds = CGRectInset(view.frame, 30.0, 30.0);
        
       
    }
    
    override func viewWillAppear(animated: Bool) {
        tableView.tableFooterView = UIView()
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        
        // Clear cell
        cell.backgroundColor = UIColor.clearColor()
        
        // Highlight cell
        let bgColorView = UIView()
        bgColorView.backgroundColor = UIColor.lightGrayColor()
        cell.selectedBackgroundView = bgColorView
        
        cell.textLabel?.text = self.items[indexPath.row]
        cell.textLabel?.textAlignment = NSTextAlignment.Left
        cell.textLabel?.textColor = UIColor.whiteColor()
        
        // image
        let image : UIImage = UIImage(named: "pdf-icon")!
        cell.imageView!.image = image
    
        cell.selectionStyle = .None
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("You selected cell #\(indexPath.row)!")
        
        
        
   
            tableView.cellForRowAtIndexPath(indexPath)?.accessoryType = UITableViewCellAccessoryType.Checkmark
            selectedManual.append(items[indexPath.row])
            print("Lets see: \(selectedManual)")
  
        
        

    }
    
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
       
        
  
             tableView.cellForRowAtIndexPath(indexPath)?.accessoryType = UITableViewCellAccessoryType.None
            selectedManual.removeAtIndex(indexPath.row)
            selectedManual.insert("", atIndex: indexPath.row)
            print("Last removed \(selectedManual)")
   
        
        
    }
    
    
    @IBAction func popUpFleetChoices(sender: AnyObject) {
        
        if fleetPopUp.hidden == true {
            self.tableView.userInteractionEnabled = false
            fleetPopUp.hidden = false
        } else if (fleetPopUp.hidden == false) {
            self.tableView.userInteractionEnabled = true
            fleetPopUp.hidden = true
        }
        
    }
    
    // GoToSplitView Segue
    
    func updateNotificationSentLabel() {
        print("Notication heard")
        self.tableView.userInteractionEnabled = true
        fleetPopUp.hidden = true
        tableView.reloadData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "GoToSplitView") {
            let secondViewController = segue.destinationViewController as! SplitVC
           // let duration = sender as AnyObject
            print("Check: \(selectedManual)")
            secondViewController.allSelectedManuals = selectedManual
        }
    }

    
    @IBAction func sendSelectedManuals(sender: AnyObject) {
        
        // Create a new variable to store the instance of MasterViewController
        
        selectedManual = selectedManual.filter { $0 != "" }
        print(selectedManual)
        
        self.performSegueWithIdentifier("GoToSplitView", sender: selectedManual)
    }
    
    
}

