//
//  TableViewCell.swift
//  ThunderTable
//
//  Created by Simon Mitchell on 14/09/2016.
//  Copyright © 2016 3SidedCube. All rights reserved.
//

import UIKit

open class TableImageViewCell: TableViewCell {

	@IBOutlet weak public var imageHeightConstraint: NSLayoutConstraint!
    
    open override func prepareForReuse() {
        // Has to be done here because re-use resets these to defaults!
        super.prepareForReuse()
        isAccessibilityElement = false
        cellImageView?.isAccessibilityElement = true
    }
    
    open override var accessibilityElements: [Any]? {
        get {
            return [cellImageView].compactMap({ $0 })
        }
        set { }
    }
}
