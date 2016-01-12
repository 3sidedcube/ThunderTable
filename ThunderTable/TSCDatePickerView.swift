//
//  TSCDatePickerView.swift
//  ThunderTable
//
//  Created by Simon Mitchell on 11/01/2016.
//  Copyright © 2016 threesidedcube. All rights reserved.
//

import UIKit

public class TSCDatePickerView: UIView {
    
    @IBOutlet public weak var doneButton: UIBarButtonItem!
    @IBOutlet public weak var datePicker: UIDatePicker!

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
}
