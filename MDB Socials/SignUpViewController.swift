//
//  SignUpViewController.swift
//  MDB Socials
//
//  Created by Mansi Shah on 3/7/16.
//  Copyright © 2016 Mansi Shah. All rights reserved.
//

import UIKit
import Parse

class SignUpViewController: UIViewController {

    @IBOutlet var signUpFullName: UITextField!
    @IBOutlet var email: UITextField!
    @IBOutlet var signUpPassword: UITextField!
    @IBOutlet var confirmPassword: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayAlert(title: String, displayError: String) {
        let alert = UIAlertController(title: title, message: displayError, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: {action in self.dismissViewControllerAnimated(true, completion: nil)}))
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func backPressed(sender: UIButton) {
        self.performSegueWithIdentifier("backFromSignUp", sender: self)
    }
    
    @IBAction func signUp(sender: AnyObject) {
        var displayError = "Please enter a "
        if signUpFullName.text == "" {
            displayError += "username"
        } else if signUpPassword.text == "" {
            displayError += "password"
        } else if email.text == "" {
            displayError += "n email"
        } else if confirmPassword.text == "" {
            displayError = "Please confirm password"
        }
        
        if displayError != "Please enter a " {
            displayAlert("Incomplete Form", displayError: displayError)
        } else {
            let user = PFUser()
            user.username = signUpFullName.text
            user.password = signUpPassword.text
            user.email = email.text
            
            user.signUpInBackgroundWithBlock { (succeeded, signUpError) -> Void in
                
                if signUpError == nil {
                    self.performSegueWithIdentifier("signUpToMain", sender: self)
                } else {
                    if let error = signUpError!.userInfo["error"] as? NSString {
                        displayError = error as String
                    } else {
                        displayError = "Please try again later"
                    }
                    self.displayAlert("Could not Sign Up", displayError: displayError)
                }
            }
        }
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
