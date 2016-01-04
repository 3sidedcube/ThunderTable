//
//  TSCImageRequest.h
// ThunderTable
//
//  Created by Phillip Caudell on 08/10/2013.
//  Copyright (c) 2013 3SIDEDCUBE. All rights reserved.
//

@import Foundation;
@import UIKit;

@class TSCImageRequest;

/**
 A completion block used when an image request operation has completed
 */
typedef void (^TSCImageRequestCompletion)(UIImage *image, NSError *error, BOOL isCached, TSCImageRequest *request);

/**
 A subclass of NSOperation for making image requests from a URL
 */
@interface TSCImageRequest : NSMutableURLRequest

/**
 @abstract The image returned from the image request
 */
@property (nonatomic, strong, readonly) UIImage *image;

/**
 @abstract The data task created from a certain request
 */
@property (nonatomic, weak) NSURLSessionDataTask *dataTask;

/**
 @abstract Prepares the image request for dispatch
 */
- (void)prepareForDispatch;

@end
