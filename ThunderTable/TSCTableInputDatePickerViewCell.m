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
    UIEdgeInsets edgeInsets = [self edgeInsets];
    
    CGSize textLabelSize = [self.cellTextLabel sizeThatFits:CGSizeMake(self.contentView.frame.size.width - edgeInsets.left - edgeInsets.right - 12 - 180, MAXFLOAT)];
    CGRect textLabelFrame = CGRectMake(edgeInsets.left, edgeInsets.top, textLabelSize.width, textLabelSize.height);
    NSInteger textNumberOfLines = MAX((int)(textLabelFrame.size.height/self.cellTextLabel.font.lineHeight),0);
    
    CGRect remainingRect;
    CGRect slice;
    CGRectDivide(self.contentView.frame, &slice, &remainingRect, textLabelSize.width + edgeInsets.right, CGRectMinXEdge);
    
    remainingRect.size.width = remainingRect.size.width - edgeInsets.right;
    CGSize detailLabelSize = [self.cellDetailTextLabel sizeThatFits:CGSizeMake(remainingRect.size.width, MAXFLOAT)];
    remainingRect.size.height = detailLabelSize.height;
    NSInteger detailNumberOfLines = MAX((int)(remainingRect.size.height/self.cellDetailTextLabel.font.lineHeight),0);
    
    if (textNumberOfLines == detailNumberOfLines || !self.detailTextLabel.text) {
        
        textLabelFrame.origin.y = self.contentView.frame.size.height / 2 - textLabelFrame.size.height / 2;
        remainingRect.origin.y = self.contentView.frame.size.height / 2 - remainingRect.size.height / 2;
    }
    
    self.cellTextLabel.frame = CGRectIntegral(textLabelFrame);
    self.cellDetailTextLabel.frame = CGRectIntegral(remainingRect);
    
    self.dateLabel.frame = CGRectMake(CGRectGetMaxX(textLabelFrame) + 12, 10, self.contentView.frame.size.width - CGRectGetMaxX(textLabelFrame) - 24, self.contentView.bounds.size.height - 12);
    self.dateLabel.adjustsFontSizeToFitWidth = YES;
    self.dateLabel.center = CGPointMake(self.dateLabel.center.x, self.cellTextLabel.center.y);
}

- (UIEdgeInsets)edgeInsets
{
    CGFloat leftIndentation = MAX(self.indentationWidth * (CGFloat)self.indentationLevel, 12);
    if (self.cellImageView.image) {
        leftIndentation = CGRectGetMaxX(self.cellImageView.frame) + leftIndentation;
    }
    
    UIEdgeInsets edgeInsets = UIEdgeInsetsMake(8, leftIndentation, 0, 12);
    
    return edgeInsets;
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
    
    if ([self.inputRow respondsToSelector:@selector(setValue:sender:)]) {
        [self.inputRow setValue:sender.date sender:sender];
    } else {
        self.inputRow.value = sender.date;
    }
}

@end
