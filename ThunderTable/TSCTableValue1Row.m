//
//  TSCTableValue1Row.m
// ThunderTable
//
//  Created by Matt Cheetham on 18/09/2013.
//  Copyright (c) 2013 3 SIDED CUBE. All rights reserved.
//

#import "TSCTableValue1Row.h"
#import "TSCTableValue1ViewCell.h"
#import "TSCThemeManager.h"

@implementation TSCTableValue1Row

#pragma Table Row Data Source

+ (instancetype)rowWithTitle:(NSString *)title
{
    TSCTableValue1Row *row = [[self alloc] init];
    row.title = title;
    row.enabled = YES;
    
    return row;
}

+ (instancetype)rowWithTitle:(NSString *)title subtitle:(NSString *)subtitle image:(UIImage *)image
{
    TSCTableValue1Row *row = [[self alloc] init];
    row.title = title;
    row.subtitle = subtitle;
    row.image = image;
    row.enabled = YES;
    
    return row;
}

+ (instancetype)rowWithTitle:(NSString *)title subtitle:(NSString *)subtitle imageURL:(NSURL *)imageURL
{
    TSCTableValue1Row *row = [[self alloc] init];
    row.title = title;
    row.subtitle = subtitle;
    row.imageURL = imageURL;
    row.enabled = YES;
    
    return row;
}

+ (instancetype)rowWithTitle:(NSString *)title subtitle:(NSString *)subtitle image:(UIImage *)image detailTextColor:(UIColor *)color
{
    return [self rowWithTitle:title subtitle:subtitle image:image detailTextColor:color boldLabel:NO];
}

+ (instancetype)rowWithTitle:(NSString *)title subtitle:(NSString *)subtitle image:(UIImage *)image detailTextColor:(UIColor *)color boldLabel:(BOOL)isBold
{
    TSCTableValue1Row *row = [[self alloc] init];
    row.title = title;
    row.subtitle = subtitle;
    row.image = image;
    row.detailTextColor = color;
    row.isBold = isBold;
    row.enabled = YES;
    
    return row;
}

- (void)addTarget:(id)target selector:(SEL)selector
{
    self.target = target;
    self.selector = selector;
}

#pragma Table Row Data Source

- (float)rowPadding
{
    return 10;
}

- (NSString *)rowTitle
{
    return _title;
}

- (NSString *)rowSubtitle
{
    if ([_subtitle class] != [NSNull class]) {
        return _subtitle;
    }
    
    return @"";
}

- (UIImage *)rowImage
{
    return _image;
}

- (NSURL *)rowImageURL
{
    return _imageURL;
}

- (Class)tableViewCellClass
{
    return [TSCTableValue1ViewCell class];
}

- (id)rowSelectionTarget
{
    return self.target;
}

- (SEL)rowSelectionSelector
{
    return self.selector;
}

- (TSCLink *)rowLink
{
    return self.link;
}

- (BOOL)shouldDisplaySelectionCell
{
    return YES;
}

- (BOOL)shouldDisplaySelectionIndicator
{
    return YES;
}

- (UIColor *)rowTitleTextColor
{
    return self.titleTextColor;
}

- (UIColor *)rowDetailTextColor
{
    return self.detailTextColor;
}

- (UITableViewCell *)tableViewCell:(UITableViewCell *)cell
{
    TSCTableValue1ViewCell *valueCell = (TSCTableValue1ViewCell *)cell;
    
    if (!self.enabled) {
        
        valueCell.cellDetailTextLabel.textColor = self.disabledDetailTextColor ? : [[TSCThemeManager sharedTheme] disabledCellTextColor];
        valueCell.cellTextLabel.textColor = self.disabledTitleTextColor ? : [[TSCThemeManager sharedTheme] disabledCellTextColor];
    }
    
    if (self.isBold) {
        valueCell.cellTextLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:17];
        valueCell.cellDetailTextLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:17];
    }
    
    return valueCell;
}

- (UITableViewCellStyle)cellStyle
{
    return UITableViewCellStyleValue1;
}

@end
