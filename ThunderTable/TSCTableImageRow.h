//
//  TSCTableImageRow.h
//  American Red Cross Disaster
//
//  Created by Phillip Caudell on 29/08/2013.
//  Copyright (c) 2013 madebyphill.co.uk. All rights reserved.
//

#import "TSCTableRow.h"

@interface TSCTableImageRow : TSCTableRow

@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) UIColor *backgroundColor;
@property (nonatomic) UIViewContentMode contentMode;

+ (id)rowWithImage:(UIImage *)image;
+ (id)rowWithImage:(UIImage *)image contentMode:(UIViewContentMode)contentMode;
+ (id)rowWithImage:(UIImage *)image backgroundColor:(UIColor *)backgroundColor;
+ (id)rowWithImageURL:(NSURL *)url placeholderImage:(UIImage *)placeholderImage;

@end
