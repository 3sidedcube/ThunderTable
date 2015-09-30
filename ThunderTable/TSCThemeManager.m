//
//  TSCThemeManager.m
// ThunderTable
//
//  Created by Phillip Caudell on 16/08/2013.
//  Copyright (c) 2013 madebyphill.co.uk. All rights reserved.
//

#import "TSCThemeManager.h"
#import "TSCTheme.h"
#import "TSCCheckView.h"

@implementation TSCThemeManager

static id sharedController = nil;

+ (TSCTheme *)sharedTheme
{
    @synchronized(self) {
        
        if (!sharedController) {
            sharedController = [[TSCTheme alloc] init];
        }
    }
    
    return sharedController;
}

+ (void)setSharedTheme:(TSCTheme *)theme
{
    @synchronized(self) {
        sharedController = theme;
    }
}

+ (void)customizeAppAppearance
{
    TSCTheme *theme = [self sharedTheme];
    
    UINavigationBar *navigationBar = [UINavigationBar appearance];
    
    [navigationBar setTintColor:[theme mainColor]];
    
    UIToolbar *toolbar = [UIToolbar appearance];
    [toolbar setTintColor:[theme mainColor]];
    
    UITabBar *tabBar = [UITabBar appearance];
    [tabBar setSelectedImageTintColor:[theme mainColor]];
    [tabBar setTintColor:[theme mainColor]];
    
    
    UISwitch *switchView = [UISwitch appearance];
    [switchView setOnTintColor:[theme mainColor]];
    
    TSCCheckView *checkView = [TSCCheckView appearance];
    [checkView setOnTintColor:[theme mainColor]];

}

+ (BOOL)isOS7
{
    
    switch ([[[UIDevice currentDevice] systemVersion] compare:@"7.0.0" options:NSNumericSearch]) {
        case NSOrderedSame:
            return true;
            break;
        case NSOrderedDescending:
            return true;
        default:
            return false;
            break;
    }
}

+ (BOOL)isOS8
{
    switch ([[[UIDevice currentDevice] systemVersion] compare:@"8.0" options:NSNumericSearch]) {
        case NSOrderedSame:
        case NSOrderedDescending:
            return true;
            break;
        case NSOrderedAscending:
            return false;
            break;
        default:
            return false;
            break;
    }
}

+ (NSTextAlignment)localisedTextDirectionForBaseDirection:(NSTextAlignment)textDirection
{
    return textDirection;
}

+ (BOOL)isRightToLeft
{
    return NO;
}

BOOL TSC_isPad() {
    
    if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad ) {
        return YES;
    }
    
    return NO;
}

@end