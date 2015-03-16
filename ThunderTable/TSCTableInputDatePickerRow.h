//
//  TSCTableInputDatePickerRow.h
// ThunderTable
//
//  Created by Phillip Caudell on 26/09/2013.
//  Copyright (c) 2013 3 SIDED CUBE. All rights reserved.
//

#import "TSCTableInputRow.h"

/**
 `TSCTableInputTextFieldRow` a row which provides the user with a `UIDatePicker` for entering a date
 */
@interface TSCTableInputDatePickerRow : TSCTableInputRow

///---------------------------------------------------------------------------------------
/// @name Initialization Methods
///---------------------------------------------------------------------------------------

/**
 Initializes the row with a title and date mode
 @param title The title to show on the row
 @param mode The `UIDatePickerMode` for the date picker to be shown
 @param inputId The key to save the value of the `UIDatePicker` under
 @param required Whether or not a value is required for this row
 */

+ (instancetype)rowWithTitle:(NSString *)title mode:(UIDatePickerMode)mode inputId:(NSString *)inputId required:(BOOL)required;

///---------------------------------------------------------------------------------------
/// @name Row configuration
///---------------------------------------------------------------------------------------

/**
 @abstract The date picker mode to use on the `UIDatePicker`
 */
@property (nonatomic, assign) UIDatePickerMode datePickerMode;

@end
