//
//  InputSliderViewCell.swift
//  ThunderTable
//
//  Created by Simon Mitchell on 16/09/2016.
//  Copyright © 2016 3SidedCube. All rights reserved.
//

import UIKit

class InputSliderViewCell: TableViewCell {

    @IBOutlet weak var valueLabel: UILabel!
    
    @IBOutlet weak var slider: UISlider!
    
    func updateLabel(sender: UISlider) {
        valueLabel.text = "\(sender.value)"
    }
}
