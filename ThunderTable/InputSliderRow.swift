//
//  InputSliderRow.swift
//  ThunderTable
//
//  Created by Simon Mitchell on 16/09/2016.
//  Copyright © 2016 3SidedCube. All rights reserved.
//

import UIKit

open class InputSliderRow: InputTableRow {
    
    override open var cellClass: AnyClass? {
        return InputSliderViewCell.self
    }
    
    open var minValue: Float
    
    open var maxValue: Float
    
    public init(title: String?, minValue: Float, maxValue: Float, id: String, required: Bool) {
        
        self.minValue = minValue
        self.maxValue = maxValue
        
        super.init(id: id, required: required)
        
        self.title = title
    }
    
    override open func configure(cell: UITableViewCell, at indexPath: IndexPath, in tableViewController: TableViewController) {
        
        guard let sliderCell = cell as? InputSliderViewCell else { return }
        
        super.configure(cell: cell, at: indexPath, in: tableViewController)
        
        updateTargetsAndSelectors(for: sliderCell.slider)
        sliderCell.slider.addTarget(self, action: #selector(handleChange(sender:)), for: .valueChanged)
        sliderCell.slider.addTarget(sliderCell, action: #selector(InputSliderViewCell.updateLabel(sender:)), for: .valueChanged)
        
        sliderCell.cellTextLabel?.isHidden = title == nil
        
        if let doubleValue = value as? Float {
            sliderCell.slider.value = doubleValue
        } else {
            sliderCell.slider.value = minValue
        }
        
        sliderCell.slider.maximumValue = maxValue
        sliderCell.slider.minimumValue = minValue
        
        if let value = value {
            sliderCell.valueLabel.text = "\(value)"
        } else {
            sliderCell.valueLabel.text = "\(minValue)"
        }
    }
    
    @objc func handleChange(sender: UISlider) {
        set(value: sender.value, sender: sender)
    }
}
