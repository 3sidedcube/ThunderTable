//
//  TSCTableInputSliderViewCell.h
//  ThunderTable
//
//  Created by Sam Houghton on 11/03/2014.
//  Copyright (c) 2014 3 SIDED CUBE. All rights reserved.
//

#import "TSCTableInputViewCell.h"

/**
 A cell containing a `UISlider`
 */
@interface TSCTableInputSliderViewCell : TSCTableInputViewCell

/**
 @abstract The slider which is shown in the cell
 */
@property (nonatomic, strong) UISlider *slider;

/**
 @abstract a `UILabel` which shows the current value of the slider
 */
@property (nonatomic, strong) UILabel *valueLabel;

/**
 @abstract The interval which the slider label changes at
*/
@property (nonatomic, strong) NSNumber *interval;

/**
 @abstract The current value of the slider
*/
@property (nonatomic, strong) NSNumber *displayNumber;

/**
 @abstract The method called when the slider value changes
 @param slider The slider which's value changed
 */
- (void)handleSliderValueChanged:(UISlider *)slider;

@end
