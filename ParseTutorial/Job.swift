//
//  Job.swift
//  ParseStarterProject-Swift
//
//  Created by TJ Lagrimas on 12/2/15.
//  Copyright © 2015 Parse. All rights reserved.
//

import Foundation
class Job: PFObject, PFSubclassing {
    @NSManaged var jobTitle: String?
    @NSManaged var jobDetail: String?
    
    // Table view delegate methods here
    // 1
    class func parseClassName() -> String {
        // Set the name of the class as seen in the backend database.
        return "Job"
    }
    
    // 2
    // Let Parse know that you intend to use this subclass for all objects
    // with class type Job. You want to do this only once, so you’re
    // using dispatch_once_t to make sure of that.
    override class func initialize() {
        var onceToken: dispatch_once_t = 0
        dispatch_once(&onceToken) {
            self.registerSubclass()
        }
    }
    
    override class func query() -> PFQuery? {
        // 1
        // Create a PFQuery object for the Job class.
        let query = PFQuery(className: Job.parseClassName())
        
        // 2
        // Request that this query will return the full user details.
        // Without this line of code, the query will just return the
        // object reference of the user without its details.
        //query.includeKey("user")
        
        // 3
        // Sort the results by their creation date.
        query.orderByDescending("createdAt")
        return query
    }
    
    init(jobTitle: String?, jobDetail: String?) {
        super.init()
        
        self.jobTitle = jobTitle
        self.jobDetail = jobDetail
    }
    
    override init() {
        super.init()
    }
    
}
