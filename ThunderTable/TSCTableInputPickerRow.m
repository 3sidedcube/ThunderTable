//
//  TSCTableInputPickerRow.m
//  ThunderStorm
//
//  Created by Phillip Caudell on 26/09/2013.
//  Copyright (c) 2013 3 SIDED CUBE. All rights reserved.
//

#import "TSCTableInputPickerRow.h"
#import "TSCTableInputPickerViewCell.h"

@implementation TSCTableInputPickerRow

+ (id)rowWithTitle:(NSString *)title inputId:(NSString *)inputId values:(NSArray *)values required:(BOOL)required
{
    TSCTableInputPickerRow *row = [[TSCTableInputPickerRow alloc] init];
    row.title = title;
    row.inputId = inputId;
    row.values = values;
    row.required = required;
    
    return row;
}

- (Class)tableViewCellClass
{
    return [TSCTableInputPickerViewCell class];
}

@end

@implementation _TSCTableInputPickerControlRow

+ (id)rowWithParentRow:(TSCTableInputPickerRow *)parentRow
{
    _TSCTableInputPickerControlRow *row = [[_TSCTableInputPickerControlRow alloc] init];
    row.parentRow = parentRow;
    
    return row;
}

- (Class)tableViewCellClass
{
    return [_TSCTableInputPickerControlViewCell class];
}

- (CGFloat)tableViewCellHeightConstrainedToContentViewSize:(CGSize)contentViewSize tableViewSize:(CGSize)tableViewSize
{
    return 162.0;
}

@end