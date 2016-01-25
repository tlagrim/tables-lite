//
//  GroupsTableViewController.swift
//  JobManagerTools
//
//  Created by TJ Lagrimas on 12/3/15.
//  Copyright © 2015 Timothy Lagrimas. All rights reserved.
//

import UIKit

class GroupsTableViewController: PFQueryTableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func logOutPressed(sender: AnyObject) {
        print("Pressed logout")
        PFUser.logOut()
        print("Logout successful")
        let viewController: UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("Login")
        self.presentViewController(viewController, animated: true, completion: nil)
    }
    
    // Every time the view appears, you want to reload the query and the table view.
    override func viewWillAppear(animated: Bool) {
        print("viewWillAppear()")
        if (PFUser.currentUser() == nil) {
            print("PFUser == nil")
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("Login")
                self.presentViewController(viewController, animated: true, completion: nil)
            })
        }
        print("loadObjects")
        loadObjects()
        print("finished loading objects")
    }
    
    
    
    
    // must query for "many" on the one to many relationship
    override func queryForTable() -> PFQuery {
        print("override queryForTable()")
        
        /*
        let innerQuery = PFQuery(className: "Person")
        innerQuery.whereKeyExists("groupId")
        */
        
        let query = Group.query()
        if let user = PFUser.currentUser() {
            query?.whereKey("createdBy", equalTo: user)
        }
        return query!
    }
    
    
    /*
    This method replaces the UITableView data source method tableView(_:cellForRowAtIndexPath:) with a more suitable form. You get the returned PFObject as a parameter, without the need search it in a results array using and index path.
    */
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject!) -> PFTableViewCell? {
        // 1
        // Dequeue a cell from the table view, and cast it to a GroupsTableViewCell.
        let cell = tableView.dequeueReusableCellWithIdentifier("GroupCell", forIndexPath: indexPath) as! GroupsTableViewCell
        
        // 2
        // Cast the given PFObject to a Group object
        let group = object as! Group
        
        // 3
        // Download the post image using PFImageView‘s loadInBackground method.
        // In the completion closure you track the download’s progress.
        // Here you fill a UIProgressBar as the image downloads.
        cell.groupImage.file = group.image
        cell.groupImage.loadInBackground(nil) { percent in
            cell.progressView.progress = Float(percent)*0.01
            print("\(percent)%")
        }
        
        // 4
        // Add the creation date, the user’s name and the comment to the cell.
        /*
        let creationDate = wallPost.createdAt
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "HH:mm dd/MM yyyy"
        let dateString = dateFormatter.stringFromDate(creationDate!)
        
        if let username = wallPost.user.username {
        cell.createdByLabel.text = "Uploaded by: \(username), \(dateString)"
        } else {
        cell.createdByLabel.text = "Uploaded by anonymous: , \(dateString)"
        }
        */
        
        
        //cell.createdByLabel.text = "Uploaded by: \(group.user.username), \(dateString)"
        cell.groupName.text = group.name
        cell.groupKey.text = group.key
        return cell
    }
    /*
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "editStore"
    {
    let toJobs = segue.destinationViewController as! JobsTableViewController
    let group = PFObject.self as! Group
    let groupId = group.key
    toJobs.gId = groupId
    
    }
    
    }
    */
    
}

