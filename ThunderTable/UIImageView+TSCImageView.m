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

@implementation UIImageView (TSCImageView)

- (void)setImageURL:(NSURL *)imageURL placeholderImage:(UIImage *)placeholderImage animated:(BOOL)animated
{
    [self TSC_cancelCurrentRequestOperation];
    
    self.image = placeholderImage;
    
    if (imageURL) {
        
        TSCImageRequest *request = [[TSCImageController sharedController] imageRequestOperationWithImageURL:imageURL completion:^(UIImage *image, NSError *error, BOOL isCached) {
            
            if (image) {
                self.image = image;
            }
            
            if (animated && !isCached) {
                
                CATransition *transition = [CATransition animation];
                transition.type = kCATransitionFade;
                transition.duration = 0.25;
                [self.layer addAnimation:transition forKey:nil];
            }
            
            [self TSC_setCurrentImageRequestOperation:nil];
        }];
        
        [self TSC_setCurrentImageRequestOperation:request];
    }
}

- (void)setImageURL:(NSURL *)imageURL placeholderImage:(UIImage *)placeholderImage
{
    [self setImageURL:imageURL placeholderImage:placeholderImage animated:NO];
    [self setFinalSize:CGSizeZero];
}

- (void)setImageURL:(NSURL *)imageURL placeholderImage:(UIImage *)placeholderImage imageSize:(CGSize)size
{
    [self setImageURL:imageURL placeholderImage:placeholderImage];
    [self setFinalSize:size];
}

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

- (void)TSC_setCurrentImageRequestOperation:(TSCImageRequest *)operation
{
    objc_setAssociatedObject(self, kCurrentRequestOperationKey, operation, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (TSCImageRequest *)TSC_currentImageRequestOperation
{
    return objc_getAssociatedObject(self, kCurrentRequestOperationKey);
}

- (CGSize)intrinsicContentSize
{
    return CGSizeEqualToSize([self finalSize], CGSizeZero) ? [super intrinsicContentSize]: [self finalSize];
}

@end
