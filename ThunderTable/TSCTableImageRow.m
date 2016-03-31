//
//  TSCTableImageRow.m
// ThunderTable
//
//  Created by Phillip Caudell on 29/08/2013.
//  Copyright (c) 2013 madebyphill.co.uk. All rights reserved.
//

#import "TSCTableImageRow.h"
#import "TSCTableImageViewCell.h"

@interface TSCTableImageRow ()

@property (nonatomic, assign) float scale;

@end

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

+ (id)rowWithImage:(UIImage *)image contentMode:(UIViewContentMode)contentMode scale:(float)scale
{
    TSCTableImageRow *row = [[self alloc] init];
    row.image = image;
    row.contentMode = contentMode;
    row.scale = scale;
    
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
    
    if (self.scale) {
        return (self.image.size.height / self.scale) / scaleFactor;
    }
    
    return self.image.size.height / scaleFactor;
}

- (Class)tableViewCellClass
{
    return [TSCTableImageViewCell class];
}

- (TSCTableViewCell *)tableViewCell:(TSCTableViewCell *)cell
{
    cell.cellImageView.backgroundColor = self.backgroundColor;
    cell.cellImageView.contentMode = self.contentMode;
    
    return cell;
}

@end
