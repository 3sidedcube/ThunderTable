//
//  TSCTheme.h
//  American Red Cross Disaster
//
//  Created by Phillip Caudell on 16/08/2013.
//  Copyright (c) 2013 madebyphill.co.uk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol TSCTheme <NSObject>

- (UIColor *)mainColor;
- (UIColor *)backgroundColor;
- (UIColor *)freeTextColor;
- (UIColor *)headerTextColor;
- (UIColor *)tableCellBackgroundColor;
- (UIColor *)tableSeperatorColor;
- (UIColor *)primaryLabelColor;
- (UIFont *)primaryLabelFont;
- (UIColor *)secondaryLabelColor;
- (UIFont *)secondaryLabelFont;
- (UIColor *)detailLabelColor;
- (UIFont *)detailLabelFont;
- (UIColor *)defaultTableViewCellBackgroundColor;
- (UIColor *)titleTextColor;
- (UIColor *)disabledCellTextColor;
- (UIColor *)redColor;
- (UIColor *)yellowColor;
- (UIColor *)greenColor;
- (UIColor *)blueColor;
- (UIColor *)darkBlueColor;

@end