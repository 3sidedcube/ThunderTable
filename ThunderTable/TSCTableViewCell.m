//
//  TSCTableViewCell.m
// ThunderTable
//
//  Created by Phillip Caudell on 16/08/2013.
//  Copyright (c) 2013 madebyphill.co.uk. All rights reserved.
//

#import "TSCTableViewCell.h"
#import "TSCThemeManager.h"

@implementation TSCTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.cellStyle = UITableViewCellStyleSubtitle;
        
        self.cellImageView = [UIImageView new];
        [self.contentView addSubview:self.cellImageView];
        
        self.cellTextLabel = [UILabel new];
        self.cellTextLabel.numberOfLines = 0;
        self.cellTextLabel.backgroundColor = [UIColor clearColor];
        self.cellTextLabel.font = [[TSCThemeManager sharedTheme] fontOfSize:17];
        [self.contentView addSubview:self.cellTextLabel];
        
        self.cellDetailTextLabel = [UILabel new];
        self.cellDetailTextLabel.numberOfLines = 0;
        self.cellDetailTextLabel.font = [[TSCThemeManager sharedTheme] fontOfSize:14];
        [self.contentView addSubview:self.cellDetailTextLabel];
        
        self.backgroundColor = [[TSCThemeManager sharedTheme] cellBackgroundColor];
        self.contentView.backgroundColor = [[TSCThemeManager sharedTheme] cellBackgroundColor];
        
        [self.contentView.superview setClipsToBounds:NO];
        self.shouldDisplaySeparators = YES;
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (self.cellImageView.image) {
        
        [self.cellImageView sizeToFit];
        CGRect imageFrame = self.cellImageView.frame;
        imageFrame.origin.x = 12;
        self.cellImageView.frame = imageFrame;
    } else {
        self.cellImageView.frame = CGRectZero;
    }
    
    switch (self.cellStyle) {
        case UITableViewCellStyleSubtitle:
            [self subtitleLayout];
            break;
        case UITableViewCellStyleValue1:
            [self value1Layout];
            break;
        default:
            break;
    }
    
    // Only set the center if we have superview to avoid breaking automatic cell height calculations
    if (self.superview) {
        self.cellImageView.center = CGPointMake(self.cellImageView.center.x, MAX(self.imageView.frame.size.height/2, self.contentView.center.y));
    }
}

- (void)value1Layout
{
    UIEdgeInsets edgeInsets = [self edgeInsets];
    
    CGSize textLabelSize = [self.cellTextLabel sizeThatFits:CGSizeMake(self.contentView.frame.size.width - edgeInsets.left - edgeInsets.right, MAXFLOAT)];
    CGRect textLabelFrame = CGRectMake(edgeInsets.left, edgeInsets.top, textLabelSize.width, textLabelSize.height);
    NSInteger textNumberOfLines = MAX((int)(textLabelFrame.size.height/self.cellTextLabel.font.lineHeight),0);
    
    CGRect remainingRect;
    CGRect slice;
    CGRectDivide(self.contentView.frame, &slice, &remainingRect, textLabelSize.width + edgeInsets.right, CGRectMinXEdge);
    
    CGSize detailLabelSize = [self.cellDetailTextLabel sizeThatFits:CGSizeMake(remainingRect.size.width, MAXFLOAT)];
    remainingRect.size.height = detailLabelSize.height;
    NSInteger detailNumberOfLines = MAX((int)(remainingRect.size.height/self.cellDetailTextLabel.font.lineHeight),0);
    
    if (textNumberOfLines == detailNumberOfLines) {
        
        textLabelFrame.origin.y = self.contentView.frame.size.height / 2 - textLabelFrame.size.height / 2;
        remainingRect.origin.y = self.contentView.frame.size.height / 2 - remainingRect.size.height / 2;
    }
    
    self.cellTextLabel.frame = CGRectIntegral(textLabelFrame);
    self.cellDetailTextLabel.frame = CGRectIntegral(remainingRect);
}

- (void)subtitleLayout
{
    UIEdgeInsets edgeInsets = [self edgeInsets];
    
    CGSize textLabelSize = [self.cellTextLabel sizeThatFits:CGSizeMake(self.contentView.frame.size.width - edgeInsets.left - edgeInsets.right, MAXFLOAT)];
    CGRect textLabelFrame = CGRectMake(edgeInsets.left, edgeInsets.top, self.contentView.frame.size.width - edgeInsets.left - edgeInsets.right, textLabelSize.height);
    
    CGSize detailLabelSize = [self.cellDetailTextLabel sizeThatFits:CGSizeMake(self.contentView.frame.size.width - edgeInsets.left - edgeInsets.right, MAXFLOAT)];
    CGRect detailLabelFrame = CGRectMake(edgeInsets.left, CGRectGetMaxY(textLabelFrame), self.contentView.frame.size.width - edgeInsets.left - edgeInsets.right, detailLabelSize.height);
    
    // If no detail text then center the text label
    if (!self.cellDetailTextLabel.text || [[self.cellDetailTextLabel.text stringByReplacingOccurrencesOfString:@" " withString:@""] isEqualToString:@""]) {
        
        textLabelFrame.origin.y = self.contentView.frame.size.height / 2 - textLabelFrame.size.height / 2;
        
    } else if (self.cellImageView.frame.size.height >= (CGRectGetMaxY(detailLabelFrame) - CGRectGetMinY(textLabelFrame))) { // If image view is larger than both labels put together then centre them
        
        // The required compound rect of both the text + detail text labels
        CGRect compoundRect = CGRectMake(textLabelFrame.origin.x, 0, textLabelFrame.size.width, CGRectGetMaxY(detailLabelFrame) - CGRectGetMinY(textLabelFrame));
        compoundRect.origin.y = self.contentView.frame.size.height / 2 - compoundRect.size.height / 2;
        
        textLabelFrame.origin.y = compoundRect.origin.y;
        detailLabelFrame.origin.y = CGRectGetMaxY(textLabelFrame);
    }
    
    self.cellTextLabel.frame = CGRectIntegral(textLabelFrame);
    self.cellDetailTextLabel.frame = CGRectIntegral(detailLabelFrame);
}

- (UIEdgeInsets)edgeInsets
{
    CGFloat leftIndentation = MAX(self.indentationWidth * (CGFloat)self.indentationLevel, 12);
    if (self.cellImageView.image) {
        leftIndentation = CGRectGetMaxX(self.cellImageView.frame) + leftIndentation;
    }
    
    UIEdgeInsets edgeInsets = UIEdgeInsetsMake(8, leftIndentation, 0, 12);
    
    return edgeInsets;
}

//This is really quite awful but it's the only way to get tableview to remove the 1px line at the top of sections on a group tableview when disabling cell seperators
- (void)addSubview:(UIView *)view
{    
    if (!self.shouldDisplaySeparators && round(CGRectGetHeight(view.frame)*[UIScreen mainScreen].scale) == 1) {
        return;
    }

    [super addSubview:view];
}

- (void)setShouldDisplaySeparators:(BOOL)shouldDisplaySeparators
{
    _shouldDisplaySeparators = shouldDisplaySeparators;
    
    NSMutableArray *viewsToRemove = [NSMutableArray new];
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if (!self.shouldDisplaySeparators && round(CGRectGetHeight(obj.frame)*[UIScreen mainScreen].scale) == 1) {
            [viewsToRemove addObject:obj];
        }
    }];
    
    for (UIView *view in viewsToRemove) {
        [view removeFromSuperview];
    }
}

@end
