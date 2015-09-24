//
//  TSCTableViewCell.h
// ThunderTable
//
//  Created by Phillip Caudell on 16/08/2013.
//  Copyright (c) 2013 madebyphill.co.uk. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TSCTableViewCell;

/**
 A base subclass of `UITableViewCell` used as the cell for `TSCTableRow`
 */
@interface TSCTableViewCell : UITableViewCell

/**
 @abstract The containing `UIViewController` of the cell
 */
@property (nonatomic, weak) UIViewController *parentViewController;

/**
 @abstract Returns the index that the `TSCTableViewCell` is currently at in the `TSCTableViewController`
 */
@property (nonatomic, strong) NSIndexPath *currentIndexPath;

/**
 @abstract Whether the cell should display separators or not
 */
@property (nonatomic, assign) BOOL shouldDisplaySeparators;

@end
