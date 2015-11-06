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
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.textField = [[UITextField alloc] init];
        self.textField.textAlignment = NSTextAlignmentRight;
        self.textField.delegate = self;
        self.textField.autocapitalizationType = UITextAutocapitalizationTypeSentences;
        self.textField.autocorrectionType = UITextAutocorrectionTypeYes;
        self.textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        self.textField.textColor = [[TSCThemeManager sharedTheme] cellTitleColor];
        
        self.textField.font = [[TSCThemeManager sharedTheme] fontOfSize:17];
        self.textField.tintColor = [[TSCThemeManager sharedTheme] cellDetailColor];
    
        [self.contentView addSubview:self.textField];
        self.textField.returnKeyType = UIReturnKeyNext;
        
        [self setEditing:false animated:false];
    
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (!self.cellTextLabel.text) {
        
        self.textField.textAlignment = NSTextAlignmentLeft;
        self.textField.frame = CGRectMake(MAX(10,CGRectGetMaxX(self.cellImageView.frame) + 15), 10, self.contentView.bounds.size.width - 10 - MAX(10,CGRectGetMaxX(self.cellImageView.frame) + 15), 24);
        self.textField.center = CGPointMake(self.textField.center.x, self.frame.size.height/2 + 1);
        
    } else {
        
        self.textField.textAlignment = NSTextAlignmentRight;
        self.textField.frame = CGRectMake(self.cellTextLabel.bounds.size.width + 20, 10, self.contentView.bounds.size.width - self.cellTextLabel.bounds.size.width - 30, 24);
        self.textField.center = CGPointMake(self.textField.center.x, self.cellTextLabel.center.y);
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
    
    if ([self.delegate respondsToSelector:@selector(tableInputViewCellDidFinish:)]) {
        [self.delegate tableInputViewCellDidFinish:self];
    }
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
    
    if (!editing) {
        [self resignKeyboard];
    }
}

- (void)setEditable:(BOOL)editable
{
    [super setEditable:editable];
    self.textField.userInteractionEnabled = editable;
}

#pragma mark - Navigation handling

- (void)resignKeyboard
{
    [self.textField resignFirstResponder];
}

@end
