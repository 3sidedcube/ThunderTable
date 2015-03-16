//
//  TSCTableInputCheckViewCell.h
// ThunderTable
//
//  Created by Phillip Caudell on 27/09/2013.
//  Copyright (c) 2013 3 SIDED CUBE. All rights reserved.
//

#import "TSCTableInputViewCell.h"

@class TSCCheckView;

/**
 `TSCTableInputCheckViewCell` A cell containing a right-aligned check box (Circular by default)
 */
@interface TSCTableInputCheckViewCell : TSCTableInputViewCell

/**
 @abstract The check view which is shown in the cell
 */
@property (nonatomic, strong) TSCCheckView *checkView;

@end
