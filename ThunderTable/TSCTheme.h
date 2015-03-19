//
//  TSCTheme.h
//  ThunderTable
//
//  Created by Phillip Caudell on 16/08/2013.
//  Copyright (c) 2013 madebyphill.co.uk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 Defines a theme that can be set as the sharedTheme on `TSCThemeManager`
 */
@protocol TSCTheme <NSObject>

///---------------------------------------------------------------------------------------
/// @name Colours
///---------------------------------------------------------------------------------------

/**
 @return The main tint colour for the app. This colour is generally used as the window tint colour and for tinting any UI elements throughout the app such as images and navigation bars
 */
- (UIColor *)mainColor;

/**
 @return A secondary colour that compliments the main colour.
 */
- (UIColor *)secondaryColor;

/**
 @return The colour of backgrounds throughout the app, particularly in table views
 */
- (UIColor *)backgroundColor;

/**
 @return The standard colour for free text
 */
- (UIColor *)freeTextColor;

/**
 @return The colour of header text in the app
 */
- (UIColor *)headerTextColor;

/**
 @return The default colour for UITableViewCell backgrounds
 */
- (UIColor *)tableCellBackgroundColor;

/**
 @return The colour of UITableViewCell seperators
 */
- (UIColor *)tableSeperatorColor;

/**
 @return The colour of the text for UILabel's throughout the app
 */
- (UIColor *)primaryLabelColor;

/**
 @return The colour of the text for alternative UILabel's throughout the app
 */
- (UIColor *)secondaryLabelColor;

/**
 @return The text colour for detail labels
 */
- (UIColor *)detailLabelColor;

/**
 @return The colour to be used for title text in a UINavigationBar
 */
- (UIColor *)titleTextColor;

/**
 @return The colour of the text label in a disabled UITableViewCell
 */
- (UIColor *)disabledCellTextColor;

/**
 @return A red colour
 */
- (UIColor *)redColor;

/**
 @return A yellow colour
 */
- (UIColor *)yellowColor;

/**
 @return A green colour
 */
- (UIColor *)greenColor;

/**
 @return A blue colour
 */
- (UIColor *)blueColor;

/**
 @return A dark blue colour
 */
- (UIColor *)darkBlueColor;

/**
 @return The colour to be used in the track of UIProgressBar
 */
- (UIColor *)progressTrackTintColour;

/**
 @return The colour to be used for a UIProgressBar fill colour
 */
- (UIColor *)progressTintColour;

///---------------------------------------------------------------------------------------
/// @name Fonts
///---------------------------------------------------------------------------------------

/**
 @return The font for detail labels
 */
- (UIFont *)detailLabelFont;

/**
 @abstract Where a lighter font is required, this method will return a light font with the given size
 @param size The required font size
 @return A light font in the requested size
 */
- (UIFont *)lightFontOfSize:(CGFloat)size;

/**
 @return The font for UILabel's throughout the app
 */
- (UIFont *)primaryLabelFont;

/**
 @return The font for alternative style UILabel's throught the app
 */
- (UIFont *)secondaryLabelFont;

@end