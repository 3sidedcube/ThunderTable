//
//  InputInlineDatePickerViewCell.swift
//  ThunderTable
//
//  Created by Simon Mitchell on 16/09/2020.
//  Copyright © 2020 3SidedCube. All rights reserved.
//

import UIKit

open class InputInlineDatePickerViewCell: TableViewCell, DatePickerCell {
        
    public var inputTextField: UITextField? {
        return nil
    }
    
    public var dateFormatter: DateFormatter? {
        get { return nil }
        set { }
    }
    
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
