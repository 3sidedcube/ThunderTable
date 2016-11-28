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
- (UIColor * _Nonnull)mainColor;

/**
 @return The background colour for all table view cells throughout the app
 */
- (UIColor * _Nonnull)cellBackgroundColor;

/**
 @return The title colour to be used for all table view cells throughout the app
 */
- (UIColor * _Nonnull)cellTitleColor;

/**
 @return The detail colour to be used for all table view cells throughout the app
 */
- (UIColor * _Nonnull)cellDetailColor;

/**
 @return The placeholder colour to be used for all table view cells throughout the app
 */
- (UIColor * _Nonnull)cellPlaceholderColor;

/**
 @return The paragraph style for cell title label
 */
- (NSParagraphStyle * _Nullable)cellTitleParagraphStyle;

/**
 @return The paragraph style for cell detail label
 */
- (NSParagraphStyle * _Nullable)cellDetailParagraphStyle;

/**
 @return A secondary colour that compliments the main colour.
 */
- (UIColor * _Nonnull)secondaryColor;

/**
 @return The colour of backgrounds throughout the app, particularly in table views
 */
- (UIColor * _Nonnull)backgroundColor;

/**
 @return The standard colour for free text
 */
- (UIColor * _Nonnull)freeTextColor;

/**
 @return The colour of header text in the app
 */
- (UIColor * _Nonnull)headerTextColor;

/**
 @return The colour of UITableViewCell seperators
 */
- (UIColor * _Nonnull)tableSeperatorColor;

/**
 @return The colour of the text for UILabel's throughout the app
 */
- (UIColor * _Nonnull)primaryLabelColor;

/**
 @return The colour of the text for alternative UILabel's throughout the app
 */
- (UIColor * _Nonnull)secondaryLabelColor;

/**
 @return The colour to be used for title text in a UINavigationBar
 */
- (UIColor * _Nonnull)titleTextColor;

/**
 @return The colour of the text label in a disabled UITableViewCell
 */
- (UIColor * _Nonnull)disabledCellTextColor;

/**
 @return A red colour
 */
- (UIColor * _Nonnull)redColor;

/**
 @return A yellow colour
 */
- (UIColor * _Nonnull)yellowColor;

/**
 @return A green colour
 */
- (UIColor * _Nonnull)greenColor;

/**
 @return A blue colour
 */
- (UIColor * _Nonnull)blueColor;

/**
 @return A dark blue colour
 */
- (UIColor * _Nonnull)darkBlueColor;

/**
 @return The colour to be used in the track of UIProgressBar
 */
- (UIColor * _Nonnull)progressTrackTintColour;

/**
 @return The colour to be used for a UIProgressBar fill colour
 */
- (UIColor * _Nonnull)progressTintColour;

/**
 @return The colour to be used as the navigation bar background colour
 */
- (UIColor * _Nonnull)navigationBarBackgroundColor;

/**
 @return The colour to be used as the navigation bar tint colour
 */
- (UIColor * _Nonnull)navigationBarTintColor;

///---------------------------------------------------------------------------------------
/// @name Fonts
///---------------------------------------------------------------------------------------

/**
 @abstract Where a lighter font is required, this method will return a light font with the given size
 @param size The required font size
 @return A light font in the requested size
 */
- (UIFont * _Nonnull)lightFontOfSize:(CGFloat)size;

/**
 @abstract Returns a font of a required size
 @param size The required font size
 @return A font in the requested size
 */
- (UIFont * _Nonnull)fontOfSize:(CGFloat)size;

/**
 @abstract Returns a medium font of a required size
 @param size The required font size
 @return A medium font in the requested size
 */
- (UIFont * _Nonnull)mediumFontOfSize:(CGFloat)size;

/**
 @abstract Returns a bold font of a required size
 @param size The required font size
 @return A bold font in the requested size
 */
- (UIFont * _Nonnull)boldFontOfSize:(CGFloat)size;

/**
 @return The font for UILabel's throughout the app
 */
- (UIFont * _Nonnull)primaryLabelFont;

/**
 @return The font for alternative style UILabel's throught the app
 */
- (UIFont * _Nonnull)secondaryLabelFont;

/**
 @return The font for the title label of cells throughout the app
 */
- (UIFont * _Nonnull)cellTitleFont;

/**
 @return The font for the detail label of cells throughout the app
 */
- (UIFont * _Nonnull)cellDetailFont;

@end
