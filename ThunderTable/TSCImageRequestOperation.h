//
//  TSCImageRequest.h
// ThunderTable
//
//  Created by Phillip Caudell on 08/10/2013.
//  Copyright (c) 2013 3SIDEDCUBE. All rights reserved.
//

@import Foundation;
@import UIKit;

/**
 A completion block used when an image request operation has completed
 */
typedef void (^TSCImageRequestOperationCompletion)(UIImage *image, NSError *error, BOOL isCached);

/**
 A subclass of NSOperation for making image requests from a URL
 */
@interface TSCImageRequestOperation : NSOperation <NSURLConnectionDelegate, NSURLConnectionDataDelegate>

/**
 @abstract The URL for the image we want to request
 */
@property (nonatomic, strong) NSURL *imageURL;

/**
 @abstract The `NSURLConnection` which is created for requesting the image
 */
@property (nonatomic, strong, readonly) NSURLConnection *connection;

/**
 @abstract The data currently returned for the image request operation
 */
@property (nonatomic, strong, readonly) NSMutableData *data;

/**
 @abstract The image returned from the image request
 */
@property (nonatomic, strong, readonly) UIImage *image;

/**
 @abstract Whether or not the image has been saved in the `TSCImageController`'s `imageCache`
 */
@property (nonatomic, assign, readonly, getter = isCached) BOOL cached;

/**
 @abstract Whether or not the image request should be run concurrently (At the same time)
 */
@property (nonatomic, assign) BOOL isConcurrent;

/**
 @abstract Whether or not the image request has finished
 @warning Do not set this to true until the request completion block has been called
 */
@property (nonatomic, assign) BOOL isFinished;

/**
 @abstract A block of code to be called once the image request has completed
 */
@property (nonatomic, strong) TSCImageRequestOperationCompletion completion;

@end
