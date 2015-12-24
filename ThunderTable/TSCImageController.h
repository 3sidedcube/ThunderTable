//
//  TSCImageManager.h
// ThunderTable
//
//  Created by Phillip Caudell on 08/10/2013.
//  Copyright (c) 2013 3SIDEDCUBE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSCImageRequest.h"

/**
 A controller which helps with the loading and caching of images from sources other than the app's bundle
 */
@interface TSCImageController : NSObject

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
- (TSCImageRequest *)imageRequestOperationWithImageURL:(NSURL *)imageURL completion:(TSCImageRequestCompletion)completion;

/**
 Cancels a currently running image request
 @param request The request to cancel
 */
- (void)cancelImageRequest:(TSCImageRequest *)request;


@end
