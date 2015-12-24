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

/**
 @abstract The custom text label for the cell
 */
@property (nonatomic, strong) UILabel *cellTextLabel;

/**
 @abstract The custom detail text label for the cell
 */
@property (nonatomic, strong) UILabel *cellDetailTextLabel;

/**
 @abstract The custom cell image view
 */
@property (nonatomic, strong) UIImageView *cellImageView;

/**
 @abstract The style of the cell
 */
@property (nonatomic, assign) UITableViewCellStyle cellStyle;

@end
