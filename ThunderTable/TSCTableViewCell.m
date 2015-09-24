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
    }
    
    return self;
}

@end
