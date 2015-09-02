//
//  TSCTableInputPickerViewCell.m
// ThunderTable
//
//  Created by Phillip Caudell on 27/09/2013.
//  Copyright (c) 2013 3 SIDED CUBE. All rights reserved.
//

#import "TSCTableInputPickerViewCell.h"
#import "TSCTableInputPickerRow.h"
#import "TSCTableInputDatePickerRow.h"
#import "TSCPickerComponentDataSource.h"
#import "TSCPickerRowDataSource.h"
#import "TSCPickerRow.h"
#import "TSCThemeManager.h"

@implementation TSCTableInputPickerViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.selectionLabel = [[UITextField alloc] init];
        self.selectionLabel.textAlignment = NSTextAlignmentRight;
        self.selectionLabel.backgroundColor = [UIColor clearColor];
        self.selectionLabel.text = nil;
        self.selectionLabel.textColor = [[TSCThemeManager sharedTheme] cellTitleColor];
        self.selectionLabel.font = [[TSCThemeManager sharedTheme] fontOfSize:17];
        [self.contentView addSubview:self.selectionLabel];
        
        self.pickerView = [[UIPickerView alloc] init];
        self.pickerView.dataSource = self;
        self.pickerView.delegate = self;
        
        [self.selectionLabel setInputView:self.pickerView];
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.selectionLabel.frame = CGRectMake(self.contentView.frame.size.width - 180 - 10, 10, 180, 35);
    self.selectionLabel.center = CGPointMake(self.selectionLabel.center.x, self.contentView.center.y);
    
    if (self.inputRow.value != [NSNull null]) {
        self.selectionLabel.text = [self stringValueWithComponents:self.inputRow.value];
    }
    
    if (self.detailTextColor) {
        self.selectionLabel.textColor = self.detailTextColor;
    }
}

- (void)setInputRow:(TSCTableInputRow *)inputRow
{
    [super setInputRow:inputRow];
    
    if ([inputRow.value isKindOfClass:[NSString class]]) {
        self.selectionLabel.text = inputRow.value;
    } else {
        self.selectionLabel.text = nil;
    }
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated
{
    [super setEditing:editing animated:animated];
    
    if (editing) {
        self.selectionLabel.textColor = [[TSCThemeManager sharedTheme] cellTitleColor];
        
    } else {
        self.selectionLabel.textColor = [[TSCThemeManager sharedTheme] primaryLabelColor];
    }
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return self.components.count;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    id <TSCPickerComponentDataSource> componentObject = self.components[component];
    
    return [[componentObject componentItems] count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    id <TSCPickerComponentDataSource> componentObject = self.components[component];
    id <TSCPickerRowDataSource> rowObject = [componentObject componentItems][row];
    
    return [rowObject rowTitle];
    
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.selectionLabel.text = [self stringValueWithComponents:self.components];
    self.inputRow.value = [self rowValues];
    
}

- (NSString *)stringValueWithComponents:(NSArray *)components
{
    __block NSString *returnedString = @"";
    __block NSMutableArray *rowValues = [NSMutableArray new];
    [components enumerateObjectsUsingBlock:^(id <TSCPickerComponentDataSource> componentObject, NSUInteger idx, BOOL *stop) {
        
        NSInteger selectedRow = [self.pickerView selectedRowInComponent:idx];
        
        id <TSCPickerRowDataSource> rowObject;
        
        if ([componentObject conformsToProtocol:@protocol(TSCPickerRowDataSource)]) {
            
            rowObject = (TSCPickerRow *)componentObject;
            componentObject = self.components[idx];
        } else {
            rowObject = [componentObject componentItems][selectedRow];
        }
        
        [rowValues addObject:rowObject];
        
        returnedString = [returnedString stringByAppendingString:[rowObject rowTitle]];
        
        if ([componentObject respondsToSelector:@selector(componentSpacer)]){
            
            if ([componentObject componentSpacer]){
                returnedString = [returnedString stringByAppendingString:[componentObject componentSpacer]];
            }
        }
        
    }];
    
    return returnedString;
}

- (NSArray *)rowValues
{
    __block NSMutableArray *rowValues = [NSMutableArray new];
    [self.components enumerateObjectsUsingBlock:^(id <TSCPickerComponentDataSource> componentObject, NSUInteger idx, BOOL *stop) {
        
        NSInteger selectedRow = [self.pickerView selectedRowInComponent:idx];
        id <TSCPickerRowDataSource> rowObject = [componentObject componentItems][selectedRow];
        [rowValues addObject:rowObject];
    }];
    
    return rowValues;
}

@end
