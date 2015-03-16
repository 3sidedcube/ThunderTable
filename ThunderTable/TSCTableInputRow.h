//
//  TSCTableInputRow.h
// ThunderTable
//
//  Created by Phillip Caudell on 20/08/2013.
//  Copyright (c) 2013 madebyphill.co.uk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSCTableRow.h"
#import "TSCTableInputRowDataSource.h"

/**
 TSCTableInputRow should be subclassed to provice table rows for data input.
 @discussion A variety of default subclasses are provided by default in ThunderTable
 */
@interface TSCTableInputRow : TSCTableRow <TSCTableInputRowDataSource>

/**
 @abstract The current value of the input row
 @discussion This is set by user input on the row, whether it be a `UITextField` or `UIDatePicker` item e.t.c.
 */
@property (nonatomic, strong) id value;

/**
 @abstract Whether a value for the row is required before continuing
 @discussion If this is set to true the row will be returned by the `TSCTableViewController` method `-missingRequiredInputRows` if value is nil
 @discussion Similarily it will cause `TSCTableViewController` method `-isMissingRequiredInputRows` to return true if value is nil
 */
@property (nonatomic, assign) BOOL required;

/**
 @abstract The id of the input row value
 @discussion This will determine which key the value is stored under when calling the method `inputDictionary` on `TSCTableViewController`
 */
@property (nonatomic, copy) NSString *inputId;

@end
