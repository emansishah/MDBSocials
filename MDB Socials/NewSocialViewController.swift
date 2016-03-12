//
//  NewSocialViewController.swift
//  MDB Socials
//
//  Created by Mansi Shah on 3/10/16.
//  Copyright © 2016 Mansi Shah. All rights reserved.
//

import UIKit
import Parse

class NewSocialViewController: UIViewController {
    
    @IBOutlet var eventName: UITextField!
    @IBOutlet var eventStartTime: UIDatePicker!
    @IBOutlet var eventEndTime: UIDatePicker!
    @IBOutlet var eventLocation: UITextField!
    let social = PFObject(className: "Socials")
    
    
    func displayAlert(title: String, displayError: String) {
        let alert = UIAlertController(title: title, message: displayError, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: {action in self.dismissViewControllerAnimated(true, completion: nil)}))
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func eventCreated(sender: UIButton) {
        var displayError = ""
        self.social["socialTitle"] = eventName.text
        self.social["socialTime"] = eventStartTime.date
        self.social["socialLocation"] = eventLocation.text
        self.social.saveInBackgroundWithBlock {
            (success: Bool, error: NSError?) -> Void in
            if (success) {
                self.performSegueWithIdentifier("toFeed", sender: self)
            } else {
                displayError = "Please fill in all the fields."
                self.displayAlert("Please fill in all the fields.", displayError: displayError)
                }
            }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toFeed" {
            let vc = segue.destinationViewController as! SocialsFeedViewController
            //vc.social = social
        }
    }
    
        
    @IBAction func backPressed(sender: UIButton) {
        self.performSegueWithIdentifier("toFeed", sender: self)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
