//
//  SocialDetailsViewController.swift
//  MDB Socials
//
//  Created by Mansi Shah on 3/7/16.
//  Copyright © 2016 Mansi Shah. All rights reserved.
//

import UIKit
import Parse

class SocialDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    private let reuseIdentifier = "membersCell"
    

    @IBOutlet var going: UIButton!
    @IBOutlet var notGoing: UIButton!
    
    @IBOutlet var eventLocation: UILabel!
    @IBOutlet var eventDate: UILabel!
    @IBOutlet var eventTitle: UILabel!
    var details = Int()
    var locations = []
    var names = []
    let user = PFUser.currentUser()
    //var social = PFObject()
    
    @IBAction func userGoing(sender: AnyObject) {
        going.highlighted = false
        notGoing.highlighted = true
        goingUsers()
    }
    @IBAction func userNotGoing(sender: AnyObject) {
        notGoing.highlighted = false
        going.highlighted = true
    }
    
    @IBOutlet var membersGoing: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        membersGoing.delegate = self
        membersGoing.dataSource = self
        going.highlighted = true
        notGoing.highlighted = true
        eventLocation.text = locations[details] as! String
        eventTitle.text = names[details] as! String
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfSectionsInRow section: Int) -> Int {
        return getNumUsers()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = membersGoing.dequeueReusableCellWithIdentifier("membersCell", forIndexPath: indexPath) as! MembersTableViewCell
        //cell.membersNames.text = getNames()[indexPath.row] as! String
        return cell
    }
    

    @IBAction func backPressed(sender: UIButton) {
        self.performSegueWithIdentifier("backFromDetails", sender: self)
    }
    
    func goingUsers() -> Void {
        //self.social["goingUserObjectIds"] = self.user
        //print(self.user!.username)
    }
    
    func getNumUsers() -> Int {
        var arr = []
        var query = PFQuery(className:"Socials")
        do {
            arr = try query.findObjects()
        } catch {
            arr = []
        }
        return arr.count
    }
    
   /** func getNames() -> NSArray {
        var arr = []
        var namesArray: [String] = []
        var query = PFQuery(className:"Socials")
        do {
            arr = try query.findObjects()
            for object in arr {
                namesArray.append(object["goingUserObjectIds"] as! String)
            }
        } catch {
            arr = []
        }
        return namesArray
    }*/



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
