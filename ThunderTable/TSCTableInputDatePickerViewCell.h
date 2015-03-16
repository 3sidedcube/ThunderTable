//
//  TSCTableInputPickerViewCell.h
// ThunderTable
//
//  Created by Phillip Caudell on 26/09/2013.
//  Copyright (c) 2013 3 SIDED CUBE. All rights reserved.
//

#import "TSCTableInputViewCell.h"

@interface TSCTableInputDatePickerViewCell : TSCTableInputViewCell

@property (nonatomic, strong) NSDateFormatter *dateFormatter;
@property (nonatomic, strong) UITextField *dateLabel;
@property (nonatomic, strong) UIDatePicker *datePicker;

@end