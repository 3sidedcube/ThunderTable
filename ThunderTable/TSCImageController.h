//
//  TSCImageManager.h
// ThunderTable
//
//  Created by Phillip Caudell on 08/10/2013.
//  Copyright (c) 2013 3SIDEDCUBE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSCImageRequestOperation.h"

/**
 A controller which helps with the loading and caching of images from sources other than the app's bundle
 */
@interface TSCImageController : NSOperationQueue

/**
 Provides a share instance of `TSCImageController` for performing image requests
 */
+ (instancetype)sharedController;

/**
 Creates and begins a request for an image at a given URL
 @param imageURL The URL to pull the image from
 @param completion A block of code called once the image has been pulled from the given URL
 @discussion Once the request has completed the image data will be stored in `imageCache` for quicker loading the next time the image from this URL is needed
 */
- (TSCImageRequestOperation *)imageRequestOperationWithImageURL:(NSURL *)imageURL completion:(TSCImageRequestOperationCompletion)completion;

/**
 Returns an image from `imageCache` for a certain URL
 @param imageURL The image to pull from cached images
 @discussion If an image for the url passed to this method hasn't been cached will return nil
 */
- (UIImage *)imageFromCacheWithURL:(NSURL *)imageURL;

/**
 Stores an image in `imageCache` for a certain URL
 @param image The image to store in the cache
 @param imageURL The image url to store in the image cache
 */
- (void)cacheImage:(UIImage *)image forImageURL:(NSURL *)imageURL;

/**
 @abstract The cache of `UIImage`s currently stored
 */
@property (nonatomic, strong) NSCache *imageCache;



@end
