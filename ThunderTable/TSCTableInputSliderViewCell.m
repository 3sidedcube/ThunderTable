//
//  TSCTableInputSliderViewCell.m
//  ThunderTable
//
//  Created by Sam Houghton on 11/03/2014.
//  Copyright (c) 2014 3 SIDED CUBE. All rights reserved.
//

#import "TSCTableInputSliderViewCell.h"
#import "TSCTableInputSliderRow.h"
#import "TSCTableInputSliderRowDataSource.h"
#import "TSCThemeManager.h"

@interface TSCTableInputSliderViewCell ()

@property (nonatomic, copy) NSString *originalTitle;

@end

@implementation TSCTableInputSliderViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.slider = [[UISlider alloc] init];
        [self.slider addTarget:self action:@selector(handleSliderValueChanged:) forControlEvents:UIControlEventValueChanged];
        [self.contentView addSubview:self.slider];
        
        self.valueLabel = [UILabel new];
        self.valueLabel.backgroundColor = [[TSCThemeManager sharedTheme] mainColor];
        self.valueLabel.textAlignment = NSTextAlignmentCenter;
        self.valueLabel.textColor = [UIColor whiteColor];
        self.valueLabel.layer.cornerRadius = 5;
        self.valueLabel.layer.masksToBounds = YES;
        [self.contentView addSubview:self.valueLabel];
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    NSString *stringValue = [NSString stringWithFormat:@"%.1f", self.displayNumber.floatValue ?: self.slider.value];
    self.valueLabel.text = stringValue;
    
    CGSize valueLabelSize = [self.valueLabel sizeThatFits:CGSizeMake(self.contentView.bounds.size.width, self.contentView.bounds.size.height)];
    
    
    [self.cellTextLabel setFrame:CGRectMake(self.contentView.frame.origin.x + 16, self.cellTextLabel.frame.origin.y, self.cellTextLabel.frame.size.width, self.cellTextLabel.frame.size.height)];
    
    self.valueLabel.frame = CGRectMake(self.cellTextLabel.bounds.size.width + self.cellTextLabel.frame.origin.x + 10, self.contentView.frame.size.height / 2 - (valueLabelSize.height +  2) / 2, valueLabelSize.width + 10, valueLabelSize.height + 5);
    
    CGFloat sliderOffset = self.valueLabel.frame.origin.x + self.valueLabel.frame.size.width + 10;
    
    self.slider.frame = CGRectMake(sliderOffset, 0, self.contentView.bounds.size.width - sliderOffset - 10, self.contentView.frame.size.height);
    
}

- (void)setInputRow:(id <TSCTableInputSliderRowDataSource>)inputRow
{
    [super setInputRow:inputRow];
    
    self.slider.maximumValue = [[inputRow maximumValue] floatValue];
    self.slider.minimumValue = [[inputRow minimumValue] floatValue];
    self.slider.value = [[inputRow value] floatValue];
    self.interval = [inputRow sliderInterval];
    self.cellTextLabel.text = [inputRow rowTitle];
}

- (void)handleSliderValueChanged:(UISlider *)slider
{
    float finalValue;

    float tempValue = fabsf(fmodf(slider.value, self.interval.floatValue));
    
    //if the remainder is greater than or equal to the half of the interval then return the higher interval, otherwise, return the lower interval
    if(tempValue >= (self.interval.floatValue / 2.0)) {
        
        finalValue = slider.value - tempValue + self.interval.floatValue;
        
    } else {
        
        finalValue = slider.value - tempValue;
        
    }
    
    [self.inputRow setValue:@(finalValue)];
    
    self.displayNumber = @(finalValue);
    
    [self layoutSubviews];
}

@end
