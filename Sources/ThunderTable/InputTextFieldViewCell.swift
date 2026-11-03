//
//  InputTextFieldViewCell.swift
//  ThunderTable
//
//  Created by Simon Mitchell on 15/09/2016.
//  Copyright © 2016 3SidedCube. All rights reserved.
//

import UIKit

open class InputTextFieldViewCell: TableViewCell {

    @IBOutlet weak public var textField: UITextField!
    
    override open func becomeFirstResponder() -> Bool {
        return textField.becomeFirstResponder()
    }
    
    override open func resignFirstResponder() -> Bool {
        return textField.resignFirstResponder()
    }
}
