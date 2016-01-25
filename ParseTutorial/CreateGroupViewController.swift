//
//  CreateGroupViewController.swift
//  JobManagerTools
//
//  Created by TJ Lagrimas on 12/3/15.
//  Copyright © 2015 Timothy Lagrimas. All rights reserved.
//


import Foundation
import UIKit

class CreateGroupViewController: UIViewController {
    
    @IBOutlet weak var groupKeyTextField: UITextField!
    @IBOutlet weak var groupNameTextField: UITextField!
    @IBOutlet weak var imageToUpload: UIImageView!
    @IBOutlet weak var loadingSpinner: UIActivityIndicatorView!
    
    var username: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func selectPicturePressed(sender: AnyObject) {
        //Open a UIImagePickerController to select the picture
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        presentViewController(imagePicker, animated: true, completion: nil)
        //TRYING TO FIND A WAY FOR IMAGE SIZE CHECKER
    }
    
    @IBAction func submitPressed(sender: AnyObject) {
        groupKeyTextField.resignFirstResponder()
        groupNameTextField.resignFirstResponder()

        //Disable the send button until we are ready
        navigationItem.rightBarButtonItem?.enabled = false
        
        loadingSpinner.startAnimating()
        
        let pictureData = UIImagePNGRepresentation(imageToUpload.image!)
        
        //Upload a new picture
        //1
        let file = PFFile(name: "image", data: pictureData!)
        
        //TRYING TO FIND A WAY FOR IMAGE SIZE CHECKER
        
        file!.saveInBackgroundWithBlock({ (succeeded, error) -> Void in
            if succeeded {
                //2
                self.saveNewJobEntry(file!)
            } else if let error = error {
                //3
                print("there is an error while saveInBackgroundWithBlock",error)
            }
            }, progressBlock: { percent in
                //4
                print("Uploaded: \(percent)%")
        })
    }
    
    
    func saveNewJobEntry(file: PFFile)
    {
        //1
        let group = Group(image: file, createdBy: PFUser.currentUser()!, key: self.groupKeyTextField.text, name: self.groupNameTextField.text)
        //2
        group.saveInBackgroundWithBlock{ succeeded, error in
            if succeeded {
                //3
                print("Created new group successfully")
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


extension CreateGroupViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        //Place the image in the imageview
        imageToUpload.image = image
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
}

