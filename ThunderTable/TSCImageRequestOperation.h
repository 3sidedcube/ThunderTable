//
//  TSCImageRequest.h
// ThunderTable
//
//  Created by Phillip Caudell on 08/10/2013.
//  Copyright (c) 2013 3SIDEDCUBE. All rights reserved.
//

@import Foundation;
@import UIKit;

typedef void (^TSCImageRequestOperationCompletion)(UIImage *image, NSError *error, BOOL isCached);

@interface TSCImageRequestOperation : NSOperation <NSURLConnectionDelegate, NSURLConnectionDataDelegate>

@property (nonatomic, strong) NSURL *imageURL;
@property (nonatomic, strong) NSURLConnection *connection;
@property (nonatomic, strong) NSMutableData *data;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, assign, getter = isCached) BOOL cached;

@property (nonatomic, assign) BOOL isConcurrent;
@property (nonatomic, assign) BOOL isFinished;

@property (nonatomic, strong) TSCImageRequestOperationCompletion completion;

@end
