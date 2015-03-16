//
//  TSCTableInputTextFieldViewCell.h
// ThunderTable
//
//  Created by Phillip Caudell on 20/08/2013.
//  Copyright (c) 2013 madebyphill.co.uk. All rights reserved.
//

#import "TSCTableInputViewCell.h"

@class TSCTableInputTextFieldViewCell;

@interface TSCTableInputTextFieldViewCell : TSCTableInputViewCell <UITextFieldDelegate>

@property (nonatomic, strong) UITextField *textField;

@end
