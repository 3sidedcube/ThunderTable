//
//  TableViewCell.swift
//  ThunderTable
//
//  Created by Simon Mitchell on 14/09/2016.
//  Copyright © 2016 3SidedCube. All rights reserved.
//

import UIKit

@objc(TSCTableViewCell)
open class TableViewCell: UITableViewCell {

    @IBOutlet open var cellImageView: UIImageView!
    
    @IBOutlet open var cellTextLabel: UILabel!
    
    @IBOutlet open var cellDetailLabel: UILabel!
    
}
