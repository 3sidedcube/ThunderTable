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

/**
 This method is called when the user will finish editing the value of the current cell
 @param cell The cell which the user will finish editing
 */
- (void)tableInputViewCellWillFinish:(TSCTableViewCell *)cell;

/**
 This method is called when the user starts editing the value of the current cell
 @param cell The cell which the user has started editing
 */
- (void)tableInputViewCellDidStart:(TSCTableViewCell *)cell;

@end

/**
 The base class for cells which will contain an input element to display to the user
 */
@interface TSCTableInputViewCell : TSCTableViewCell

/**
 @abstract The input row for the selected cell.
 @discussion This is set so the cell can mutate the value stored on the row when the user changes the input's value
 */
@property (nonatomic, weak) id <TSCTableInputRowDataSource> inputRow;

/**
 @abstract A delegate which will be notified when the user has finished setting a value for this cell
 */
@property (nonatomic, weak) id <TSCTableInputViewCellDelegate> delegate;

/**
 @abstract Toggles whether the cell is currently editable
 @param editable Whether the cell is currently editable
 @warning This is different from `setEditing:` as that method defines if the user is currently editing the cell, not whether a cell is editable!
 */
- (void)setEditable:(BOOL)editable;

@end
