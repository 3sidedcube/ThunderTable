//
//  TSCTableRow.h
//  American Red Cross Disaster
//
//  Created by Phillip Caudell on 16/08/2013.
//  Copyright (c) 2013 madebyphill.co.uk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSCTableRowDataSource.h"

@interface TSCTableRow : NSObject <TSCTableRowDataSource>

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *subtitle;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) NSURL *imageURL;
@property (nonatomic, strong) UIImage *imagePlaceholder;
@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, weak) id target;
@property (nonatomic, assign) SEL selector;
@property (nonatomic, strong) TSCLink *link;
@property (nonatomic) BOOL shouldCenterText;
@property (nonatomic) BOOL shouldInsetTextLabel;
@property (nonatomic, assign) BOOL shouldDisplaySelectionIndicator;

+ (id)rowWithTitle:(NSString *)title;
+ (id)rowWithTitle:(NSString *)title textColor:(UIColor *)textColor;
+ (id)rowWithTitle:(NSString *)title subtitle:(NSString *)subtitle image:(UIImage *)image;
+ (id)rowWithTitle:(NSString *)title subtitle:(NSString *)subtitle imageURL:(NSURL *)imageURL;
- (void)addTarget:(id)target selector:(SEL)selector;

@end
