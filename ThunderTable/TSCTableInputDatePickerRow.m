//
//  TSCTableInputDatePickerRow.m
// ThunderTable
//
//  Created by Phillip Caudell on 26/09/2013.
//  Copyright (c) 2013 3 SIDED CUBE. All rights reserved.
//

#import "TSCTableInputDatePickerRow.h"
#import "TSCTableInputDatePickerViewCell.h"

@implementation TSCTableInputDatePickerRow

+ (instancetype)rowWithTitle:(NSString *)title mode:(UIDatePickerMode)mode inputId:(NSString *)inputId required:(BOOL)required
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

- (TSCTableInputDatePickerViewCell *)tableViewCell:(TSCTableInputDatePickerViewCell *)cell
{
    cell = (TSCTableInputDatePickerViewCell *)[super tableViewCell:cell];
    
    cell.datePicker.minimumDate = self.minimumDate;
    cell.datePicker.maximumDate = self.maximumDate;
    
    [self updateTargetsAndActionsForControl:cell.datePicker];
    [cell.datePicker addTarget:cell action:@selector(handleDatePicker:) forControlEvents:UIControlEventValueChanged];
    
    [cell setDoneHandler:^(TSCTableInputDatePickerViewCell *pickerCell) {
       
        if (self.doneHandler) {
            self.doneHandler(self.value);
        }
        
    }];
    
    return cell;
}

@end