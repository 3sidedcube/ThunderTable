//
//  TSCTableInputSliderRow.h
//  ThunderTable
//
//  Created by Sam Houghton on 11/03/2014.
//  Copyright (c) 2014 3 SIDED CUBE. All rights reserved.
//

#import "TSCTableInputRow.h"
#import "TSCTableInputSliderRowDataSource.h"

@class TSCTableInputSliderRow;

/**
 A row which provides the user with a `UISlider` for entering a value
 */
@interface TSCTableInputSliderRow : TSCTableInputRow <TSCTableInputSliderRowDataSource>

///---------------------------------------------------------------------------------------
/// @name Initialization Methods
///---------------------------------------------------------------------------------------

/**
 Initializes the row with a title and min, max and current value
 @param title The title to show on the row
 @param inputId The key to save the value of the `UIDatePicker` under
 @param minValue The minimum settable value on the `UISlider`
 @param maxValue The maximum settable value on the `UISlider`
 @param currentValue The 'placeholder' value of the `UISlider`
 @param required Whether or not a value is required for this row
 */
+ (instancetype)rowWithTitle:(NSString *)title inputId:(NSString *)inputId minValue:(NSNumber *)minValue maxValue:(NSNumber *)maxValue currentValue:(NSNumber *)currentValue required:(BOOL)required;

@end
