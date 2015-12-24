//
//  TSCTableInputSwitchViewCell.m
// ThunderTable
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
    
    
    CGSize constrainedSize = CGSizeMake(self.contentView.frame.size.width - 78 - 20 - self.cellImageView.frame.size.width, MAXFLOAT);
    
    CGSize textLabelSize = [self.cellTextLabel sizeThatFits:constrainedSize];
    
    self.cellTextLabel.frame = CGRectMake(0, 0, textLabelSize.width, textLabelSize.height + 10);
    self.cellTextLabel.center = self.contentView.center;
    self.cellTextLabel.frame = CGRectMake(15 + self.cellImageView.frame.origin.x + self.cellImageView.frame.size.width, self.cellTextLabel.frame.origin.y, self.cellTextLabel.frame.size.width, self.cellTextLabel.frame.size.height);
    
    self.primarySwitch.frame = CGRectMake(self.contentView.bounds.size.width - 78 - 5, self.contentView.bounds.size.height / 2 - 28 / 2, 78, 28);
}

- (void)handleSwitch:(UISwitch *)sender
{
    if ([self.inputRow isKindOfClass:[TSCTableInputSwitchRow class]]) {
        
        TSCTableInputSwitchRow *switchRow = (TSCTableInputSwitchRow *)self.inputRow;
        
        if(![self.inputRow.value isEqualToNumber:[NSNumber numberWithBool:sender.isOn]]) {
            
            switchRow.on = self.primarySwitch.isOn;
            self.inputRow.value = [NSNumber numberWithBool:switchRow.isOn];
            
            if ([switchRow.delegate respondsToSelector:@selector(inputSwitchRow:didChangeToState:)]) {
                [switchRow.delegate inputSwitchRow:switchRow didChangeToState:switchRow.isOn];
            }
            
            #pragma clang diagnostic ignored "-Warc-performSelector-leaks"
            [switchRow.target performSelector:switchRow.selector withObject:sender];
            
            return;
            
        }
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
