//
//  TSCTableInputDatePickerRow.m
//  ThunderStorm
//
//  Created by Phillip Caudell on 26/09/2013.
//  Copyright (c) 2013 3 SIDED CUBE. All rights reserved.
//

#import "TSCTableInputDatePickerRow.h"
#import "TSCTableInputDatePickerViewCell.h"

@implementation TSCTableInputDatePickerRow

+ (id)rowWithTitle:(NSString *)title mode:(UIDatePickerMode)mode inputId:(NSString *)inputId required:(BOOL)required
{
    TSCTableInputDatePickerRow *row = [[TSCTableInputDatePickerRow alloc] init];
    row.title = title;
    row.inputId = inputId;
    row.required = required;
    row.datePickerMode = mode;
    
    return row;
}

- (NSString *)rowTitle
{
    return self.title;
}

- (Class)tableViewCellClass
{
    return [TSCTableInputDatePickerViewCell class];
}

- (CGFloat)tableViewCellHeightConstrainedToSize:(CGSize)contrainedSize
{
    return 44;
}

@end

@implementation _TSCTableInputDatePickerControlRow

+ (id)rowWithParentRow:(TSCTableInputDatePickerRow *)parentRow
{
    _TSCTableInputDatePickerControlRow  *row = [[_TSCTableInputDatePickerControlRow alloc] init];
    row.parentRow = parentRow;
    
    return row;
}

- (Class)tableViewCellClass
{
    return [_TSCTableInputDatePickerControlViewCell class];
}

- (CGFloat)tableViewCellHeightConstrainedToSize:(CGSize)contrainedSize
{
    return 180;
}

@end