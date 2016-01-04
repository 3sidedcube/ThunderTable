//
//  UIImageView+TSCImageView.m
//  ThunderTable
//
//  Created by Phillip Caudell on 08/10/2013.
//  Copyright (c) 2013 3SIDEDCUBE. All rights reserved.
//

#import "UIImageView+TSCImageView.h"
#import "TSCImageController.h"
#import <objc/runtime.h>

#define kFinalSizeKey @"finalSize"
#define kCurrentRequestOperationsKey @"currentImageRequestOperations"
#define kImageURLsKey @"imageURLs"
#define kShowingPlaceholder @"showingPlaceholder"

@interface UIImageView ()

@property (nonatomic, strong) NSMutableArray <TSCImageRequest *> *imageRequests;

@property (nonatomic, strong) NSArray <NSURL *> *imageURLs;

@property (nonatomic, assign) BOOL showingPlaceholder;

@end

@implementation UIImageView (TSCImageView)

#pragma mark - Individual URL

- (void)setImageURL:(NSURL *)imageURL placeholderImage:(UIImage *)placeholderImage
{
    [self setImageURL:imageURL placeholderImage:placeholderImage completion:nil];
}

- (void)setImageURL:(NSURL *)imageURL placeholderImage:(UIImage *)placeholderImage animated:(BOOL)animated
{
    [self setImageURL:imageURL placeholderImage:placeholderImage animated:animated completion:nil];
}

- (void)setImageURL:(NSURL *)imageURL placeholderImage:(UIImage *)placeholderImage imageSize:(CGSize)size
{
    [self setImageURL:imageURL placeholderImage:placeholderImage imageSize:size completion:nil];
}

- (void)setImageURL:(NSURL *)imageURL placeholderImage:(UIImage *)placeholderImage completion:(TSCImageViewSetImageURLCompletion)completion
{
    [self setImageURL:imageURL placeholderImage:placeholderImage animated:NO completion:completion];
    [self setFinalSize:CGSizeZero];
}

- (void)setImageURL:(NSURL *)imageURL placeholderImage:(UIImage *)placeholderImage imageSize:(CGSize)size completion:(TSCImageViewSetImageURLCompletion)completion
{
    [self setImageURL:imageURL placeholderImage:placeholderImage completion:completion];
    [self setFinalSize:size];
}

- (void)setImageURL:(NSURL *)imageURL placeholderImage:(UIImage *)placeholderImage animated:(BOOL)animated completion:(TSCImageViewSetImageURLCompletion)completion
{
    [self TSC_cancelCurrentRequestOperation];
    [self TSC_setCurrentCompletion:completion];
    
    self.image = placeholderImage;
    
    __weak typeof(self) welf = self;
    
    if (imageURL) {
        
        TSCImageRequest *request = [[TSCImageController sharedController] imageRequestOperationWithImageURL:imageURL completion:^(UIImage *image, NSError *error, BOOL isCached, TSCImageRequest *imageRequest) {
            
            if (image) {
                welf.image = image;
            }
            
            if (animated && !isCached) {
                
                CATransition *transition = [CATransition animation];
                transition.type = kCATransitionFade;
                transition.duration = 0.25;
                [welf.layer addAnimation:transition forKey:nil];
            }
            
            [welf TSC_setCurrentImageRequestOperation:nil];
            
            if ([welf TSC_currentCompletion]) {
                [welf TSC_currentCompletion](image, error, isCached);
            }
            
            [welf TSC_setCurrentCompletion:nil];
        }];
        
        [self TSC_setCurrentImageRequestOperation:request];
    } else {
        
        if ([self TSC_currentCompletion]) {
            [self TSC_currentCompletion](nil, [NSError errorWithDomain:@"org.threesidedcube.thundertable" code:404 userInfo:@{NSLocalizedDescriptionKey: @"No image url was provided"}], false);
        }
        [self TSC_setCurrentCompletion:nil];
    }
}


#pragma mark - multiple image urls

- (void)setImageURLs:(NSArray<NSURL *> *)imageURLs placeholderImage:(UIImage *)placeholderImage
{
    [self setImageURLs:imageURLs placeholderImage:placeholderImage completion:nil];
}

- (void)setImageURLs:(NSArray<NSURL *> *)imageURLs placeholderImage:(UIImage *)placeholderImage animated:(BOOL)animated
{
    [self setImageURLs:imageURLs placeholderImage:placeholderImage animated:animated completion:nil];
}

- (void)setImageURLs:(NSArray<NSURL *> *)imageURLs placeholderImage:(UIImage *)placeholderImage imageSize:(CGSize)size
{
    [self setImageURLs:imageURLs placeholderImage:placeholderImage imageSize:size completion:nil];
}

- (void)setImageURLs:(NSArray<NSURL *> *)imageURLs placeholderImage:(UIImage *)placeholderImage completion:(TSCImageViewSetImageURLCompletion)completion
{
    [self setImageURLs:imageURLs placeholderImage:placeholderImage animated:true completion:completion];
}

- (void)setImageURLs:(NSArray<NSURL *> *)imageURLs placeholderImage:(UIImage *)placeholderImage imageSize:(CGSize)size completion:(TSCImageViewSetImageURLCompletion)completion
{
    [self setImageURLs:imageURLs placeholderImage:placeholderImage animated:true completion:completion];
    [self setFinalSize:size];
}

