//
//  TSCCheckView.h
//  ThunderStorm
//
//  Created by Phillip Caudell on 27/09/2013.
//  Copyright (c) 2013 3 SIDED CUBE. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TSCCheckView : UIControl

@property (nonatomic, strong) NSNumber *checkIdentifier;

@property (nonatomic, strong) UIView *innerView;
@property (nonatomic, strong) UIView *outerView;
@property (nonatomic, assign, getter = isOn) BOOL on;
@property (nonatomic, assign) BOOL allowsUserInteraction;

@property (nonatomic, strong) UIColor *onTintColor UI_APPEARANCE_SELECTOR;
@property (nonatomic, strong) UIColor *tintColor  UI_APPEARANCE_SELECTOR;

- (void)setOn:(BOOL)on animated:(BOOL)animated;
- (void)setOn:(BOOL)on animated:(BOOL)animated saveState:(BOOL)save;
- (void)handleTap:(id)sender;

@end
