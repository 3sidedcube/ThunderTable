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

- (void)dealloc
{
    [self removeObserver:self forKeyPath:@"inputRow.value"];
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionLabel = [[UILabel alloc] init];
        self.selectionLabel.textAlignment = NSTextAlignmentRight;
        self.selectionLabel.backgroundColor = [UIColor clearColor];
        self.selectionLabel.text = nil;
        [self.contentView addSubview:self.selectionLabel];
        
        [self addObserver:self forKeyPath:@"inputRow.value" options:kNilOptions context:nil];
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.selectionLabel.frame = CGRectMake(self.contentView.frame.size.width - 180 - 10, 10, 180, 20);
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

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"inputRow.value"]) {
        if (self.inputRow.value != [NSNull null]) {
            self.selectionLabel.text = self.inputRow.value;
        }
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

@end

@implementation _TSCTableInputPickerControlViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.pickerView = [[UIPickerView alloc] init];
        self.pickerView.delegate = self;
        self.pickerView.dataSource = self;
        [self.contentView addSubview:self.pickerView];
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.pickerView.frame = self.contentView.bounds;
}

- (void)setInputRow:(_TSCTableInputPickerControlRow *)inputRow
{
    [super setInputRow:inputRow];
    self.values = inputRow.parentRow.values;
    [self.pickerView reloadAllComponents];
    
    NSInteger selectedIndex = [inputRow.parentRow.values indexOfObject:inputRow.parentRow.value];
    
    if (selectedIndex == NSNotFound) {
        selectedIndex = 0;
        inputRow.parentRow.value = self.values[0];
    }
    
    [self.pickerView selectRow:selectedIndex inComponent:0 animated:NO];
}

#pragma mark Picker view data source

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.values.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return self.values[row];
}

#pragma mark Picker view delegate

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    _TSCTableInputDatePickerControlRow *pickerRow = (_TSCTableInputDatePickerControlRow *)self.inputRow;
    pickerRow.parentRow.value = self.values[row];
}

@end