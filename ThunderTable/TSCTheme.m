//
//  TSCDefaultTheme.m
//  ThunderStorm
//
//  Created by Phillip Caudell on 26/09/2013.
//  Copyright (c) 2013 3 SIDED CUBE. All rights reserved.
//

#import "TSCTheme.h"

@implementation TSCTheme

- (UIColor *)mainColor
{
    return [UIColor colorWithRed:0.894 green:0.000 blue:0.010 alpha:1.000];
}

- (UIColor *)secondaryColor
{
    return [UIColor colorWithWhite:0.25 alpha:1.0];
}

- (UIColor *)primaryLabelColor
{
    return [UIColor blackColor];
}

- (UIColor *)cellBackgroundColor
{
    return [UIColor whiteColor];
}

- (UIColor *)cellTitleColor
{
    return [UIColor blackColor];
}

- (UIColor *)cellDetailColor
{
    return [UIColor lightGrayColor];
}

- (UIColor *)detailLabelColor
{
    return [UIColor darkGrayColor];
}

- (UIColor *)secondaryLabelColor
{
    return [UIColor lightGrayColor];
}

- (UIColor *)backgroundColor
{
    return [UIColor groupTableViewBackgroundColor];
}

- (UIColor *)freeTextColor
{
    return [self mainColor];
}

- (UIColor *)headerTextColor
{
    return [UIColor blackColor];
}

- (UIColor *)tableSeperatorColor
{
    return [UIColor colorWithRed:0.78 green:0.78 blue:0.8 alpha:1];
}

- (UIFont *)primaryLabelFont
{
    return [UIFont systemFontOfSize:[UIFont systemFontSize]];
}

- (UIFont *)secondaryLabelFont
{
    return [UIFont systemFontOfSize:[UIFont systemFontSize]];
}

- (UIFont *)titleLabelFont
{
    return [UIFont systemFontOfSize:[UIFont systemFontSize]];
}

- (UIFont *)detailLabelFont
{
    return [UIFont systemFontOfSize:[UIFont systemFontSize]];
}

- (UIFont *)lightFontOfSize:(CGFloat)size
{
    return [UIFont fontWithName:@"HelveticaNeue-Light" size:size];
}

- (UIFont *)fontOfSize:(CGFloat)size
{
    return [UIFont systemFontOfSize:size];
}

- (UIFont *)mediumFontOfSize:(CGFloat)size
{
    return [UIFont fontWithName:@"HelveticaNeue-Medium" size:size];
}

- (UIFont *)boldFontOfSize:(CGFloat)size
{
    return [UIFont boldSystemFontOfSize:size];
}

- (UIColor *)redColor
{
    return [UIColor redColor];
}

- (UIColor *)yellowColor
{
    return [UIColor yellowColor];
}

- (UIColor *)greenColor
{
    return [UIColor greenColor];
}

- (UIColor *)blueColor
{
    return [UIColor blueColor];
}

- (UIColor *)darkBlueColor
{
    return [UIColor colorWithRed:5.0f / 255.0f green:56.0f / 255.0f blue:115.0f / 255.0f alpha:1.0];
}

- (UIColor *)titleTextColor
{
    return [UIColor blackColor];
}

- (UIColor *)disabledCellTextColor
{
    return [UIColor colorWithWhite:0.6 alpha:0.6];
}

- (UIColor *)progressTrackTintColour
{
    return [UIColor colorWithWhite:0.683 alpha:1.000];
}

- (UIColor *)progressTintColour
{
    return [UIColor whiteColor];
}

- (UIColor *)navigationBarBackgroundColor
{
    return [self mainColor];
}

- (UIColor *)navigationBarTintColor
{
    return [UIColor whiteColor];
}

@end
