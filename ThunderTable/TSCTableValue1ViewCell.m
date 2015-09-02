//
//  TSCTableValue1ViewCell.m
// ThunderTable
//
//  Created by Matt Cheetham on 18/09/2013.
//  Copyright (c) 2013 3 SIDED CUBE. All rights reserved.
//

#import "TSCTableValue1ViewCell.h"
#import "TSCThemeManager.h"

@implementation TSCTableValue1ViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.textLabel.numberOfLines = 0;
        self.textLabel.backgroundColor = [UIColor clearColor];
        self.detailTextLabel.numberOfLines = 0;
        
        self.separatorTopView = [UIView new];
        self.separatorTopView.backgroundColor = [[TSCThemeManager sharedTheme] tableSeperatorColor];
        [self.contentView addSubview:self.separatorTopView];
        
        self.separatorTopView = [UIView new];
        self.separatorTopView.backgroundColor = [[TSCThemeManager sharedTheme] tableSeperatorColor];
        [self.contentView addSubview:self.separatorTopView];
        
        self.separatorBottomView = [UIView new];
        self.separatorBottomView.backgroundColor = [[TSCThemeManager sharedTheme] tableSeperatorColor];
        [self.contentView addSubview:self.separatorBottomView];
        
        self.backgroundColor = [[TSCThemeManager sharedTheme] cellBackgroundColor];
        self.contentView.backgroundColor = [[TSCThemeManager sharedTheme] cellBackgroundColor];
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)] == YES && [[UIScreen mainScreen] scale] == 1.00) {
        self.separatorTopView.frame = CGRectMake(0, 0, self.bounds.size.width, 1);
        self.separatorBottomView.frame = CGRectMake(0, self.bounds.size.height, self.bounds.size.width, 1);
    } else {
        self.separatorTopView.frame = CGRectMake(0, 0, self.bounds.size.width, 0.5);
        self.separatorBottomView.frame = CGRectMake(0, self.bounds.size.height, self.bounds.size.width, 0.5);
    }
    
    self.shouldDisplaySeparators = true;
}

- (void)setShouldDisplaySeparators:(BOOL)shouldDisplaySeparators
{
    _shouldDisplaySeparators = shouldDisplaySeparators;
    
    self.separatorTopView.hidden = !shouldDisplaySeparators;
    self.separatorBottomView.hidden = !shouldDisplaySeparators;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

@end
