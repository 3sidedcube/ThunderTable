//
//  TSCTableValue1ViewCell.m
//  ThunderStorm
//
//  Created by Matt Cheetham on 18/09/2013.
//  Copyright (c) 2013 3 SIDED CUBE. All rights reserved.
//

#import "TSCTableValue1ViewCell.h"

@implementation TSCTableValue1ViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuseIdentifier]) {
        
        self.textLabel.numberOfLines = 0;
        self.textLabel.backgroundColor = [UIColor clearColor];
        self.detailTextLabel.numberOfLines = 0;
        
    }
    
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

@end
