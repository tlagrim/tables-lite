//
//  File.swift
//  JobManagerTools
//
//  Created by TJ Lagrimas on 12/3/15.
//  Copyright © 2015 Timothy Lagrimas. All rights reserved.
//

import Foundation
class JobAssignmentsTableViewCell: PFTableViewCell {
    @IBOutlet weak var personImage: PFImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var bio: UILabel!
    
    @IBOutlet weak var progressView: UIProgressView!
}