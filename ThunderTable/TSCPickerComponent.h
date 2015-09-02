//
//  TSCPickerComponent.h
//  ThunderTable
//
//  Created by Joel Trew on 03/06/2015.
//  Copyright (c) 2015 3 SIDED CUBE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSCPickerComponentDataSource.h"

/**
 A Picker Component is used to represent the data one column in a `TSCPicker` by conforming to `TSCPickerComponentDataSource`
 */
@interface TSCPickerComponent : NSObject <TSCPickerComponentDataSource>

/**
 An array of `TSCPickerRow` objects which will be shown in the column of the picker
 */
@property (nonatomic, strong) NSArray *items;

/**
 A spacer to be used between this column and the next
 @discussion This will be used in the detail text of the `TSCTableInputPickerRow` as a text separator between the current values of each column in the `UIPicker`
 */
@property (nonatomic, copy) NSString *spacer;

/**
 Creates a new instance using an array of `TSCPickerRow` objects
 @param items The `TSCPickerRow` items to be shown in the component
 */
+ (instancetype)componentWithItems:(NSArray *)items;

/**
 Creates a new instance using an array of `TSCPickerRow` objects and a custom spacer
 @param items The `TSCPickerRow` items to be shown in the component
 @param spacer The spacer to be used after this component
 */
+ (instancetype)componentWithItems:(NSArray *)items spacer:(NSString *)spacer;

/**
 Creates a new instance using bounds and an increment
 @param minValue The minimum value to be included in the component
 @param maxValue The maximum value to be included in the component
 @param increment The increment between successive values in the component
 */
+ (instancetype)componentWithMinimumValue:(NSNumber *)minValue maxValue:(NSNumber *)maxValue increment:(NSNumber *)increment;

@end
