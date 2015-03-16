//
//  TSCTableViewCell.h
// ThunderTable
//
//  Created by Phillip Caudell on 16/08/2013.
//  Copyright (c) 2013 madebyphill.co.uk. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TSCTableViewCell;

@interface TSCTableViewCell : UITableViewCell

@property (nonatomic, weak) UIViewController *parentViewController;
@property (nonatomic, strong) NSIndexPath *currentIndexPath;
@property (nonatomic, strong) UIView *separatorTopView;
@property (nonatomic, strong) UIView *separatorBottomView;
@property (nonatomic, assign) BOOL shouldDisplaySeparators;

@end
