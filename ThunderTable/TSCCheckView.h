//
//  TSCCheckView.h
// ThunderTable
//
//  Created by Phillip Caudell on 27/09/2013.
//  Copyright (c) 2013 3 SIDED CUBE. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 `TSCCheckView` is a control which acts like a tick-box
 */
@interface TSCCheckView : UIControl

/**
 @abstract The identifier for the check view
 @discussion This is used when saving the `TSCCheckView`'s state to the `NSUserDefaults` using `-setOn:Animated:saveState`, so make sure if you do want to save the sate you always provide the same identifier.
 @warning If this is nil, the state will not be saved to `NSUserDefaults`
 */
@property (nonatomic, strong) NSNumber *checkIdentifier;

/**
 @abstract Whether or not the check view should respond to touch events
 */
@property (nonatomic, assign) BOOL allowsUserInteraction;

/**
 @abstract The view displayed within `containerView` when the `TSCCheckView`'s state is 'on'
 @discussion By default this is a circular view which totally fills the container view
 */
@property (nonatomic, strong) UIView *innerView;

/**
 @abstract The container view for the `UICheckView`
 @discussion By default this is a transparent circular view with a border
 */
@property (nonatomic, strong) UIView *outerView;

/**
 @abstract The colour of the innerView
 @discussion With default behaviour this determines the fill colour of the innerView when the `TSCCheckView`'s state is 'on'
 */
@property (nonatomic, strong) UIColor *onTintColor UI_APPEARANCE_SELECTOR;

/**
 @abstract The colour of the outerView
 @discussion With default behaviour this determines the fill colour of the outerView when the `TSCCheckView`'s state is 'off'
 */
@property (nonatomic, strong) UIColor *tintColor  UI_APPEARANCE_SELECTOR;

/**
 @abstract Returns whether the `TSCCheckView` is currently 'ticked' or 'toggled to on'
 */
@property (nonatomic, assign, getter = isOn) BOOL on;


/**
 @abstract Used to change the state of the `TSCCheckView`
 @param on Whether the state of the view should be 'on' or 'off'
 @param animated Whether the change should animate or not
 */
- (void)setOn:(BOOL)on animated:(BOOL)animated;

/**
 @abstract Used to change the state of the `TSCCheckView`
 @param on Whether the state of the view should be 'on' or 'off'
 @param animated Whether the change should animate or not
 @param save Whether the change of state should be saved to the `NSUserDefaults`
 @warning If `checkIdentifier` is not set the state will not be saved whether it is sent true or false
 */
- (void)setOn:(BOOL)on animated:(BOOL)animated saveState:(BOOL)save;

/**
 @abstract The method called when the `TSCCheckView` recieves a touch
 @param sender The `UITapGestureRecognizer` which resulted in this method being called
 @discussion This is provided as a convenience as the standard implementation saves the switches state which you may wish to override
 */
- (void)handleTap:(id)sender;

@end
