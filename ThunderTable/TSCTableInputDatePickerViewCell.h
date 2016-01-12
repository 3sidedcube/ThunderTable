//
//  TSCTableInputPickerViewCell.h
// ThunderTable
//
//  Created by Phillip Caudell on 26/09/2013.
//  Copyright (c) 2013 3 SIDED CUBE. All rights reserved.
//

#import "TSCTableInputViewCell.h"

/**
 A cell which displays a `UITextField` which has a `UIDatePicker` in place of it's keyboard when it becomes first responder
 */
@interface TSCTableInputDatePickerViewCell : TSCTableInputViewCell

/**
 The date formatter for the cell. 
 @discussion This dateFormatter determines which format the selected date is shown in in the `UITextField`
 */
@property (nonatomic, strong) NSDateFormatter *dateFormatter;

/**
 @abstract The text field which displays the current date
 */
@property (nonatomic, strong) UITextField *dateLabel;

/**
 @abstract The date picker which is shown when the text field becomes the first responder
 */
@property (nonatomic, strong) UIDatePicker *datePicker;

/**
 @abstract The handler for when the user is done selecting a date
 */
@property (nonatomic, copy) void (^doneHandler)(TSCTableInputDatePickerViewCell *cell);

@end