//
//  Person.swift
//  JobManagerTools
//
//  Created by TJ Lagrimas on 12/3/15.
//  Copyright © 2015 Timothy Lagrimas. All rights reserved.
//

import Foundation

class Person: PFObject, PFSubclassing {
    @NSManaged var image: PFFile
    @NSManaged var createdBy: PFUser
    @NSManaged var groupId: PFObject
    @NSManaged var bio: String?
    @NSManaged var name: String?
    
    
    // Table view delegate methods here
    // 1
    class func parseClassName() -> String {
        // Set the name of the class as seen in the backend database.
        return "Person"
    }
    
    // 2
    // Let Parse know that you intend to use this subclass for all objects
    // with class type WallPost. You want to do this only once, so you’re
    // using dispatch_once_t to make sure of that.
    override class func initialize() {
        var onceToken: dispatch_once_t = 0
        dispatch_once(&onceToken) {
            self.registerSubclass()
        }
    }
    
    override class func query() -> PFQuery? {
        // 1
        // Create a PFQuery object for the Person class.
        let query = PFQuery(className: Person.parseClassName())
        
        // 2
        // Request that this query will return the full user details.
        // Without this line of code, the query will just return the
        // object reference of the user without its details.
        // query.includeKey("createdBy")
        
        // 3
        // Sort the results by their creation date.
        query.orderByDescending("updatedAt")
        return query
    }
    
    init(image: PFFile, createdBy: PFUser, bio: String?, name: String?, groupId: Group) {
        super.init()
        
        self.image = image
        self.createdBy = createdBy
        self.bio = bio
        self.name = name
        self.groupId = groupId
    }
    
    override init() {
        super.init()
    }
}
