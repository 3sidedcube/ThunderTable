//
//  TSCTableInputPickerViewCell.m
//  ThunderStorm
//
//  Created by Phillip Caudell on 26/09/2013.
//  Copyright (c) 2013 3 SIDED CUBE. All rights reserved.
//

#import "TSCTableInputDatePickerViewCell.h"
#import "TSCTableInputDatePickerRow.h"
#import "TSCThemeManager.h"

@implementation TSCTableInputDatePickerViewCell

- (void)dealloc
{
    [self removeObserver:self forKeyPath:@"inputRow.value"];
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.dateFormatter = [[NSDateFormatter alloc] init];
        
        self.dateLabel = [[UILabel alloc] init];
        self.dateLabel.textAlignment = NSTextAlignmentRight;
        self.dateLabel.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.dateLabel];
        
        [self addObserver:self forKeyPath:@"inputRow.value" options:kNilOptions context:nil];
        
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.dateLabel.frame = CGRectMake(self.contentView.frame.size.width - 180 - 10, 10, 180, 20);
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"inputRow.value"]) {
        self.dateLabel.text = [self.dateFormatter stringFromDate:self.inputRow.value];
    }
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated
{
    [super setEditing:editing animated:animated];
    
    if (editing) {
        self.dateLabel.textColor = [[TSCThemeManager sharedTheme] mainColor];
    } else {
        self.dateLabel.textColor = [[TSCThemeManager sharedTheme] primaryLabelColor];
    }
}

- (void)setInputRow:(TSCTableInputRow *)inputRow
{
    [super setInputRow:inputRow];
    
    TSCTableInputDatePickerRow *datePickerRow = (TSCTableInputDatePickerRow *)inputRow;
    
    if (datePickerRow.datePickerMode == UIDatePickerModeDate) {
        self.dateFormatter.dateStyle = NSDateFormatterLongStyle;
    }
    
    if (datePickerRow.datePickerMode == UIDatePickerModeTime) {
        self.dateFormatter.timeStyle = NSDateFormatterShortStyle;
    }
    
    if (datePickerRow.datePickerMode == UIDatePickerModeDateAndTime) {
        self.dateFormatter.timeStyle = NSDateFormatterShortStyle;
        self.dateFormatter.dateStyle = NSDateFormatterMediumStyle;
    }
    
    if (datePickerRow.datePickerMode == UIDatePickerModeCountDownTimer){
        [self.dateFormatter setDateFormat:@"'Every' HH 'hours' mm 'minutes'"];
    }
}

@end

@implementation _TSCTableInputDatePickerControlViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.datePicker = [[UIDatePicker alloc] init];
        [self.datePicker addTarget:self action:@selector(handleDatePicker:) forControlEvents:UIControlEventValueChanged];
        self.datePicker.minuteInterval = 15;
        [self addSubview:self.datePicker];
        
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.datePicker.frame = self.bounds;
}

- (void)handleDatePicker:(UIDatePicker *)sender
{
    _TSCTableInputDatePickerControlRow *dateRow = (_TSCTableInputDatePickerControlRow *)self.inputRow;
    dateRow.parentRow.value = sender.date;
}

- (void)setInputRow:(_TSCTableInputDatePickerControlRow *)inputRow
{
    [super setInputRow:inputRow];
    
    if ([inputRow.parentRow isKindOfClass:[TSCTableInputDatePickerRow class]]) {
        self.datePicker.datePickerMode = inputRow.parentRow.datePickerMode;
        self.datePicker.minuteInterval = 15;
    }
    _TSCTableInputDatePickerControlRow *dateRow = (_TSCTableInputDatePickerControlRow *)self.inputRow;
    dateRow.parentRow.value = self.datePicker.date;

}

@end