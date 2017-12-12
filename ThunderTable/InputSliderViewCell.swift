//
//  InputSliderViewCell.swift
//  ThunderTable
//
//  Created by Simon Mitchell on 16/09/2016.
//  Copyright © 2016 3SidedCube. All rights reserved.
//

import UIKit

/// A subclass of `UISlider` which allows custom intervals between maximumValue and minimumValue.
///
/// This is achieved by providing the conversion variable, `correctedValue` which should be used in place of `value`
/// - Important: For intervals other than 1, `value != correctedValue` and `correctedValue` should be used to get
/// the actual value the user has selected!
public class IntervalSlider: UISlider {
	
	/// A custom interval that the slider should jump at
	///
	/// - Warning: Setting this after the user updates the slider is currently not supported, and will break
	/// the values the slider returns
	public var interval: Float = 1
	
	/// Should be used instead of `value`, returns the usable value taking into account the custom interval
	public var correctedValue: Float {
		
		var finalValue = value
		let tempValue = fabsf(fmodf(value, interval));
		
		//if the remainder is greater than or equal to the half of the interval then return the higher interval, otherwise, return the lower interval
		if tempValue >= (interval / 2.0) {
			finalValue = value - tempValue + interval
		} else {
			finalValue = value - tempValue
		}
		
		return finalValue
	}
}

open class InputSliderViewCell: TableViewCell {

    @IBOutlet weak public var valueLabel: UILabel!
    
    @IBOutlet weak public var slider: IntervalSlider!
    
    @objc open func updateLabel(sender: IntervalSlider) {
        valueLabel.text = "\(sender.correctedValue)"
    }
}
