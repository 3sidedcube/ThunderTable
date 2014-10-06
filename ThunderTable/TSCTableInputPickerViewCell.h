//
//  TSCTableInputPickerViewCell.h
//  ThunderStorm
//
//  Created by Phillip Caudell on 27/09/2013.
//  Copyright (c) 2013 3 SIDED CUBE. All rights reserved.
//

#import "TSCTableInputViewCell.h"

@interface TSCTableInputPickerViewCell : TSCTableInputViewCell

@property (nonatomic, strong) UILabel *selectionLabel;

@end

@interface _TSCTableInputPickerControlViewCell : TSCTableInputViewCell <UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, strong) UIPickerView *pickerView;
@property (nonatomic, strong) NSArray *values;

@end