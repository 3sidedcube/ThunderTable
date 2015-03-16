//
//  UIImageView+TSCImageView.h
// ThunderTable
//
//  Created by Phillip Caudell on 08/10/2013.
//  Copyright (c) 2013 3SIDEDCUBE. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kCurrentRequestOperationKey @"currentImageRequestOperation"

/**
 Category on `UIImageView` which works with `TSCImageController` to dynamically load the `UIImage` for the view from a URL
 */
@interface UIImageView (TSCImageView)

/**
 Loads the image from a certain URL and upon completion sets `self.image` to the returned image
 @param imageURL The URL to load the image from
 @param placeholderImage The image to use as a placeholder for the loading image
 @discussion Once the image has loaded from the URL it will be displayed at the same size as the placeholderImage so make sure that placeholderImage is the same size as the returned image. Not doing so causes strange frame behaviour in `UITableViewCell` subclasses
 */
- (void)setImageURL:(NSURL *)imageURL placeholderImage:(UIImage *)placeholderImage;

/**
 Loads the image from a certain URL and upon completion sets `self.image` to the returned image
 @param imageURL The URL to load the image from
 @param placeholderImage The image to use as a placeholder for the loading image
 @param animated If true animates the change between placeholderImage an the image at the given URL using a crossfade
 @discussion Once the image has loaded from the URL it will be displayed at the same size as the placeholderImage so make sure that placeholderImage is the same size as the returned image. Not doing so causes strange frame behaviour in `UITableViewCell` subclasses
 */
- (void)setImageURL:(NSURL *)imageURL placeholderImage:(UIImage *)placeholderImage animated:(BOOL)animated;

@end
