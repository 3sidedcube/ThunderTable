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
+ (BOOL)isRightToLeft;
+ (NSTextAlignment)localisedTextDirectionForBaseDirection:(NSTextAlignment)textDirection;
+ (void)customizeAppAppearance;

BOOL isPad();

@end