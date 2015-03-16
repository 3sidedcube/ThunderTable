//
//  TSCTableInputCheckRow.h
// ThunderTable
//
//  Created by Phillip Caudell on 27/09/2013.
//  Copyright (c) 2013 3 SIDED CUBE. All rights reserved.
//

#import "TSCTableInputRow.h"

/**
 `TSCTableInputCheckRow` a row which provides the user with a check box (`TSCCheckView`) used for example ticking off items in a list
 */
@interface TSCTableInputCheckRow : TSCTableInputRow

///---------------------------------------------------------------------------------------
/// @name Initialization Methods
///---------------------------------------------------------------------------------------

/**
 Initializes the row with a title
 @param title The title to show on the row
 @param inputId The key to save the value of the `TSCCheckView` under
 @param required Whether or not a value is required for this row
 */
+ (instancetype)rowWithTitle:(NSString *)title inputId:(NSString *)inputId required:(BOOL)required;

@end
