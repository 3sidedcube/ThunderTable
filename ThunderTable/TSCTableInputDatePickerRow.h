//
//  TSCTableInputDatePickerRow.h
//  ThunderStorm
//
//  Created by Phillip Caudell on 26/09/2013.
//  Copyright (c) 2013 3 SIDED CUBE. All rights reserved.
//

#import "TSCTableInputRow.h"

@interface TSCTableInputDatePickerRow : TSCTableInputRow

@property (nonatomic, assign) UIDatePickerMode datePickerMode;

+ (id)rowWithTitle:(NSString *)title mode:(UIDatePickerMode)mode inputId:(NSString *)inputId required:(BOOL)required;

@end

@interface _TSCTableInputDatePickerControlRow : TSCTableInputRow

@property (nonatomic, strong) TSCTableInputDatePickerRow *parentRow;

+ (id)rowWithParentRow:(TSCTableInputDatePickerRow *)parentRow;

@end