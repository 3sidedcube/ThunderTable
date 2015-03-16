//
//  TSCTableInputViewCell.h
// ThunderTable
//
//  Created by Phillip Caudell on 20/08/2013.
//  Copyright (c) 2013 madebyphill.co.uk. All rights reserved.
//

#import "TSCTableViewCell.h"
#import "TSCTableInputRowDataSource.h"

@class TSCTableInputRow;

/**
 A protocol which is used for a cell to communicate when it's value is changed or the user has finished editing it
 */
@protocol TSCTableInputViewCellDelegate <NSObject>

@optional

/**
 This method is called when the user has finished editing the value of the current cell
 @param cell The cell which the user has finished editing
 */
- (void)tableInputViewCellDidFinish:(TSCTableViewCell *)cell;

@end

/**
 The base class for cells which will contain an input element to display to the user
 */
@interface TSCTableInputViewCell : TSCTableViewCell

/**
 @abstract The input row for the selected cell.
 @discussion This is set so the cell can mutate the value stored on the row when the user changes the input's value
 */
@property (nonatomic, strong) NSObject <TSCTableInputRowDataSource> *inputRow;

/**
 @abstract A delegate which will be notified when the user has finished setting a value for this cell
 */
@property (nonatomic, weak) id <TSCTableInputViewCellDelegate> delegate;

@end
