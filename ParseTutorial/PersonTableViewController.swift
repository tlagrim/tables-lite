//
//  PersonTableViewController.swift
//  JobManagerTools
//
//  Created by TJ Lagrimas on 12/3/15.
//  Copyright © 2015 Timothy Lagrimas. All rights reserved.
//

import Foundation
class PersonTableViewController: PFQueryTableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Every time the view appears, you want to reload the query and the table view.
    override func viewWillAppear(animated: Bool) {
        print("viewWillAppear()")
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
        
        
        let query = Person.query()
        
        /*
        if let user = PFUser.currentUser() {
        query?.whereKey("createdBy", equalTo: user)
        }*/
        return query!
    }

    //this
    var appUserResult: PFUser?
    var appUsers = [PFUser]()
    var userToShow = PFUser()

    
    /*
    This method replaces the UITableView data source method tableView(_:cellForRowAtIndexPath:) with a more suitable form. You get the returned PFObject as a parameter, without the need search it in a results array using and index path.
    */
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject!) -> PFTableViewCell? {
        // 1
        // Dequeue a cell from the table view, and cast it to a GroupsTableViewCell.
        let cell = tableView.dequeueReusableCellWithIdentifier("PersonCell", forIndexPath: indexPath) as! PersonTableViewCell
        
        // 2
        // Cast the given PFObject to a Person object
        let person = object as! Person
        
        // 3
        // Download the post image using PFImageView‘s loadInBackground method.
        // In the completion closure you track the download’s progress.
        // Here you fill a UIProgressBar as the image downloads.
        cell.personImage.file = person.image
        cell.personImage.loadInBackground(nil) { percent in
            cell.progressView.progress = Float(percent)*0.01
            print("\(percent)%")
        }
        cell.personName.text = person.name
        cell.personBio.text = person.bio
        
        /*
        //TAKE OUT LET - YOU'VE ALREADY DEFINED AS CLASS VAR
        appUserResult = appUsers[indexPath.row]
        
        print(appUserResult)
        self.performSegueWithIdentifier("openVC2", sender: self)
        */
        return cell
    }
    
    
    

    /*
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "openVC2" {
            let indexPath = self.tableView.indexPathForSelectedRow!
            
            //INDEXPATH ISN'T AVAILABLE IN PREPAREFORSEGUE
            //let userToShow = appUsers[indexPath.row]
            
            let newVc = segue.destinationViewController as! JobAssignments
            //USE THE CLASS VARIABLE TO PASS
            newVc.userToShowDetail = appUserResult
        }

    }
*/
    
    
}