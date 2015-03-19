//
//  TSCItem.h
//  ThunderTable
//
//  Created by Phillip Caudell on 10/06/2014.
//  Copyright (c) 2014 3 SIDED CUBE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSCTableRowDataSource.h"

/**
 An item to be displayed in a `TSCItemPickerController` list.
 */
@interface TSCItem : NSObject <TSCTableRowDataSource>

/**
 A block which is called when a `TSCItem` is selected, passes in the selected item.
 */
typedef void (^TSCItemHandler)(TSCItem *item);

/**
 Initializes a new `TSCItem` with a title
 @param title The title for the item.
 */
+ (instancetype)itemWithTitle:(NSString *)title;

/**
 Initializes a new `TSCItem` with a title, subtitle and handler
 @param title The title for the item.
 @param subtitle The subtitle for the item.
 @param handler The block to be fired when selected.
 */
+ (instancetype)itemWithTitle:(NSString *)title subtitle:(NSString *)subtitle handler:(TSCItemHandler)handler;

/**
 @abstract The title of the item
 */
@property (nonatomic, copy) NSString *title;

/**
 @abstract The subtitle of the item
 */
@property (nonatomic, copy) NSString *subtitle;

/**
 @abstract Determines whether or not the item can be selected by the user
 */
@property (nonatomic, assign, getter = isEnabled) BOOL enabled;

/**
 @abstract Determines whether or not the item has been selected by the user
 */
@property (nonatomic, assign, getter = isSelected) BOOL selected;

/**
 @abstract A block which is called when the item has been selected
 */
@property (nonatomic, strong) TSCItemHandler handler;

@end
