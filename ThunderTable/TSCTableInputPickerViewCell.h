//
//  TSCTableInputPickerViewCell.h
//  ThunderStorm
//
//  Created by Phillip Caudell on 27/09/2013.
//  Copyright (c) 2013 3 SIDED CUBE. All rights reserved.
//

#import "TSCTableInputViewCell.h"

@interface TSCTableInputPickerViewCell : TSCTableInputViewCell <UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic, strong) UITextField *selectionLabel;
@property (nonatomic, strong) UIPickerView *pickerView;
@property (nonatomic, strong) NSArray *values;
@property (nonatomic, strong) NSString *placeholder;
@property (nonatomic, strong) TSCTableInputRow *inputRow;

@end