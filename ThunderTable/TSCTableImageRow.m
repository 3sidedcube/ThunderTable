//
//  TSCTableImageRow.m
// ThunderTable
//
//  Created by Phillip Caudell on 29/08/2013.
//  Copyright (c) 2013 madebyphill.co.uk. All rights reserved.
//

#import "TSCTableImageRow.h"
#import "TSCTableImageViewCell.h"

@implementation TSCTableImageRow

+ (id)rowWithImage:(UIImage *)image
{
    TSCTableImageRow *row = [[self alloc] init];
    row.image = image;
    
    return row;
}

+ (id)rowWithImageURL:(NSURL *)url placeholderImage:(UIImage *)placeholderImage
{
    TSCTableImageRow *row = [[self alloc] init];
    row.image = placeholderImage;
    row.imageURL = url;
    
    return row;
}

+ (id)rowWithImage:(UIImage *)image contentMode:(UIViewContentMode)contentMode
{
    TSCTableImageRow *row = [[self alloc] init];
    row.image = image;
    row.contentMode = contentMode;
    
    return row;
}

+ (id)rowWithImage:(UIImage *)image backgroundColor:(UIColor *)backgroundColor
{
    TSCTableImageRow *row = [[self alloc] init];
    row.image = image;
    row.backgroundColor = backgroundColor;
    
    return row;
}

- (UIImage *)rowImage
{
    return self.image;
}

- (CGFloat)tableViewCellHeightConstrainedToContentViewSize:(CGSize)contentViewSize tableViewSize:(CGSize)tableViewSize
{
    CGFloat scaleFactor = self.image.size.width / tableViewSize.width;
    
    return self.image.size.height / scaleFactor;
}

- (Class)tableViewCellClass
{
    return [TSCTableImageViewCell class];
}

- (UITableViewCell *)tableViewCell:(UITableViewCell *)cell
{
    cell.imageView.backgroundColor = self.backgroundColor;
    cell.imageView.contentMode = self.contentMode;
    
    return cell;
}

@end
