//
//  TSCTableInputCheckViewCell.m
//  ThunderStorm
//
//  Created by Phillip Caudell on 27/09/2013.
//  Copyright (c) 2013 3 SIDED CUBE. All rights reserved.
//

#import "TSCTableInputCheckViewCell.h"
#import "TSCTableInputCheckViewCell.h"
#import "TSCTableSelection.h"
#import "TSCTableInputRow.h"
#import "TSCCheckView.h"
#import "TSCCheckableItemBase.h"
#import "TSCThemeManager.h"

@implementation TSCTableInputCheckViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.checkView = [[TSCCheckView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
        [self.checkView addTarget:self action:@selector(handleCheck:) forControlEvents:UIControlEventValueChanged];
        self.checkView.userInteractionEnabled = NO;
        [self.contentView addSubview:self.checkView];

    }
    
    return self;
}

- (void)prepareForReuse
{
    [super prepareForReuse];
    [self.checkView removeTarget:nil action:NULL forControlEvents:UIControlEventValueChanged];
    [self.checkView setOn:NO animated:NO];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if([TSCThemeManager localisedTextDirectionForBaseDirection:NSTextAlignmentLeft] == NSTextAlignmentRight){
        
        self.checkView.frame = CGRectMake(self.contentView.bounds.size.width - 40, self.contentView.bounds.size.height / 2 - 15, 30, 30);
        
    } else {
        
        self.checkView.frame = CGRectMake(10, self.contentView.bounds.size.height / 2 - 15, 30, 30);
        
    }
    
    CGRect textLabelFrame = self.textLabel.frame;
    textLabelFrame.origin.x = self.checkView.frame.size.width + 20;
    
    if ((textLabelFrame.origin.x + textLabelFrame.size.width) > self.contentView.frame.size.width) {
        textLabelFrame.size.width -= ((textLabelFrame.origin.x + textLabelFrame.size.width) - self.contentView.frame.size.width) + 10;
    }
    self.textLabel.frame = textLabelFrame;
    
    UIView *sampleFrame = [[UIView alloc] initWithFrame:CGRectMake(18, 0, 30, 30)];
    
    CGPoint textOffset = CGPointMake(sampleFrame.frame.size.width + sampleFrame.frame.origin.x, sampleFrame.frame.origin.y);
    CGSize textConstrainedSize = CGSizeMake(self.contentView.frame.size.width - textOffset.x - 10, MAXFLOAT);
    
    CGSize textLabelSize = [self.textLabel.text sizeWithFont:self.textLabel.font constrainedToSize:textConstrainedSize lineBreakMode:NSLineBreakByWordWrapping];
    
    self.textLabel.frame = CGRectMake(textOffset.x, textOffset.y + 5, textLabelSize.width, textLabelSize.height + 5);
    
    self.textLabel.textAlignment = self.detailTextLabel.textAlignment = [TSCThemeManager localisedTextDirectionForBaseDirection:NSTextAlignmentLeft];
    
    if([TSCThemeManager localisedTextDirectionForBaseDirection:NSTextAlignmentLeft] == NSTextAlignmentRight){
        
        self.textLabel.frame = CGRectMake(self.frame.size.width - textLabelSize.width - 15 - 30, textOffset.y + 5, textLabelSize.width, textLabelSize.height + 5);
        
    } else {
        
        self.textLabel.frame = CGRectMake(textOffset.x, textOffset.y + 5, textLabelSize.width, textLabelSize.height + 5);
        
    }
}

- (void)handleCheck:(TSCCheckView *)sender
{
    self.inputRow.value = [NSNumber numberWithBool:sender.isOn];
}

- (void)handleCheckFromTableSelection:(TSCTableSelection *)selection
{
    TSCTableInputCheckViewCell *checkableItemView = ((TSCCheckableItemBase *)selection.object).cell;
    [checkableItemView handleCheck:checkableItemView.checkView];
    [checkableItemView.checkView setOn:!checkableItemView.checkView.isOn animated:YES saveState:YES];
}

@end