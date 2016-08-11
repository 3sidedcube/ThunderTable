//
//  TSCTableInputPickerViewCell.m
// ThunderTable
//
//  Created by Phillip Caudell on 26/09/2013.
//  Copyright (c) 2013 3 SIDED CUBE. All rights reserved.
//

#import "TSCTableInputDatePickerViewCell.h"
#import "TSCTableInputDatePickerRow.h"
#import "TSCThemeManager.h"

@interface TSCTableInputDatePickerViewCell ()

@end

@implementation TSCTableInputDatePickerViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.dateFormatter = [[NSDateFormatter alloc] init];
        
        self.dateLabel = [[UITextField alloc] init];
        self.dateLabel.textAlignment = NSTextAlignmentRight;
        self.dateLabel.backgroundColor = [UIColor clearColor];
        self.dateLabel.textColor = [[TSCThemeManager sharedTheme] cellTitleColor];
        self.dateLabel.font = [[TSCThemeManager sharedTheme] fontOfSize:17];
        [self.contentView addSubview:self.dateLabel];
        
        self.datePicker = [[UIDatePicker alloc] init];
        
        UIToolbar *doneToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
        doneToolbar.items = @[
                              [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:NULL],
                              [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(handleDone:)]];
        [doneToolbar sizeToFit];
        
        self.dateLabel.inputAccessoryView = doneToolbar;
        
        [self.dateLabel setInputView:self.datePicker];
    }
    
    return self;
}

- (void)handleDone:(UINavigationItem *)sender
{
    [self.dateLabel resignFirstResponder];
    [self handleDatePicker:self.datePicker];
    if (self.doneHandler) {
        self.doneHandler(self);
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.dateLabel.frame = CGRectMake(self.contentView.frame.size.width - 180 - 10, 10, 180, 20);
    self.dateLabel.adjustsFontSizeToFitWidth = YES;
    self.dateLabel.center = CGPointMake(self.dateLabel.center.x, self.cellTextLabel.center.y);
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated
{
    [super setEditing:editing animated:animated];
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
}

@end
