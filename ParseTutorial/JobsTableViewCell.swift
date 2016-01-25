//
//  JobsTableViewCell.swift
//  JobManagerTools
//
//  Created by TJ Lagrimas on 12/3/15.
//  Copyright © 2015 Timothy Lagrimas. All rights reserved.
//

import Foundation
class JobsTableViewCell: PFTableViewCell {
    @IBOutlet weak var jobTitle: UILabel!
    @IBOutlet weak var jobDetail: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
}