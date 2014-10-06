//
//  TSCThemeManager.m
//  American Red Cross Disaster
//
//  Created by Phillip Caudell on 16/08/2013.
//  Copyright (c) 2013 madebyphill.co.uk. All rights reserved.
//

#import "TSCThemeManager.h"
#import "TSCDefaultTheme.h"
#import "TSCCheckView.h"

@implementation TSCThemeManager

static id <TSCTheme> sharedController = nil;

+ (id <TSCTheme>)sharedTheme
{
    @synchronized(self) {
        
        if (!sharedController) {
            sharedController = [[TSCDefaultTheme alloc] init];
        }
    }
    
    return sharedController;
}

+ (void)setSharedTheme:(id <TSCTheme>)theme
{
    @synchronized(self) {
        sharedController = theme;
//        [self customizeAppAppearance];
    }
}

+ (void)customizeAppAppearance
{
    id <TSCTheme> theme = [self sharedTheme];
    
//    if (![TSCThemeManager isOS7]){
//        
//        UIColor *color = [[TSCThemeManager sharedTheme] mainColor];
//        
//        color = [UIColor colorWithHue:color.hue saturation:color.saturation brightness:color.brightness - 0.3 alpha:1.0];
//        
//        [[UIProgressView appearance] setProgressTintColor:color];
//        
//        [[UINavigationBar appearance] setTintColor:[[TSCThemeManager sharedTheme] mainColor]];
//        
//        
//        UITabBar *tabBar = [UITabBar appearance];
//        [tabBar setSelectedImageTintColor:[theme mainColor]];
//        [tabBar setTintColor:[UIColor colorWithWhite:0.2 alpha:1.0]];
//        
//        [UITabBarItem.appearance setTitleTextAttributes:@{
//                                                          UITextAttributeTextColor : [UIColor colorWithWhite:0.64 alpha:1.0] } forState:UIControlStateNormal];
//        
//        [UITabBarItem.appearance setTitleTextAttributes:@{
//                                                          UITextAttributeTextColor : [theme mainColor] }     forState:UIControlStateSelected];
//        
//        return;
//    }
    
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
//    
//    //Set a bar tint if we have one. Set the tint otherwise
//    if (![TSCDeveloperController isDevMode]) {
//        
//        if([UIImage imageNamed:@"UINavigationBar-bg"]){
//            
//            [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"UINavigationBar-bg"] forBarMetrics:UIBarMetricsDefault];
//            
//        } else {
//            
//            [[UINavigationBar appearance] setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
//            [[UINavigationBar appearance] setBarTintColor:[[TSCThemeManager sharedTheme] mainColor]];
//            
//        }
//        
//    } else {
    
//        [[UINavigationBar appearance] setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
//        [[UINavigationBar appearance] setBarTintColor:[[TSCThemeManager sharedTheme] mainColor]];
    
//    }
    
    //Set back button tint && title text color
//    [[UINavigationBar appearance] setTintColor:[[TSCThemeManager sharedTheme] titleTextColor]];
//    
//    NSMutableDictionary *titleBarAttributes = [NSMutableDictionary dictionaryWithDictionary:[[UINavigationBar appearance] titleTextAttributes]];
//    [titleBarAttributes setValue:[[TSCThemeManager sharedTheme] titleTextColor] forKey:NSForegroundColorAttributeName];
//    [[UINavigationBar appearance] setTitleTextAttributes:titleBarAttributes];
}

+ (BOOL)isOS7
{
    if (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_6_1) {
        return NO;
    } else {
        return YES;
    }
}

+ (NSTextAlignment)localisedTextDirectionForBaseDirection:(NSTextAlignment)textDirection
{
    return textDirection;
//    NSLocaleLanguageDirection languageDirection = [NSLocale characterDirectionForLanguage:[[[TSCLanguageController sharedController] currentLocale] objectForKey:NSLocaleLanguageCode]];
//    
//    if(textDirection == NSTextAlignmentLeft){
//        
//        if(languageDirection == NSLocaleLanguageDirectionLeftToRight){
//            
//            return NSTextAlignmentLeft;
//            
//        } else if(languageDirection == NSLocaleLanguageDirectionRightToLeft){
//            
//            return NSTextAlignmentRight;
//            
//        }
//        
//    } else if(textDirection == NSTextAlignmentRight){
//        
//        if(languageDirection == NSLocaleLanguageDirectionLeftToRight){
//            
//            return NSTextAlignmentRight;
//            
//        } else if(languageDirection == NSLocaleLanguageDirectionRightToLeft){
//            
//            return NSTextAlignmentLeft;
//            
//        }
//    }
//    
//    return textDirection;
}
//
+ (BOOL)isRightToLeft
{
    return NO;
//    NSLocaleLanguageDirection languageDirection = [NSLocale characterDirectionForLanguage:[[[TSCLanguageController sharedController] currentLocale] objectForKey:NSLocaleLanguageCode]];
//
//    if(languageDirection == NSLocaleLanguageDirectionRightToLeft){
//        return YES;
//    } else {
//        return NO;
//    }
}

BOOL isPad() {
    
    if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad ) {
        return YES;
    }
    
    return NO;
}

@end