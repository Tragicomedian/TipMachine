//
//  ViewController.swift
//  TipMachine
//
//  Created by Aleksander Sokolov on 12/31/15.
//  Copyright © 2015 AntonSotnikov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
           var tipPercentages=[0.15,0.18,0.20]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "Tip Calculator"
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"

        
let currentTime = NSDate()
let oldTime = NSUserDefaults.standardUserDefaults().objectForKey("old_time") as? NSDate //load time
if (oldTime != nil && currentTime.timeIntervalSinceDate(oldTime!) < 600){
billField.text = NSUserDefaults.standardUserDefaults().stringForKey("old_amount") //load moneys
}
    }
            override func viewWillAppear(animated: Bool) {
            super.viewWillAppear(animated)
            print("view will appear")

            var tipLow = NSUserDefaults.standardUserDefaults().stringForKey("tip_low") //load tips
            var tipMid = NSUserDefaults.standardUserDefaults().stringForKey("tip_mid")
            var tipHigh = NSUserDefaults.standardUserDefaults().stringForKey("tip_high")
            
            if (tipLow == nil ) { tipLow = "15" }
            tipLow! += "%"
            tipPercentages[0] = NSString(string: tipLow!).doubleValue/100
            if (tipMid == nil ) { tipMid = "18" }
            tipMid! += "%"
            tipPercentages[1] = NSString(string: tipMid!).doubleValue/100
            if (tipHigh == nil ) { tipHigh = "20" }
            tipPercentages[2] = NSString(string: tipHigh!).doubleValue/100
            tipHigh! += "%"
            
            tipControl.setTitle(tipLow, forSegmentAtIndex: 0)
            tipControl.setTitle(tipMid, forSegmentAtIndex: 1)
            tipControl.setTitle(tipHigh, forSegmentAtIndex: 2)
        }
        
        override func viewDidAppear(animated: Bool) {
            super.viewDidAppear(animated)
            print("view did appear")
        }
        
       override func viewWillDisappear(animated: Bool) {
            super.viewWillDisappear(animated)
            print("view will disappear")
            NSUserDefaults.standardUserDefaults().setObject(NSDate(), forKey: "old_time")//save time
            NSUserDefaults.standardUserDefaults().setObject(billField.text, forKey: "old_amount") //save moneys
            NSUserDefaults.standardUserDefaults().synchronize()
        }
        
       override func viewDidDisappear(animated: Bool) {
            super.viewDidDisappear(animated)
            print("view did disappear")
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        let tipPercentage=tipPercentages[tipControl.selectedSegmentIndex]
        let billAmount = NSString(string: billField.text!).doubleValue
        let tip=billAmount*tipPercentage
        let total=billAmount+tip
        tipLabel.text=String(format: "$%.2f",tip)
        totalLabel.text=String(format: "$%.2f",total)
    }
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }

}

