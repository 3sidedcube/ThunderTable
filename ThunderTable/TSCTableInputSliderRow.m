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

@property (nonatomic, copy) NSNumber *sliderMinValue;
@property (nonatomic, copy) NSNumber *sliderMaxValue;
@property (nonatomic, copy) NSNumber *currentValue;

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
	
	NSString *stringValue = self.formatter ? [self.formatter stringForObjectValue:@(self.currentValue.floatValue ?: inputCell.slider.value)] : [NSString stringWithFormat:@"%.1f", self.currentValue.floatValue ?: inputCell.slider.value];
	
	inputCell.valueLabel.text = stringValue;
	inputCell.interval = self.sliderInterval ?: @(1.0);
	inputCell.formatter = self.formatter;
	
	[inputCell handleSliderValueChanged:inputCell.slider];
    
    [self updateTargetsAndActionsForControl:inputCell.slider];
    [inputCell.slider addTarget:inputCell action:@selector(handleSliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    
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

- (NSNumber *)sliderInterval
{
    return self.sliderIntervalValue;
}

@end
