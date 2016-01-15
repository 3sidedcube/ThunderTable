//
//  TSCTableInputRowDataSource.h
//  ThunderTable
//
//  Created by Matt Cheetham on 03/04/2014.
//  Copyright (c) 2014 3 SIDED CUBE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSCTableRowDataSource.h"

/**
 All input row objects that can be displayed in a `TSCTableViewController` must conform to the `TSCTableInputRowDataSource` protocol. This protocol is required to access the input values of the row.
 */
@protocol TSCTableInputRowDataSource <TSCTableRowDataSource>

///---------------------------------------------------------------------------------------
/// @name General setup
///---------------------------------------------------------------------------------------

/**
 @abstract The unique id of the input row. Required for extracting a value
 */
- (NSString *)inputId;

/**
 @abstract The value of the input row
 */
- (id)value;

/**
 @abstract If the input row needs to have a value entered
 */
- (BOOL)required;

/**
 @abstract Sets the value of the input row
 @param value The value to set on the row
 */
- (void)setValue:(id)value;

@optional

/**
 @abstract Sets the value on the row with an optional sender
 @param value The new value for the row
 @param sender The sender that changed the value
 */
- (void)setValue:(id)value sender:(id)sender;

@end
