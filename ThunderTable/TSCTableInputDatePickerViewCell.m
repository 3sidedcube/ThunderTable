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

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.dateFormatter = [[NSDateFormatter alloc] init];
        
        self.dateLabel = [[UITextField alloc] init];
        self.dateLabel.textAlignment = NSTextAlignmentRight;
        self.dateLabel.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.dateLabel];
        
        self.datePicker = [[UIDatePicker alloc] init];
        [self.datePicker addTarget:self action:@selector(handleDatePicker:) forControlEvents:UIControlEventValueChanged];
        
        [self.dateLabel setInputView:self.datePicker];

    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.dateLabel.frame = CGRectMake(self.contentView.frame.size.width - 180 - 10, 10, 180, 20);
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
    
    self.dateLabel.text = [self.dateFormatter stringFromDate:inputRow.value];
    self.datePicker.datePickerMode = datePickerRow.datePickerMode;
}

- (void)handleDatePicker:(UIDatePicker *)sender
{
    self.dateLabel.text = [self.dateFormatter stringFromDate:sender.date];
    self.inputRow.value = sender.date;
}


@end
