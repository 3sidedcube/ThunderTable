//
//  TSCTableValue1ViewCell.h
// ThunderTable
//
//  Created by Matt Cheetham on 18/09/2013.
//  Copyright (c) 2013 3 SIDED CUBE. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TSCTableValue1ViewCell : UITableViewCell

@property (nonatomic, weak) UIViewController *parentViewController;
@property (nonatomic, strong) NSIndexPath *currentIndexPath;
@property (nonatomic, strong) UIView *separatorTopView;
@property (nonatomic, strong) UIView *separatorBottomView;
@property (nonatomic, assign) BOOL shouldDisplaySeparators;

@end
