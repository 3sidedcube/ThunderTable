//
//  TSCTableInputPickerRow.h
//  ThunderStorm
//
//  Created by Phillip Caudell on 26/09/2013.
//  Copyright (c) 2013 3 SIDED CUBE. All rights reserved.
//

#import "TSCTableInputRow.h"

@interface TSCTableInputPickerRow : TSCTableInputRow

@property (nonatomic, strong) NSArray *values;
@property (nonatomic, copy) NSString *placeholder;

+ (instancetype)rowWithTitle:(NSString *)title inputId:(NSString *)inputId values:(NSArray *)values required:(BOOL)required;

@end