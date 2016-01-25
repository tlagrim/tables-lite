//
//  RegisterViewController.swift
//  JobManagerTools
//
//  Created by TJ Lagrimas on 12/2/15.
//  Copyright © 2015 Timothy Lagrimas. All rights reserved.
//

import Foundation
import UIKit

class RegisterViewController: UIViewController {
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet var imageLights: FLAnimatedImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let imageTheLights: FLAnimatedImage = FLAnimatedImage(animatedGIFData: NSData(contentsOfFile: NSBundle.mainBundle().pathForResource("lights", ofType: "gif")!))
        self.imageLights.animatedImage = imageTheLights
        [self.view .addSubview(self.imageLights)]
        }
    
    @IBAction func signUpPressed(sender: AnyObject) {
        let username = self.userTextField.text
        let password = self.passwordTextField.text
        let email = self.emailTextField.text
        
        if username!.characters.count <= 5 {
            let alert = UIAlertView(title: "Username not long enough!", message: "For your safety, username must be greater than 5 characters", delegate: self, cancelButtonTitle: "Aight")
            alert.show()
            
        } else if password!.characters.count == 0 {
            let alert = UIAlertView(title: "Empty password!", message: "Password must be greater than 8 characters", delegate: self, cancelButtonTitle: "OK")
            alert.show()
            
        } else if password!.characters.count < 5 {
            let alert = UIAlertView(title: "Password not long enough!", message: "For your safety, password must be greater than 5 characters", delegate: self, cancelButtonTitle: "Aight fam")
            alert.show()
            
        } else if email!.characters.count < 5 {
            let alert = UIAlertView(title: "Invalid email!", message: "Please enter a valid email address.", delegate: self, cancelButtonTitle: "Gotcha")
            alert.show()
            
        } else {
            let finalEmail = email!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
            let spinner: UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRectMake(0, 0, 150, 150)) as UIActivityIndicatorView
            spinner.startAnimating()
            
            //1
            let user = PFUser()
            
            //2
            user.username = username
            user.password = password
            user.email = finalEmail
            
            
            //3
            user.signUpInBackgroundWithBlock({ (succeed, error) -> Void in
                
                // Stop the spinner
                spinner.stopAnimating()
                if ((error) != nil) {
                    let alert = UIAlertView(title: "Error", message: "\(error)", delegate: self, cancelButtonTitle: "OK")
                    alert.show()
                    
                } else {
                    let alert = UIAlertView(title: "Success", message: "Signed Up", delegate: self, cancelButtonTitle: "OK")
                    alert.show()
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        let viewController: UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("GroupsOverview")
                        self.presentViewController(viewController, animated: true, completion: nil)
                        //self.performSegueWithIdentifier(self.scrollViewWallSegue, sender: nil)
                    })
                }
            })
        }
    }
}
