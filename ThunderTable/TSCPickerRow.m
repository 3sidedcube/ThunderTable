//
//  TSCPickerRow.m
//  ThunderTable
//
//  Created by Joel Trew on 03/06/2015.
//  Copyright (c) 2015 3 SIDED CUBE. All rights reserved.
//

#import "TSCPickerRow.h"

@implementation TSCPickerRow

+(instancetype)rowWithTitle:(NSString *)title{
    TSCPickerRow *row = [self new];
    row.title = title;
    return row;
}



-(NSString *)rowTitle{
    return self.title;
}



@end
