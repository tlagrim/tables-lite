//
//  AppDelegate.swift
//  ParseTutorial
//
//  Initial configuration created by Ron Kliffer on 3/6/15
//  in a parse tutorial.
//  Copyright (c) 2015 Ron Kliffer. All rights reserved.
//
//  Configuration continued by Timothy Lagrimas. 
//  All extended files created by Timothy Lagrimas.
//
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        Parse.setApplicationId("xcfmGUIcReyZncLTWb7CGUNI1K9Yk84TrrMe75j9", clientKey: "KeB2IDnQfqG4dt2s3rInq06EPwcjYovBVP7RqU6q")
        
/*
        print ("HDSFDSJFASHFJKSLFHDSJKFHALKFJA")
        let myGroup = PFObject(className: "Group")
        
        let query = PFQuery(className: "Person")
        query.whereKey("groupId", equalTo: myGroup)
        query.findObjectsInBackgroundWithBlock {
            (persons: [PFObject]?, error: NSError?) -> Void in
            if error == nil {
                print("Successfully retrieved: \(persons)")
            } else {
                print("Error: \(error) \(error!.userInfo)")
            }
        }
        print("fdsafdsfdsahfjkflhsdjfklsaf")
        */
        
        /*
        let user = PFObject(className: "User")
        user.setObject("Connor Serres", forKey: "Name")
        user.setObject(4, forKey: "Number")
        user.setObject(2819892910, forKey: "PhoneNumber")
        user.setObject("kleincollins", forKey: "Team")
        user.setObject("Seni
        // 1
        let query = PFQuery(className: "User")
        // 2
        query.whereKey("Team", equalTo: "stedwards")
        //query.whereKey("Score", greaterThan: 1000)
        // 3
        query.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
        if error == nil {
        print("Successfully retrieved: \(objects)")
        } else {
        print("Error: \(error) \(error!.userInfo)")
        }
        }*/
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

