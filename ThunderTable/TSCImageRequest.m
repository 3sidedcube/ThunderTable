//
//  TSCImageRequest.m
// ThunderTable
//
//  Created by Phillip Caudell on 08/10/2013.
//  Copyright (c) 2013 3SIDEDCUBE. All rights reserved.
//

#import "TSCImageRequest.h"
#import "TSCImageController.h"

@interface TSCImageRequest ()

@property (nonatomic, strong, readwrite) UIImage *image;
@property (nonatomic, assign, readwrite, getter = isCached) BOOL cached;

@end

@implementation TSCImageRequest

- (void)prepareForDispatch
{
    self.HTTPMethod = @"GET";
    
    UIImage *cachedImage = [[TSCImageController sharedController] imageFromCacheWithURL:self.URL];
    
    if (cachedImage) {
        
        self.cached = true;
        self.image = cachedImage;
    }
}

- (UIImage *)TSC_imageWithData:(NSData *)data
{
    return [UIImage imageWithData:data];
}

@end
