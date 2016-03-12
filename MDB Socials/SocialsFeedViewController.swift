//
//  SocialsFeedViewController.swift
//  MDB Socials
//
//  Created by Mansi Shah on 3/7/16.
//  Copyright © 2016 Mansi Shah. All rights reserved.
//

import UIKit
import Parse

class SocialsFeedViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    private let reuseIdentifier = "social"
    
    var indexToPass = 0
    var details = 0
    //var social = PFObject()
    

    

    @IBOutlet var socialsFeed: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        socialsFeed.delegate = self
        socialsFeed.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView, numberOfSectionsInCollectionView: Int) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return getNumEvents()
    }
    
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("social", forIndexPath: indexPath) as! SocialsCollectionViewCell
        cell.layer.borderWidth = 2.0
        cell.layer.borderColor = UIColor.grayColor().CGColor
        cell.eventTitle.text = getNameEvents()[indexPath.row] as! String
        //cell.eventTime.text = getTimes() [indexPath.row] as! String
        cell.eventLocation.text = getLocations() [indexPath.row] as! String
        return cell
    }

    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        //print(indexPath.row)
        indexToPass = indexPath.row
        self.performSegueWithIdentifier("toDetails", sender: indexPath)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "toDetails") {
            let vc = segue.destinationViewController as! SocialDetailsViewController
            vc.details = indexToPass
            vc.names = getNameEvents()
            vc.locations = getLocations()
            //vc.social = social
        }
    }
    
    @IBAction func newEventPressed(sender: UIButton) {
        self.performSegueWithIdentifier("toNew", sender: self)
    }
    
    func getNumEvents() -> Int {
        var arr = []
        var query = PFQuery(className:"Socials")
        do {
            arr = try query.findObjects()
        } catch {
            arr = []
        }
        return arr.count
    }
    
    func getNameEvents() -> NSArray {
        var arr = []
        var titlesArray: [String] = []
        var query = PFQuery(className:"Socials")
        do {
            arr = try query.findObjects()
            for object in arr {
                titlesArray.append(object["socialTitle"] as! String)
            }
        } catch {
            arr = []
        }
        return titlesArray
    }
    
    
    func getLocations() -> NSArray {
        var locationsArray: [String] = []
        var arr:NSArray = []
        let query = PFQuery(className:"Socials")
        do {
            arr = try query.findObjects()
            for object in arr {
                locationsArray.append(object["socialLocation"] as! String)
            }
        } catch {
            arr = []
        }
        return locationsArray
    }
    
    func getTimes() -> NSArray {
        var timesArray: [String] = []
        var arr:NSArray = []
        let query = PFQuery(className:"Socials")
        do {
            arr = try query.findObjects()
            for object in arr {
                timesArray.append(object["socialTime"] as! String)
            }
        } catch {
            arr = []
        }
        return timesArray
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
