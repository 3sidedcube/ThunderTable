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

- (UITableViewCell *)tableViewCell:(UITableViewCell *)cell
{
    TSCTableInputPickerViewCell *pickerCell = (TSCTableInputPickerViewCell *)cell;
    pickerCell.inputRow = self;
    pickerCell.values = self.values;
    pickerCell.placeholder = self.placeholder;
    return pickerCell;
}

@end