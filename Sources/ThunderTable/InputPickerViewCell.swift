//
//  InputTextFieldViewCell.swift
//  ThunderTable
//
//  Created by Simon Mitchell on 15/09/2016.
//  Copyright © 2016 3SidedCube. All rights reserved.
//

import UIKit

/// A subclass of TableViewCell which displays a title, and field editable
/// by selecting values from a `UIPickerView`.
open class InputPickerViewCell: TableViewCell {
    
    @IBOutlet weak public var textField: UITextField!
    
    public var picker = UIPickerView()
    
    var formatter: ((_ picker: UIPickerView) -> String)?
    
    override open func becomeFirstResponder() -> Bool {
        return textField.becomeFirstResponder()
    }
    
    override open func resignFirstResponder() -> Bool {
        return textField.resignFirstResponder()
    }
    
    open override func awakeFromNib() {
        
        super.awakeFromNib()
        
        let doneToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: bounds.width, height: 44))
        doneToolbar.isTranslucent = true
        doneToolbar.barTintColor = .white
        doneToolbar.tintColor = ThemeManager.shared.theme.mainColor
        
        doneToolbar.items = [
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil),
            UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(handleDone(sender:)))
        ]
        
        textField.inputView = picker
        textField.inputAccessoryView = doneToolbar
    }
    
    @objc private func handleDone(sender: UIBarButtonItem) {
        textField.resignFirstResponder()
    }
    
    @objc func updateLabel(sender: UIPickerView) {
        textField.text = formatter?(sender)
    }
}
