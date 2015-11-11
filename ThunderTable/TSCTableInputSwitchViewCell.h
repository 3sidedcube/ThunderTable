//
//  TSCTableInputSwitchViewCell.h
// ThunderTable
//
//  Created by Phillip Caudell on 27/08/2013.
//  Copyright (c) 2013 madebyphill.co.uk. All rights reserved.
//

#import "TSCTableInputViewCell.h"

/**
 A cell containing a `UISwitch`
 */
@interface TSCTableInputSwitchViewCell : TSCTableInputViewCell

/**
 @abstract The switch which is shown in the cell
 */
@property (nonatomic, strong) UISwitch *primarySwitch;

/**
 The target action method of the UISwitch shown in the cell
 @param sender The switch which had it's value changed
 */
- (void)handleSwitch:(UISwitch *)sender;

@end
