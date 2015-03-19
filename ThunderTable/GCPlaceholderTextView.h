//
//  GCPlaceholderTextView.h
//  GCLibrary
//
//  Created by Guillaume Campagna on 10-11-16.
//  Copyright 2010 LittleKiwi. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 Subclass of `UITextView` which adds placeholder capability
 */
@interface GCPlaceholderTextView : UITextView 

/**
 @abstract The placeholder string to be displayed in the `CGPlaceholderTextView`
 */
@property (nonatomic, copy) NSString *placeholder;

/**
 @abstract The colour of the text to be used for the placeholder string when it is displayed
 */
@property (nonatomic, strong) UIColor *placeholderColor;

@end
