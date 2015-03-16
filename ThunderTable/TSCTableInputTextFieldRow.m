//
//  TSCTableInputTextFieldRow.m
// ThunderTable
//
//  Created by Phillip Caudell on 20/08/2013.
//  Copyright (c) 2013 madebyphill.co.uk. All rights reserved.
//

#import "TSCTableInputTextFieldRow.h"
#import "TSCTableInputTextFieldViewCell.h"

@implementation TSCTableInputTextFieldRow

+ (id)rowWithTitle:(NSString *)title placeholder:(NSString *)placeholder inputId:(NSString *)inputId required:(BOOL)required
{
    return [self rowWithTitle:title placeholder:placeholder inputId:inputId keyboardType:UIKeyboardTypeAlphabet required:required];
}

+ (id)rowWithTitle:(NSString *)title placeholder:(NSString *)placeholder inputId:(NSString *)inputId keyboardType:(UIKeyboardType)keyboardType required:(BOOL)required
{
    TSCTableInputTextFieldRow *row = [[TSCTableInputTextFieldRow alloc] init];
    row.title = title;
    row.placeholder = placeholder;
    row.inputId = inputId;
    row.required = required;
    row.keyboardType = keyboardType;
    
    return row;
}

+ (id)rowWithTitle:(NSString *)title placeholder:(NSString *)placeholder inputId:(NSString *)inputId returnKeyType:(UIReturnKeyType)returnKeyType required:(BOOL)required
{
    TSCTableInputTextFieldRow *row = [[TSCTableInputTextFieldRow alloc] init];
    row.title = title;
    row.placeholder = placeholder;
    row.inputId = inputId;
    row.required = required;
    row.returnKeyType = returnKeyType;
    
    return row;
}

+ (id)rowWithTitle:(NSString *)title placeholder:(NSString *)placeholder inputId:(NSString *)inputId returnKeyType:(UIReturnKeyType)returnKeyType required:(BOOL)required isSecure:(BOOL)isSecure
{
    TSCTableInputTextFieldRow *row = [[TSCTableInputTextFieldRow alloc] init];
    row.title = title;
    row.placeholder = placeholder;
    row.inputId = inputId;
    row.required = required;
    row.returnKeyType = returnKeyType;
    row.isSecure = isSecure;
    
    return row;
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
    inputCell.textField.placeholder = self.placeholder;
    inputCell.textField.keyboardType = self.keyboardType;
    inputCell.textField.returnKeyType = self.returnKeyType;
    inputCell.textField.secureTextEntry = self.isSecure;
    inputCell.textField.autocapitalizationType = self.autocapitalizationType;
    inputCell.textField.autocorrectionType = self.autocorrectionType;
    
    if (inputCell.inputRow.value != [NSNull null]) {
        if ([inputCell.inputRow.value isKindOfClass:[NSNumber class]]) {
            inputCell.textField.text = [inputCell.inputRow.value stringValue];
        } else {
            inputCell.textField.text = inputCell.inputRow.value;
        }
    } else {
        inputCell.textField.text = nil;
    }
    
    return inputCell;
}

@end
