//
//  TSCTableInputPickerRow.m
// ThunderTable
//
//  Created by Phillip Caudell on 26/09/2013.
//  Copyright (c) 2013 3 SIDED CUBE. All rights reserved.
//

#import "TSCTableInputPickerRow.h"
#import "TSCTableInputPickerViewCell.h"
#import "TSCPickerRow.h"
#import "TSCPickerComponent.h"
#import "TSCThemeManager.h"

@interface TSCTableInputPickerRow ()

@property (nonatomic, strong) TSCTableInputPickerViewCell *cell;

@end

@implementation TSCTableInputPickerRow

+ (instancetype)rowWithTitle:(NSString *)title inputId:(NSString *)inputId values:(NSArray *)values required:(BOOL)required
{
    TSCTableInputPickerRow *row = [[TSCTableInputPickerRow alloc] init];
    row.title = title;
    row.inputId = inputId;
    
    NSMutableArray *rows = [NSMutableArray new];
    for (NSString *value in values) {
        
        TSCPickerRow *row = [TSCPickerRow rowWithTitle:value];
        [rows addObject:row];
    }
    
    TSCPickerComponent *component = [TSCPickerComponent componentWithItems:rows];
    row.components = @[component];
    row.required = required;
    
    return row;
}

+ (id)rowWithTitle:(NSString *)title inputId:(NSString *)inputId components:(NSArray *)components required:(BOOL)required
{
    TSCTableInputPickerRow *row = [[TSCTableInputPickerRow alloc] init];
    row.title = title;
    row.inputId = inputId;
    row.components = components;
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
    self.cell = pickerCell;
    pickerCell.inputRow = self;
    pickerCell.components = self.components;
    pickerCell.placeholder = self.placeholder;
    if (self.enabled) {
        pickerCell.selectionLabel.textColor = self.detailTextColor ? : [[TSCThemeManager sharedTheme] cellDetailColor];
    } else {
        pickerCell.selectionLabel.textColor = self.detailTextColor ? : [[TSCThemeManager sharedTheme] disabledCellTextColor];
    }

    return pickerCell;
}

- (void)setValue:(id)value
{
    if ([value isKindOfClass:[NSString class]]) {
        [super setValue:@[[TSCPickerRow rowWithTitle:value]]];
    } else {
        [super setValue:value];
    }
}

@end