//
//  TSCTableInputTextViewViewCell.h
// ThunderTable
//
//  Created by Matt Cheetham on 17/09/2013.
//  Copyright (c) 2013 3 SIDED CUBE. All rights reserved.
//

#import "TSCTableInputViewCell.h"

@class GCPlaceholderTextView;

@interface TSCTableInputTextViewViewCell : TSCTableInputViewCell <UITextViewDelegate>

@property (nonatomic, strong) GCPlaceholderTextView *textView;
@property (nonatomic, copy) NSString *placeholder;

@end
