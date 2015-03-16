//
//  TSCTableInputPickerRow.h
// ThunderTable
//
//  Created by Phillip Caudell on 26/09/2013.
//  Copyright (c) 2013 3 SIDED CUBE. All rights reserved.
//

#import "TSCTableInputRow.h"

/**
 A row which provides the user with a single column `UIPickerView` for selecting from a list of `NSString` values
 */
@interface TSCTableInputPickerRow : TSCTableInputRow

///---------------------------------------------------------------------------------------
/// @name Initialization Methods
///---------------------------------------------------------------------------------------

/**
 Initializes the row with a title and array of values
 @param title Title to show on the row
 @param inputId Key to save the value of the `UIPickerView` under
 @param values An array of NSStrings to be shown within the `UIPickerView`
 @param required Whether or not a value is required for this row
 */
+ (instancetype)rowWithTitle:(NSString *)title inputId:(NSString *)inputId values:(NSArray *)values required:(BOOL)required;

///---------------------------------------------------------------------------------------
/// @name Row configuration
///---------------------------------------------------------------------------------------

/**
 The array of NSStrings to be shown within the `UIPickerView`
 */
@property (nonatomic, strong) NSArray *values;

/**
 A placeholder string which will be shown as the first item in the `UIPickerView` if given
 */
@property (nonatomic, copy) NSString *placeholder;

@end