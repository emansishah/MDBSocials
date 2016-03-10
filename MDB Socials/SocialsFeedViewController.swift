//
//  SocialsFeedViewController.swift
//  MDB Socials
//
//  Created by Mansi Shah on 3/7/16.
//  Copyright © 2016 Mansi Shah. All rights reserved.
//

import UIKit

class SocialsFeedViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    private let reuseIdentifier = "social"

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
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("social", forIndexPath: indexPath) as! SocialsCollectionViewCell
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
