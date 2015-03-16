//
//  TSCTableInputDatePickerRow.h
// ThunderTable
//
//  Created by Phillip Caudell on 26/09/2013.
//  Copyright (c) 2013 3 SIDED CUBE. All rights reserved.
//

#import "TSCTableInputRow.h"

@interface TSCTableInputDatePickerRow : TSCTableInputRow

@property (nonatomic, assign) UIDatePickerMode datePickerMode;

+ (instancetype)rowWithTitle:(NSString *)title mode:(UIDatePickerMode)mode inputId:(NSString *)inputId required:(BOOL)required;

@end
