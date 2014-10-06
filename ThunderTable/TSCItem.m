//
//  TSCItem.m
//  ThunderTable
//
//  Created by Phillip Caudell on 10/06/2014.
//  Copyright (c) 2014 3 SIDED CUBE. All rights reserved.
//

#import "TSCItem.h"

@implementation TSCItem

+ (instancetype)itemWithTitle:(NSString *)title
{
    TSCItem *item = [TSCItem new];
    item.title = title;
    
    return item;
}

+ (instancetype)itemWithTitle:(NSString *)title subtitle:(NSString *)subtitle handler:(TSCItemHandler)handler
{
    TSCItem *item = [TSCItem new];
    item.title = title;
    item.subtitle = subtitle;
    item.handler = handler;
    
    return item;
}

#pragma mark Row data source

- (NSString *)rowTitle
{
    return self.title;
}

- (NSString *)rowSubtitle
{
    return self.subtitle;
}

- (UITableViewCellAccessoryType)rowAccessoryType
{
    if (self.selected) {
        return UITableViewCellAccessoryCheckmark;
    } else {
        return UITableViewCellAccessoryNone;
    }
}

- (BOOL)shouldDisplaySelectionIndicator
{
    return NO;
}

@end
