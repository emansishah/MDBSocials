 //
 //  ViewController.swift
 //  MDB Socials
 //
 //  Created by Mansi Shah on 3/7/16.
 //  Copyright © 2016 Mansi Shah. All rights reserved.
 //
 
 import UIKit
 import Parse
 
 class ViewController: UIViewController {
    
    
    @IBOutlet var fullName: UITextField!
    @IBOutlet var password: UITextField!
    
    @IBAction func signUpPressed(sender: AnyObject) {self.performSegueWithIdentifier("toSignUp", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
    
    @IBAction func signIn(sender: AnyObject) {
        var displayError = ""
        if fullName.text == "" && password.text == "" {
            displayError = "Please enter a username and password"
        } else if fullName.text == "" {
            displayError = "Please enter a username"
        } else if password.text == "" {
            displayError = "Please enter a password"
        }
        
        if displayError != "" {
            displayAlert("Error in Form", displayError: displayError)
        } else {
            
            /** Not necessary unless there are multiple ways to login
            let user = PFUser()
            user.username = fullName.text
            user.password = password.text
            */
            
            PFUser.logInWithUsernameInBackground(fullName.text!, password: password.text!) {
                (success, loginError) in
                
                if loginError == nil {
                    self.performSegueWithIdentifier("signIn", sender: self)
                } else {
                    if let errorString = loginError!.userInfo["error"] as? NSString {
                        displayError = errorString as String
                    } else {
                        displayError = "Please try again later."
                    }
                    self.displayAlert("Could not Login", displayError: displayError)
                }
            }
        }
    }
    
 }
