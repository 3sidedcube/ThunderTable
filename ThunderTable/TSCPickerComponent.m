//
//  TSCPickerComponent.m
//  ThunderTable
//
//  Created by Joel Trew on 03/06/2015.
//  Copyright (c) 2015 3 SIDED CUBE. All rights reserved.
//

@import UIKit;
#import "TSCPickerComponent.h"
#import "TSCPickerRow.h"

@implementation TSCPickerComponent

+ (instancetype)componentWithItems:(NSArray *)items spacer:(NSString *)spacer
{
    TSCPickerComponent *component = [self new];
    component.items = items;
    component.spacer = spacer;
    return component;
}

+ (instancetype)componentWithItems:(NSArray *)items
{
    TSCPickerComponent *component = [self new];
    component.items = items;
    return component;
}

+ (instancetype)componentWithMinimumValue:(NSNumber *)minValue maxValue:(NSNumber *)maxValue increment:(NSNumber *)increment
{
    
    CGFloat minValueFloat = [minValue floatValue];
    CGFloat maxValueFloat = [maxValue floatValue];
    CGFloat incrementFloat = [increment floatValue];
    NSMutableArray *rows = [NSMutableArray new];
    NSString *formatString = @"%.f";

    CGFloat floatValue = [increment floatValue];
    NSInteger digits = 0;
    while (fmodf(floatValue, 1) > 0) {
        
        floatValue *= 10;
        digits++;
    }
    
    if (digits > 0) {
        formatString = [NSString stringWithFormat:@"%%.%lif",(long)digits];
    }
    

    
    for (CGFloat i = minValueFloat; i <= (maxValueFloat + (digits==0 ? 0 : incrementFloat)); i += incrementFloat){
        
        TSCPickerRow *row = [TSCPickerRow rowWithTitle:[NSString stringWithFormat:formatString,i]];
        [rows addObject:row];
    }
    TSCPickerComponent *component = [TSCPickerComponent componentWithItems:rows];
    return component;
}

- (NSArray *)componentItems
{
    return self.items;
}

- (NSString *)componentSpacer
{
    return self.spacer;
}

@end
