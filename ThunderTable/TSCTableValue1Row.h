//
//  TSCTableValue1Row.h
//  ThunderStorm
//
//  Created by Matt Cheetham on 18/09/2013.
//  Copyright (c) 2013 3 SIDED CUBE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSCTableRowDataSource.h"

@interface TSCTableValue1Row : NSObject <TSCTableRowDataSource>

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) NSURL *imageURL;
@property (nonatomic, strong) UIColor *detailTextColor;
@property (nonatomic) BOOL enabled;
@property (nonatomic) BOOL isBold;
@property (nonatomic, weak) id target;
@property (nonatomic, assign) SEL selector;
@property (nonatomic, strong) TSCLink *link;

+ (id)rowWithTitle:(NSString *)title;
+ (id)rowWithTitle:(NSString *)title subtitle:(NSString *)subtitle image:(UIImage *)image;
+ (id)rowWithTitle:(NSString *)title subtitle:(NSString *)subtitle image:(UIImage *)image detailTextColor:(UIColor *)color;
+ (id)rowWithTitle:(NSString *)title subtitle:(NSString *)subtitle image:(UIImage *)image detailTextColor:(UIColor *)color boldLabel:(BOOL)isBold;
+ (id)rowWithTitle:(NSString *)title subtitle:(NSString *)subtitle imageURL:(NSURL *)imageURL;
- (void)addTarget:(id)target selector:(SEL)selector;

@end
