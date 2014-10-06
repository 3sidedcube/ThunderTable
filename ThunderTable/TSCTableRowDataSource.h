//
//  TSCTableRowDatasource.h
//  American Red Cross Disaster
//
//  Created by Phillip Caudell on 16/08/2013.
//  Copyright (c) 2013 madebyphill.co.uk. All rights reserved.
//

@import Foundation;
@import UIKit;

@class TSCLink;

@protocol TSCTableRowDataSource <NSObject>

@required
- (NSString *)rowTitle;
@optional
- (NSString *)rowSubtitle;
- (UIImage *)rowImage;
- (NSURL *)rowImageURL;
- (UIImage *)rowImagePlaceholder;
- (Class)tableViewCellClass;
- (UITableViewCell *)tableViewCell:(UITableViewCell *)cell;
- (CGFloat)tableViewCellHeightConstrainedToSize:(CGSize)contrainedSize;
- (CGFloat)tableViewCellHeightConstrainedToContentViewSize:(CGSize)contentViewSize tableViewSize:(CGSize)tableViewSize;
- (CGFloat)tableViewCellEstimatedHeight;
- (BOOL)canEditRow;
- (id)rowSelectionTarget;
- (SEL)rowSelectionSelector;
- (TSCLink *)rowLink;
- (NSInteger)indentationLevel;
- (UITableViewCellAccessoryType)rowAccessoryType;
- (float)rowPadding;

//The following 2 are only respected if row selection target and row selector are both not nil. Otherwise neither are displayed.
- (BOOL)shouldDisplaySelectionIndicator;
- (BOOL)shouldDisplaySelectionCell;
- (BOOL)shouldRemainSelected;
- (BOOL)shouldDisplaySeperator;

@end