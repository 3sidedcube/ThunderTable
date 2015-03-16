//
//  TSCTableInputTextViewViewCell.m
//  ThunderStorm
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
        self.textView.textAlignment = NSTextAlignmentRight;
        self.textView.delegate = self;
        self.textView.textColor = [UIColor blackColor];
        self.textView.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
        self.textView.returnKeyType = UIReturnKeyNext;

        [self.contentView addSubview:self.textView];
        
        [self setEditing:NO animated:NO];
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (!self.textLabel.text) {
        self.textView.textAlignment = NSTextAlignmentLeft;
        self.textView.frame = CGRectMake(10, 0, self.contentView.bounds.size.width - 20, self.contentView.bounds.size.height);
    } else {
        self.textView.textAlignment = NSTextAlignmentRight;
        self.textView.frame = CGRectMake(self.textLabel.bounds.size.width + 20, 0, self.contentView.bounds.size.width - self.textLabel.bounds.size.width - 30, self.contentView.bounds.size.height);
    }
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    self.inputRow.value = textView.text;
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    return YES;
}

- (void)textViewDidChange:(UITextView *)textView
{
    if (self.textView.text.length == 0) {
        [self.textView resignFirstResponder];
    } else {
        self.inputRow.value = textView.text;
    }
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated
{
    [super setEditing:editing animated:animated];
    self.textView.userInteractionEnabled = editing;
    
    if (!editing) {
        [self resignKeyboard];
    }
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
