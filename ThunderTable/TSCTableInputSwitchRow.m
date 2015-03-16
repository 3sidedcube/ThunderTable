//
//  TSCTableInputSwitchRow.m
//  American Red Cross Disaster
//
//  Created by Phillip Caudell on 27/08/2013.
//  Copyright (c) 2013 madebyphill.co.uk. All rights reserved.
//

#import "TSCTableInputSwitchRow.h"
#import "TSCTableInputSwitchViewCell.h"

@implementation TSCTableInputSwitchRow

+ (instancetype)rowWithTitle:(NSString *)title inputId:(NSString *)inputId required:(BOOL)required
{
    TSCTableInputSwitchRow *row = [[[self class] alloc] init];
    row.title = title;
    row.inputId = inputId;
    row.required = required;
    
    return row;
}

+ (instancetype)rowWithTitle:(NSString *)title image:(UIImage *)image inputId:(NSString *)inputId required:(BOOL)required
{
    TSCTableInputSwitchRow *row = [[[self class] alloc] init];
    row.title = title;
    row.inputId = inputId;
    row.required = required;
    row.image = image;
    
    return row;
}

- (NSString *)rowTitle
{
    return self.title;
}

-(UIImage *)rowImage
{
    return self.image;
}

- (Class)tableViewCellClass
{
    return [TSCTableInputSwitchViewCell class];
}

- (UITableViewCell *)tableViewCell:(UITableViewCell *)cell
{
    TSCTableInputSwitchViewCell *inputCell = (TSCTableInputSwitchViewCell *)cell;
    
    if (self.value) {
        inputCell.inputRow.value = self.value;
    } else {
        inputCell.inputRow.value = @(0);
    }
    
    inputCell.primarySwitch.on = [self.value boolValue];
    
    return inputCell;
}

@end
