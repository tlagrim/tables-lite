//
//  CreateJobViewController.swift
//  ParseStarterProject-Swift
//
//  Created by TJ Lagrimas on 12/2/15.
//  Copyright © 2015 Parse. All rights reserved.
//

import Foundation
import UIKit

class CreateJobViewController: UIViewController {
    
    @IBOutlet weak var jobTitleTextField: UITextField!
    @IBOutlet weak var jobDetailTextField: UITextField!
    @IBOutlet weak var loadingSpinner: UIActivityIndicatorView!
    
    var username: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func submitPressed(sender: AnyObject) {
        jobTitleTextField.resignFirstResponder()
        jobDetailTextField.resignFirstResponder()
        let jobTitleText = self.jobTitleTextField.text
        let jobDetailText = self.jobDetailTextField.text
        
        //Disable the send button until we are ready
        navigationItem.rightBarButtonItem?.enabled = false
        
        loadingSpinner.startAnimating()
        
        if jobTitleText?.characters.count < 1 {
            let alert = UIAlertView(title: "Empty field!", message: "Try again", delegate: self, cancelButtonTitle: "Aight")
            alert.show()
        } else if jobDetailText?.characters.count < 1 {
            let alert = UIAlertView(title: "Empty field!", message: "Try again", delegate: self, cancelButtonTitle: "Aight")
            alert.show()
        } else {
            saveNewJobEntry()
        }
    }
    
    
    func saveNewJobEntry()
    {
        //1
        let job = Job(jobTitle: self.jobTitleTextField.text, jobDetail: self.jobDetailTextField.text)
        //2
        job.saveInBackgroundWithBlock{ succeeded, error in
            if succeeded {
                //3
                print("Created new job successfully")
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