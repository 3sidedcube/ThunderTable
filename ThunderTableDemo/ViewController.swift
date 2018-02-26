//
//  ViewController.swift
//  ThunderTableDemo
//
//  Created by Simon Mitchell on 26/02/2018.
//  Copyright © 2018 3SidedCube. All rights reserved.
//

import UIKit
import ThunderTable

class ViewController: TableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        data = [basicsSection(), inputSection()]
    }
    
    private func basicsSection() -> TableSection {
        
        let row = TableRow(title: "Title")
        let subtitleRow = TableRow(title: "Title", subtitle: "Subtitle", image: nil, selectionHandler: nil)
        let imageRow = TableRow(title: "Bundled Image", subtitle: "With Footer", image: #imageLiteral(resourceName: "logo"), selectionHandler: nil)
        let remoteImageRow = TableRow(title: "Remote Image")
        remoteImageRow.imageURL = URL(string: "http://via.placeholder.com/120x80")
        
        let actionRow = TableRow(title: "Show Alert", subtitle: nil, image: nil) { (row, selected, indexPath, tableView) -> (Void) in
            
            let alertViewController = UIAlertController(title: "Row Selected!", message: "You selected: \(row) at index path: \(indexPath)", preferredStyle: .alert)
            alertViewController.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
            
            self.present(alertViewController, animated: true, completion: nil)
        }
        
        let basicsSection = TableSection(rows: [row, subtitleRow, imageRow, remoteImageRow, actionRow], header: "Header", footer: "Footer", selectionHandler: nil)
        
        return basicsSection
    }
    
    private func inputSection() -> TableSection {
        
        let textFieldRow = InputTextFieldRow(title: "Name", placeholder: "3 Sided Cube", id: "name", required: true, keyboardType: .default, returnKeyType: .next)
        textFieldRow.valueChangeHandler = { (value, sender) in
            self.title = value as? String
        }
        let textViewRow = InputTextViewRow(title: "Description", placeholder: nil, id: "description", required: true)
        
        let switchRow = InputSwitchRow(title: "Switch 1", subtitle: "Default Off (required)", id: "switch1")
        switchRow.required = true
        
        let switchRow2 = InputSwitchRow(title: "Switch 2", subtitle: "Default On", id: "switch2")
        switchRow2.value = true
        
        let dobRow = InputDatePickerRow(title: "Date of Birth", id: "dob", required: false)
        dobRow.dateFormatter.dateFormat = "dd-MM-YYYY"
        dobRow.maximumDate = Date()
        dobRow.minimumDate = Date().addingTimeInterval(-18 * 365 * 24 * 60 * 60)
        dobRow.mode = .date
        
        let countdownRow = InputDatePickerRow(title: "Timer", id: "timer", required: false)
        countdownRow.mode = .countDownTimer
        
        let timeOfDayRow = InputDatePickerRow(title: "Bedtime", id: "bedtime", required: false)
        timeOfDayRow.mode = .time
        
        let viewInputRow = TableRow(title: "View Inputted Values")
        viewInputRow.selectionHandler = { (row, selected, indexPath, tableView) -> (Void) in
            
            if let missingRows = self.missingRequiredInputRows, !missingRows.isEmpty {
                
                let alertViewController = UIAlertController(title: "Missing Input Values", message: "You are missing required values for: \(missingRows.map({ $0.id }))", preferredStyle: .alert)
                alertViewController.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
                
                self.present(alertViewController, animated: true, completion: nil)
                
            } else {
                
                let alertViewController = UIAlertController(title: "Inputted Values", message: "\(self.inputDictionary ?? [:])", preferredStyle: .alert)
                alertViewController.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
                
                self.present(alertViewController, animated: true, completion: nil)
            }
        }
        
        let inputSection = TableSection(rows: [textFieldRow, textViewRow, switchRow, switchRow2, dobRow, countdownRow, timeOfDayRow, viewInputRow], header: "Input Rows", footer: nil, selectionHandler: nil)
        
        return inputSection
    }
}
