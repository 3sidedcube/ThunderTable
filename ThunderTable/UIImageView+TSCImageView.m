//
//  UIImageView+TSCImageView.m
//  Paperboy
//
//  Created by Phillip Caudell on 08/10/2013.
//  Copyright (c) 2013 3SIDEDCUBE. All rights reserved.
//

#import "UIImageView+TSCImageView.h"
#import "TSCImageController.h"
#import <objc/runtime.h>

@implementation UIImageView (TSCImageView)

- (void)setImageURL:(NSURL *)imageURL placeholderImage:(UIImage *)placeholderImage animated:(BOOL)animated
{
    [self TSC_cancelCurrentRequestOperation];
    
    self.contentMode = UIViewContentModeScaleAspectFill;
    self.image = placeholderImage;
    
    TSCImageRequestOperation *operation = [[TSCImageController sharedController] imageRequestOperationWithImageURL:imageURL completion:^(UIImage *image, NSError *error, BOOL isCached) {
        
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
    
    [self TSC_setCurrentImageRequestOperation:operation];
}

- (void)setImageURL:(NSURL *)imageURL placeholderImage:(UIImage *)placeholderImage
{
    [self setImageURL:imageURL placeholderImage:placeholderImage animated:NO];
}

#pragma Helper methods

- (void)TSC_cancelCurrentRequestOperation
{
    TSCImageRequestOperation *operation = [self TSC_currentImageRequestOperation];
    
    if (operation) {
        [operation cancel];
        [self TSC_setCurrentImageRequestOperation:nil];
    }
}

- (void)TSC_setCurrentImageRequestOperation:(TSCImageRequestOperation *)operation
{
    objc_setAssociatedObject(self, kCurrentRequestOperationKey, operation, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (TSCImageRequestOperation *)TSC_currentImageRequestOperation
{
    return objc_getAssociatedObject(self, kCurrentRequestOperationKey);
}

@end
