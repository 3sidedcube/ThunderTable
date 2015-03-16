//
//  TSCTableInputSliderRow.m
//  ThunderTable
//
//  Created by Sam Houghton on 11/03/2014.
//  Copyright (c) 2014 3 SIDED CUBE. All rights reserved.
//

#import "TSCTableInputSliderRow.h"
#import "TSCTableInputSliderViewCell.h"

@interface TSCTableInputSliderRow ()

@property (nonatomic, strong) NSNumber *sliderMinValue;
@property (nonatomic, strong) NSNumber *sliderMaxValue;
@property (nonatomic, strong) NSNumber *currentValue;

@end

@implementation TSCTableInputSliderRow

+ (instancetype)rowWithTitle:(NSString *)title inputId:(NSString *)inputId minValue:(NSNumber *)minValue maxValue:(NSNumber *)maxValue currentValue:(NSNumber *)currentValue required:(BOOL)required
{
    TSCTableInputSliderRow *row = [[TSCTableInputSliderRow alloc] init];
    row.title = [title capitalizedString];
    row.inputId = inputId;
    row.required = required;
    row.sliderMinValue = minValue;
    row.sliderMaxValue = maxValue;
    row.currentValue = currentValue;
    
    return row;
}

- (NSString *)rowTitle
{
    return self.title;
}

- (Class)tableViewCellClass
{
    return [TSCTableInputSliderViewCell class];
}

- (UITableViewCell *)tableViewCell:(UITableViewCell *)cell
{
    TSCTableInputSliderViewCell *inputCell = (TSCTableInputSliderViewCell *)cell;
    inputCell.slider.minimumValue = [self.sliderMinValue floatValue];
    inputCell.slider.maximumValue = [self.sliderMaxValue floatValue];
    [inputCell.slider setValue:[self.currentValue floatValue] animated:YES];
    
    return inputCell;
}

- (NSNumber *)maximumValue
{
    return self.sliderMaxValue;
}

- (NSNumber *)minimumValue
{
    return self.sliderMinValue;
}

@end
