//
//  SettingsViewController.swift
//  TipMachine
//
//  Created by Aleksander Sokolov on 12/31/15.
//  Copyright © 2015 AntonSotnikov. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    

    @IBOutlet weak var lowLabel: UITextField!
    @IBOutlet weak var mediumLabel: UITextField!
    @IBOutlet weak var highLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")

    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
        
        let tipLow = NSString(string: lowLabel.text!).doubleValue
        let tipMedium = NSString(string: mediumLabel.text!).doubleValue
        let tipHigh = NSString(string: highLabel.text!).doubleValue
        
        NSUserDefaults.standardUserDefaults().setObject(String(tipLow), forKey: "tip_low")
        NSUserDefaults.standardUserDefaults().setObject(String(tipMedium), forKey: "tip_mid")
        NSUserDefaults.standardUserDefaults().setObject(String(tipHigh), forKey: "tip_high")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func onTipLowEdit(sender: AnyObject) {
        let tipLow = NSString(string: lowLabel.text!).doubleValue
    }
    @IBAction func onTipMediumEdit(sender: AnyObject) {
        let tipMedium = NSString(string: mediumLabel.text!).doubleValue
    }
    @IBAction func onTipHighEdit(sender: AnyObject) {
        let tipHigh = NSString(string: highLabel.text!).doubleValue
    }
    
    
    @IBAction func onTap(sender: AnyObject) {
                view.endEditing(true)
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
