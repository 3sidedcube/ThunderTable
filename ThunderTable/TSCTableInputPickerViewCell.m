//
//  TSCTableInputPickerViewCell.m
//  ThunderStorm
//
//  Created by Phillip Caudell on 27/09/2013.
//  Copyright (c) 2013 3 SIDED CUBE. All rights reserved.
//

#import "TSCTableInputPickerViewCell.h"
#import "TSCTableInputPickerRow.h"
#import "TSCTableInputDatePickerRow.h"
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
        self.selectionLabel.text = self.inputRow.value;
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
        self.selectionLabel.textColor = [[TSCThemeManager sharedTheme] mainColor];
        
    } else {
        self.selectionLabel.textColor = [[TSCThemeManager sharedTheme] primaryLabelColor];
    }
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.values.count + 1;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (row == 0) {
        if (self.placeholder) {
            return [NSString stringWithFormat:@"-- %@ --", self.placeholder];
        }
        
        return @"-- Please Select --";
    }
    
    return self.values[row - 1];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (row != 0) {
        self.selectionLabel.text = self.values[row - 1];
        self.inputRow.value = self.values[row - 1];
    }
}

@end