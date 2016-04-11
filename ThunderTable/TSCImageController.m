//
//  TSCImageManager.m
// ThunderTable
//
//  Created by Phillip Caudell on 08/10/2013.
//  Copyright (c) 2013 3SIDEDCUBE. All rights reserved.
//

#import "TSCImageController.h"

@interface TSCImageController () <NSURLSessionTaskDelegate>

/**
 @abstract The operation queue that contains all requests added to a default session
 */
@property (nonatomic, strong) NSOperationQueue *defaultRequestQueue;

/**
 @abstract Uses persistent disk-based cache and stores credentials in the user's keychain
 */
@property (nonatomic, strong) NSURLSession *defaultSession;

/**
 @abstract A dictionary of completion handlers to be called when file downloads are complete
 */
@property (nonatomic, strong) NSMutableDictionary *completionHandlerDictionary;


@end

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
    self = [super init];
    if (self) {
        
        self.defaultRequestQueue = [NSOperationQueue new];
        
        NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
        self.defaultSession = [NSURLSession sessionWithConfiguration:defaultConfigObject delegate:self delegateQueue:self.defaultRequestQueue];
        
        self.completionHandlerDictionary = [NSMutableDictionary dictionary];
        
        NSURLCache *URLCache = [[NSURLCache alloc] initWithMemoryCapacity:50 * 1024 * 1024
                                                             diskCapacity:200 * 1024 * 1024
                                                                 diskPath:@"TSC_cached_images"];
        self.defaultSession.configuration.URLCache = URLCache;
        self.defaultSession.configuration.requestCachePolicy = NSURLRequestReturnCacheDataElseLoad;
    }
    return self;
}

- (TSCImageRequest *)imageRequestOperationWithImageURL:(NSURL *)imageURL completion:(TSCImageRequestCompletion)completion
{
    TSCImageRequest *request = [[TSCImageRequest alloc] init];
    request.URL = imageURL;
    request.cachePolicy = NSURLRequestReturnCacheDataElseLoad;
    [self scheduleRequest:request completion:completion];
    return request;
}

- (void)cancelImageRequest:(TSCImageRequest *)request
{
    [request.dataTask cancel];
}

- (void)scheduleRequest:(TSCImageRequest *)request completion:(TSCImageRequestCompletion)completion
{
    // Check OAuth status before making the request
    __weak typeof(self) welf = self;
    [request prepareForDispatch];
    
    if (request.image) {
        
        if (completion) {
            completion(request.image, nil, true, request);
        }
        return;
    }
    
    request.dataTask = [welf.defaultSession dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        //Notify of errors
        if (data && [UIImage imageWithData:data]) {
            
            if (completion) {
                
                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                    
                    completion([UIImage imageWithData:data], nil, false, request);
                    
                }];
            }
            
        } else {
            
            if (completion) {
                
                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                    completion(nil, error ? : [NSError errorWithDomain:@"org.threesidedcube.thundertable" code:1001 userInfo:@{NSLocalizedDescriptionKey: @"The server did not return a valid image"}], false, request);
                }];
            }
        }
        
    }];
    
    [request.dataTask resume];
}

@end
