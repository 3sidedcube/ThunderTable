//
//  TSCThemeManager.h
//  American Red Cross Disaster
//
//  Created by Phillip Caudell on 16/08/2013.
//  Copyright (c) 2013 madebyphill.co.uk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSCTheme.h"

@interface TSCThemeManager : NSObject

+ (id <TSCTheme>)sharedTheme;
+ (void)setSharedTheme:(id <TSCTheme>)theme;
+ (BOOL)isOS7;
+ (BOOL)isOS8;
+ (BOOL)isRightToLeft __attribute__((deprecated));
+ (NSTextAlignment)localisedTextDirectionForBaseDirection:(NSTextAlignment)textDirection __attribute__((deprecated));
+ (void)customizeAppAppearance;

BOOL isPad();

@end