- (void)setImageURLs:(NSArray<NSURL *> *)imageURLs placeholderImage:(UIImage *)placeholderImage animated:(BOOL)animated completion:(TSCImageViewSetImageURLCompletion)completion
{
    [self TSC_cancelCurrentRequestOperations];
    [self TSC_setCurrentCompletion:completion];
    
    self.image = placeholderImage;
    self.showingPlaceholder = true;
    
    self.imageURLs = imageURLs;
    
    if (imageURLs) {
        
        __weak typeof(self) welf = self;
        
        NSMutableArray *imageRequests = [NSMutableArray new];
        
        for (NSURL *imageURL in self.imageURLs) {
            
            TSCImageRequest *request = [[TSCImageController sharedController] imageRequestOperationWithImageURL:imageURL completion:^(UIImage *image, NSError *error, BOOL isCached, TSCImageRequest *imageRequest) {
                
                // Replace the current image
                if (image.size.width > welf.image.size.width || welf.showingPlaceholder) {
                    NSLog(@"image is placeholder : %i", welf.showingPlaceholder);
                    welf.showingPlaceholder = false;
                    welf.image = image;
                }
                
                if (animated && !isCached) {
                    
                    CATransition *transition = [CATransition animation];
                    transition.type = kCATransitionFade;
                    transition.duration = 0.25;
                    [welf.layer addAnimation:transition forKey:nil];
                }
                
                if ([welf.imageRequests containsObject:imageRequest]) {
                
                    NSUInteger requestIndex = [welf.imageRequests indexOfObject:imageRequest];
                    
                    // Cancel lower resolution requests if there are any!
                    [welf.imageRequests enumerateObjectsUsingBlock:^(TSCImageRequest * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                        
                        if (idx < requestIndex) {
                            
                            [[TSCImageController sharedController] cancelImageRequest:obj];
                            [welf.imageRequests removeObject:obj];
                        }
                        
                    }];
                    
                    // Remove this image request from the queued requests
                    [welf.imageRequests removeObject:imageRequest];
                    
                }
                
                // If no remaining requests, then call the completion
                if (welf.imageRequests.count == 0) {
                    
                    [welf TSC_cancelCurrentRequestOperations];
                    welf.imageURLs = nil;
                    
                    if ([welf TSC_currentCompletion]) {
                        [welf TSC_currentCompletion](image, error, isCached);
                    }
                    
                    [welf TSC_setCurrentCompletion:nil];
                }
                
            }];
            
            [imageRequests addObject:request];
            
        }
        
        self.imageRequests = imageRequests;
        
    } else {
        
        if ([self TSC_currentCompletion]) {
            [self TSC_currentCompletion](nil, [NSError errorWithDomain:@"org.threesidedcube.thundertable" code:404 userInfo:@{NSLocalizedDescriptionKey: @"No image url was provided"}], false);
        }
        [self TSC_setCurrentCompletion:nil];
    }

}

#pragma mark - sizing

- (CGSize)finalSize
{
    NSValue *sizeValue = objc_getAssociatedObject(self, kFinalSizeKey);
    
    if ([sizeValue respondsToSelector:@selector(CGSizeValue)]) {
        return [sizeValue CGSizeValue];
    } else {
        return CGSizeZero;
    }
    
    return CGSizeZero;
}

- (void)setFinalSize:(CGSize)finalSize
{
    objc_setAssociatedObject(self, kFinalSizeKey, [NSValue valueWithCGSize:finalSize], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma Helper methods

- (void)TSC_cancelCurrentRequestOperation
{
    TSCImageRequest *request = [self TSC_currentImageRequestOperation];
    
    if (request) {
        
        
        [[TSCImageController sharedController] cancelImageRequest:request];
        [self TSC_setCurrentImageRequestOperation:nil];
    }
}

- (void)TSC_cancelCurrentRequestOperations
{
    for (TSCImageRequest *request in self.imageRequests) {
        [[TSCImageController sharedController] cancelImageRequest:request];
    }

    self.imageRequests = nil;
}

- (void)setImageURLs:(NSArray<NSURL *> *)imageURLs
{
    objc_setAssociatedObject(self, kImageURLsKey, imageURLs, OBJC_ASSOCIATION_RETAIN);
}

- (NSArray <NSURL *> *)imageURLs
{
    return objc_getAssociatedObject(self, kImageURLsKey);
}

- (void)setImageRequests:(NSArray<TSCImageRequest *> *)imageRequests
{
    objc_setAssociatedObject(self, kCurrentRequestOperationsKey, imageRequests, OBJC_ASSOCIATION_RETAIN);
}

- (NSArray <TSCImageRequest *> *)imageRequests
{
    return objc_getAssociatedObject(self, kCurrentRequestOperationsKey);
}

- (void)setShowingPlaceholder:(BOOL)showingPlaceholder
{
    objc_setAssociatedObject(self, kShowingPlaceholder, @(showingPlaceholder), OBJC_ASSOCIATION_COPY);
}

- (BOOL)showingPlaceholder
{
    id placeholder = objc_getAssociatedObject(self, kShowingPlaceholder);
    
    if (placeholder && [placeholder isKindOfClass:[NSNumber class]]) {
        return [placeholder boolValue];
    }
    
    return false;
}

- (void)TSC_setCurrentImageRequestOperation:(TSCImageRequest *)operation
{
    objc_setAssociatedObject(self, kCurrentRequestOperationKey, operation, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (TSCImageRequest *)TSC_currentImageRequestOperation
{
    return objc_getAssociatedObject(self, kCurrentRequestOperationKey);
}

- (void)TSC_setCurrentCompletion:(TSCImageViewSetImageURLCompletion)completion
{
    objc_setAssociatedObject(self, kCurrentCompletionKey, completion, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (TSCImageViewSetImageURLCompletion)TSC_currentCompletion
{
    return objc_getAssociatedObject(self, kCurrentCompletionKey);
}

- (CGSize)intrinsicContentSize
{
    return CGSizeEqualToSize([self finalSize], CGSizeZero) ? [super intrinsicContentSize]: [self finalSize];
}

@end
