//
//  TSCThemeManager.h
//  ThunderTable
//
//  Created by Phillip Caudell on 16/08/2013.
//  Copyright (c) 2013 madebyphill.co.uk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSCTheme.h"

/**
 A controller instance for theming of an app
 */
@interface TSCThemeManager : NSObject

/**
 A shared instance of the theme to be used by the app.
 @discussion This can be set using `setSharedTheme:`
 @return An NSObject that conforms to the TSCTheme protocol
 */
+ (TSCTheme *)sharedTheme;

/**
 Use this method to set the shared theme for the app. Accessing the shared theme in future will return the object returned here
 @param theme The new shared theme to be used
 */
+ (void)setSharedTheme:(TSCTheme *)theme;

/**
Can be used to identify if the device is running at least iOS 7
 @return A boolean indicating whether the current device is running a version of iOS 7
 */
+ (BOOL)isOS7;

/**
 Can be used to identify if the device is running at least iOS 8
 @return A boolean indicating whether the current device is running a version of iOS 8
 */
+ (BOOL)isOS8;

/**
 Detects if the language of the device is a right to left character set
 @return BOOL of whether or not the language is right to left
 @warning This method is deprecated and will always return NO
 */
+ (BOOL)isRightToLeft __attribute__((deprecated));

/**
 Converts a given text direction to its localised format.
 @param textDirection The text direction to return the localised text direction for
 @discussion Used for supporting right to left languages. For example passing NSTextAlignmentLeft when the language is right to left will return NSTextAlignmentRight
 @warning This method is deprecated and will always return the given direction now.
 */
+ (NSTextAlignment)localisedTextDirectionForBaseDirection:(NSTextAlignment)textDirection __attribute__((deprecated));

/**
Applies the shared theme to the app
 */
+ (void)customizeAppAppearance;

/**
 Used to detect if the current device is an iPad
 @return YES if the device is an iPad
 */
BOOL TSC_isPad();

@end