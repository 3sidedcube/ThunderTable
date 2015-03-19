//
//  TSCTableInputTextViewViewCell.h
// ThunderTable
//
//  Created by Matt Cheetham on 17/09/2013.
//  Copyright (c) 2013 3 SIDED CUBE. All rights reserved.
//

#import "TSCTableInputViewCell.h"

@class GCPlaceholderTextView;

/**
 A cell containing an editable `CGPlaceholderTextView`
 */
@interface TSCTableInputTextViewViewCell : TSCTableInputViewCell <UITextViewDelegate>

/**
 @abstract The `CGPlaceholderTextView` displayed in the cell
 */
@property (nonatomic, strong) GCPlaceholderTextView *textView;

/**
 @abstract The placeholder string to be shown in the `CGPlaceholderTextView`
 */
@property (nonatomic, copy) NSString *placeholder;

@end
