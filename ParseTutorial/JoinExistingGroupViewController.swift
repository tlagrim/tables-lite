//
//  JoinExistingGroupViewController.swift
//  JobManagerTools
//
//  Created by TJ Lagrimas on 12/3/15.
//  Copyright © 2015 Timothy Lagrimas. All rights reserved.
//



import Foundation
import UIKit

class JoinExistingGroupViewController: UIViewController {
    
    @IBOutlet weak var groupKeyTextField: UITextField!
    @IBOutlet weak var loadingSpinner: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func submitPressed(sender: AnyObject) {
        groupKeyTextField.resignFirstResponder()
        loadingSpinner.startAnimating()
        self.saveNewJobEntry()
    }
    
    
    func saveNewJobEntry()
    {
        let user = PFUser.currentUser()
        let group = PFObject(className: "Group")
        let relation = group.relationForKey("admin")
        
        group.setObject(self.groupKeyTextField.text!, forKey: "key")
        group.setObject(user!, forKey: "createdBy")
        relation.addObject(user!)

        group.saveInBackgroundWithBlock{ succeeded, error in
            if succeeded {
                //3
                print("Successfully joined another group.")
                let alert = UIAlertView(title: "Joined new group", message: "Meeting new friends, how nice.", delegate: self, cancelButtonTitle: "Gotcha")
                alert.show()
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    let viewController: UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("GroupsOverview")
                    self.presentViewController(viewController, animated: true, completion: nil)
                })
            } else {
                //4
                if let errorMessage = error?.userInfo["error"] as? String {
                    print("Error!",errorMessage)
                }
            }
        }
    }
}
