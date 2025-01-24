//
//  InputDatePickerRow.swift
//  ThunderTable
//
//  Created by Simon Mitchell on 03/01/2018.
//  Copyright © 2018 3SidedCube. All rights reserved.
//

import UIKit

/// A row which displays a date picker in the keyboard for the user
/// to select a date and formats the date nicely
open class InputDatePickerRow: InputTableRow {

	/// The date picker mode for the row
	open var mode: UIDatePicker.Mode = .dateAndTime
    
    /// The preferred date picker style for the row
    open var preferredDatePickerStyle: UIDatePickerStyle = .automatic

	/// The minimum date allowed by the row
	open var minimumDate: Date?
	
	/// The maximum date allowed by the row
	open var maximumDate: Date?
	
	/// The formatter to style the date string
	open var dateFormatter: DateFormatter = DateFormatter()
	
	/// Creates a new row from provided properties
	///
	/// - Parameters:
	///   - title: The title of the row
	///   - mode: The mode of the date picker
	///   - id: The unique id for this row
	///   - required: Whether the value is required
	public init(title: String?, mode: UIDatePicker.Mode = .dateAndTime, id: String, required: Bool) {
		
		self.mode = mode
		
		super.init(id: id, required: required)

		self.title = title
		
		switch mode {
		case .date:
			dateFormatter.dateStyle = .long
			dateFormatter.timeStyle = .none
			break
		case .time:
			dateFormatter.timeStyle = .short
			break
		case .dateAndTime:
			dateFormatter.timeStyle = .short
			dateFormatter.dateStyle = .medium
			break
		case .countDownTimer:
			dateFormatter.dateFormat = "'Every' HH 'hours' mm 'minutes'"
			break
        #if swift(>=5.10)
        case .yearAndMonth:
            dateFormatter.dateFormat = "MM/yyyy"
            break
        #endif
        @unknown default:
            fatalError("Unknown `UIDatePicker.Mode` encountered in `InputDatePickerRow` please add support for this new enum value")
        }
	}
	
	open override var cellClass: UITableViewCell.Type? {
        return preferredDatePickerStyle.cellClass(for: mode)
	}
	
	open override func configure(cell: UITableViewCell, at indexPath: IndexPath, in tableViewController: TableViewController) {
		
        guard let datePickerCell = cell as? InputDatePickerViewCell else { return }
		
		super.configure(cell: cell, at: indexPath, in: tableViewController)
		
		// Targets and selectors
        // If we have a text field we use that for targets and selectors
        if let textField = datePickerCell.inputTextField {
            updateTargetsAndSelectors(for: textField)
            // Otherwise we add them to the date picker to make sure we still get callbacks!
        } else if let datePicker = datePickerCell.datePicker {
            updateTargetsAndSelectors(for: datePicker)
        }
        
		datePickerCell.dateFormatter = dateFormatter
		datePickerCell.inputTextField?.delegate = self
		datePickerCell.datePicker?.addTarget(self, action: #selector(handleChange(sender:)), for: .valueChanged)
        
		datePickerCell.datePicker?.addTarget(datePickerCell, action: #selector(datePickerCell.updateInputTextFieldText(sender:)), for: .valueChanged)
		
		// Setting up date picker
		datePickerCell.datePicker?.minimumDate = minimumDate
		datePickerCell.datePicker?.maximumDate = maximumDate
		datePickerCell.datePicker?.datePickerMode = mode
        datePickerCell.datePicker?.preferredDatePickerStyle = preferredDatePickerStyle
		
        if let textField = datePickerCell.inputTextField {
            
            if let dateValue = value as? Date {
                textField.text = dateFormatter.string(from: dateValue)
            } else {
                textField.text = nil
            }
            
        } else {
            
            datePickerCell.datePicker?.date = value as? Date ?? Date()
        }
	}
	
	@objc private func handleChange(sender: UIDatePicker) {
		set(value: sender.date, sender: sender)
	}
}

extension InputDatePickerRow: UITextFieldDelegate {
	
	public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		
		textField.resignFirstResponder()
		nextHandler?(textField)
		return false
	}
}

extension UIDatePickerStyle {
    /// Returns the correct cell class for the style given the mode the date picker is set to
    /// - Parameter mode: The date picker mode the date picker is in
    /// - Returns: A table view cell class used to render the cell
    func cellClass(for mode: UIDatePicker.Mode) -> UITableViewCell.Type {

        // Even old versions of iOS can support `inline` no matter how much of a hot mess it is visually!
        if self == .inline {
            // Return new class
            return InputInlineDatePickerViewCell.self
        }

        switch mode {
        case .countDownTimer:
            // countdown timer doesn't have an `inline` or `compact` representation, so we
            // keep the traditional `wheels` cell for this case
            return InputDatePickerViewCell.self
        default:
            switch self {
                // Automatic, Compact and Inline should all use the inline style cell
            case .automatic, .compact, .inline:
                return InputInlineDatePickerViewCell.self
                // All others (.wheels) should use the original date picker cell
            default:
                return InputDatePickerViewCell.self
            }
        }
    }
}
