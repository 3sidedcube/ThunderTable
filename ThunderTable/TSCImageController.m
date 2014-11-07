//
//  TSCImageManager.m
//  Paperboy
//
//  Created by Phillip Caudell on 08/10/2013.
//  Copyright (c) 2013 3SIDEDCUBE. All rights reserved.
//

#import "TSCImageController.h"

@implementation TSCImageController

static TSCImageController *sharedController = nil;

+ (TSCImageController *)sharedController
{
    @synchronized(self) {
        if (sharedController == nil) {
            sharedController = [[self alloc] init];
        }
    }
    return sharedController;
}

- (id)init
{
    if (self = [super init]) {
        self.imageCache = [[NSCache alloc] init];
        self.maxConcurrentOperationCount = 30;
    }
    
    return self;
}

- (TSCImageRequestOperation *)imageRequestOperationWithImageURL:(NSURL *)imageURL completion:(TSCImageRequestOperationCompletion)completion
{
    TSCImageRequestOperation *operation = [[TSCImageRequestOperation alloc] init];
    operation.imageURL = imageURL;
    operation.completion = completion;
    [self addOperation:operation];
    return operation;
}

- (void)cacheImage:(UIImage *)image forImageURL:(NSURL *)imageURL;
{
    [self.imageCache setObject:image forKey:[self TSC_cacheKeyWithURL:imageURL]];
}

- (UIImage *)imageFromCacheWithURL:(NSURL *)imageURL
{
    return [self.imageCache objectForKey:[self TSC_cacheKeyWithURL:imageURL]];
}

- (NSString *)TSC_cacheKeyWithURL:(NSURL *)url
{
    return url.absoluteString;
}

@end
