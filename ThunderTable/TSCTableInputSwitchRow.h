//
//  TSCTableInputSwitchRow.h
// ThunderTable
//
//  Created by Phillip Caudell on 27/08/2013.
//  Copyright (c) 2013 madebyphill.co.uk. All rights reserved.
//

#import "TSCTableInputRow.h"

@class TSCTableInputSwitchRow;

/**
 Provides a delegate for the input switch row changing value
 */
@protocol TSCTableInputSwitchRowDelegate <NSObject>

/**
 This method will be called when the state (on/off) of the `UISwitch` changes
 @param row The row in which the switch changed value
 @param newState The state (on/off) which the switch changed to
 */
- (void)inputSwitchRow:(TSCTableInputSwitchRow *)row didChangeToState:(BOOL)newState;

@end

/**
 A row which displays with a title and `UISwitch`
 */
@interface TSCTableInputSwitchRow : TSCTableInputRow <TSCTableRowDataSource>

///---------------------------------------------------------------------------------------
/// @name Initialization Methods
///---------------------------------------------------------------------------------------

/**
 Initializes the row with a title
 @param title The title to display on the row
 @param inputId The key to save the value of the `UITextView` under
 @param required Whether or not a value is required for this row
 */
+ (instancetype)rowWithTitle:(NSString *)title inputId:(NSString *)inputId required:(BOOL)required;

/**
 Initializes the row with a title
 @param title The title to display on the row
 @param image The image to be displayed on the row
 @param inputId The key to save the value of the `UITextView` under
 @param required Whether or not a value is required for this row
 */
+ (instancetype)rowWithTitle:(NSString *)title image:(UIImage *)image inputId:(NSString *)inputId required:(BOOL)required;

///---------------------------------------------------------------------------------------
/// @name Row configuration
///---------------------------------------------------------------------------------------

/**
 @abstract Whether the switch on the cell is on or off, set this to change the switch state
 */
@property (nonatomic, assign, getter = isOn) BOOL on;

/**
 @abstract The delegate which will be notified of changes to the `UISwitch` state
 */
@property (nonatomic, weak) id <TSCTableInputSwitchRowDelegate> delegate;


@end
