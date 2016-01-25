//
//  GroupsTableViewCell.swift
//  JobManagerTools
//
//  Created by TJ Lagrimas on 12/3/15.
//  Copyright © 2015 Timothy Lagrimas. All rights reserved.
//

import Foundation
import UIKit
class GroupsTableViewCell: PFTableViewCell {
    @IBOutlet weak var groupImage: PFImageView!
    @IBOutlet weak var groupName: UILabel!
    @IBOutlet weak var groupKey: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
}