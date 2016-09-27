//
//  TSCPickerComponentDataSource.h
//  ThunderTable
//
//  Created by Joel Trew on 03/06/2015.
//  Copyright (c) 2015 3 SIDED CUBE. All rights reserved.
//

#import "TSCPickerRowDataSource.h"

/**
 A protocol which enables an object to be shown as a column in the `UIPicker` of a `TSCTableInputPickerRow`
 */
@protocol TSCPickerComponentDataSource <NSObject>

/**
 An array of `<TSCPickerRowDataSource>` objects to be displayed in the component
 */
- (NSArray<id<TSCPickerRowDataSource>> *)componentItems;

@optional

/**
 A spacer to be used between this column and the next
 @discussion This will be used in the detail text of the `TSCTableInputPickerRow` as a text separator between the current values of each column in the `UIPicker`
 */
- (NSString *)componentSpacer;

@end
