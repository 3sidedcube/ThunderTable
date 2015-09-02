//
//  TSCTableInputPickerViewCell.h
// ThunderTable
//
//  Created by Phillip Caudell on 27/09/2013.
//  Copyright (c) 2013 3 SIDED CUBE. All rights reserved.
//

#import "TSCTableInputViewCell.h"

/**
 A cell containing a right-aligned `UITextField` which displays a `UIPickerView` upon becoming first responder in place of a keyboard
 */
@interface TSCTableInputPickerViewCell : TSCTableInputViewCell <UIPickerViewDataSource, UIPickerViewDelegate>

/**
 @abstract The text field which displays the current selected item
 */
@property (nonatomic, strong) UITextField *selectionLabel;

/**
 @abstract The picker which is shown when the text field becomes the first responder
 */
@property (nonatomic, strong) UIPickerView *pickerView;

/**
 @abstract The picker components which will be shown in the `UIPickerView`
*/
@property (nonatomic, strong) NSArray *components;

/**
 @abstract The colour of the detail label for the cell
*/
@property (nonatomic, strong) UIColor *detailTextColor;

/**
 @abstract The array of NSStrings which are displayed in `pickerView`
 */
@property (nonatomic, strong) NSArray *values;

/**
 @abstract The placeholder for the `UIPickerView`
 @discussion If non-nil this will be displayed as the first item in `pickerView` surrounded by --- <placeholder> ---
 */
@property (nonatomic, copy) NSString *placeholder;

@end