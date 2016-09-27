//
//  TSCPickerRow.h
//  ThunderTable
//
//  Created by Joel Trew on 03/06/2015.
//  Copyright (c) 2015 3 SIDED CUBE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSCPickerRowDataSource.h"

/**
 A simple object implement `<TSCPickerRowDataSource>` for displaying in a `TSCPickerComponent`
 */
@interface TSCPickerRow : NSObject<TSCPickerRowDataSource>

/**
 The title to be shown on the row
 */
@property (nonatomic, copy, nullable) NSString * title;

/**
 Initialises and returns a new instance with a given title
 @param title The title to display on the row
 */
+ (nonnull instancetype)rowWithTitle:(nullable NSString *)title;

@end
