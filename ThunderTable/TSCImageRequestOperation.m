//
//  TSCImageRequest.m
//  Paperboy
//
//  Created by Phillip Caudell on 08/10/2013.
//  Copyright (c) 2013 3SIDEDCUBE. All rights reserved.
//

#import "TSCImageRequestOperation.h"
#import "TSCImageController.h"

@implementation TSCImageRequestOperation

- (void)dealloc
{
}

- (id)init
{
    self = [super init];
    if (self) {
        self.isConcurrent = YES;
    }
    return self;
}

- (void)start
{
    UIImage *cachedImage = [[TSCImageController sharedController] imageFromCacheWithURL:self.imageURL];
    
    if (cachedImage) {
        self.cached = YES;
        self.image = cachedImage;
        [self completeWithError:nil];
    } else {
        
        NSURLRequest *imageURLRequest = [[NSURLRequest alloc] initWithURL:self.imageURL];
        self.connection = [[NSURLConnection alloc] initWithRequest:imageURLRequest delegate:self startImmediately:NO];
        [self.connection scheduleInRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
        [self.connection start];
        
        // Not sure why but without this the operation will never be removed from the queue; should probably work out why
        self.isFinished = YES;
    }
}

- (void)cancel
{
    [self.connection cancel];
}

- (UIImage *)TSC_imageWithData:(NSData *)data
{
    return [UIImage imageWithData:data];
}

#pragma mark Connection delegate

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    if (!self.data) {
        self.data = [[NSMutableData alloc] init];
    }
    
    [self.data appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    if (self.completion) {
        self.completion(nil, error, self.isCached);
    }
    
    [self completeWithError:error];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    self.cached = NO;
    self.image = [self TSC_imageWithData:self.data];
    if (self.image){
        [[TSCImageController sharedController] cacheImage:self.image forImageURL:self.imageURL];
        [self completeWithError:nil];
    } else {
        [self completeWithError:[NSError errorWithDomain:@"org.threesidedcube.thundertable" code:1001 userInfo:@{NSLocalizedDescriptionKey: @"The server did not return a valid image"}]];
    }
}

- (void)completeWithError:(NSError *)error;
{
    self.data = nil;
    self.connection = nil;
    self.isFinished = YES;
    self.isConcurrent = NO;
    
    if (self.completion) {
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            self.completion(self.image, error, self.isCached);
        }];
    }
}

@end
