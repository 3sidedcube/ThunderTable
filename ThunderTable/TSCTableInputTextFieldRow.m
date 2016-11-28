//
//  TSCTableInputTextFieldRow.m
// ThunderTable
//
//  Created by Phillip Caudell on 20/08/2013.
//  Copyright (c) 2013 madebyphill.co.uk. All rights reserved.
//

#import "TSCTableInputTextFieldRow.h"
#import "TSCTableInputTextFieldViewCell.h"
#import "TSCThemeManager.h"

@implementation TSCTableInputTextFieldRow

+ (id)rowWithTitle:(NSString *)title placeholder:(NSString *)placeholder inputId:(NSString *)inputId required:(BOOL)required
{
    return [self rowWithTitle:title placeholder:placeholder inputId:inputId keyboardType:UIKeyboardTypeAlphabet required:required];
}

+ (id)rowWithTitle:(NSString *)title placeholder:(NSString *)placeholder inputId:(NSString *)inputId keyboardType:(UIKeyboardType)keyboardType required:(BOOL)required
{
    TSCTableInputTextFieldRow *row = [[[self class] alloc] init];
    row.title = title;
    row.placeholder = placeholder;
    row.inputId = inputId;
    row.required = required;
    row.keyboardType = keyboardType;
    
    return row;
}

+ (id)rowWithTitle:(NSString *)title placeholder:(NSString *)placeholder inputId:(NSString *)inputId returnKeyType:(UIReturnKeyType)returnKeyType required:(BOOL)required
{
    TSCTableInputTextFieldRow *row = [[[self class] alloc] init];
    row.title = title;
    row.placeholder = placeholder;
    row.inputId = inputId;
    row.required = required;
    row.returnKeyType = returnKeyType;
    
    return row;
}

+ (id)rowWithTitle:(NSString *)title placeholder:(NSString *)placeholder inputId:(NSString *)inputId returnKeyType:(UIReturnKeyType)returnKeyType required:(BOOL)required isSecure:(BOOL)isSecure
{
    TSCTableInputTextFieldRow *row = [[[self class] alloc] init];
    row.title = title;
    row.placeholder = placeholder;
    row.inputId = inputId;
    row.required = required;
    row.returnKeyType = returnKeyType;
    row.isSecure = isSecure;
    
    return row;
}

- (instancetype)init
{
    if (self = [super init]) {
        self.returnKeyType = UIReturnKeyNext;
    }
    return self;
}

- (NSString *)rowTitle
{
    return self.title;
}

- (Class)tableViewCellClass
{
    return [TSCTableInputTextFieldViewCell class];
}

- (UITableViewCell *)tableViewCell:(UITableViewCell *)cell
{
    TSCTableInputTextFieldViewCell *inputCell = (TSCTableInputTextFieldViewCell *)cell;
    inputCell.textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.placeholder ?: @"" attributes:@{NSForegroundColorAttributeName:self.detailTextColor ? : [[TSCThemeManager sharedTheme] cellPlaceholderColor]}];
    inputCell.textField.keyboardType = self.keyboardType;
    inputCell.textField.returnKeyType = self.returnKeyType;
    inputCell.textField.secureTextEntry = self.isSecure;
    inputCell.textField.autocapitalizationType = self.autocapitalizationType;
    inputCell.textField.autocorrectionType = self.autocorrectionType;
    
    [self updateTargetsAndActionsForControl:inputCell.textField];
    
    if (self.value && self.value != [NSNull null]) {
        
        if ([inputCell.inputRow.value isKindOfClass:[NSNumber class]]) {
            inputCell.textField.text = [self.value stringValue];
        } else {
            inputCell.textField.text = self.value;
        }
        
    } else {
        inputCell.textField.text = nil;
    }
    
    return inputCell;
}

- (UITableViewCellStyle)cellStyle
{
    return UITableViewCellStyleValue1;
}

@end
