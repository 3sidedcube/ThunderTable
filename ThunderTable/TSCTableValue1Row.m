//
//  TSCTableValue1Row.m
//  ThunderStorm
//
//  Created by Matt Cheetham on 18/09/2013.
//  Copyright (c) 2013 3 SIDED CUBE. All rights reserved.
//

#import "TSCTableValue1Row.h"
#import "TSCTableValue1ViewCell.h"
#import "TSCThemeManager.h"

@implementation TSCTableValue1Row

#pragma Table Row Data Source

+ (id)rowWithTitle:(NSString *)title
{
    TSCTableValue1Row *row = [[TSCTableValue1Row alloc] init];
    row.title = title;
    row.enabled = YES;
    
    return row;
}

+ (id)rowWithTitle:(NSString *)title subtitle:(NSString *)subtitle image:(UIImage *)image
{
    TSCTableValue1Row *row = [[TSCTableValue1Row alloc] init];
    row.title = title;
    row.subtitle = subtitle;
    row.image = image;
    row.enabled = YES;
    
    return row;
}

+ (id)rowWithTitle:(NSString *)title subtitle:(NSString *)subtitle imageURL:(NSURL *)imageURL
{
    TSCTableValue1Row *row = [[TSCTableValue1Row alloc] init];
    row.title = title;
    row.subtitle = subtitle;
    row.imageURL = imageURL;
    row.enabled = YES;
    
    return row;
}

+ (id)rowWithTitle:(NSString *)title subtitle:(NSString *)subtitle image:(UIImage *)image detailTextColor:(UIColor *)color
{
    return [self rowWithTitle:title subtitle:subtitle image:image detailTextColor:color boldLabel:NO];
}

+ (id)rowWithTitle:(NSString *)title subtitle:(NSString *)subtitle image:(UIImage *)image detailTextColor:(UIColor *)color boldLabel:(BOOL)isBold
{
    TSCTableValue1Row *row = [[TSCTableValue1Row alloc] init];
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

//- (CGFloat)tableViewCellHeightConstrainedToSize:(CGSize)contrainedSize;
//{
//    return 44;
//}

- (UITableViewCell *)tableViewCell:(UITableViewCell *)cell
{
    TSCTableValue1ViewCell *valueCell = (TSCTableValue1ViewCell *)cell;
    
    if (self.enabled) {
        
        valueCell.detailTextLabel.textColor = self.detailTextColor;
        valueCell.textLabel.textColor = [UIColor blackColor];
    } else {
        
        valueCell.detailTextLabel.textColor = [[TSCThemeManager sharedTheme] disabledCellTextColor];
        valueCell.textLabel.textColor = [[TSCThemeManager sharedTheme] disabledCellTextColor];
    }
    
    if (self.isBold) {
        valueCell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:17];
        valueCell.detailTextLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:17];
    }
    
    return valueCell;
}

@end
