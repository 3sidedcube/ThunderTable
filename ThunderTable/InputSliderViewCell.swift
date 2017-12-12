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
/// This is achieved by providing conversion variables, `correctedValue` and `correctedMaximumValue` which
/// should be used in place of setting/getting `value` and `maximumValue` respectively, and then a conversion
/// is done to convert `value` to the actual value taking into account the user's custom interval.
///
/// There is also a helper function `setCorrectedValue(_,animated)` which should be used in place of the `UISlider` equivalent.
///
/// - Important: For intervals other than 1, `value != correctedValue` and `correctedValue` should be used to get/set
/// the actual value the user has selected!
public class IntervalSlider: UISlider {
	
	/// A custom interval that the slider should jump at
	public var interval: Float = 1 {
		didSet {
			// Update value and maximumValue to reflect change in interval
			value = minimumValue + ((_correctedValue - minimumValue) / interval)
			maximumValue = minimumValue + ((_correctedMaximumValue - minimumValue) / interval)
		}
	}
	
	private var _correctedValue: Float = 0.0
	
	/// Should be used instead of `value`, returns the usable value taking into account the custom interval
	public var correctedValue: Float {
		get {
			let convertedValue = (interval * (value - minimumValue)) + minimumValue
			return convertedValue
		}
		set {
			_correctedValue = newValue
			value = minimumValue + ((newValue - minimumValue) / interval)
		}
	}
	
	private var _correctedMaximumValue: Float = 1.0
	
	/// Should be used instead of `maximumValue`, returns the usable max value taking into account the custom interval
	public var correctedMaximumValue: Float {
		get {
			let convertedValue = (interval * (maximumValue - minimumValue)) + minimumValue
			return convertedValue
		}
		set {
			_correctedMaximumValue = newValue
			maximumValue = minimumValue + ((newValue - minimumValue) / interval)
		}
	}
	
	public func setCorrectedValue(_ value: Float, animated: Bool) {
		super.setValue(minimumValue + ((value - minimumValue) / interval), animated: animated)
	}
}

open class InputSliderViewCell: TableViewCell {

    @IBOutlet weak public var valueLabel: UILabel!
    
    @IBOutlet weak public var slider: IntervalSlider!
    
    @objc open func updateLabel(sender: IntervalSlider) {
        valueLabel.text = "\(sender.correctedValue)"
    }
}
