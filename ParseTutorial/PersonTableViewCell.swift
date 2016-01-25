//
//  PersonTableViewCell.swift
//  JobManagerTools
//
//  Created by TJ Lagrimas on 12/3/15.
//  Copyright © 2015 Timothy Lagrimas. All rights reserved.
//

import Foundation
import UIKit
class PersonTableViewCell: PFTableViewCell {
    @IBOutlet weak var personImage: PFImageView!
    @IBOutlet weak var personName: UILabel!
    @IBOutlet weak var personBio: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
}