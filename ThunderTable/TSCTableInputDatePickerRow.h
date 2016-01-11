//
//  TSCTableInputDatePickerRow.h
// ThunderTable
//
//  Created by Phillip Caudell on 26/09/2013.
//  Copyright (c) 2013 3 SIDED CUBE. All rights reserved.
//

#import "TSCTableInputRow.h"

/**
 A row which provides the user with a `UIDatePicker` for entering a date
 @discussion The selected date is shown in the `detailTextLabel` of the row
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

+ (_Nonnull instancetype)rowWithTitle:(NSString * _Nullable)title mode:(UIDatePickerMode)mode inputId:(NSString * _Nonnull )inputId required:(BOOL)required;

///---------------------------------------------------------------------------------------
/// @name Row configuration
///---------------------------------------------------------------------------------------

/**
 @abstract The date picker mode to use on the `UIDatePicker`
 */
@property (nonatomic, assign) UIDatePickerMode datePickerMode;

/**
 @abstract The earliest allowed date on the `UIDatePicker`
 */
@property (nonatomic, strong) NSDate * _Nullable minimumDate;

/**
 @abstract The latest allowed date on the `UIDatePicker`
 */
@property (nonatomic, strong) NSDate * _Nullable maximumDate;

/**
 @abstract The handler for when the user is done selecting a date
 */
@property (nonatomic, copy) void (^_Nullable doneHandler)(NSDate  * _Nullable date);

@end
