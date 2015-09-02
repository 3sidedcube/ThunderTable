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

/**
 Initializes the row with a title and array of `<TSCPickerComponentDataSource>`s
 @param title Title to show on the row
 @param inputId Key to save the value of the `UIPickerView` under
 @param components An array of `<TSCPickerComponentDataSource>`s to be shown within the `UIPickerView`
 @param required Whether or not a value is required for this row
 */
+ (id)rowWithTitle:(NSString *)title inputId:(NSString *)inputId components:(NSArray *)components required:(BOOL)required;

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

/**
 An array of `<TSCPickerComponentDataSource>` to be shown in the picker view for the cell
 */
@property (nonatomic,strong) NSArray *components;

/**
 Whether or not the cell is enabled
 */
@property (nonatomic) BOOL enabled;

/**
 Determines the colour of the selected picker item text on the cell
 */
@property (nonatomic, strong) UIColor *detailTextColor;

@end