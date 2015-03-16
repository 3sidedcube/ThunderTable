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
 @abstract A shared instance of the theme to be used by the app.
 @discussion This can be set using `setSharedTheme:`
 @return An NSObject that conforms to the TSCTheme protocol
 */
+ (id <TSCTheme>)sharedTheme;

/**
 @abstract Use this method to set the shared theme for the app. Accessing the shared theme in future will return the object returned here
 */
+ (void)setSharedTheme:(id <TSCTheme>)theme;

/**
 @abstract Can be used to identify if the device is running at least iOS 7
 @return A boolean indicating whether the current device is running a version of iOS 7
 */
+ (BOOL)isOS7;

/**
 @abstract Can be used to identify if the device is running at least iOS 8
 @return A boolean indicating whether the current device is running a version of iOS 8
 */
+ (BOOL)isOS8;

/**
 @abstract Detects if the language of the device is a right to left character set
 @return BOOL of whether or not the language is right to left
 @warning This method is deprecated and will always return NO
 */
+ (BOOL)isRightToLeft __attribute__((deprecated));

/**
 @abstract Converts a given text direction to its localised format.
 @discussion Used for supporting right to left languages. For example passing NSTextAlignmentLeft when the language is right to left will return NSTextAlignmentRight
 @warning This method is deprecated and will always return the given direction now.
 */
+ (NSTextAlignment)localisedTextDirectionForBaseDirection:(NSTextAlignment)textDirection __attribute__((deprecated));

/**
 @abstract Applies the shared theme to the app
 */
+ (void)customizeAppAppearance;

/**
 @abstract Used to detect if the current device is an iPad
 @returns YES if the device is an iPad
 */
BOOL isPad();

@end