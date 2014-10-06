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
 An item to be displayed in a TSCItemPickerController list.
 */
@interface TSCItem : NSObject <TSCTableRowDataSource>

typedef void (^TSCItemHandler)(TSCItem *item);

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *subtitle;
@property (nonatomic, assign, getter = isEnabled) BOOL enabled;
@property (nonatomic, assign, getter = isSelected) BOOL selected;
@property (nonatomic, strong) TSCItemHandler handler;

/**
 Creates a new TSCItem with a title
 @param title The title for the item.
 */
+ (instancetype)itemWithTitle:(NSString *)title;

/**
 Creates a new TSCItem with a title, subtitle and handler
 @param title The title for the item.
 @param subtitle The subtitle for the item
 @param handler The block to be fired when selected
 */
+ (instancetype)itemWithTitle:(NSString *)title subtitle:(NSString *)subtitle handler:(TSCItemHandler)handler;

@end
