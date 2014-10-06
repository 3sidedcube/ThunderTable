//
//  TSCImageManager.h
//  Paperboy
//
//  Created by Phillip Caudell on 08/10/2013.
//  Copyright (c) 2013 3SIDEDCUBE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSCImageRequestOperation.h"

@interface TSCImageController : NSOperationQueue

@property (nonatomic, strong) NSCache *imageCache;

+ (TSCImageController *)sharedController;
- (TSCImageRequestOperation *)imageRequestOperationWithImageURL:(NSURL *)imageURL completion:(TSCImageRequestOperationCompletion)completion;
- (UIImage *)imageFromCacheWithURL:(NSURL *)imageURL;
- (void)cacheImage:(UIImage *)image forImageURL:(NSURL *)imageURL;

@end
