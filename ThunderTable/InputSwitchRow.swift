//
//  InputSwitchRow.swift
//  ThunderTable
//
//  Created by Simon Mitchell on 16/09/2016.
//  Copyright © 2016 3SidedCube. All rights reserved.
//

import UIKit

open class InputSwitchRow: InputTableRow {

    override open var cellClass: AnyClass? {
        return InputSwitchViewCell.self
    }
    
    public init(title: String?, subtitle: String?, id: String, image: UIImage? = nil) {
        
        super.init(id: id, required: false)
        
        self.title = title
        self.subtitle = subtitle
        self.image = image
    }
    
    override open func configure(cell: UITableViewCell, at indexPath: IndexPath, in tableViewController: TableViewController) {
        
        guard let switchCell = cell as? InputSwitchViewCell else { return }
        
        super.configure(cell: cell, at: indexPath, in: tableViewController)
        
        updateTargetsAndSelectors(for: switchCell.switch)
        switchCell.switch.addTarget(self, action: #selector(handleChange(sender:)), for: .valueChanged)
        
        if let boolValue = value as? Bool {
            switchCell.switch.isOn = boolValue
        } else {
            switchCell.switch.isOn = false
        }
        
        switchCell.cellTextLabel.isHidden = title == nil
        switchCell.cellDetailLabel.isHidden = subtitle == nil
    }
    
    @objc func handleChange(sender: UISwitch) {
        set(value: sender.isOn, sender: sender)
    }
}
