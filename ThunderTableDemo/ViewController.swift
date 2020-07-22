//
//  ViewController.swift
//  ThunderTableDemo
//
//  Created by Simon Mitchell on 26/02/2018.
//  Copyright © 2018 3SidedCube. All rights reserved.
//

import UIKit
import ThunderTable
import Contacts
import ContactsUI

class ViewController: TableViewController {

    override func viewDidLoad() {
        
        let contact1 = CNMutableContact()
        contact1.givenName = "John"
        contact1.familyName = "Snow"
        contact1.phoneNumbers = [
            CNLabeledValue(label: CNLabelHome, value: CNPhoneNumber(stringValue: "+44 20 7946 0302"))
        ]
        contact1.emailAddresses = [
            CNLabeledValue(label: CNLabelHome, value: "john@john.john")
        ]
        
        super.viewDidLoad()
        
        data = [basicsSection(), protocolSection(), contact1, inputSection(), customSection(), actionsSection()]
    }
    
    
    
    private func actionsSection() -> TableSection {
        
        let destructiveAction = RowAction(style: .destructive, title: "Destroy!") { (actionable, view, callback, row, indexPath, tableView) in
            
            let alertController = UIAlertController(title: "Performed Action", message: nil, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
            
            self.present(alertController, animated: true, completion: nil)
            callback?(false)
        }
        
        let leftActionsRow = TableRow(title: "Swipe From Left")
        let leftAction1 = RowAction(style: .normal, title: "Action") { (actionable, view, callback, row, indexPath, tableView) in
            callback?(true)
        }
        let actionConfiguration = SwipeActionsConfiguration(actions: [leftAction1, destructiveAction])
        leftActionsRow.leadingSwipeActionsConfiguration = actionConfiguration
        
        let customAction = RowAction(style: .normal, title: "Custom") { (actionable, view, callback, row, indexPath, tableView) in
            callback?(true)
        }
        customAction.backgroundColor = .green
        
        let rightActionConfiguration = SwipeActionsConfiguration(actions: [customAction])
        
        let rightActionsRow = TableRow(title: "Swipe From Right")
        rightActionsRow.trailingSwipeActionsConfiguration = rightActionConfiguration
        
        return TableSection(rows: [leftActionsRow, rightActionsRow], header: "Cell Actions", footer: nil, selectionHandler: nil)
    }
    
    private func basicsSection() -> TableSection {
        
        let row = TableRow(title: "Title")
        let subtitleRow = TableRow(title: "Title", subtitle: "Subtitle", image: nil, selectionHandler: nil)
        let imageRow = TableRow(title: "Bundled Image", subtitle: "With Footer", image: #imageLiteral(resourceName: "logo"), selectionHandler: nil)
        let remoteImageRow = TableRow(title: "Remote Image")
        remoteImageRow.imageURL = URL(string: "http://via.placeholder.com/120x80")
        remoteImageRow.imageSize = .init(width: 120, height: 80)
        
        let remoteImageWithPlaceholderRow = TableRow(title: "Remote Image w/ Placeholder")
        remoteImageWithPlaceholderRow.placeholderImage = #imageLiteral(resourceName: "logo")
        remoteImageWithPlaceholderRow.imageURL = URL(string: "http://via.placeholder.com/80x80")
        
        let actionRow = TableRow(title: "Show Alert", subtitle: nil, image: nil) { (row, selected, indexPath, tableView) -> (Void) in
            
            let alertViewController = UIAlertController(title: "Row Selected!", message: "You selected: \(row) at index path: \(indexPath)", preferredStyle: .alert)
            alertViewController.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
            
            self.present(alertViewController, animated: true, completion: nil)
        }
        
        let basicsSection = TableSection(rows: [row, subtitleRow, imageRow, remoteImageRow, remoteImageWithPlaceholderRow, actionRow], header: "Header", footer: "Footer", selectionHandler: nil)
        
        return basicsSection
    }
    
    private func protocolSection() -> TableSection {
        
        let contact1 = CNMutableContact()
        contact1.givenName = "John"
        contact1.familyName = "Snow"
        contact1.phoneNumbers = [
            CNLabeledValue(label: CNLabelHome, value: CNPhoneNumber(stringValue: "+44 20 7946 0302"))
        ]
        
        let contact2 = CNMutableContact()
        contact2.givenName = "Cersei"
        contact2.familyName = "Lannister"
        contact2.emailAddresses = [
            CNLabeledValue(label: CNLabelHome, value: "cersei@cersei.cersei")
        ]
        
        let contact3 = CNMutableContact()
        contact3.givenName = "Tyrion"
        contact3.familyName = contact2.familyName
        
        return TableSection(rows: [contact1, contact2, contact3], header: "Custom Protocol Inheritance", footer: nil, selectionHandler: { (row, selected, indexPath, tableView) -> (Void) in
            
            switch row {
            case let contact as CNContact:
                
                let contactVC = CNContactViewController(forNewContact: contact)
                let contactNavController = UINavigationController(rootViewController: contactVC)
                contactVC.delegate = self
                self.present(contactNavController, animated: true, completion: nil)
                
                break
            default:
                break
            }
        })
    }
    
    private func customSection() -> TableSection {
        
        let subtitleRow = TableRow(title: "Red", subtitle: "Blue", image: nil, selectionHandler: nil)
        subtitleRow.titleTextColor = .red
        subtitleRow.subtitleTextColor = .blue
        
        let noSeparatorsRow = TableRow(title: "No Separators")
        noSeparatorsRow.displaySeparators = false
        
        let detailRow = TableRow(title: "Detail Disclosure")
        detailRow.accessoryType = .detailDisclosureButton
        
        let checkRow = TableRow(title: "Check Mark")
        checkRow.accessoryType = .checkmark
        
        let value1Row = TableRow(title: "Value 1", subtitle: "Subtitle", image: nil, selectionHandler: nil)
        value1Row.cellStyle = .value1
        
        let value2Row = TableRow(title: "Value 2", subtitle: "Subtitle", image: nil, selectionHandler: nil)
        value2Row.cellStyle = .value2
        
        let subtitleStyleRow = TableRow(title: "Subtitle", subtitle: "Subtitle", image: nil, selectionHandler: nil)
        subtitleStyleRow.cellStyle = .subtitle
        
        let customSection = TableSection(rows: [noSeparatorsRow, subtitleRow, detailRow, checkRow, value1Row, value2Row, subtitleStyleRow], header: "Custom Rows", footer: nil, selectionHandler: nil)
        return customSection
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
        switchRow2.subtitle = "Change to on!"
        switchRow2.value = true
        
        let dobRow = InputDatePickerRow(title: "Date of Birth", mode: .date, id: "dob", required: false)
        dobRow.dateFormatter.dateFormat = "dd-MM-YYYY"
        dobRow.maximumDate = Date()
        dobRow.minimumDate = Date().addingTimeInterval(-18 * 365 * 24 * 60 * 60)
        dobRow.mode = .date
        
        let date = Date(timeIntervalSince1970: 743706458)
        dobRow.value = date
        
        let countdownRow = InputDatePickerRow(title: "Timer", mode: .countDownTimer, id: "timer", required: false)
        
        let timeOfDayRow = InputDatePickerRow(title: "Bedtime", mode: .time, id: "bedtime", required: false)
        
        let viewInputRow = TableRow(title: "View Inputted Values")
        viewInputRow.selectionHandler = { (row, selected, indexPath, tableView) -> (Void) in
            
            if let missingRows = self.missingRequiredInputRows, !missingRows.isEmpty {
                
                let alertViewController = UIAlertController(title: "Missing Input Values", message: "You are missing required values for: \(missingRows.map({ $0.id }))", preferredStyle: .alert)
                alertViewController.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
                
                self.present(alertViewController, animated: true, completion: nil)
                
            } else {
                
                let alertViewController = UIAlertController(title: "Inputted Values", message: "\(self.inputDictionary)", preferredStyle: .alert)
                alertViewController.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
                
                self.present(alertViewController, animated: true, completion: nil)
            }
        }
        
        let sliderRow = InputSliderRow(title: "Piece of string", minValue: 1.0, maxValue: 10.0, id: "string", required: true)
        sliderRow.subtitle = "Enter the length"
        let distanceFormatter = MeasurementFormatter()
        distanceFormatter.unitStyle = .medium
        
        sliderRow.accessibilityValueFormatter = { value in
            let measurement = Measurement(value: Double(value), unit: .init(symbol: "m"))
            return distanceFormatter.string(from: measurement)
        }
        
        let givenNameCompnent = PickerComponent(items: ["John", "Cersei", "Tyrion"])
        let familyNameComponent = PickerComponent(items: ["Lannister", "Greyjoy", "Snow"])
        
        let inputPickerRow = InputPickerRow(title: "Pick Me!", components: [givenNameCompnent, familyNameComponent], formatter: { (value) -> String in
            guard let stringValues = value as? [String] else { return "" }
            return stringValues.joined(separator: " ")
        }, id: "name_components", required: false)
        
        let inputSection = TableSection(rows: [textFieldRow, textViewRow, switchRow, switchRow2, dobRow, countdownRow, timeOfDayRow, sliderRow, viewInputRow, inputPickerRow], header: "Input Rows", footer: nil, selectionHandler: nil)
        
        return inputSection
    }
}

extension ViewController: CNContactViewControllerDelegate {
    
    func contactViewController(_ viewController: CNContactViewController, didCompleteWith contact: CNContact?) {
        viewController.dismiss(animated: true, completion: nil)
    }
    
    func contactViewController(_ viewController: CNContactViewController, shouldPerformDefaultActionFor property: CNContactProperty) -> Bool {
        return false
    }
}

