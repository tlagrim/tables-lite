//
//  JobAssignmentsTableViewController.swift
//  JobManagerTools
//
//  Created by TJ Lagrimas on 12/3/15.
//  Copyright © 2015 Timothy Lagrimas. All rights reserved.
//

import Foundation

class JobAssignmentsTableViewController: PFQueryTableViewController {
    
    
    
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
        
        let query = Person.query()

        
        return query!
    }
    
    
    /*
    This method replaces the UITableView data source method tableView(_:cellForRowAtIndexPath:) with a more suitable form. You get the returned PFObject as a parameter, without the need search it in a results array using and index path.
    */
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject!) -> PFTableViewCell? {
        // 1
        // Dequeue a cell from the table view, and cast it to a JobsTableViewCell.
        let cell = tableView.dequeueReusableCellWithIdentifier("AssignmentCell", forIndexPath: indexPath) as! JobAssignmentsTableViewCell
        
        // 2
        // Cast the given PFObject to a WallPost object
        let person = object as! Person
        
        cell.personImage.file = person.image
        cell.personImage.loadInBackground(nil) { percent in
            cell.progressView.progress = Float(percent)*0.01
            print("\(percent)%")
        }
        cell.name.text = person.name
        cell.bio.text = person.bio
        return cell
    }
    
    
    
    
}