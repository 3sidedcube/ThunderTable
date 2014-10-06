//
//  UIImageView+TSCImageView.h
//  Paperboy
//
//  Created by Phillip Caudell on 08/10/2013.
//  Copyright (c) 2013 3SIDEDCUBE. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kCurrentRequestOperationKey @"currentImageRequestOperation"

@interface UIImageView (TSCImageView)

- (void)setImageURL:(NSURL *)imageURL placeholderImage:(UIImage *)placeholderImage;
- (void)setImageURL:(NSURL *)imageURL placeholderImage:(UIImage *)placeholderImage animated:(BOOL)animated;

@end
