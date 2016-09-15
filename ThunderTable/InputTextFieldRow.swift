//
//  InputTextFieldRow.swift
//  ThunderTable
//
//  Created by Simon Mitchell on 15/09/2016.
//  Copyright © 2016 3SidedCube. All rights reserved.
//

open class InputTextFieldRow: InputTableRow {

    open var placeholder: String?
    
    open var keyboardType: UIKeyboardType
    
    open var returnKeyType: UIReturnKeyType
    
    open var isSecure: Bool = false
    
    open var autocorrectionType: UITextAutocorrectionType = .default
    
    open var autocapitalizationType: UITextAutocapitalizationType = .none
    
    open override var cellClass: AnyClass? {
        return InputTextFieldViewCell.self
    }
    
    public init(title: String?, placeholder: String?, id: String, required: Bool, keyboardType: UIKeyboardType = .default, returnKeyType: UIReturnKeyType = .default) {
        
        self.keyboardType = keyboardType
        self.returnKeyType = returnKeyType
        
        super.init(id: id, required: required)
        
        self.title = title
        self.placeholder = placeholder
        self.id = id
    }
    
    open override func configure(cell: UITableViewCell, at indexPath: IndexPath, in tableView: UITableView) {
        
        guard let textCell = cell as? InputTextFieldViewCell else { return }
        
        super.configure(cell: cell, at: indexPath, in: tableView)
            
        textCell.textField.placeholder = placeholder
        textCell.textField.keyboardType = keyboardType
        textCell.textField.returnKeyType = returnKeyType
        textCell.textField.isSecureTextEntry = isSecure
        textCell.textField.autocorrectionType = autocorrectionType
        textCell.textField.autocapitalizationType = autocapitalizationType
        
        if let stringValue = value as? String {
            textCell.textField.text = stringValue
        } else if let _value = value, _value as? NSNull == nil {
            textCell.textField.text = String(describing: _value)
        }
    }
}
