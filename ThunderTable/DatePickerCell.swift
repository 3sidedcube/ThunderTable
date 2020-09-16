//
//  DatePickerCell.swift
//  ThunderTable
//
//  Created by Simon Mitchell on 16/09/2020.
//  Copyright © 2020 3SidedCube. All rights reserved.
//

import UIKit

/// A simple protocol that the two variants of date picker `UITableViewCell` subclasses
/// can conform to so they can share the same `Row` type whilst still providing unique UI
@objc public protocol DatePickerCell {
    
    /// The date picker that is responsible for allowing the user to pick a date
    var datePicker: UIDatePicker? { get }
    
    /// An optional input text field that will have the date set on it using a date formatter
    /// when the date picker's value is changed.
    var inputTextField: UITextField? { get }
    
    /// An optional date formatter which can be updated by `InputDatePickerRow` to allow `inputTextField`
    /// to format it's value correctly
    var dateFormatter: DateFormatter? { get set }
    
    /// A function called when the date formatters `valueChanged` callback is called
    /// - Parameter sender: The date picker which caused the change
    @objc func updateInputTextFieldText(sender: UIDatePicker)
}

extension DatePickerCell {
    
    var inputTextField: UITextField? {
        return nil
    }
}
