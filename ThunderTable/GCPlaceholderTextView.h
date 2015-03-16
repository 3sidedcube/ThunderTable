//
//  GCPlaceholderTextView.h
//  GCLibrary
//
//  Created by Guillaume Campagna on 10-11-16.
//  Copyright 2010 LittleKiwi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GCPlaceholderTextView : UITextView 

@property (nonatomic, copy) NSString *placeholder;
@property (nonatomic, strong) UIColor *placeholderColor;

@end
