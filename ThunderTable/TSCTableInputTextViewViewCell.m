//
//  TSCTableInputTextViewViewCell.m
// ThunderTable
//
//  Created by Matt Cheetham on 17/09/2013.
//  Copyright (c) 2013 3 SIDED CUBE. All rights reserved.
//

#import "TSCTableInputTextViewViewCell.h"
#import "TSCTableInputRow.h"
#import "GCPlaceholderTextView.h"
#import "TSCThemeManager.h"

@implementation TSCTableInputTextViewViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.textView = [[GCPlaceholderTextView alloc] init];
        self.textView.textColor = [[TSCThemeManager sharedTheme] cellTitleColor];
        self.textView.textAlignment = NSTextAlignmentLeft;
        self.textView.delegate = self;
        self.textView.placeholderColor = [[TSCThemeManager sharedTheme] cellDetailColor];

        [self.contentView addSubview:self.textView];
        
        [self setEditing:false animated:false];
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.textView.font = [[TSCThemeManager sharedTheme] fontOfSize:17];
    
    if (!self.cellTextLabel.text) {
        self.textView.frame = CGRectMake(12, 0, self.contentView.bounds.size.width - 24, self.contentView.bounds.size.height);
    } else {
        
        CGSize textSize = [self.cellTextLabel sizeThatFits:CGSizeMake(self.contentView.bounds.size.width - (self.cellTextLabel.frame.origin.x * 2), MAXFLOAT)];
        self.cellTextLabel.frame = CGRectMake(self.cellTextLabel.frame.origin.x, 12, self.contentView.bounds.size.width - (self.cellTextLabel.frame.origin.x * 2), textSize.height);
        self.textView.frame = CGRectMake(12, CGRectGetMaxY(self.cellTextLabel.frame) + 6, self.contentView.bounds.size.width - 24, self.contentView.bounds.size.height - (CGRectGetMaxY(self.cellTextLabel.frame) + 6));
    }
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    if ([self.inputRow respondsToSelector:@selector(setValue:sender:)]) {
        [self.inputRow setValue:textView.text sender:textView];
    } else {
        self.inputRow.value = textView.text;
    }
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    return YES;
}

- (void)textViewDidChange:(UITextView *)textView
{
    if ([self.inputRow respondsToSelector:@selector(setValue:sender:)]) {
        [self.inputRow setValue:textView.text sender:textView];
    } else {
        self.inputRow.value = textView.text;
    }
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated
{
    [super setEditing:editing animated:animated];
    
    if (!editing) {
        [self resignKeyboard];
    }
}

- (void)setEditable:(BOOL)editable
{
    [super setEditable:editable];
    self.textView.userInteractionEnabled = editable;
}

#pragma mark - Navigation handling

- (void)resignKeyboard
{
    [self.textView resignFirstResponder];
}

#pragma mark - Setter methods

- (void)setPlaceholder:(NSString *)placeholder
{
    _placeholder = placeholder;
    self.textView.placeholder = self.placeholder;
}

@end
