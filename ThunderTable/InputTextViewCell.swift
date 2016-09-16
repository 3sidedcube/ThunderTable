//
//  InputTextViewCell.swift
//  ThunderTable
//
//  Created by Simon Mitchell on 16/09/2016.
//  Copyright © 2016 3SidedCube. All rights reserved.
//

import UIKit

class InputTextViewCell: TableViewCell {

    @IBOutlet weak public var textView: UITextView!
    
    @IBOutlet weak public var textViewHeightConstraint: NSLayoutConstraint!
    
    override func becomeFirstResponder() -> Bool {
        return textView.becomeFirstResponder()
    }
    
    override func resignFirstResponder() -> Bool {
        return textView.resignFirstResponder()
    }
}
