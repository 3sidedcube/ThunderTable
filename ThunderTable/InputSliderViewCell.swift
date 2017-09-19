//
//  InputSliderViewCell.swift
//  ThunderTable
//
//  Created by Simon Mitchell on 16/09/2016.
//  Copyright © 2016 3SidedCube. All rights reserved.
//

import UIKit

open class InputSliderViewCell: TableViewCell {

    @IBOutlet weak public var valueLabel: UILabel!
    
    @IBOutlet weak public var slider: UISlider!
    
    @objc open func updateLabel(sender: UISlider) {
        valueLabel.text = "\(sender.value)"
    }
}
