//
//  TSCTableViewCell.m
//  American Red Cross Disaster
//
//  Created by Phillip Caudell on 16/08/2013.
//  Copyright (c) 2013 madebyphill.co.uk. All rights reserved.
//

#import "TSCTableViewCell.h"
#import "TSCThemeManager.h"

@implementation TSCTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier]) {
        
        self.textLabel.numberOfLines = 0;
        self.textLabel.backgroundColor = [UIColor clearColor];
        
        self.detailTextLabel.numberOfLines = 0;
        self.detailTextLabel.font = [UIFont systemFontOfSize:14];
        self.detailTextLabel.textColor = [UIColor grayColor];
        
        self.separatorTopView = [UIView new];
        self.separatorTopView.backgroundColor = [[TSCThemeManager sharedTheme] tableSeperatorColor];
        [self.contentView addSubview:self.separatorTopView];
        
        self.separatorBottomView = [UIView new];
        self.separatorBottomView.backgroundColor = [[TSCThemeManager sharedTheme] tableSeperatorColor];
        [self.contentView addSubview:self.separatorBottomView];
        
        [self.contentView.superview setClipsToBounds:NO];
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.separatorTopView.frame = CGRectMake(0, 0, self.bounds.size.width, 0.5);
    self.separatorBottomView.frame = CGRectMake(0, self.bounds.size.height, self.bounds.size.width, 0.5);
}

- (void)setShouldDisplaySeparators:(BOOL)shouldDisplaySeparators
{
    _shouldDisplaySeparators = shouldDisplaySeparators;
    
    self.separatorTopView.hidden = !shouldDisplaySeparators;
    self.separatorBottomView.hidden = !shouldDisplaySeparators;
}

@end
