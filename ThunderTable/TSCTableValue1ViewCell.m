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
    if (self = [super initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuseIdentifier]) {
        
        self.cellDetailTextLabel.textAlignment = NSTextAlignmentRight;
    }
    return self;
}

@end
