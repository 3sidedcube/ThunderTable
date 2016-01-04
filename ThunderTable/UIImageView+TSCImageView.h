//
//  UIImageView+TSCImageView.h
// ThunderTable
//
//  Created by Phillip Caudell on 08/10/2013.
//  Copyright (c) 2013 3SIDEDCUBE. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^TSCImageViewSetImageURLCompletion) (UIImage *image, NSError *error, BOOL cached);

#define kCurrentRequestOperationKey @"currentImageRequestOperation"
#define kCurrentCompletionKey @"currentImageRequestCompletion"

/**
 Category on `UIImageView` which works with `TSCImageController` to dynamically load the `UIImage` for the view from a URL
 */
@interface UIImageView (TSCImageView)

#pragma mark - Individual URL

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
 @param size The size of the final image which will be loaded from the URL
 @discussion Once the image has loaded from the URL it will be displayed at the same size as the placeholderImage so make sure that placeholderImage is the same size as the returned image. Not doing so causes strange frame behaviour in `UITableViewCell` subclasses
 */
- (void)setImageURL:(NSURL *)imageURL placeholderImage:(UIImage *)placeholderImage imageSize:(CGSize)size;

/**
 Loads the image from a certain URL and upon completion sets `self.image` to the returned image
 @param imageURL The URL to load the image from
 @param placeholderImage The image to use as a placeholder for the loading image
 @param animated If true animates the change between placeholderImage an the image at the given URL using a crossfade
 @discussion Once the image has loaded from the URL it will be displayed at the same size as the placeholderImage so make sure that placeholderImage is the same size as the returned image. Not doing so causes strange frame behaviour in `UITableViewCell` subclasses
 */
- (void)setImageURL:(NSURL *)imageURL placeholderImage:(UIImage *)placeholderImage animated:(BOOL)animated;

/**
 Loads the image from a certain URL and upon completion sets `self.image` to the returned image
 @param imageURL The URL to load the image from
 @param placeholderImage The image to use as a placeholder for the loading image
 @param completion A completion block which is called when the image has been loaded from the URL
 @discussion Once the image has loaded from the URL it will be displayed at the same size as the placeholderImage so make sure that placeholderImage is the same size as the returned image. Not doing so causes strange frame behaviour in `UITableViewCell` subclasses
 */
- (void)setImageURL:(NSURL *)imageURL placeholderImage:(UIImage *)placeholderImage completion:(TSCImageViewSetImageURLCompletion)completion;

/**
 Loads the image from a certain URL and upon completion sets `self.image` to the returned image
 @param imageURL The URL to load the image from
 @param placeholderImage The image to use as a placeholder for the loading image
 @param size The size of the final image which will be loaded from the URL
 @param completion A completion block which is called when the image has been loaded from the URL
 @discussion Once the image has loaded from the URL it will be displayed at the same size as the placeholderImage so make sure that placeholderImage is the same size as the returned image. Not doing so causes strange frame behaviour in `UITableViewCell` subclasses
 */
- (void)setImageURL:(NSURL *)imageURL placeholderImage:(UIImage *)placeholderImage imageSize:(CGSize)size completion:(TSCImageViewSetImageURLCompletion)completion;

/**
 Loads the image from a certain URL and upon completion sets `self.image` to the returned image
 @param imageURL The URL to load the image from
 @param placeholderImage The image to use as a placeholder for the loading image
 @param animated If true animates the change between placeholderImage an the image at the given URL using a crossfade
 @param completion A completion block which is called when the image has been loaded from the URL
 @discussion Once the image has loaded from the URL it will be displayed at the same size as the placeholderImage so make sure that placeholderImage is the same size as the returned image. Not doing so causes strange frame behaviour in `UITableViewCell` subclasses
 */
- (void)setImageURL:(NSURL *)imageURL placeholderImage:(UIImage *)placeholderImage animated:(BOOL)animated completion:(TSCImageViewSetImageURLCompletion)completion;

#pragma mark - Multiple image URLs

/**
 Loads the images in order from an array of URLs replacing the image of the UIImageView with a recursively higher quality image
 @param imageURLs The array of URLs to load into the UIImageView
 @param placeholderImage The image to use as a placeholder for the loading image
 */
- (void)setImageURLs:(NSArray <NSURL *> *)imageURLs placeholderImage:(UIImage *)placeholderImage;

/**
 Loads the images in order from an array of URLs replacing the image of the UIImageView with a recursively higher quality image
 @param imageURLs The array of URLs to load into the UIImageView
 @param placeholderImage The image to use as a placeholder for the loading image
 @param size The size of the final image which will be loaded from the URL
 */
- (void)setImageURLs:(NSArray <NSURL *> *)imageURLs placeholderImage:(UIImage *)placeholderImage imageSize:(CGSize)size;

/**
 Loads the images in order from an array of URLs replacing the image of the UIImageView with a recursively higher quality image
 @param imageURLs The array of URLs to load into the UIImageView
 @param placeholderImage The image to use as a placeholder for the loading image
 @param animated If true animates the change between placeholderImage an the image at the given URL using a crossfade
 */
- (void)setImageURLs:(NSArray <NSURL *> *)imageURLs placeholderImage:(UIImage *)placeholderImage animated:(BOOL)animated;

/**
 Loads the images in order from an array of URLs replacing the image of the UIImageView with a recursively higher quality image
 @param imageURLs The array of URLs to load into the UIImageView
 @param placeholderImage The image to use as a placeholder for the loading image
 @param completion A completion block which is called when the image has been loaded from the URLs
 */
- (void)setImageURLs:(NSArray <NSURL *> *)imageURLs placeholderImage:(UIImage *)placeholderImage completion:(TSCImageViewSetImageURLCompletion)completion;

/**
 Loads the images in order from an array of URLs replacing the image of the UIImageView with a recursively higher quality image
 @param imageURLs The array of URLs to load into the UIImageView
 @param placeholderImage The image to use as a placeholder for the loading image
 @param size The size of the final image which will be loaded from the URL
 @param completion A completion block which is called when the image has been loaded from the URLs
 */
- (void)setImageURLs:(NSArray <NSURL *> *)imageURLs placeholderImage:(UIImage *)placeholderImage imageSize:(CGSize)size completion:(TSCImageViewSetImageURLCompletion)completion;

/**
 Loads the images in order from an array of URLs replacing the image of the UIImageView with a recursively higher quality image
 @param imageURLs The array of URLs to load into the UIImageView
 @param placeholderImage The image to use as a placeholder for the loading image
 @param animated If true animates the change between placeholderImage an the image at the given URL using a crossfade
 @param completion A completion block which is called when the image has been loaded from the URLs
 */
- (void)setImageURLs:(NSArray <NSURL *> *)imageURLs placeholderImage:(UIImage *)placeholderImage animated:(BOOL)animated completion:(TSCImageViewSetImageURLCompletion)completion;

/**
 Sets the final size of the image, once it has been loaded from the URL
 @param finalSize The final size which the image will be displayed at
 */
- (void)setFinalSize:(CGSize)finalSize;

@end
