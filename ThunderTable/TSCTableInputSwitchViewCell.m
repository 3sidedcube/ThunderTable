//
//  TSCTableInputSwitchViewCell.m
//  American Red Cross Disaster
//
//  Created by Phillip Caudell on 27/08/2013.
//  Copyright (c) 2013 madebyphill.co.uk. All rights reserved.
//

#import "TSCTableInputSwitchViewCell.h"
#import "TSCTableInputSwitchRow.h"  

@implementation TSCTableInputSwitchViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.primarySwitch = [[UISwitch alloc] init];
        [self.primarySwitch addTarget:self action:@selector(handleSwitch:) forControlEvents:UIControlEventValueChanged];
        [self.contentView addSubview:self.primarySwitch];
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    
    CGSize constrainedSize = CGSizeMake(self.contentView.frame.size.width - 78 - 20 - self.imageView.frame.size.width, MAXFLOAT);
    
    CGSize textLabelSize = [self.textLabel sizeThatFits:constrainedSize];
    
    self.textLabel.frame = CGRectMake(0, 0, textLabelSize.width, textLabelSize.height + 10);
    self.textLabel.center = self.contentView.center;
    self.textLabel.frame = CGRectMake(15 + self.imageView.frame.origin.x + self.imageView.frame.size.width, self.textLabel.frame.origin.y, self.textLabel.frame.size.width, self.textLabel.frame.size.height);
    
    self.primarySwitch.frame = CGRectMake(self.contentView.bounds.size.width - 78 - 5, self.contentView.bounds.size.height / 2 - 28 / 2, 78, 28);
}

- (void)handleSwitch:(UISwitch *)sender
{
    if ([self.inputRow isKindOfClass:[TSCTableInputSwitchRow class]]) {
        
        TSCTableInputSwitchRow *switchRow = (TSCTableInputSwitchRow *)self.inputRow;
        switchRow.on = self.primarySwitch.isOn;
        self.inputRow.value = [NSNumber numberWithBool:switchRow.isOn];
        
        if ([switchRow.delegate respondsToSelector:@selector(inputSwitchRow:didChangeToState:)]) {
            [switchRow.delegate inputSwitchRow:switchRow didChangeToState:switchRow.isOn];
        }
        
        [switchRow.target performSelector:switchRow.selector withObject:sender];
        
        return;
    }
    
    [self.inputRow setValue:@(sender.isOn)];
}

- (void)setInputRow:(TSCTableInputRow *)inputRow
{
    [super setInputRow:inputRow];
    self.primarySwitch.on = [inputRow.value boolValue];
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    UIView *hitView = [super hitTest:point withEvent:event];
    
    if (![self.primarySwitch pointInside:[self convertPoint:point toView:self.primarySwitch] withEvent:event]) {
        
        return nil;
    }
    
    return hitView;
}

@end
