//
//  SocialDetailsViewController.swift
//  MDB Socials
//
//  Created by Mansi Shah on 3/7/16.
//  Copyright © 2016 Mansi Shah. All rights reserved.
//

import UIKit

class SocialDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    private let reuseIdentifier = "membersCell"

    @IBOutlet var membersGoing: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        membersGoing.delegate = self
        membersGoing.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfSectionsInRow section: Int) -> Int {
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = membersGoing.dequeueReusableCellWithIdentifier("membersCell", forIndexPath: indexPath) as! MembersTableViewCell
        return cell
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
