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
 `TSCTableInputRow` should be subclassed to provide table rows for data input.
 @discussion A variety of default subclasses are provided by default in ThunderTable
 */
@interface TSCTableInputRow : TSCTableRow <TSCTableInputRowDataSource>

/**
 @abstract The current value of the input row
 @discussion This is set by user input on the row, whether it be a `UITextField` or `UIDatePicker` item e.t.c.
 */
@property (nonatomic, strong) id _Nullable value;

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
@property (nonatomic, copy) NSString  * _Nonnull inputId;

/**
 @abstract Adds a target and selector for different control events
 @param target The target to alert of control events
 @param action The selector to call on the target
 @param controlEvents The control events to alert the target of
 */
- (void)addTarget:(nullable id)target action:(nonnull SEL)action forControlEvents:(UIControlEvents)controlEvents;

/**
 @abstract Removes a target and selector for different control events
 @param target The target to disable alerting of control events
 @param action The selector to call on the target
 @param controlEvents The control events to disable alerting the target of
 */
- (void)removeTarget:(nullable id)target action:(nullable SEL)action forControlEvents:(UIControlEvents)controlEvents;

/**
 @abstract Returns an array of targets for different control events
 @param events The control events to return targets for
 */
- (NSArray <id> * _Nullable )targetsForControlEvents:(UIControlEvents)events;

/**
 @abstract Returns an array of selector strings for different control events
 @param events The control events to return selector strings
 */
- (NSArray <NSString *> * _Nullable)actionStringsForControlEvents:(UIControlEvents)events;

/**
 @abstract Removes and adds any new targets and selectors to the control which determines the value of the row
 @param control The control to set the target and actions on
 */
- (void)updateTargetsAndActionsForControl:(nullable UIControl *)control;

@end
