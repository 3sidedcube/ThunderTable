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
        
        self.textLabel.numberOfLines = 0;
        self.textLabel.backgroundColor = [UIColor clearColor];
        self.textLabel.font = [[TSCThemeManager sharedTheme] fontOfSize:17];
        
        self.detailTextLabel.numberOfLines = 0;
        self.detailTextLabel.font = [[TSCThemeManager sharedTheme] fontOfSize:14];
        
        self.backgroundColor = [[TSCThemeManager sharedTheme] cellBackgroundColor];
        self.contentView.backgroundColor = [[TSCThemeManager sharedTheme] cellBackgroundColor];
        
        [self.contentView.superview setClipsToBounds:NO];
        self.shouldDisplaySeparators = YES;
    }
    
    return self;
}

//This is really quite awful but it's the only way to get tableview to remove the 1px line at the top of sections on a group tableview when disabling cell seperators
- (void)addSubview:(UIView *)view
{
    if (!self.shouldDisplaySeparators && CGRectGetHeight(view.frame)*[UIScreen mainScreen].scale == 1)
    {
        return;
    }
    
    [super addSubview:view];
}
@end
