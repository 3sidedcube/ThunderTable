//
//  TSCTableInputTextViewRow.h
// ThunderTable
//
//  Created by Matt Cheetham on 17/09/2013.
//  Copyright (c) 2013 3 SIDED CUBE. All rights reserved.
//

#import "TSCTableInputRow.h"

/**
 `TSCTableInputTextFieldRow` a row which provides the user with a `UITextView` for entering data
 */
@interface TSCTableInputTextViewRow : TSCTableInputRow <TSCTableRowDataSource>

///---------------------------------------------------------------------------------------
/// @name Initialization Methods
///---------------------------------------------------------------------------------------

/**
 Initializes the row with a placeholder and height
 @param placeholder A placeholder string to display in the `UITextView`
 @param inputId The key to save the value of the `UITextView` under
 @param required Whether or not a value is required for this row
 @param height The required height of the row
 */
+ (instancetype)rowWithPlaceholder:(NSString *)placeholder inputId:(NSString *)inputId required:(BOOL)required cellHeight:(CGFloat)height;


///---------------------------------------------------------------------------------------
/// @name Row configuration
///---------------------------------------------------------------------------------------

/**
 @abstract The height of the row to display
 */
@property (nonatomic) CGFloat cellHeight;

/**
 @abstract A placeholder string to be displayed in the `UITextView`
 */
@property (nonatomic, copy) NSString *placeholder;

@end
