//
//  TSCTableInputCheckViewCell.m
// ThunderTable
//
//  Created by Phillip Caudell on 27/09/2013.
//  Copyright (c) 2013 3 SIDED CUBE. All rights reserved.
//

#import "TSCTableInputCheckViewCell.h"
#import "TSCTableInputCheckViewCell.h"
#import "TSCTableSelection.h"
#import "TSCTableInputRow.h"
#import "TSCCheckView.h"
#import "TSCThemeManager.h"

@interface TSCTableInputCheckViewCell ()

@property (nonatomic, assign) BOOL hasAdded;

@end

@implementation TSCTableInputCheckViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.checkView = [[TSCCheckView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
        [self.contentView addSubview:self.checkView];
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self.checkView action:@selector(handleTap:)];
        [self.contentView addGestureRecognizer:tapGesture];
        
    }
    
    return self;
}

- (void)prepareForReuse
{
    [super prepareForReuse];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.checkView.frame = CGRectMake(10, self.contentView.bounds.size.height / 2 - 15, 30, 30);
    
    CGRect textLabelFrame = self.cellTextLabel.frame;
    textLabelFrame.origin.x = self.checkView.frame.size.width + 20;
    
    if ((textLabelFrame.origin.x + textLabelFrame.size.width) > self.contentView.frame.size.width) {
        textLabelFrame.size.width -= ((textLabelFrame.origin.x + textLabelFrame.size.width) - self.contentView.frame.size.width) + 10;
    }
    
    self.cellTextLabel.frame = textLabelFrame;
    
    UIView *sampleFrame = [[UIView alloc] initWithFrame:CGRectMake(18, 0, 30, 30)];
    
    CGPoint textOffset = CGPointMake(sampleFrame.frame.size.width + sampleFrame.frame.origin.x, sampleFrame.frame.origin.y);
    CGSize textConstrainedSize = CGSizeMake(self.contentView.frame.size.width - textOffset.x, MAXFLOAT);
    CGSize textLabelSize = [self.cellTextLabel sizeThatFits:textConstrainedSize];
    
    self.cellTextLabel.frame = CGRectMake(textOffset.x, textOffset.y + 5, textLabelSize.width, textLabelSize.height + 5);
    self.cellTextLabel.frame = CGRectMake(textOffset.x, textOffset.y + 5, textLabelSize.width, textLabelSize.height + 5);
    self.cellTextLabel.center = CGPointMake(self.cellTextLabel.center.x, self.contentView.center.y);
}

@end