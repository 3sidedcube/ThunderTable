//
//  TSCTableInputCheckRow.m
//  ThunderStorm
//
//  Created by Phillip Caudell on 27/09/2013.
//  Copyright (c) 2013 3 SIDED CUBE. All rights reserved.
//

#import "TSCTableInputCheckRow.h"
#import "TSCTableInputCheckViewCell.h"

@implementation TSCTableInputCheckRow

+ (id)rowWithTitle:(NSString *)title inputId:(NSString *)inputId required:(BOOL)required
{
    TSCTableInputCheckRow *row = [[TSCTableInputCheckRow alloc] init];
    row.title = title;
    row.inputId = inputId;
    row.required = required;
    
    return row;
}

- (Class)tableViewCellClass
{
    return [TSCTableInputCheckViewCell class];
}

@end
