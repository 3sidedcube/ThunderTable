//
//  TSCTableInputTextViewRow.m
// ThunderTable
//
//  Created by Matt Cheetham on 17/09/2013.
//  Copyright (c) 2013 3 SIDED CUBE. All rights reserved.
//

#import "TSCTableInputTextViewRow.h"
#import "TSCTableInputTextViewViewCell.h"
#import "GCPlaceholderTextView.h"

@implementation TSCTableInputTextViewRow

+ (instancetype)rowWithPlaceholder:(NSString *)placeholder inputId:(NSString *)inputId required:(BOOL)required cellHeight:(CGFloat)height
{
    TSCTableInputTextViewRow *row = [[TSCTableInputTextViewRow alloc] init];
    row.inputId = inputId;
    row.required = required;
    row.cellHeight = height;
    row.placeholder = placeholder;
    
    return row;
}

- (Class)tableViewCellClass
{
    return [TSCTableInputTextViewViewCell class];
}

- (UITableViewCell *)tableViewCell:(UITableViewCell *)cell
{
    TSCTableInputTextViewViewCell *inputCell = (TSCTableInputTextViewViewCell *)cell;
    inputCell.textView.text = self.placeholder;
    inputCell.placeholder = self.placeholder;
        
    if (inputCell.inputRow.value != [NSNull null]) {
        if ([inputCell.inputRow.value isKindOfClass:[NSNumber class]]) {
            inputCell.textView.text = [inputCell.inputRow.value stringValue];
        } else if ([inputCell.inputRow.value isKindOfClass:[NSString class]]) {
            inputCell.textView.text = inputCell.inputRow.value;
        }
    } else {
        inputCell.textView.text = self.placeholder;
    }
    
    return inputCell;
}

- (NSString *)rowTitle;
{
    return self.title;
}

#pragma Table view data source

- (CGFloat)tableViewCellHeightConstrainedToSize:(CGSize)contrainedSize;
{
    return self.cellHeight;
}

@end
