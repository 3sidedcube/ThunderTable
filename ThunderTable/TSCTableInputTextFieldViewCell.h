//
//  TSCTableInputTextFieldViewCell.h
// ThunderTable
//
//  Created by Phillip Caudell on 20/08/2013.
//  Copyright (c) 2013 madebyphill.co.uk. All rights reserved.
//

#import "TSCTableInputViewCell.h"

@class TSCTableInputTextFieldViewCell;

/**
 A cell containing a right-aligned `UITextField`
 */
@interface TSCTableInputTextFieldViewCell : TSCTableInputViewCell <UITextFieldDelegate>

/**
 @abstract The `UITextField` displayed in the cell
 */
@property (nonatomic, strong) UITextField *textField;

@end
