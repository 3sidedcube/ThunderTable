//
//  InputSwitchViewCell.swift
//  ThunderTable
//
//  Created by Simon Mitchell on 16/09/2016.
//  Copyright © 2016 3SidedCube. All rights reserved.
//

import UIKit

open class InputSwitchViewCell: TableViewCell {

    @IBOutlet weak public var `switch`: UISwitch!
    
    /// Defines whether to group the label and switch as a single accessibility element
    /// - Note: Defaults to true!
    public var accessibilityGroupLabelsAndSwitch = true {
        didSet {
            isAccessibilityElement = accessibilityGroupLabelsAndSwitch
        }
    }
 
    //MARK: - Accessibility
    
    open override var accessibilityTraits: UIAccessibilityTraits {
        get {
            return `switch`.accessibilityTraits
        }
        set {  }
    }
    
    open override var accessibilityLabel: String? {
        get {
            return [cellTextLabel?.text, cellDetailLabel?.text].compactMap({
                guard let text = $0, !text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { return nil }
                return text
            }).joined(separator: ",")
        }
        set { }
    }
    
    open override func accessibilityActivate() -> Bool {
        self.switch.setOn(!self.switch.isOn, animated: true)
        self.switch.sendActions(for: .valueChanged)
        return true
    }
}
