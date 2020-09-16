//
//  InputInlineDatePickerViewCell.swift
//  ThunderTable
//
//  Created by Simon Mitchell on 16/09/2020.
//  Copyright © 2020 3SidedCube. All rights reserved.
//

import UIKit

/// A `TableViewCell` subclass with an image, title label, and a date picker aligned horizontally
///
/// This cell subclass allows the user to pick a date using a `UIDatePicker` embedded "inline"
/// as one of the cell's subviews. This allows for use of
open class InputInlineDatePickerViewCell: TableViewCell, DatePickerCell {
    
    /// Input text field for protocol conformance
    public var inputTextField: UITextField? {
        return nil
    }
    
    /// Date formatter for protocol conformance
    public var dateFormatter: DateFormatter? {
        get { return nil }
        set { }
    }
    
    /// The date picker for the user picking a date
    @IBOutlet weak public var datePicker: UIDatePicker?
			
    override open func becomeFirstResponder() -> Bool {
        return datePicker?.becomeFirstResponder() ?? false
    }
    
    override open func resignFirstResponder() -> Bool {
        return datePicker?.resignFirstResponder() ?? false
    }
    
    public func updateInputTextFieldText(sender: UIDatePicker) {
        
    }
}
