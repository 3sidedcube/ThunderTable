//
//  TSCTableInputTextFieldViewCell.m
// ThunderTable
//
//  Created by Phillip Caudell on 20/08/2013.
//  Copyright (c) 2013 madebyphill.co.uk. All rights reserved.
//

#import "TSCTableInputTextFieldViewCell.h"
#import "TSCTableInputRow.h"
#import "TSCThemeManager.h"

@implementation TSCTableInputTextFieldViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.textField = [[UITextField alloc] init];
        self.textField.textAlignment = NSTextAlignmentRight;
        self.textField.delegate = self;
        self.textField.autocapitalizationType = UITextAutocapitalizationTypeSentences;
        self.textField.autocorrectionType = UITextAutocorrectionTypeYes;
        self.textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    
        [self.contentView addSubview:self.textField];
        self.textField.returnKeyType = UIReturnKeyNext;
        
        [self setEditing:NO animated:NO];
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (!self.textLabel.text) {
        
        self.textField.textAlignment = NSTextAlignmentLeft;
        self.textField.frame = CGRectMake(MAX(10,CGRectGetMaxX(self.imageView.frame) + 15), 10, self.contentView.bounds.size.width - 10 - MAX(10,CGRectGetMaxX(self.imageView.frame) + 15), 24);
        self.textField.center = CGPointMake(self.textField.center.x, self.frame.size.height/2 + 1);
        
    } else {
        
        self.textField.textAlignment = NSTextAlignmentRight;
        self.textField.frame = CGRectMake(self.textLabel.bounds.size.width + 20, 10, self.contentView.bounds.size.width - self.textLabel.bounds.size.width - 30, 24);
        self.textField.center = CGPointMake(self.textField.center.x, self.textLabel.center.y);
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    textField.text = [textField.text stringByReplacingCharactersInRange:range withString:string];
    textField.text = [textField.text stringByReplacingOccurrencesOfString:@" " withString:@"\u00a0"];
    
    self.inputRow.value = [textField.text stringByReplacingOccurrencesOfString:@"\u00a0" withString:@" "];
    
    return NO;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    self.inputRow.value = textField.text;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if ([self.delegate respondsToSelector:@selector(tableInputViewCellDidFinish:)]) {
        [self.delegate tableInputViewCellDidFinish:self];
    }
    
    return YES;
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated
{
    [super setEditing:editing animated:animated];
    self.textField.userInteractionEnabled = editing;
    
    if (!editing) {
        [self resignKeyboard];
    }
}

#pragma mark - Navigation handling

- (void)resignKeyboard
{
    [self.textField resignFirstResponder];
}

@end
