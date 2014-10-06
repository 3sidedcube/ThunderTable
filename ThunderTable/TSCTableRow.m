//
//  TSCTableRow.m
//  American Red Cross Disaster
//
//  Created by Phillip Caudell on 16/08/2013.
//  Copyright (c) 2013 madebyphill.co.uk. All rights reserved.
//

#import "TSCTableRow.h"
#import "TSCTableViewCell.h"

@implementation TSCTableRow

-(id)init {
    self = [super init];
    if (self) {
        self.shouldCenterText = NO;
        self.shouldDisplaySelectionIndicator = YES;
    }
    return self;
}

+ (id)rowWithTitle:(NSString *)title
{
    TSCTableRow *row = [[TSCTableRow alloc] init];
    row.title = title;
    
    return row;
}

+ (id)rowWithTitle:(NSString *)title textColor:(UIColor *)textColor
{
    TSCTableRow *row = [[TSCTableRow alloc] init];
    row.title = title;
    row.textColor = textColor;
    
    return row;
}

+ (id)rowWithTitle:(NSString *)title subtitle:(NSString *)subtitle image:(UIImage *)image
{
    TSCTableRow *row = [[TSCTableRow alloc] init];
    row.title = title;
    row.subtitle = subtitle;
    row.image = image;
    
    return row;
}

+ (id)rowWithTitle:(NSString *)title subtitle:(NSString *)subtitle imageURL:(NSURL *)imageURL
{
    TSCTableRow *row = [[TSCTableRow alloc] init];
    row.title = title;
    row.subtitle = subtitle;
    row.imageURL = imageURL;
    
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
    return _subtitle;
}

- (UIImage *)rowImage
{
    return _image;
}

- (NSURL *)rowImageURL
{
    return _imageURL;
}

- (UIImage *)rowImagePlaceholder
{
    return _imagePlaceholder;
}

- (Class)tableViewCellClass
{
    return [TSCTableViewCell class];
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
    return _shouldDisplaySelectionIndicator;
}

- (UITableViewCell *)tableViewCell:(UITableViewCell *)cell;
{
    TSCTableViewCell *standardCell = (TSCTableViewCell *)cell;
    
    if (self.textColor) {
        standardCell.textLabel.textColor = self.textColor;
    }
    
    return standardCell;
}

@end
