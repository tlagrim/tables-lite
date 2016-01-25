//
//  JobsTableViewController.swift
//  JobManagerTools
//
//  Created by TJ Lagrimas on 12/2/15.
//  Copyright © 2015 Timothy Lagrimas. All rights reserved.
//

import UIKit

/*

THIS!! IMPLEMENT THIS AND DO NOT FORGET
TO DO SO. IT'S NICE. AND DYNAMIC if done right.

viewdidload
nmeTextField.delegate = self
no to above

but yes to:
navigationItem.title = textField.text
*/




class JobsTableViewController: PFQueryTableViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    // Every time the view appears, you want to reload the query and the table view.
    override func viewWillAppear(animated: Bool) {
        if (PFUser.currentUser() == nil) {
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                
                let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("Login")
                self.presentViewController(viewController, animated: true, completion: nil)
            })
        }
        loadObjects()
    }
    
    /*
    let query = Group.query()
    if let user = PFUser.currentUser() {
    query?.whereKey("createdBy", equalTo: user)
    }
    return query!
    */
    
    override func queryForTable() -> PFQuery {
        
        let query = Job.query()
        //if let user = PFUser.currentUser() {
        //    query?.whereKey("createdAt", greaterThanOrEqualTo: user)
        //}
        /*
        return query!
        let user = PFUser.currentUser()
        let query = Job.query()
        let dateCreated =
        
        
        
        let now = NSDate()
        let midnightOfToday = cal!.startOfDayForDate(now)

        let query = Job.query()
        //query!.whereKey("date", greaterThanOrEqualTo: midnightOfToday)
        query.whereKe
        */
        
        //let query = Job.query()
        
        // in order to get the person:
        /*
        let group = G
        
        
        if let user = PFUser.currentUser(){
            query?.whereKey("createdBy", equalTo: user)
        }
        */
        return query!
    }
    
    
    /*
    This method replaces the UITableView data source method tableView(_:cellForRowAtIndexPath:) with a more suitable form. You get the returned PFObject as a parameter, without the need search it in a results array using and index path.
    */
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject!) -> PFTableViewCell? {
        // 1
        // Dequeue a cell from the table view, and cast it to a JobsTableViewCell.
        let cell = tableView.dequeueReusableCellWithIdentifier("JobCell", forIndexPath: indexPath) as! JobsTableViewCell
        
        // 2
        // Cast the given PFObject to a WallPost object
        let job = object as! Job
                cell.jobTitle.text = job.jobTitle
        cell.jobDetail.text = job.jobDetail
        return cell
    }
    
    
    
    
}







