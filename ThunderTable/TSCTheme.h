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
@interface TSCTheme : NSObject

///---------------------------------------------------------------------------------------
/// @name Colours
///---------------------------------------------------------------------------------------

/**
 @return The main tint colour for the app. This colour is generally used as the window tint colour and for tinting any UI elements throughout the app such as images and navigation bars
 */
- (UIColor *)mainColor;

/**
 @return The background colour for all table view cells throughout the app
 */
- (UIColor *)cellBackgroundColor;

/**
 @return The title colour to be used for all table view cells throughout the app
 */
- (UIColor *)cellTitleColor;

/**
 @return The detail colour to be used for all table view cells throughout the app
 */
- (UIColor *)cellDetailColor;

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

/**
 @return The colour to be used as the navigation bar background colour
 */
- (UIColor *)navigationBarBackgroundColor;

/**
 @return The colour to be used as the navigation bar tint colour
 */
- (UIColor *)navigationBarTintColor;

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
 @abstract Returns a font of a required size
 @param size The required font size
 @return A font in the requested size
 */
- (UIFont *)fontOfSize:(CGFloat)size;

/**
 @abstract Returns a medium font of a required size
 @param size The required font size
 @return A medium font in the requested size
 */
- (UIFont *)mediumFontOfSize:(CGFloat)size;

/**
 @abstract Returns a bold font of a required size
 @param size The required font size
 @return A bold font in the requested size
 */
- (UIFont *)boldFontOfSize:(CGFloat)size;

/**
 @return The font for UILabel's throughout the app
 */
- (UIFont *)primaryLabelFont;

/**
 @return The font for alternative style UILabel's throught the app
 */
- (UIFont *)secondaryLabelFont;

@end